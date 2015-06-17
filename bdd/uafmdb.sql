-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mer 17 Juin 2015 à 08:30
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `uafmdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `caracteristique`
--

CREATE TABLE IF NOT EXISTS `caracteristique` (
  `superficie` int(11) NOT NULL COMMENT 'superficie du pays',
  `capitale_poli` varchar(15) NOT NULL COMMENT 'capitale politique',
  `capitale_eco` varchar(15) NOT NULL COMMENT 'capitale économique',
  `date_indep` date NOT NULL COMMENT 'date indépendance',
  `drapeau` varchar(30) NOT NULL COMMENT 'drapeau',
  `langue_offic` varchar(30) NOT NULL COMMENT 'langue officielle du pays',
  `monnaie` varchar(15) NOT NULL COMMENT 'monnaie du pays',
  `nature_etat` varchar(35) NOT NULL COMMENT 'nature d''un etat',
  `devise` varchar(45) NOT NULL COMMENT 'la devise du pays',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  KEY `code_pays_caracteristique_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cera`
--

CREATE TABLE IF NOT EXISTS `cera` (
  `code_cera` varchar(15) NOT NULL COMMENT 'code du cera',
  `nom_cera` varchar(75) NOT NULL COMMENT 'nom du cera',
  PRIMARY KEY (`code_cera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cera`
--

INSERT INTO `cera` (`code_cera`, `nom_cera`) VALUES
('CEDEAO', 'Communauté économique des États de l''Afrique de l''Ouest'),
('CEEAC', 'Communauté économique des États de l''Afrique centrale'),
('CENSAD', 'Communauté des Etats Sahélo-Sahariens'),
('COMESA', 'Marché Commun De L''Afrique Orientale et Australe'),
('EAC', 'Communauté est-Africaine'),
('IGAD', 'Autorité Intergouvernementale pour le Développement'),
('SADC', 'Communauté de Développement d''Afrique Australe'),
('UMA', 'Union du Maghreb Arabe');

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

CREATE TABLE IF NOT EXISTS `continent` (
  `code_conti` varchar(3) NOT NULL COMMENT 'code du continent',
  `nom_conti` varchar(20) NOT NULL COMMENT 'nom du continent',
  PRIMARY KEY (`code_conti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `continent`
--

INSERT INTO `continent` (`code_conti`, `nom_conti`) VALUES
('AFR', 'Afrique'),
('AME', 'Amérique'),
('ASI', 'Asie'),
('EUR', 'Europe'),
('OCE', 'Océanie');

-- --------------------------------------------------------

--
-- Structure de la table `front_saharienne`
--

CREATE TABLE IF NOT EXISTS `front_saharienne` (
  `code_front` varchar(15) NOT NULL COMMENT 'code de la frontière saharienne',
  `nom_front_saharienne` varchar(25) NOT NULL COMMENT 'nom de la frontière saharienne',
  PRIMARY KEY (`code_front`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `front_saharienne`
--

INSERT INTO `front_saharienne` (`code_front`, `nom_front_saharienne`) VALUES
('AFNS', 'Afrique au Nord du Sahara'),
('AFSS', 'Afrique au Sud du Sahara');

-- --------------------------------------------------------

--
-- Structure de la table `harm_droit`
--

CREATE TABLE IF NOT EXISTS `harm_droit` (
  `code_harmo` varchar(15) NOT NULL COMMENT 'code d''harmonisation de droit',
  `nom_harmo` varchar(75) NOT NULL COMMENT 'nom d''harmonisation de droit',
  PRIMARY KEY (`code_harmo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `harm_droit`
--

INSERT INTO `harm_droit` (`code_harmo`, `nom_harmo`) VALUES
('CIMA', 'Conférence Interafricaine des Marchés d''Assurances'),
('OHADA', 'Organisation pour l''Harmonisation en Afrique du Droit des Affaires');

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

CREATE TABLE IF NOT EXISTS `indicateur` (
  `code_indic` varchar(6) NOT NULL COMMENT 'code d''indicateur',
  `nom_indic` varchar(255) NOT NULL COMMENT 'nom d''indicateur',
  `unit_indic` varchar(100) DEFAULT NULL COMMENT 'unité d''indicateur',
  `code_theme` varchar(15) NOT NULL COMMENT 'code du thème',
  PRIMARY KEY (`code_indic`),
  KEY `code_theme_indicateur_fk` (`code_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `indicateur`
--

INSERT INTO `indicateur` (`code_indic`, `nom_indic`, `unit_indic`, `code_theme`) VALUES
('ABIH', 'Abonnés à internet haut débit fixe', 'Unité', 'CMNV'),
('ABOP', 'Abonnés en ordinateurs personnels', 'Unité', 'CMNV'),
('ABTM', 'Abonnés à la téléphonie mobile (pour 100 personnes)', 'Unité', 'CMNV'),
('ACCE', 'Accès à l''électricité', 'Unité', 'PER'),
('AGCH', 'Agroalimentaire : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('AGEM', 'Agroalimentaire : emplois en million', 'Unité', 'BREN'),
('AGEMT', 'Agroalimentaire: part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('AGEX', 'Agroalimentaire : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('AGEXT', 'Agroalimentaire : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('AGGE', 'Agroalimentaire : grandes entreprises du secteur en nombre', 'Unité', 'BREN'),
('AGPIT', 'Agroalimentaire : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('AIPD', 'Aide publique au développement', 'Dollar (USD)', 'FNI'),
('ASCH', 'Assurances : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('ASEM', 'Assurances : emplois en million', 'Unité', 'BREN'),
('ASEMT', 'Assurances : part dans emploi en pourcentage du total des emplois', 'Pourcentage (%)', 'BREN'),
('ASEX', 'Assurances : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('ASEXT', 'Assurances : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('ASGE', 'Assurances : grandes entreprises du secteur assurance', 'Unité', 'BREN'),
('ASPI', 'Assurances : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('AUCH', 'Automobile : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('AUEM', 'Automobile : emplois en million', 'Unité', 'BREN'),
('AUEMT', 'Automobile : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('AUEX', 'Automobile : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('AUEXT', 'Automobile : part dans les exportations en pourcentage du total des exportations de biens', 'Pourcentage (%)', 'BREN'),
('AUGE', 'Automobile : grandes entreprises du secteur', 'Unité', 'BREN'),
('AUPIT', 'Automobile : part dans le PIB en pourcentage du PIB', 'Pourcentage (%)', 'BREN'),
('AUPM', 'Automobile : production mondiale en millions de tonnes', 'tonne', 'BREN'),
('BACH', 'Banque : chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('BACI', 'Banque : crédit intérieur fourni par le secteur bancaire en milliards USD', 'Dollar (USD)', 'BREN'),
('BACIT', 'Banque : crédit intérieur fourni par le secteur bancaire en pourcentage du total PIB', 'Pourcentage (%)', 'BREN'),
('BACO', 'Balance commerciale en milliard USD', 'Dollar (USD)', 'COE'),
('BACT', 'Balance commerciale en pourcentage du PIB total', 'Pourcentage (%)', 'COE'),
('BADET', 'Banque: densité du réseau d''agences bancaires', 'Unité', 'BREN'),
('BAEM', 'Banque : nombre d''emplois dans le monde', 'Unité', 'BREN'),
('BAEMT', 'Banque : nombre d''emplois dans le monde en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('BAGE', 'Banques : grandes entreprises du secteur bancaire', 'Unité', 'BREN'),
('BANG', 'Banque: nombre d''agences bancaires', 'Unité', 'BREN'),
('BAPA', 'Balance de paiement en milliard USD', 'Dollar (USD)', 'FNI'),
('BAPI', 'Banque: PIB Banque en milliards USD', 'Dollar (USD)', 'BREN'),
('BAPIT', 'Banque : part dans le PIB mondial en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('BAPT', 'Balance de paiement en pourcentage du PIB', 'Pourcentage (%)', 'FNI'),
('BATB', 'Banque: taux de bancarisation', 'Taux (%)', 'BREN'),
('BATIT', 'Banque : taux de crédit', 'Taux (%)', 'BREN'),
('CACA', 'Production mondiale de cacao en quantité', 'quantité', 'RES'),
('CACAV', 'Production mondiale de cacao en valeur million USD', 'Dollar (USD)', 'RES'),
('CAFE', 'Production mondiale de cafe en quantité', 'quantité', 'RES'),
('CAFEV', 'Production mondiale de café en valeur million USD', 'Dollar (USD)', 'RES'),
('CAFT', 'Classement Doing Business (attractivité fiscale :Taux d''imposition)', 'numéro d''ordre', 'ACR'),
('CAOU', 'Production mondiale de caoutchouc naturel en quantité et en valeur million USD', 'quantité', 'RES'),
('CAOUV', 'Production mondiale de caoutchouc naturel en valeur million USD', 'Dollar (USD)', 'RES'),
('CAPT', 'Capitalisation des entreprises cotées en milliards USD', 'Dollar (USD)', 'ENTR'),
('CAPTT', 'Capitalisation des entreprises cotées pourcentage du PIB', 'Pourcentage (%)', 'ENTR'),
('CEDR', 'Classement Doing business (engagement des réformes)', 'numéro d''ordre', 'ACR'),
('CERE', 'Production mondiale de céréale (total) en quantité', 'quantité', 'RES'),
('CEREV', 'Production mondiale de céréale (total) en valeur million USD', 'Dollar (USD)', 'RES'),
('CFFA', 'Classement Doing business (facilités de faire des affaires)', 'numéro d''ordre', 'ACR'),
('CHASAT', 'Chomage dans le monde du secteur primaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('CHSA', 'Chomage dans le monde du secteur primaire en million', 'Unité', 'SEAE'),
('CHSI', 'Chomage dans le monde du secteur secondaire en million', 'Unité', 'SEAE'),
('CHSIT', 'Chomage dans le monde du secteur secondaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('CHSS', 'Chomage dans le monde du secteur tertiaire en million', 'Unité', 'SEAE'),
('CHSST', 'Chomage dans le monde du secteur tertiaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('CLMO', 'Classe moyenne', 'Unité', 'CMNV'),
('COCH', 'Consommation grands publics : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('CODT', 'Consommation des ménages en pourcentage du PIB', 'Pourcentage (%)', 'CMNV'),
('COEL', 'Consommation d''électricité en KW', 'Kilowatts (KW)', 'CMNV'),
('COEM', 'Consommation grands publics : emplois en million', 'Unité', 'BREN'),
('COEMT', 'Consommation grands publics : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('COET', 'Commerce extérieur au total en pourcentage du PIB total', 'Pourcentage (%)', 'COE'),
('COETM', 'Commerce extérieur au total en milliard USD', 'Dollar (USD)', 'COE'),
('COEXT', 'Consommation grands publics : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('COEXTP', 'Consommation grands publics : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('COFA', 'Classement des pays suivant le dégré de risque COFACE (risque pays)', 'numéro d''ordre', 'ACR'),
('COGE', 'Consommation grands publics : grandes entreprises du secteur', 'Unité', 'BREN'),
('COMB', 'Combustibles dans les exportations mondiales en pourcentage', 'Pourcentage (%)', 'RES'),
('COME', 'Consommation des ménages en milliard USD', 'Dollar (USD)', 'CMNV'),
('COPIT', 'Consommation grands publics : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('COTO', 'Production mondiale de coton en quantité', 'quantité', 'RES'),
('COTOV', 'Production mondiale de coton en valeur million USD', 'Dollar (USD)', 'RES'),
('CROI', 'Croissance en taux', 'Taux (%)', 'ECR'),
('DCD', 'Degré de culture démocratique', 'Taux (%)', 'DEGP'),
('DELC', 'Degré de liberté de commerce', 'numéro d''ordre', 'ACR'),
('DELI', 'Degré de liberté pour investir', 'numéro d''ordre', 'ACR'),
('DELP', ' Degré de liberté de propriété', 'numéro d''ordre', 'ACR'),
('DEPG', 'Dépenses publiques globales en milliard USD', 'Dollar (USD)', 'FIPU'),
('DEPO', 'Densité de la population (KM2)', 'kilomètre carré KM2', 'PED'),
('DEPT', 'Dépenses publiques globales en pourcentage du PIB', 'Pourcentage (%)', 'FIPU'),
('DEXP', 'Déficits/excédents publics en milliards USD', 'Dollar (USD)', 'FIPU'),
('DEXT', 'Déficits/excédents publics en pourentage du PIB total', 'Pourcentage (%)', 'FIPU'),
('DMCH', 'Divertissement et média : chiffres d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('DMEM', 'Divertissement et média : emplois en million', 'Unité', 'BREN'),
('DMEMT', 'Divertissement et média: part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('DMEX', 'Divertissement et média : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('DMEXT', 'Divertissement et média : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('DMGE', 'Divertissement et média : grandes entreprises du secteur', 'Unité', 'BREN'),
('DMPIT', 'Divertissement et média : part dans le PIB en milliards USD et en pourcentage du PIB', 'Pourcentage (%)', 'BREN'),
('EMCO', 'Emision de CO2', 'CO2', 'PER'),
('EMSA', 'Emplois dans le monde du secteur primaire en millions', 'Unité', 'SEAE'),
('EMSAT', 'Emplois dans le monde du secteur primaire en pourcentage de l''emploi total', 'Pourcentage (%)', 'SEAE'),
('EMSI', 'Emplois dans le monde du secteur secondaire en millions', 'Unité', 'SEAE'),
('EMSIT', 'Emplois dans le monde du secteur secondaire en pourcentage de l''emploi total', 'Pourcentage (%)', 'SEAE'),
('EMSS', 'Emplois dans le monde du secteur tertaire en millions', 'Unité', 'SEAE'),
('EMSST', 'Emplois dans le monde du secteur tertiaire en pourcentage de l''emploi total', 'Pourcentage (%)', 'SEAE'),
('ENCH', 'Energie : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('ENCHCA', 'Energie : chiffres d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('ENEM', 'Energie : emplois en million', 'Unité', 'BREN'),
('ENEMT', 'Energie : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('ENEX', 'Energie : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('ENEXT', 'Energie : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('ENGT', 'Energie : grandes entreprises du secteur Energie', 'Unité', 'BREN'),
('ENIC', 'Nombre d''entreprises intérieures cotées', 'unite', 'ENTR'),
('ENPT', 'Endettements publics en pourcentage du PIB', 'Pourcentage (%)', 'FIPU'),
('ENPU', 'Endettements publics en milliards USD', 'Dollar (USD)', 'FIPU'),
('EPDO', 'Epargne domestique en milliard USD', 'Dollar (USD)', 'CMNV'),
('EPDT', 'Epargne domestique en pourcentage du PIB total', 'Pourcentage (%)', 'CMNV'),
('EQCH', 'Equipementiers télécoms et réseaux : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('EQEM', 'Equipementiers telecoms et réseaux : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('EQEMT', 'Equipementiers telecoms et réseaux : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('EQEXT', 'Equipementiers telecoms et réseaux : part dans les exportations en milliards', 'Dollar (USD)', 'ESSI'),
('EQGE', 'Equipementiers telecoms et réseaux : grandes entreprises du secteur santé', 'Unité', 'ESSI'),
('EQPI', 'Equipementiers telecoms et réseaux : emplois en million', 'Unité', 'BREN'),
('EQPIT', 'Equipementiers telecoms et réseaux : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('ESVI', 'Espérance de vie', 'âge', 'CMNV'),
('ETEF', 'Entreprises transnationales et effectif salarie', 'unite', 'ENTR'),
('ETEFT', 'Entreprises transnationales et part en pourcentage dans le nombre de salariés das le monde', 'Pourcentage (%)', 'ENTR'),
('ETEX', 'Entreprises transnationales et part dans les exportations mondiales en milliards', 'Dollar (USD)', 'ENTR'),
('ETEXT', 'Entreprises transnationales et part en pourcentage dans les exportations mondiales', 'Pourcentage (%)', 'ENTR'),
('ETPI', 'Entreprises transnationales et PIB en milliards USD', 'Dollar (USD)', 'ENTR'),
('ETPIT', 'Entreprises transnationales et part en pourcentage dans le PIB total', 'Pourcentage (%)', 'ENTR'),
('EXBS', 'Exportations des biens et services en milliards USD', 'Dollar (USD)', 'COE'),
('EXBT', 'Exportations des biens et services en pourcentage du PIB total', 'Pourcentage (%)', 'COE'),
('EXPM', 'Exportations de produits manufacturés en milliard USD', 'Dollar (USD)', 'COE'),
('EXPMT', 'Exportations de produits manufacturés en pourcentage du total des exportations', 'Pourcentage (%)', 'COE'),
('FBCF', 'Formation brute de capital fixe (FBCF)', 'Dollar (USD)', 'INV'),
('FBCT', 'FBCF en pourcentage du PIB', 'Pourcentage (%)', 'INV'),
('FOIN', 'Principaux fonds investissements en nombre', 'Unité', 'BREN'),
('FOINL', 'Principaux fonds investissements et fonds levés en milliards USD', 'Dollar (USD)', 'BREN'),
('GRCH', 'Grande distribution : chiffres d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('GREM', 'Grande distribution : emplois en million', 'Unité', 'BREN'),
('GREMT', 'Grande distribution : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('GREX', 'Grande distribution : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('GREXT', 'Grande distribution : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('GRGE', 'Grande distribution : grandes entreprises du secteur', 'Unité', 'BREN'),
('GRPI', 'Grande distribution : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('HUIL', 'Production mondiale de huile de palme en quantité', 'quantité', 'RES'),
('HUILV', 'Production mondiale de huile de palme en valeur million USD', 'Dollar (USD)', 'RES'),
('ICGN', 'Indice de confiance envers le Gouvernement national (PNUD)', 'Taux (%)', 'FIPU'),
('IDCO', ' Indice de la perception de la corruption ', 'Taux (%)', 'DEGP'),
('IDH', 'Indice de développement humain', 'nombre décimal', 'CMNV'),
('IGCT', 'Indice globale de compétitivité de talents', 'numéro d''ordre', 'ACR'),
('IGRN', 'Indice de gouvernance des ressources naturelles', 'Taux (%)', 'DEGP'),
('ILCI', 'Indice des Libertés civiles', 'Taux (%)', 'DEGP'),
('ILPR', 'Indice de Liberté de la presse', 'Taux (%)', 'DEGP'),
('IMBS', 'Importations des biens et services en milliards USD', 'Dollar (USD)', 'COE'),
('IMBT', 'Importations des biens et services en pourcentage du PIB total', 'Pourcentage (%)', 'COE'),
('INAC', 'Industrie lourde : production mondiale d''acier en millions de tonnes', 'tonne', 'BREN'),
('INCH', 'Industries lourdes : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('INDE', 'Investissements Directs à l''Etranger', 'Dollar (USD)', 'FNI'),
('INEM', 'Industrie lourde : emplois en million', 'Unité', 'BREN'),
('INEX', 'Industrie lourde : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('INEXT', 'Industrie lourde : part dans les exportations en pourcentage du total des exportations de biens', 'Pourcentage (%)', 'BREN'),
('INFE', 'Informel : effectif y travaillant total', 'Unité', 'ESSI'),
('INFET', 'Informel : effectif y travaillant en pourcentage du total des emplois', 'Pourcentage (%)', 'ESSI'),
('INFN', 'Informel : Pib en milliards USD', 'Dollar (USD)', 'ESSI'),
('INFNE', 'Informel : nombre d''entreprises', 'Unité', 'ESSI'),
('INFNT', 'Informel : nombre d''entreprises en pourcentage du total des entreprises', 'Pourcentage (%)', 'ESSI'),
('INFPT', 'Informel : PIB en pourcentage du PIB total', 'Pourcentage (%)', 'ESSI'),
('INGE', 'Industrie lourde : grandes entreprises du secteur', 'Unité', 'BREN'),
('INME', 'Industrie lourde : production mondiale de medicaments en millions de tonnes', 'tonne', 'BREN'),
('INPI', 'Industrie lourde : part dans le PIB en milliards USD', 'Dollar (USD)', 'BREN'),
('INPIT', 'Industrie lourde : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('INPO', 'Investissements de portefeuille', 'Dollar (USD)', 'FNI'),
('INRE', 'Investissements en Réseaux routiers', 'Dollar (USD)', 'INV'),
('INRF', 'Investissements en Réseaux ferroriviaires', 'Dollar (USD)', 'INV'),
('IOMD', 'Investissements découlant de la mise en œuvre des Objectifs millénaires du développement', 'Dollar (USD)', 'INV'),
('IPCO', 'Indice de prix à la consommation (Inflation)', 'Taux (%)', 'CMNV'),
('IPM', 'Indice de paix mondiale', 'Taux (%)', 'DEGP'),
('IPMU', 'Indice de pauvreté multidimensionnel', 'Taux (%)', 'CMNV'),
('ISVG', 'Indice de satisfaction de vie globale', 'Taux (%)', 'CMNV'),
('LICI', 'Liberté de commerce international', 'numéro d''ordre', 'ACR'),
('LITQ', 'Lignes téléphoniques', 'Unité', 'CMNV'),
('MAIS', 'Production mondiale de mais en quantité', 'quantité', 'RES'),
('MAISV', 'Production mondiale de mais en valeur million USD', 'Dollar (USD)', 'RES'),
('MANI', 'Production mondiale de manioc en quantité', 'quantité', 'RES'),
('MANIV', 'Production mondiale de manioc en valeur million USD', 'Dollar (USD)', 'RES'),
('MPEX', 'Matières premières dans les exportations mondiales en pourcentage', 'Pourcentage (%)', 'RES'),
('NATP', 'Nombre d''arrivées de touristes dans le pays', 'numéro d''ordre', 'ACR'),
('NCEA', 'Nombre de créations d''entreprises par an en nombre', 'unite', 'ENTR'),
('NCEAT', 'Nombre de créations d''entreprises par an en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NCEF', 'Nombre de créations d''entreprises par an par forme juridique', 'unite', 'ENTR'),
('NCEFT', 'Nombre de créations d''entreprises par an par forme juridique en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NCES', 'Nombre de créations d''entreprises par an par secteur d''activité', 'unite', 'ENTR'),
('NCEST', 'Nombre de créations d''entreprises par an par secteur d''activité en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NCET', 'Nombre de créations d''entreprises par an par taille', 'unite', 'ENTR'),
('NCETT', 'Nombre de créations d''entreprises par an par taille en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NEEV', 'Nombre d''entreprises par emplois en valeur', 'unite', 'ENTR'),
('NEEVT', 'Nombre d''entreprises par emplois en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NEFJ', 'Nombre d''entreprises par forme juridique en valeur', 'unite', 'ENTR'),
('NEFJT', 'Nombre d''entreprises par forme juridique en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NEIN', 'Nombre d''emplois dans l''Informel', 'unite', 'EPT'),
('NESA', 'Nombre d''entreprises par secteur d''activité en valeur', 'unite', 'ENTR'),
('NESAT', 'Nombre d''entreprises par secteur d''activité en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NEST', 'Nombre d''entreprises par taille en valeur', 'unite', 'ENTR'),
('NESTT', 'Nombre d''entreprises par taille en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NESV', 'Nombre d''entreprises par salaires en valeur', 'unite', 'ENTR'),
('NESVT', 'Nombre d''entreprises par salaires en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NETA', 'Nombre de créations d''entreprises par an par taille en nombre', 'unite', 'ENTR'),
('NETAT', 'Nombre de créations d''entreprises par an en pourcentage', 'Pourcentage (%)', 'ENTR'),
('NILI', 'Niveau de liberté  des investissements', 'numéro d''ordre', 'ACR'),
('NLTF', ' Niveau de liberté des transferts de fonds et subsides', 'numéro d''ordre', 'ACR'),
('NOCH', 'Nombre de chomeurs en million', 'million', 'EPT'),
('NOEM', 'Nombre total d’emplois en million', 'million', 'EPT'),
('NOEP', 'Nombre d''emplois précaires', 'unite', 'EPT'),
('NOFT', 'Notation Fitch Rating', 'numéro d''ordre', 'ACR'),
('NOMI', 'Nombre de migrants', 'numéro d''ordre', 'ACR'),
('NOMO', 'Notation Moody ''s', 'numéro d''ordre', 'ACR'),
('NOSP', 'Notation Standard and Poor''s', 'numéro d''ordre', 'ACR'),
('NOTE', 'Nombre total d''entreprises', 'unite', 'ENTR'),
('NOTR', 'Nombre d''entreprises transnationales (multinationales)', 'unite', 'ENTR'),
('NTCH', 'NTIC : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('NTEM', 'NTIC : emplois en million', 'Unité', 'BREN'),
('NTEMT', 'NTIC : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('NTEX', 'NTIC : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('NTEXT', 'NTIC : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('NTGE', 'NTIC : grandes entreprises du secteur NTIC', 'Unité', 'BREN'),
('NTPIT', 'NTIC : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('ONEF', 'ONG: effectif (emplois)', 'Unité', 'ESSI'),
('ONFO', 'ONG : fonds alloués en milliard', 'Dollar (USD)', 'ESSI'),
('ONIN', 'ONG: investissements en milliards USD', 'Dollar (USD)', 'ESSI'),
('ONNO', 'ONG : nombre', 'Unité', 'ESSI'),
('PAAI', 'Population active du secteur secondaire en millions', 'Unité', 'SEAE'),
('PAAIT', 'Population active du secteur secondaire en pourcentage de la poplation active totale', 'Pourcentage (%)', 'SEAE'),
('PAAS', 'Population active du secteur tertiaire en millions', 'Unité', 'SEAE'),
('PAAST', 'Population active du secteur tertiaire en pourcentage de la poplation active totale', 'Pourcentage (%)', 'SEAE'),
('PAEX', 'Produits agricoles dans les exportations mondiales en valeur USD', 'Dollar (USD)', 'RES'),
('PAEXT', 'Produits agricoles dans les exportations mondiales en pourcentage', 'Pourcentage (%)', 'RES'),
('PCHA', 'Production mondiale charbon', 'quantité', 'RES'),
('PDE', 'Pollution de l''eau', NULL, 'PER'),
('PDIA', 'Production mondiale de diamant', 'quantité', 'RES'),
('PGAZ', 'Production mondiale du gaz', 'Mètre cube', 'RES'),
('PIBC', 'PIB courant en USD', 'Dollar (USD)', 'ECR'),
('PIBH', 'PIB courant par habitant en USD', 'Dollar (USD)', 'ECR'),
('PIBP', 'PIB en parité de pouvoir d''achat (PPA) en USD', 'Dollar (USD)', 'ECR'),
('PIBT', 'PIB en parité d''achat par habitant en USD', 'Dollar (USD)', 'ECR'),
('PIDA', 'Programme de développement des infrastructures en Afrique', 'Dollar (USD)', 'INV'),
('PIGB', 'PIB par grande branche d''activité en milliards USD', 'Dollar (USD)', 'ECR'),
('PIGBT', 'PIB par grandes branches d''activité en pourcentage du PIB total', 'Dollar (USD)', 'ECR'),
('PISC', 'PIB: composante du PIB en milliard USD', 'Dollar (USD)', 'ECR'),
('PISCT', 'PIB : composante du PIB en pourcentage du PIB total', 'Pourcentage (%)', 'ECR'),
('PLEC', 'Production mondiale électricité', 'Kilowatts (KW)', 'RES'),
('PMAP', 'Principales matières premières échangées dans les marchés mondiaux', 'liste', 'RES'),
('PMOR', 'Production mondiale d''or', 'quantité', 'RES'),
('PMPL', 'Production mondiale de platine', 'quantité', 'RES'),
('PNCH', 'Pneumatique : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('PNEM', 'Pneumatique : emplois en million', 'Unité', 'BREN'),
('PNEMT', 'Pneumatique : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('PNEX', 'Pneumatique : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('PNEXT', 'Pneumatique : part dans les exportations en pourcentage du total des exportations de biens', 'Pourcentage (%)', 'BREN'),
('PNGE', 'Pneumatique : grandes entreprises du secteur', 'Unité', 'BREN'),
('PNPIT', 'Pneumatique : part dans le PIB en pourcentage du PIB total', 'Dollar (USD)', 'BREN'),
('PNPN', 'Pneumatique : production mondiale en millions de tonnes', 'tonne', 'BREN'),
('POAA', 'Population active du secteur primaire en nombre', 'unite', 'SEAE'),
('POAAT', 'Population active du secteur primaire en pourcentage population active totale', 'Pourcentage (%)', 'SEAE'),
('POAC', 'Population active en million', 'million', 'EPT'),
('POAG', 'Population âgée en million', 'million', 'PED'),
('POAGT', 'Population âgée en pourcentage de la population totale', 'million', 'PED'),
('POAT', 'Population active en pourcentage de la population totale', 'Pourcentage (%)', 'EPT'),
('POFE', 'Population femme en million', 'million', 'PED'),
('POHO', 'Population homme en million', 'million', 'PED'),
('POHOT', 'Population Homme en pourcentage de la population totale', 'Pourcentage (%)', 'PED'),
('POHT', 'Population femme en pourcentage de population totale', 'Pourcentage (%)', 'PED'),
('POIM', 'Population immigrée en million', 'million', 'PED'),
('POIT', 'Population immigrée en pourcentage de la population pop totale', 'Pourcentage (%)', 'PED'),
('POJA', 'Population jeune en million', 'million', 'PED'),
('POJAT', 'Population jeune en pourcentage de la population totale', 'Pourcentage (%)', 'PED'),
('POLA', 'Pollution de l''air ', NULL, 'PER'),
('PORU', 'Population rurale en million', 'million', 'PED'),
('PORUT', 'Population rurale en proportion de la population totale (en %)', 'Pourcentage (%)', 'PED'),
('POTO', 'Population totale en million', 'million', 'PED'),
('POUR', 'Population urbaine en million', 'million', 'PED'),
('POURT', 'Population urbaine en proportion de la population totale (en %)', 'Pourcentage (%)', 'PED'),
('PPDAA', 'Programme détaillé de développement de l''agriculture africaine', 'Dollar (USD)', 'INV'),
('PPET', 'Production mondiale du pétrole', 'baril', 'RES'),
('PRAR', 'Production mondiale d''argent', 'quantité', 'RES'),
('PRCO', 'Production mondiale de colbat', 'quantité', 'RES'),
('PRMA', 'Productivité de la main d œuvre agricole', 'Taux (%)', 'PRR'),
('PRMI', 'Productivité de la main d œuvre dans l''industrie', 'Taux (%)', 'PRR'),
('PRMS', 'Productivité de la main d oeuvre dans le service', 'Taux (%)', 'PRR'),
('PSAA', 'PIB total du secteur primaire ( agriculture,…) en milliards USD', 'Dollar (USD)', 'SEAE'),
('PSAAT', 'PIB en pourcentage par secteur d''activité (Primaire : agriculture,…)', 'Pourcentage (%)', 'SEAE'),
('PSAI', 'PIB total du secteur secondaire (Industries, BTP…)en milliards USD', 'Dollar (USD)', 'SEAE'),
('PSAIT', 'PIB en pourcentage par secteur d''activité (Secondaire : Industries, BTP...)', 'Pourcentage (%)', 'SEAE'),
('PSAS', 'PIB total du secteur tertiaire ( services) en milliards USD', 'Dollar (USD)', 'SEAE'),
('PSAST', 'PIB en pourcentage par secteur d''activité (Tertiaire: services)', 'Pourcentage (%)', 'SEAE'),
('RAEP', 'Ratio emploi / population', 'Taux (%)', 'EPT'),
('RALE', 'Rang suivant l ''indice de la libertité économique', 'numéro d''ordre', 'ACR'),
('RCER', 'Rendement de culture de céréales par KG récolté', 'Kilogramme (KG)', 'PRR'),
('REBS', 'Rang parmi les exportateurs de biens et services', 'numéro d''ordre', 'ACR'),
('REFI', 'Recettes fiscales en Milliards USD', 'Dollar (USD)', 'FIPU'),
('REFT', 'Recettes fiscales en pourcentage du PIB', 'Pourcentage (%)', 'FIPU'),
('RENB', 'Revenu national brut en USD', 'Dollar (USD)', 'CMNV'),
('RENH', 'Revenu national brut par habitant en USD', 'Dollar (USD)', 'CMNV'),
('REST', 'Réserves en pourcentage du PIB', 'Pourcentage (%)', 'FIPU'),
('RESV', 'Réserves en milliards USD', 'Dollar (USD)', 'FIPU'),
('RIDE', 'Rang au niveau des Investissements Directs à l''Etranger', 'numéro d''ordre', 'ACR'),
('RIMC', 'Rang suivant l''Indice mondial de compétitivité', 'numéro d''ordre', 'ACR'),
('SACH', 'Santé : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('SAEMT', 'Santé : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('SAEMTP', 'Santé : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('SAEX', 'Santé : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('SAGE', 'Santé : grandes entreprises du secteur santé', 'Unité', 'BREN'),
('SALA', 'Salaire dans le monde du secteur primaire en million', 'Unité', 'SEAE'),
('SALAT', 'Salaires dans le monde du secteur primaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('SALI', 'Salaires dans le monde du secteur secondaire en million', 'Unité', 'SEAE'),
('SALIT', 'Salaires dans le monde du secteur secondaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('SALS', 'Salaires dans le monde du secteur tertiaire en million', 'Unité', 'SEAE'),
('SALST', 'Salaires dans le monde du secteur tertiaire en pourcentage du nombre total de chomeurs', 'Pourcentage (%)', 'SEAE'),
('SAPI', 'Santé : emplois en million', 'Unité', 'BREN'),
('SAPIT', 'Santé : part dans le PIB en pourcentage du PIB total', 'Pourcentage (%)', 'BREN'),
('SOCC', 'Principales sociétés de capital-risque en nombre', 'Unité', 'BREN'),
('SOCCL', 'Principales sociétés de capital-risque et fonds levés en miliards USD', 'Dollar (USD)', 'BREN'),
('SOCR', 'Principales sociétés d''investissements en nombre', 'Unité', 'BREN'),
('SOCRL', 'Principales sociétés d''investissements et fonds levés en milliards USD', 'Dollar (USD)', 'BREN'),
('SORG', 'Production mondiale de sorgho en quantité', 'quantité', 'RES'),
('SORGV', 'Production mondiale de sorgho en valeur million USD', 'Dollar (USD)', 'RES'),
('SUCR', 'Production mondiale de surcre en quantité', 'quantité', 'RES'),
('SUCRV', 'Production mondiale de surcre en valeur million USD', 'Dollar (USD)', 'RES'),
('TACH', 'Taux de chomage', 'Taux (%)', 'EPT'),
('TAEI', 'Taux d''emplois dans l''Informel', 'Taux (%)', 'EPT'),
('TAEP', 'Taux des emplois précaires', 'Taux (%)', 'EPT'),
('TEAG', 'Terres agricoles en million', 'kilomètre carré KM2', 'RES'),
('TEFT', 'Terres forestieres en pourcentage du total des terres', 'Pourcentage (%)', 'RES'),
('TEGT', 'Terres agricoles en pourcentage du total des terres', 'Pourcentage (%)', 'RES'),
('TERA', 'Terres arables en million', 'kilomètre carré KM2', 'RES'),
('TERF', 'Terres forestieres en million', 'kilomètre carré KM2', 'RES'),
('TERR', 'Terres en million', 'kilomètre carré KM2', 'RES'),
('TERT', 'Terres arables en pourcentae des terres', 'Pourcentage (%)', 'RES'),
('THE', 'Production mondiale de thé en quantité', 'quantité', 'RES'),
('THEV', 'Production mondiale de thé en valeur million USD', 'Dollar (USD)', 'RES'),
('TOAT', 'Tourisme : nombre d''arrivées de touristes', 'Unité', 'BREN'),
('TOCH', 'Tourisme : recettes touristiques en milliards USD', 'Dollar (USD)', 'BREN'),
('TOEX', 'Tourisme : part dans les exportations des services en milliards USD', 'Dollar (USD)', 'BREN'),
('TOEXT', 'Tourisme : part dans les exportations des services en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('TOGE', 'Tourisme : grandes entreprises du secteur touristique', 'Unité', 'BREN'),
('TONE', 'Tourisme : nombre d''emplois dans le monde', 'Unité', 'BREN'),
('TONET', 'Tourisme : nombre d''emplois dans le monde en pourcentage du total des emplois', 'Pourcentage (%)', 'BREN'),
('TOPI', 'Toursime: PIB du tourisme en milliards USD', 'Dollar (USD)', 'BREN'),
('TOPIT', 'Tourisme : part dans le PIB mondial en pourcentage', 'Pourcentage (%)', 'BREN'),
('TRAM', 'Transfert d''argent de migrants', 'Dollar (USD)', 'FNI'),
('TRCH', 'Transports : Chiffre d''affaires en milliards USD', 'Dollar (USD)', 'BREN'),
('TREM', 'Transport : emplois en million', 'Unité', 'BREN'),
('TREMT', 'Transport : part dans emploi en pourcentage du total emploi', 'Pourcentage (%)', 'BREN'),
('TREXT', 'Transport : part dans les exportations en milliards', 'Dollar (USD)', 'BREN'),
('TREXTP', 'Transport : part dans les exportations en pourcentage du total des exportations de services', 'Pourcentage (%)', 'BREN'),
('TRGE', 'Transport : grandes entreprises du secteur transport', 'Unité', 'BREN'),
('TRPIT', 'Transport : part dans le PIB en pourcentage du PIB', 'Pourcentage (%)', 'BREN'),
('VOHA', 'Voitures par habitant', 'Unité', 'CMNV');

-- --------------------------------------------------------

--
-- Structure de la table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `code_insti` varchar(4) NOT NULL COMMENT 'code de l''institution',
  `nom_insti` varchar(75) NOT NULL COMMENT 'nom de l''institution',
  `siege` varchar(75) NOT NULL COMMENT 'adresse du siège',
  `date_creation` date NOT NULL COMMENT 'date de création',
  `titre_resp` varchar(50) NOT NULL COMMENT 'titre du responsable',
  `nom_resp` varchar(50) NOT NULL COMMENT 'nom du responsable',
  `duree_mendat` int(11) NOT NULL COMMENT 'durée du mandat (en année)',
  `mission` text NOT NULL COMMENT 'mission de l''institution',
  `budget_insti` decimal(10,0) NOT NULL COMMENT 'budget de l''institution',
  `nbre_resp` int(11) NOT NULL COMMENT 'nombre de responsable',
  `nbre_ant_monde` int(11) NOT NULL COMMENT 'nombre d''antenne dans le monde',
  `nbre_ant_afrique` int(11) NOT NULL COMMENT 'nombre d''antenne dans l''afrique',
  PRIMARY KEY (`code_insti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  `nom_pays` varchar(50) NOT NULL COMMENT 'nom du pays',
  `zone_monde` varchar(4) NOT NULL COMMENT 'code d''une zone du monde',
  `zone_monet` varchar(15) DEFAULT NULL COMMENT 'code zone monetaire',
  `code_front` varchar(15) DEFAULT NULL COMMENT 'code frontière',
  PRIMARY KEY (`code_pays`),
  KEY `zone_monde_pays_fk` (`zone_monde`),
  KEY `zone_monet_pays_fk` (`zone_monet`),
  KEY `code_front_pays_fk` (`code_front`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`code_pays`, `nom_pays`, `zone_monde`, `zone_monet`, `code_front`) VALUES
('ABW', 'Aruba', 'AMSC', NULL, NULL),
('AFG', 'Afghanistan', 'MOYE', NULL, NULL),
('AGO', 'Angola', 'AFR', NULL, 'AFSS'),
('ALB', 'Albanie', 'REEU', NULL, NULL),
('AND', 'Andorre', 'REEU', NULL, NULL),
('ARE', 'Émirats arabes unis', 'MOYE', NULL, NULL),
('ARG', 'Argentine', 'AMSC', NULL, NULL),
('ARM', 'Arménie', 'COEI', NULL, NULL),
('ATG', 'Antigua-et-Barbuda', 'AMSC', NULL, NULL),
('AUS', 'Australie', 'OCE', NULL, NULL),
('AUT', 'Autriche', 'UNEU', NULL, NULL),
('AZE', 'Azerbaïdjan', 'COEI', NULL, NULL),
('BDI', 'Burundi', 'AFR', NULL, 'AFSS'),
('BEL', 'Belgique', 'UNEU', NULL, NULL),
('BEN', 'Bénin', 'AFR', 'UEMOA', 'AFSS'),
('BFA', 'Burkina Faso', 'AFR', 'UEMOA', 'AFSS'),
('BGD', 'Bangladesh', 'RESA', NULL, NULL),
('BGR', 'Bulgarie', 'UNEU', NULL, NULL),
('BHR', 'Bahreïn', 'RESA', NULL, NULL),
('BHS', 'Bahamas', 'AMSC', NULL, NULL),
('BIH', 'Bosnie-Herzégovine', 'REEU', NULL, NULL),
('BLR', 'Bélarus', 'COEI', NULL, NULL),
('BLZ', 'Belize', 'AMSC', NULL, NULL),
('BOL', 'Bolivie', 'AMSC', NULL, NULL),
('BRA', 'Brésil', 'AMSC', NULL, NULL),
('BRB', 'Barbade', 'AMSC', NULL, NULL),
('BRN', 'Brunéi Darussalam', 'ASSE', NULL, NULL),
('BTN', 'Bhoutan', 'RESA', NULL, NULL),
('BWA', 'Botswana', 'AFR', NULL, 'AFSS'),
('CAF', 'République centrafricaine', 'AFR', 'CEMAC', 'AFSS'),
('CAN', 'Canada', 'AMCN', NULL, NULL),
('CHE', 'Suisse', 'REEU', NULL, NULL),
('CHL', 'Chili', 'AMSC', NULL, NULL),
('CHN', 'Chine', 'ASES', NULL, NULL),
('CIV', 'Côte d''Ivoire', 'AFR', 'UEMOA', 'AFSS'),
('CMR', 'Cameroun', 'AFR', 'CEMAC', 'AFSS'),
('COD', 'République démocratique du Congo', 'AFR', NULL, 'AFSS'),
('COG', 'République du Congo', 'AFR', 'CEMAC', 'AFSS'),
('COL', 'Colombie', 'AMSC', NULL, NULL),
('COM', 'Comores', 'AFR', NULL, 'AFSS'),
('CPV', 'Cap Vert', 'AFR', NULL, 'AFSS'),
('CRI', 'Costa Rica', 'AMCN', NULL, NULL),
('CUB', 'Cuba', 'AMCN', NULL, NULL),
('CUW', 'Curacao', 'AMSC', NULL, NULL),
('CYP', 'Chypre', 'UNEU', NULL, NULL),
('CZE', 'République tchèque', 'UNEU', NULL, NULL),
('DEU', 'Allemagne', 'UNEU', NULL, NULL),
('DJI', 'Djibouti', 'AFR', NULL, 'AFSS'),
('DMA', 'Dominique', 'AMSC', NULL, NULL),
('DNK', 'Danemark', 'UNEU', NULL, NULL),
('DOM', 'République dominicaine', 'AMCN', NULL, NULL),
('DZA', 'Algérie', 'AFR', NULL, 'AFNS'),
('ECU', 'Équateur', 'AMSC', NULL, NULL),
('EGY', 'République arabe d’Égypte', 'AFR', NULL, 'AFNS'),
('ERI', 'Érythrée', 'AFR', NULL, NULL),
('ESP', 'Espagne', 'UNEU', NULL, NULL),
('EST', 'Estonie', 'UNEU', NULL, NULL),
('ETH', 'Éthiopie', 'AFR', NULL, 'AFSS'),
('FIN', 'Finlande', 'UNEU', NULL, NULL),
('FJI', 'Fidji', 'OCE', NULL, NULL),
('FRA', 'France', 'UNEU', NULL, NULL),
('FRO', 'Îles Féroé', 'REEU', NULL, NULL),
('FSM', 'États fédérés de Micronésie', 'OCE', NULL, NULL),
('GAB', 'Gabon', 'AFR', 'CEMAC', 'AFSS'),
('GBR', 'Royaume-Uni', 'UNEU', NULL, NULL),
('GEO', 'Géorgie', 'REEU', NULL, NULL),
('GHA', 'Ghana', 'AFR', NULL, 'AFSS'),
('GIN', 'Guinée', 'AFR', NULL, 'AFSS'),
('GMB', 'Gambie', 'AFR', NULL, 'AFSS'),
('GNB', 'Guinée-Bissau', 'AFR', 'UEMOA', 'AFSS'),
('GNQ', 'Guinée équatoriale', 'AFR', 'CEMAC', 'AFSS'),
('GRC', 'Grèce', 'UNEU', NULL, NULL),
('GRD', 'Grenade', 'AMSC', NULL, NULL),
('GTM', 'Guatemala', 'AMCN', NULL, NULL),
('GUY', 'Guyane', 'AMSC', NULL, NULL),
('HND', 'Honduras', 'AMCN', NULL, NULL),
('HRV', 'Croatie', 'UNEU', NULL, NULL),
('HTI', 'Haïti', 'AMSC', NULL, NULL),
('HUN', 'Hongrie', 'UNEU', NULL, NULL),
('IDN', 'Indonésie', 'ASSE', NULL, NULL),
('IND', 'Inde', 'RESA', NULL, NULL),
('IRL', 'Irlande', 'UNEU', NULL, NULL),
('IRN', 'République islamique d’Iran', 'MOYE', NULL, NULL),
('IRQ', 'Iraq', 'MOYE', NULL, NULL),
('ISL', 'Islande', 'REEU', NULL, NULL),
('ISR', 'Israël', 'MOYE', NULL, NULL),
('ITA', 'Italie', 'UNEU', NULL, NULL),
('JAM', 'Jamaïque', 'AMSC', NULL, NULL),
('JOR', 'Jordanie', 'MOYE', NULL, NULL),
('JPN', 'Japon', 'ASES', NULL, NULL),
('KAZ', 'Kazakhstan', 'COEI', NULL, NULL),
('KEN', 'Kenya', 'AFR', NULL, 'AFSS'),
('KGZ', 'République kirghize', 'COEI', NULL, NULL),
('KHM', 'Cambodge', 'ASSE', NULL, NULL),
('KIR', 'Kiribati', 'OCE', NULL, NULL),
('KNA', 'Saint-Kitts-et-Nevis', 'AMSC', NULL, NULL),
('KOR', 'République de Corée', 'ASES', NULL, NULL),
('KSV', 'Kosovo', 'REEU', NULL, NULL),
('KWT', 'Koweït', 'MOYE', NULL, NULL),
('LAO', 'République démocratique populaire lao', 'ASSE', NULL, NULL),
('LBN', 'Liban', 'MOYE', NULL, NULL),
('LBR', 'Libéria', 'AFR', NULL, 'AFSS'),
('LBY', 'Libye', 'AFR', NULL, 'AFNS'),
('LCA', 'Sainte-Lucie', 'AMSC', NULL, NULL),
('LIE', 'Liechtenstein', 'REEU', NULL, NULL),
('LKA', 'Sri Lanka', 'RESA', NULL, NULL),
('LSO', 'Lesotho', 'AFR', NULL, NULL),
('LTU', 'Lituanie', 'UNEU', NULL, NULL),
('LUX', 'Luxembourg', 'UNEU', NULL, NULL),
('LVA', 'Lettonie', 'UNEU', NULL, NULL),
('MAR', 'Maroc', 'AFR', NULL, 'AFNS'),
('MCO', 'Monaco', 'REEU', NULL, NULL),
('MDA', 'Moldova', 'COEI', NULL, NULL),
('MDG', 'Madagascar', 'AFR', NULL, 'AFSS'),
('MDV', 'Maldives', 'ASSE', NULL, NULL),
('MEX', 'Mexique', 'AMCN', NULL, NULL),
('MHL', 'Îles Marshall', 'OCE', NULL, NULL),
('MKD', 'Macédoine, ex-République yougoslave', 'REEU', NULL, NULL),
('MLI', 'Mali', 'AFR', 'UEMOA', 'AFSS'),
('MLT', 'Malte', 'UNEU', NULL, NULL),
('MMR', 'Myanmar', 'ASSE', NULL, NULL),
('MNE', 'Monténégro', 'REEU', NULL, NULL),
('MNG', 'Mongolie', 'COEI', NULL, NULL),
('MOZ', 'Mozambique', 'AFR', NULL, 'AFSS'),
('MRT', 'Mauritanie', 'AFR', NULL, 'AFSS'),
('MUS', 'Maurice', 'AFR', NULL, 'AFSS'),
('MWI', 'Malawi', 'AFR', NULL, 'AFSS'),
('MYS', 'Malaisie', 'ASSE', NULL, NULL),
('NAM', 'Namibie', 'AFR', NULL, 'AFSS'),
('NAU', 'Nauru', 'OCE', NULL, NULL),
('NER', 'Niger', 'AFR', 'UEMOA', 'AFSS'),
('NGA', 'Nigéria', 'AFR', NULL, 'AFSS'),
('NIC', 'Nicaragua', 'AMCN', NULL, NULL),
('NLD', 'Pays-Bas', 'UNEU', NULL, NULL),
('NOR', 'Norvège', 'UNEU', NULL, NULL),
('NPL', 'Népal', 'RESA', NULL, NULL),
('NZL', 'Nouvelle-Zélande', 'OCE', NULL, NULL),
('OMN', 'Oman', 'MOYE', NULL, NULL),
('PAK', 'Pakistan', 'RESA', NULL, NULL),
('PAN', 'Panama', 'AMCN', NULL, NULL),
('PER', 'Pérou', 'AMSC', NULL, NULL),
('PHL', 'Philippines', 'ASSE', NULL, NULL),
('PLW', 'Palaos', 'OCE', NULL, NULL),
('PNG', 'Papouasie-Nouvelle-Guinée', 'OCE', NULL, NULL),
('POL', 'Pologne', 'UNEU', NULL, NULL),
('PRK', 'République démocratique de Corée', 'ASES', NULL, NULL),
('PRT', 'Portugal', 'UNEU', NULL, NULL),
('PRY', 'Paraguay', 'AMSC', NULL, NULL),
('PSE', 'Cisjordanie et Gaza', 'MOYE', NULL, NULL),
('QAT', 'Qatar', 'MOYE', NULL, NULL),
('ROU', 'Roumanie', 'UNEU', NULL, NULL),
('RUS', 'Fédération de Russie', 'COEI', NULL, NULL),
('RWA', 'Rwanda', 'AFR', NULL, 'AFSS'),
('SAU', 'Arabie saoudite', 'MOYE', NULL, NULL),
('SDN', 'Soudan', 'AFR', NULL, 'AFSS'),
('SEN', 'Sénégal', 'AFR', 'UEMOA', 'AFSS'),
('SGP', 'Singapour', 'ASSE', NULL, NULL),
('SLB', 'Îles Salomon', 'OCE', NULL, NULL),
('SLE', 'Sierra Leone', 'AFR', NULL, 'AFSS'),
('SLV', 'El Salvador', 'AMCN', NULL, NULL),
('SMR', 'Saint-Marin', 'REEU', NULL, NULL),
('SOM', 'Somalie', 'AFR', NULL, 'AFSS'),
('SRB', 'Serbie', 'REEU', NULL, NULL),
('SSD', 'Soudan du Sud', 'AFR', NULL, 'AFSS'),
('STP', 'Sao Tomé-et-Principe', 'AFR', NULL, 'AFSS'),
('SUR', 'Suriname', 'AMCN', NULL, NULL),
('SVK', 'République slovaque', 'UNEU', NULL, NULL),
('SVN', 'Slovénie', 'UNEU', NULL, NULL),
('SWE', 'Suède', 'UNEU', NULL, NULL),
('SWZ', 'Swaziland', 'AFR', NULL, 'AFSS'),
('SYC', 'Seychelles', 'AFR', NULL, NULL),
('SYR', 'République arabe syrienne', 'MOYE', NULL, NULL),
('TCD', 'Tchad', 'AFR', 'CEMAC', 'AFSS'),
('TGO', 'Togo', 'AFR', 'UEMOA', 'AFSS'),
('THA', 'Thaïlande', 'ASSE', NULL, NULL),
('TJK', 'Tadjikistan', 'COEI', NULL, NULL),
('TKM', 'Turkménistan', 'COEI', NULL, NULL),
('TLS', 'Timor-Leste', 'OCE', NULL, NULL),
('TON', 'Tonga', 'OCE', NULL, NULL),
('TTO', 'Trinité-et-Tobago', 'AMCN', NULL, NULL),
('TUN', 'Tunisie', 'AFR', NULL, 'AFNS'),
('TUR', 'Turquie', 'REEU', NULL, NULL),
('TUV', 'Tuvalu', 'OCE', NULL, NULL),
('TZA', 'Tanzanie', 'AFR', NULL, 'AFSS'),
('UGA', 'Ouganda', 'AFR', NULL, 'AFSS'),
('UKR', 'Ukraine', 'REEU', NULL, NULL),
('URY', 'Uruguay', 'AMSC', NULL, NULL),
('USA', 'États-Unis', 'AMCN', NULL, NULL),
('UZB', 'Ouzbékistan', 'COEI', NULL, NULL),
('VCT', 'Saint-Vincent-et-les Grenadines', 'AMSC', NULL, NULL),
('VEN', 'Venezuela', 'AMSC', NULL, NULL),
('VNM', 'Viet Nam', 'ASSE', NULL, NULL),
('VUT', 'Vanuatu', 'OCE', NULL, NULL),
('WSM', 'Samoa', 'OCE', NULL, NULL),
('YEM', 'Yémen, Rép. du', 'MOYE', NULL, NULL),
('ZAF', 'Afrique du Sud', 'AFR', NULL, 'AFSS'),
('ZMB', 'Zambie', 'AFR', NULL, 'AFSS'),
('ZWE', 'Zimbabwe', 'AFR', NULL, 'AFSS');

-- --------------------------------------------------------

--
-- Structure de la table `pays_cera`
--

CREATE TABLE IF NOT EXISTS `pays_cera` (
  `code_cera` varchar(15) NOT NULL COMMENT 'code du cera',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  PRIMARY KEY (`code_cera`,`code_pays`),
  KEY `code_pays_cera_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays_cera`
--

INSERT INTO `pays_cera` (`code_cera`, `code_pays`) VALUES
('CEEAC', 'AGO'),
('SADC', 'AGO'),
('CEEAC', 'BDI'),
('COMESA', 'BDI'),
('EAC', 'BDI'),
('CEDEAO', 'BEN'),
('CENSAD', 'BEN'),
('CEDEAO', 'BFA'),
('CENSAD', 'BFA'),
('SADC', 'BWA'),
('CEEAC', 'CAF'),
('CENSAD', 'CAF'),
('CEDEAO', 'CIV'),
('CENSAD', 'CIV'),
('CEEAC', 'CMR'),
('CEEAC', 'COD'),
('COMESA', 'COD'),
('SADC', 'COD'),
('CEEAC', 'COG'),
('CENSAD', 'COM'),
('COMESA', 'COM'),
('CEDEAO', 'CPV'),
('CENSAD', 'DJI'),
('COMESA', 'DJI'),
('IGAD', 'DJI'),
('UMA', 'DZA'),
('CENSAD', 'EGY'),
('CENSAD', 'ERI'),
('COMESA', 'ERI'),
('IGAD', 'ERI'),
('COMESA', 'ETH'),
('IGAD', 'ETH'),
('CEEAC', 'GAB'),
('CEDEAO', 'GHA'),
('CENSAD', 'GHA'),
('CEDEAO', 'GIN'),
('CENSAD', 'GIN'),
('CEDEAO', 'GMB'),
('CENSAD', 'GMB'),
('CEDEAO', 'GNB'),
('CENSAD', 'GNB'),
('CEEAC', 'GNQ'),
('CENSAD', 'KEN'),
('COMESA', 'KEN'),
('EAC', 'KEN'),
('IGAD', 'KEN'),
('CEDEAO', 'LBR'),
('CENSAD', 'LBR'),
('CENSAD', 'LBY'),
('COMESA', 'LBY'),
('UMA', 'LBY'),
('SADC', 'LSO'),
('CENSAD', 'MAR'),
('UMA', 'MAR'),
('COMESA', 'MDG'),
('SADC', 'MDG'),
('CEDEAO', 'MLI'),
('CENSAD', 'MLI'),
('SADC', 'MOZ'),
('CENSAD', 'MRT'),
('UMA', 'MRT'),
('COMESA', 'MUS'),
('SADC', 'MUS'),
('COMESA', 'MWI'),
('SADC', 'MWI'),
('SADC', 'NAM'),
('CEDEAO', 'NER'),
('CENSAD', 'NER'),
('CEDEAO', 'NGA'),
('CENSAD', 'NGA'),
('COMESA', 'RWA'),
('EAC', 'RWA'),
('CENSAD', 'SDN'),
('COMESA', 'SDN'),
('IGAD', 'SDN'),
('CEDEAO', 'SEN'),
('CENSAD', 'SEN'),
('CEDEAO', 'SLE'),
('CENSAD', 'SLE'),
('CENSAD', 'SOM'),
('IGAD', 'SOM'),
('COMESA', 'SSD'),
('IGAD', 'SSD'),
('CEEAC', 'STP'),
('CENSAD', 'STP'),
('COMESA', 'SWZ'),
('SADC', 'SWZ'),
('COMESA', 'SYC'),
('SADC', 'SYC'),
('CEEAC', 'TCD'),
('CENSAD', 'TCD'),
('CEDEAO', 'TGO'),
('CENSAD', 'TGO'),
('CENSAD', 'TUN'),
('UMA', 'TUN'),
('EAC', 'TZA'),
('SADC', 'TZA'),
('COMESA', 'UGA'),
('EAC', 'UGA'),
('IGAD', 'UGA'),
('SADC', 'ZAF'),
('COMESA', 'ZMB'),
('SADC', 'ZMB'),
('COMESA', 'ZWE'),
('SADC', 'ZWE');

-- --------------------------------------------------------

--
-- Structure de la table `pays_ecosysteme`
--

CREATE TABLE IF NOT EXISTS `pays_ecosysteme` (
  `code_zone` varchar(6) NOT NULL COMMENT 'code de la zone d''écosystème',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  PRIMARY KEY (`code_zone`,`code_pays`),
  KEY `code_pays_ecosysteme_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays_ecosysteme`
--

INSERT INTO `pays_ecosysteme` (`code_zone`, `code_pays`) VALUES
('CFFS', 'AGO'),
('OCAT', 'AGO'),
('CFFS', 'BDI'),
('UCGL', 'BDI'),
('ZONL', 'BDI'),
('CFFS', 'BEN'),
('CILS', 'BEN'),
('OCAT', 'BEN'),
('ZONI', 'BEN'),
('APGMV', 'BFA'),
('CFFS', 'BFA'),
('CILS', 'BFA'),
('CFFS', 'BWA'),
('KALA', 'BWA'),
('BALT', 'CAF'),
('CFFS', 'CAF'),
('UCGL', 'CAF'),
('CFFS', 'CIV'),
('CILS', 'CIV'),
('OCAT', 'CIV'),
('BALT', 'CMR'),
('CFFS', 'CMR'),
('OCAT', 'CMR'),
('UCGL', 'CMR'),
('AFMO', 'COD'),
('CFFS', 'COD'),
('OCAT', 'COD'),
('UCGL', 'COD'),
('ZONL', 'COD'),
('CFFS', 'COG'),
('OCAT', 'COG'),
('UCGL', 'COG'),
('CFFS', 'COM'),
('OCIN', 'COM'),
('CFFS', 'CPV'),
('CILS', 'CPV'),
('OCAT', 'CPV'),
('PAIA', 'CPV'),
('APGMV', 'DJI'),
('CFFS', 'DJI'),
('MERO', 'DJI'),
('BALT', 'DZA'),
('DEAF', 'DZA'),
('MERM', 'DZA'),
('DEAF', 'EGY'),
('MERM', 'EGY'),
('MERO', 'EGY'),
('ZONL', 'EGY'),
('APGMV', 'ERI'),
('CFFS', 'ERI'),
('MERO', 'ERI'),
('ZONL', 'ERI'),
('AFMO', 'ETH'),
('APGMV', 'ETH'),
('CFFS', 'ETH'),
('ZONL', 'ETH'),
('CFFS', 'GAB'),
('OCAT', 'GAB'),
('UCGL', 'GAB'),
('CFFS', 'GHA'),
('OCAT', 'GHA'),
('CFFS', 'GIN'),
('CILS', 'GIN'),
('OCAT', 'GIN'),
('ZONI', 'GIN'),
('CFFS', 'GMB'),
('CILS', 'GMB'),
('OCAT', 'GMB'),
('CFFS', 'GNB'),
('CILS', 'GNB'),
('OCAT', 'GNB'),
('CFFS', 'GNQ'),
('OCAT', 'GNQ'),
('PAIA', 'GNQ'),
('AFMO', 'KEN'),
('CFFS', 'KEN'),
('ZONL', 'KEN'),
('CFFS', 'LBR'),
('OCAT', 'LBR'),
('BALT', 'LBY'),
('DEAF', 'LBY'),
('MERM', 'LBY'),
('CFFS', 'LSO'),
('DEAF', 'MAR'),
('MERM', 'MAR'),
('OCAT', 'MAR'),
('CFFS', 'MDG'),
('OCIN', 'MDG'),
('PAIA', 'MDG'),
('APGMV', 'MLI'),
('CFFS', 'MLI'),
('CILS', 'MLI'),
('ZONI', 'MLI'),
('CFFS', 'MOZ'),
('APGMV', 'MRT'),
('CILS', 'MRT'),
('DEAF', 'MRT'),
('OCAT', 'MRT'),
('CFFS', 'MUS'),
('OCIN', 'MUS'),
('PAIA', 'MUS'),
('CFFS', 'MWI'),
('CFFS', 'NAM'),
('KALA', 'NAM'),
('NABI', 'NAM'),
('OCAT', 'NAM'),
('APGMV', 'NER'),
('BALT', 'NER'),
('CFFS', 'NER'),
('CILS', 'NER'),
('DEAF', 'NER'),
('ZONI', 'NER'),
('APGMV', 'NGA'),
('BALT', 'NGA'),
('CFFS', 'NGA'),
('ZONI', 'NGA'),
('AFMO', 'RWA'),
('CFFS', 'RWA'),
('UCGL', 'RWA'),
('ZONL', 'RWA'),
('APGMV', 'SDN'),
('BALT', 'SDN'),
('DEAF', 'SDN'),
('MERO', 'SDN'),
('ZONL', 'SDN'),
('APGMV', 'SEN'),
('CFFS', 'SEN'),
('CILS', 'SEN'),
('OCAT', 'SEN'),
('CFFS', 'SLE'),
('OCAT', 'SLE'),
('CFFS', 'SOM'),
('CFFS', 'SSD'),
('ZONL', 'SSD'),
('CFFS', 'STP'),
('OCAT', 'STP'),
('PAIA', 'STP'),
('CFFS', 'SWZ'),
('CFFS', 'SYC'),
('OCIN', 'SYC'),
('APGMV', 'TCD'),
('BALT', 'TCD'),
('CFFS', 'TCD'),
('CILS', 'TCD'),
('DEAF', 'TCD'),
('CFFS', 'TGO'),
('CILS', 'TGO'),
('OCAT', 'TGO'),
('DEAF', 'TUN'),
('MERM', 'TUN'),
('AFMO', 'TZA'),
('CFFS', 'TZA'),
('UCGL', 'TZA'),
('ZONL', 'TZA'),
('AFMO', 'UGA'),
('CFFS', 'UGA'),
('ZONL', 'UGA'),
('CFFS', 'ZAF'),
('KALA', 'ZAF'),
('OCAT', 'ZAF'),
('CFFS', 'ZMB'),
('CFFS', 'ZWE');

-- --------------------------------------------------------

--
-- Structure de la table `pays_harmo`
--

CREATE TABLE IF NOT EXISTS `pays_harmo` (
  `code_harmo` varchar(15) NOT NULL COMMENT 'code d''harmonisation de droit',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  PRIMARY KEY (`code_harmo`,`code_pays`),
  KEY `code_pays_harmo_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays_harmo`
--

INSERT INTO `pays_harmo` (`code_harmo`, `code_pays`) VALUES
('CIMA', 'BEN'),
('OHADA', 'BEN'),
('CIMA', 'BFA'),
('OHADA', 'BFA'),
('CIMA', 'CAF'),
('OHADA', 'CAF'),
('CIMA', 'CIV'),
('OHADA', 'CIV'),
('CIMA', 'CMR'),
('OHADA', 'CMR'),
('OHADA', 'COD'),
('CIMA', 'COG'),
('OHADA', 'COG'),
('OHADA', 'COM'),
('CIMA', 'GAB'),
('OHADA', 'GAB'),
('OHADA', 'GIN'),
('CIMA', 'GNB'),
('OHADA', 'GNB'),
('CIMA', 'GNQ'),
('OHADA', 'GNQ'),
('CIMA', 'MLI'),
('OHADA', 'MLI'),
('CIMA', 'NER'),
('OHADA', 'NER'),
('CIMA', 'SEN'),
('OHADA', 'SEN'),
('CIMA', 'TCD'),
('OHADA', 'TCD'),
('CIMA', 'TGO'),
('OHADA', 'TGO');

-- --------------------------------------------------------

--
-- Structure de la table `pays_indicateur`
--

CREATE TABLE IF NOT EXISTS `pays_indicateur` (
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  `code_indic` varchar(6) NOT NULL COMMENT 'code d''indicateur',
  `1960` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1961` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1962` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1963` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1964` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1965` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1966` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1967` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1968` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1969` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1970` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1971` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1972` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1973` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1974` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1975` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1976` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1977` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1978` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1979` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1980` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1981` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1982` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1983` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1984` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1985` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1986` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1987` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1988` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1989` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1990` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1991` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1992` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1993` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1994` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1995` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1996` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1997` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1998` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `1999` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2000` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2001` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2002` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2003` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2004` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2005` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2006` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2007` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2008` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2009` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2010` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2011` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2012` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2013` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  `2014` varchar(100) DEFAULT NULL COMMENT 'valeur de l''année',
  PRIMARY KEY (`code_indic`,`code_pays`),
  KEY `code_pays_indicateur_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays_indicateur`
--

INSERT INTO `pays_indicateur` (`code_pays`, `code_indic`, `1960`, `1961`, `1962`, `1963`, `1964`, `1965`, `1966`, `1967`, `1968`, `1969`, `1970`, `1971`, `1972`, `1973`, `1974`, `1975`, `1976`, `1977`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1984`, `1985`, `1986`, `1987`, `1988`, `1989`, `1990`, `1991`, `1992`, `1993`, `1994`, `1995`, `1996`, `1997`, `1998`, `1999`, `2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`) VALUES
('ABW', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1330167597.76536', '1320670391.06145', '1379888268.15642', '1531843575.41899', '1665363128.49162', '1722798882.68156', '1873452513.96648', '1920262569.8324', '1941094972.06704', '2021301675.97765', '2228279329.60894', '2331005586.59218', '2421474860.3352', '2623726256.98324', '2791960893.85475', '2498932960.89385', '2467703910.61453', '2584463687.15084', NULL, NULL, NULL),
('AFG', 'PIBC', '537777811.911111', '548888894.577778', '546666678.044444', '751111190.755556', '800000045.511111', '1006666638.22222', '1399999965.86667', '1673333418.66667', '1373333367.46667', '1408888923.02222', '1748886596.26667', '1831108972.08889', '1595555475.91111', '1733333265.06667', '2155555498.66667', '2366666615.46667', '2555555566.93333', '2953333418.66667', '3300000108.08889', '3697940345.14177', '3641723447.18433', '3478787909.81818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2461666314.78366', '4128818042.25508', '4583648921.64112', '5285461999.33739', '6275076016.47174', '7057597614.45076', '9843851009.41462', '10190534636.6444', '12486950468.1773', '15936784437.224', '17870159081.787', '20506795254.4884', '20309671014.6236', NULL),
('AGO', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6804278062.62664', '6355849179.35458', '7383121653.67413', '7975234067.37627', '9283054576.2006', '10260193360.6806', '12193746624.6789', '5779394291.7582', '5285600050.3455', '4059352153.05368', '5039552482.42778', '7526446605.51712', '7648377412.83277', '6445041824.66621', '6152922942.98032', '9129594818.60749', '8936079252.77131', '12497346042.1583', '14188949239.8883', '19640862549.9734', '28233699333.6996', '41789493191.7536', '60448887582.7354', '84178084135.3609', '75492416522.9248', '82470894868.3337', '104115867663.458', '115341559475.426', '124178241815.737', NULL),
('ALB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1924242453.00793', '1965384586.2409', '2173750012.5', '2156624900', '2126000000', '2335124987.5', '2101624962.5', '1139166676.01094', '709452572.338241', '1228071037.84446', '1985673026.02143', '2424498953.26963', '3013217853.03299', '2196223713.70143', '2727745453.16221', '3434402453.29471', '3686649386.83962', '4091020249.1995', '4449373455.28143', '5652325081.83146', '7464446950.18143', '8376483393.94155', '9132558096.86514', '10701011524.0982', '12881353507.8539', '12044208085.864', '11926957254.6288', '12890866742.6533', '12344529628.0617', '12923240278.3416', NULL),
('AND', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '78617570.3229253', '89406659.5140116', '113414331.870944', '150841699.110766', '186557164.008677', '220112850.775998', '227284165.925171', '253998069.145235', '308020384.39595', '411548246.761169', '446377494.880496', '388983013.897495', '375914742.918141', '327849949.00321', '330073024.937292', '346742901.743383', '481996232.885864', '611300198.45912', '721426027.475386', '795489397.964069', '1028989439.40715', '1106890942.98847', '1209992604.28817', '1007090896.43735', '1017544619.09316', '1178745261.82826', '1224023469.69136', '1180646037.01274', '1211953953.56155', '1239840265.63345', '1133644294.5425', '1264760246.44075', '1456198796.29382', '1917948475.27513', '2322163502.26295', '2539759285.92747', '2823503852.62328', '3245411583.7197', '3712034266.50674', NULL, NULL, NULL, NULL, NULL, NULL),
('ARE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14720672892.0843', '19213022856.0617', '24871774865.6257', '23775831263.3068', '31225462774.4732', '43598747466.6017', '49333424083.8485', '46622718556.8369', '42803323300.6587', '41807954192.4585', '40603650189.3515', '33943612059.5247', '36384908706.4022', '36275674165.5187', '41464995870.8318', '50701443695.6113', '51552165568.876', '54239171831.4067', '55625170195.5344', '59305093918.2154', '65743666507.5477', '73571233919.7352', '78839008362.6404', '75674338444.807', '84445475523.1266', '104337375342.526', '103311643522.892', '109816204634.494', '124346361618.639', '147824374542.517', '180617023539.137', '222105928740.596', '257916140791.417', '315474644818.136', '253547454485.551', '286049293398.983', '347454060299.355', '372313965706.545', '402340106795.685', NULL),
('ARG', 'PIBC', NULL, NULL, '24450604877.6081', '18272123664.4715', '25605249381.7597', '28344705967.5816', '28630474726.3365', '24256667554.62', '26436857248.0056', '31256284544.7361', '31584210364.5523', '33293199094.6727', '34733000536.4685', '52544000117.2532', '72436777341.9953', '52438647921.8723', '51169499890.7757', '56781000100.9442', '58082870156.265', '69252328953.3803', '76961923741.9469', '78676842366.4213', '84307486836.724', '103979106777.911', '79092001998.032', '88416668900.2596', '110934442762.694', '111106191358.197', '126206817196.091', '76636898036.4712', '141352368714.691', '189719989668.103', '228779382768.151', '236753563469.871', '257440000000', '258031750000', '272149750000', '292859000000', '298948250000', '283523000000', '284203750000', '268696750000', '102040286874.385', '129597154256.313', '183295704305.31', '222907566120.932', '264489701813.206', '329761480066.765', '406003733832.97', '378496221140.697', '462703793707.187', '557727273772.913', '603153016502.593', '609888971036.196', NULL),
('ARM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2256838858.42714', '2068526521.90299', '1272577521.7683', '1201313196.45626', '1315158670.47971', '1468317350.02343', '1596968913.19202', '1639492424.38103', '1893726437.35976', '1845482181.48539', '1911563665.39006', '2118467913.37873', '2376335048.39976', '2807061008.69084', '3576615240.41616', '4900436758.50466', '6384457744.44765', '9206301700.39619', '11662040713.8753', '8647936747.98704', '9260287416.06014', '10142342769.9464', '9958217880.33776', '10432169571.25', NULL),
('ATG', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '66144443.2762914', '74855554.2335588', '92240739.1117105', '110066664.722819', '124462960.764868', '137951849.415534', '153270367.663518', '173511108.046794', '201862959.397935', '245896291.953611', '286474069.01476', '338696290.314704', '373403697.109157', '391570363.454988', '410388881.64116', '423762955.479039', '456537028.974302', '500088880.057001', '494185176.45756', '541074064.518361', '579851841.611299', '620037026.086788', '651851840.339733', '783837838.008776', '773765171.519999', '802529319.160154', '839996355.5355', '898356132.282607', '997374093.496849', '1135143572.54523', '1289254310.56428', '1347349851.85185', '1206410370.37037', '1135539037.03704', '1129918370.37037', '1204713111.11111', '1200587518.51852', NULL),
('AUS', 'PIBC', '18574308433.1952', '19651696718.5575', '19886885429.4994', '21500727965.0577', '23758539590.0997', '25930115354.463', '27255011759.4355', '30383021614.9625', '32647552917.46', '36612162616.1944', '41252099899.2048', '45127113898.5329', '51936915887.8505', '63700192184.4971', '88789977892.4097', '97098183804.4517', '104832976175.47', '110115852259.693', '118238213399.504', '134607520163.581', '149679108635.098', '176557529316.15', '193684210526.316', '176929340196.537', '193232204310.813', '180215540385.058', '182032736429.771', '189113287453.679', '235787252619.325', '299474798469.18', '310944978838.015', '325641629385.449', '325313389217.873', '312028527262.507', '322874437910.758', '368022720522.721', '401409711684.37', '435636249804.351', '399325103438.92', '388692192004.011', '414987125541.669', '378488247289.9', '394250732524.069', '466451368666.278', '612871674491.393', '693338595699.895', '747205750224.618', '853441155688.153', '1055031652298.47', '926283274398.266', '1141267760188.09', '1388066356092.35', '1534425905762.81', '1560372473125.21', NULL),
('AUT', 'PIBC', '6592693841.18495', '7311749633.36229', '7756110210.11966', '8374175257.73075', '9169983885.71185', '9994070615.85997', '10887682273.1014', '11579431668.9165', '12440625312.8685', '13582798556.2404', '15335972267.7957', '17815464919.0439', '22006470861.3608', '29444365310.2818', '35104529078.3274', '39962704274.3146', '42856485617.8569', '51421585629.8393', '61902774945.5131', '73759181883.685', '81861232822.8037', '70863106877.484', '71103585383.5605', '71947277233.032', '67821568599.1335', '69219621907.4222', '98797587381.7035', '123869321397.475', '133018182770.534', '132785154342.174', '166062376739.683', '173375508073.07', '194608183696.469', '189921096652.076', '203044926876.28', '240457622492.152', '236720496490.772', '212323463750.141', '217683626056.025', '216725261027.062', '196421706283.398', '196953628635.347', '212970685111.989', '260721478555.305', '299870270001.8', '314641160523.305', '334292246560.363', '386439116524.953', '427627368047.362', '397570327085.094', '389656071767.183', '429099514393.36', '407575161127.056', '428321897648.215', NULL),
('AZE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8858006035.91566', '8792365810.5094', '4991350457.5425', '3973027396.65195', '3313739673.54738', '3052467522.36104', '3176749593.11788', '3962710163.11167', '4446396217.63265', '4581222442.45783', '5272617196.04517', '5707618246.56848', '6236024951.20423', '7275766111.24309', '8680511918.49357', '13245421880.834', '20982270733.2484', '33050343782.7759', '48852482960.0779', '44291490420.5026', '52902703376.1056', '65951627200.2026', '68730906313.6456', '73560484384.9586', NULL),
('BDI', 'PIBC', '195999989.76', '202999992.32', '213500006.4', '232749998.08', '260750008.32', '158994962.962963', '165444571.428571', '178297142.857143', '183200000', '190205714.285714', '242732571.428571', '252842285.714286', '246804571.428571', '304339839.552146', '345263492.063492', '420986666.666667', '448412753.623188', '547535555.555556', '610225555.555556', '782496666.666667', '919726666.666667', '969046666.666667', '1013222222.22222', '1082926304.46477', '987143931.166987', '1149979285.77347', '1201725497.06578', '1131466494.01101', '1082403219.48787', '1113924130.41149', '1132101252.51817', '1167398478.3459', '1083037670.62404', '938632612.059308', '925030590.280334', '1000428393.94934', '869033856.317093', '972896267.915425', '893770806.077641', '808077223.365746', '870486065.858218', '876794723.02267', '825394484.361648', '784654423.603171', '915257323.428255', '1117254387.10035', '1273180655.19805', '1356078300.12373', '1611634286.34081', '1739781535.88738', '2026864414.46871', '2355652063.58605', '2472384864.14914', '2714507030.9757', NULL),
('BEL', 'PIBC', '11658722590.99', '12400145221.595', '13264015675.3193', '14260017387.0492', '15960106680.6732', '17371457607.9374', '18651883472.4808', '19992040788.4593', '21376353113.475', '23710735894.7022', '26807913271.4804', '29935244716.7174', '37351139125.653', '47925645622.0244', '56246494096.9345', '65928340353.1864', '71384738035.5277', '83155421722.0034', '101632148072.243', '116758473170.061', '127312375086.219', '105128908518.036', '92446696803.8142', '87516301459.5661', '83666987224.239', '86596838575.9902', '120475908524.472', '149963409292.274', '162917260010.971', '164846533579.034', '206113804563.013', '211312782752.51', '235675876286.073', '225577704407.649', '245816831926.694', '289122605363.985', '280791270358.306', '254099345963.013', '259822627250.5', '259666631152.781', '237336281555.187', '237397315436.242', '258390080933.559', '318573363431.151', '370461343614.386', '386944983335.821', '410678121494.634', '472284546030.008', '520109349524.799', '485803883922.954', '484404271608.088', '528237749142.039', '498853259612.046', '524805525215.191', NULL),
('BEN', 'PIBC', '226195578.067006', '235668220.872225', '236434954.341059', '253927697.573028', '269819005.7911', '289908680.180677', '302925235.69743', '306221953.364724', '326323105.58513', '330748244.092696', '333627713.462036', '335073027.92408', '410331856.237969', '504376074.065261', '554654861.53714', '676870139.263848', '698408261.141673', '750049780.163916', '928843468.468714', '1186231018.35731', '1405251843.78221', '1291120190.56764', '1267778671.52033', '1095348199.36832', '1051134009.29975', '1045712789.8201', '1336102026.99646', '1562412225.8134', '1620246084.77733', '1502294413.87362', '1959965330.47596', '1986437797.87672', '1695315185.76863', '2274558078.74486', '1598075944.85876', '2169627138.34967', '2361116448.13525', '2268301645.09367', '2455092688.14767', '2488892429.46861', '2359122302.69574', '2499269391.07586', '2807657386.39431', '3557229701.84629', '4050869967.87842', '4358015992.82041', '4705087452.182', '5511880905.94973', '6633463906.71573', '6584477484.57378', '6561782312.61826', '7289779658.41287', '7543183758.87361', '8307222087.28038', NULL),
('BFA', 'PIBC', '330442817.168859', '350247237.11684', '379567178.256898', '394040749.12567', '410321785.631059', '422916848.424208', '433889831.584706', '450753993.176448', '460442864.205949', '478298781.545658', '458404330.125096', '482411278.982439', '578595583.975723', '674773821.151416', '751133642.647461', '939972703.463021', '976547572.215824', '1131225278.77773', '1475584037.28156', '1748480982.18517', '1928720390.28869', '1775842679.94056', '1754450379.2077', '1600278756.43589', '1459880352.6483', '1552493413.98989', '2036303381.20142', '2369835438.62393', '2616040645.87263', '2615588545.68629', '3101301780.95067', '3135045684.1006', '2240264711.54816', '2332018010.55341', '1895290964.80829', '2379518099.2266', '2586550747.09844', '2447669403.89018', '2804902723.73145', '3014665728.76264', '2632700362.73684', '2812845513.57125', '3205592289.79773', '4205691222.11396', '4838551099.70985', '5462709498.45119', '5844669845.53733', '6755825096.96584', '8350711425.41444', '8348157993.60507', '8992678844.36386', '10755561750.2607', '11611888158.0097', '12884922231.0557', NULL),
('BGD', 'PIBC', '4274893913.46431', '4817580183.56657', '5081413339.74945', '5319458351.12372', '5386054619.31076', '5906636556.95802', '6439687598.27648', '7253575399.26882', '7483685473.4584', '8471006100.89247', '8992721809.32801', '8751842839.73302', '6288245866.66667', '8067027097.60727', '12459282562.5', '19395903921.2304', '10083163546.7397', '9632469658.06452', '13299358551.4369', '15585961412.6833', '18114645161.2903', '19762945710.3026', '18087000000', '17155798869.2788', '19670160943.9185', '21613230769.2308', '21160234383.6785', '23781404932.2913', '25638749373.0508', '26825240347.4086', '30128776344.9379', '30957444766.9844', '31708863729.6566', '33166530060.9539', '33768661427.1044', '37939752959.0613', '40666015641.7747', '42318798536.6116', '44091754147.5771', '45694072379.3677', '47124925462.1348', '46987842846.553', '47571130071.3913', '51913661485.3195', '56560744012.2303', '60277560975.6098', '71819088743.2996', '79611888213.148', '91631278239.3237', '102477791472.39', '115279077465.226', '128637938711.386', '133355744562.539', '149990454541.474', NULL),
('BGR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20039627960.2947', '20056236991.8554', '19804095111.9229', '16959385509.1278', '17411159923.2394', '17562123350.1716', '20261212466.5553', '28429027975.8141', '23002458744.8485', '21746812560.0739', '20726301369.863', '10943548723.7608', '10371900499.4574', '10831999516.8061', '9704877673.48824', '13069094969.2947', '10110256626.4722', '11195830236.5819', '14631307232.6115', '13659823835.2119', '13353530517.1247', '14303810794.543', '16343311506.9812', '21101364344.6644', '25919754936.1945', '29300588272.6637', '33649638299.2368', '43634648380.0994', '53316401914.5913', '50161405416.9332', '48669060511.7098', '55765057234.2695', '52588115104.1324', '54479873099.8914', NULL),
('BHR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3072698345.80565', '3467819352.78404', '3645744805.68489', '3735106510.87238', '3905585155.0076', '3651861912.27732', '3052393636.4318', '3392021222.52906', '3702393658.68843', '3863564047.18578', '4229787378.87456', '4616223477.21288', '4751063992.46825', '5200266050.40256', '5567553552.34054', '5849468115.18505', '6101861655.74214', '6349202600.38155', '6183941092.316', '6621186419.4161', '9063147900.87911', '8976446419.94569', '9632411109.08315', '11075116593.9503', '13150516509.0487', '15969151305.8362', '18505545360.2489', '21730577940.9027', '25711151182.4594', '22938462111.2991', '25713544824.9449', '29044378131.6823', '30756789965.8507', '32890110533.0908', NULL),
('BHS', 'PIBC', '169802257.755072', '190096176.551435', '212252822.19384', '237742768.508112', '266664053.749305', '300392162.479928', '340000006.35783', '390196085.727844', '444901969.103758', '528137264.777864', '538423167.528913', '573400000', '590900000', '670900000', '632400000', '596200000', '642100000', '713000000', '832400000', '1139800100', '1335300000', '1426500000', '1578300000', '1732800000', '2041100000', '2320699900', '2472500000', '2713999900', '2817900000', '3062000000', '3166000000', '3111160000', '3109000000', '3092000000', '3259000000', '3429000000', '3609000000', '4961119000', '5353524000', '6019972000', '6327552000', '6516651000', '6957996000', '6949317000', '7094413000', '7706222000', '7965588000', '8318996000', '8246650000', '7820420000', '7910000000', '7931000000', '8219000000', '8420000000', NULL),
('BIH', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1255802465.43943', '1866572973.11395', '2786045391.91109', '3671816537.75935', '4116699576.17583', '4685729738.56209', '5505984455.95855', '5748990554.79945', '6651226179.01829', '8370020196.19158', '10022840634.9206', '10903779487.5056', '12550175101.0198', '15441062281.3156', '18711890353.5051', '17264893103.2034', '16847493058.8474', '18318439121.4727', '16906005781.1063', '17851326454.4159', NULL),
('BLR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17369598958.1159', '17813389815.004', '17022180272.211', '16280372553.0518', '14931599418.4226', '13972637603.2102', '14756861538.4615', '14128412417.193', '15222014828.3039', '12138485328.6267', '12736856485.1068', '12354820143.8849', '14594925392.9691', '17825436034.5366', '23141587717.7633', '30210091836.8294', '36961918858.7385', '45275711995.825', '60763483146.0674', '49208656976.0389', '55220932613.958', '59734593904.6402', '63615445566.8483', '71709513654.3393', NULL),
('BLZ', 'PIBC', '28072504.9840856', '29965035.3920036', '31857562.9999186', '33750090.6078336', '36194610.8013962', '40069931.5396865', '44405596.034382', '47379308.7867437', '44910180.7948118', '47305390.4372017', '53233534.3021169', '59207317.5896141', '66062499.015592', '78343558.5113933', '103216371.966438', '118066302.075032', '96905828.767564', '117650000', '136300000', '151800000', '194750000', '192900000', '179250000', '189000000', '210900000', '209150000', '227850000', '276550016', '314900000', '363150016', '413049984', '444720726.46485', '518143678.4859', '559759653.31005', '580760211.26315', '620031771.8577', '641271333.3631', '654198121.10575', '688872472.7248', '732607993.76895', '831750000', '871840755.39675', '932676403.18105', '990350000', '1057850000', '1114202700', '1217442150', '1290542550', '1368625150', '1336957250', '1397113450', '1487005600', '1573867300', '1624294250', NULL),
('BOL', 'PIBC', '563110051.920733', '612518906.826491', '669722541.277818', '721142957.311474', '812543072.505384', '908874537.037037', '994044553.872054', '1084059814.81481', '908874537.037037', '964615698.653199', '1017171717.17172', '1095454545.45455', '1257615644.97932', '1263018490.75462', '2100249875.06247', '2404697651.17441', '2732083958.02099', '3227436281.85907', '3758220889.55522', '4421343606.18135', '4537487842.57749', '5891606676.18271', '5594118400.16731', '5422656261.71049', '6169481549.37482', '5377277406.71638', '3959379487.6064', '4347956298.51327', '4597615562.66594', '4715978868.21613', '4867582620.20708', '5343259388.76337', '5643864407.82255', '5734703452.22129', '5981218996.99601', '6715164550.84431', '7396952081.04662', '7925733785.53783', '8497499333.04659', '8285061618.15839', '8397858184.79382', '8141513292.12402', '7905485216.17852', '8082396525.99433', '8773451738.91129', '9549196255.88892', '11451845341.2441', '13120183156.7149', '16674324634.2373', '17339992165.2422', '19649631308.1648', '23948541156.1194', '27035110130.246', '30601157742.4023', NULL),
('BRA', 'PIBC', '15165569912.5199', '15236854859.469', '19926293839.0163', '23021477292.2093', '21211892259.9904', '21790035102.382', '27062716510.5085', '30591834045.3823', '33875881906.0553', '37458898265.2258', '42327600115.9852', '49204456711.657', '58539008795.7658', '79279057736.1044', '105136007544.771', '123709376566.885', '152678020453.114', '176171284305.289', '200800891871.957', '224969488839.356', '235024598984.118', '263561088975.615', '281682304160.256', '203304515490.695', '209023912696.764', '222942790435.318', '268137224729.724', '294084112392.657', '330397381998.489', '425595310000', '461951782000', '407337832905.405', '390566551483.761', '438299504406.263', '546233380259.659', '768951297894.977', '839682618644.911', '871200342859.687', '843827363149.355', '586862640399.442', '644701831101.394', '553582178386.192', '504221228974.035', '552469288267.793', '663760341880.342', '882185702547.247', '1088916819852.94', '1366823994658.72', '1653508561457.08', '1620188056416.93', '2143067871759.89', '2476694763271.16', '2248780912395.68', '2245673032353.76', NULL),
('BRB', 'PIBC', '87383113.7082563', '93216432.3803695', '96949756.330522', '109083059.168518', '108383060.927864', '114683045.097089', '123608022.665682', '137103729.870016', '137300000', '154400000', '181500000', '204010328.888222', '233383639.978896', '284759098.097978', '340492903.658634', '402158285.756234', '435871861.918538', '495116619.265309', '552876225.283913', '670312672.251523', '860438453.32038', '946949724.873939', '989409791.650169', '1050464828.03944', '1144931025.91334', '1198180245.50696', '1315567052.9401', '1448665027.59519', '1540893882.55387', '1703922714.56329', '2023318164.38209', '2007109742.66963', '1950900000', '2046188943.48556', '2151295089.19152', '2261969772.41831', '2411872813.71606', '2549296364.67692', '2874459180.62627', '3012031888.84215', '3119500000', '3112350000', '3168600000', '3271200000', '3509700000', '3891500000', '4314050000', '4513250000', '4541550000', '4592650000', '4433700000', '4368900000', '4224850000', NULL, NULL),
('BRN', 'PIBC', NULL, NULL, NULL, NULL, NULL, '114040245.655299', '132758395.400497', '139030445.576898', '160819286.554292', '161211289.690318', '179080099.307461', '197523179.241883', '270818555.823521', '433092003.579273', '1073577085.64159', '1168304305.65513', '1423061356.64562', '1732721160.94122', '1941600703.60598', '2803780005.51826', '4928824957.9675', '4366213849.57637', '4264252336.4486', '3844723142.45149', '3782523088.4628', '3523612563.06532', '2358592817.12134', '2754463437.79677', '2690717551.18267', '2985467989.54007', '3520551724.13793', '3701667052.55846', '4183548189.07305', '4105706151.75145', '4087337959.93191', '4734020036.68689', '5115602836.87943', '5197332974.13793', '4051147227.53346', '4600000000', '6001153317.86543', '5601090584.36122', '5843329101.97699', '6557333067.38606', '7872333197.25476', '9531402829.84859', '11470703002.0769', '12247694247.2298', '14393099068.5859', '10732366286.2643', '12369708858.9029', '16691360399.1059', '16953952625.403', '16111135788.9616', NULL),
('BTN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '135653295.165394', '146391639.722864', '148934334.038055', '165585940.594059', '169264991.197183', '172217502.021019', '201375725.614592', '253182453.703704', '283855833.333333', '275949889.09427', '299787275.842376', '250045839.929639', '250794359.567901', '235239570.350935', '270801565.189672', '303053462.843047', '316420860.852385', '365964500.137703', '376955087.251575', '419035810.496981', '439158233.199822', '476360697.181606', '537050133.717342', '622026107.771576', '702682018.976169', '818869145.124717', '897672085.632311', '1196091805.02316', '1258193518.73133', '1264758197.96593', '1585396256.12316', '1820207625.80217', '1823692109.61652', '1781261412.5445', NULL),
('BWA', 'PIBC', '30411449.5204893', '32902654.4010581', '35644985.2182477', '38091777.0677901', '41616418.5070928', '45788670.6930146', '51465624.4090769', '58642385.2376744', '66248426.9941409', '77361532.9935123', '96243298.1393835', '126954476.930714', '165253183.617311', '244124115.653176', '306044205.922122', '355168715.375176', '372025093.434102', '451624959.61005', '590407375.160033', '819870595.111537', '1060889705.11871', '1073812403.80662', '1014945860.82549', '1172230575.57996', '1240821849.27576', '1114783538.17406', '1392602040.14794', '1965227085.13155', '2644554881.84186', '3083822367.10683', '3790636664.02546', '3942877353.59054', '4146464586.61674', '4160129177.1556', '4259258810.89328', '4730599690.73974', '4847757703.86629', '5020265168.28901', '4790481509.17679', '5484263050.39562', '5788311645.24919', '5489646902.56223', '5438856515.10063', '7511538764.70587', '8957491784.92086', '9931223489.2589', '10126990496.0181', '10939028150.7716', '11113042239.547', '10106837292.66', '13746712711.2118', '15365212952.7072', '14537486274.1538', '14784707345.2381', NULL),
('CAF', 'PIBC', '112155598.424137', '123134583.702686', '124482774.155572', '129379123.792932', '142025078.771562', '150574795.28224', '157930018.375448', '163820513.701425', '191767441.663587', '188039209.876317', '189106529.232059', '201450800.155415', '230317882.787365', '271183082.197963', '281398705.922214', '378660015.774664', '451152460.825277', '507298148.292476', '610578631.218134', '700764746.929727', '797048197.065069', '694803623.872112', '748312391.344694', '658679332.649258', '637820670.572429', '864849836.841362', '1122265014.86379', '1200991976.20365', '1264899288.27967', '1233930279.03002', '1440711459.411', '1377374987.52052', '1411917554.45482', '1278781259.30117', '851174357.309582', '1115389673.9125', '1007791126.56226', '937741512.447574', '967338390.360019', '999477458.730474', '914500331.983723', '931833293.75345', '991387865.044932', '1139754771.91102', '1270080228.23241', '1350300947.46755', '1473721520.69935', '1698125679.65188', '1985370254.96172', '1981728179.49882', '1986014759.19785', '2195599491.16978', '2169706411.47799', '1538175744.07775', NULL),
('CAN', 'PIBC', '41093453544.9096', '40767969453.696', '41978852041.4426', '44657169109.224', '48882938810.2204', '53909570342.169', '60358632035.1532', '64768831262.1761', '70759031841.7237', '77887510241.7083', '87762259546.3681', '99120804119.6276', '112910634407.516', '131121900809.919', '160164449897.751', '173569339952.812', '206261020283.976', '211289943864.598', '218299964232.489', '242701986341.13', '273436840403.695', '305748602885.979', '313453027478.317', '340318889970.789', '353887730677.168', '362960087879.897', '375653832313.782', '429021116138.763', '506017713496.384', '563639358108.108', '592014912581.419', '608258706467.662', '590148092992.471', '574833733819.084', '575998828353.837', '602021276595.745', '626950495049.505', '651001011122.346', '631432423323.222', '674325233896.48', '739455928893.677', '732716942148.76', '752531702032.754', '887751766469.203', '1018385574395.47', '1164179473989.7', '1310795189078.17', '1457872837625.94', '1542560728744.94', '1370839154047.03', '1614072093764.07', '1778632046932.59', '1821445449562.2', '1826768562832.01', NULL),
('CHE', 'PIBC', '9522746719.21614', '10712712465.0522', '11879982758.5619', '13063643795.7884', '14480556571.5476', '15346741669.7575', '16480058704.8531', '17740013179.26', '18942729779.1', '20524886616.4789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '118710309542.281', '108721034568.781', '111431738019.012', '111035571006.622', '106019113631.527', '107496240242.562', '154095512368.67', '192981619165.773', '208774024533.588', '201572650956.66', '257420293190.325', '260459896582.985', '271133679206.372', '263691005481.862', '291913801125.978', '341759012938.689', '329619351051.78', '286604024805.347', '294977518761.208', '289884127679.404', '271659728209.379', '278628772872.719', '301127808995.252', '351982634291.23', '393541693928.428', '407543292839.302', '429180758069.191', '477421391034.262', '551552055046.21', '539507555858.517', '581208562423.374', '696278717728.137', '666100606813.394', '685434185074.108', NULL),
('CHL', 'PIBC', '4211762521.8548', '4705377499.81869', '5502763243.33889', '5482749434.20374', '5794301526.88849', '6053790468.24208', '7013580346.15593', '6913560997.04789', '7074820185.61307', '8179771225.72187', '8981111663.54259', '10694569522.0727', '11532517864.1275', '16387454416.5288', '15535549705.8948', '7226476865.17312', '9857547848.58237', '13359145454.4104', '15399431309.6652', '20729772210.6846', '27572307600.4103', '32644872979.6923', '24339421605.1856', '19770402077.0148', '19232737055.4021', '16486012247.3704', '17722536671.3316', '20902096531.6075', '24640912615.8116', '28385038396.7035', '31558927517.2188', '36424168146.1543', '44467946384.2462', '47693992626.8649', '55154226759.96', '71349202308.6423', '75769008174.2547', '82808986191.6005', '79373597080.1017', '72995286764.4168', '79328640263.7897', '72336972322.3931', '70984568428.5785', '77840186384.8224', '100630707851.859', '124404150138.162', '154671012210.645', '173006275030.338', '179857806671.501', '172323378550.078', '217501911333.709', '251162316597.843', '266259263033.373', '277198774856.807', NULL),
('CHN', 'PIBC', '59184116488.9977', '49557050182.9631', '46685178504.3274', '50097303271.0232', '59062254890.1871', '69709153115.3147', '75879434776.1831', '72057028559.6741', '69993497892.3132', '78718820477.9257', '91506211306.3745', '98562023844.1813', '112159813640.376', '136769878359.668', '142254742077.706', '161162492226.686', '151627687364.405', '172349014326.931', '148179569816.016', '176633881531.548', '189400991348.881', '194109567421.566', '203181343416.893', '228454092247.428', '257430422884.014', '306667904949.769', '297831277506.753', '270372534122.446', '309523098698.397', '343974067007.621', '356937329023.319', '379468645984.927', '422660548425.379', '440501207081.725', '559224201926.097', '728007549739.406', '856084628929.78', '952653115236.503', '1019461964545.94', '1083278591739.61', '1198474937919.3', '1324806909018.3', '1453827558024.4', '1640958734587.31', '1931644329934.27', '2256902590825.33', '2712950885444.1', '3494055942162.34', '4521827271025.62', '4990233518751.65', '5930502270312.98', '7321891954608.06', '8229490030099.96', '9240270452046.99', NULL),
('CIV', 'PIBC', '546203558.456965', '618245635.134801', '645284474.559229', '761047198.973677', '921063326.292797', '919771228.036522', '1024102881.90257', '1082922725.79069', '1281281277.98148', '1361360291.5873', '1455482795.26555', '1584128511.27902', '1849400398.25228', '2508421425.57669', '3070152313.83854', '3893839184.06847', '4662053819.62908', '6265068200.43055', '7900526290.12877', '9142933955.51749', '10175617589.1232', '8432589956.34896', '7567110855.85391', '6838184772.07869', '6841639250.21886', '6977650648.47401', '9158302111.36131', '10087654451.3411', '10255169812.0186', '9757410629.74456', '10795850584.5874', '10492628587.8592', '11152971284.4479', '11045760268.6156', '8313557515.30312', '11000146268.6884', '12139234220.4139', '11722213506.6176', '12782570245.73', '12556457526.9353', '10417060604.9044', '10545285036.7953', '11486664265.3548', '13737482343.4215', '15481092596.5472', '17084927539.8488', '17800887469.3146', '20343636058.733', '24224905503.6554', '24277494337.4004', '24884503950.6814', '25381617035.7012', '27098590232.3209', '31062026533.1508', NULL),
('CMR', 'PIBC', '618740961.944997', '657597316.816256', '699373631.084707', '723624330.858598', '782384403.970361', '814140009.386173', '853268764.381481', '934078958.314689', '1053076992.00054', '1152418382.23076', '1160002328.88071', '1233991070.532', '1430951432.46712', '1758727646.78718', '2255496517.15439', '2752770608.49462', '3076592633.82981', '3366368801.2738', '4409920570.99328', '5811443663.30692', '6740757493.21907', '7636346056.38029', '7322913599.92741', '7381853864.7487', '7801858400.9944', '8148223552.07028', '10621157923.4974', '12302473328.8425', '12493286837.0158', '11140057045.8904', '11151578702.7205', '12434368416.0445', '11396311478.4471', '13532134752.5833', '9220471470.99796', '8733230556.17332', '9732328760.63403', '9840553566.22716', '9629649715.21001', '10486451906.6665', '9287367568.79443', '9633109256.73606', '10879778327.8194', '13621738512.2581', '15775356736.7645', '16587857509.4422', '17953066391.1137', '20431781120.1785', '23322256428.0125', '23381142604.4364', '23622482954.804', '26587310733.5738', '26472054176.1664', '29567504655.4935', NULL),
('COD', 'PIBC', '3359404132.31797', '3086746936.39789', '3779841409.55267', '6213185773.92265', '2881545277.14307', '4043901724.13762', '4532660145.32842', '3384063359.82333', '3909780525.37375', '5032434970.84174', '4877684933.12505', '5594770351.56981', '6173712809.28569', '7870239463.58461', '9596960174.34365', '10237343153.4311', '9648583220.47256', '12344424775.9239', '15372607995.4061', '15068422242.0571', '14394927492.9647', '12537821039.8252', '13651667370.5466', '11006712649.2175', '7857729192.85629', '7195042615.84176', '8095367168.16178', '7661625472.51189', '8861299976.68858', '9021862775.25443', '9349764580.35198', '9087965281.52807', '8206227134.00857', '10707792340.0276', '5820382248.28202', '5643439376.10491', '5771454939.62404', '6090840548.18784', '6215591269.89747', '4711259427.27273', '19088046305.7971', '7438044091.33333', '8728038480.28516', '8937556125.21679', '10297481446.2161', '11964484457.5233', '14296505933.1906', '16364027646.7724', '19206015304.7822', '18262675199.101', '21561941369.3628', '25835398967.342', '29306222815.6328', '32690896872.7644', NULL),
('COG', 'PIBC', '131731862.568997', '151675739.160627', '166521239.863281', '172233430.871502', '185693724.845331', '198318063.860835', '220613582.369827', '237397428.336429', '251247458.012189', '265040036.059116', '274960699.85855', '322128019.323561', '410669262.897929', '541973362.480998', '585364635.354748', '767102679.018622', '754549600.548182', '765224030.636552', '878771771.29105', '1198749665.95066', '1705796849.54655', '1993512325.92286', '2160640566.5396', '2097274289.61512', '2193581366.40722', '2160872541.41887', '1849268214.68184', '2297753649.2798', '2212536313.33492', '2389593021.94866', '2798746050.58236', '2724853507.64996', '2933222705.7974', '1918970177.74925', '1769365438.88526', '2116003868.17373', '2540697537.70424', '2322719101.28455', '1949481380.64925', '2353909441.70059', '3219910666.0298', '2794259756.13093', '3019993723.12586', '3495868724.65945', '4648628839.49057', '6087002681.74095', '7731261168.83097', '8394688589.05419', '11859015180.9402', '9593536719.07311', '12007880067.4395', '14425606793.3651', '13677929161.7142', '14085852120.4761', NULL),
('COL', 'PIBC', '4040948304.74373', '4552914129.61186', '4968598030.68741', '4838841455.55556', '5992169466.66667', '5790247619.04762', '5452762962.96296', '5727208180.14705', '5918467519.18157', '6405440200.13469', '7198373469.47995', '7820367892.9766', '8671371951.2195', '10315774588.1355', '12370045405.1288', '13098633901.8673', '15341403660.4698', '19470978268.2589', '23263511958.0509', '27940389361.1188', '33400712095.04', '36388389129.3376', '38968019453.0773', '38729822781.5997', '38253120737.9671', '34894419525.2204', '34942483688.1685', '36373312082.6578', '39212545681.4333', '39540083645.5519', '40274204595.2296', '41239551378.2482', '49279585355.0948', '55802540100.9795', '81703496603.9934', '92507277798.1985', '97160111573.337', '106659507963.528', '98443743190.8491', '86186156584.3817', '99886577575.5444', '98203544965.2678', '97933392356.4253', '94684582573.3167', '117074865515.279', '146520136085.39', '162773603929.706', '207520150283.04', '244056732297.388', '233821670544.258', '287018184637.529', '335415156702.186', '370328075210.144', '378415326790.081', NULL),
('COM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123505661.348515', '114271876.277722', '107089562.695541', '111519674.004581', '107489831.795505', '114490708.868824', '162487778.450173', '196433673.798862', '207476558.379624', '198733188.223655', '250030778.38846', '246823412.937961', '266191082.845245', '263568133.064641', '185761813.213562', '231896233.742985', '230495756.548375', '212099640.768249', '215394048.572942', '222580461.640908', '201899883.626713', '220093828.34815', '246737670.812348', '317562300.765468', '368143110.95941', '380372884.760887', '406111892.704545', '462453621.984987', '517477659.539394', '514788085.204949', '516962949.496508', '566024675.855027', '550476499.209079', '598925862.953067', NULL),
('CPV', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '142246875.536716', '139468114.599741', '140630758.594899', '138476239.366792', '132019065.033419', '137728155.212661', '190651207.999511', '235253171.841062', '264308140.285149', '267448513.108168', '306891107.262039', '319827058.592875', '357160985.327413', '490417389.682569', '406580652.330537', '487148993.533109', '501979075.352537', '490608657.924976', '521910560.524868', '592416703.058878', '539227052.849166', '563024256.736127', '620974807.125451', '813963933.830773', '924318505.851547', '971976952.231872', '1107890815.24702', '1513934037.24782', '1789332788.19169', '1711816593.14273', '1664310632.50516', '1864823990.9938', '1757304418.79445', '1879402553.60154', NULL),
('CRI', 'PIBC', '507516617.287777', '490324267.102377', '479181227.220072', '511902566.699118', '542578822.460723', '592981156.226415', '647305631.396226', '699456618.264151', '773841499.773585', '853630203.169811', '984830159.698113', '1077152887.35042', '1238251657.6619', '1528916175.15355', '1666544794.71392', '1960863535.87025', '2412555508.08092', '3072427124.57764', '3523208933.86208', '4035519471.59193', '4831447173.21361', '2623807083.30709', '2606621244.69654', '3976453954.94436', '4593908761.79189', '4796628461.62238', '5477895475.74339', '5841132961.39946', '6063759371.10467', '6866402028.35824', '7403457319.25185', '7162546761.41469', '8573611050.18873', '9638291586.86293', '10557530654.1743', '11722357067.305', '11843228539.7911', '12828975924.3336', '14101753567.4015', '15796567138.0566', '15946443103.2804', '16403602943.4123', '16844378578.178', '17517536016.1874', '18596365926.8535', '19964893807.3935', '22526464409.0829', '26321999607.4464', '29831167681.3826', '29382692643.1392', '36298327669.8974', '41237296806.8532', '45374788701.1671', '49621089476.1317', NULL),
('CUB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5693005244', '6914658389', '8135150888.7723', '9987709686.36912', '11405957363.4146', '13027415252.439', '13789579892.8136', '14206158657.8313', '17844705319.4805', '19584443219.1781', '19912889808.3333', '20150254124.0964', '20953510265.8824', '22205716020.35', '24039383641.4343', '22921491786.9543', '24226283927.4787', '25213614325.1389', '27458999535.6201', '27025200369.1125', '28645436550.5319', '24317883624.0548', '22085858204.0541', '22367254851.3514', '28448326795.9459', '30428638304.4183', '25017300000', '25366200000', '25736600000', '28365300000', '30565200000', '31683300000', '33590400000', '35901500000', '38202800000', '42644200000', '52742100000', '58603500000', '60806200000', '62078610000', '64328220000', '68233900000', NULL, NULL, NULL),
('CYP', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '489912509.318058', '576090037.834172', '734876187.342747', '964024738.781719', '1288699020.84441', '2154311327.61791', '2087496321.68131', '2159242370.64266', '2160364085.74805', '2278248930.25623', '2430411867.33042', '3090734455.16825', '3704813856.98831', '4278792561.50314', '4563482552.74272', '5591130222.43931', '5770197317.23346', '6912150472.55033', '6590291095.49423', '7425703907.18095', '9250142747.79301', '9346693021.63312', '8905554119.33888', '9553478738.04774', '9776223013.13322', '9314937556.47908', '9679304970.56184', '10557366161.9634', '13319544758.4518', '15816972050.6976', '16997801392.3755', '18435765910.0111', '21841815680.8803', '25321517504.0281', '23542650736.3156', '23132450331.1258', '24851264943.0081', '22766912960', '21911444503.4519', NULL),
('CZE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '40315847383.7197', '29557058893.2806', '34451992668.1687', '40452245948.5479', '47364869446.8406', '59537113790.5049', '66775128782.9017', '61621397381.0607', '66372663111.1019', '64719367646.1017', '61474265134.5364', '67375682473.4678', '81696693249.3007', '99300329682.0164', '118976254632.827', '135990121361.165', '155213120558.221', '188818465531.118', '235205271893', '205729790694.015', '207016402026.364', '227307241312.732', '206751372749.33', '208796024645.834', NULL),
('DEU', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '215021806498.156', '249039217364.635', '298667219346.133', '396866742553.97', '443618642959.716', '488780155338.262', '517787921003.573', '598226205424.071', '737668356280.428', '878010536975.776', '946695355820.96', '797443405711.813', '773638200773.757', '767768378016.086', '722367608343.069', '729763282952.432', '1042300769791.95', '1293264353318.82', '1395931548502.06', '1393674332154.37', '1764967948916.6', '1861873895109.02', '2123130870381.97', '2068555542410.98', '2205966011811.5', '2590500887129.79', '2501572654016.12', '2215937288517.93', '2239913304434.81', '2196686554442.79', '1947208402432.28', '1947928411633.11', '2076303406738.19', '2502313769751.69', '2815592929913.77', '2857558573347.26', '2998466393955.9', '3435506663701.22', '3747055453913.22', '3412770245920.79', '3412008772736.86', '3752109943533.54', '3533242461467.05', '3730260571356.51', NULL),
('DJI', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '340989541.520743', NULL, '373371753.01694', '395794554.216675', '409220103.326882', '452328104.992109', '462422016.630202', '478058323.587723', '466048487.476264', '491689239.995148', '497723980.076454', '494004667.075295', '502675561.681628', '514267889.435014', '536080169.085534', '551230861.856505', '572417440.820162', '591122039.601398', '622044665.515049', '666072101.777505', '708633194.726566', '768873684.032838', '847918929.107984', '999105339.267729', '1198997304.76421', '1128611700.3618', '1239144501.77525', '1353632941.5207', '1456344495.0231', NULL),
('DMA', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '36370369.7280465', '45170369.5726329', '44296295.5139955', '59099998.9562564', '66218517.3490573', '72051850.5793703', '79925924.5143832', '89848146.5613727', '98585183.4441081', '112074072.094775', '126348145.916759', '143766664.127656', '153374071.36539', '166322219.284866', '180437033.850404', '191759255.872669', '200418514.979', '215459255.454112', '224037033.0804', '236444440.268685', '245781477.140824', '258440736.176513', '267740736.012269', '335845808.883564', '343119364.310664', '337695734.776819', '350091216.039388', '374771474.862779', '370370370.37037', '397777777.777778', '428888888.888889', '468888888.888889', '498888888.888889', '492962962.962963', '508518518.518519', '514814814.814815', '516666666.666667', NULL),
('DNK', 'PIBC', '6248946880.2777', '6933842098.84548', '7812968114.40012', '8316692385.77386', '9506678762.77765', '10678897387.0006', '11721248101.0874', '12788479692.1939', '13196541952', '15009384584.5333', '16866156733.3333', '18823150290.1849', '22966364108.6153', '30459579436.3171', '33900564767.2644', '40251071473.3215', '44401699735.3185', '49666416194.6962', '60281337504.0801', '70309794677.8179', '70867465285.0476', '61376989330.9375', '59916301293.7449', '60188398261.345', '58673426983.7591', '62220601827.0356', '87800282647.386', '109150052132.216', '115111916809.032', '111886844190.309', '138094873105.387', '138964910325.96', '152690732178.062', '142962900445.719', '156144903578.279', '185006961302.299', '187632400365.599', '173537588008.176', '176992000955.11', '177965224620.854', '164158800460.219', '164791416350.267', '178635160297.415', '218095997085.477', '251244521002.961', '264559081260.182', '282962119265.137', '319500290932.593', '352589421253.574', '319764341586.559', '319812413596.903', '341497953096.868', '322276544469.312', '335877548363.831', NULL),
('DOM', 'PIBC', '672399700', '654100200', '824100000', '940799900', '1025599900', '888100000', '983900000', '1034800000', '1079100000', '1230500000', '1485400100', '1666400000', '1987300000', '2344699900', '2925600000', '3599300100', '3951399900', '4587100200', '4774400000', '5498800100', '6631000100', '7266999800', '7964000300', '8622000100', '10330399700', '5044579947.10545', '6122128247.69061', '5827050857.29713', '5374300243.25495', '6686592728.70663', '7073674721.12418', '9724379019.62036', '11277694536.9488', '12976408000', '14511134920.6349', '16358496124.031', '18131813000.6281', '19593449903.2551', '21171235997.8508', '21709041189.3244', '23996656675.8335', '24894907435.1447', '26570402718.796', '21268012747.2709', '22163928096.993', '33969724872.4638', '35965041793.3794', '44078280922.1207', '48143840499.8707', '47889008135.3266', '53042943731.136', '58145330250.3688', '60331668442.6699', '61163676804.5466', NULL),
('DZA', 'PIBC', '2723637620.4039', '2434766866.27334', '2001460838.78378', '2703004009.92404', '2909340114.7226', '3136284385.14828', '3039859268.24911', '3370870461.13558', '3852147112.84503', '4257253358.44365', '4863487557.2335', '5077222330.06931', '6761786483.71017', '8715106128.63411', '13209713770.0892', '15557934472.8677', '17728348385.244', '20971901062.9845', '26364491674.6159', '33243421339.3774', '42345276287.5934', '44348670724.0831', '45207090667.8674', '48801372227.5528', '53698280322.5824', '57937867717.4636', '63696299985.0409', '66742269089.6987', '59089065516.8692', '55631488293.8976', '62045098370.0829', '45715368143.9784', '48003297248.8691', '49946456681.2384', '42542573602.1669', '41764054034.6543', '46941496308.2845', '48177861890.8881', '48187780126.1819', '48640613515.0702', '54790058957.3718', '54744716706.3542', '56760288961.5829', '67863832648.2897', '85324997369.5015', '103198650297.779', '117026655313.743', '134977867931.582', '171000162581.484', '137211795394.166', '161207304960.455', '199070864637.558', '204331017992.08', '210183410526.104', NULL),
('ECU', 'PIBC', '1010325138.03016', '979108806.848646', '958598195.033967', '1038389642.31418', '1156150890.06133', '2387048255.45173', '2429309513.80854', '2553596091.82258', '2582180794.1855', '3112166848.3004', '2862504169.99893', '2754220263.02528', '3185987234.84089', '3891755551.94138', '6599259420.99605', '7731677256.80982', '9091924304.83477', '11026346589.5011', '11922502170.6405', '14175166007.5774', '17881514682.8784', '21810767209.3695', '19929853574.6095', '17152483214.3536', '16912515183.2783', '17149094589.9827', '15314143988.0621', '13945431882.2271', '13051886552.3377', '13890828707.6493', '15239278100.3502', '16988184456.1009', '18093864474.8747', '18938326276.0837', '22708204404.8635', '24432379905.6316', '25225872274.1333', '28161471482.9701', '27981319125.1358', '19644866963.4276', '18327386415.9524', '24468324000', '28548945000', '32432859000', '36591661000', '41507085000', '46802044000', '51007777000', '61762635000', '62519686000', '69555367000', '79276664000', '87623411000', '94472679000', NULL);
INSERT INTO `pays_indicateur` (`code_pays`, `code_indic`, `1960`, `1961`, `1962`, `1963`, `1964`, `1965`, `1966`, `1967`, `1968`, `1969`, `1970`, `1971`, `1972`, `1973`, `1974`, `1975`, `1976`, `1977`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1984`, `1985`, `1986`, `1987`, `1988`, `1989`, `1990`, `1991`, `1992`, `1993`, `1994`, `1995`, `1996`, `1997`, `1998`, `1999`, `2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`) VALUES
('EGY', 'PIBC', NULL, NULL, NULL, NULL, NULL, '5111621003.42708', '5339520731.69733', '5579168564.81056', '6109112105.29243', '6861743547.38569', '7682492054.30836', '8266003436.8211', '8763960904.15995', '9616725500.74052', '9015166907.68881', '11437965494.4087', '13360477266.8614', '14636028524.497', '14849909052.6011', '18150000880.5212', '22912499645.0946', '23405404428.0928', '25592366130.5002', '28137368609.1202', '30642873672.663', '34689560468.3365', '35880262483.3408', '40507934110.5555', '35044633274.6022', '39648442471.6039', '43130415141.8989', '36970555125.6168', '41855483504.0259', '46578631212.6125', '51897983715.5584', '60159244485.2081', '67629717779.7354', '78436575743.8573', '84828807269.5429', '90710703939.4609', '99838540997.3209', '97632008050.9425', '87850680579.2814', '82923680612.804', '78845185715.9104', '89685724897.157', '107484034644.765', '130477817194.412', '162818181818.182', '188984088127.295', '218887812549.851', '236000735704.439', '262831912586.538', '271972822883.38', NULL),
('ERI', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '477101651.648376', '467876293.706829', '531688311.688312', '578015625', '693535954.190067', '686494476.137988', '745526149.49945', '688921325.712043', '706370812.289101', '752368494.461824', '729321364.095048', '870247701.706937', '1109054002.42096', '1098425899.89884', '1211161879.50862', '1317974493.40894', '1380188800.03147', '1856695550.46865', '2117039510.70194', '2607739837.39837', '3091967479.6748', '3444097560.97561', NULL),
('ESP', 'PIBC', '12072126075.397', '13834300571.4849', '16138545209.246', '19074913947.7196', '21343844643.7341', '24756958694.9238', '28721062242.1634', '31647119228.1982', '31475548481.4095', '36038711599.541', '40881655098.6451', '46492797365.2695', '58971806626.9739', '78425934894.3461', '97009800115.3735', '114465300289.855', '118185307386.222', '132089531434.83', '160163483072.917', '214019077342.588', '232134606637.271', '202257045774.013', '195464408602.151', '170486866357.309', '171635463361.623', '180302412230.92', '250638463466.793', '317882187036.787', '375138723325.239', '413630538018.271', '535101248775.71', '575598537069.656', '629202392003.901', '523649481762.322', '529121577319.588', '612939685081.398', '640998292394.588', '588692045454.545', '617041986858.225', '633194118900.49', '595402616546.895', '625975838926.175', '705145868624.13', '906853273137.698', '1069601981710.16', '1157247674476.45', '1264486722860.56', '1479265709739.78', '1635049580162.05', '1498984446173.62', '1431587612302.26', '1494598106576.36', '1355732589969.33', '1393040177013.68', NULL),
('EST', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4362191345.39733', '4739181428.01405', '5059146979.2606', '5608007342.30726', '5715278960.81772', '5685561595.87211', '6233506400.5013', '7308608834.88744', '9822143179.76513', '12057639751.5528', '14003096552.7533', '16958044845.6933', '22228670168.1751', '24185794095.1301', '19640620154.0994', '19479012423.353', '22803433932.9544', '22660754203.7911', '24880264958.1187', NULL),
('ETH', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7324903188.4058', '7707678019.32367', '8567890821.25604', '8096302367.14976', '9480840483.09179', '9848600869.56522', '10527338647.343', '10908935748.7923', '11476584879.2271', '12175166763.285', '13463868357.4879', '10492993077.6093', '8830712713.90781', '6927950564.55657', '7663984567.90123', '8547939730.62374', '8589211390.49612', '7818224905.55071', '7700833482.00615', '8242392103.68061', '8231326016.47494', '7850809498.16803', '8623691300.04079', '10131187261.4421', '12401139453.9738', '15280861834.6024', '19707616772.7996', '27066912635.2228', '32437389116.038', '29933790334.3418', '31952763089.33', '43310721414.0829', '47525186490.0517', NULL),
('FIN', 'PIBC', '5224102195.52771', '5921659485.03284', '6340580854.39073', '6885920328.66187', '7766655085.78588', '8589340019.02985', '9208524504.87684', '9368954010.3132', '8823033880.32993', '10070766720.5011', '11365953567.3839', '12536710287.0134', '14754136507.0261', '19486826979.9284', '24867278714.3532', '29494515597.22', '31873171718.726', '33524682307.8058', '36283091407.9422', '44498283620.8213', '53685049410.2646', '52485533204.7396', '52832120389.7866', '51014090520.9223', '52926394934.7052', '55914236377.5902', '73586676049.7302', '91642093872.5822', '109103056147.832', '119064708327.56', '141517648888.198', '127866490222.026', '112625431377.754', '89255751014.885', '103321570859.419', '134199346405.229', '132099404607.818', '126833123353.568', '133936359590.565', '135225868314.511', '125539893126.958', '129250111856.823', '139552983248.635', '171071106094.808', '196776616813.495', '204430930706.86', '216541409976.698', '255371507758.635', '283753003898.712', '251483878456.439', '247799815768.477', '273674236772.815', '255776225885.226', '267328613728.338', NULL),
('FJI', 'PIBC', '112334368.396772', '116993977.848207', '122912941.205436', '129461581.515562', '140040154.324227', '147084750.031482', '150603925.515853', '162625885.863484', '166952937.135005', '182182067.703568', '219878482.173564', '247749327.721267', '316650508.967523', '425963359.355326', '558589870.903674', '684268280.812751', '694552411.718837', '719533137.126662', '829239489.844119', '1019743927.24662', '1202567359.4132', '1235899836.18067', '1194015444.01544', '1123107276.30285', '1177997413.63384', '1141210124.82663', '1290228616.82408', '1177908191.97685', '1109976927.91722', '1182686577.22645', '1337024782.22702', '1383843860.1247', '1531803060.54558', '1635426125.30808', '1825285158.11762', '1970347720.96992', '2129266728.42585', '2093994597.21549', '1656784779.545', '1942170999.18765', '1684109743.49338', '1660102345.60309', '1842691481.09196', '2315935752.71653', '2727507212.92556', '3006725014.78415', '3103099942.22992', '3405050611.68726', '3523185919.55826', '2870624635.68032', '3140508835.9485', '3646423265.67031', '3849824012.51467', '3855017106.54936', NULL),
('FRA', 'PIBC', '62651474946.6007', '68346741504.4257', '76313782251.6964', '85551113767.3727', '94906593388.3107', '102160571409.274', '110597467198.645', '119466139619.589', '129847107787.883', '140725497222.277', '148948860281.091', '166564460755.298', '204283485045.514', '265381555686.506', '286526186579.378', '362000917852.226', '373410270417.919', '411464295266.114', '508183139534.884', '615834104224.484', '703525302701.025', '617589619794.81', '586837009681.605', '561852138738.274', '532648802822.187', '555197109067.017', '774556302680.178', '938368438284.405', '1023504019381.13', '1030122352457.33', '1275300566196.84', '1275563306592.26', '1408724907063.2', '1330094973361.13', '1401636342155.01', '1609892232882.11', '1614245416078.98', '1460709148123.17', '1510758283299.98', '1500275942893.67', '1368438363736.87', '1382218344519.02', '1500337850555.24', '1848124153498.87', '2124204553215', '2203623837238.22', '2324892820068.39', '2662975825905.46', '2923573946917.03', '2693665189295.46', '2646837111794.78', '2862680142625.14', '2686722589269.73', '2806427978233.99', NULL),
('FRO', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1105688872.97039', '1125684470.05533', '1062339943.83343', '1154899793.33878', '1268445919.41429', '1486861878.95624', '1683997930.26322', '1730894295.38595', '1970135198.76236', '2278229880.41222', '2412859692.82674', '2198138372.28824', NULL, NULL, NULL, NULL, NULL),
('FSM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '106500000', NULL, NULL, '112210000', '116700000', '124700000', '135200000', '147200000', '166200000', '178100000', '198400000', '202500000', '222103600', '218845700', '206900300', '219646200', '220660500', '233226300', '240051900', '241543400', '244991000', '239563300', '249845600', '252991200', '255890800', '261339600', '277510900', '294117200', '310287500', '326161000', '316245700', NULL),
('GAB', 'PIBC', '141468977.521066', '167637907.544815', '182796536.614163', '154480244.361122', '215679855.207217', '226474285.587109', '245849781.7159', '271543680.279285', '294468564.534369', '318124701.048949', '323802475.480977', '381687073.058558', '430508357.723916', '722780701.123251', '1544216003.9841', '2157592936.60712', '3009409970.90514', '2809349074.17738', '2389479269.18878', '3030251116.35999', '4279637933.85126', '3862269126.92642', '3618007844.44919', '3391275731.31834', '3561451562.23569', '3339914759.37269', '3403638193.57912', '3281797038.70584', '3834503378.28811', '4186411457.4569', '5952293765.84484', '5402919788.23153', '5592390832.66829', '4378645081.01769', '4190819346.82143', '4958845649.02823', '5694039999.86528', '5326817111.31062', '4483417313.11823', '4662991794.05396', '5067865502.79988', '4712849279.64923', '4931503836.34766', '6054883172.03912', '7178135606.41428', '8665736617.5506', '9545982814.08494', '11570860872.2274', '15685389826.8882', '12031268402.3877', '14569527124.6199', '18796191833.0851', '17843815459.3005', '19343506598.656', NULL),
('GBR', 'PIBC', '72328047042.1588', '76694360635.9159', '80601939635.2483', '85443766670.4279', '93387598813.9269', '100595782309.165', '107090721447.057', '111185383409.521', '104702736248.084', '112676874821.987', '130596349412.047', '147735304940.375', '169739454295.704', '191551239833.415', '206919332865.825', '247414986504.425', '237713758670.261', '268474780219.78', '340235585618.408', '442115137653.537', '567100215198.699', '538970579581.994', '513778819182.39', '487323139608.913', '459229224394.786', '485849332520.534', '596948154646.731', '733111416081.059', '890702327641.409', '899362902159.686', '1066688571555.4', '1116031344620.81', '1157648104247.1', '1043142283593.28', '1130232675696.36', '1235567303140.29', '1304507020280.81', '1438736083824.49', '1529138787678.04', '1558317424364.99', '1548663943107.88', '1529094573197.06', '1674416966426.86', '1943714285714.29', '2298126991101.83', '2412116400352.73', '2582815892447.53', '2963265224452.5', '2791855193222.01', '2308925879444.72', '2407933767804.59', '2591846114476.31', '2614946487602.81', '2678454886796.67', NULL),
('GEO', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7753501867.76095', '6353861165.29271', '3690615907.04546', '2701180603.9004', '2513870619.64754', '2693731857.8214', '3094915500.59723', '3510540809.24855', '3613500125.91588', '2800024318.56163', '3057453475.85664', '3219487818.31957', '3395778679.6066', '3991374548.50512', '5125273871.83724', '6411147328.44781', '7761900166.04593', '10172260744.6426', '12799337247.5341', '10766836276.5639', '11638536834.4274', '14434619982.2117', '15846474595.773', '16140047012.1438', NULL),
('GHA', 'PIBC', '1217230094.97205', '1302674324.88378', '1382515654.47343', '1540797588.57221', '1731296199.52296', '2053462968.0426', '2126300672.22965', '1747187644.9031', '1666909517.65205', '1962050555.7775', '2215028588.45646', '2417108577.52739', '2112293279.98507', '2465493032.25878', '2894409912.1709', '2810106390.10618', '2765254360.20623', '3189428571.42857', '3662478172.79996', '4020227931.15097', '4445228057.45354', '4222441673.17049', '4035994383.38367', '4057275077.68156', '4412279865.40315', '4504342152.98679', '5727602648.75537', '5074829931.97279', '5197840972.6857', '5251764269.91812', '5889174833.90034', '6603130039.87292', '6416079341.97329', '5968905678.89099', '5446370114.57708', '6464389656.21299', '6932984635.632', '6891433840.90915', '7482072380.2381', '7718110780.94815', '4982849054.0291', '5314871683.5223', '6166197191.76694', '7632720680.28119', '8881419348.21705', '10731883141.4457', '20410331625.6634', '24757553101.6266', '28528014620.7354', '25978508375.9228', '32174839712.7933', '39564771637.3979', '41740926505.1183', '48137027487.1795', NULL),
('GIN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1922600899.3841', '2041538057.02893', '2384295763.72549', '2432029380.43694', '2666616176.91609', '3014890569.04099', '3284625277.16186', '3279063317.63475', '3383218922.79336', '3693753379.05992', '3869032270.91633', '3783788551.0819', '3588375984.48374', '3461282189.69643', '2995360969.17427', '2833442750.41891', '2949637039.06356', '3446442218.89829', '3666349049.40435', '2937072009.0343', '2821346683.51402', '4134173271.02084', '4515824643.35047', '4609923720.17795', '4735956475.83382', '5067360041.10404', '5651088170.28606', '6144131903.01383', NULL),
('GMB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, '44212088.4188291', '46695008.7660868', '41160065.8347022', '45168072.2454283', '52296083.64654', '55728655.7957709', '59160575.5095456', '75187768.3495329', '95796033.6554112', '115179737.736179', '112190822.646033', '138093106.277641', '171833061.578461', '207112649.702942', '241083112.728768', '218767720.450751', '216050534.814986', '213448615.748728', '177340913.050244', '225726370.227358', '185646984.458794', '220626480.938017', '266672202.480435', '284120331.64738', '317083688.199874', '690311093.172052', '714254263.103249', '755040935.022498', '746493955.008434', '785999879.720691', '848239405.565637', '803633368.735802', '840285264.631545', '814724055.898334', '782913865.987568', '687410630.457292', '578235309.327198', '487038679.355229', '578785599.995561', '624173995.611616', '655068112.439639', '798869803.525315', '965771304.075503', '900641059.324369', '951827284.917949', '904256027.71351', '912427787.395989', '903497025.655483', NULL),
('GNB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '78733538.8063883', '78540000', '87702857.1428572', '89374185.136897', '98775303.6437247', '108985752.23376', '112386559.139785', '114971282.179455', '122666792.285524', '118537824.773414', '110653830.726033', '154731969.69697', '165523634.49692', '163577538.330494', '138478900.626886', '143856253.125', '130225018.751674', '173836362.010107', '164458120.314078', '213143016.443434', '243961995.509711', '257150573.214575', '226313492.707039', '236880813.824506', '235619994.764252', '253966919.93609', '270419779.418107', '268551010.939623', '206457553.398034', '224446652.144832', '370173851.945686', '392278164.416457', '415843479.843865', '476388249.275291', '531109346.810712', '586791836.059541', '591829897.548303', '695606313.878293', '864107768.265095', '825796952.67436', '847491366.886774', '1103652041.22031', '958857944.221004', '960778479.475346', NULL),
('GNQ', 'PIBC', NULL, NULL, '9122751.67862188', '10840095.2882258', '12712471.4162862', '64748333.3333333', '69110000', '72317446.9327193', '67514285.7142857', '67225714.2857143', '66331428.5714286', '64946954.756798', '65429198.238708', '81203226.9138345', '94159862.7073691', '104295643.388437', '103653049.93797', '103987520.075827', NULL, NULL, '50642880.7737503', '36731422.8456914', '44294647.733479', '44442456.94764', '50320914.4065688', '62118570.0053235', '76407395.9710488', '93345859.4050323', '100534656.942699', '88265974.7260518', '112119411.508746', '110906028.612022', '134707183.973556', '136047906.00517', '100807002.602709', '141853360.895902', '232463022.679122', '442337870.426546', '370687634.697573', '621117853.413296', '1045998534.00361', '1461139007.93716', '1806742732.9109', '2484745875.82124', '4410764260.97786', '8217368425.25252', '8081982438.42333', '10201201021.9118', '15439740345.2575', '9364826470.14287', '11582917790.3046', '15725711943.066', '16496531232.9983', '15580563835.9242', NULL),
('GRC', 'PIBC', '4446528164.67559', '5016048786.22753', '5327573509.09843', '5949478034.88751', '6680298250.57961', '7600579093.1158', '8455611129.27936', '9136711287.82434', '9915140546.35072', '11266091570.5718', '13188347727.2727', '14645597727.2727', '16947813636.3636', '22430307249.7123', '25444850000', '28631130712.0085', '31267791977.6119', '36309721554.1166', '44433557513.9147', '54682910763.5695', '57039361310.9512', '52539662976.6298', '54819528061.2245', '49611261996.904', '48197215840.3869', '47997306686.4051', '56587630963.9727', '65895005787.6195', '76542677876.5313', '79461172471.6744', '98252302880.4815', '105531204337.259', '116653534858.777', '109210557372.176', '117032055337.079', '137383438740.991', '146558607021.518', '143310869836.516', '144918713248.011', '142998082250.16', '130580431177.446', '136006263982.103', '152714097496.706', '201547404063.205', '239659036585.896', '247665771277.919', '273265389114.638', '318668286256.865', '354628633541.01', '329837035755.546', '299598056253.272', '288803062127.739', '249525371463.234', '242230333768.932', NULL),
('GRD', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '53322221.2805178', '67548146.9552048', '78314813.4317253', '83614813.3381239', '87888887.3367152', '95229627.9478137', '101211109.323658', '110099998.055564', '128211108.846821', '144011108.567783', '167229626.676248', '184533330.074357', '213066662.903774', '221070366.466127', '241570366.104084', '250914810.383499', '250259254.839521', '261777773.154616', '276296291.416728', '294651846.648113', '304940735.355293', '340814808.795808', '379629400.70291', '520044361.186056', '520444175.99381', '540336916.383232', '591018396.969646', '599118582.011777', '695370284.015614', '698700654.327168', '758683579.193757', '825977874.301594', '771278097.489849', '771015875.272257', '778648652.915236', '799882134.02172', '835581688.946799', NULL),
('GTM', 'PIBC', '1043599936', '1076699904', '1143600000', '1262800000', '1299099904', '1331399936', '1390700032', '1453500032', '1610499968', '1715399936', '1904000000', '1984800000', '2101299968', '2569200128', '3161499904', '3645900032', '4365300224', '5480500224', '6070600192', '6902600192', '7878700032', '8607500288', '8716999680', '9050000384', '9470000128', '9721652291.98458', '7231963339.80992', '7084399820.8', '7841603176.10698', '8410724409.21075', '7650125576.4628', '9406097461.10554', '10440842291.647', '11399942820.3849', '12983235118.703', '14656917900.1721', '15781579950.4132', '17788657193.8986', '19393672243.9406', '18317089473.0904', '19290566570.0483', '18702820735.0173', '20776536919.9593', '21917565499.915', '23965280312.0871', '27211243473.2261', '30231117389.6402', '34113093453.9246', '39136507936.5079', '37733655165.6538', '41337958251.632', '47654841112.8523', '50388454861.1111', '53796709474.5953', NULL),
('GUY', 'PIBC', '170216238.857225', '185849532.898944', '194949510.027706', '175757891.595894', '194774510.467537', '213235288.136558', '228705875.937914', '250176463.570974', '229750000', '249300000', '267800000', '282050000', '285380965.340976', '307047632.991592', '433954536.048833', '494791647.005413', '454440000', '449880000', '507080000', '530440000', '603200000', '570357116.855982', '482000000', '489333333.333333', '437631610.754711', '453488351.977666', '504651117.150102', '354591840.037446', '413799990', '379779379.053357', '396582263.291139', '336708410.308116', '368281383.388912', '442273443.546171', '540874922.265948', '621626785.915493', '705406032.09015', '749138004.427072', '717530696.5536', '694754983.970153', '712667925.33978', '696281468.774584', '722460911.811326', '741929342.788749', '785918769.587635', '824880550.343965', '1458449057.88559', '1740334781.83731', '1922598121.23066', '2025565089.48272', '2259288396.24467', '2576602497.33479', '2851154075.95385', '2990128820.97983', NULL),
('HND', 'PIBC', '335649984', '356200000', '387750016', '410200000', '457000000', '508650000', '549950016', '598099984', '646800016', '668000032', '723000000', '731000000', '802999968', '912499968', '1034500000', '1124000000', '1347999936', '1669499968', '1929499968', '2251499968', '2566000032', '2819500000', '2903500032', '3076999968', '3319000000', '3639499936', '3808500032', '4152499968', '3970386396.10149', '3563448320', '3048896180.84277', '3068462060.1236', '3419474978.86812', '3481990761.34498', '3432356578.82219', '3911053180.39625', '4034037162.16216', '4663193916.34981', '5202215657.31167', '5372543554.00697', '7105529646.90207', '7566517571.88498', '7776459963.87718', '8140294079.50891', '8772197584.64208', '9672006169.12994', '10841723354.4201', '12275491272.9738', '13789720387.3904', '14587485644.4263', '15839344591.9842', '17710325578.4449', '18564264544.5129', '18550026034.7589', NULL),
('HRV', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22387561845.2244', '23678012697.3612', '23822087053.2091', '25432144406.2043', '23386945596.6928', '21774273832.1031', '23289671102.3197', '26878499206.0165', '34658113497.39', '41574530815.5047', '45416358501.9835', '50436294494.5014', '60065225493.8502', '70461454280.1556', '62636688809.4021', '59643818181.8182', '62241414803.0317', '56479515971.9018', '57868674297.5337', NULL),
('HTI', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3476346281.35777', '2111405825.68328', '1806285587.04556', '2124933516.02791', '2695499730.33928', '2970865202.66312', '3242667331.21432', '3757500381.22703', '4088703119.65814', '3664503845.56892', '3507981945.53618', '3214632478.63248', '2826481071.96147', '3660483885.68707', '4154289832.39201', '4879738635.95586', '5885325589.97642', '6548530572.35291', '6584649419.28348', '6622541528.56888', '7516834160.25277', '7890216507.68913', '8459326659.75657', NULL),
('HUN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '34559392150.9333', '38514171469.6263', '39900742711.9043', '42925508500.6261', '46166297229.219', '46448783683.4519', '47070176268.2524', '48548470549.8246', '48965869805.8509', '47110416254.4482', '53533393254.505', '67366285758.6061', '84738408726.1486', '103156817854.868', '111890070522.215', '114238447644.85', '138580119899.615', '156578897625.596', '129359841851.653', '129585601615.851', '139439620999.229', '126824840351.689', '133423898611.949', NULL),
('IDN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5980840376.48039', '7467363478.72631', '8798957442.33129', '9656740013.9726', '9849117952.69347', '11605084559.759', '17171181163.3735', '27227710999.5181', '32147953007.7108', '39328674729.6386', '48396143465.5422', '54298158339.598', '55122620334.4408', '78013206037.493', '92473878831.7316', '94715163814.3197', '85369201879.1285', '87612439197.2643', '87338874330.1103', '80060657611.9213', '75929617715.0289', '88787623309.6831', '101455197785.758', '114426498045.009', '128167999846.499', '139116270052.461', '158006849878.896', '176892148243.48', '202132032844.145', '227369671349.342', '215748854646.718', '95445548017.3581', '140001352527.222', '165021012261.509', '160446947638.313', '195660611033.849', '234772458818.096', '256836883304.553', '285868603863.929', '364570525997.053', '432216737774.861', '510244548959.97', '539579955780.062', '709190823319.754', '845931645338.695', '876719347689.155', '868345652474.898', NULL),
('IND', 'PIBC', '37679274491.2745', '39920452403.4524', '42900864969.865', '49271095508.0955', '57470781032.781', '60599264111.7178', '46669801600', '51014155360', '54016411986.6667', '59472993626.6667', '63517182000', '68532271313.2286', '72716595884.3123', '87014945186.3156', '101271489826.241', '100199514365.231', '104518118776.804', '123617837582.482', '139708688961.553', '155674337010.019', '189594121351.874', '196883474523.345', '204234366470.486', '222090283347.207', '215878233650.679', '236589100981.279', '253352444883.275', '283926977522.458', '301790951204.236', '301233728792.842', '326608014285.316', '274842348144.095', '293262352360.098', '284193716756.826', '333014463393.078', '366599645609.605', '399786888514.355', '423160419439.337', '428741030147.44', '466867079642.314', '476609148165.173', '493954333981.336', '523968561883.923', '618356467437.027', '721585608183.523', '834215013605.932', '949116769619.554', '1238700195645.05', '1224097069459.66', '1365372433341.29', '1708458876829.92', '1843016600064.69', '1835818207214.96', '1875141481990.8', NULL),
('IRL', 'PIBC', '1939329775.43739', '2088012282.35667', '2260349684.08625', '2430843768.44553', '2766608945.87402', '2945704142.99765', '3104034393.23162', '3343636773.36759', '3278584478.33023', '3787077343.72783', '4391605367.60537', '5093158873.13147', '6311752163.65067', '7473702681.84449', '7888974406.18671', '9474337979.09408', '9444316303.42485', '11237107981.8656', '14633369072.7877', '18301041747.2598', '21726139828.4512', '20649549626.0616', '21453309970.9367', '20745312126.8474', '20086571282.2264', '21248773965.187', '28685898579.9067', '33886647354.8689', '37735178884.2232', '39199211072.6644', '49256398072.1636', '49737787045.2529', '55862700254.5893', '52365135829.7476', '57040641342.7562', '69070783964.6465', '75695885206.6532', '82654657115.5683', '89810328137.2659', '98541501704.6665', '99317573705.5464', '108455236062.64', '127215402503.294', '163476060045.147', '193043112998.454', '210357750335.771', '230522874774.324', '269283397854.613', '273732372421.715', '233542426994.212', '218435251789.115', '237771734260.43', '221966026813.525', '232077419239.968', NULL),
('IRN', 'PIBC', NULL, NULL, NULL, NULL, NULL, '6154739684.9637', '6706096864.73927', '7425389720.07921', '8447898397.57096', '9482344576.42244', '10588052395.5116', '13203457892.5413', '16346614631.9208', '25789290844.8751', '44331002245.915', '48942018416.6432', '63626810882.7626', '74816947678.8832', '73033383215.7233', '86168280190.0583', '90041228621.614', '97085719579.1484', '121526715239.237', '147222717993.254', '153067404656.379', '170673002206.268', '198775373326.423', '127851925591.666', '116305831422.606', '114003085003.894', '116035029649.097', NULL, NULL, '60088309490.6234', '67128216022.6715', '90829495171.4392', '110573439131.013', '105298720965.1', '102661888397.335', '104656040167.701', '101286514977.457', '115438386681.929', '116420833373.676', '135409681532.108', '163226579221.096', '192014940324.054', '222880533511.287', '286057933325.518', '355988367221.614', '362661111280.071', '422567967404.512', '528426099488.522', '502729273637.903', '368904351626.505', NULL),
('IRQ', 'PIBC', '1683918697.26662', '1831479752.18122', '1954399417.96451', '1978199407.46694', '2340239247.78045', NULL, NULL, NULL, '2896947553.25527', '3008120890.9684', '3281713714.50928', '3865346440.80188', '4113848154.43137', '5134367501.71543', '11516762346.4974', '13458516449.6705', '17754825188.2401', '19838130253.242', '23762275099.3478', '37816456960.1592', '53405687887.8843', '38424990640.5572', '42595309678.6162', '40595050175.2672', '46808830635.2117', '48291501125.6809', '47134059506.087', '56617488896.2006', '62511498166.4062', '65650230207.0893', '179910699665.121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '36627901762.063', '49954890353.2609', '65141035027.9406', '88837727881.3965', '131611819294.275', '111660855042.735', '138516722649.573', '185749664444.444', '216044306775.3', '229327284734.134', NULL),
('ISL', 'PIBC', '248434096.968726', '253885656.329253', '284916516.159537', '340061650.119898', '434267936.914583', '523694949.370689', '628893310.399926', '621225962.154708', '474399471.622359', '414709311.35296', '532726022.727273', '677913409.090909', '849251076.365284', '1167637523.57706', '1532511555.77789', '1422958230.3188', '1688573694.90037', '2233756574.64675', '2540540850.57726', '2886055048.21327', '3420074912.45623', '3532928255.0317', '3243284167.91483', '2797570137.02159', '2897187131.82746', '3018165480.13983', '4035231346.18847', '5583425615.09106', '6176445715.34849', '5737417173.02049', '6542685705.11875', '6988721004.53757', '7161930160.09829', '6289671159.05756', '6462503422.71862', '7205069433.94593', '7526269560.90226', '7620750786.62366', '8489958186.70966', '8951369524.97605', '8947860486.41498', '8147162010.41626', '9184959475.98615', '11324394790.7025', '13736980298.2404', '16798507502.1832', '17101040182.3881', '21446741081.8828', '17599245765.7231', '12823849535.0662', '13261035516.5574', '14665793477.194', '14182614909.3138', '15330057867.1487', NULL),
('ISR', 'PIBC', '2887081900.67668', '3486954461.02714', '2596553912.33168', '2992170981.49163', '3405458501.95569', '3663345598.02916', '3980013324.88337', '3921085397.89797', '3959154191.74836', '4568013077.69883', '5372301094.56913', '5573108412.71613', '7173788440.84276', '9242160982.44742', '12567588803.6609', '12336986759.6702', '12475947718.1135', '13776267565.5439', '13618844018.5392', '17511335262.5036', '21780968646.1188', '23196333205.4933', '24572712048.9694', '27435501836.7464', '26042767126.6861', '24122660958.9885', '29701444276.4432', '35476344266.205', '43892480101.5341', '44599772801.9003', '52490325648.231', '59170288069.8688', '65771216221.0223', '65925582472.9925', '74669718186.6171', '99319560110.8064', '109160636024.31', '113365224642.365', '114992763348.333', '116276785141.875', '131451205454.59', '129596737760.658', '119876313900.967', '125467161458.905', '134020972780.009', '141212566844.92', '152231249158.4', '176674375015.214', '213920568561.873', '206478651171.07', '232907996790.586', '258417551704.863', '257206359086.076', '290550599943.225', NULL),
('ITA', 'PIBC', '40385288344.1911', '44842760293.1924', '50383891898.9911', '57710743059.8341', '63175417019.0094', '67978153850.5191', '73654870011.2757', '81133120065.4202', '87942231678.3505', '97085082807.3751', '113062419454.771', '124306364544.32', '144833597609.562', '174976862504.151', '198978626079.19', '227027400355.872', '224057573156.548', '256840083607.637', '314133402235.911', '392521436961.081', '475855686864.119', '429438430761.369', '426018294631.353', '441741727944.926', '436602175556.535', '450889910455.329', '638506360566.307', '803347784881.984', '888991448080.928', '925935047840.813', '1177754920168.07', '1242561608709.22', '1316286027808.33', '1061831662975.27', '1095989702209.41', '1171213598003.09', '1309407704856.32', '1239510004547.52', '1266790453886.47', '1249057106328.57', '1142213930348.26', '1162784787472.04', '1267043101825.71', '1570330699774.27', '1799204087587.62', '1853465900611.85', '1943430740490.23', '2203972558211.15', '2391963512218.39', '2186107544936.82', '2126620402889.09', '2278230390029.84', '2091760740477.18', '2149484516711.75', NULL),
('JAM', 'PIBC', '699064357.298637', '748043414.097894', '777727657.006549', '826706669.005825', '897948941.586558', '972159571.205328', '1096759516.24749', '1148014336.12037', '1083839095.57418', '1191239555.57681', '1404720459.05833', '1539862371.26661', '1875146657.0086', '1905861156.9452', '2375122420.81841', '2860442774.67605', '2966042882.30784', '3249733206.65621', '2644527877.44645', '2425064186.17771', '2679379400.8362', '2979027961.12141', '3293496303.44113', '3619262288.38127', '2373564500.56453', '2100239026.53449', '2754549678.11457', '3287007232.35171', '3828342820.48217', '4404938028.3972', '4592208211.53699', '4106205952.23973', '3535452385.984', '4891215396.78684', '4938132517.80945', '5813471981.63996', '6527302707.85419', '7472532258.01629', '8742153397.25675', '8830909008.27052', '9008629729.41031', '9104515930.20984', '9718989516.70522', '9430236065.12236', '10173234921.1116', '11075778481.0127', '11903020643.5944', '12820055024.6163', '13676837630.2798', '12125023181.3057', '13230844040.0431', '14433926128.591', '14794802080.8803', '14362262584.9078', NULL),
('JOR', 'PIBC', NULL, NULL, NULL, NULL, NULL, '599759760.096096', '657999736.800105', '631679747.328101', '561119775.55209', '698879720.448112', '639519744.192102', '678159728.736109', '788479684.608126', '943783839.718052', '1197483948.68547', '1363073497.77355', '1708822439.70324', '2096778602.16785', '2602535813.49693', '3271368780.65347', '3909708819.33373', '4384247336.07116', '4680673603.93995', '4920692190.95569', '4967162160.40472', '4993512828.63478', '6402001908.75685', '6756417468.58556', '6277331602.0647', '4221121313.80357', '4159928734.14975', '4344467193.25095', '5311188449.62534', '5606237931.06786', '6237650242.52737', '6727446669.01127', '6928359294.57772', '7244402974.93625', '7910621093.43159', '8147494328.76276', '8457923945.43998', '8972965061.21158', '9580161951.38568', '10193023726.215', '11407566660.2844', '12588665455.6409', '15056937135.733', '17110609939.1559', '21971835282.5137', '23818322957.7465', '26425379436.6197', '28840263380.2817', '31015239545.2', '33678500148', NULL),
('JPN', 'PIBC', '44307342950.4', '53508617739.3778', '60723018683.7333', '69498131797.3333', '81749006381.5111', '90950278257.7778', '105628070343.111', '123781880217.6', '146601072685.511', '172204199480.889', '209070551156.667', '236154755295.247', '312738030290.016', '424891148590.163', '471643172433.473', '512861437158.573', '576405865272.759', '709404712455.402', '996741758196.688', '1037452649454.69', '1086988088501.05', '1201465862932', '1116840773461.75', '1218106450431.71', '1294608503864.69', '1384532251034.44', '2051061226984.6', '2485236197212.34', '3015393553892.77', '3017052046398.2', '3103698099973.41', '3536800942895.19', '3852794371594.29', '4414962786901.36', '4850348016491.89', '5333925511058.95', '4706187126019.61', '4324278106865.89', '3914574887342.22', '4432599282922.53', '4731198760271.14', '4159859918093.56', '3980819536159.76', '4302939184963.79', '4655803055650.55', '4571866957195.37', '4356749775546.81', '4356346715298.37', '4849184924937.25', '5035142154900.72', '5495387182996.1', '5905630870455.11', '5954476603961.52', '4919563108372.5', NULL),
('KAZ', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '26932728898.8146', '24881135586.399', '24906939560.1098', '23409027475.6879', '21250839258.0901', '20374307047.115', '21035357832.8019', '22165932062.966', '22135245413.2312', '16870817134.7767', '18291990619.137', '22152689129.5583', '24636598581.0204', '30833692831.3955', '43151647002.6096', '57123671733.8952', '81003864915.5437', '104849886825.584', '133441612246.798', '115308661142.927', '148047348240.643', '188048960311.225', '203517198088.691', '231876282133.87', NULL),
('KEN', 'PIBC', '791261028.433829', '792955032.269806', '868106539.360764', '926584160.495037', '998753741.477551', '997913732.517605', '1164513152.92108', '1232552604.68437', '1353287880.27272', '1458371249.7725', '1603438379.36972', '1778381329.71202', '2107267356.39586', '2502136630.39143', '2973313898.07703', '3259341976.25014', '3474561078.50988', '4494357586.44854', '5303723445.54558', '6234398619.4534', '7265303091.56087', '6854490190.6604', '6431594078.17035', '5979205949.7427', '6191426331.52721', '6135040560.85345', '7239145306.5199', '7970816493.96822', '8355380879.12955', '8283101227.36663', '8572346692.96699', '8151479004.21334', '8209129171.73649', '5751789915.05363', '7148145375.78545', '9046326059.98857', '12045858436.2399', '13115773737.5664', '14093998843.7334', '12896013576.7324', '12705357103.0056', '12986007425.8781', '13147743910.7241', '14904517649.8476', '16095337093.8366', '18737897744.7948', '25825524820.8064', '31958195182.2406', '35895153327.8497', '37021512048.8158', '40000138830.8674', '41954989657.7777', '50334699324.2604', '55243056200.6503', NULL),
('KGZ', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2674000000', '2570833333.33333', '2316562400', '2028295454.54545', '1681006993.00699', '1661018518.51852', '1827570586.16784', '1767864035.71943', '1645963749.83146', '1249062025.13805', '1369691955.02213', '1525113501.11034', '1605640633.42189', '1919012780.97086', '2211535311.62834', '2459876151.9333', '2834168889.42019', '3802566170.81543', '5139957784.91084', '4690062255.12247', '4794357795.07139', '6197766118.59856', '6605139933.41063', '7226303261.27573', NULL),
('KHM', 'PIBC', '637142865.714286', '642857134.285714', '660000008.571429', '728571437.142857', '782857128.571429', '868571428.571429', '914285714.285714', '962857134.285714', '1065714248.57143', '978873267.456386', '718401145.881961', '969911437.917436', '505549460.316938', '702899173.500026', '588443893.689773', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2533727592.04165', '2791435218.71663', '3441205624.35628', '3506695722.70464', '3443413331.62426', '3120425502.58253', '3517242477.2285', '3654031716.26881', '3979813387.84404', '4284028138.34567', '4658246906.65996', '5337833255.95698', '6293046162.12584', '7274424518.55823', '8639164917.04058', '10351829065.611', '10401935531.8291', '11242266333.9323', '12829541141.0127', '14054443213.4639', '15238689686.4362', NULL),
('KIR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14295279.5446937', '15278632.4786325', '18936526.9461078', '31710657.7257811', '85637174.3722131', '55081816.9917528', '41109627.2760601', '38748059.4366822', '45210026.3248255', '42620165.4370668', '27935549.9886131', '29307055.8492301', '29659194.6444873', '29432432.4324324', '28646774.9012725', '21294783.1552483', '20572860.9625668', '23924520.3752976', '30842253.3010391', '29558753.7561284', '28413863.0864101', '47797290.4756971', '49724297.1196387', '48613286.3533932', '56200272.8308963', '57610627.7065975', '67866425.4590344', '69152456.2398694', '67097398.6133308', '70596128.7050323', '67512714.5176252', '63101272.3699183', '72259045.9632728', '90148518.0621311', '102220914.840418', '106147384.4979', '104668674.698795', '123005089.649373', '135044455.62825', '127125253.470597', '150431113.557145', '172253739.040743', '174984468.834127', '168951535.045376', NULL),
('KNA', 'PIBC', '12366635.5848801', '12483301.9583223', '12541635.1450435', '12833301.0786491', '13416632.9458604', '13593932.4279455', '14469078.2924055', '16742338.5872698', '14600000', '15850000', '16300000', '19624746.4218323', '22944848.5121012', '24196018.4827341', '31514856.7177484', '33364054.126509', '30095602.1846983', '29888888.3610321', '34259258.6542189', '39888888.1844257', '47999999.1522894', '56555554.5567484', '59925924.8675959', '59666665.6129153', '70037035.8001384', '77999998.6224703', '94148146.4854319', '108185183.274566', '126666664.429653', '143259256.72921', '159200367.55879', '164574441.537955', '181815552.344577', '198341107.608281', '221740736.824658', '230740736.665712', '245555551.218888', '275089909.076895', '287324365.949587', '305008717.247388', '420086426.407158', '460467993.79873', '480825573.923214', '463418870.6482', '501150880.038245', '543169953.370236', '636070988.766581', '684148691.621202', '734660333.333333', '708891296.296296', '692457407.407407', '728050629.62963', '731919888.888889', '765870666.666667', NULL),
('KOR', 'PIBC', '3891849048.17437', '2357059044.85007', '2745939978.39235', '3863726949.11865', '3358134142.57618', '3017614366.36637', '3806043708.63124', '4702747059.36715', '5955336766.31122', '7475692343.83676', '9409775888.71716', '10418262998.7037', '11367558349.6653', '14538310905.8044', '20426484040.8436', '22797520661.157', '31354545454.5455', '40255785123.9669', '54273760330.5785', '69731818181.8182', '67802380521.2123', '76240987915.3635', '81639218690.157', '90524009023.5256', '99983374277.2773', '103729914254.845', '119773895286.176', '150986906889.383', '202308365346.494', '248768504452.983', '284757121057.986', '332324538078.68', '356117978607.571', '391963073243.051', '458704213081.088', '559329547369.922', '603413139412.021', '560485235837.652', '376481975682.155', '486315001429.989', '561633037419.537', '533051998853.593', '609020054512.465', '680520807982.478', '764880644710.649', '898134300667.891', '1011797986991.9', '1122675892645.76', '1002216051903.27', '901934953364.711', '1094499350178.46', '1202463655509.6', '1222807167488.95', '1304553972501.69', NULL),
('KWT', 'PIBC', NULL, NULL, NULL, NULL, NULL, '2097199074.97924', '2391198945.30343', '2441598923.07329', '2662798825.50768', '2769198778.57739', '2873638822.11157', '3880392337.53093', '4450537865.64354', '5408804503.27452', '13006948809.4631', '12022811523.624', '13132252303.2244', '14137407256.5959', '15503557923.1265', '24749064362.7287', '28638869293.5251', '25058021180.4633', '21577153432.8715', '20871081551.9337', '21700083143.3902', '21445970692.8754', '17903989900.4776', '22368703292.5767', '20690321183.022', '24313856915.3884', '18427778571.0531', '11009955543.0012', '19858555904.6717', '23941392354.5306', '24848484744.5284', '27191687674.0736', '31492937200.8802', '30350433059.9669', '25946185993.5521', '30120888963.6806', '37718011468.5749', '34890773740.2178', '38138801497.2459', '47875837662.1539', '59440511981.7576', '80797945205.4795', '101561153806.389', '114721830985.916', '147402413798.235', '105911338608.398', '115428557470.181', '154032229427.959', '174044699037.43', '175830502497.796', NULL),
('LAO', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1757142805.71429', '2366666615.55556', '1776842041.05263', '1087273076.41145', '598961279.369589', '714046803.153143', '865559856.1639', '1028087947.28541', '1127806917.69908', '1327748654.65969', '1543606381.87467', '1763536299.18912', '1873671510.61307', '1747011884.41192', '1280177847.20938', '1454430642.01185', '1731198022.45494', '1768619058.34647', '1758176653.07746', '2023324407.30316', '2366398119.8821', '2735550176.99339', '3452895836.27792', '4222945529.64637', '5443930124.55113', '5832882921.50163', '7181441151.89497', '8254088066.90414', '9359185244.24597', '11242526454.037', NULL),
('LBN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3313539979.09333', '2717998713.0456', '2838485397.88652', '4451497337.41987', '5545921820.95553', '7535259914.42769', '9599127189.45126', '11718795352.0579', '13690217120.5605', '15751867489.4446', '17247179483.2157', '17391056436.8069', '17260364842.4544', '17649751243.7811', '19152238805.9702', '20082918739.6352', '20955223880.597', '21287562189.0547', '21796351575.4561', '24577114427.8607', '28829850746.2687', '35139635157.5456', '38009950248.7562', '40078938640.1327', '43205095854.063', '44352418120.4377', NULL),
('LBR', 'PIBC', '190495648', '183920944', '191861808', '200229616', '218929096', '229260776', '244459452', '261024284', '276820652', '306961824', '323099728', '341543056', '368098032', '386968288', '486955024', '577549312', '596675728', '673010608', '717240448', '814067872', '854711504', '846514496', '863933152', '823374944', '848478336', '851296080', '840964416', '972800000', '1038300000', '786300000', '384400000', '348000000', '223500000', '160400000', '132200000', '134800000', '159400000', '295900000', '359599999.036319', '441800019.378319', '529064646.66383', '514999999.999999', '536000000.000001', '409000000', '466999999.999999', '541999999.999999', '604028581.80619', '739026892.226679', '850040458.839631', '1155146229.786', '1292696475.95873', '1537753884.57502', '1733828404.74142', '1950960137.7301', NULL),
('LBY', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28904898117.7385', '31992732972.3568', '33887047909.2746', '30660051910.5037', '28610549763.4685', '25541379186.6458', '27884615384.6154', '30700897874.8704', '27251534529.5892', '30484399895.6472', '33896600870.7706', '28420321951.542', '19842519685.0394', '24062500000', '33384615384.6154', '44000000000', '56484375000', '71803278688.5246', '93167701863.354', '62360446570.9729', '74755288916.9561', '34699395523.6073', '81873662518.8238', '74199528672.4273', NULL),
('LCA', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '103444442.61755', '133414812.458624', '152244441.755711', '143588886.353018', '154503700.97507', '197088885.408174', '189166663.325863', '225777773.790398', '242385180.904509', '273977772.939156', '311511105.609627', '397192585.577919', '431470362.750329', '477996287.854577', '492029620.940073', '517566657.52611', '560811101.20683', '566370360.367909', '604411100.436826', '657529580.980201', '692507395.177286', '780895356.579261', '738755098.064226', '741966023.933445', '805836689.472114', '885242280.662354', '935463205.701346', '1066944388.56449', '1143476979.80547', '1171371518.51852', '1176607814.81481', '1244297407.40741', '1289531851.85185', '1302666703.7037', '1335764111.11111', NULL),
('LIE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '90099360.773871', '104889797.836543', '124940284.905398', '165928854.016146', '193980461.926317', '246389070.12372', '272489354.107335', '303493105.419053', '436912093.134986', '503173087.228041', '534699256.772624', '511647837.146855', '522096760.52682', '524023708.331749', '502620920.656533', '529073612.453579', '779357946.9847', '1052849231.31947', '1161757671.01756', '1119983791.43298', '1421508901.19317', '1484160640.17108', '1631176617.19198', '1673085622.79346', '1948128895.93238', '2428524749.69396', '2504013003.9401', '2298390584.38482', '2479698578.66241', '2664105901.18863', '2483890593.70545', '2491800558.77674', '2688617884.8748', '3070803431.476', '3454374260.73671', '3658356377.80983', '3988775843.87205', '4602346923.40322', '4929414914.73469', '4826167676.3641', NULL, NULL, NULL, NULL, NULL),
('LKA', 'PIBC', '1419629929.41176', '1454342131.09244', '1458609619.75309', '1241387713.61345', '1321840726.05042', '1698319327.73109', '1751470588.23529', '1859465020.57613', '1801176470.58824', '1965546218.48739', '2296470588.23529', '2369308600.33727', '2553936348.40871', '2875625000', '3574586466.16541', '3791298145.50642', '3591319857.31272', '4104509582.86359', '2733183856.50224', '3364611432.24149', '4024621899.57653', '4415844155.84416', '4768765016.81884', '5167913302.16745', '6043474842.76729', '5978460972.01767', '6405210563.88294', '6682167119.56522', '6978371581.26375', '6987267683.77254', '8032551173.24014', '9000362581.58086', '9703011635.86585', '10338679635.7616', '11717604208.8223', '13029697560.9756', '13897738375.2488', '15091930835.7349', '15794972847.1683', '15656342015.855', '16330810303.9159', '15746224409.8', '17102623876.2283', '18881765437.2151', '20662525941.2986', '24405791044.7761', '28267410542.5164', '32351184234.3157', '40715240468.9375', '42067974595.4411', '49567521669.9098', '59178013927.8285', '59393056426.3323', '67182015335.7602', NULL),
('LSO', 'PIBC', '34579308.4138317', '35699286.0142797', '41859162.8167437', '47039059.2188156', '51938961.2207756', '54878902.4219516', '56698866.0226795', '59260814.7837043', '61444771.1045779', '65966680.6663867', '68738625.2274954', '76482102.9082774', '80915831.9240276', '121181556.195965', '150846210.448859', '149560513.860717', '147654093.836247', '193307267.709292', '266559337.626495', '290142517.814727', '431561376.476631', '434188034.188034', '326947872.536379', '355443856.027287', '302989222.531011', '247678018.575851', '290590809.628009', '369351669.941061', '429733890.477238', '451443169.25306', '544583156.185985', '608771230.941948', '720546984.57223', '721608470.789852', '755041117.494649', '859088528.025144', '815946782.034285', '859809027.777778', '819420074.887398', '801538587.445781', '771261702.566698', '706400237.476854', '656752925.851161', '969167242.460273', '1234215384.85355', '1368352564.16255', '1428852974.69513', '1597499474.0635', '1630672199.01279', '1708787736.28315', '2175692207.16078', '2487363974.75462', '2328215736.20033', '2334989648.03313', NULL),
('LTU', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10506695073.8054', '10287023246.234', '8562311026.88874', '7424597884.34971', '6958636949.80629', '7904895790.98773', '8426600000', '10128700000', '11254050000', '10971375000', '11434200000', '12159225000', '14163949141.8999', '18608709856.5781', '22659294573.2621', '26085307221.8514', '30246361656.8291', '39325985930.8432', '47438363056.4474', '37050081723.0274', '36709511568.1234', '43083067994.0349', '42343559195.8302', '45931968473.664', NULL);
INSERT INTO `pays_indicateur` (`code_pays`, `code_indic`, `1960`, `1961`, `1962`, `1963`, `1964`, `1965`, `1966`, `1967`, `1968`, `1969`, `1970`, `1971`, `1972`, `1973`, `1974`, `1975`, `1976`, `1977`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1984`, `1985`, `1986`, `1987`, `1988`, `1989`, `1990`, `1991`, `1992`, `1993`, `1994`, `1995`, `1996`, `1997`, `1998`, `1999`, `2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`) VALUES
('LUX', 'PIBC', '703925705.942958', '704145671.350213', '741509480.796284', '791140595.772755', '903158753.943622', '921600736.304026', '968440149.470951', '974721762.535327', '1066447130.82052', '1234878980.502', '1519040258.16862', '1582609657.44944', '1981628448.35487', '2719572345.27013', '3317449357.91218', '3254610946.58331', '3567483490.07315', '3948591333.7085', '4916865633.40592', '5748868602.09136', '6272826044.97172', '5266077683.61582', '4795757990.46442', '4714376725.83826', '4624988690.30997', '4769597866.7029', '6966599241.4665', '8670639762.29065', '9814025891.38782', '10459570434.0704', '13315901255.4322', '14415689072.6521', '16170973400.2509', '16594891557.8358', '18445827827.3451', '21729575807.3344', '21630543713.355', '19460337843.9332', '20340193376.3058', '22267745365.4379', '21303021927.4', '20998210290.8277', '23285902503.2938', '29095033860.0451', '34209333656.1683', '37023578570.3626', '41779066643.3891', '49207986176.4555', '54963951911.8142', '50141325205.458', '52143650382.9908', '58956127431.0826', '56292381076.328', '60130847623.6353', NULL),
('LVA', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5715853652.87783', '6827011058.96701', '7690315589.14665', '7447002856.7553', '6756418263.69451', '4848056772.31365', '4467987271.30202', '5060854731.05477', '5235719778.6716', '5585292782.56922', '6133234179.75373', '6616957681.24198', '7288524472.50101', '7833068425.39159', '8313047743.57121', '9314784080.02692', '11186452600.7262', '13761569544.9926', '16041840426.2666', '19935046397.2163', '28765687041.6504', '33669367720.4659', '25875781250', '24009680459.9868', '28480338367.6157', '28372577696.5265', '30956691627.5877', NULL),
('MAR', 'PIBC', '2037154689.04441', '2025693486.96828', '2379611062.83602', '2657252509.32124', '2798345225.92842', '2948325264.30195', '2876395613.08171', '3046339294.53611', '3271415867.99723', '3651615453.01848', '3956328426.04486', '4356633663.36634', '5074117544.77482', '6242177798.33938', '7675408485.51421', '8984824182.60333', '9584323309.12136', '11049896742.3889', '13236854105.1672', '15912133569.2852', '21079357821.4703', '17108443052.4138', '17091648680.0598', '15642990733.0587', '14171045911.1288', '14294246248.6336', '18722705505.0305', '20656951246.6474', '24633853687.6534', '25271642768.7004', '28839382990.7526', '31014466120.3347', '32042164441.3212', '30137111517.3675', '34085406932.522', '37183957845.4333', '41383907571.2204', '37263566705.1538', '40021694630.8991', '39734023742.7921', '37020609824.9576', '37724674865.0801', '40416114690.137', '49822651701.729', '56948015336.0397', '59523857868.0203', '65637107776.2619', '75226318359.375', '88882967741.9355', '90908402631.2523', '90770671431.6696', '99211339029.2806', '95903690325.5715', '103835702813.634', NULL),
('MCO', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '293073868.023221', '327651487.962757', '402460333.237637', '523552815.119127', '563939670.704419', '711922994.225545', '735339911.935065', '811250927.388998', '1000535735.38751', '1209898293.46372', '1378130995.65913', '1205166025.51592', '1143229071.77943', '1092551781.01486', '1037314956.25083', '1082851076.52158', '1515209588.2378', '1839095595.25655', '2000674667.08261', '2010116851.20284', '2481316053.85316', '2480497547.84881', '2737066955.91266', '2574439973.17387', '2720297738.93904', '3130270918.79061', '3137848783.08404', '2840182191.77105', '2934578788.86478', '2906009307.6651', '2647883820.18625', '2671401082.76436', '2905973022.1746', '3588988600.70294', '4110348444.49411', '4280072625.97622', '4663488363.0977', '5974371695.95045', '6919241412.09365', '5557579883.30092', '5350993377.48344', '6074506533.22213', NULL, NULL, NULL),
('MDA', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3592856080.02915', '3094567110.11286', '2319243406.66602', '2371812882.20448', '1702314342.68173', '1752995321.34191', '1695130491.66527', '1930071454.73575', '1639497206.70391', '1170785047.79461', '1288420222.94787', '1480656884.38462', '1661818168.4226', '1980901553.51226', '2598231467.43671', '2988172424.46608', '3408454197.89191', '4402495921.29332', '6054806100.84681', '5439422031.39627', '5811604051.96737', '7016162818.43742', '7284686576.2835', '7969618965.90078', NULL),
('MDG', 'PIBC', '673081724.075966', '699161943.856733', '739286906.851163', '759345862.970929', '802482182.923768', '833563472.161911', '900264583.687729', '956436931.141842', '1031669636.36062', '1056391054.53794', '1111859569.77066', '1199507629.99222', '1341590681.586', '1653062347.36378', '1917508190.04689', '2283049233.28581', '2181844193.92388', '2358930406.42896', '2669755115.50372', '3463565881.42215', '4042139901.36379', '3594868208.41664', '3526198070.09789', '3511573991.89606', '2939485471.50097', '2857889712.4808', '3258288890.58647', '2565634382.28729', '2442507588.38468', '2498059014.77295', '3081479800.28735', '2653141958.52585', '3024459293.88938', '3370842210.90955', '2977040884.23097', '3159901108.51109', '3995028428.83824', '3545776813.20358', '3738704582.03298', '3717515282.53319', '3877673634.58854', '4529575232.98509', '4397254714.88337', '5474030227.59457', '4363934416.53802', '5039292946.96233', '5515884434.37392', '7342923619.71527', '9413002737.30578', '8550363829.09605', '8729936135.74488', '9892702357.56691', '9919780221.93198', '10613494031.3832', NULL),
('MDV', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42463576.1589404', '44781456.9536424', '47935843.7935844', '57829787.2340426', '109503546.099291', '127154929.577465', '141902097.902098', '141268980.477223', '168610478.359909', '189535398.230089', '215089005.235602', '244468292.682927', '284853358.561968', '322326642.335766', '355884383.08887', '398988954.970263', '450382327.952421', '508223603.228547', '540096400.169924', '589239757.009346', '624337143.585387', '802442810.457516', '828240882.492352', '949867661.833266', '1075605492.18297', '992473987.301945', '1303375806.06689', '1541978558.62324', '1891633531.16451', '1984639640.86858', '2134104883.7014', '2162990126.20789', '2113179303.61211', '2299843167.3684', NULL),
('MEX', 'PIBC', '13056164925.448', '14153954349.0897', '15221053213.1887', '16936337667.6289', '20070134740.9317', '21829715343.8799', '24337233447.211', '26556372081.1913', '29363632833.6558', '32515754313.9575', '35541711470.3873', '39200879415.8614', '45178119326.7936', '55271303176.3935', '71976542927.466', '88003982688.6386', '89023916066.8009', '81825780563.8082', '102517450025.753', '134540322292.806', '194356825709.199', '250083027275.13', '173720847690.773', '148866911934.175', '175632163244.416', '184473097296.041', '129440191340.197', '140263673924.031', '183144276294.09', '222977042346.502', '262709785592.711', '314453895611.752', '363609268789.416', '503962814551.767', '527318769550.83', '343792780638.899', '397404138184.313', '480554647428.728', '502010268264.169', '579459682094.357', '683647980782.407', '724703571306.821', '741559499084.745', '713284260879.765', '770267585947.191', '866346483685.297', '966735935557.751', '1043394940067.71', '1099073123654.95', '895313142212.023', '1051627949327', '1170085556895.86', '1186460890129.93', '1260914660977.14', NULL),
('MHL', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '31020000', '34918000', '41749000', '45144000', '43879000', '55989000', '62983000', '70688000', '72798000', '78476000', '82507000', '91063000', '99461000', '108071000', '120230000', '110858000', '106289109.336', '108702067.9925', '107978893.1392', '110937729.4126', '115152142.7373', '124735071.9054', '126887585.4517', '131106365.5396', '137744500', '143615000', '150041700', '152785100', '152116100', '163917000', '172956700', '184358700', '190914600', NULL),
('MKD', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4471828621.90813', '4694744806.58659', '2316618514.75247', '2550194959.23946', '3381270267.42967', '4449375524.65113', '4422159848.42906', '3735312199.79553', '3571043202.36226', '3673288165.11436', '3586883988.95646', '3436961384.81241', '3791306757.66238', '4756221628.61111', '5514253043.38147', '5985809059.97008', '6560546900.04109', '8159825620.389', '9834034351.06299', '9313573964.98007', '9338674078.31276', '10395222333.7584', '9576482628.00609', '10195404131.453', NULL),
('MLI', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '275494477.836101', '343771973.18594', '339913866.756618', '359772314.994898', '430096741.954649', '486617279.362262', '563683703.008579', '538747340.567246', '830710613.969321', '939228016.013939', '1049838549.91245', '1222702571.75657', '1595422953.90213', '1787338105.26429', '1493651106.01184', '1327378899.51094', '1294458069.91867', '1311342831.35984', '1313685007.54614', '1678328288.56336', '1931545340.21897', '1947794155.27683', '2007784672.59999', '2421172496.58602', '2422840268.74081', '2852581755.30527', '2677966905.01596', '1762703059.26754', '2466160215.33319', '2619086427.60676', '2475185559.41167', '2596828335.69789', '2570429654.9005', '2422482317.56719', '2629739067.46746', '3342824259.82493', '4362439886.7199', '4874178417.19164', '5305317554.72495', '6122644014.78684', '7145394015.23154', '8737687352.70079', '8964480570.32521', '9422267259.9894', '10647545670.1763', '10340794110.1366', '10942727309.5296', NULL),
('MLT', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '250728829.112117', '264578308.927222', '295106775.012466', '345616069.513506', '376081181.817504', '474618292.692559', '527936892.800231', '625563347.403691', '793673674.476254', '1001288245.08798', '1250199056.41834', '1243509858.29479', '1234474742.04426', '1165730172.87418', '1101807300.90927', '1117797224.84509', '1435038037.42227', '1751293215.65363', '2019503791.23407', '2118655299.63572', '2547330284.04418', '2750215016.02264', '3021944632.33295', '2709194765.69239', '2998504391.77827', '3599683395.46889', '3671827860.9798', '3633464750.30678', '3809619583.8411', '3907947937.46914', '3957418082.79925', '3917620727.92241', '4296164768.28161', '5119621569.32049', '5643525281.93441', '5980795755.74103', '6390123590.13841', '7513834699.60697', '8554293727.08674', '8099400960.97627', '8163841059.60265', '9302057269.94718', '8863076923.07692', '9642326075.41158', NULL),
('MNE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '984279596.4', '1159891560', '1284504508.58333', '1707662607.75', '2073255525.20487', '2257174480.78597', '2696020574.58286', '3673382211.86789', '4538345344.90366', '4158135025.80555', '4114881346.94419', '4501753897.55011', '4045813953.48837', '4416083089.99204', NULL),
('MNG', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2310099114.66667', '2552401920', '2725736618.66667', '2098734592', '2186505472', '2896178858.66667', '3020611584', '3204461568', '3576966794.66667', '2560785662.91532', '2379018323.22625', '1317611862.77556', '768401665.820307', '925817089.527828', '1452165052.54713', '1345719435.14958', '1180934217.40119', '1124440238.12551', '1057408608.43579', '1136896162.14218', '1267997923.03269', '1396555772.03794', '1595297301.45651', '1992066758.84423', '2523359940.71209', '3414053250.94549', '4234894168.15659', '5623236707.52471', '4583834427.36474', '6200357070.1148', '8761426370.55877', '10321968594.7799', '11516409581.2988', NULL),
('MOZ', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3526259828.24207', '3532146140.68091', '3615064966.01116', '3237772708.41975', '3372771556.9797', '4458235938.92328', '5243440029.51682', '2353864264.67743', '2093393433.26975', '2314103709.61371', '2512109516.61781', '2748955274.34396', '1968901449.82406', '2027650517.82227', '2162771442.38775', '2246791389.00157', '3241719358.05202', '3810025425.38063', '4324474009.61438', '4536278939.24475', '4310090791.18029', '4075049537.3821', '4201332885.28416', '4666197195.03197', '5697991242.10618', '6578515330.9933', '7095910826.88243', '9192939073.87628', '11026247458.2388', '10726631099.5579', '10165353591.1673', '13244880034.8481', '14952946846.3451', '15630302813.9535', NULL),
('MRT', 'PIBC', '92609243.6889684', '107726205.64352', '111148610.793216', '113797382.615723', '151897202.546491', '172767212.410801', '180340652.907946', '191221776.831632', '210695182.692288', '199643447.641197', '209348256.001325', '227051055.184993', '265009396.653643', '333731886.122433', '414772366.009093', '475916497.69628', '524407949.855849', '540635401.242895', '544424587.056594', '644070390.586697', '709041462.208777', '747994670.344005', '750214401.613315', '788371840.318764', '726937308.885277', '683193876.889148', '802890746.890756', '909820596.846435', '957377548.471449', '981529430.10921', '1019600785.27212', '1443688869.96039', '1464392416.14671', '1249944999.42056', '1315932644.95246', '1415296704.11812', '1442598431.0096', '1401946853.20672', '1222431503.21526', '1194629230.98218', '1081207677.52664', '1121564037.89709', '1149655880.95346', '1285178265.97727', '1496460378.86792', '1857835643.13107', '2699181754.65376', '2837533270.09211', '3585284791.60448', '3027020496.19272', '3526947608.88326', '4136083638.09827', '3958702640.07821', '4158182904.24541', NULL),
('MUS', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '706988627.655376', '827093630.324683', '1019634978.35642', '1216227805.46353', '1136544231.36451', '1147187567.65208', '1082934402.19357', '1094857359.69514', '1044926097.46651', '1080643202.28309', '1469050658.08639', '1888752207.107', '2143480497.18502', '2191101651.23305', '2653485952.13319', '2856889162.09058', '3224265824.18732', '3263363787.82618', '3558143642.14256', '4040342059.56741', '4421952121.4867', '4187375887.65947', '4169672974.23128', '4291171395.71086', '4582562397.94313', '4536544699.05727', '4767303153.04439', '5609836353.56371', '6385691315.22535', '6283796154.76327', '6731536244.19443', '7792063566.51501', '9641077098.19803', '8834661042.93519', '9718233910.68203', '11252405860.1091', '11442096505.8236', '11929250814.3322', NULL),
('MWI', 'PIBC', '162960130.465802', '174580139.768776', '183120146.605902', '190820152.770523', '194740155.908875', '229460183.705713', '260400208.476282', '269812781.79847', '245160098.113071', '265800106.373203', '290520116.266151', '365389567.21636', '406084197.385471', '444302221.260027', '548618789.94423', '613196872.560739', '670309252.98248', '806265763.845459', '948983346.706692', '1058297637.16218', '1237662106.19397', '1237686924.81183', '1180094061.48178', '1223225049.97144', '1208026105.22578', '1131349973.61292', '1183671770.92928', '1183071377.49194', '1379923808.24718', '1590201669.18874', '1880784193.28064', '2203536041.0229', '1799529368.75373', '2070647130.01298', '1181801915.08979', '1397454123.06868', '2281039098.71225', '2663238981.09817', '1750585204.64653', '1775920039.08836', '1743506286.64581', '1716502069.29157', '2665158942.8967', '2424656666.0654', '2625127097.7198', '2754995876.60249', '3116789657.89251', '3647817218.57435', '4276769712.29181', '5030639934.35772', '5398616984.59149', '5627898036.56304', '4240492848.82334', '3705386789.60511', NULL),
('MYS', 'PIBC', '2441020461.96574', '2422724545.02623', '2543810830.68455', '2708474919.40261', '2899751387.78472', '3187851274.02843', '3392767687.16149', '3515850936.49868', '3667209741.97392', '4050763016.35468', '4276665285.75357', '4514334715.05719', '5364357955.45827', '8150688760.48274', '10100863610.7616', '9890359225.08049', '11753574870.1705', '13975278668.2126', '16658322458.6295', '21602645098.2363', '24937045114.1549', '25463038428.6775', '27287163523.1103', '30682563370.1165', '34565849168.8384', '31772244236.5624', '28243103019.7412', '32181695658.7954', '35271881995.8247', '38848565930.1651', '44023808215.1766', '49133851511.5406', '59151684123.1795', '66894448089.1039', '74481194898.7163', '88832454351.7055', '100851389334.173', '100168846973.444', '72175568305.8018', '79148158887.9154', '93789473684.2105', '92783947368.4211', '100845526315.789', '110202368421.053', '124749736842.105', '143533152129.483', '162691922355.145', '193552511883.591', '230988518916.093', '202251384991.501', '247533525517.698', '289548374436.865', '305263811733.188', '313159097400.743', NULL),
('NAM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2434779477.62283', '2259233333.20725', '2128058580.0987', '2308102953.57421', '1960596972.76624', '1615794945.85013', '1816728871.20638', '2310417134.62452', '2506590439.49386', '2547362838.16825', '2804357081.08613', '3012725712.20596', '3448309729.64428', '3218434944.07287', '3636647702.23035', '3942494510.05422', '3945295658.12189', '4102682849.28585', '3826538589.95731', '3818964345.18953', '3908645559.67643', '3546791604.35028', '3361236316.59236', '4931280096.42091', '6606866456.87856', '7261301442.47414', '7978676469.77384', '8740923997.55016', '8486515516.06361', '8875960840.05464', '11281996426.0438', '12412389467.3036', '13037393422.6553', '13113069776.5948', NULL),
('NER', 'PIBC', '449526872.565561', '485785231.729353', '531736599.930736', '586294879.4719', '582816396.216401', '673383510.242124', '702296079.857695', '665586872.839162', '641214226.839012', '625867984.42818', '649916621.179857', '693573704.422866', '742779659.455166', '946385104.967731', '1026137112.43707', '1048690931.5406', '1064517600.10051', '1291458043.7403', '1774365587.86851', '2109277663.09748', '2508524715.79516', '2170893417.98129', '2017612217.82752', '1803099561.08393', '1461243326.83775', '1440581653.32328', '1904097000.74963', '2233006101.94476', '2280356194.14559', '2179567111.0004', '2480673304.74309', '2327986143.17193', '2344987607.6248', '1606581743.78497', '1563207236.88226', '1880803264.08886', '1987770780.91155', '1845599695.86304', '2076737446.20658', '2018193598.25387', '1798374532.94855', '1945327545.88815', '2170481497.62212', '2731416281.32537', '3052898685.69525', '3405134555.29166', '3646727993.03698', '4291363546.82479', '5403364453.52777', '5397121962.02425', '5718589550.16349', '6409169698.10695', '6611341028.98716', '7407418427.65768', NULL),
('NGA', 'PIBC', '4196174379.57502', '4467287731.99387', '4909399024.98991', '5165590041.59062', '5552931029.14443', '5874422511.54977', '6366792664.14672', '5203135937.28125', '5200895982.08036', '6634187316.25367', '12545849083.0183', '9181769911.50443', '12274416017.7976', '15162871287.1287', '24846641318.1242', '27778934624.6973', '36308883248.731', '36035407725.3219', '36527862208.7133', '47259911894.2731', '64201788076.6283', '61076493506.4935', '51397461685.8238', '35451565749.2355', '28500815241.471', '28873977228.1115', '20721499308.4371', '24093203444.564', '23272161396.8853', '24231168858.7187', '30757075595.3681', '27392886872.5547', '29300921687.0255', '15789003752.7594', '18086400535.5777', '28546958641.2735', '34987951375', '35822342617.6978', '32004613750', '35870792987.9432', '46385996027.4279', '44138014092.2627', '59116868249.8401', '67655840108.1547', '87845403978.2742', '112248324602.677', '145429802541.747', '166451202370.171', '208064724514.151', '169481270114.984', '369062403181.945', '411743801711.642', '462979245902.413', '521803314653.784', NULL),
('NIC', 'PIBC', '227223322.141537', '244144236.65331', '269283803.686825', '297324163.095513', '347119918.158577', '564290020.387905', '607140010.483016', '657140010.7518', '692859984.592478', '750000002.903011', '778569938.850714', '828569953.494756', '878570045.437846', '1092900014.80582', '1521400011.51419', '1581599958.61092', '1836899998.90966', '2226999873.71582', '2127699978.79397', '1567599981.70113', '2144300006.19137', '2474700227.03085', '2454499872.05091', '2753100057.78253', '3117599872.09613', '2683699935.3204', '2885799993.92179', '3851200117.73784', '2630900095.59203', '1013184755.57026', '1009455476.10732', '1488804123.71134', '1792800000', '1756454281.21082', '3863185119.04762', '4140470000', '4308351902.78601', '4389965590.96538', '4635267224.84195', '4855717874.68247', '5107329007.0922', '5323146565.70315', '5224213017.54386', '5322437645.00332', '5795568204.64532', '6322582498.50568', '6786294615.82242', '7458103363.41708', '8491388728.00293', '8380731881.31468', '8938209651.43938', '9898576240.9529', '10644947614.7401', '11255608410.0506', NULL),
('NLD', 'PIBC', '12276734172.0828', '13493833739.9949', '14647057370.1418', '15891241386.291', '18699380731.3465', '21000586933.2041', '22867203317.4022', '25087562181.3218', '27817605743.2503', '31503868835.1853', '37530195896.9988', '43837956704.2607', '53797014075.8034', '70646493615.0087', '85792917288.3023', '98582789299.4075', '107353697532.922', '124905224746.341', '153268395396.211', '176682248050.093', '191907522611.394', '161405345668.109', '155844670875.629', '150894304300.826', '141519993269.231', '141454263402.335', '197522592192.84', '240972207027.85', '257556022633.515', '254041637431.155', '313037995643.229', '322055355964.168', '356928304385.965', '347672096820.123', '372826896234.411', '444781773263.794', '442598692810.458', '409785407725.322', '431174183514.774', '439937140421.905', '413396904367.054', '426091275167.785', '464478637304.724', '570917607223.476', '646069794441.03', '672357359598.07', '719376019921.198', '833147764794.443', '931327892379.771', '858033892517.88', '836389937229.197', '893757287201.688', '823139235420.959', '853539351964.458', NULL),
('NOR', 'PIBC', '5163271598.15702', '5632460936.54576', '6066976682.67364', '6510239502.76489', '7159202706.48027', '8058681060.159', '8696460205.3397', '9514496703.39762', '10159934136.7838', '11063065083.4888', '12729703621.7783', '14476253915.1632', '17219726177.1045', '22341912657.3936', '26875823600.556', '32565956876.9251', '35575735361.4955', '41069784915.9388', '46015298628.4646', '52547737998.8547', '63714366699.0606', '62867322937.5381', '61850635264.952', '60779973685.6532', '61098572566.3175', '64257200018.6107', '77202861508.9185', '92447792207.7922', '100057081479.208', '100770511984.937', '117623688036.168', '119657406407.626', '128298978196.154', '118168337068.832', '124519241668.556', '148919844677.358', '160158299482.154', '158223061045.607', '151139149911.863', '159045286696.071', '168288531891.204', '170922851073.768', '191927027230.141', '224880794327.844', '260029106207.989', '304060069848.661', '340041735966.736', '393479385840.205', '453885460992.908', '378849191624.702', '420945705225.424', '490806911071.277', '500029909755.049', '512580425531.915', NULL),
('NPL', 'PIBC', '508334416.764741', '531959564.552029', '574091104.356191', '496948970.352531', '496098775.308642', '735267086.34375', '906811948.818919', '841974030.099834', '772230299.767872', '788641965.432099', '865975308.641975', '882765471.604938', '1024098804.93827', '972103599.693013', '1217953570.83404', '1575789285.33688', '1452789370.88004', '1382400000', '1604162508.40427', '1851250008.33333', '1945916583.33333', '2275583316.66667', '2395425209.59809', '2447174838.56563', '2581215829.60192', '2619913975.74955', '2850780936.93948', '2957252078.56053', '3487009700.10652', '3525228045.68948', '3627559252.20577', '3921476084.89072', '3401211581.29176', '3660041666.66667', '4066775510.20408', '4401104417.67068', '4521580381.47139', '4918691916.53516', '4856255044.39064', '5033642384.10596', '5494252207.90502', '6007061224.4898', '6050875806.66403', '6330476434.54937', '7273933992.74548', '8130258976.02985', '9043715355.8881', '10325618017.379', '12545438605.3959', '12899651883.5748', '15994094606.9709', '18850351852.8989', '19206800719.3069', '19294348174.0026', NULL),
('NZL', 'PIBC', '5485854791.97096', '5670064168.21773', '6077496267.76294', '6638937283.13963', '7274144350.81809', '5654463586.00366', '5863733230.97616', '5961418093.53003', '5180597620.64135', '5761588761.69421', NULL, '7878822850.54818', '9524793388.42975', '12739668846.5285', '13861003861.0039', '12778405240.5692', '13515198752.9228', '15319443072.9732', '18382107023.4114', '20550936592.2068', '23039953676.8964', '24181167263.3419', '23885651857.2469', '24041798107.2555', '21445089702.3748', '24431202046.0358', '30320025348.5425', '39997523986.3819', '45112399355.8776', '43803041960.1113', '45097711109.7831', '42344699527.3464', '41234049340.7061', '46265693269.1776', '54667562122.2297', '63437167906.4825', '69563618704.0377', '65475004727.9834', '55641349544.7129', '58176345425.2945', '52011592675.5368', '53305709023.9411', '66020996599.1424', '87440454378.8934', '102986218487.395', '113791466880.794', '110205483337.405', '135294592082.535', '130459339598.565', '118952901992.338', '143466743661.01', '163841244615.035', '171461397175.936', '185787824483.114', NULL),
('OMN', 'PIBC', '44234654.0484101', '45634493.2717119', '56273199.1375344', '59912759.280758', '61872522.4348015', '63279972.0888262', '67759970.1128138', '107151836.815318', '188879842.386377', '239999799.728561', '256319786.110103', '301014924.480931', '366883549.257472', '483066990.449516', '1645917657.25951', '2096699074.4138', '2560220086.03516', '2741169984.67581', '2740301333.85024', '3733352666.9706', '5981760088.6734', '7259120021.71803', '7554719229.45066', '7932541574.24548', '8821443172.07307', '10005645467.1275', '7324167383.94242', '7811183251.52226', '8386215932.36044', '9372171727.04422', '11685045607.8469', '11341482538.7575', '12452275788.2838', '12493108040.8886', '12918855771.2386', '13802600904.5003', '15277763467.7569', '15837451381.2413', '14085373242.7094', '15710148340.0807', '19507412380.9157', '19452015761.4835', '20142782997.2208', '21633810317.4324', '24763589276.3415', '31081924827.9236', '37215865059.4237', '42085305930.9258', '60905332090.4357', '48388296879.0032', '58641352878.4278', '69521977153.3923', '77497269805.4572', '79655917417.1363', NULL),
('PAK', 'PIBC', '3707055833.87054', '4054599105.36005', '4233095505.40624', '4540529028.7576', '5130407637.42946', '5884712000.44842', '6466610634.46042', '7403821779.6402', '8090088418.53273', '8632927108.67199', '10027088676.7101', '10602058000.4704', '9309109504.48076', '6324884160.17501', '8773030763.9036', '11340000682.6128', '13338485498.2049', '15126060232.1348', '17820101315.3363', '19707980059.5957', '23689697675.6467', '28100606600.3566', '30725972227.8188', '28691890864.9248', '31151825048.1397', '31144920866.5131', '31899072715.3606', '33351526336.2521', '38472741071.3218', '40171021119.7757', '40010425587.1428', '45451961233.9905', '48635242274.1567', '51478354558.3299', '51894795657.7709', '60636071684.1918', '63320170084.4076', '62433340468.0228', '62191955814.3478', '62973855718.8874', '73952374969.7995', '72309738921.3329', '72306820396.2325', '83244801092.7096', '97977766197.6724', '109502102510.883', '137264061106.043', '152385716311.916', '170077814106.305', '167874973609.977', '177165635077.065', '213587413183.996', '224383620829.57', '232286781110.56', NULL),
('PAN', 'PIBC', '415800032', '463700032', '504800032', '559500032', '600800000', '659900032', '719000000', '800700032', '861400000', '945400000', '1016300032', '1146700032', '1260000000', '1441200000', '1647100032', '1844800000', '1959299968', '2077400064', '2463000064', '2819099904', '3810300000', '4312700000', '4764700000', '4891900000', '5106300000', '5402000000', '5613700000', '5638300000', '4874500000', '4887500000', '5313200000', '5842300000', '6641400000', '7252700000', '7733900000', '7906100000', '9322100000', '10084000000', '10932500000', '11456300000', '11620500000', '11807500000', '12272400000', '12933200000', '14179300000', '15464700000', '17137000000', '21121900000', '24884000000', '25925100000', '28814100000', '33270500000', '37956200000', '42648100000', NULL),
('PER', 'PIBC', '2503708500.5641', '2822764382.43284', '3199617471.26866', '3505470788.30224', '4241381118.54851', '5026099956.24545', '5947054338.81438', '6029751896.56619', '5583979280.16697', '6250645606.84668', '7235141852.32276', '8069766829.1457', '8945736419.97765', '10702842298.3989', '13490954944.4947', '16413418808.9469', '15519319139.348', '14230997983.1178', '12162093074.503', '15542640785.3234', '17655611231.3512', '21074067087.3081', '21216509116.106', '16885668785.5996', '17132968269.2441', '16110000406.9728', '14840000374.8899', '20153333842.4493', '15029999286.1133', '21902935995.6267', '25710059622.0643', '33988660232.1262', '35310819275.5173', '34239590086.5022', '43719805475.4496', '52047686602.5547', '53997715379.773', '56919424253.5965', '54523307699.719', '49308109291.7563', '50936239280.8577', '51592179795.66', '54452491886.5129', '59034091562.2053', '66730306799.5311', '74963815412.6214', '87985689388.3792', '102172270670.773', '121571548180.023', '121200381042.497', '148522810971.502', '170564249004.954', '192628494178.354', '202349846974.371', NULL),
('PHL', 'PIBC', '6684685516.84327', '7257047668.12783', '4399815072.88926', '4875248019.51617', '5271360642.23318', '5784398850.00539', '6371486692.83872', '6809047599.74237', '7591602924.47986', '8408265263.7862', '6687223655.87752', '7408296134.04833', '8017418383.19013', '10082910550.6949', '13781190369.8478', '14893969268.8422', '17097658629.6548', '19648040090.5671', '22706283655.4269', '27502354651.4559', '32450398739.9681', '35646642135.5476', '37140164100.3261', '33212130822.7708', '31408478618.4519', '30734266462.1757', '29868363901.1303', '33195974365.3779', '37885485202.8788', '42575217414.9429', '44311595229.859', '45417505303.2898', '52976363147.6418', '54368183871.6747', '64084543195.2152', '74119868201.9048', '82848194394.7603', '82344374413.9339', '72207022471.2602', '82995145599.6662', '81026294682.2965', '76261998623.045', '81357657790.1449', '83908205719.0885', '91371236938.632', '103065972408.034', '122210719245.902', '149359920005.894', '173602533344.875', '168333540385.906', '199589447424.074', '224142872191.204', '250240023744.459', '272066554885.95', NULL),
('PLW', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '76888000', '83855000', '82451000', '75907000', '83527000', '95237000', '108203000', '113213000', '117320000', '113485000', '159855700', '167035100', '168681200', '173898900', '191243000', '206232600', '208666100', '211558600', '213354500', '198202400', '197558700', '217377500', '232478600', '247043400', NULL),
('PNG', 'PIBC', '230496032.972722', '244832035.023504', '261184037.362676', '275968039.477545', '305312043.675238', '344159480.344943', '390973233.284802', '441706910.068317', '485160824.280435', '551237316.608803', '645537126.217942', '717716130.493883', '858802035.928144', '1299105240.73285', '1467346059.99713', '1356591176.85561', '1511856584.25833', '1640763204.44781', '1947947524.33347', '2293621944.3664', '2545983007.89984', '2498068350.66865', '2368584969.53284', '2562492524.81761', '2552526263.0759', '2423373088.07358', '2648033765.69899', '3143848331.31402', '3655979702.45646', '3546460176.99115', '3219730365', '3787352286.66667', '4377984100', '4974662910', '5502648500', '4636113480.00002', '5155485419.7', '4936605079.99998', '3789428160.00001', '3477060138.33333', '3521348154.79666', '3081029665.98233', '2999542369.42117', '3536459111.2438', '3927114465.90565', '4869032258.06452', '5521895424.8366', '6330639730.63973', '8000370370.37037', '8090942028.98551', '9717175432.14417', '12873185082.0865', '15391272797.5005', '15413232345.734', NULL),
('POL', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '64712371654.1385', '83861124789.2438', '92527771036.3659', '94201159958.9319', '108678548947.395', '139412439030.425', '157079211268.128', '157550131674.844', '173337544225.125', '168224897393.821', '171708027298.226', '190901056474.267', '198679176378.605', '217514167875.179', '253525770715.543', '304412019236.713', '343338920225.625', '428948928326.165', '530185123692.512', '436476394987.34', '476687891752.065', '524362764952.072', '496205742361.431', '525865974814.909', NULL),
('PRT', 'PIBC', '3193200404.37297', '3417516639.37596', '3668222357.65702', '3905734459.72693', '4235608177.67102', '4687464054.83455', '5135387845.97108', '5740241165.63433', '6354262628.33537', '6969025825.62869', '8109032775.45328', '9202512367.49117', '11240223128.2431', '15092052330.3352', '17514112075.7695', '19349512941.1765', '20334835543.7666', '21441635411.2101', '23489924726.2774', '26625439344.2623', '32899759311.1734', '31980423452.7687', '30530759334.0061', '27242331885.6316', '25220451794.029', '27118476173.6675', '38749715721.7531', '48187667852.5687', '56352797353.7604', '60600056659.0272', '78721607509.4923', '89242382961.0101', '107602689040.689', '95019103603.042', '99698453260.8696', '118133634071.912', '122629812841.175', '117046198970.84', '123981736420.303', '127465545493.288', '118358489957.619', '121545880984.34', '134228697534.35', '164964195259.594', '189195659111.086', '197299605780.232', '208556265151.808', '240157009460.916', '262017296166.035', '243731066786.88', '238303443425.21', '244895101712.451', '218000200299.73', '227323728006.703', NULL),
('PRY', 'PIBC', NULL, NULL, NULL, NULL, NULL, '400129691.088052', '421700441.806492', '451524124.539071', '477012512.686865', '512728946.180694', '548758098.326795', '609047285.312098', '697291727.53861', '889357059.74323', '1199618980.13301', '1351889402.98354', '1540820245.62378', '1912353339.95933', '2350329156.78278', '3135123879.50964', '4094810488.15744', '5219516810.12299', '5067450002.41505', '5237432542.35107', '4067222420.08814', '2966234024.08756', '3439716399.31115', '3778316380.24662', '4082625952.75857', '4599970618.48388', '5695201563.44217', '6984367762.88406', '7157424031.03799', '7249533620.31044', '7870982170.98217', '9062131307.88275', '9788391732.82899', '9965225496.58839', '9024567484.2013', '8392549702.31511', '8195993230.74275', '7662595075.90241', '6325151760.0669', '6588103836.34739', '8033877360.41697', '8734651405.96572', '10662013273.2006', '13794909537.4393', '18504128632.4505', '15929903100.3616', '20030529733.4432', '25071193102.1055', '24611040342.6795', '29009411737.9175', NULL),
('PSE', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2842261249.08593', '3281382696.70953', '3407783959.14353', '3760126839.91275', '4067692861.12389', '4271509595.80352', '4316456402.62911', '4007793546.37782', '3557451046.5733', '3959278954.90714', '4327268305.38559', '4834276370.98668', '4914728157.12703', '5508346521.41084', '6673500000', '7268200000', '8913100000', '10465400000', '11262141134.3655', NULL, NULL),
('QAT', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '301791311.79926', '387700072.409347', '510259928.908807', '793884362.593803', '2401403163.72314', '2512783990.61795', '3284301434.84055', '3617580063.60212', '4052000452.82943', '5633000409.28126', '7829094485.17484', '8661263504.23004', '7596703007.43796', '6467582125.69331', '6704395622.16509', '6153296279.80592', '5053021814.81235', '5446428537.54037', '6038186867.73874', '6487911900.93159', '7360439207.65364', '6883516285.13474', '7646153766.45236', '7156593446.49547', '7374450336.92017', '8137911853.37888', '9059340398.25204', '11297801872.2015', '10255494209.9329', '12393131510.964', '17759889598.0532', '17538461033.0061', '19363735705.6768', '23533790530.5514', '31734065019.4957', '44530493222.1334', '60882141102.5301', '79711810889.5326', '115269776897.725', '97798348829.8202', '125122249141.251', '169804665435.929', '190289829680.715', '203235158977.963', NULL),
('ROU', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '38067565160.5839', '40424526825.7903', '41450779108.6724', '38299106119.9263', '28846858763.0854', '25090303816.8056', '26361161947.6427', '30072623842.2824', '35477055618.9246', '35333677695.2593', '35285888482.0479', '42115494069.2734', '35592337082.8604', '37305099928.1587', '40585886768.9713', '45988510813.5033', '59466017705.5346', '75794733525.1394', '99172613715.9198', '122695850811.978', '170616958884.446', '204338605783.705', '164344371295.287', '164792252745.524', '182610666615.642', '169396055590.796', '189638162013.271', NULL),
('RUS', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '506500146307.614', '516814258695.568', '509381638906.293', '460205414725.771', '435060123490.732', '395086555837.015', '395528488655.671', '391721392325.09', '404926534140.017', '270953116950.026', '195905767668.562', '259708496267.33', '306602673980.117', '345110438693.573', '430347770733.155', '591016690742.937', '764000901159.625', '989930542278.695', '1299705247685.76', '1660844408499.61', '1222643696991.85', '1524916112078.87', '1904793021649.09', '2017470930421.08', '2096777030571.25', NULL),
('RWA', 'PIBC', '119000023.159', '122000015.482', '125000007.805', '128000000.128', '129999995.01', '148799979.6688', '124525702.707383', '159560018.07956', '172200018.0922', '188700037.3087', '219900006.6199', '222952504.04479', '246457838.951694', '290746157.206389', '308458403.980205', '571863502.965144', '637753855.846958', '746650611.645744', '905709080.930258', '1109346136.46684', '1254765643.33997', '1407062526.01096', '1407243132.91752', '1479687582.63555', '1587413091.06568', '1715626336.7703', '1944710688.26155', '2157432667.99326', '2395492695.29464', '2405022587.95017', '2550185692.53721', '1911600232.44433', '2029026956.60567', '1971525717.85556', '753636370.618182', '1293535192.04879', '1382334879.44723', '1851558199.19854', '1989343548.28636', '1817655191.84317', '1734938190.27765', '1674685125.62865', '1677447003.07548', '1845979351.35205', '2089188920.75355', '2581465675.18193', '3110327822.99407', '3775447705.93559', '4796573942.74333', '5308990208.79641', '5698548923.48065', '6406727020.12819', '7219656633.86281', '7521261790.62935', NULL),
('SAU', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4187777706.66667', '4485777635.55556', '5014444259.55556', '6797048699.92487', '9230601615.91796', '14441807078.9067', '44990986123.1937', '46528882433.2214', '63838242167.2597', '74028820450.0737', '80087657403.8483', '111720129709.86', '164308171946.835', '183939395923.512', '152907357293.156', '128859626986.747', '119293133794.195', '103897847413.546', '86961925508.1822', '85695864946.0918', '88256073925.7961', '95344461902.0849', '116778111979.758', '131335915472.951', '136304139411.154', '132151405582.785', '134327104601.473', '142457681255.805', '157743126866.827', '164993858632.323', '145772799590.4', '160957062621.867', '188441864874.667', '183012268441.6', '188551196398.933', '214572800000', '258742133333.333', '328459608764.111', '376900133511.348', '415909018143.01', '519796800000', '429097866666.667', '526811466666.667', '669506666666.667', '733955733333.333', '748449600000', NULL),
('SDN', 'PIBC', '1126364161.7644', '1222860428.55503', '1328259624.72217', '1351234926.33899', '1388282600.1961', '1446869619.31898', '1484491675.71652', '1607409539.36648', '1677771400.56798', '1847501441.26221', '2100229759.04718', '2288340041.03486', '2483055722.23738', '3077254460.30228', '3958931659.84759', '4823090191.91008', '6013210815.66114', '7499005639.37649', '8128719315.0792', '8418407786.60599', '7617256737.16195', '9538009463.3331', '9254395995.69006', '8465226937.27815', '10044297796.1919', '12459385571.0104', '15966649370.3837', '20631219762.3208', '15510324099.0826', '15295635624.4201', '12408647780.4484', '11379221927.0559', '7031933491.84899', '8881010081.24942', '12793798418.3843', '13830369852.313', '9018303128.0189', '11681179570.9007', '11250220602.974', '10682027634.7462', '12257299147.2936', '13182872559.0993', '14803423344.843', '17646271378.9113', '21457886198.4064', '26524992244.986', '35821858723.6658', '45898948553.9203', '54527549913.137', '53149439400.9886', '65632081240.302', '67320779804.4854', '63152209705.4893', '66565889416.8701', NULL),
('SEN', 'PIBC', '792824702.823778', '836493103.623096', '857426088.816364', '886387334.490159', '939145912.1767', '955834759.862078', '984942841.506666', '984605218.072404', '1034293671.33984', '983621121.157075', '1024832777.75711', '1058120593.6019', '1280328105.48844', '1471913585.51327', '1658273944.23688', '2235746641.18269', '2266860710.04572', '2320786617.60052', '2591178824.66591', '3226677956.91441', '3503282842.23796', '3176771658.1875', '3109677903.28702', '2774198930.79025', '2705535967.89287', '2962200081.81328', '4189860373.17635', '5040708745.70087', '4985152887.5532', '4913065118.41844', '5716644524.96413', '5617235857.46673', '6004885304.31566', '5678828409.95202', '3877196945.27751', '4878718880.06611', '5065830114.26508', '4672504141.52065', '5030344290.89813', '5144045092.84698', '4679604921.61551', '4877602012.4664', '5333862343.63202', '6858952716.48403', '8031344239.63806', '8707015063.83319', '9358710763.41854', '11284603480.5523', '13386346542.9706', '12812994669.8104', '12932427724.317', '14440676498.0708', '14045680426.6265', '14791699008.5823', NULL),
('SGP', 'PIBC', '704457699.396959', '764303120.46328', '825879877.401062', '917216011.299226', '893728643.533568', '974186761.484632', '1095902939.91974', '1237415147.37569', '1425020089.06995', '1659044432.14808', '1919496147.30189', '2270330157.67395', '2950257778.82676', '4227574234.01324', '5260730995.15113', '5789229538.77907', '6071574802.60248', '6702713784.13833', '8062400372.34359', '9719674880.23226', '12078880698.5429', '14363051877.5379', '15873552885.2363', '18001987656.7057', '19550103530.8122', '18555053067.3749', '18762738720.8667', '21606296346.125', '26515373243.7234', '31392969307.485', '38899863910.5488', '45473126682.2957', '52157482248.4601', '60644916395.4288', '73775659012.0859', '87891560102.3018', '96400967111.4728', '100163601638.149', '85707550880.7849', '86285332761.7027', '95835970989.329', '89285087394.9509', '91941791943.6165', '97002305536.1569', '114186643421.944', '127417879442.861', '147794117647.059', '179981089530.567', '192231202951.056', '192406441416.028', '236420337242.775', '274065043105.538', '286908399901.813', '297941261088.468', NULL),
('SLB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '25203524.0325638', '28084252.7582748', '28606411.398041', NULL, '50056882.8213879', '40606712.050639', '55272108.8435374', '84539332.282562', '74617096.4785967', '83099107.9066357', '93147039.2548237', '111022089.96223', '151270207.852194', '168715353.097132', '187313261.319237', '188446092.06055', '180219397.527425', '252806783.386983', '232306861.156132', '210737869.652598', '238606299.605651', '310684273.709484', '332286760.858189', '302515026.890225', '320355090.61441', '378778047.197842', '410923236.189102', '464756638.512487', '519334096.714525', '565163750.56079', '567919502.811483', '471177008.057148', '482214092.308964', '435101217.233417', '400464593.025503', '341663053.747461', '332736306.539249', '375109694.525921', '413909879.281265', '456735444.86792', '516209150.326797', '608292551.761226', '597765363.128492', '681587104.773714', '868574141.232093', '989911515.876036', '1096396926.91144', NULL),
('SLE', 'PIBC', '322009478.106707', '327834752.427556', '342721625.556128', '348546926.009245', '371848127.82171', '359379856.248057', '375479849.80806', '348795303.000385', '329860135.024054', '408690163.296065', '434410366.360027', '419549387.020847', '465381103.603727', '575230251.323587', '648590625.925671', '679335916.411326', '594895649.185867', '691777759.267335', '960728331.295844', '1109374711.0164', '1100685875.40484', '1114830499.52549', '1295361911.75877', '995104288.373919', '1087471849.24002', '856890497.055359', '490181456.62441', '701307601.909934', '1055083946.11552', '932974412.385267', '649644826.800447', '779981538.149204', '679997997.597117', '768812334.801762', '911915970.683484', '870758739.40678', '941742152.709895', '850218033.622007', '672375927.347148', '669384768.87263', '635874002.198748', '1079478387.83576', '1239004287.75607', '1371442565.69701', '1431208677.30352', '1627853086.42403', '1887429109.51298', '2158653216.17331', '2505620416.4953', '2453972925.49437', '2578159495.5593', '2925391429.79832', '3529350504.38382', '4136280752.03693', NULL),
('SLV', 'PIBC', NULL, NULL, NULL, NULL, NULL, '877719961.6', '929520025.6', '976199987.2', '1009760051.2', '1049400012.8', '1132920012.8', '1186119987.2', '1263720038.4', '1442319974.4', '1665879961.6', '1884120064', '2328280064', '2941640089.6', '3127959961.6', '3463639859.2', '3573959884.8', '3437200179.2', '3399189149.5462', '3506347772.359', '3661683395.9653', '3800368586.6311', '3771663198.3157', '3958045811.3194', '4189880000.1155', '4372215335.3846', '4800900000', '5311000000', '5954700000', '6938000000', '8085600000', '9500500000', '10315500000', '11134700000', '12008400000', '12464700000', '13134100000', '13812700000', '14306700000', '15046700000', '15798300000', '17093800000', '18550700000', '20104900000', '21431000000', '20661000000', '21418300000', '23139000000', '23813600000', '24259100000', NULL),
('SMR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '853373879.731819', '773907642.414748', '815205233.062791', '879957209.923907', '1122981525.35502', '1317357834.61634', '1375416604.48689', '1469075398.31891', '1687653983.02765', '1899809579.61037', NULL, NULL, NULL, NULL, NULL, NULL),
('SOM', 'PIBC', '180460950.352325', '191660990.858439', '203533070.710314', '216147149.952901', '229531201.852126', '243725900.221596', '257375899.364358', '271781889.251523', '286719887.890669', '300230021.488119', '316147885.344131', '331104597.011628', '416940946.569946', '507028439.326556', '467577426.580885', '710850217.91365', '807275798.953096', '498550866.152822', '564986077.529704', '590419863.985326', '603592653.942155', '699112246.542284', '774419565.926071', '733901342.023081', '788307226.827367', '876404614.97334', '930318731.62226', '1009792742.91164', '1038291312.30908', '1092393020.47939', '917044253.990258', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('SRB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24147996549.5662', '18284194680.3844', '18409364146.9794', '6540247190.33529', '12267175481.2542', '16116843146.4806', '21188704081.2428', '24861483280.6339', '26252007830.4639', '30607991862.4843', '40289556656.1455', '49259526052.7426', '42616653299.9115', '39368633038.1209', '46462547041.1781', '40791444602.9009', '45519650911.4138', NULL),
('SSD', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15550350865.5594', '12231253563.1565', '15727809699.9166', '18830824689.6298', '10368977850.1301', '11804446136.8066', NULL),
('STP', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '76709304.533641', '76553443.3856326', '84617970.6711633', '101315399.609525', '110723361.793262', '123258507.091215', '135181861.925909', '144259256.646072', '183464986.350986', '196473838.854983', '201037916.581571', '248286778.21572', '263328450.308679', '310684635.73614', NULL);
INSERT INTO `pays_indicateur` (`code_pays`, `code_indic`, `1960`, `1961`, `1962`, `1963`, `1964`, `1965`, `1966`, `1967`, `1968`, `1969`, `1970`, `1971`, `1972`, `1973`, `1974`, `1975`, `1976`, `1977`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1984`, `1985`, `1986`, `1987`, `1988`, `1989`, `1990`, `1991`, `1992`, `1993`, `1994`, `1995`, `1996`, `1997`, `1998`, `1999`, `2000`, `2001`, `2002`, `2003`, `2004`, `2005`, `2006`, `2007`, `2008`, `2009`, `2010`, `2011`, `2012`, `2013`, `2014`) VALUES
('SUR', 'PIBC', '93850000', '98400000', '103500000', '110000000', '120850000', '138650000', '171100000', '198450000', '220600000', '233450000', '247150000', '270650000', '287600000', '305300000', '368600000', '465000000', '505500000', '641000000', '735500000', '783000000', '794900000', '889050000', '915150000', '883600000', '864150000', '873250000', '891000000', '979850000', '1160900000', '542520000', '388300000', '448300000', '404600000', '428794117.647059', '605492537.313433', '693970588.235294', '860630922.693267', '929607500', '945000000', '885444186.046512', '892164393.939394', '763465550.458716', '1078402127.65957', '1271196078.43137', '1484092538.40527', '1793557833.08931', '2626093294.46064', '2936612021.85792', '3532969034.60838', '3875409836.06557', '4368398047.64333', '4423194614.44308', '5013030303.0303', '5298787878.78788', NULL),
('SVK', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12694544692.7374', '14213045493.8806', '15431288006.2104', '16452201100.9604', '20079363625.5784', '25733043137.2549', '27821913814.9556', '27658295003.9651', '29821795502.8527', '30409021947.5815', '29110067256.311', '30699979418.3445', '35144769433.4651', '46810992099.3228', '57329422647.1319', '62676556398.4579', '70450243382.2607', '86030964960.3066', '99832535520.7265', '88634272020.0056', '89011919205.298', '97525386433.1387', '92746685082.8729', '97707323420.0744', NULL),
('SVN', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21274122281.8765', '21478225398.0496', '20749932683.1486', '22123896860.0012', '22689556844.7347', '20341391805.5921', '20875944894.3895', '23563028318.6541', '29698471223.4945', '34470563470.0842', '36344911638.3462', '39585411480.4822', '48114688201.4782', '55589849128.4605', '50244793831.6199', '47972988741.7219', '51248860578.2597', '46262305280.7401', '47987303637.812', NULL),
('SWE', 'PIBC', '14842870293.4207', '16147160122.7882', '17511477311.4463', '18954132365.5148', '21137242560.8543', '23260320646.2745', '25302033132.3312', '27463409201.8822', '29143383490.5896', '31649203885.888', '37555366021.0315', '40980345656.3725', '48263914958.8443', '58567384058.8006', '65082581294.7696', '81716751697.8951', '88102107647.0993', '93136775102.6419', '102969762221.976', '121646718574.328', '140088635568.375', '127858412114.39', '112767844570.719', '103533702638.547', '107661673734.858', '112514448261.835', '148376104539.839', '180429286795.786', '204068257817.6', '214875344909.957', '258154283908.9', '270362531376.602', '280312318915.485', '209950792712.696', '226079963711.768', '264051981551.316', '288103936773.039', '264477727278.681', '266800462898.904', '270847937645.236', '259802012617.057', '239917320966.977', '263926220332.543', '331108912605.271', '381705944707.296', '389042905733.083', '420029322674.677', '487818493601.646', '513965715632.408', '429655957162.127', '488377689564.921', '563109663291.177', '543880647757.404', '579679985303.385', NULL),
('SWZ', 'PIBC', '35076158.4768305', '43025199.4960101', '45927061.4587708', '54128377.4324513', '64979280.4143917', '70278594.4281114', '76858462.8307434', '74758504.8299034', '79798404.0319194', '105417891.642167', '112137757.244855', '136465324.384787', '146741251.46351', '221902017.291066', '264311994.113319', '288302907.369845', '272539098.436063', '304047838.086477', '340616375.344986', '412093133.760988', '542000513.610683', '571542674.577818', '537575980.843618', '555336145.767884', '494475699.857656', '361014890.45841', '449146608.315098', '584135559.921414', '692016714.317132', '696915430.663057', '1114703088.1614', '1156141998.33412', '1284766234.2216', '1357206995.74624', '1419293454.99606', '1698982437.76019', '1602760100.48147', '1716699913.19444', '1576904292.4588', '1547884442.26205', '1524496383.18107', '1349339652.22846', '1224226095.04113', '1854032545.904', '2420645241.1914', '2584089443.80671', '2947943587.09296', '3053851503.83944', '3019779208.83165', '3144708270.39275', '3891575151.61449', '4145790582.69408', '4049623016.11469', '3791304347.82609', NULL),
('SYC', 'PIBC', '12012264.2698139', '11592255.0296107', '12642278.1301189', '13923306.3127389', '15393338.6534504', '15603343.273552', '16443361.7539586', '16632145.8160729', '16074160.7416074', '16452164.5216452', '18432184.3218432', '21966203.0369871', '30645312.3536574', '36896843.1884165', '43135192.0042083', '47803939.1375048', '49279533.0781258', '64527102.1679118', '85553190.2652321', '127262104.033099', '147358375.443921', '154903482.240416', '147913010.301412', '146713753.767953', '151314671.048904', '168888328.217204', '207853708.290835', '249267405.714286', '283832289.960063', '304833767.291921', '368584758.942457', '374359556.084926', '433667193.814795', '473916819.453826', '486451204.557142', '508221508.221508', '503068472.20266', '562958836.519905', '608369282.225727', '622985493.682733', '614879764.780006', '622262057.191635', '697518248.175182', '705704816.042365', '916940120.733087', '916940120.733087', '1019696244.2776', '1018952395.1649', '962317618.426213', '847427370.306306', '973360306.51821', '1059595753.82961', '1032201692.08843', '1443345214.37698', NULL),
('SYR', 'PIBC', '857704420.513312', '945244981.038121', '1110565862.45336', '1200447417.83731', '1339494289.3772', '1472036544.33834', '1342287560.10485', '1580229793.04638', '1753746376.72452', '2245011583.18698', '2140383710.00885', '2589851697.78909', '3059682165.01818', '3239488091.65962', '5159557171.37959', '6826980767.77202', '7633528922.27344', '7696011370.78768', '9275203108.85105', '9929682189.10886', '13062421027.934', '15518199245.3643', '16298905403.3054', '17589184545.6568', '17503082976.9152', '16403544516.9197', '13293209274.2119', '11356215714.3513', '10577042354.0589', '9853396224.91122', '12308624283.9787', '12981833333.3333', '13253565901.0698', '13695962017.1806', '10122020000', '11396706586.8263', '13789560878.2435', '14505233969.8054', '15200846139.0769', '15873875968.9922', '19325894913.1254', '21099833783.503', '21582248881.6592', '21828144686.0394', '25086930693.0693', '28858965517.2414', '33332844574.7801', '40405006007.2086', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('TCD', 'PIBC', '313582729.426485', '333975338.83416', '357635641.896235', '371766927.846462', '392247492.115161', '416926361.161654', '432794986.860872', '449826392.098566', '453980085.206009', '471635574.390888', '469266799.467879', '501866651.776878', '585427609.515783', '647199433.619933', '652532708.335151', '864602104.679653', '866044940.270056', '935360415.20728', '1113919926.31258', '1004316704.08647', '1033002183.83602', '876937406.594377', '834369740.324516', '832415884.649903', '919103663.360695', '1033069624.25127', '1067828258.19601', '1163426705.10014', '1482597392.5644', '1433686307.53495', '1738605481.13454', '1877138041.64308', '1881847676.80752', '1463251055.40068', '1179837954.72193', '1445919969.89272', '1607345450.04578', '1544689502.82472', '1744794457.276', '1534673583.2487', '1385058161.76746', '1709347793.32873', '1987622279.11463', '2736666515.8294', '4414929219.99649', '6646663561.2656', '7422102655.98832', '8638713245.25572', '10351934916.1198', '9253486068.20784', '10657705536.4978', '12156380425.0825', '12887072987.8982', '13513552424.9049', NULL),
('TGO', 'PIBC', '121128072.357969', '126396468.675871', '132237468.099102', '143255813.500949', '166104078.39022', '187300310.187736', '216136231.83222', '231706440.015125', '241956916.824365', '267732472.640112', '253976592.086153', '286537570.238145', '335677600.252527', '406479936.867839', '560437818.027599', '617321668.333349', '619375148.839786', '777435062.822101', '824263986.688215', '891775721.054594', '1136409054.21599', '962347169.080723', '821652037.081977', '765746518.152411', '718149015.811654', '762359786.038849', '1060911724.49848', '1249099286.39736', '1378847400.42394', '1352949664.93612', '1628427587.61103', '1602299812.77888', '1692959105.53066', '1233496935.56517', '982624332.129785', '1309382817.43319', '1465448203.65068', '1498950970.09524', '1587346019.44505', '1576094484.70894', '1294250279.68129', '1332328986.28277', '1474630199.41874', '1673690389.7013', '1937074537.93089', '2115154090.31071', '2202809210.74095', '2523462648.98387', '3163416556.05377', '3163000590.66298', '3172945506.35697', '3756023047.79099', '3915754216.20669', '4338575823.81993', NULL),
('THA', 'PIBC', '2760750921.40101', '3034037871.75596', '3308912929.93057', '3540403469.52046', '3889130441.59129', '4388937644.86053', '5279230812.28227', '5638461436.94031', '6081009422.09596', '6695336560.93425', '7086538430.75416', '7375000024.39303', '8177872957.58962', '10838593717.241', '13702998648.216', '14882770239.3149', '16985208712.1054', '19779312335.7205', '24006567108.4563', '27371650353.059', '32353514502', '34846038517.9287', '36589772336.849', '40042798315.2734', '41797647303.3483', '38900711298.1934', '43096774496.6248', '50535445679.8106', '61667254410.673', '72250747142.1734', '85343189320.7519', '98234713407.7323', '111452745855.989', '125010690988.189', '144308067330.632', '168018557309.059', '181947631898.202', '150891449496.447', '111859654863.119', '122629741698.033', '122725247705.559', '115536405150.354', '126876918690.024', '142640079033.312', '161339790594.627', '176351948403.908', '207088828467.346', '246976870172.836', '272577799257.354', '263711244888.554', '318907930075.712', '345672232115.625', '365965815820.015', '387252164290.829', NULL),
('TJK', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2629395066.27017', '2535545389.35646', '1909246640.80838', '1646693875.00394', '1346074460.78303', '1231523105.36089', '1043893062.60575', '921843115.774498', '1320126664.94978', '1086567367.91081', '860550294.273467', '1080774005.56446', '1221113794.72523', '1554125542.56223', '2076148710.31813', '2312319579.02843', '2830236053.84429', '3719497371.09659', '5161336170.46084', '4979481980.35098', '5642178579.58438', '6522732202.50748', '7633049792.09321', '8508103455.51497', NULL),
('TKM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2368660560.8757', '2988678840.80541', '3049945191.0726', '3232066836.53467', '3197224007.42472', '3200539816.0601', '3179225948.58114', '2561118608.35516', '2482228439.71407', '2379281767.9558', '2450084970.24741', '2605688065.08338', '2450686659.778', '2904662604.82053', '3534771968.51189', '4462028988.72949', '5977440582.80171', '6838351088.46688', '8104355716.8784', '10277598152.4249', '12664165103.1895', '19271523178.8079', '20214385964.9123', '22148070175.4386', '29233333333.3333', '35164210526.3158', '41850877192.9825', NULL),
('TLS', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '368000000', '452000000', '444000000', '453000000', '466000000', '491000000', '463000000', '559000000', '694000000', '818000000', '934000000', '1123000000', '1270000000', NULL, NULL),
('TON', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32506767.9015578', '30036429.1824514', '34139376.8019516', '41567471.6721987', '44667002.0120724', '53260077.4311091', '62242013.3302689', '62068161.0711025', '60863963.963964', '64248354.5414656', '60058663.3144773', '68195855.6149733', '81667133.4546982', '106657267.367342', '106344854.986095', '113563821.577404', '132201141.446861', '137066290.550071', '138489884.393064', '193775943.038933', '202547013.927138', '219583570.094975', '212155124.65374', '188686997.319035', '194669501.594647', '188623258.458914', '167042880.0712', '181801946.956496', '208098551.915313', '240794581.220937', '264812953.795399', '295998379.120618', '301064027.077313', '346850175.914552', '318522296.093228', '369212477.462857', '423038016.923803', '471575497.307216', '466259084.092744', NULL),
('TTO', 'PIBC', '535673245.327852', '584964613.107648', '619322801.753209', '678239320.341552', '711897510.746459', '736573148.749205', '723739847.670182', '761981451.279267', '758899950', '779200000', '821850000', '896763407.324495', '1083392306.87854', '1308786063.96939', '2042002018.07129', '2442667524.52124', '2500420785.49351', '3138666541.94727', '3562333316.77893', '4602416442.11641', '6235874752.2086', '6849166227.83859', '7989791265.84756', '7799749648.39913', '7756166525.13097', '7375999733.99383', '4794361293.67387', '4797750182.65253', '4496806452.03252', '4323035505.88235', '5068070423.52941', '5362823411.76471', '5532117364.70588', '4584646137.59936', '4947205982.92661', '5329214154.85282', '5759537843.67805', '5737751320.9812', '6043710219.04829', '6808976096.21717', '8154315701.99886', '8824873155.62584', '9008273516.35786', '11235960527.5348', '12884712295.9948', '16088526685.8421', '18460889362.9894', '21830397704.6306', '28165793617.6367', '19332270662.3097', '20758191857.9814', '23676348287.279', '23436342519.9322', '24640839007.5918', NULL),
('TUN', 'PIBC', NULL, NULL, NULL, NULL, NULL, '991047619.047619', '1040952380.95238', '1085714285.71429', '1214666666.66667', '1289904761.90476', '1439238095.2381', '1685152604.60491', '2237570218.83122', '2730787476.28084', '3545852328.69808', '4328933303.50262', '4508139372.17221', '5109919571.04558', '5968474421.51044', '7188899276.68159', '8743054698.11088', '8428513568.24625', '8133538742.82619', '8350545840.2699', '8254573072.61563', '8410185739.96405', '9017795297.4069', '9696739314.07332', '10096292842.1543', '10101862385.7077', '12290568181.8182', '13074782608.6957', '15497286295.7938', '14608946896.483', '15632463424.2784', '18030876599.3444', '19587322786.1105', '20746360430.4187', '21803372266.6198', '22943685719.103', '21473188881.5933', '22066101341.4888', '23141757277.9136', '27453084982.5378', '31183139301.4853', '32282960678.4888', '34378437265.2141', '38920218579.235', '44856586316.0458', '43454935940.1614', '44426016487.355', '45950845290.5242', '45238619629.9379', '46993598818.2434', NULL),
('TUR', 'PIBC', '13995124517.0571', '8017479300', '8919043233.33333', '10351885922.2222', '11172953077.7778', '11945722166.6667', '14119135233.3333', '15664673411.1111', '17500000000', '19466666666.6667', '17086956521.7391', '16256619963.7997', '20431095406.3604', '25724381625.4417', '35599913836.4328', '44633707242.7642', '51280134554.2889', '58676813687.3681', '65147022485.7919', '89394085658.2038', '68789289565.7434', '71040020140.4436', '64546332580.7583', '61678280115.4987', '59989909457.8379', '67234948264.5987', '75728009962.7878', '87172789528.3316', '90852814004.9917', '107143348667.094', '150676291094.21', '151041248184.246', '159095003188.105', '180422294772.264', '130690172297.297', '169485941048.035', '181475555282.555', '189834649111.257', '269287100727.18', '249751469771.285', '266567532725.557', '196005289695.051', '232534560441.697', '303005303081.914', '392166275594.77', '482979839089.015', '530900094644.732', '647155131936.449', '730337495735.69', '614553921806.452', '731168051903.114', '774754155283.582', '788863301670.379', '822135183159.996', NULL),
('TUV', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8824746.23813152', '9365488.11527636', '9742603.63358628', '9631024.91567838', '10887216.9090252', '11025679.5147634', '12335200.1648586', '12701093.9749737', '12757405.7922913', '13686699.5709539', '13741844.5911473', '13196254.8666433', '15451309.0427519', '18230911.0375253', '21535683.8836479', '21839543.6333183', '22903319.50355', '27030996.0274377', '30290770.2566871', '27101312.7916078', '31824701.2783331', '39313508.6934276', '39875708.119439', '38322359.5288666', NULL),
('TZA', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5100405344.39923', '4420167588.57625', '4258742898.93795', '4956587901.61865', '4601413521.13102', '4257702021.44302', '4510847189.15431', '5255221043.83861', '6496195823.96993', '7683852496.84499', '9345174101.90716', '9697847589.16835', '10185786170.7327', '10383560997.7807', '10805600068.704', '11659129814.7433', '12825801916.6063', '14141916592.3846', '14331231238.9296', '21501395561.0276', '27282210005.075', '28596269868.8271', '30917376837.1179', '33316875149.9391', '38733981070.0415', '43646747144.5352', NULL),
('UGA', 'PIBC', '423008385.744235', '441524109.014675', '449012578.616352', '516147798.742138', '589056603.773585', '884873949.579832', '925770308.123249', '967647058.823529', '1037815126.05042', '1169047619.04762', '1260084033.61345', '1417787114.84594', '1491596638.65546', '1702521008.40336', '2100142653.35235', '2359555555.55556', '2447300000', '2936470588.23529', '2420260869.56522', '2139025000', '1244610000', '1337300000', '2177500000', '2240333333.33333', '3615647477.05434', '3519666338.52454', '3923232122.12784', '6269511614.66235', '6508931651.66667', '5276480985.99937', '4304398865.88268', '3321729057.12215', '2857457860.05088', '3220439044.18949', '3990430446.71216', '5755818947.42125', '6044585326.938', '6269333313.17108', '6584815846.52754', '5998563257.94659', '6193246837.09687', '5840503868.57246', '6178563590.89254', '6336696288.98214', '7940362799.17997', '9013834879.61834', '9942597779.99265', '12292814316.4832', '14239027457.2758', '16992872448.676', '18803852465.5546', '18661302214.6704', '23724746168.653', '24703250650.9742', NULL),
('UKR', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '64087694038.2333', '74703517902.6642', '82707004265.9254', '81456431291.9234', '77464043753.2963', '73942294099.2892', '65648559194.6496', '52549555009.5044', '48213868185.1625', '44558077827.135', '50150399813.1328', '41883241479.9014', '31580639053.2013', '31261527363.144', '38009344576.6088', '42392896031.2394', '50132953288.203', '64883060725.7003', '86142018069.3504', '107753069306.931', '142719009900.99', '179992405832.321', '117227769791.56', '136419300367.962', '163421733018.726', '176603428857.465', '177430609756.098', NULL),
('URY', 'PIBC', '1243993170.19614', '1549623550.06488', '1709221317.6221', '1538971680.97818', '1974511146.05715', '1889185074.97641', '1808775748.3991', '1598149806.59667', '1593701208.51915', '2004342741.93548', '2137241935.48387', '2807342741.93548', '2189502774.9206', '3964295672.52444', '4090252474.21085', '3538292267.30118', '3667161241.48372', '4114664910.57037', '4910255622.72032', '7181180174.85868', '10163020115.7344', '11048335541.4933', '9178802451.40147', '5102281488.72172', '4850241442.17643', '4732017873.38369', '5880112946.89436', '7367494222.29317', '8213515458.51139', '8438951476.06644', '9298839655.23138', '11206193313.0458', '12878157305.7481', '15002144584.3663', '17474578502.4346', '19297663096.5506', '20515465834.0682', '23969746851.4993', '25385928196.3986', '23983945190.6167', '22823255805.9664', '20898788420.0932', '13606494599.021', '12045627411.0182', '13686333821.7864', '17362872704.1985', '19579479148.4953', '23410536926.5382', '30366148181.398', '30461322497.5401', '38881102099.8793', '47236710628.2914', '50004354647.2594', '55707944621.9719', NULL),
('USA', 'PIBC', '543300000000', '563300000000', '605100000000', '638600000000', '685800000000', '743700000000', '815000000000', '861700000000', '942500000000', '1019900000000', '1075900000000', '1167800000000', '1282400000000', '1428500000000', '1548800000000', '1688900000000', '1877600000000', '2086000000000', '2356600000000', '2632100000000', '2862500000000', '3211000000000', '3345000000000', '3638100000000', '4040700000000', '4346700000000', '4590200000000', '4870200000000', '5252600000000', '5657700000000', '5979600000000', '6174000000000', '6539300000000', '6878700000000', '7308800000000', '7664100000000', '8100200000000', '8608500000000', '9089200000000', '9660600000000', '10284800000000', '10621800000000', '10977500000000', '11510700000000', '12274900000000', '13093700000000', '13855900000000', '14477600000000', '14718600000000', '14418700000000', '14964400000000', '15517900000000', '16163200000000', '16768100000000', NULL),
('UZB', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13360607990.6751', '13800157749.2873', '12953800571.0314', '13099928531.8591', '12899074347.3288', '13350461532.662', '13948892215.5689', '14744603773.5849', '14988971210.8383', '17078465982.0282', '13760374487.51', '11401351420.1718', '9687951055.22541', '10128112401.4248', '12030023547.8807', '14307509838.8053', '17030896203.1963', '22311393927.8817', '27934030937.2157', '32816828372.9753', '39332770928.9426', '45324319955.3884', '51183443224.9939', '56795656324.5823', NULL),
('VCT', 'PIBC', '13066633.8255337', '13999964.8130718', '14524963.493562', '13708298.8794661', '14758296.2404465', '15108295.3612136', '16099959.5355017', '15835088.4020619', '15350000', '16650000', '18450000', '20051648.1111283', '27585488.2223049', '30165373.2430518', '32924215.7541822', '33237164.0553397', '32792479.982624', '36537036.3917697', '46599999.1770143', '54511110.1484102', '60307406.3423402', '74799998.6789844', '85448146.6390795', '94044442.7835597', '103499998.172124', '112881479.487923', '127974071.81397', '142329627.115998', '164574071.167591', '177296293.165131', '198207403.906938', '212492588.839838', '233188884.770625', '238774069.857172', '243255551.259508', '266481476.775249', '281518513.546722', '293070365.194561', '317851809.201349', '331866660.80569', '396261363.372142', '430039288.701529', '461883436.287289', '481806287.78729', '521975101.892698', '550728656.940448', '610778285.509563', '684049037.037037', '695428851.851852', '674922481.481481', '681225962.962963', '676406962.962963', '693304481.481481', '709358185.185185', NULL),
('VEN', 'PIBC', '8607600068.65332', '8923366627.53039', '9873397859.35133', '10663375513.5473', '9113580696.48012', '9602944667.73034', '10096574669.5506', '10472776743.7753', '11470909285.1461', '11927570676.9213', '12993115056.382', '14471557937.6802', '15922867181.2727', '19445932860.3322', '29087099933.3256', '31413164178.7398', '36272315695.3908', '42337056974.7001', '46507640231.1473', '55750554788.6546', '67135122863.8789', '75498829319.371', '76693647866.3483', '78586503425.9925', '55952339079.6385', '57935742246.6933', '58915108093.8796', '45343793675.9793', '58428404473.5586', '42142303738.5494', '47027508385.03', '51734363023.7838', '58470358475.8681', '58107555298.4641', '56529904239.4612', '74888742183.6849', '68258588862.7845', '85837385778.751', '91338542541.7674', '97974136436.6528', '117147614565.563', '122909734601.322', '92889586976.1833', '83622191418.9774', '112451400422.982', '145513489651.872', '183477522123.894', '230364229156.963', '315600372612.948', '329419189566.837', '393801556872.313', '316482176578.929', '381286223859.371', '438283564814.815', NULL),
('VNM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14094688429.5982', '26336617862.4431', '36658108169.2072', '25423812494.3469', '6293304847.12842', '6471740486.31946', '9613369553.85111', '9866990096.31621', '13180954014.0721', '16286434094.0188', '20736163915.2435', '24657470331.5922', '26843701136.726', '27209601995.8245', '28683658004.771', '33640085727.518', '35291349277.3143', '37947904054.452', '42717072777.5838', '49424107709.8946', '57633255739.4104', '66371664817.0436', '77414425532.2452', '99130304099.1274', '106014600963.957', '115931749904.86', '135539487317.008', '155820001920.492', '171390003299.399', NULL),
('VUT', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '119258829.724745', '113423181.643068', '98746409.4413175', '98144643.7097661', '110123776.769005', '135553759.396907', '123698508.817134', '118691400.756626', '130834146.216785', '148545377.858713', '144482170.476684', '158397406.344715', '188869985.157248', '196142587.970973', '188080372.417814', '219260343.349957', '233902114.74096', '245177629.284461', '255890215.734673', '262301249.00278', '267999225.256634', '272014693.050806', '257926881.72043', '262603781.799059', '314463144.04219', '364996869.129618', '394962552.336108', '437072933.899158', '526425740.447881', '607983815.257081', '610075806.66568', '700804286.224354', '792149700.679116', '781702874.106058', '828237181.13311', NULL),
('WSM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '121218640.633866', '111860659.949563', '109200344.91064', '95573449.3758911', '100949655.898907', '111716548.604677', '133016065.660133', '122888610.417818', '125766270.897892', '125597203.42392', '132303037.064632', '133122893.142375', '221098106.508876', '224865731.381903', '249907893.815192', '285475620.929503', '269485284.955621', '258831775.411535', '269019710.327456', '273088357.1637', '288075318.910738', '338836026.389264', '420318071.937836', '462644663.06818', '508505414.399597', '550967295.280901', '644145158.435121', '562357861.823036', '643059403.014481', '737053938.86719', '801803524.477956', '801916057.595518', NULL),
('YEM', 'PIBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5647251908.39695', '5930370370.37037', '6463649985.01648', '5368270614.8468', '4167356037.1517', '4258788725.44991', '5785685310.86668', '6839039029.748', '6325219772.93811', '7641101221.43876', '9636342274.82408', '9854042164.67463', '10693278291.8149', '11777768086.8693', '13873500887.5612', '16753787028.2859', '19081726103.2145', '25633674563.5493', '30397203368.9725', '27838718233.1099', '31743751169.3171', '29207296703.2967', '31992801302.9316', '35954502303.5041', NULL),
('ZAF', 'PIBC', '7363096178.07644', '7742634887.30225', '8269697466.05068', '9174867982.64035', '10071444211.1158', '11002379672.4066', '11994960100.798', '13382332493.3501', '14475710065.7987', '16315273134.5373', '17907041999.16', '19765101370.2461', '20753220241.967', '28443804466.8588', '35727741280.3532', '36947938877.62', '35473781048.758', '39398574287.0285', '45326587511.4995', '55938240142.5178', '80546993194.6584', '86833985896.9762', '80083518597.6498', '86015133649.3755', '85169436537.2766', '67065070009.4607', '79503484221.1697', '104024659658.109', '114630316416.931', '124907439724.056', '112014836393.151', '120225985441.64', '130513680154.278', '134309807566.277', '139752373971.085', '155460234802.74', '147608050640.268', '152586031842.556', '137774695409.706', '136631881361.777', '136361790996.056', '121515880074.109', '115482304205.286', '175256866088.999', '228593703989.66', '257772766354.843', '271638630110.042', '299419609395.613', '286769850245.717', '295939963709.16', '375349442837.187', '416596716622.437', '397391258596.347', '366057913367.137', NULL),
('ZMB', 'PIBC', '698739720.783607', '682359727.329053', '679279728.55982', '704339718.545848', '822639671.273187', '1061199575.94465', '1238999504.8958', '1340639464.28047', '1573739371.13375', '1926399230.21087', '1788779285.2038', '1653259341.29113', '1872416680.07912', '2434255236.99935', '2910981262.10018', '2442672140.947', '2742859262.9794', '2515296939.60686', '2811032472.93922', '3353445378.15126', '3884530853.76162', '4008126497.36464', '3871117092.86676', '3321048451.15171', '2719518932.99541', '2252454500.14896', '1664413508.09853', '2265250972.34879', '3728878148.80792', '3994673161.02649', '3288381797.32415', '3376791492.28079', '3182810895.29572', '3273507753.87841', '3656808232.64295', '3806982678.89363', '3597220962.00017', '4303290116.56546', '3537741625.24395', '3404284652.93585', '3600631918.50658', '4094441301.21423', '4193850445.42632', '4901869715.90457', '6221109716.39571', '8331863989.52213', '12756957883.9326', '14056878376.0998', '17911046608.5571', '15328314220.1859', '20265396325.5947', '23731894786.498', '24939543374.1362', '26820870558.9406', NULL),
('ZWE', 'PIBC', '1052990400', '1096646600', '1117601600', '1159511700', '1217138000', '1311435800', '1281749500', '1397002000', '1479599900', '1747998800', '1884206300', '2178716300', '2677729400', '3309353600', '3982161400', '4371300700', '4318372000', '4364382100', '4351600500', '5177459400', '6678868200', '8011373800', '8539700700', '7764067000', '6352125900', '5637259300', '6217523700', '6741215100', '7814784100', '8286322700', '8783816700', '8641481700', '6751472200', '6563813300', '6890675000', '7111270700', '8553146600', '8529571600', '6401968200', '6858013100', '6689957600', '6777384700', '6342116400', '5727591800', '5805598400', '5755215200', '5443896500', '5291950100', '4415702800', '8157077400', '9456808200', '10956226600', '12472416700', '13490000000', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pays_institution`
--

CREATE TABLE IF NOT EXISTS `pays_institution` (
  `code_insti` varchar(4) NOT NULL COMMENT 'code de l''institution',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  PRIMARY KEY (`code_insti`,`code_pays`),
  KEY `code_pays_institution_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays_linguistique`
--

CREATE TABLE IF NOT EXISTS `pays_linguistique` (
  `code_zone` varchar(15) NOT NULL COMMENT 'code de la zone linguistique',
  `code_pays` varchar(3) NOT NULL COMMENT 'code du pays',
  PRIMARY KEY (`code_zone`,`code_pays`),
  KEY `code_pays_linguistique_fk` (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays_linguistique`
--

INSERT INTO `pays_linguistique` (`code_zone`, `code_pays`) VALUES
('LALU', 'AGO'),
('LAAN', 'BDI'),
('LAFR', 'BDI'),
('LAFR', 'BEN'),
('LAFR', 'BFA'),
('LAAN', 'BWA'),
('LAFR', 'CAF'),
('LAFR', 'CIV'),
('LAAN', 'CMR'),
('LAFR', 'CMR'),
('LAFR', 'COD'),
('LAFR', 'COG'),
('LAAR', 'COM'),
('LAFR', 'COM'),
('LALU', 'CPV'),
('LAAR', 'DJI'),
('LAFR', 'DJI'),
('LAAR', 'DZA'),
('LAFR', 'DZA'),
('LAAN', 'EGY'),
('LAAR', 'EGY'),
('LAAR', 'ERI'),
('LADI', 'ERI'),
('LADI', 'ETH'),
('LAFR', 'GAB'),
('LAAN', 'GHA'),
('LAFR', 'GIN'),
('LAAN', 'GMB'),
('LALU', 'GNB'),
('LALU', 'GNQ'),
('LAAN', 'KEN'),
('LAAN', 'LBR'),
('LAAR', 'LBY'),
('LAAN', 'LSO'),
('LAAR', 'MAR'),
('LAFR', 'MAR'),
('LAFR', 'MDG'),
('LAFR', 'MLI'),
('LALU', 'MOZ'),
('LAAR', 'MRT'),
('LAFR', 'MRT'),
('LAAN', 'MUS'),
('LAFR', 'MUS'),
('LAAN', 'MWI'),
('LAAN', 'NAM'),
('LAFR', 'NER'),
('LAAN', 'NGA'),
('LAAN', 'RWA'),
('LAFR', 'RWA'),
('LAAR', 'SDN'),
('LAFR', 'SEN'),
('LAAN', 'SLE'),
('LAAR', 'SOM'),
('LAAR', 'SSD'),
('LALU', 'STP'),
('LAAN', 'SWZ'),
('LAAN', 'SYC'),
('LAFR', 'TCD'),
('LAFR', 'TGO'),
('LAAR', 'TUN'),
('LAFR', 'TUN'),
('LAAN', 'TZA'),
('LAAN', 'UGA'),
('LAAN', 'ZAF'),
('LAAN', 'ZMB'),
('LAAN', 'ZWE');

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `code_theme` varchar(15) NOT NULL COMMENT 'code du thème',
  `nom_theme` varchar(50) NOT NULL COMMENT 'nom du thème',
  PRIMARY KEY (`code_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`code_theme`, `nom_theme`) VALUES
('ACR', 'Attractivité, Compétitivité et Risque'),
('BREN', 'Branches d''entreprises'),
('CMNV', 'Consommation des ménages et niveau de vie'),
('COE', 'Commerce extérieur'),
('DEGP', 'Démocratie, gouvernance et paix'),
('ECR', 'Economie et Création de richesse'),
('ENTR', 'Entreprise'),
('EPT', 'Emploi et Travail'),
('ESSI', 'Economie sociale et secteur informel'),
('FIPU', 'Finances publiques'),
('FNI', 'Financements internationaux'),
('INV', 'Investissements'),
('PED', 'Population et Démographie'),
('PER', 'Performances Energetiques'),
('PRR', 'Productivité et Rendement'),
('RES', 'Ressources'),
('SEAE', 'Secteurs d''activité économique');

-- --------------------------------------------------------

--
-- Structure de la table `zomo`
--

CREATE TABLE IF NOT EXISTS `zomo` (
  `code_zomo` varchar(6) NOT NULL COMMENT 'code du zomo',
  `nom_zomo` varchar(50) NOT NULL COMMENT 'nom du zomo',
  PRIMARY KEY (`code_zomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zomo`
--

INSERT INTO `zomo` (`code_zomo`, `nom_zomo`) VALUES
('ZORF', 'zone franc');

-- --------------------------------------------------------

--
-- Structure de la table `zone_ecosysteme`
--

CREATE TABLE IF NOT EXISTS `zone_ecosysteme` (
  `code_zone` varchar(6) NOT NULL COMMENT 'code de la zone d''écosystème',
  `nom_ecosystem` varchar(80) NOT NULL COMMENT 'nom de l''écosystème',
  PRIMARY KEY (`code_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zone_ecosysteme`
--

INSERT INTO `zone_ecosysteme` (`code_zone`, `nom_ecosystem`) VALUES
('AFMO', 'afrique des montagnes'),
('APGMV', 'agence panafricaine de la grande muraille verte'),
('BALT', 'bassin du lac tchad'),
('CFFS', 'commission des forêts et de la faune sauvage pour l''afrique'),
('CILS', 'comité inter-etats de lutte contre la secheresse dans le sahel en afrique'),
('DEAF', 'deserts d''afrique'),
('KALA', 'kalahari'),
('MERM', 'mer mediterranée'),
('MERO', 'mer rouge'),
('NABI', 'nabib'),
('OCAT', 'ocean atlantique'),
('OCIN', 'ocen indien'),
('PAIA', 'pays inter afrique'),
('UCGL', 'union centrale des grands lacs'),
('ZONI', 'zone niger'),
('ZONL', 'zone nil');

-- --------------------------------------------------------

--
-- Structure de la table `zone_linguistique`
--

CREATE TABLE IF NOT EXISTS `zone_linguistique` (
  `code_zone` varchar(15) NOT NULL COMMENT 'code de la zone linguistique',
  `nom_zone_ling` varchar(30) NOT NULL COMMENT 'nom de la zone linguistique',
  PRIMARY KEY (`code_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zone_linguistique`
--

INSERT INTO `zone_linguistique` (`code_zone`, `nom_zone_ling`) VALUES
('LAAN', 'langue anglaise'),
('LAAR', 'langue arabe'),
('LADI', 'langue divers'),
('LAFR', 'langue française'),
('LALU', 'langue lusophone');

-- --------------------------------------------------------

--
-- Structure de la table `zone_monde`
--

CREATE TABLE IF NOT EXISTS `zone_monde` (
  `code_zone` varchar(4) NOT NULL COMMENT 'code d''une zone du monde',
  `nom_zone_monde` varchar(50) NOT NULL COMMENT 'nom d''une zone du monde',
  `code_conti` varchar(3) NOT NULL COMMENT 'code du continent',
  PRIMARY KEY (`code_zone`),
  KEY `code_conti_zone_monde_fk` (`code_conti`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zone_monde`
--

INSERT INTO `zone_monde` (`code_zone`, `nom_zone_monde`, `code_conti`) VALUES
('AFR', 'Afrique', 'AFR'),
('AMCN', 'Amérique Centrale et du Nord', 'AME'),
('AMSC', 'Amérique du Sud et Caraibes', 'AME'),
('ASES', 'Asie de l''EST', 'ASI'),
('ASSE', 'Asie du Sud et du Sud-est', 'ASI'),
('COEI', 'Communauté des Etats Indépendants(CEI)', 'ASI'),
('MOYE', 'Moyen Orient', 'ASI'),
('OCE', 'Océanie', 'OCE'),
('REEU', 'Reste de l ''Europe', 'EUR'),
('RESA', 'Reste de l''Asie', 'ASI'),
('UNEU', 'Union européenne', 'EUR');

-- --------------------------------------------------------

--
-- Structure de la table `zone_monetaire`
--

CREATE TABLE IF NOT EXISTS `zone_monetaire` (
  `code_zone` varchar(15) NOT NULL COMMENT 'code de la zone monetaire',
  `nom_zone_monet` varchar(30) NOT NULL COMMENT 'nom de la zone monetaire',
  `code_zomo` varchar(6) NOT NULL COMMENT 'code du zomo',
  PRIMARY KEY (`code_zone`),
  KEY `code_zomo_monetaire_fk` (`code_zomo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `zone_monetaire`
--

INSERT INTO `zone_monetaire` (`code_zone`, `nom_zone_monet`, `code_zomo`) VALUES
('CEMAC', 'Communauté Économique et Monét', 'ZORF'),
('UEMOA', 'Union économique et monétaire ', 'ZORF');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `caracteristique`
--
ALTER TABLE `caracteristique`
  ADD CONSTRAINT `code_pays_caracteristique_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD CONSTRAINT `code_theme_indicateur_fk` FOREIGN KEY (`code_theme`) REFERENCES `theme` (`code_theme`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `code_front_pays_fk` FOREIGN KEY (`code_front`) REFERENCES `front_saharienne` (`code_front`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zone_monde_pays_fk` FOREIGN KEY (`zone_monde`) REFERENCES `zone_monde` (`code_zone`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zone_monet_pays_fk` FOREIGN KEY (`zone_monet`) REFERENCES `zone_monetaire` (`code_zone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pays_cera`
--
ALTER TABLE `pays_cera`
  ADD CONSTRAINT `code_cera_pays_cera_fk` FOREIGN KEY (`code_cera`) REFERENCES `cera` (`code_cera`),
  ADD CONSTRAINT `code_pays_cera_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`);

--
-- Contraintes pour la table `pays_ecosysteme`
--
ALTER TABLE `pays_ecosysteme`
  ADD CONSTRAINT `code_pays_ecosysteme_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`),
  ADD CONSTRAINT `code_zone_pays_ecosysteme_fk` FOREIGN KEY (`code_zone`) REFERENCES `zone_ecosysteme` (`code_zone`);

--
-- Contraintes pour la table `pays_harmo`
--
ALTER TABLE `pays_harmo`
  ADD CONSTRAINT `code_harmo_pays_fk` FOREIGN KEY (`code_harmo`) REFERENCES `harm_droit` (`code_harmo`),
  ADD CONSTRAINT `code_pays_harmo_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`);

--
-- Contraintes pour la table `pays_indicateur`
--
ALTER TABLE `pays_indicateur`
  ADD CONSTRAINT `code_indic_indicateur_fk` FOREIGN KEY (`code_indic`) REFERENCES `indicateur` (`code_indic`),
  ADD CONSTRAINT `code_pays_indicateur_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`);

--
-- Contraintes pour la table `pays_institution`
--
ALTER TABLE `pays_institution`
  ADD CONSTRAINT `code_insti_pays_fk` FOREIGN KEY (`code_insti`) REFERENCES `institution` (`code_insti`),
  ADD CONSTRAINT `code_pays_institution_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`);

--
-- Contraintes pour la table `pays_linguistique`
--
ALTER TABLE `pays_linguistique`
  ADD CONSTRAINT `code_pays_linguistique_fk` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`),
  ADD CONSTRAINT `code_zone_pays_linguistique_fk` FOREIGN KEY (`code_zone`) REFERENCES `zone_linguistique` (`code_zone`);

--
-- Contraintes pour la table `zone_monde`
--
ALTER TABLE `zone_monde`
  ADD CONSTRAINT `code_conti_zone_monde_fk` FOREIGN KEY (`code_conti`) REFERENCES `continent` (`code_conti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `zone_monetaire`
--
ALTER TABLE `zone_monetaire`
  ADD CONSTRAINT `code_zomo_monetaire_fk` FOREIGN KEY (`code_zomo`) REFERENCES `zomo` (`code_zomo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
