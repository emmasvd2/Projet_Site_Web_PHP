<?php
// Démarre la session
session_start();

// Vérifie si l'utilisateur est déjà connecté
if (isset($_SESSION["utilisateur_connecte"]) && $_SESSION["utilisateur_connecte"] === true) {
    // Redirige vers la page d'affichage des informations du compte
    header("Location: infos_compte.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <!--Création de l'entête du site-->
        <link rel="stylesheet" href="inscri.css">
        <title>Retro Buy</title>
        <link rel="icon" type="image/png" href="images/logo.png"/>
        <meta charset="utf-8">
        <a href="index.php"> 
            <p class="image">
                <img src="images/maison.png" width=60px
                height=60px/>
            </p>
        </a>
    </head>
    <body>
    <div class="container">
        <h1>Créer un compte</h1>
        <div>
            <form method="POST">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" placeholder="Dupont" required>

                <label for="prenom">Prénom</label>
                <input type="text" id="prenom" name="prenom" placeholder="Jean" required>

                <label for="email">Adresse mail</label>
                <input type="email" id="mail" name="mail" placeholder="jean.dupont@gmail.com" required>
            
                <label for="date">Date de naissance</label>
                <input type="date" id="date_naissance" name="date_naissance"  required>
            
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>
           
                <button type="submit">S'inscrire</button>
        
                <p>Vous avez déjà un compte ?</p>
                    <a href="compte.php">Cliquer ici</a> <br><br>
                <a href="index.php" class="lien-accueil"> Retour à l'accueil </a>
            </div>
        </form>
    </div>
    </body>
</html>

<?php 
try {
    // Je tente de me connecter à la base de données
    $bdd = new PDO(
        'mysql:host=localhost;dbname=site_web;charset=utf8',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
}catch(Exception $e){
    // Affiche une erreur si la connexion échoue
    die('Erreur : '.$e->getMessage());
}

// Enregistrement de l'utilisateur dans la base de données
if(isset($_POST['password'])){
    // Hashage du mot de passe avant de l'enregistrer
    $hashePasseword=password_hash($_POST['password'], PASSWORD_DEFAULT);
    $rq=$bdd->prepare('INSERT INTO utilisateur (nom, prenom, mail, date_naissance, mot_de_passe) VALUES 
                                                                    (:nom, :prenom, :mail, :date_naissance, :mot_de_passe)');
    $rq->execute([
        "nom"=>$_POST["nom"],
        "prenom"=>$_POST["prenom"],
        "mail"=>$_POST["mail"],
        "date_naissance"=>$_POST["date_naissance"],
        "mot_de_passe"=>$hashePasseword,
    ]);
    // Redirige vers la page d'accueil après l'inscription
    header("Location: index.php");die;
}
?>
