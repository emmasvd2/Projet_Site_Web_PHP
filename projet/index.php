<?php
//Démarrer une session
session_start();

// Fonction pour ajouter un article au panier
function ajouterAuPanier($articleId) {
    // Vérifiez si l'utilisateur est connecté
    if (!isset($_SESSION["utilisateur_connecte"]) || $_SESSION["utilisateur_connecte"] !== true) {
        // Redirigez vers la page de connexion si l'utilisateur n'est pas connecté
        header("Location: connexion.php");
        exit();
    }

    // Récupérez l'identifiant de l'utilisateur depuis la session
    $idUtilisateur = $_SESSION["id_utilisateur"];

    // Récupérez le panier actuel de l'utilisateur depuis la base de données
    $connexion = new mysqli("localhost", "root", "", "site_web");

    // Vérification de la connexion à la base de données
    if ($connexion->connect_error) {
        // En cas d'échec, affiche un message d'erreur et arrête l'exécution du script
        die("La connexion à la base de données a échoué : " . $connexion->connect_error);
    }

    // Préparation de la requête SQL pour récupérer le panier de l'utilisateur en fonction de son ID
    $requete = $connexion->prepare("SELECT panier FROM utilisateur WHERE id_utilisateur = ?");
    $requete->bind_param("i", $idUtilisateur); // Liaison des paramètres, "i" indique que c'est un entier
    $requete->execute(); // Exécution de la requête préparée
    $resultat = $requete->get_result(); // Récupération du résultat de la requête

    // Vérification s'il y a des lignes résultantes de la requête
    if ($resultat->num_rows > 0) {
         // Récupération de la première ligne du résultat
        $ligne = $resultat->fetch_assoc();
        // Extraction de la valeur du panier de l'array associatif
        $panierActuel = $ligne["panier"];

        // Ajoutez l'article au panier
        $panierNouveau = $panierActuel . "," . $articleId;

        // Mettez à jour le panier dans la base de données
        $requete = $connexion->prepare("UPDATE utilisateur SET panier = ? WHERE id_utilisateur = ?");
        $requete->bind_param("si", $panierNouveau, $idUtilisateur);
        $requete->execute();

        // Fermez la connexion à la base de données
        $requete->close();
        $connexion->close();
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <!--Création de l'entête du site-->
        <link rel="stylesheet" href="index.css">
        <title>Retro Buy</title>
        <link rel="icon" type="image/png" href="images/logo.png" />
        <meta charset="utf-8">
    </head>
    <body background="">
    <div class="logo-container">
        <img class="logo" src="images/logo.png" alt="logo site" width="115px" height="115px"/>
    </div>
        <header>
            <h1 class="titre">Site d'achats Rétro Gaming</h1>
            <p class="intro">
            <br>  
            <br>
            Bienvenue sur Rétro Buy - L'Oasis du Rétro Gaming!

Explorez un monde où chaque pixel raconte une histoire, où chaque console est une passerelle vers l'enfance, et chaque clic sur Rétro Buy ouvre la porte à la nostalgie.

Notre Collection Soigneusement Sélectionnée : Des jeux restaurés, des consoles légendaires, et des goodies rétro uniques - découvrez des trésors qui captivent les cœurs depuis des décennies.

Livraison Rapide, Satisfaction Assurée : Votre passion, notre priorité. Avec Rétro Buy, plongez dans l'aventure sans attendre. Livraison rapide, sourires assurés.

Communauté Rétro Unie : Rejoignez une communauté vibrante de passionnés. Partagez vos souvenirs, découvrez des pépites, et créez ensemble une expérience de jeu inoubliable.

Explorez, Achetez - Rétro Buy, Votre Destination Rétro Gaming Incontournable! 🚀🎮 
</p>
<br>
<br>
        </header>
        <nav>
            <!--Création du menu de la page d'accueil-->
            <ul>
                <li>
                    <a href="jeux.php">Jeux vidéos</a>
                </li>
                <li>
                    <a href="consoles.php">Consoles</a>
                </li>
                <li>
                    <a href="goodies.php">Goodies</a>
                </li>
                <li>
                    <a href="inscription.php">Mon compte</a>
                </li>
                <li>
                    <a href="panier.php">Panier</a>
                </li>
            </ul>
        </nav>
        <div class="conteneur">
            <div class="ligne">
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=1">
                        <img src="images/promotions/borne-arcade.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=2">
                        <img src="images/promotions/gamecube.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=3">
                        <img src="images/promotions/premiere ds.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                    <div class="photo">
                    <!--Affichage de la description de l'article avec un id égal à 4-->
                    <a href="description.php?id=4">
                        <img src="images/promotions/xbox1.jpg" width="170px" height="190px"/>
                    </div>
                </div>
            </div>
            <div class="ligne">
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=5">
                        <img src="images/promotions/mug-play.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                <a href="description.php?id=6">
                    <div class="photo">
                        <img src="images/promotions/pull mario.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=7">
                        <img src="images/promotions/tapis-souri.jpg" width="170px" height="190px"/>
                    </div>
                </div>
                <div class="image-container">
                    <div class="photo">
                    <a href="description.php?id=8">
                        <img src="images/promotions/casquette.jpg" width="170px" height="190px"/>
                    </div>
                </div>
            </div>
    </body>
</html>

