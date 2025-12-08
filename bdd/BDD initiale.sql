-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 déc. 2025 à 14:23
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_auteur`
--

DROP TABLE IF EXISTS `g_auteur`;
CREATE TABLE IF NOT EXISTS `g_auteur` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_biographie` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_auteur`
--

INSERT INTO `g_auteur` (`a_id`, `a_nom`, `a_prenom`, `a_biographie`) VALUES
(1, 'Appanah', 'Nathacha', 'Écrivaine mauricienne née en 1973, installée en France depuis 1998. Journaliste puis romancière, autrice de nombreux romans souvent liés à la mémoire, à l’exil et aux tensions coloniales.'),
(2, 'Carrere', 'Emmanuel', 'Écrivain, scénariste et réalisateur né à Paris en 1957. Auteur majeur de la littérature française contemporaine, connu pour ses récits mêlant autobiographie, enquête et fiction.'),
(3, 'Diop', 'David', 'Écrivain et universitaire franco-sénégalais, né en 1966. Prix Goncourt des lycéens 2018, spécialiste du XVIIIe siècle et auteur de romans marquants.'),
(4, 'Lahens', 'Yanick', 'Romancière et essayiste haïtienne née en 1953 à Port-au-Prince. Lauréate du prix Femina 2014, figure majeure de la littérature haïtienne contemporaine.'),
(5, 'Lamarche', 'Caroline', 'Écrivaine belge née en 1955 à Liège. Autrice de romans, nouvelles, poésie et pièces radiophoniques. Lauréate du prix Rossel.'),
(6, 'Mauvignier', 'Laurent', 'Romancier français né en 1967. Auteur publié aux éditions de Minuit, connu pour son style hypnotique et ses récits sur la violence, le trauma et la mémoire.'),
(7, 'Deneufgermain', 'David', 'Écrivain français né en 1978. Auteur de récits courts et de romans introspectifs, il explore les liens familiaux, la solitude contemporaine et les paysages du Nord de la France.'),
(8, 'Dunant', 'Ghislaine', 'Romancière et essayiste française née en 1958. Spécialiste de la figure de Charlotte Delbo, elle consacre l’essentiel de son œuvre à la mémoire, à la transmission et aux récits de vie.'),
(9, 'Gasnier', 'Paul', 'Écrivain français né en 1984. Journaliste culturel et auteur de plusieurs romans sensibles et engagés, il s’intéresse aux frontières sociales, à la jeunesse et aux identités en mouvement.'),
(10, 'Laurain', 'Hélène', 'Autrice française née en 1992. Figure émergente de la nouvelle littérature contemporaine, elle écrit des textes puissants sur la filiation, la transformation du corps et les violences intimes.'),
(11, 'Majdalani', 'Charif', 'Écrivain libanais né en 1960 à Beyrouth. Romancier majeur de la scène littéraire arabe francophone, il mêle mémoire de la guerre civile, humour subtil et fresques familiales.'),
(12, 'de Montesquiou', 'Alfred', 'Journaliste et écrivain français né en 1976. Grand reporter, il a couvert de nombreux conflits internationaux avant de se consacrer au roman, souvent inspiré de ses expériences de terrain.'),
(13, 'Poix', 'Guillaume', 'Écrivain et dramaturge français né en 1986. Son œuvre interroge les rapports de domination, les identités queer et les espaces intimes à travers romans, théâtre et performances.'),
(14, 'Pourchet', 'Maria', 'Romancière française née en 1980. Elle explore dans ses livres les passions contemporaines, les trajectoires féminines et les dérèglements sociaux à travers une écriture vive et incisive.'),
(15, 'Thomas', 'David', 'Écrivain français né en 1971. Auteur de recueils de nouvelles et de romans courts, il se distingue par une écriture minimaliste et tendre, centrée sur les petites tragédies ordinaires.');

-- --------------------------------------------------------

--
-- Structure de la table `g_editeur`
--

DROP TABLE IF EXISTS `g_editeur`;
CREATE TABLE IF NOT EXISTS `g_editeur` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_editeur`
--

INSERT INTO `g_editeur` (`e_id`, `nom`) VALUES
(1, 'Gallimard'),
(2, 'P.O.L'),
(3, 'Marchialy'),
(4, 'Juliard'),
(5, 'Albin Micher'),
(6, 'Sabin Wespieser'),
(7, 'Seuil'),
(8, 'Verdier'),
(9, 'Stock'),
(10, 'Minuit'),
(11, 'Verticales'),
(12, 'Robert Laffont'),
(13, 'L\'Olivier');

-- --------------------------------------------------------

--
-- Structure de la table `g_jury`
--

DROP TABLE IF EXISTS `g_jury`;
CREATE TABLE IF NOT EXISTS `g_jury` (
  `j_id` int NOT NULL AUTO_INCREMENT,
  `j_identifiant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `j_mot_de_passe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `j_est_president` tinyint(1) NOT NULL,
  `j_nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_jury`
--

INSERT INTO `g_jury` (`j_id`, `j_identifiant`, `j_mot_de_passe`, `j_est_president`, `j_nom`, `j_prenom`) VALUES
(1, NULL, NULL, 0, 'Decoin', 'Didier'),
(2, NULL, NULL, 0, 'CHANDERNAGOR', 'FRANÇOISE '),
(3, NULL, NULL, 0, 'BEN JELLOUN', 'TAHAR '),
(4, NULL, NULL, 0, 'CONSTANT', 'PAULE '),
(5, NULL, NULL, 1, 'CLAUDEL', 'PHILIPPE '),
(6, NULL, NULL, 0, 'ASSOULINE', 'PIERRE '),
(7, NULL, NULL, 0, 'SCHMITT', ' ERIC-EMMANUEL'),
(8, NULL, NULL, 0, 'LAURENS', 'CAMILLE ');

-- --------------------------------------------------------

--
-- Structure de la table `g_livre`
--

DROP TABLE IF EXISTS `g_livre`;
CREATE TABLE IF NOT EXISTS `g_livre` (
  `l_isbn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_titre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_resume` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_date_parution` date NOT NULL,
  `l_nombre_pages` int NOT NULL,
  `l_prix_editeur` double NOT NULL,
  `l_fk_id_editeur` int NOT NULL,
  `l_fk_id_auteur` int NOT NULL,
  PRIMARY KEY (`l_isbn`),
  KEY `l_fk_id_editeur` (`l_fk_id_editeur`,`l_fk_id_auteur`),
  KEY `l_fk_id_auteur` (`l_fk_id_auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_livre`
--

INSERT INTO `g_livre` (`l_isbn`, `l_titre`, `l_resume`, `l_date_parution`, `l_nombre_pages`, `l_prix_editeur`, `l_fk_id_editeur`, `l_fk_id_auteur`) VALUES
('	 9782823623376', ' Un frère', '« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »\r\n\r\nDavid Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ? Écrire pour rejoindre Édouard. Le retrouver.\r\n\r\nDavid Thomas est l’auteur de plusieurs romans et recueils d’instantanés parmi lesquels La Patience des buffles sous la pluie ou Seul entouré de chiens qui mordent (prix de la nouvelle de l’Académie française 2021). Son dernier livre, Partout les autres , a été couronné en 2023 par le prix Goncourt de la nouvelle.', '2025-08-22', 139, 19, 13, 15),
('9782021603439', ' Le bel obscur', 'Alors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective, rien n’est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n’aura cessé de se réinventer, d’affirmer la puissance de ses rêves contre les conventions sociales, avec une fantaisie et une délicatesse infinies.\r\n\r\nCaroline Lamarche vit à Liège. Son œuvre témoigne d’un éclectisme et d’une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.', '2025-08-22', 229, 20, 7, 5),
('9782073080028', ' La nuit au coeur', '« De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu\'ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l\'impossibilité de la vérité entière à chaque page mais la quête désespérée d\'une justesse au plus près de la vie, de la nuit, du coeur, du corps, de l\'esprit.\r\n\r\nDe ces trois femmes, il a fallu commencer par la première, celle qui vient d\'avoir vingt-cinq ans quand elle court et qui est la seule à être encore en vie aujourd\'hui.\r\n\r\nCette femme, c\'est moi. »\r\n\r\nLa nuit au coeur entrelace trois histoires de femmes victimes de la violence de leur compagnon. Sur le fil entre force et humilité, Nathacha Appanah scrute l\'énigme insupportable du féminicide conjugal, quand la nuit noire prend la place de l\'amour.', '2025-08-21', 282, 21, 1, 1),
('9782073101228', ' La collision', 'La collision\r\n\r\nEn 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.\r\n\r\nDix ans plus tard, son fils, qui n\'a cessé d\'être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l\'opinion contre l\'autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard pour comprendre d\'où il vient, quel a été son parcours et comment un tel événement a été rendu possible.\r\n\r\nEn décortiquant ce drame familial, Paul Gasnier révèle deux destins qui s\'écrivent en parallèle, dans la même ville, et qui s\'ignorent jusqu\'au jour où ils entrent violemment en collision. C\'est aussi l\'histoire de deux familles qui racontent chacune l\'évolution du pays. Un récit en forme d\'enquête littéraire qui explore la force de nos convictions quand le réel les met à mal, et les manquements collectifs qui créent l\'irrémédiable.', '2025-08-21', 160, 19, 1, 9),
('9782073105455', 'Perpétuité', '18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d\'incidents plus éprouvants qu\'à l\'ordinaire.\r\n\r\nEn regardant celles et ceux qui regardent, Guillaume Poix plonge dans le quotidien d\'un métier méconnu, sinon méprisé, et interroge le sens d\'une institution au bord du gouffre.', '2025-08-21', 331, 22, 11, 13),
('9782221267660', ' Le crépuscule des hommes', 'PRIX RENAUDOT ESSAI 2025\r\nSélection Prix Goncourt des lycéens\r\nSélection Prix Goncourt des détenus\r\nNuremberg, 1945 : un procès fait l\'Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l\'Histoire en marche.\r\nChacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que se passe-t-il hors de la salle d\'audience ?\r\nIls sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l\'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occidentaux et soviétiques, l\'effroi que suscite le récit inédit des déportés.\r\nAvec autant de précision historique que de tension romanesque, Alfred de Montesquiou ressuscite des hommes et des femmes de l\'ombre, témoins du procès le plus retentissant du XXe siècle.', '2025-08-28', 382, 22, 12, 12),
('9782226498687', 'Un amour infini', 'Première sélection duPrix Goncourt 2025.\r\n\r\nPremière sélection du prix Médicis 2025.\r\n\r\nUne parenthèse d\'une grâce absolue, qu\'on voudrait ne jamais refermer. Lire - Magazine littéraire\r\n\r\nElle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu\'on peut vouloir d\'elle.\r\n\r\nCe roman installe le lecteur au coeur d\'une rencontre de trois jours sur l\'île de Ténérife, en juin 1964, prévue mais bouleversée par un événement tragique, entre un astrophysicien d\'origine hongroise qui a dû fuir l\'Europe et s\'exiler aux États-Unis et une mère de famille française.\r\n\r\nAlors que rien ne devrait les rapprocher, leurs conversations sur leurs passés distincts et l\'exploration de l\'île vont les ouvrir profondément l\'un à l\'autre. Le ciel, l\'univers, l\'histoire de la Terre... Les sujets de l\'astrophysicien rejoignent la sensibilité de celle qui a observé le mystère de la toute petite enfance et a toujours eu une approche sensitive des êtres. Leur désir réciproque va s\'accompagner de la puissance des éléments qui les entourent.\r\n\r\n1964. Sur l\'île de Tenerife. Une femme et un homme que rien ne destinait à se rencontrer, et, pourtant, durant 3 jours, en cette géographie volcanique et insulaire, naîtra l\'une des plus belles rencontres amoureuses écrites ces dernières années...Roman sensible subtile et sensuel, où le paysage cosmique, absolu de l\'île de Tenerife et la rencontre entre Louise et Nathan confluent si intimement que l\'impression laissée par cette histoire à l\'écriture aussi délicate que tellurique perdure infiniment.\r\n\r\nKarine Henry - Librairie Comme Un roman', '2025-08-20', 170, 19, 5, 8),
('9782234097155', ' Tressaillir', '« J\'ai coupé un lien avec quelque chose d\'aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »\r\n\r\nUne femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d\'hôtel, l\'élémentaire supplice de l\'arrachement. Et si rompre n\'était pas à sa portée ? Si la seule issue au chagrin, c\'était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujours sur le qui-vive, elle a peur.\r\n\r\nMais au fond, de quoi ?\r\n\r\nDans ce texte du retour aux origines et du retour de la joie, Maria Pourchet entreprend une archéologie de ces terreurs d\'enfant qui hantent les adultes. Elle nous transporte au coeur des forêts du Grand Est sur les traces de drames intimes et collectifs.', '2025-08-20', 324, 21, 9, 14),
('9782234097278', 'Le nom des rois', '« Et d\'un seul coup, le monde qui servait de décor à tout cela s\'écroula. J\'en avais été un témoin distrait, mais le bruit qu\'il provoqua en s\'effondrant me fit lever la tête et ce que je vis alors n\'était plus qu\'un univers de violence et de mort. C\'est de celui-là que je suis devenu contemporain. J\'avais été, durant des années, dispensé d\'intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berceaux de vieux empires oubliés.\r\n\r\nDésormais, l\'histoire se faisait sous mes yeux et je la trouvais moche, roturière et vulgaire. »\r\n\r\nDans ce récit de passage à l\'âge adulte porté par une écriture ample et élégante, Charif Majdalani raconte la disparition d\'un pays et explore ce qui subsiste de l\'enfance lorsqu\'elle capitule devant les fracas du monde.', '2025-08-20', 214, 20, 9, 11),
('9782260057307', 'Où s\'adosse le ciel', 'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s\'apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d\'un médecin français qui cherche à percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu\'il ne cesse de psalmodier, un mythe immense, demeuré intact en lui, transmis par la grande chaîne de la parole qui le relie à ses ancêtres. Une odyssée qui fut celle du peuple égyptien, alors sous le joug des Ptolémées, conduite par Ounifer, grand prêtre d\'Osiris qui caressait le rêve de rendre leur liberté aux siens, les menant vers l\'ouest à travers les déserts, jusqu\'à une terre promise, un bel horizon, là où s\'adosse le ciel...\r\nCe chemin, Bilal l\'emprunte à son tour, vers son pays natal, en passant par Djenné, la cité rouge, où vint buter un temps le voyage d\'Ounifer et de son peuple.\r\n\r\nDe l\'Égypte ancienne au Sénégal, David Diop signe un roman magistral sur un homme parti à la reconquête de ses origines et des sources immémoriales de sa parole.', '2025-08-14', 363, 22, 4, 3),
('9782378562588', 'Tambora', 'Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la maternité domine : celle de grossesses compliquées, d’hôpitaux et de services des urgences, la temporalité d’un corps qui produit, parfois sans qu’on le veuille, la temporalité de la naissance, celle des soins, ou des désirs trop souvent empêchés. Mais d’autres réalités existent aussi, se faufilent et tentent de prendre leur place : un manuscrit qui intéresse un éditeur, des confinements, qui ne changent pas grand-chose lorsqu’on doit rester alitée, la catastrophe environnementale qui se déploie, gigantesque, et fait songer à la fin du monde que l’humanité a cru vivre en 1815 quand l’éruption du volcan Tambora plongea une partie de la Terre dans le froid et l’obscurité. Hélène Laurain écrit avec cela, et écrit tout cela, avec crudité parfois. Son livre conjugue récit, réflexions et poésie, et nous emmène à la rencontre d’un monde incertain.', '2025-08-28', 192, 18, 8, 10),
('9782381340647', ' L\' Adieu au visage', 'Un roman en apnée sur la pandémie. Ce qu\'elle a fait aux vivants et aux morts, à notre humanité.\r\n\r\nMars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités covid où les malades meurent seuls, privés de tout rite. Entre obéissance à la loi et refus de l\'horreur, que ce soit à l\'hôpital ou dehors, chacun à son niveau cherche des solutions et improvise. L\'Adieu au visage est l\'écriture d\'une résistance fragile et d\'une lutte pour prendre soin de l\'autre.\r\n\r\n« Au commencement, on ne lave plus les corps, on ne les coiffe plus, on ne les habille plus, on ne les présente plus - d\'accompagner les morts, il n\'est plus question. »', '2025-08-20', 261, 21, 3, 7),
('9782707356741', 'La Maison vide', '🏆 Prix Goncourt 2025\r\n\r\nEn 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans.\r\n\r\nÀ l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux.\r\n\r\nUne maison peuplée de récits, où se croisent deux guerres mondiales, la vie rurale de la première moitié du vingtième siècle, mais aussi Marguerite, ma grand-mère, sa mère Marie-Ernestine, la mère de celle-ci, et tous les hommes qui ont gravité autour d’elles.\r\n\r\nToutes et tous ont marqué la maison et ont été progressivement effacés. J’ai tenté de les ramener à la lumière pour comprendre ce qui a pu être leur histoire, et son ombre portée sur la nôtre.', '2025-08-28', 743, 25, 10, 6),
('9782818061985', 'Kolkhoze', '🏆 Prix Médicis 2025 - Cette nuit-là, rassemblés tous les trois autour de notre mère, nous avons pour la dernière fois fait kolkhoze .', '2025-08-28', 558, 24, 2, 2),
('9782848055701', 'Passagères de nuit', 'Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue.\r\nLa première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvelle-Orléans. Sa grand-mère, arrivée d’Haïti au début du siècle dans le sillage du maître de la plantation qui avait fini par l’affranchir, n’a plus jamais voulu dépendre d’un homme. Inspirée par ce puissant exemple, la jeune Élisabeth se rebelle à son tour contre le désir prédateur d’un ami de son père. Elle doit fuir la ville, devenant à son tour une « passagère de nuit » sur un bateau à destination de Port-au-Prince. Ce qui adviendra d’elle, nous l’apprendrons quand son existence croisera celle de Régina, autre grande figure de ce roman des origines.\r\nNée pauvre parmi les pauvres dans un hameau du sud de l’île d’Haïti, Régina elle aussi a forcé le destin : rien ne la déterminait à devenir la maîtresse d’un des généraux arrivé en libérateur à Port-au-Prince en 1867. C’est à « mon général, mon amant, mon homme » qu’elle adresse le monologue amoureux dans lequel elle évoque sa trajectoire d’émancipation : la cruauté mesquine des maîtres qu’elle a fuis trouve son contrepoint dans les mains tendues par ces femmes qui lui ont appris à opposer aux coups du sort une ténacité silencieuse.\r\nCette ténacité silencieuse, Élizabeth et Régina l’ont reçue en partage de leurs lointaines ascendantes, ces « passagères de nuit » des bateaux négriers, dont Yanick Lahens évoque ici l’effroyable réalité, de même qu’elle nous plonge – et ce n’est pas la moindre qualité de ce très grand livre – dans les convulsions de l’histoire haïtienne.\r\nLorsque les deux héroïnes se rencontreront, dans une scène d’une rare qualité d’émotion, nous, lectrices et lecteurs, comprendrons que l’histoire ne s’écrit pas seulement avec les vainqueurs, mais dans la beauté des gestes, des regards et des mystères tus, qui à bas bruit montrent le chemin d’une résistance forçant l’admiration.', '2025-08-28', 223, 20, 6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `g_personnages`
--

DROP TABLE IF EXISTS `g_personnages`;
CREATE TABLE IF NOT EXISTS `g_personnages` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_fk_livre_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_fk_auteur_isbn` (`p_fk_livre_isbn`),
  KEY `p_fk_livre_isbn` (`p_fk_livre_isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_personnages`
--

INSERT INTO `g_personnages` (`p_id`, `p_nom`, `p_fk_livre_isbn`) VALUES
(1, 'Chahinez Daoud', '9782073080028'),
(2, 'Emma', '9782073080028'),
(3, 'Nathacha Appanah', '9782073080028'),
(4, 'Hélène Carrère d\'Encausse', '9782818061985'),
(5, 'Emmanuel Carrère', '9782818061985'),
(6, 'Louis Carrère d\'Encausse', '9782818061985'),
(7, 'Marie‑Ernestine', '9782707356741'),
(8, 'Marguerite', '9782707356741'),
(9, 'Michelle Rivas', '9782234097155'),
(10, 'Edouard Thomas', '	 9782823623376'),
(11, 'Saïd', '9782073101228'),
(12, 'Edmond', '9782021603439'),
(13, 'Bilal Seck', '9782260057307'),
(14, 'David Deneufgermain', '9782381340647'),
(15, 'Elizabeth Dubreuil', '9782848055701'),
(16, 'Régina ', '9782848055701'),
(17, 'Charif Majdalani', '9782234097278'),
(18, 'astrophysicien d\'origine hongroise', '9782226498687'),
(19, 'Louise ', '9782226498687'),
(20, 'Une mère nous parle de ses deux filles', '9782378562588'),
(21, 'Pierre', '9782073105455'),
(22, 'Houda', '9782073105455'),
(23, 'Laurent', '9782073105455'),
(24, 'Maeva', '9782073105455'),
(25, ' Joseph Kessel', '9782221267660'),
(26, 'Elsa Triolet', '9782221267660'),
(27, 'Martha Gellhorn', '9782221267660'),
(28, 'John Dos Passos', '9782221267660');

-- --------------------------------------------------------

--
-- Structure de la table `g_selection`
--

DROP TABLE IF EXISTS `g_selection`;
CREATE TABLE IF NOT EXISTS `g_selection` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_selection_livre`
--

DROP TABLE IF EXISTS `g_selection_livre`;
CREATE TABLE IF NOT EXISTS `g_selection_livre` (
  `s_fk_selection_id` int NOT NULL,
  `s_fk_livre_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`s_fk_selection_id`,`s_fk_livre_isbn`),
  KEY `s_fk_selection_id` (`s_fk_selection_id`,`s_fk_livre_isbn`),
  KEY `s_fk_auteur_isbn` (`s_fk_livre_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_tour_vote`
--

DROP TABLE IF EXISTS `g_tour_vote`;
CREATE TABLE IF NOT EXISTS `g_tour_vote` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_nom` int NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_vote`
--

DROP TABLE IF EXISTS `g_vote`;
CREATE TABLE IF NOT EXISTS `g_vote` (
  `v_fk_jury_id` int NOT NULL,
  `v_fk_livre_isbn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_fk_tour_vote_id` int NOT NULL,
  PRIMARY KEY (`v_fk_jury_id`,`v_fk_livre_isbn`,`v_fk_tour_vote_id`),
  KEY `v_fk_jury_id` (`v_fk_jury_id`,`v_fk_livre_isbn`,`v_fk_tour_vote_id`),
  KEY `v_fk_tour_vote_id` (`v_fk_tour_vote_id`),
  KEY `v_fk_livre_isbn` (`v_fk_livre_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_livre`
--
ALTER TABLE `g_livre`
  ADD CONSTRAINT `g_livre_ibfk_1` FOREIGN KEY (`l_fk_id_editeur`) REFERENCES `g_editeur` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_livre_ibfk_2` FOREIGN KEY (`l_fk_id_auteur`) REFERENCES `g_auteur` (`a_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_personnages`
--
ALTER TABLE `g_personnages`
  ADD CONSTRAINT `g_personnages_ibfk_1` FOREIGN KEY (`p_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_selection_livre`
--
ALTER TABLE `g_selection_livre`
  ADD CONSTRAINT `g_selection_livre_ibfk_1` FOREIGN KEY (`s_fk_selection_id`) REFERENCES `g_selection` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_selection_livre_ibfk_2` FOREIGN KEY (`s_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_vote`
--
ALTER TABLE `g_vote`
  ADD CONSTRAINT `g_vote_ibfk_1` FOREIGN KEY (`v_fk_jury_id`) REFERENCES `g_jury` (`j_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_vote_ibfk_2` FOREIGN KEY (`v_fk_tour_vote_id`) REFERENCES `g_tour_vote` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_vote_ibfk_3` FOREIGN KEY (`v_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
