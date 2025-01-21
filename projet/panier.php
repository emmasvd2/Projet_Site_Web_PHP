<?php
// Démarrer une session
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION["utilisateur_connecte"]) || $_SESSION["utilisateur_connecte"] !== true) {
    // Rediriger vers la page d'inscription si l'utilisateur n'est pas connecté
    header("Location: inscription.php");
    exit();
}

// Connexion à la base de données
//A remplacer par vos données
try {
    $bdd = new PDO(
        'mysql:host=localhost;dbname=site_web;charset=utf8',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données: " . $e->getMessage());
}

// Vérifier si le formulaire de validation de la commande a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Requête SQL pour vider les tables panier et commande
    $requeteViderPanier = $bdd->prepare("DELETE FROM panier WHERE id_commande IN (SELECT id_commande FROM commande WHERE id_utilisateur = :idUtilisateur)");
    $requeteViderPanier->bindParam(":idUtilisateur", $_SESSION['id_utilisateur'], PDO::PARAM_INT);
    $requeteViderPanier->execute();

    $requeteViderCommande = $bdd->prepare("DELETE FROM commande WHERE id_utilisateur = :idUtilisateur");
    $requeteViderCommande->bindParam(":idUtilisateur", $_SESSION['id_utilisateur'], PDO::PARAM_INT);
    $requeteViderCommande->execute();

    // Rediriger l'utilisateur vers une page de confirmation
    header("Location: confirmation_commande.php");
    exit();
}

// Requête SQL pour récupérer les informations du panier
$requetePanier = $bdd->prepare("
    SELECT panier.quantite, panier.prix, commande.date_commande, article.titre
    FROM panier
    INNER JOIN commande ON panier.id_commande = commande.id_commande
    INNER JOIN article ON panier.id_article = article.id_article
    WHERE commande.id_utilisateur = :idUtilisateur
");
$requetePanier->bindParam(":idUtilisateur", $_SESSION['id_utilisateur'], PDO::PARAM_INT);
$requetePanier->execute();

// Récupérer les résultats dans un tableau associatif
$panier = $requetePanier->fetchAll(PDO::FETCH_ASSOC);

// Calculer le prix total
$prixTotal = 0;
foreach ($panier as $article) {
    $prixTotal += $article['prix'] * $article['quantite'];
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <!-- Début de l'entête du site -->
    <link rel="stylesheet" href="panier.css">
    <title>Retro Buy</title>
    <link rel="icon" type="image/png" href="images/logo.png" />
    <meta charset="utf-8">
    <a href="index.php"> 
            <p class="photo">
                <img src="images/flèche.png" width=60px
                height=60px/>
            </p>
        </a>
</head>
<body>
    <header>
        <h1>Panier</h1>
        <!-- Afficher le contenu du panier -->
        <?php if (count($panier) > 0): ?>
            <p>Nombre d'articles : <?php echo count($panier); ?></p>
            <p>Date de la commande : <?php echo isset($panier[0]['date_commande']) ? $panier[0]['date_commande'] : 'N/A'; ?></p>
            <p>Prix total : <?php echo $prixTotal; ?> euros</p>

            <br>
            <p>Détails de la commande : </p>
            <!-- Vous pouvez utiliser une boucle pour afficher les détails de chaque article dans le panier -->
            <?php foreach ($panier as $article): ?>
                <p>Nom de l'article : <?php echo $article['titre']; ?> <br> Quantité : <?php echo $article['quantite']; ?> <br> Prix unitaire : <?php echo $article['prix']; ?> euros</p>
            <?php endforeach; ?>

            <!-- Bouton de validation de commande -->
            <form action="" method="post">
                <input class="valider-commande" type="submit" value="Valider la commande">
            </form>
        <?php else: ?>
            <p>Panier vide</p>
        <?php endif; ?>
    </header>
</body>
</html>






