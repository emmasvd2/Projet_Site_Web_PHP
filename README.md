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
/ |-- projet/ # Contient les fichiers principaux 
| |-- index.php # Page d'accueil 
| |-- compte.php # Gestion du compte utilisateur | |-- inscription.php # Page d'inscription | |-- panier.php # Gestion du panier | |-- description.php # Détails des articles | |-- admin/ # Pages d'administration | |-- assets/ # Contient les styles CSS et JS | |-- images/ # Contient les images du site |-- database/ # Contient les fichiers SQL | |-- site_web.sql # Base de données |-- docs/ # Documentation du projet | |-- rapport.pdf # Rapport du projet |-- README.md # Documentation principale |-- config.php # Fichier de configuration de la BDD


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
