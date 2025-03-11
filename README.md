# Rétro Buy - Site e-commerce de rétro-gaming

## Description du Projet
Ce projet est un site e-commerce permettant d'acheter des consoles, jeux et goodies sur le thème du rétro-gaming. Il a été réalisé dans le cadre d'un projet en PHP et intègre une gestion des utilisateurs, un panier d'achat, et un système de commandes interactif.

## Objectifs
- **Gérer une administration** avec plusieurs profils d'utilisateurs.
- **Interagir avec une base de données** (gestion des comptes, articles, commandes).
- **Assurer la fonctionnalité du site** avec des traitements PHP et des calculs dynamiques.
- **Respecter les bonnes pratiques** en programmation.
- **Offrir une interface intuitive** avec un design soigné.

## Structure du Projet

- projet : Contient les fichiers principaux
   - compte.php
   - confirmation_commande.php
   - consoles.php
   - deconnexion.php
   - description.php
   - goodies.php
   - index.php
   - infos_compte.php
   - inscription.php
   - jeux.php
   - panier.php
   - compte.css
   - console.css
   - description1.css
   - goodies.css
   - index.css
   - infos_compte1.css
   - inscri.css
   - jeux.css
   - panier.css
- site_web.sql : Base de données
- README.md    : Documentation principale
    - images   : Contient les images du site
        - consoles
            - atari 2600.jpg
            - dreamcast.jpg
            - game boy.jpg
            - mega drive.png
            - nes.png
            - nintendo 64.jpg
            - ps1.png
            - super-nintendo.jpg
        - goodies
            - lampe.jpg
            - mug.jpg
            - pikachu.jpg
            - porte-cle.jpg
            - sous-verre.jpg
            - stylo.jpg
            - sweat.jpg
            - t shirt.jpg
        - jeux
            -  Animal_Crossing.png
            - crash-bandicoot-3.jpg
            - resident-evil.jpg
            - sonic-hedgehog.jpg
            - street-fighter-II.jpg
            - super-mario-64.jpg
            - super-mario-bros-duck-hunt.jpg
            - tomb-raider.jpg
        - promotions
            - GameCube.png
            - borne-arcade.jpg
            - casquette.jpg
            - gamecube.jpg
            - mug-play.jpg
            - premiere ds.jpg
            - pull mario.jpg
            - tapis-souri.jpg
            - xbox1.jpg
    - flèche.png
    - logo.png
    - maison.png


## Instructions d'Installation
1. **Télécharger le projet**
   ```bash
   git clone https://github.com/emmasvd2/Projet_Site_Web_PHP.git
   cd Projet_Site_Web_PHP
   ```
   
2. **Déployer le projet**

- Dézipper les fichiers dans le dossier www de WAMP ou www de Laragon.
- Importer la base de données site_web.sql dans PHPMyAdmin.
- Modifier config.php pour adapter les identifiants de connexion à la base de données.

3. **Lancer le serveur local**

- Démarrer Apache et MySQL avec WAMP/Laragon.
- Accéder au site via http://localhost/projet/
