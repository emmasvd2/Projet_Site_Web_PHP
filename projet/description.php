<?php
//Démarrer une session
session_start();

// Connexion à la base de données (à remplacer par vos informations de connexion)
try {
    $bdd = new PDO(
        'mysql:host=localhost;dbname=site_web;charset=utf8',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Récupérez l'ID de l'article depuis l'URL
    $article_id = isset($_GET['id']) ? $_GET['id'] : null;

    // Vérifiez si l'ID de l'article est défini
    if (!isset($article_id)) {
        die("ID d'article non fourni.");
    }

    // Requête SQL pour récupérer les informations de l'article
    $rq = $bdd->prepare('SELECT titre, description, prix FROM article WHERE id_article = :id');
    $rq->bindParam(':id', $article_id, PDO::PARAM_INT);
    $rq->execute();

    // Récupérer les résultats dans un tableau associatif
    $article = $rq->fetch(PDO::FETCH_ASSOC);

    // Vérifier si l'article a été trouvé
    if (!$article) {
        die("Article non trouvé.");
    }

    // Traitement pour ajouter l'article au panier
    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['ajouter_panier'])) {
        // Assurez-vous que l'utilisateur est connecté
        if (!isset($_SESSION["utilisateur_connecte"]) || $_SESSION["utilisateur_connecte"] !== true) {
            // Redirigez vers la page de connexion si l'utilisateur n'est pas connecté
            header("Location: inscription.php");
            exit();
        }

        // Récupérez l'ID de l'utilisateur depuis la session
        $idUtilisateur = $_SESSION["id_utilisateur"];

        // Récupérez la quantité d'articles et le prix de chaque article à partir de votre base de données
        $quantite = 1; // Par exemple, ajouter une unité
        $prixUnitaire = $article['prix']; // Utilisez le vrai prix de l'article

        // Calculez le total
        $total = $quantite * $prixUnitaire;

        // Créez une nouvelle commande pour l'utilisateur
        $statutCommande = 'En cours'; // Vous pouvez définir le statut initial de la commande
        $requeteCommande = $bdd->prepare("INSERT INTO commande (id_utilisateur, date_commande, statut) VALUES (?, CURDATE(), ?)");
        $requeteCommande->bindParam(1, $idUtilisateur, PDO::PARAM_INT);
        $requeteCommande->bindParam(2, $statutCommande, PDO::PARAM_STR);
        $requeteCommande->execute();

        // Récupérez l'ID de la nouvelle commande
        $idCommande = $bdd->lastInsertId();

        // Ajoutez l'article au panier en utilisant l'ID de la nouvelle commande
        $requetePanier = $bdd->prepare("INSERT INTO panier (id_commande, id_article, prix, quantite) VALUES (?, ?, ?, ?)");
        $requetePanier->bindParam(1, $idCommande, PDO::PARAM_INT);
        $requetePanier->bindParam(2, $article_id, PDO::PARAM_INT);
        $requetePanier->bindParam(3, $total, PDO::PARAM_INT);
        $requetePanier->bindParam(4, $quantite, PDO::PARAM_INT);
        $requetePanier->execute();
    }

    // Traitement pour la modification de l'article
    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['valider_modification'])) {
        // Récupérer les données du formulaire de modification
        $nouveauTitre = $_POST["nouveau_titre"];
        $nouvelleDescription = $_POST["nouvelle_description"];
        $nouveauPrix = $_POST["nouveau_prix"];

        // Mettre à jour les données dans la base de données
        $requeteUpdate = $bdd->prepare("UPDATE article SET titre = ?, description = ?, prix = ? WHERE id_article = ?");
        $requeteUpdate->bindParam(1, $nouveauTitre, PDO::PARAM_STR);
        $requeteUpdate->bindParam(2, $nouvelleDescription, PDO::PARAM_STR);
        $requeteUpdate->bindParam(3, $nouveauPrix, PDO::PARAM_INT);
        $requeteUpdate->bindParam(4, $article_id, PDO::PARAM_INT);
        $requeteUpdate->execute();

        // Rafraîchir les informations de l'article après la modification
        $rq = $bdd->prepare('SELECT titre, description, prix FROM article WHERE id_article = :id');
        $rq->bindParam(':id', $article_id, PDO::PARAM_INT);
        $rq->execute();
        $article = $rq->fetch(PDO::FETCH_ASSOC);
    }

} catch (PDOException $e) {
    die("Erreur de connexion à la base de données: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="description1.css">
    <title>Description du Produit</title>
    <link rel="icon" type="image/png" href="images/logo.png" />
    <meta charset="utf-8">
    <a href="index.php"> 
            <p class="photo">
                <img src="images/flèche.png" width=60px
                height=60px/>
            </p>
    </a>
    <title><?php echo $article['titre']; ?></title>
</head>
<body>
    <!-- Affiche le titre, la description et le prix de l'article contenus dans la bdd en fonction de l'id de l'article-->
    <h1><?php echo $article['titre']; ?></h1>
    <p><?php echo $article['description']; ?></p>
    <p>Prix : <?php echo $article['prix']; ?> euros</p>

    <!-- Formulaire pour ajouter au panier -->
    <form action="" method="post">
        <input class="ajouter-panier" type="submit" name="ajouter_panier" value="Ajouter au panier">
    </form>
    <br>
    <!-- Formulaire de modification -->
    <?php
    // Vérifiez si le formulaire de modification a été soumis
    if (isset($_POST['modifier'])) {
        // Affichez le formulaire de modification si l'utilisateur est un administrateur
        if (isset($_SESSION["utilisateur_connecte"]) && $_SESSION["utilisateur_connecte"] === true && (isset($_SESSION["statut"]) && $_SESSION["statut"] == 1)) {
            echo '<form action="" method="post">
                    <label for="nouveau_titre">Nouveau Titre :</label>
                    <input type="text" name="nouveau_titre" value="' . $article['titre'] . '" required>
                    <label for="nouvelle_description">Nouvelle Description :</label>
                    <textarea name="nouvelle_description" required>' . $article['description'] . '</textarea>
                    <label for="nouveau_prix">Nouveau Prix :</label>
                    <input type="number" name="nouveau_prix" value="' . $article['prix'] . '" required>
                    <input type="submit" name="valider_modification" value="Valider">
                  </form>';
        }
    } else {
        // Afficher le bouton "Modifier" si l'utilisateur est un administrateur
        if (isset($_SESSION["utilisateur_connecte"]) && $_SESSION["utilisateur_connecte"] === true && (isset($_SESSION["statut"]) && $_SESSION["statut"] == 1)) {
            echo '<form action="" method="post">
                    <input type="submit" name="modifier" value="Modifier">
                  </form>';
        }
    }
    ?>
 <style>
        /* Style du bouton Modifier */
        input[name="modifier"] {
            background-color: #7c5b55;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        /* Au survol du bouton Modifier */
        input[name="modifier"]:hover {
            background-color: #008B8B;
        }
    </style>
</body>
</html>





