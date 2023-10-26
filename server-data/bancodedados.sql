-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.25-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para skips
CREATE DATABASE IF NOT EXISTS `skips` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `skips`;

-- Copiando estrutura para tabela skips.cc_boletim
CREATE TABLE IF NOT EXISTS `cc_boletim` (
  `token` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nuser_id` int(11) NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/profile.png',
  `tempo` int(11) NOT NULL,
  `multa` int(11) NOT NULL,
  `fianca` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`info`)),
  `status` varchar(255) NOT NULL DEFAULT 'Aberto',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.cc_boletim: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.cc_comunicados
CREATE TABLE IF NOT EXISTS `cc_comunicados` (
  `token` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `fk_cc_perfil_comunicados` (`user_id`),
  CONSTRAINT `fk_cc_perfil_comunicados` FOREIGN KEY (`user_id`) REFERENCES `cc_perfil` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.cc_comunicados: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.cc_perfil
CREATE TABLE IF NOT EXISTS `cc_perfil` (
  `user_id` int(11) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/profile.png',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.cc_perfil: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.concessionaria
CREATE TABLE IF NOT EXISTS `concessionaria` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.concessionaria: ~370 rows (aproximadamente)
INSERT INTO `concessionaria` (`name`, `model`, `price`, `category`, `stock`) VALUES
	('Bugatti', '2019chiron', 2800000, 'importados', 99),
	('Camaro', '21camaro', 2000000, 'importados', 99),
	('Mercedes G63', '22g63', 2200000, 'importados', 99),
	('CB 500x', '500x', 500000, 'motos', 99),
	('Porche 911', '911turbos', 2500000, 'importados', 99),
	('Adder', 'adder', 620000, 'muscle', 99),
	('Akuma', 'akuma', 500000, 'motos', 99),
	('Alpha', 'alpha', 230000, 'sports', 99),
	('Amarok', 'amarok', 300000, 'brs', 99),
	('AMG GTR', 'amggtr', 1500000, 'importados', 99),
	('Asbo', 'asbo', 100000, 'compacts', 99),
	('Asea', 'asea', 80000, 'sedans', 99),
	('Asterope', 'asterope', 90000, 'sedans', 99),
	('Audi RS6', 'audirs6', 2200000, 'importados', 99),
	('Audi RS7', 'audirs7', 2600000, 'importados', 99),
	('Avarus', 'avarus', 300000, 'motos', 99),
	('Brabus B63', 'b63s', 1600000, 'importados', 99),
	('Bagger', 'bagger', 320000, 'motos', 99),
	('Baller', 'baller', 220000, 'suvs', 99),
	('Baller3', 'baller3', 320000, 'suvs', 99),
	('Banshee', 'banshee', 300000, 'sports', 99),
	('Banshee2', 'banshee2', 570000, 'muscle', 99),
	('Bati', 'bati', 370000, 'motos', 99),
	('Bati2', 'bati2', 400000, 'motos', 99),
	('Bestiagts', 'bestiagts', 290000, 'sports', 99),
	('BF400', 'bf400', 320000, 'motos', 99),
	('Bfinjection', 'bfinjection', 80000, 'offroad', 99),
	('Bifta', 'bifta', 190000, 'offroad', 99),
	('Bis', 'biz25', 60000, 'motos', 99),
	('Bjxl', 'bjxl', 210000, 'suvs', 99),
	('Blade', 'blade', 110000, 'muscle', 99),
	('Blazer', 'blazer', 230000, 'motos', 99),
	('Blazer S', 'blazer4', 370000, 'motos', 99),
	('Blista', 'blista', 50000, 'compacts', 99),
	('Blista S', 'blista2', 50000, 'sports', 99),
	('BMW M4', 'bmci', 1700000, 'importados', 99),
	('BMW M3', 'bmwm3f80', 1500000, 'importados', 99),
	('BMW M4 GTS', 'bmwm4gts', 1700000, 'importados', 99),
	('Brioso S', 'brioso2', 100000, 'compacts', 99),
	('Bros', 'bros60', 80000, 'motos', 99),
	('Btype', 'btype', 200000, 'classics', 99),
	('Buccaneer', 'buccaneer', 130000, 'muscle', 99),
	('Buccaneer SE', 'buccaneer2', 260000, 'muscle', 99),
	('Buffalo', 'buffalo', 300000, 'sports', 99),
	('Bullet', 'bullet', 500000, 'muscle', 99),
	('Burrito', 'burrito', 260000, 'vans', 99),
	('Burrito3', 'burrito3', 260000, 'vans', 99),
	('Calico', 'calico', 1450000, 'sports', 99),
	('Caracara2', 'caracara2', 500000, 'offroad', 99),
	('Carbonizzare', 'carbonizzare', 290000, 'sports', 99),
	('Carbonr S', 'carbonrs', 400000, 'motos', 99),
	('Casco', 'casco', 355000, 'classics', 99),
	('Cavalcade', 'cavalcade', 170000, 'suvs', 99),
	('Porsche Cayenne', 'cayenneturbo', 2000000, 'importados', 99),
	('CG 160', 'cg1602', 50000, 'motos', 99),
	('Cheburek', 'cheburek', 170000, 'classics', 99),
	('Cheetah', 'cheetah', 525000, 'muscle', 99),
	('Cheetah2', 'cheetah2', 440000, 'classics', 99),
	('Chimera', 'chimera', 450000, 'motos', 99),
	('Chino', 'chino', 190000, 'muscle', 99),
	('Chino S', 'chino2', 200000, 'muscle', 99),
	('Cliff hanger', 'cliffhanger', 310000, 'motos', 99),
	('Club', 'club', 120000, 'compacts', 99),
	('Cog55', 'cog55', 200000, 'sedans', 99),
	('Cog552', 'cog552', 400000, 'sedans', 99),
	('Cogcabrio', 'cogcabrio', 100000, 'coupes', 99),
	('Cognoscenti', 'cognoscenti', 280000, 'sedans', 99),
	('Comet3', 'comet3', 600000, 'sports', 99),
	('Comet5', 'comet5', 700000, 'sports', 99),
	('Comet6', 'comet6', 1400000, 'sports', 99),
	('Coquette', 'coquette', 250000, 'sports', 99),
	('Coquette2', 'coquette2', 285000, 'classics', 99),
	('Coquette GM', 'coquette3', 195000, 'muscle', 99),
	('Coquette4', 'coquette4', 700000, 'sports', 99),
	('New Beetle', 'cox2013', 120000, 'brs', 99),
	('Cyclone', 'cyclone', 920000, 'muscle', 99),
	('Cypher', 'cypher', 1100000, 'sports', 99),
	('Daemon', 'daemon', 200000, 'motos', 99),
	('Daemon2', 'daemon2', 240000, 'motos', 99),
	('Defender', 'defender21', 300000, 'brs', 99),
	('Defiler', 'defiler', 460000, 'motos', 99),
	('Deveste', 'deveste', 1150000, 'sports', 99),
	('Deviant', 'deviant', 300000, 'muscle', 99),
	('Diablous', 'diablous', 430000, 'motos', 99),
	('Diablous S', 'Diablous2', 460000, 'motos', 99),
	('Dilettante', 'dilettante', 40000, 'compacts', 99),
	('Dodge Charger', 'dodgechargersrt', 1500000, 'importados', 99),
	('Dominator', 'dominator', 370000, 'muscle', 99),
	('Dominator 3', 'dominator3', 230000, 'muscle', 99),
	('Dominator7', 'dominator7', 500000, 'muscle', 99),
	('Double', 'double', 400000, 'motos', 99),
	('Drafter', 'drafter', 650000, 'sports', 99),
	('Dubsta', 'dubsta', 310000, 'suvs', 99),
	('Dubsta3', 'dubsta3', 300000, 'offroad', 99),
	('Dukes', 'dukes', 150000, 'muscle', 99),
	('Dynasty', 'dynasty', 500000, 'classics', 99),
	('Elegy', 'elegy', 350000, 'sports', 99),
	('Elegy2', 'elegy2', 355000, 'sports', 99),
	('Emerus', 'emerus', 840000, 'muscle', 99),
	('Emperor', 'emperor', 80000, 'sedans', 99),
	('Enduro', 'enduro', 100000, 'motos', 99),
	('Entity2', 'entity2', 550000, 'muscle', 99),
	('Entityxf', 'entityxf', 560000, 'muscle', 99),
	('Ess key', 'esskey', 280000, 'motos', 99),
	('Euros', 'euros', 1450000, 'sports', 99),
	('Everon', 'everon', 600000, 'offroad', 99),
	('Exemplar', 'exemplar', 120000, 'coupes', 99),
	('F620', 'f620', 100000, 'coupes', 99),
	('BMW F800', 'f800', 700000, 'motos', 99),
	('Faction', 'faction', 150000, 'muscle', 99),
	('Fagaloa', 'fagaloa', 450000, 'classics', 99),
	('Faggio SE', 'faggio', 30000, 'motos', 99),
	('Faggio S', 'faggio2', 20000, 'motos', 99),
	('Faggio', 'faggio3', 12000, 'motos', 99),
	('FCR', 'fcr', 250000, 'motos', 99),
	('FCR S', 'fcr2', 300000, 'motos', 99),
	('Felon', 'felon', 70000, 'coupes', 99),
	('Felon S', 'felon2', 90000, 'coupes', 99),
	('Feltzer2', 'feltzer2', 255000, 'sports', 99),
	('Feltzer3', 'feltzer3', 220000, 'classics', 99),
	('Ferrari Italia', 'ferrariitalia', 3000000, 'importados', 99),
	('Fmj', 'fmj', 520000, 'muscle', 99),
	('Focus RS', 'focusrs', 1600000, 'importados', 99),
	('Ford Mustang', 'fordmustang', 2000000, 'importados', 99),
	('Fox', 'fox', 80000, 'brs', 99),
	('Jaguar F-pace', 'fpacehm', 2000000, 'importados', 99),
	('Freecrawler', 'freecrawler', 300000, 'offroad', 99),
	('Fugitive', 'fugitive', 150000, 'sedans', 99),
	('Furia', 'furia', 700000, 'muscle', 99),
	('Furoregt', 'furoregt', 290000, 'sports', 99),
	('Fusilade', 'fusilade', 210000, 'sports', 99),
	('Futo', 'futo', 170000, 'sports', 99),
	('MT-07', 'fz07', 200000, 'motos', 99),
	('Gargoyle', 'gargoyle', 190000, 'motos', 99),
	('Gauntlet', 'gauntlet', 165000, 'muscle', 99),
	('Gauntlet3', 'gauntlet3', 265000, 'muscle', 99),
	('Gauntlet4', 'gauntlet4', 300000, 'muscle', 99),
	('Gburrito', 'gburrito', 200000, 'vans', 99),
	('Cerato', 'gcmcerato18', 100000, 'brs', 99),
	('Honda City', 'gcmcity14', 90000, 'brs', 99),
	('Corolla', 'gcmcorolla20cn', 250000, 'brs', 99),
	('HighLander', 'gcmhighlanderxse', 300000, 'brs', 99),
	('OutLander', 'gcmoutlanderls', 300000, 'brs', 99),
	('Sentra 2020', 'gcmsentra20', 100000, 'brs', 99),
	('Glendale', 'glendale', 80000, 'sedans', 99),
	('Glendale2', 'glendale2', 150000, 'sedans', 99),
	('Golf GTI', 'golfgti7', 250000, 'brs', 99),
	('Gp1', 'gp1', 500000, 'muscle', 99),
	('Granger', 'granger', 345000, 'suvs', 99),
	('Gresley', 'gresley', 200000, 'suvs', 99),
	('Growler', 'growler', 1400000, 'sports', 99),
	('BMW F310', 'gs310', 500000, 'motos', 99),
	('Suzuki XR', 'gsxr', 300000, 'motos', 99),
	('Gt500', 'gt500', 250000, 'classics', 99),
	('Ninja H2 Carb', 'h2carb', 800000, 'motos', 99),
	('Hakuchou', 'hakuchou', 380000, 'motos', 99),
	('Hakuchou S', 'hakuchou2', 550000, 'motos', 99),
	('Hayabusa', 'hayabusa', 700000, 'motos', 99),
	('CBR 1000RR', 'hcbr17', 900000, 'motos', 99),
	('Hellion', 'hellion', 320000, 'offroad', 99),
	('Hermes', 'hermes', 280000, 'muscle', 99),
	('Hexer', 'hexer', 250000, 'motos', 99),
	('Hilux', 'hilux2019', 300000, 'brs', 99),
	('Hornet', 'hornet', 200000, 'motos', 99),
	('Hotknife', 'hotknife', 180000, 'muscle', 99),
	('Huntley', 'huntley', 180000, 'suvs', 99),
	('Imorgon', 'imorgon', 550000, 'sports', 99),
	('Impaler', 'impaler', 320000, 'muscle', 99),
	('Infernus', 'infernus', 520000, 'muscle', 99),
	('Ingot', 'ingot', 160000, 'sedans', 99),
	('Innovation', 'innovation', 250000, 'motos', 99),
	('Intruder', 'intruder', 110000, 'sedans', 99),
	('Issi S', 'issi2', 80000, 'compacts', 99),
	('Issi SE', 'issi3', 35000, 'compacts', 99),
	('Issi7', 'issi7', 850000, 'sports', 99),
	('Italigtb', 'italigtb', 600000, 'muscle', 99),
	('Italigto', 'italigto', 800000, 'sports', 99),
	('Italirsx', 'italirsx', 1550000, 'sports', 99),
	('Jackal', 'jackal', 70000, 'coupes', 99),
	('Jester', 'jester', 150000, 'sports', 99),
	('Jester4', 'jester4', 1450000, 'sports', 99),
	('Jetta GLI', 'jettagli', 350000, 'brs', 99),
	('Jugular', 'jugular', 750000, 'sports', 99),
	('Kalahari', 'kalahari', 100000, 'offroad', 99),
	('Kanjo', 'kanjo', 150000, 'compacts', 99),
	('Khamelion', 'khamelion', 210000, 'sports', 99),
	('Komoda', 'komoda', 450000, 'sports', 99),
	('Krieger', 'krieger', 900000, 'muscle', 99),
	('Kuruma', 'kuruma', 330000, 'sports', 99),
	('Lambo Huracan', 'lamborghinihuracan', 2600000, 'importados', 99),
	('Lance Evo 9', 'lancerevolution9', 1500000, 'importados', 99),
	('Lance Evo X', 'lancerevolutionx', 1800000, 'importados', 99),
	('Landstalker', 'landstalker', 150000, 'suvs', 99),
	('Landstalker2', 'landstalker2', 200000, 'suvs', 99),
	('Lectro', 'lectro', 380000, 'motos', 99),
	('Locust', 'locust', 1350000, 'sports', 99),
	('Lurcher', 'lurcher', 200000, 'muscle', 99),
	('Lynx', 'lynx', 370000, 'sports', 99),
	('Porsche Macan', 'macan', 1800000, 'importados', 99),
	('Mamba', 'mamba', 300000, 'classics', 99),
	('Manana', 'manana', 130000, 'classics', 99),
	('Manchez', 'manchez', 300000, 'motos', 99),
	('Massacro', 'massacro', 330000, 'sports', 99),
	('Mazda RX7', 'mazdarx7', 1500000, 'importados', 99),
	('Mercedes A45', 'mercedesa45', 1500000, 'importados', 99),
	('Mercedes 63C', 'mers63c', 1700000, 'importados', 99),
	('Mesa', 'mesa', 150000, 'suvs', 99),
	('Mesa3', 'mesa3', 200000, 'offroad', 99),
	('Minivan', 'minivan', 200000, 'vans', 99),
	('Monroe', 'monroe', 260000, 'classics', 99),
	('Moon Beam', 'moonbeam', 220000, 'muscle', 99),
	('MT-03', 'mt03', 150000, 'motos', 99),
	('Nebula', 'nebula', 500000, 'classics', 99),
	('Neo', 'neo', 1050000, 'sports', 99),
	('Neon', 'neon', 370000, 'sports', 99),
	('Nero', 'nero', 510000, 'muscle', 99),
	('Frontier', 'nf17', 270000, 'brs', 99),
	('NightBlade', 'nightblade', 415000, 'motos', 99),
	('Night Shade', 'nightshade', 270000, 'muscle', 99),
	('Ninef', 'ninef', 290000, 'sports', 99),
	('Ninef2', 'ninef2', 290000, 'sports', 99),
	('Nissan 370Z', 'nissan370z', 1500000, 'importados', 99),
	('Nissan GTR', 'nissangtr', 2000000, 'importados', 99),
	('Skyline', 'nissanskyliner34', 2200000, 'importados', 99),
	('Novak', 'novak', 370000, 'suvs', 99),
	('Oracle S', 'oracle', 70000, 'coupes', 99),
	('Oracle', 'oracle2', 90000, 'coupes', 99),
	('Osiris', 'osiris', 510000, 'muscle', 99),
	('Outlaw', 'outlaw', 450000, 'offroad', 99),
	('Mclaren P1', 'p1', 3000000, 'importados', 99),
	('Pajero', 'pajero4', 100000, 'brs', 99),
	('Panamera Turbo', 'panamera17turbo', 2800000, 'importados', 99),
	('Panto', 'panto', 32000, 'compacts', 99),
	('Paradise', 'paradise', 260000, 'vans', 99),
	('Paragon', 'paragon', 850000, 'sports', 99),
	('Pariah', 'pariah', 500000, 'sports', 99),
	('Patriot', 'patriot', 280000, 'suvs', 99),
	('PCJ', 'pcj', 230000, 'motos', 99),
	('Penetrator', 'penetrator', 510000, 'muscle', 99),
	('Penumbra', 'penumbra', 150000, 'sports', 99),
	('Penumbra2', 'penumbra2', 850000, 'sports', 99),
	('Peyote', 'peyote', 150000, 'classics', 99),
	('Peyote2', 'peyote2', 400000, 'muscle', 99),
	('Pfister811', 'pfister811', 530000, 'muscle', 99),
	('Picador', 'picador', 150000, 'muscle', 99),
	('Pigalle', 'pigalle', 250000, 'classics', 99),
	('Polo', 'polo2018', 80000, 'brs', 99),
	('Pony2', 'pony2', 260000, 'vans', 99),
	('Prairie', 'prairie', 40000, 'compacts', 99),
	('Premier', 'premier', 80000, 'sedans', 99),
	('Previon', 'previon', 200000, 'coupes', 99),
	('Primo', 'primo', 130000, 'sedans', 99),
	('Prototipo', 'prototipo', 1030000, 'muscle', 99),
	('Yamaha R1', 'r1', 300000, 'motos', 99),
	('R1200GS', 'R1200GS', 1100000, 'motos', 99),
	('Yamaha R6', 'r6', 400000, 'motos', 99),
	('Raiden', 'raiden', 240000, 'sports', 99),
	('Rancherxl', 'rancherxl', 220000, 'offroad', 99),
	('Rapidgt', 'rapidgt', 250000, 'sports', 99),
	('Rapidgt3', 'rapidgt3', 220000, 'classics', 99),
	('Raptor', 'raptor2017', 2200000, 'importados', 99),
	('Ratloader', 'ratloader', 260000, 'vans', 99),
	('Ratloader MS', 'ratloader2', 150000, 'muscle', 99),
	('Reaper', 'reaper', 620000, 'muscle', 99),
	('Rebla', 'rebla', 440000, 'suvs', 99),
	('Remus', 'remus', 450000, 'sports', 99),
	('Retinue', 'retinue', 150000, 'classics', 99),
	('Rhapsody', 'rhapsody', 30000, 'compacts', 99),
	('Riata', 'riata', 250000, 'offroad', 99),
	('Range Rover', 'rrst', 1800000, 'importados', 99),
	('Audi RS6 Sedan', 'rs6c8', 2600000, 'importados', 99),
	('Rt3000', 'rt3000', 700000, 'sports', 99),
	('Ruffian', 'ruffian', 345000, 'motos', 99),
	('Ruiner', 'ruiner', 150000, 'muscle', 99),
	('Rumpo3', 'rumpo3', 350000, 'vans', 99),
	('Bmw S1000', 's1000docandidato', 1000000, 'motos', 99),
	('Sabre GT', 'sabregt', 260000, 'muscle', 99),
	('Sadler', 'sadler', 180000, 'suvs', 99),
	('Sanchez', 'sanchez2', 185000, 'motos', 99),
	('Sanctus', 'sanctus', 220000, 'motos', 99),
	('Sandking', 'sandking', 400000, 'offroad', 99),
	('Sandking2', 'sandking2', 370000, 'offroad', 99),
	('Saveiro Surf', 'savaoriginal', 60000, 'brs', 99),
	('Sc1', 'sc1', 505000, 'muscle', 99),
	('Schafter3', 'schafter3', 275000, 'sports', 99),
	('Schafter5', 'schafter5', 275000, 'sports', 99),
	('Schwarzer', 'schwarzer', 170000, 'sports', 99),
	('Seminole', 'seminole', 130000, 'suvs', 99),
	('sentinel', 'sentinel', 80000, 'coupes', 99),
	('sentinel2', 'sentinel2', 100000, 'coupes', 99),
	('Sentinel3', 'sentinel3', 170000, 'sports', 99),
	('Serrano', 'serrano', 150000, 'suvs', 99),
	('Seven70', 'seven70', 370000, 'sports', 99),
	('Sheava', 'sheava', 800000, 'muscle', 99),
	('Sovereign', 'sovereign', 285000, 'motos', 99),
	('Specter', 'specter', 320000, 'sports', 99),
	('Speedo', 'speedo', 200000, 'vans', 99),
	('Stafford', 'stafford', 900000, 'sedans', 99),
	('stalion', 'stalion', 150000, 'muscle', 99),
	('Stanier', 'stanier', 100000, 'sedans', 99),
	('Stinger', 'stinger', 220000, 'classics', 99),
	('Stratum', 'stratum', 120000, 'sedans', 99),
	('Stretch', 'stretch', 520000, 'sedans', 99),
	('Stryder', 'stryder', 300000, 'motos', 99),
	('Sultan', 'sultan', 210000, 'sports', 99),
	('Sultan2', 'sultan2', 550000, 'sports', 99),
	('Sultan3', 'sultan3', 700000, 'sports', 99),
	('Sultanrs', 'sultanrs', 510000, 'muscle', 99),
	('Surano', 'surano', 310000, 'sports', 99),
	('Surfer', 'surfer', 55000, 'vans', 99),
	('Surge', 'surge', 300000, 'sedans', 99),
	('T20', 't20', 670000, 'muscle', 99),
	('Taigun', 'taigun21', 100000, 'brs', 99),
	('Tailgater2', 'tailgater2', 600000, 'sedans', 99),
	('Taipan', 'taipan', 620000, 'muscle', 99),
	('Tampa GT', 'tampa', 170000, 'muscle', 99),
	('Tempesta', 'tempesta', 600000, 'muscle', 99),
	('Tesla Prior', 'teslaprior', 3100000, 'importados', 99),
	('Tesla Model X', 'teslax', 3100000, 'importados', 99),
	('Thrax', 'thrax', 1000000, 'muscle', 99),
	('Thrust', 'thrust', 375000, 'motos', 99),
	('Tornado', 'tornado', 150000, 'classics', 99),
	('Toro S', 'toros', 520000, 'suvs', 99),
	('Toyota Supra', 'toyotasupra', 2000000, 'importados', 99),
	('Audi TT', 'ttrs', 2000000, 'importados', 99),
	('Tulip', 'tulip', 170000, 'muscle', 99),
	('Turismor', 'turismor', 620000, 'muscle', 99),
	('Tyrant', 'tyrant', 690000, 'muscle', 99),
	('UP TSI', 'uptsi', 120000, 'brs', 99),
	('Ducati v4', 'v4sf', 600000, 'motos', 99),
	('Vacca', 'vacca', 620000, 'muscle', 99),
	('Vader', 'vader', 345000, 'motos', 99),
	('Vagner', 'vagner', 680000, 'muscle', 99),
	('Vamos', 'vamos', 320000, 'muscle', 99),
	('Vectre', 'vectre', 1000000, 'sports', 99),
	('Velar', 'velar', 3000000, 'importados', 99),
	('Velociraptor', 'velociraptor', 3000000, 'importados', 99),
	('Veloster', 'veloster', 80000, 'brs', 99),
	('Verlierer2', 'verlierer2', 380000, 'sports', 99),
	('Vigero', 'vigero', 170000, 'muscle', 99),
	('Vindicator', 'vindicator', 340000, 'motos', 99),
	('Virgo', 'virgo', 150000, 'muscle', 99),
	('Visione', 'visione', 690000, 'muscle', 99),
	('Voltic', 'voltic', 500000, 'muscle', 99),
	('Voodoo', 'voodoo', 220000, 'muscle', 99),
	('Vortex', 'vortex', 375000, 'motos', 99),
	('Vstr', 'vstr', 750000, 'sports', 99),
	('Fusca', 'vwbeetlenaj', 50000, 'brs', 99),
	('Warrener', 'warrener', 90000, 'sedans', 99),
	('Weevil', 'weevil', 100000, 'compacts', 99),
	('Windsor', 'windsor', 120000, 'coupes', 99),
	('windsor S', 'windsor2', 150000, 'coupes', 99),
	('Wolfsbane', 'wolfsbane', 290000, 'motos', 99),
	('BMW x6M', 'x6m', 3100000, 'importados', 99),
	('Xa21', 'xa21', 630000, 'muscle', 99),
	('Xls', 'xls', 190000, 'suvs', 99),
	('Xls S', 'xls2', 350000, 'suvs', 99),
	('XRE 300', 'xre300', 100000, 'motos', 99),
	('Yosemite', 'yosemite', 350000, 'muscle', 99),
	('Yosemite3', 'yosemite3', 475000, 'muscle', 99),
	('Youga', 'youga', 260000, 'vans', 99),
	('z1000', 'z1000', 1000000, 'motos', 99),
	('Zentorno', 'zentorno', 920000, 'muscle', 99),
	('zion', 'zion', 60000, 'coupes', 99),
	('zion S', 'zion2', 80000, 'coupes', 99),
	('Zombie A', 'zombiea', 290000, 'motos', 99),
	('Zombie B', 'zombieb', 300000, 'motos', 99),
	('Zorrusso', 'zorrusso', 100000, 'muscle', 99),
	('Zr350', 'zr350', 1350000, 'sports', 99),
	('Ztype', 'ztype', 400000, 'classics', 99);

-- Copiando estrutura para tabela skips.groups_blacklist
CREATE TABLE IF NOT EXISTS `groups_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.groups_blacklist: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.id_users
CREATE TABLE IF NOT EXISTS `id_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) NOT NULL,
  `whitelisted` tinyint(1) DEFAULT 0,
  `banned` tinyint(1) DEFAULT 0,
  `chars` int(1) DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.id_users: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.mrlt_hp_consultas
CREATE TABLE IF NOT EXISTS `mrlt_hp_consultas` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_user_id` int(11) NOT NULL,
  `c_esp` varchar(255) NOT NULL,
  `c_date` longtext NOT NULL,
  `c_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.mrlt_hp_consultas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.mrlt_hp_data
CREATE TABLE IF NOT EXISTS `mrlt_hp_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `ocorrencia` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `datahora` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.mrlt_hp_data: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.mrlt_hp_fotos
CREATE TABLE IF NOT EXISTS `mrlt_hp_fotos` (
  `user_id` int(11) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.mrlt_hp_fotos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.nation_race
CREATE TABLE IF NOT EXISTS `nation_race` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `nickname` text NOT NULL DEFAULT '',
  `races` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.nation_race: ~0 rows (aproximadamente)

-- Dumping structure for table azkaban.smartphone_bank_invoices
DROP TABLE IF EXISTS `smartphone_bank_invoices`;
CREATE TABLE IF NOT EXISTS `smartphone_bank_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payee_id` int(11) NOT NULL,
  `payer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_blocks
DROP TABLE IF EXISTS `smartphone_blocks`;
CREATE TABLE IF NOT EXISTS `smartphone_blocks` (
  `user_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_calls
DROP TABLE IF EXISTS `smartphone_calls`;
CREATE TABLE IF NOT EXISTS `smartphone_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL,
  `video` tinyint(4) DEFAULT 0,
  `anonymous` tinyint(4) DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_casino
DROP TABLE IF EXISTS `smartphone_casino`;
CREATE TABLE IF NOT EXISTS `smartphone_casino` (
  `user_id` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `double` bigint(20) NOT NULL DEFAULT 0,
  `crash` bigint(20) NOT NULL DEFAULT 0,
  `mine` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_contacts
DROP TABLE IF EXISTS `smartphone_contacts`;
CREATE TABLE IF NOT EXISTS `smartphone_contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_extracts
DROP TABLE IF EXISTS `smartphone_extracts`;
CREATE TABLE IF NOT EXISTS `smartphone_extracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_gallery
DROP TABLE IF EXISTS `smartphone_gallery`;
CREATE TABLE IF NOT EXISTS `smartphone_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `folder` varchar(255) NOT NULL DEFAULT '/',
  `url` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_ifood_orders
DROP TABLE IF EXISTS `smartphone_ifood_orders`;
CREATE TABLE IF NOT EXISTS `smartphone_ifood_orders` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_instagram
DROP TABLE IF EXISTS `smartphone_instagram`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_instagram_followers
DROP TABLE IF EXISTS `smartphone_instagram_followers`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_instagram_likes
DROP TABLE IF EXISTS `smartphone_instagram_likes`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram_likes` (
  `post_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_instagram_notifications
DROP TABLE IF EXISTS `smartphone_instagram_notifications`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `saw` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_index` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_instagram_posts
DROP TABLE IF EXISTS `smartphone_instagram_posts`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `comments` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_olx
DROP TABLE IF EXISTS `smartphone_olx`;
CREATE TABLE IF NOT EXISTS `smartphone_olx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `images` varchar(1024) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_paypal_transactions
DROP TABLE IF EXISTS `smartphone_paypal_transactions`;
CREATE TABLE IF NOT EXISTS `smartphone_paypal_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `description` varchar(255) DEFAULT NULL,
  `value` bigint(20) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_tinder
DROP TABLE IF EXISTS `smartphone_tinder`;
CREATE TABLE IF NOT EXISTS `smartphone_tinder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `show_gender` tinyint(4) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `show_tags` tinyint(4) NOT NULL,
  `target` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_tinder_messages
DROP TABLE IF EXISTS `smartphone_tinder_messages`;
CREATE TABLE IF NOT EXISTS `smartphone_tinder_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `liked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_tinder_rating
DROP TABLE IF EXISTS `smartphone_tinder_rating`;
CREATE TABLE IF NOT EXISTS `smartphone_tinder_rating` (
  `profile_id` int(11) NOT NULL,
  `rated_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_tor_messages
DROP TABLE IF EXISTS `smartphone_tor_messages`;
CREATE TABLE IF NOT EXISTS `smartphone_tor_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) NOT NULL DEFAULT 'geral',
  `sender` varchar(255) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_tor_payments
DROP TABLE IF EXISTS `smartphone_tor_payments`;
CREATE TABLE IF NOT EXISTS `smartphone_tor_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) NOT NULL,
  `target` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_twitter_followers
DROP TABLE IF EXISTS `smartphone_twitter_followers`;
CREATE TABLE IF NOT EXISTS `smartphone_twitter_followers` (
  `follower_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_twitter_likes
DROP TABLE IF EXISTS `smartphone_twitter_likes`;
CREATE TABLE IF NOT EXISTS `smartphone_twitter_likes` (
  `tweet_id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  KEY `tweet_id` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_twitter_profiles
DROP TABLE IF EXISTS `smartphone_twitter_profiles`;
CREATE TABLE IF NOT EXISTS `smartphone_twitter_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `bannerURL` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_twitter_tweets
DROP TABLE IF EXISTS `smartphone_twitter_tweets`;
CREATE TABLE IF NOT EXISTS `smartphone_twitter_tweets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` bigint(20) DEFAULT NULL,
  `content` varchar(280) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`),
  KEY `tweet_id` (`tweet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_uber_trips
DROP TABLE IF EXISTS `smartphone_uber_trips`;
CREATE TABLE IF NOT EXISTS `smartphone_uber_trips` (
  `id` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `user_rate` tinyint(4) DEFAULT 0,
  `driver_rate` tinyint(4) DEFAULT 0,
  `created_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_weazel
DROP TABLE IF EXISTS `smartphone_weazel`;
CREATE TABLE IF NOT EXISTS `smartphone_weazel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_whatsapp
DROP TABLE IF EXISTS `smartphone_whatsapp`;
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp` (
  `owner` varchar(255) NOT NULL,
  `avatarURL` varchar(255) DEFAULT NULL,
  `read_receipts` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_whatsapp_channels
DROP TABLE IF EXISTS `smartphone_whatsapp_channels`;
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_index` (`sender`),
  KEY `target_index` (`target`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_whatsapp_groups
DROP TABLE IF EXISTS `smartphone_whatsapp_groups`;
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatarURL` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `members` varchar(2048) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table azkaban.smartphone_whatsapp_messages
DROP TABLE IF EXISTS `smartphone_whatsapp_messages`;
CREATE TABLE IF NOT EXISTS `smartphone_whatsapp_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` bigint(20) unsigned NOT NULL,
  `sender` varchar(255) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `deleted_by` varchar(255) DEFAULT NULL,
  `readed` tinyint(4) DEFAULT 0,
  `saw_at` bigint(20) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_id_index` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando estrutura para tabela skips.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela skips.sprays: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_banco
CREATE TABLE IF NOT EXISTS `vrp_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela skips.vrp_banco: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_empresas
CREATE TABLE IF NOT EXISTS `vrp_empresas` (
  `user_id` int(11) NOT NULL,
  `empresa` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.vrp_empresas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_fines
CREATE TABLE IF NOT EXISTS `vrp_fines` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `nuser_id` int(11) NOT NULL DEFAULT 0,
  `date` varchar(25) NOT NULL DEFAULT '0.0.0',
  `price` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `nuser_id` (`nuser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_helpdesk_respostas
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_respostas` (
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `case_id` int(11) NOT NULL,
  `createdAt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_helpdesk_respostas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_helpdesk_ticket
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_ticket` (
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `message` varchar(2000) NOT NULL,
  `createdAt` varchar(24) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_helpdesk_ticket: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_homes
CREATE TABLE IF NOT EXISTS `vrp_homes` (
  `home` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` int(1) NOT NULL DEFAULT 0,
  `vault` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`home`,`user_id`),
  KEY `home` (`home`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_homes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_homes_permissions
CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_homes_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_priority
CREATE TABLE IF NOT EXISTS `vrp_priority` (
  `priority` int(10) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela skips.vrp_priority: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_srv_data: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(100) DEFAULT NULL,
  `deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_users: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_data: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_homes
CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`home`),
  CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_homes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `foragido` int(11) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `multas` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_identities: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_ids: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_moneys
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_moneys: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela skips.vrp_user_vehicles
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `detido` int(1) NOT NULL DEFAULT 0,
  `time` varchar(24) NOT NULL DEFAULT '0',
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `ipva` int(11) NOT NULL,
  `alugado` tinyint(4) NOT NULL DEFAULT 0,
  `data_alugado` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`vehicle`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela skips.vrp_user_vehicles: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
