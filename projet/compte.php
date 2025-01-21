<?php
//Démarrer une session
session_start();

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Récupérer les données du formulaire
    $mail = $_POST["mail"];
    $motDePasse = $_POST["mot_de_passe"];

    // Connexion à la base de données (à remplacer par vos informations de connexion)
    $serveur = "localhost";
    $nomUtilisateur = "root";
    $motDePasseBDD = "";
    $nomBaseDeDonnees = "site_web";

    $connexion = new mysqli($serveur, $nomUtilisateur, $motDePasseBDD, $nomBaseDeDonnees);

    // Vérifier la connexion à la base de données
    if ($connexion->connect_error) {
        die("Échec de la connexion à la base de données : " . $connexion->connect_error);
    }

    // Préparer et exécuter la requête
    $requete = $connexion->prepare("SELECT id_utilisateur, mot_de_passe FROM utilisateur WHERE mail = ?");
    $requete->bind_param("s", $mail);
    $requete->execute();
    $resultat = $requete->get_result();

    // Vérifier si l'utilisateur existe
    if ($resultat->num_rows > 0) {
        // Récupérer l'identifiant de l'utilisateur depuis la base de données
        $ligne = $resultat->fetch_assoc();
        $idUtilisateur = $ligne["id_utilisateur"];
        // À insérer après avoir récupéré l'id_utilisateur et avant de rediriger
        $_SESSION["id_utilisateur"] = $idUtilisateur;
        // Requête pour obtenir le statut de l'utilisateur
        $requeteStatut = $connexion->prepare("SELECT statut FROM utilisateur WHERE id_utilisateur = ?");
        $requeteStatut->bind_param("i", $idUtilisateur);
        $requeteStatut->execute();
        $resultatStatut = $requeteStatut->get_result();

        if ($resultatStatut->num_rows > 0) {
            $ligneStatut = $resultatStatut->fetch_assoc();
            $statut = $ligneStatut["statut"];
            
            // Stockez le statut dans la session
            $_SESSION["statut"] = $statut;
        } else {
            // Gérer le cas où le statut n'est pas trouvé
            die("Statut non trouvé.");
        }

        // Récupérer le mot de passe de la base de données
        $motDePasseDansLaBase = $ligne["mot_de_passe"];

        // Vérifier si le mot de passe est correct
        if (password_verify($motDePasse, $motDePasseDansLaBase)) {
            // Enregistrez l'identifiant de l'utilisateur dans la session
            $_SESSION["utilisateur_connecte"] = true;

            // Redirigez l'utilisateur vers la page d'affichage des informations du compte
            header("Location: infos_compte.php");
            exit();
        } else {
            // Le mot de passe est incorrect
            $messageErreur = "Identifiants incorrects. Veuillez réessayer.";
        }
    } else {
        // L'utilisateur n'existe pas
        $messageErreur = "Identifiants incorrects. Veuillez réessayer.";
    }

    // Fermer la connexion à la base de données
    $connexion->close();
}
?>



<!DOCTYPE html>
<html lang="fr">
    <head>
        <!-- Création de l'entête du site -->
        <link rel="stylesheet" href="compte.css">
        <title>Retro Buy</title>
        <link rel="icon" type="image/png" href="images/logo.png" />
        <meta charset="utf-8">
    </head>
    <body>
        <div class="container">
            <h1>Se connecter</h1>
            <form action="compte.php" method="post">
                <div>
                    <label for="mail">Adresse mail</label>
                    <input type="email" id="mail" name="mail" placeholder="tata@gmail.com" required>
                </div>

                <div>
                    <label for="mot_de_passe">Mot de passe</label>
                    <input type="password" id="mot_de_passe" name="mot_de_passe" placeholder="Entrez votre mot de passe" required>
                </div>

                <?php
                // Affichez le message d'erreur s'il existe
                if (isset($messageErreur)) {
                    echo '<div class="erreur">' . $messageErreur . '</div>';
                }
                ?>

                <button type="submit">Connexion</button>
            </form>
        </div>
    </body>
</html>

