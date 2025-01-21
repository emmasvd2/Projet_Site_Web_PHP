<?php
//Démarrer une session
session_start();

// Vérifiez si l'utilisateur est connecté
if (!isset($_SESSION["utilisateur_connecte"]) || $_SESSION["utilisateur_connecte"] !== true) {
    // Redirigez vers la page de connexion si l'utilisateur n'est pas connecté
    header("Location: connexion.php");
    exit();
}

// Récupérez l'identifiant de l'utilisateur depuis la session
$idUtilisateur = $_SESSION["id_utilisateur"];

// Connexion à la base de données (à remplacer par vos informations de connexion)
$serveur = "localhost";
$nomUtilisateur = "root";
$motDePasseBDD = "";
$nomBaseDeDonnees = "site_web";

$connexion = new mysqli($serveur, $nomUtilisateur, $motDePasseBDD, $nomBaseDeDonnees);

// Vérifiez la connexion
if ($connexion->connect_error) {
    die("La connexion à la base de données a échoué : " . $connexion->connect_error);
}

// Requête SQL pour récupérer les informations de l'utilisateur
$reqSQL = "SELECT nom, prenom, mail, date_naissance FROM utilisateur WHERE id_utilisateur = ?";

// Préparez la requête
$requete = $connexion->prepare($reqSQL);
$requete->bind_param("i", $idUtilisateur);
$requete->execute();

// Liez les résultats de la requête à des variables
$requete->bind_result($nom, $prenom, $mail, $date_naissance);

// Récupérez les résultats
$requete->fetch();

// Fermez la requête et la connexion
$requete->close();
$connexion->close();

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="infos_compte1.css">
    <title>Informations du Compte</title>
    <meta charset="utf-8">
</head>
<body>
    <h1>Informations du Compte</h1>
    <div>
        <!--Affichage du nom, du prénom, de l'adresse mail et la date de naissance de l'utilisateur connecté à partir de son identifiant et de la table utilisateur-->
        <p>Nom : <?php echo isset($nom) ? $nom : ""; ?></p>
        <p>Prénom : <?php echo isset($prenom) ? $prenom : ""; ?></p>
        <p>Adresse e-mail : <?php echo isset($mail) ? $mail : ""; ?></p>
        <p>Date de naissance : <?php echo isset($date_naissance) ? $date_naissance : ""; ?></p>

        <!-- Bouton de deconnexion-->
        <form action="deconnexion.php" method="post">
            <button type="submit">Déconnexion</button>
        </form>
        <!-- Bouton de retour à l'accueil-->
        <form action="index.php" method="post">
            <button type="submit">Retour à l'accueil</button>
        </form>
    </div>
</body>
</html>
