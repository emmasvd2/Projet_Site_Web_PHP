-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 23 déc. 2023 à 18:32
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(20) NOT NULL,
  `titre` varchar(30) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `type` varchar(20) NOT NULL,
  `prix` int(5) NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `titre`, `description`, `type`, `prix`) VALUES
(1, 'Mini borne d`arcade Pac-Man', 'Mini console d`arcade My Arcade Pac-Man. Titre Bandai Namco™ sous licence officielle. Hauteur 17 cm. Écran vertical couleur de 2,75 pouces de diagonale. Processeur graphique 16 bits pour une meilleure résolution. Réglage de la luminosité. Design inspiré par la borne arcade Pac Man originale. Haut-parleur intégré avec contrôle du volume. Port casque 3,5 mm pour connecter vos écouteurs. Alimenté par 4 piles LR6 non incluses ou par un câble USB-C®non inclus. Parfait pour n’importe quelle salle de jeux, bureau ou vitrine !', 'console', 40),
(2, 'GameCube', 'La Nintendo GameCube est une console de jeux vidéo emblématique qui a été lancée par Nintendo en 2001. Conçue pour succéder à la Nintendo 64, la GameCube se distingue par son design compact et son format cubique, avec des dimensions de 10 cm de chaque côté. Sa forme unique et ses couleurs vives en font une console reconnaissable au premier coup d`œil.Sur le plan technique, la GameCube était en avance sur son temps. Elle était équipée d`un processeur IBM Gekko cadencé à 485 MHz, et d`un processeur graphique ATI Flipper. La console était capable de produire des graphismes 3D impressionnants pour l`époque, avec une qualité visuelle nettement supérieure à celle de ses concurrentes.', 'console', 150),
(3, 'Nintendo DS', 'La Nintendo DS, lancée en 2004, est une console de jeux vidéo révolutionnaire qui a ouvert de nouvelles perspectives dans l`industrie du jeu portable. Son nom, \"DS\", signifie \"Dual Screen\" en référence à sa caractéristique principale : l`inclusion de deux écrans, l`un tactile. La DS était équipée d`un processeur ARM9 et d`un processeur ARM7, offrant une puissance de traitement suffisante pour ses jeux. Elle disposait également de haut-parleurs stéréo, d`un microphone intégré, d`une connectivité sans fil Wi-Fi et d`un port pour cartes mémoire.', 'console', 90),
(4, 'Xbox Première Génération', 'La Xbox se démarque par son design imposant et son boîtier noir robuste. Elle est caractérisée par son \"X\" vert lumineux sur la face avant, symbole emblématique de la marque. Avec des dimensions relativement grandes pour l`époque, la Xbox était équipée de quatre ports manette en façade et d`un large bouton d`alimentation. La Xbox était une console puissante pour son temps. Elle intégrait un processeur Intel Pentium III modifié, une carte graphique Nvidia personnalisée, et un disque dur intégré, faisant d`elle la première console à proposer une telle fonctionnalité. Cette puissance a permis des jeux aux graphismes impressionnants pour l`époque.', 'console', 110),
(5, 'Mug Playstation', 'Les fans de gaming et de Playstation ne résisteront pas à cette tasse fantaisie dont la forme rectangulaire est directement inspirée par la console de jeu vidéo. La tasse est en céramique imprimée avec une anse. Elle mesure 9,5 x 8 x 7,5 cm pour une contenance de 300 mL. Ce mug Playstation fait une excellente idée cadeau. Pensez-y à Noël ou pour un anniversaire.', 'goodies', 10),
(6, 'Pull de Noël Super Mario ', 'Vous cherchez la touche parfaite pour rendre vos célébrations de fin d`année encore plus joyeuses et ludiques? Ne cherchez pas plus loin! Introducing notre tout nouveau Pull de Noël Super Mario qui apportera une dose de magie et de nostalgie à votre garde-robe festive. Fabriqué avec des matériaux de haute qualité, notre pull offre non seulement un style irrésistible, mais aussi une chaleur et un confort exceptionnels. Idéal pour les soirées fraîches d`hiver ou pour se pelotonner près du feu de cheminée.', 'goodies', 20),
(7, 'Tapis de souris Nintendo Nes', 'Vous êtes un passionné de jeux rétro et vous recherchez un moyen de combiner le style classique avec la fonctionnalité moderne? Ne cherchez pas plus loin! Notre tout nouveau Tapis de Souris Nintendo NES est la solution idéale pour les amateurs de jeux vintage.  Inspiré par le design emblématique de la Nintendo Entertainment System (NES), notre tapis de souris présente des graphismes fidèles à la console classique qui a marqué l`histoire du jeu vidéo. C`est une déclaration de style pour les amateurs de jeux rétro.', 'goodies', 13),
(8, 'Casquette Pac-Man', 'Vous êtes fan du classique des jeux d`arcade et vous voulez montrer votre amour pour le personnage emblématique Pac-Man? Ne cherchez pas plus loin. Notre toute nouvelle Casquette Pac-Man est la pièce incontournable pour tous les amateurs de jeux rétro. Inspirée du jeu vidéo légendaire, notre casquette arbore un design amusant et rétro mettant en vedette Pac-Man, les fantômes colorés et les délicieuses pastilles. C`est le moyen parfait de rappeler les heures passées à esquiver des fantômes dans le labyrinthe.', 'goodies', 15),
(9, 'Animal Crossing sur Gamecube', 'Plongez dans l`univers captivant d`Animal Crossing sur GameCube, l`un des jeux les plus charmants et immersifs de tous les temps! Notre exemplaire du jeu vous offre une expérience nostalgique inégalée, pleine d`aventures, d`amitiés et d`explorations dans le village le plus attachant qui soit. Avec son style de jeu ouvert et relaxant, Animal Crossing sur GameCube vous invite à explorer votre propre village virtuel. Cultivez votre maison, interagissez avec des animaux anthropomorphes adorables et personnalisez votre environnement pour créer un lieu vraiment unique.', 'jeux', 15),
(10, 'Crash Bandicoot', 'Plongez dans l`aventure captivante de Crash Bandicoot, l`un des jeux emblématiques qui a défini toute une génération de joueurs sur la PlayStation! Notre exemplaire du jeu vous ramène à l`époque où les sauts périlleux, les aventures exotiques, et les caisses mystérieuses étaient la norme. Traversez des niveaux palpitants remplis d`obstacles délicats, de boss redoutables et de secrets bien gardés. Avec Crash Bandicoot, attendez-vous à une expérience de plateforme qui teste vos compétences et votre résolution à chaque virage.', 'jeux', 15),
(11, 'Resident Evil', 'Plongez dans l`univers captivant de Resident Evil Gaiden, une adaptation palpitante de la série de survival horror bien aimée sur la Game Boy Color. Alors que les agents de la STARS s`engagent dans une mission périlleuse contre la redoutable Umbrella Corporation, préparez-vous à une aventure terrifiante au cœur de l`horreur portable. L`action se déroule sur un navire mystérieux, infesté de créatures mutantes et de zombies assoiffés de sang. Parcourez des couloirs sombres, des salles lugubres et des espaces confinés tout en essayant de percer les mystères qui se cachent à bord.', 'jeux', 15),
(12, 'Sonic The Hedgehog', 'Plongez dans l`univers captivant de Sonic the Hedgehog, l`un des jeux qui a défini la Mega Drive de Sega! Notre exemplaire du jeu vous propulse dans un monde où la vitesse, l`aventure et le style rétro se rencontrent dans une symphonie de couleurs et de frissons. Courez à une vitesse incroyable à travers des niveaux magnifiquement conçus, où chaque boucle, ressort et rampe vous offre une expérience visuelle et sonore exceptionnelle. Sonic the Hedgehog repousse les limites de la Mega Drive pour créer une aventure inoubliable.', 'jeux', 15),
(13, 'Street Fighter III', 'Préparez-vous à ressentir l`adrénaline du combat en rue avec Street Fighter III, un classique intemporel qui a redéfini les jeux de combat! Notre exemplaire sur la Sega Dreamcast vous transporte dans un monde où les compétences, la stratégie et l`intensité des duels règnent en maître.  Street Fighter III offre une jouabilité fluide et des combats d`une intensité palpitante. Affrontez une galerie de combattants emblématiques avec des compétences spéciales époustouflantes et des combos dévastateurs.', 'jeux', 15),
(14, 'Super Mario 64', 'Préparez-vous à plonger dans un monde de sauts, de rebonds et de mystères avec Super Mario 64, le jeu qui a révolutionné le genre de la plateforme en 3D! Notre exemplaire pour la Nintendo 64 vous transporte dans un royaume magique où chaque saut vous rapproche d`une nouvelle aventure captivante.  Super Mario 64 est le premier jeu Mario à explorer un monde en trois dimensions, offrant une liberté de mouvement et une exploration sans précédent. Traversez des peintures magiques pour accéder à des mondes distincts, chacun rempli de défis uniques.', 'jeux', 15),
(15, 'Mario Bros Duck Hunt', 'Préparez-vous à un voyage rétro avec Mario Bros & Duck Hunt, une compilation emblématique qui a charmé des générations entières de joueurs sur la NES! Notre exemplaire de ce duo légendaire vous ramène à l`époque où Mario et ses amis ont commencé à écrire l`histoire du jeu vidéo. Plongez dans les égouts de New York aux côtés de Mario et Luigi dans le classique Mario Bros. Éliminez les créatures rampantes et marquez des points en frappant les plates-formes sous les ennemis. Une aventure coopérative ou compétitive qui a posé les bases pour les jeux à venir.Mettez-vous au défi avec Duck Hunt, où vous utiliserez le célèbre pistolet NES Zapper pour chasser les canards volants. Testez votre adresse et votre rapidité de tir dans différents modes de jeu et battez vos propres records.', 'jeux', 15),
(16, 'Tom Raider sur GameBoy Advance', 'Préparez-vous à une aventure épique avec Lara Croft dans la paume de votre main, grâce à Tomb Raider sur Game Boy Advance! Notre exemplaire de ce classique vous emmène dans un monde de mystères, de ruines anciennes et de défis palpitants, le tout dans le format portable de la Game Boy Advance. Incarnez l`aventurière intrépide Lara Croft alors qu`elle se lance dans une quête périlleuse à travers des ruines mystérieuses, résolvant des énigmes complexes et affrontant des ennemis redoutables. Chaque recoin recèle des secrets à découvrir. Les capacités graphiques de la Game Boy Advance sont exploitées au maximum pour offrir des environnements détaillés, des paysages variés et des effets visuels qui immergent les joueurs dans l`univers captivant de Tomb Raider.', 'jeux', 15),
(17, 'Nintendo Nes', 'Plongez dans un monde de nostalgie et de divertissement intemporel avec la console Nintendo Entertainment System (NES)! Redécouvrez la magie des premiers jours du jeu vidéo, où chaque pixel était une aventure et chaque son une mélodie de l`émerveillement. Lancée en 1985, la NES a révolutionné le monde du jeu vidéo en introduisant des classiques emblématiques qui ont façonné l`industrie. Des légendes telles que Super Mario Bros, The Legend of Zelda et Metroid ont pris vie pour la première fois sur cette console emblématique.', 'console', 120),
(18, 'Super Nintendo', 'Voyagez dans le temps jusqu`à une époque où les pixels étaient rois et les aventures atteignaient de nouveaux sommets avec la Super Nintendo (SNES), une console qui a marqué l`âge d`or du jeu vidéo. Découvrez la magie intemporelle de cette icône qui a laissé une empreinte indélébile dans l`histoire du jeu.  Lancée en 1990, la SNES est devenue une légende du jeu vidéo, offrant une suite spectaculaire à la NES. Elle a introduit une nouvelle génération de graphismes, de sons et d`expériences de jeu. La SNES a ébloui les joueurs avec ses graphismes 16 bits, introduisant des mondes vibrants et détaillés. Des classiques tels que Super Mario World, The Legend of Zelda: A Link to the Past et Super Metroid ont capturé l`imagination des joueurs.', 'console', 100),
(19, 'Game Boy', 'Embarquez pour une aventure portable sans pareille avec la Game Boy, la console qui a introduit le jeu nomade dans la vie quotidienne! Découvrez la magie d`une console qui a redéfini le jeu vidéo et captivé des générations entières avec son design simple et son incroyable portabilité. Lancée en 1989, la Game Boy a apporté la liberté de jouer n`importe où, à tout moment. Son design compact et léger a permis aux joueurs de glisser la console dans leur poche, offrant un accès instantané à des mondes virtuels où que la vie les mène.', 'console', 150),
(20, 'SEGA Mega Drive', 'Plongez dans le monde exaltant de la Sega Mega Drive, la console qui a apporté une explosion de couleurs, de vitesse et de diversité aux jeux vidéo dans les années 90! Découvrez la magie d`une époque où les pixels étaient rois et où les classiques indémodables ont vu le jour. Lancée en 1988, la Sega Mega Drive a défini une nouvelle ère de graphismes avec sa puissance de 16 bits. Des couleurs vives, des animations fluides et des environnements détaillés ont donné vie à des mondes virtuels.', 'console', 120),
(21, 'Nintendo 64', 'Plongez dans l`ère de la 3D avec la Nintendo 64, une console qui a redéfini le paysage du jeu vidéo en introduisant des mondes vastes et immersifs. Découvrez la magie de cette console emblématique qui a capturé l`imagination des joueurs avec ses graphismes révolutionnaires et ses jeux inoubliables. Lancée en 1996, la Nintendo 64 a propulsé les jeux vidéo dans une nouvelle dimension avec ses capacités graphiques en 3D. Des classiques tels que Super Mario 64 et The Legend of Zelda: Ocarina of Time ont émerveillé les joueurs avec des mondes riches en détails et en exploration.', 'console', 150),
(22, 'Playstation 1', 'Plongez dans une époque où les polygones étaient rois et les histoires prenaient vie avec la PlayStation (PS1), la console qui a défini une génération entière de jeux vidéo. Découvrez l`héritage inoubliable de cette icône qui a ouvert la voie à l`âge d`or du jeu 3D. Lancée en 1994, la PlayStation a introduit une nouvelle ère de jeux en 3D. Des titres emblématiques tels que Final Fantasy VII, Metal Gear Solid et Resident Evil ont émerveillé les joueurs avec des mondes immersifs et des personnages mémorables.', 'console', 130),
(23, 'Atari 2600', 'Voyagez dans l`histoire du jeu vidéo avec l`Atari 2600, la pionnière qui a jeté les bases de l`industrie du jeu et a introduit le monde aux joies du jeu à domicile. Découvrez la magie simple de l`époque où chaque pixel était une aventure en soi. Lancée en 1977, l`Atari 2600 a marqué le début de l`ère des consoles de jeu à domicile, apportant une expérience de jeu directement dans le salon des familles du monde entier. L`Atari 2600 a introduit des classiques intemporels tels que Space Invaders, Breakout, et Pac-Man. Ces jeux ont établi les normes pour les générations à venir, définissant ce à quoi devrait ressembler une expérience de jeu.', 'console', 199),
(24, 'SEGA dreamcast', 'Explorez une ère de jeu vidéo avant-gardiste avec la Sega Dreamcast, une console qui a transcendé les attentes de son temps et a introduit des innovations majeures. Découvrez la magie d`une console qui a repoussé les limites de l`expérience de jeu à la fin des années 90.  Lancée en 1998, la Sega Dreamcast était la première console de jeu vidéo de sixième génération, marquant le début d`une nouvelle ère dans le monde du jeu. La Dreamcast a impressionné les joueurs avec des graphismes avancés pour l`époque, créant des mondes virtuels riches en détails et des environnements 3D immersifs.', 'console', 149),
(25, 'Mug Game Boy', 'Plongez dans une tasse pleine de nostalgie avec le Mug Game Boy, une pièce incontournable pour les amateurs de jeux vidéo rétro. Ce mug unique fusionne l`élégance pratique d`une tasse avec l`essence ludique d`une époque où les pixels et les aventures étaient rois. Inspiré du classique Game Boy de Nintendo, ce mug arbore le design emblématique de la console portable qui a captivé des générations entières. Chaque gorgée de votre boisson préférée est imprégnée de l`héritage du jeu vidéo.', 'goodies', 9),
(26, 'Sweat à capuche borne d`arcade', 'Plongez dans le confort tout en célébrant l`héritage intemporel des bornes d`arcade avec ce Sweat à Capuche Arcade. Conçu pour les amateurs de jeux rétro, ce sweat apporte une fusion parfaite entre style, confort et nostalgie ludique. Arborant un dessin détaillé d`une borne d`arcade classique, ce sweat à capuche est une œuvre d`art vestimentaire qui transporte instantanément vers les salles d`arcade animées des années 80 et 90. Les détails du dessin captivent l`essence des jeux vidéo classiques, avec des silhouettes de personnages emblématiques, des joysticks, et des boutons lumineux qui rappellent les moments où chaque quart était une nouvelle partie d`une aventure épique.', 'goodies', 30),
(27, 'Stylo Playstation', 'Transformez votre quotidien en une aventure ludique avec le Stylo PlayStation, une pièce essentielle pour tous les amateurs de jeux vidéo. Fusionnant l`utilité d`un stylo de qualité avec l`esthétique emblématique de la PlayStation, ce stylo vous permet d`écrire vos propres histoires tout en célébrant l`héritage du jeu. Inspiré par le design emblématique de la PlayStation, ce stylo arbore des éléments familiers tels que les boutons, les formes distinctives et le logo emblématique, rappelant instantanément les heures passées à jouer. Les couleurs emblématiques de la PlayStation, telles que le noir, le blanc et le bleu distinctif, ajoutent une touche de sophistication à votre expérience d`écriture quotidienne.', 'goodies', 5),
(28, 'Peluche Pokemon Pikachu', 'Apportez un éclat d`aventure et de douceur dans votre vie avec la Peluche Pikachu, une invitation chaleureuse dans l`univers enjoué de Pokémon. Douce, adorable et pleine de charme, cette peluche emblématique de Pikachu est bien plus qu`un simple jouet - c`est un compagnon qui apporte un sourire instantané. Avec ses joues roses et son sourire espiègle, la Peluche Pikachu capture l`esprit ludique de ce célèbre Pokémon électrique. Chaque câlin devient une dose d`énergie positive.  Inspirée du Pokémon emblématique de la franchise Pokémon, cette peluche est fidèle aux détails du personnage original, du bout des oreilles jaunes à la pointe de la queue en éclair.', 'goodies', 10),
(29, 'Lampe Pac-Man', 'Transformez votre espace en un coin de jeu rétro avec la Lampe Pac-Man, une création lumineuse qui apporte l`énergie positive du légendaire jeu d`arcade dans votre quotidien. Cette lampe unique est bien plus qu`une source de lumière - c`est une invitation à l`amusement et à la nostalgie ludique. Inspirée du classique jeu d`arcade Pac-Man, cette lampe présente les fantômes emblématiques (Blinky, Pinky, Inky et Clyde) et Pac-Man lui-même. Ils ajoutent une touche de joie et d`aventure à chaque pièce.  Les personnages de Pac-Man sont baignés d`une lumière LED douce et apaisante, créant une ambiance chaleureuse et accueillante. Parfait pour égayer vos soirées ou pour une lumière tamisée dans la chambre.', 'goodies', 15),
(30, 'Porte-clé GameBoy', 'Ajoutez une touche de nostalgie ludique à votre quotidien avec le Porte-Clés Game Boy, un accessoire compact qui capture l`essence même de l`ère dorée du jeu vidéo. Bien plus qu`un simple porte-clés, il est le compagnon idéal pour tous les amateurs de jeux rétro.  Inspiré du design classique de la Game Boy de Nintendo, ce porte-clés arbore les détails emblématiques de la console qui a captivé des générations de joueurs. Chaque regard évoque des souvenirs de jeux épiques. Les couleurs emblématiques de la Game Boy, notamment le gris classique et les boutons multicolores, ajoutent une touche de rétro à votre trousseau de clés.', 'goodies', 8),
(31, 'Dessous de verre Switch', 'Transformez votre espace de détente en un lieu de célébration du jeu vidéo avec le Dessous de Verre Nintendo Switch. Alliant praticité et esthétique, cet accessoire fonctionnel est bien plus qu`un simple dessous de verre - c`est une déclaration de style pour tous les passionnés de la console Nintendo Switch. Reprenant le design emblématique de la Nintendo Switch, ce dessous de verre présente les détails distinctifs de la console, des manettes détachables aux boutons caractéristiques. Un hommage parfait à l`innovation du jeu portable. Les couleurs vives et joyeuses évoquent instantanément l`univers ludique de Nintendo. Chaque dessous de verre est une invitation à des moments de jeu partagés et de convivialité.', 'goodies', 5),
(32, 'T-shirt Super Mario Bros 2', 'Revivez les jours de gloire de Super Mario Bros. 2 avec ce T-shirt qui capture l\'esprit joyeux et l\'aventure palpitante du célèbre plombier moustachu. Ce vêtement emblématique est bien plus qu\'un simple t-shirt, c\'est une déclaration de style pour tous les fans de jeux rétro. Le T-shirt Super Mario Bros. 2 arbore un design rétro qui rend hommage au classique de Nintendo. Les visuels distincts des personnages, des ennemis et des éléments du jeu ajoutent une touche nostalgique à chaque regard. Les couleurs vives et joyeuses évoquent instantanément l\'univers fantastique de Mario. Portez l\'arc-en-ciel de Mushroom Kingdom avec style et panache.', 'goodies', 20);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `date_commande` date DEFAULT NULL,
  `statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_utilisateur`, `date_commande`, `statut`) VALUES
(37, 7, '2023-12-23', 'En cours'),
(38, 7, '2023-12-23', 'En cours');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_panier`),
  KEY `id_commande` (`id_commande`),
  KEY `id_article` (`id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `id_commande`, `id_article`, `prix`, `quantite`) VALUES
(32, 37, 2, '150.00', 1),
(33, 38, 31, '5.00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `mail` varchar(25) NOT NULL,
  `date_naissance` date NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `statut` int(5) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `mail`, `date_naissance`, `mot_de_passe`, `statut`) VALUES
(4, 'Kent', 'Clark', 'clark.kent@gmail.com', '2023-11-01', '$2y$10$EdAJZuQlh7ruJG3XZR6Mf.ABIu/0DoBLy6axZEhzlduj0YbLzBD4W', 0),
(7, 'Stievenard', 'Emma', 'emma.stievenard@gmail.com', '2004-12-01', '$2y$10$V8Khh.KRVCo/VDI6H9jCkOXJt4w.ehURda3xdiIIkKq74rrgb.Ffq', 1),
(8, 'Dupont', 'Jean', 'jean.dupont@gmail.com', '2023-12-03', '$2y$10$ziZXFrZeO4RKs2MvCnU3BO3azyc6cTltyF2YDHYvsgXuzTUICAUAG', 0),
(9, 'Dubois', 'Francis', 'francis.dubois@gmail.com', '1977-02-23', '$2y$10$qlrw4Zqm.0lid8F3YGYntej4pE5xIPsoEHa9AC.0KeBkH1MJD8WN2', 0),
(10, 'Dufour', 'Jules', 'jules.dufour@gmail.com', '1993-09-30', '$2y$10$qlFqVS1.gyk.REJ2bGLGae0q8UW5eOWkfuqcQ8nfF0/2QfXVUOFPO', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `fk_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `fk_utilisateur_panier` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
