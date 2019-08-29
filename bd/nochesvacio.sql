/*
SQLyog Ultimate v12.4.3 (32 bit)
MySQL - 5.7.27 : Database - nochesvacio
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nochesvacio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nochesvacio`;

/*Table structure for table `Rol` */

DROP TABLE IF EXISTS `Rol`;

CREATE TABLE `Rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion_rol` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `Rol` */

insert  into `Rol`(`id_rol`,`descripcion_rol`) values 
(1,'Interno'),
(2,'Externo'),
(3,'Admin');

/*Table structure for table `Subnivel` */

DROP TABLE IF EXISTS `Subnivel`;

CREATE TABLE `Subnivel` (
  `id_subnivel` int(11) NOT NULL,
  `nombre_subnivel` varchar(100) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `dir_georeferencia` varchar(500) NOT NULL,
  PRIMARY KEY (`id_subnivel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `Subnivel` */

insert  into `Subnivel`(`id_subnivel`,`nombre_subnivel`,`id_zona`,`id_nivel`,`dir_georeferencia`) values 
(1,'PorterÃ­a Ramirana',1,1,''),
(2,'Ramirana - 1',1,1,''),
(3,'Ramirana - 2',1,1,''),
(4,'Ramirana - 3',1,1,''),
(5,'Ramirana - 4',1,1,''),
(6,'Ramirana - 5',1,1,''),
(7,'Ramirana - 6',1,1,''),
(8,'Ramirana - 7',1,1,''),
(9,'Ramirana - 8',1,1,''),
(10,'PorterÃ­a Maitenes',1,2,''),
(11,'Maitenes - 1',1,2,''),
(12,'Maitenes - 2',1,2,''),
(13,'Maitenes - 3',1,2,''),
(14,'Maitenes - 4',1,2,''),
(15,'Maitenes - 5',1,2,''),
(16,'Maitenes - 6',1,2,''),
(17,'Huilmay - 1',1,2,''),
(18,'Huilmay - 2',1,2,''),
(19,'Rubiana - 1',1,2,''),
(20,'Rubiana - 2',1,2,''),
(21,'Rubiana - 3',1,2,''),
(22,'Rubiana - 4',1,2,''),
(23,'Rubiana - 5',1,2,''),
(24,'PorterÃ­a Coya',1,3,''),
(25,'Coya - 1',1,3,''),
(26,'Coya - 2',1,3,''),
(27,'Coya - 3',1,3,''),
(28,'Coya - 4',1,3,''),
(29,'Coya - 5',1,3,''),
(30,'Coya - 6',1,3,''),
(31,'Coya - 7',1,3,''),
(32,'PorterÃ­a Candelaria',1,3,''),
(33,'Candelaria - 1',1,3,''),
(34,'Candelaria - 2',1,3,''),
(35,'Candelaria - 3',1,3,''),
(36,'Candelaria - 4',1,3,''),
(37,'Candelaria - 5',1,3,''),
(38,'Candelaria - 6',1,3,''),
(39,'Candelaria - 7',1,3,''),
(40,'Candelaria - 8',1,3,''),
(41,'PorterÃ­a La Soledad',1,3,''),
(42,'La Soledad - 1',1,3,''),
(43,'La Soledad - 2',1,3,''),
(44,'La Soledad - 3',1,3,''),
(45,'La Soledad - 4',1,3,''),
(46,'La Soledad - 5',1,3,''),
(47,'La Soledad - 6',1,3,''),
(48,'La Soledad - 7',1,3,''),
(49,'La Soledad - 8',1,3,''),
(50,'La Soledad - 9',1,3,''),
(51,'La Soledad - 10',1,3,''),
(52,'La Soledad - 11',1,3,''),
(53,'La Soledad - 12',1,3,''),
(54,'PorterÃ­a Santa Elena',1,3,''),
(55,'Santa Elena - 1',1,3,''),
(56,'Santa Elena - 2',1,3,''),
(57,'Santa Elena - 3',1,3,''),
(58,'Santa Elena - 4',1,3,''),
(59,'PorterÃ­a San Pedro',1,3,''),
(60,'San Pedro - 1',1,3,''),
(61,'San Pedro - 2',1,3,''),
(62,'San Pedro - 3',1,3,''),
(63,'San Pedro - 4',1,3,''),
(64,'Incub. Lo Miranda ABUELAS',1,4,''),
(65,'Incub. Lo Miranda BROILER ',1,4,''),
(66,'La Estrella',1,5,''),
(67,'La Soya',1,5,''),
(68,'El Trigo',1,5,''),
(69,'Bosque Viejo',1,5,''),
(70,'Bosque Nuevo',1,5,''),
(71,'Los CastaÃ±os',1,5,''),
(72,'La Punta',1,5,''),
(73,'La Florida',1,5,''),
(74,'Pab. Ensayo Bosque Viejo ',1,5,''),
(75,'El Valle',1,5,''),
(76,'Totihue',1,5,''),
(77,'El Quisco',1,5,''),
(78,'Quillayes',1,5,''),
(79,'La Arboleda',1,5,''),
(80,'Las Higueras',1,5,''),
(81,'La CompaÃ±Ã­a',1,5,''),
(82,'Don Charles',1,5,''),
(83,'La Leonera',1,5,''),
(84,'El Carmen',1,5,''),
(85,'La Trompeta',1,5,''),
(86,'Los Chinos 2',1,5,''),
(87,'ZVC',1,5,''),
(88,'Loma Norte',1,5,''),
(89,'Loma Sur',1,5,''),
(90,'Los Pavos',1,5,''),
(91,'Sn. AgustÃ­n',1,5,''),
(92,'Santa Teresa',1,5,''),
(93,'Las Cucas',1,5,''),
(94,'PicarquÃ­n',1,5,''),
(95,'San Ignacio',1,5,''),
(96,'San Pedro',1,5,''),
(97,'La Esmeralda',1,5,''),
(98,'El Almendro',1,5,''),
(99,'Los Gomeros',1,5,''),
(100,'AgrÃ­cola San Pedro Ltda',1,5,''),
(101,'PorterÃ­a Olivos ',2,2,''),
(102,'Olivos - 1',2,2,''),
(103,'Olivos - 2',2,2,''),
(104,'Olivos - 3',2,2,''),
(105,'Olivos - 4',2,2,''),
(106,'Olivos - 5',2,2,''),
(107,'Olivos - 6',2,2,''),
(108,'Olivos - 7',2,2,''),
(109,'PorterÃ­a Ajial',2,2,''),
(110,' Ajial - 1',2,2,''),
(111,' Ajial - 2',2,2,''),
(112,' Ajial - 3',2,2,''),
(113,'PorterÃ­a UR',2,2,''),
(114,'UR - 1',2,2,''),
(115,'UR - 2',2,2,''),
(116,'UR - 3',2,2,''),
(117,'PorterÃ­a Castillo',2,3,''),
(118,'Castillo - 1',2,3,''),
(119,'Castillo - 2',2,3,''),
(120,'Castillo - 3',2,3,''),
(121,'Castillo - 4',2,3,''),
(122,'Castillo - 5',2,3,''),
(123,'Castillo - 6',2,3,''),
(124,'Castillo - 7',2,3,''),
(125,'Castillo - 8',2,3,''),
(126,'Castillo - 9',2,3,''),
(127,'Castillo - 10',2,3,''),
(128,'PorterÃ­a Tantehue',2,3,''),
(129,'Tantehue - 1',2,3,''),
(130,'Tantehue - 2',2,3,''),
(131,'Tantehue - 3',2,3,''),
(132,'Tantehue - 4',2,3,''),
(133,'Tantehue - 5',2,3,''),
(134,'Tantehue - 6',2,3,''),
(135,'Tantehue - 7',2,3,''),
(136,'Tantehue - 8',2,3,''),
(137,'Tantehue - 9',2,3,''),
(138,'Incub. Las AraÃ±as',2,4,''),
(139,'Incub. CuracavÃ­',2,4,''),
(140,'Valdebenito',2,5,''),
(141,'Alhue',2,5,''),
(142,'Don Forster',2,5,''),
(143,'Don  Gastón ',2,5,''),
(144,'Don  Cornelio',2,5,''),
(145,'Don Ambrosio',2,5,''),
(146,'Las Diucas',2,5,''),
(147,'Don Tito',2,5,''),
(148,'Don Lalo',2,5,''),
(149,'Don Wilson',2,5,''),
(150,'Las Murallas  1',2,5,''),
(151,'Loica',2,5,''),
(152,'DoÃ±a Ema',2,5,''),
(153,'Sta. Rosa',2,5,''),
(154,'Chifri',2,5,''),
(155,'Dusett',2,5,''),
(156,'Las Cornizas',2,5,''),
(157,'Longovilo',2,5,''),
(158,'Don Rica',2,5,''),
(159,'El Tucan',2,5,''),
(160,'Los Culenes',2,5,''),
(161,'Demetrio',2,5,''),
(162,'El Galeón',2,5,''),
(163,'La Fiera',2,5,''),
(164,'El Diputado',2,5,''),
(165,'La Liguana',2,5,''),
(166,'Los Loros',2,5,''),
(167,'Los Pinos',2,5,''),
(168,'Matanza',2,5,''),
(169,'Las Vegas',2,5,''),
(170,'Lolenco',2,5,''),
(171,'Puangue',2,5,''),
(172,'Don Jorge',2,5,''),
(173,'Chayaco 1',2,5,''),
(174,'Chayaco 2',2,5,''),
(175,'Libreta',2,5,''),
(176,'Don FeÃ±a',2,5,''),
(177,'AgrÃ­cola Manga Sur',2,5,''),
(182,'GRUPO 25',1,7,''),
(181,'GRUPO 12/28',1,7,''),
(183,'GRUPO 3',1,7,''),
(184,'GRUPO 4',1,7,''),
(185,'GRUPO 9',1,7,''),
(186,'GRUPO 10',2,7,''),
(187,'GRUPO 14',2,7,''),
(188,'GRUPO 15',2,7,''),
(189,'GRUPO 16',2,7,''),
(190,'GRUPO 17',2,7,''),
(191,'GRUPO 18',2,7,''),
(192,'GRUPO 19',2,7,''),
(193,'GRUPO 20',2,7,''),
(194,'GRUPO 21',2,7,''),
(195,'GRUPO 22',2,7,''),
(196,'GRUPO 23',2,7,''),
(197,'GRUPO 24',2,7,''),
(198,'GRUPO 26',2,7,''),
(199,'LA LEONERA',1,8,''),
(200,'RINCON DE ABRA',1,8,''),
(201,'SITIO 2',2,8,''),
(202,'SITIO 3',2,8,''),
(203,'SITIO 5',2,8,''),
(204,'SITIO 7',2,8,''),
(205,'SITIO 8',2,8,''),
(206,'SITIO 9',2,8,''),
(207,'BARRANCAS',2,9,''),
(208,'CASTROL',2,9,''),
(209,'CORNECHE',2,9,''),
(210,'DON SATA',2,9,''),
(211,'EL ALCALDE',2,9,''),
(212,'EL CAPRICHO',2,9,''),
(213,'EL DIVISADERO',2,9,''),
(214,'EL ESPINO',2,9,''),
(215,'EL ESTERO',2,9,''),
(216,'EL HONORABLE',2,9,''),
(217,'EL LITRE',2,9,''),
(218,'EL MILAGRO',2,9,''),
(219,'EL MONTE',2,9,''),
(220,'EL PEUMO',2,9,''),
(221,'EL RETORNO',2,9,''),
(222,'EL TOTEM',2,9,''),
(223,'EL YALI',2,9,''),
(224,'ELHUE',2,9,''),
(225,'LA CAÃ‘A',2,9,''),
(226,'LA COPA',2,9,''),
(227,'LA MINA',2,9,''),
(228,'LA NORIA',2,9,''),
(229,'LA TOSCA',2,9,''),
(230,'LAS BRISAS',2,9,''),
(231,'LAS MURALLAS',2,9,''),
(232,'LAS POCILLAS',2,9,''),
(233,'LAS VARILLAS',2,9,''),
(234,'LOS ALAMOS',2,9,''),
(235,'LOS CLONQUIS',2,9,''),
(236,'LOS CONCEJALES',2,9,''),
(237,'LOS CURUROS',2,9,''),
(238,'LOS LLANOS',2,9,''),
(239,'LOS TATAS',2,9,''),
(240,'MAITENLAHUE',2,9,''),
(241,'MANZO',2,9,''),
(242,'MR DIC',2,9,''),
(243,'PIEDRA DEL JOTE',2,9,''),
(244,'PIEDRA DEL TRARO',2,9,''),
(245,'RAPEL',2,9,''),
(246,'SAN MANUEL',2,9,''),
(247,'CHANCON 1',1,9,''),
(248,'CHANCON 2',1,9,''),
(249,'DON CHARLES C',1,9,''),
(250,'EL ALMENDRO C',1,9,''),
(251,'EL CARMEN C',1,9,''),
(252,'EL QUISCO C',1,9,''),
(253,'LA ARBOLEDA C',1,9,''),
(254,'LA ESMERALDA C',1,9,''),
(255,'LA LECHERIA',1,9,''),
(256,'LA MARAVILLA',1,9,''),
(257,'LOS GOMEROS',1,9,''),
(258,'TOTIHUE',1,9,''),
(259,'Grupo 13',1,10,''),
(260,'PLA LA RAMIRANA',1,10,''),
(261,'CCO CASTILLO',2,10,''),
(262,'CCO LA ESTRELLA',2,10,''),
(263,'CCO LA MANGA',2,10,''),
(264,'CCO TANTEHUE',2,10,''),
(265,'CCO VALDEBENITO',2,10,''),
(266,'PLA LA ESTRELLA',2,10,''),
(267,'PLA LA MANGA',2,10,''),
(268,'PLA MAITENLAHUE',2,10,''),
(269,'PLA PERALILLO',2,10,''),
(270,'PLA POCILLAS',2,10,''),
(271,'PLA TANTEHUE',2,10,''),
(272,'PLA VALDEBENITO',2,10,''),
(274,'N1',1,2,'');

/*Table structure for table `Zona` */

DROP TABLE IF EXISTS `Zona`;

CREATE TABLE `Zona` (
  `id_zona` int(11) NOT NULL,
  `descripción` varchar(100) NOT NULL,
  `id_especie` int(11) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `Zona` */

insert  into `Zona`(`id_zona`,`descripción`,`id_especie`) values 
(1,'Rancagua',1),
(2,'Costa',1);

/*Table structure for table `especie` */

DROP TABLE IF EXISTS `especie`;

CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `especie` */

insert  into `especie`(`id_especie`,`nombre`) values 
(1,'POLLOS'),
(2,'CERDOS');

/*Table structure for table `nivel` */

DROP TABLE IF EXISTS `nivel`;

CREATE TABLE `nivel` (
  `id_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(50) NOT NULL,
  `id_especie` int(11) DEFAULT NULL,
  `cod_nivel` int(3) NOT NULL,
  PRIMARY KEY (`id_nivel`),
  KEY `id_especie` (`id_especie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `nivel` */

insert  into `nivel`(`id_nivel`,`nombre_nivel`,`id_especie`,`cod_nivel`) values 
(1,'Abuelas',1,1),
(2,'Reproductoras - Crianza',1,2),
(3,'Reproductoras - Producción',1,3),
(4,'Incubación',1,4),
(5,'Crianza Broile',1,5),
(6,'N1',2,1),
(7,'N2',2,2),
(8,'N3',2,3),
(9,'N4',2,4),
(10,'N5',2,5);

/*Table structure for table `parametros` */

DROP TABLE IF EXISTS `parametros`;

CREATE TABLE `parametros` (
  `clave` varchar(11) NOT NULL,
  `valor` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `parametros` */

insert  into `parametros`(`clave`,`valor`) values 
('lastsave','2019-08-28 18:00:00');

/*Table structure for table `piramide` */

DROP TABLE IF EXISTS `piramide`;

CREATE TABLE `piramide` (
  `id_especie` int(11) NOT NULL,
  `arriba` int(11) NOT NULL,
  `tipo_rol` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id_especie`,`tipo_rol`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `piramide` */

insert  into `piramide`(`id_especie`,`arriba`,`tipo_rol`,`valor`) values 
(1,3,1,1),
(1,3,2,2),
(2,3,1,0),
(2,3,2,1);

/*Table structure for table `piramide_especies` */

DROP TABLE IF EXISTS `piramide_especies`;

CREATE TABLE `piramide_especies` (
  `especie_origen` int(11) NOT NULL,
  `especie_destino` int(11) NOT NULL,
  `nivel_origen` int(11) NOT NULL,
  `nivel_destino` int(11) NOT NULL,
  `tipo_rol` int(11) NOT NULL,
  `id_zona_origen` int(11) NOT NULL,
  `id_zona_destino` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `piramide_especies` */

insert  into `piramide_especies`(`especie_origen`,`especie_destino`,`nivel_origen`,`nivel_destino`,`tipo_rol`,`id_zona_origen`,`id_zona_destino`,`valor`) values 
(1,2,1,1,1,1,1,1),
(1,2,1,2,1,1,1,1),
(1,2,1,3,1,1,1,1),
(1,2,1,4,1,1,1,1),
(1,2,1,5,1,1,1,1),
(1,2,2,1,1,1,1,1),
(1,2,2,2,1,1,1,1),
(1,2,2,3,1,1,1,1),
(1,2,2,4,1,1,1,1),
(1,2,2,5,1,1,1,1),
(1,2,3,1,1,1,1,3),
(1,2,3,2,1,1,1,1),
(1,2,3,3,1,1,1,1),
(1,2,3,4,1,1,1,1),
(1,2,3,5,1,1,1,1),
(1,2,4,1,1,1,1,3),
(1,2,4,2,1,1,1,1),
(1,2,4,3,1,1,1,1),
(1,2,4,4,1,1,1,1),
(1,2,4,5,1,1,1,1),
(1,2,5,1,1,1,1,3),
(1,2,5,2,1,1,1,1),
(1,2,5,3,1,1,1,1),
(1,2,5,4,1,1,1,1),
(1,2,5,5,1,1,1,1),
(2,1,1,1,1,1,1,1),
(2,1,1,2,1,1,1,1),
(2,1,1,3,1,1,1,1),
(2,1,1,4,1,1,1,1),
(2,1,1,5,1,1,1,1),
(2,1,2,1,1,1,1,3),
(2,1,2,2,1,1,1,3),
(2,1,2,3,1,1,1,1),
(2,1,2,4,1,1,1,1),
(2,1,2,5,1,1,1,1),
(2,1,3,1,1,1,1,3),
(2,1,3,2,1,1,1,3),
(2,1,3,3,1,1,1,3),
(2,1,3,4,1,1,1,3),
(2,1,3,5,1,1,1,3),
(2,1,4,1,1,1,1,3),
(2,1,4,2,1,1,1,3),
(2,1,4,3,1,1,1,3),
(2,1,4,4,1,1,1,3),
(2,1,4,5,1,1,1,3),
(2,1,5,1,1,1,1,3),
(2,1,5,2,1,1,1,3),
(2,1,5,3,1,1,1,3),
(2,1,5,4,1,1,1,3),
(2,1,5,5,1,1,1,3),
(1,2,1,1,2,1,2,1),
(1,2,1,2,2,1,2,1),
(1,2,1,3,2,1,2,1),
(1,2,1,4,2,1,2,1),
(1,2,1,5,2,1,2,1),
(1,2,2,1,2,1,2,1),
(1,2,2,2,2,1,2,1),
(1,2,2,3,2,1,2,1),
(1,2,2,4,2,1,2,1),
(1,2,2,5,2,1,2,1),
(1,2,3,1,2,1,2,3),
(1,2,3,2,2,1,2,1),
(1,2,3,3,2,1,2,1),
(1,2,3,4,2,1,2,1),
(1,2,3,5,2,1,2,1),
(1,2,4,1,2,1,2,3),
(1,2,4,2,2,1,2,1),
(1,2,4,3,2,1,2,1),
(1,2,4,4,2,1,2,1),
(1,2,4,5,2,1,2,1),
(1,2,5,1,2,1,2,3),
(1,2,5,2,2,1,2,1),
(1,2,5,3,2,1,2,1),
(1,2,5,4,2,1,2,1),
(1,2,5,5,2,1,2,1),
(2,1,1,1,2,1,2,1),
(2,1,1,2,2,1,2,1),
(2,1,1,3,2,1,2,1),
(2,1,1,4,2,1,2,1),
(2,1,1,5,2,1,2,1),
(2,1,2,1,2,1,2,3),
(2,1,2,2,2,1,2,3),
(2,1,2,3,2,1,2,1),
(2,1,2,4,2,1,2,1),
(2,1,2,5,2,1,2,1),
(2,1,3,1,2,1,2,3),
(2,1,3,2,2,1,2,3),
(2,1,3,3,2,1,2,3),
(2,1,3,4,2,1,2,3),
(2,1,3,5,2,1,2,3),
(2,1,4,1,2,1,2,3),
(2,1,4,2,2,1,2,3),
(2,1,4,3,2,1,2,3),
(2,1,4,4,2,1,2,3),
(2,1,4,5,2,1,2,3),
(2,1,5,1,2,1,2,3),
(2,1,5,2,2,1,2,3),
(2,1,5,3,2,1,2,3),
(2,1,5,4,2,1,2,3),
(2,1,5,5,2,1,2,3),
(1,1,1,1,1,1,1,0),
(1,1,1,1,2,1,1,0),
(1,1,1,2,1,1,1,1),
(1,1,1,2,2,1,1,2),
(1,1,1,3,1,1,1,0),
(1,1,1,3,2,1,1,1),
(1,1,1,4,1,1,1,1),
(1,1,1,4,2,1,1,2),
(1,1,1,5,1,1,1,1),
(1,1,1,5,2,1,1,2),
(1,2,1,1,1,2,1,1),
(1,2,1,2,1,2,1,1),
(1,2,1,3,1,2,1,1),
(1,2,1,4,1,2,1,1),
(1,2,1,5,1,2,1,1),
(1,2,2,1,1,2,1,1),
(1,2,2,2,1,2,1,1),
(1,2,2,3,1,2,1,1),
(1,2,2,4,1,2,1,1),
(1,2,2,5,1,2,1,1),
(1,2,3,1,1,2,1,3),
(1,2,3,2,1,2,1,1),
(1,2,3,3,1,2,1,1),
(1,2,3,4,1,2,1,1),
(1,2,3,5,1,2,1,1),
(1,2,4,1,1,2,1,3),
(1,2,4,2,1,2,1,1),
(1,2,4,3,1,2,1,1),
(1,2,4,4,1,2,1,1),
(1,2,4,5,1,2,1,1),
(1,2,5,1,1,2,1,3),
(1,2,5,2,1,2,1,1),
(1,2,5,3,1,2,1,1),
(1,2,5,4,1,2,1,1),
(1,2,5,5,1,2,1,1),
(1,2,1,1,2,2,2,1),
(1,2,1,2,2,2,2,1),
(1,2,1,3,2,2,2,1),
(1,2,1,4,2,2,2,1),
(1,2,1,5,2,2,2,1),
(1,2,2,1,2,2,2,1),
(1,2,2,2,2,2,2,1),
(1,2,2,3,2,2,2,1),
(1,2,2,4,2,2,2,1),
(1,2,2,5,2,2,2,1),
(1,2,3,1,2,2,2,3),
(1,2,3,2,2,2,2,1),
(1,2,3,3,2,2,2,1),
(1,2,3,4,2,2,2,1),
(1,2,3,5,2,2,2,1),
(1,2,4,1,2,2,2,3),
(1,2,4,2,2,2,2,1),
(1,2,4,3,2,2,2,1),
(1,2,4,4,2,2,2,1),
(1,2,4,5,2,2,2,1),
(1,2,5,1,2,2,2,3),
(1,2,5,2,2,2,2,1),
(1,2,5,3,2,2,2,1),
(1,2,5,4,2,2,2,1),
(1,2,5,5,2,2,2,1),
(2,1,1,1,1,2,1,1),
(2,1,1,2,1,2,1,1),
(2,1,1,3,1,2,1,1),
(2,1,1,4,1,2,1,1),
(2,1,1,5,1,2,1,1),
(2,1,2,1,1,2,1,3),
(2,1,2,2,1,2,1,3),
(2,1,2,3,1,2,1,1),
(2,1,2,4,1,2,1,1),
(2,1,2,5,1,2,1,1),
(2,1,3,1,1,2,1,3),
(2,1,3,2,1,2,1,3),
(2,1,3,3,1,2,1,3),
(2,1,3,4,1,2,1,3),
(2,1,3,5,1,2,1,3),
(2,1,4,1,1,2,1,3),
(2,1,4,2,1,2,1,3),
(2,1,4,3,1,2,1,3),
(2,1,4,4,1,2,1,3),
(2,1,4,5,1,2,1,3),
(2,1,5,1,1,2,1,3),
(2,1,5,2,1,2,1,3),
(2,1,5,3,1,2,1,3),
(2,1,5,4,1,2,1,3),
(2,1,5,5,1,2,1,3),
(2,1,1,1,2,2,2,1),
(2,1,1,2,2,2,2,1),
(2,1,1,3,2,2,2,1),
(2,1,1,4,2,2,2,1),
(2,1,1,5,2,2,2,1),
(2,1,2,1,2,2,2,3),
(2,1,2,2,2,2,2,3),
(2,1,2,3,2,2,2,1),
(2,1,2,4,2,2,2,1),
(2,1,2,5,2,2,2,1),
(2,1,3,1,2,2,2,3),
(2,1,3,2,2,2,2,3),
(2,1,3,3,2,2,2,3),
(2,1,3,4,2,2,2,3),
(2,1,3,5,2,2,2,3),
(2,1,4,1,2,2,2,3),
(2,1,4,2,2,2,2,3),
(2,1,4,3,2,2,2,3),
(2,1,4,4,2,2,2,3),
(2,1,4,5,2,2,2,3),
(2,1,5,1,2,2,2,3),
(2,1,5,2,2,2,2,3),
(2,1,5,3,2,2,2,3),
(2,1,5,4,2,2,2,3),
(2,1,5,5,2,2,2,3),
(1,1,1,1,1,1,2,0),
(1,1,1,1,2,1,2,2),
(1,1,1,1,1,2,1,0),
(1,1,1,1,2,2,1,2),
(1,1,1,2,1,1,2,0),
(1,1,1,2,2,1,2,1),
(1,1,1,2,1,2,1,3),
(1,1,1,2,2,2,1,3),
(1,1,1,3,1,1,2,2),
(1,1,1,3,2,1,2,2),
(1,1,1,3,1,2,1,0),
(1,1,1,3,2,2,1,1),
(1,1,1,4,1,1,2,2),
(1,1,1,4,2,1,2,1),
(1,1,1,4,1,2,1,0),
(1,1,1,4,2,2,1,1),
(1,1,1,5,1,1,2,0),
(1,1,1,5,2,1,2,1),
(1,1,1,5,1,2,1,0),
(1,1,1,5,2,2,1,1),
(1,1,2,1,1,1,1,3),
(1,1,2,1,2,1,1,3),
(1,1,2,2,1,1,1,1),
(1,1,2,2,2,1,1,1),
(1,1,2,3,1,1,1,1),
(1,1,2,3,2,1,1,1),
(1,1,2,4,1,1,1,1),
(1,1,2,4,2,1,1,1),
(1,1,2,5,1,1,1,1),
(1,1,2,5,2,1,1,1),
(1,1,2,1,1,1,2,1),
(1,1,2,1,2,1,2,3),
(1,1,2,1,1,2,1,3),
(1,1,2,1,2,2,1,3),
(1,1,2,2,1,1,2,1),
(1,1,2,2,2,1,2,1),
(1,1,2,2,1,2,1,1),
(1,1,2,2,2,2,1,1),
(1,1,2,3,1,1,2,1),
(1,1,2,3,2,1,2,1),
(1,1,2,3,1,2,1,1),
(1,1,2,3,2,2,1,1),
(1,1,2,4,1,1,2,1),
(1,1,2,4,2,1,2,1),
(1,1,2,4,1,2,1,1),
(1,1,2,4,2,2,1,1),
(1,1,2,5,1,1,2,1),
(1,1,2,5,2,1,2,1),
(1,1,2,5,1,2,1,1),
(1,1,2,5,2,2,1,1),
(1,1,3,1,1,1,1,3),
(1,1,3,1,2,1,1,3),
(1,1,3,2,1,1,1,3),
(1,1,3,2,2,1,1,3),
(1,1,3,3,1,1,1,0),
(1,1,3,3,2,1,1,1),
(1,1,3,4,1,1,1,1),
(1,1,3,4,2,1,1,0),
(1,1,3,5,1,1,1,1),
(1,1,3,5,2,1,1,0),
(1,1,3,1,1,1,2,2),
(1,1,3,1,2,1,2,2),
(1,1,3,1,1,2,1,1),
(1,1,3,1,2,2,1,1),
(1,1,3,2,1,1,2,0),
(1,1,3,2,2,1,2,1),
(1,1,3,2,1,2,1,3),
(1,1,3,2,2,2,1,3),
(1,1,3,3,1,1,2,0),
(1,1,3,3,2,1,2,1),
(1,1,3,3,1,2,1,0),
(1,1,3,3,2,2,1,1),
(1,1,3,4,1,1,2,1),
(1,1,3,4,2,1,2,1),
(1,1,3,4,1,2,1,3),
(1,1,3,4,2,2,1,3),
(1,1,3,5,1,1,2,1),
(1,1,3,5,2,1,2,0),
(1,1,3,5,1,2,1,3),
(1,1,3,5,2,2,1,3),
(1,1,4,1,1,1,1,3),
(1,1,4,1,2,1,1,3),
(1,1,4,2,1,1,1,3),
(1,1,4,2,2,1,1,3),
(1,1,4,3,1,1,1,3),
(1,1,4,3,2,1,1,3),
(1,1,4,4,1,1,1,0),
(1,1,4,4,2,1,1,1),
(1,1,4,5,1,1,1,3),
(1,1,4,5,2,1,1,3),
(1,1,4,1,1,1,2,2),
(1,1,4,1,2,1,2,2),
(1,1,4,1,1,2,1,3),
(1,1,4,1,2,2,1,3),
(1,1,4,2,1,1,2,1),
(1,1,4,2,2,1,2,1),
(1,1,4,2,1,2,1,2),
(1,1,4,2,2,2,1,2),
(1,1,4,3,1,1,2,0),
(1,1,4,3,2,1,2,1),
(1,1,4,3,1,2,1,3),
(1,1,4,3,2,2,1,3),
(1,1,4,4,1,1,2,0),
(1,1,4,4,2,1,2,1),
(1,1,4,4,1,2,1,0),
(1,1,4,4,2,2,1,1),
(1,1,4,5,1,1,2,0),
(1,1,4,5,2,1,2,1),
(1,1,4,5,1,2,1,1),
(1,1,4,5,2,2,1,1),
(1,1,5,1,1,1,1,3),
(1,1,5,1,2,1,1,3),
(1,1,5,2,1,1,1,3),
(1,1,5,2,2,1,1,3),
(1,1,5,3,1,1,1,3),
(1,1,5,3,2,1,1,3),
(1,1,5,4,1,1,1,1),
(1,1,5,4,2,1,1,2),
(1,1,5,5,1,1,1,0),
(1,1,5,5,2,1,1,1),
(1,1,5,1,1,1,2,2),
(1,1,5,1,2,1,2,2),
(1,1,5,1,1,2,1,3),
(1,1,5,1,2,2,1,3),
(1,1,5,2,1,1,2,1),
(1,1,5,2,2,1,2,0),
(1,1,5,2,1,2,1,3),
(1,1,5,2,2,2,1,3),
(1,1,5,3,1,1,2,1),
(1,1,5,3,2,1,2,3),
(1,1,5,3,1,2,1,3),
(1,1,5,3,2,2,1,3),
(1,1,5,4,1,1,2,1),
(1,1,5,4,2,1,2,2),
(1,1,5,4,1,2,1,3),
(1,1,5,4,2,2,1,3),
(1,1,5,5,1,1,2,0),
(1,1,5,5,2,1,2,1),
(1,1,5,5,1,2,1,3),
(1,1,5,5,2,2,1,3),
(2,2,1,1,1,1,1,0),
(2,2,1,1,2,1,1,1),
(2,2,1,2,1,1,1,0),
(2,2,1,2,2,1,1,1),
(2,2,1,3,1,1,1,0),
(2,2,1,3,2,1,1,1),
(2,2,1,4,1,1,1,0),
(2,2,1,4,2,1,1,1),
(2,2,1,5,1,1,1,0),
(2,2,1,5,2,1,1,1),
(2,2,1,1,1,1,2,1),
(2,2,1,1,2,1,2,2),
(2,2,1,1,1,2,1,1),
(2,2,1,1,2,2,1,2),
(2,2,1,2,1,1,2,1),
(2,2,1,2,2,1,2,2),
(2,2,1,2,1,2,1,1),
(2,2,1,2,2,2,1,2),
(2,2,1,3,1,1,2,1),
(2,2,1,3,2,1,2,2),
(2,2,1,3,1,2,1,1),
(2,2,1,3,2,2,1,2),
(2,2,1,4,1,1,2,1),
(2,2,1,4,2,1,2,2),
(2,2,1,4,1,2,1,1),
(2,2,1,4,2,2,1,2),
(2,2,1,5,1,1,2,1),
(2,2,1,5,2,1,2,2),
(2,2,1,5,1,2,1,1),
(2,2,1,5,2,2,1,2),
(2,2,2,1,1,1,1,0),
(2,2,2,1,2,1,1,1),
(2,2,2,2,1,1,1,0),
(2,2,2,2,2,1,1,1),
(2,2,2,3,1,1,1,0),
(2,2,2,3,2,1,1,1),
(2,2,2,4,1,1,1,0),
(2,2,2,4,2,1,1,1),
(2,2,2,5,1,1,1,0),
(2,2,2,5,2,1,1,1),
(2,2,2,1,1,1,2,1),
(2,2,2,1,2,1,2,2),
(2,2,2,1,1,2,1,1),
(2,2,2,1,2,2,1,2),
(2,2,2,2,1,1,2,1),
(2,2,2,2,2,1,2,2),
(2,2,2,2,1,2,1,1),
(2,2,2,2,2,2,1,2),
(2,2,2,3,1,1,2,1),
(2,2,2,3,2,1,2,2),
(2,2,2,3,1,2,1,1),
(2,2,2,3,2,2,1,2),
(2,2,2,4,1,1,2,1),
(2,2,2,4,2,1,2,2),
(2,2,2,4,1,2,1,1),
(2,2,2,4,2,2,1,2),
(2,2,2,5,1,1,2,1),
(2,2,2,5,2,1,2,2),
(2,2,2,5,1,2,1,1),
(2,2,2,5,2,2,1,2),
(2,2,3,1,1,1,1,0),
(2,2,3,1,2,1,1,1),
(2,2,3,2,1,1,1,0),
(2,2,3,2,2,1,1,1),
(2,2,3,3,1,1,1,0),
(2,2,3,3,2,1,1,1),
(2,2,3,4,1,1,1,0),
(2,2,3,4,2,1,1,1),
(2,2,3,5,1,1,1,0),
(2,2,3,5,2,1,1,1),
(2,2,3,1,1,1,2,1),
(2,2,3,1,2,1,2,2),
(2,2,3,1,1,2,1,1),
(2,2,3,1,2,2,1,2),
(2,2,3,2,1,1,2,1),
(2,2,3,2,2,1,2,2),
(2,2,3,2,1,2,1,1),
(2,2,3,2,2,2,1,2),
(2,2,3,3,1,1,2,1),
(2,2,3,3,2,1,2,2),
(2,2,3,3,1,2,1,1),
(2,2,3,3,2,2,1,2),
(2,2,3,4,1,1,2,1),
(2,2,3,4,2,1,2,2),
(2,2,3,4,1,2,1,1),
(2,2,3,4,2,2,1,2),
(2,2,3,5,1,1,2,1),
(2,2,3,5,2,1,2,2),
(2,2,3,5,1,2,1,1),
(2,2,3,5,2,2,1,2),
(2,2,4,1,1,1,1,0),
(2,2,4,1,2,1,1,1),
(2,2,4,2,1,1,1,0),
(2,2,4,2,2,1,1,1),
(2,2,4,3,1,1,1,0),
(2,2,4,3,2,1,1,1),
(2,2,4,4,1,1,1,0),
(2,2,4,4,2,1,1,1),
(2,2,4,5,1,1,1,0),
(2,2,4,5,2,1,1,1),
(2,2,4,1,1,1,2,1),
(2,2,4,1,2,1,2,2),
(2,2,4,1,1,2,1,1),
(2,2,4,1,2,2,1,2),
(2,2,4,2,1,1,2,1),
(2,2,4,2,2,1,2,2),
(2,2,4,2,1,2,1,1),
(2,2,4,2,2,2,1,2),
(2,2,4,3,1,1,2,1),
(2,2,4,3,2,1,2,2),
(2,2,4,3,1,2,1,1),
(2,2,4,3,2,2,1,2),
(2,2,4,4,1,1,2,1),
(2,2,4,4,2,1,2,2),
(2,2,4,4,1,2,1,1),
(2,2,4,4,2,2,1,2),
(2,2,4,5,1,1,2,1),
(2,2,4,5,2,1,2,2),
(2,2,4,5,1,2,1,1),
(2,2,4,5,2,2,1,2),
(2,2,5,1,1,1,1,0),
(2,2,5,1,2,1,1,1),
(2,2,5,2,1,1,1,0),
(2,2,5,2,2,1,1,1),
(2,2,5,3,1,1,1,0),
(2,2,5,3,2,1,1,1),
(2,2,5,4,1,1,1,0),
(2,2,5,4,2,1,1,1),
(2,2,5,5,1,1,1,0),
(2,2,5,5,2,1,1,1),
(2,2,5,1,1,1,2,1),
(2,2,5,1,2,1,2,2),
(2,2,5,1,1,2,1,1),
(2,2,5,1,2,2,1,2),
(2,2,5,2,1,1,2,1),
(2,2,5,2,2,1,2,2),
(2,2,5,2,1,2,1,1),
(2,2,5,2,2,2,1,2),
(2,2,5,3,1,1,2,1),
(2,2,5,3,2,1,2,2),
(2,2,5,3,1,2,1,1),
(2,2,5,3,2,2,1,2),
(2,2,5,4,1,1,2,1),
(2,2,5,4,2,1,2,2),
(2,2,5,4,1,2,1,1),
(2,2,5,4,2,2,1,2),
(2,2,5,5,1,1,2,1),
(2,2,5,5,2,1,2,2),
(2,2,5,5,1,2,1,1),
(2,2,5,5,2,2,1,2);

/*Table structure for table `sincronizacion` */

DROP TABLE IF EXISTS `sincronizacion`;

CREATE TABLE `sincronizacion` (
  `id_usuario` varchar(11) NOT NULL,
  `fecha` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sincronizacion` */

insert  into `sincronizacion`(`id_usuario`,`fecha`) values 
('1','2019-08-28 18:00:00'),
('2','2019-08-28 18:00:00');

/*Table structure for table `tipo_usuario` */

DROP TABLE IF EXISTS `tipo_usuario`;

CREATE TABLE `tipo_usuario` (
  `id_tipousuario` int(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tipo_usuario` */

insert  into `tipo_usuario`(`id_tipousuario`,`descripcion`,`id_rol`) values 
(1,'Administrador',3),
(2,'Producción animal',1),
(3,'Agrosuper otras Ã¡reas',1),
(4,'Contratistas',2);

/*Table structure for table `trazabilidad` */

DROP TABLE IF EXISTS `trazabilidad`;

CREATE TABLE `trazabilidad` (
  `id_usuario` int(10) NOT NULL,
  `id_especie_or` int(10) NOT NULL,
  `id_zona_or` int(10) NOT NULL,
  `id_nivel_or` int(10) NOT NULL,
  `id_subnivel_or` int(10) NOT NULL,
  `id_especie_des` int(10) NOT NULL,
  `id_zona_des` int(10) NOT NULL,
  `id_nivel_des` int(10) NOT NULL,
  `id_subnivel_des` int(10) NOT NULL,
  `id_tipo_usuario` int(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `trazabilidad` */

insert  into `trazabilidad`(`id_usuario`,`id_especie_or`,`id_zona_or`,`id_nivel_or`,`id_subnivel_or`,`id_especie_des`,`id_zona_des`,`id_nivel_des`,`id_subnivel_des`,`id_tipo_usuario`,`fecha`) values 
(1,1,1,1,1,1,1,1,1,1,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'0000-00-00'),
(3,1,1,1,1,1,1,1,1,3,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'0000-00-00'),
(1,1,1,1,1,1,1,1,1,2,'2019-08-24'),
(1,1,1,1,1,1,1,1,1,2,'2019-08-24'),
(3,1,1,1,1,1,1,1,1,3,'2019-08-24'),
(2,1,1,1,1,1,1,1,1,4,'2019-08-24'),
(1,1,1,2,10,1,1,1,1,2,'2019-08-24'),
(3,1,1,2,10,1,1,2,10,3,'2019-08-24'),
(2,2,2,5,140,2,2,8,204,4,'2019-08-24'),
(3,2,2,2,101,2,2,7,181,3,'2019-08-24'),
(3,2,2,5,140,2,2,8,204,3,'2019-08-24'),
(2,2,2,2,101,2,2,8,204,4,'2019-08-24'),
(1,2,2,3,117,2,2,9,209,2,'2019-08-24'),
(3,2,2,3,117,2,2,10,261,3,'2019-08-24'),
(2,2,2,3,117,2,2,10,261,4,'2019-08-24'),
(1,2,2,4,138,2,2,9,209,2,'2019-08-24'),
(3,2,2,4,138,2,2,10,261,3,'2019-08-24'),
(2,2,2,4,138,2,2,8,204,4,'2019-08-24'),
(1,2,2,5,140,2,2,10,261,2,'2019-08-24'),
(2,2,1,4,64,2,1,5,140,4,'2019-08-24'),
(1,2,1,5,66,2,1,2,101,2,'2019-08-24'),
(3,2,1,5,66,2,1,2,101,3,'2019-08-24'),
(2,2,1,5,66,2,1,3,117,4,'2019-08-24'),
(1,2,2,2,101,2,2,7,181,2,'2019-08-24'),
(2,1,1,2,10,1,1,2,10,4,'2019-08-24'),
(1,1,1,3,24,1,1,3,24,2,'2019-08-24'),
(3,1,1,3,24,1,1,4,64,3,'2019-08-24'),
(2,1,1,3,24,1,1,4,64,4,'2019-08-24'),
(1,1,1,4,64,1,1,5,66,2,'2019-08-24'),
(3,1,1,4,64,1,1,5,66,3,'2019-08-24'),
(1,2,1,3,24,2,1,4,64,2,'2019-08-24'),
(3,2,1,3,24,2,1,4,138,3,'2019-08-24'),
(2,2,1,3,24,2,1,4,138,4,'2019-08-24'),
(1,2,1,4,64,2,1,5,140,2,'2019-08-24'),
(3,2,1,4,64,2,1,5,140,3,'2019-08-24'),
(2,1,1,4,64,1,1,5,66,4,'2019-08-24'),
(1,1,1,5,66,1,1,2,101,2,'2019-08-24'),
(3,1,1,5,66,1,1,2,101,3,'2019-08-24'),
(2,1,1,5,66,1,1,2,101,4,'2019-08-24'),
(1,1,2,2,101,1,2,3,117,2,'2019-08-24'),
(3,1,2,2,101,1,2,4,138,3,'2019-08-24'),
(2,1,2,2,101,1,2,5,140,4,'2019-08-24'),
(1,1,2,3,117,1,2,5,140,2,'2019-08-24'),
(3,2,1,1,1,2,1,2,10,3,'2019-08-24'),
(2,2,1,1,1,2,1,2,10,4,'2019-08-24'),
(1,2,1,2,10,2,1,3,24,2,'2019-08-24'),
(3,2,1,2,10,2,1,3,24,3,'2019-08-24'),
(2,2,1,2,10,2,1,3,24,4,'2019-08-24'),
(3,1,2,3,117,1,2,5,140,3,'2019-08-24'),
(2,1,2,3,117,1,2,1,1,4,'2019-08-24'),
(1,1,2,4,138,1,2,1,1,2,'2019-08-24'),
(3,1,2,4,138,1,2,1,1,3,'2019-08-24'),
(2,1,2,4,138,1,2,2,10,4,'2019-08-24'),
(1,1,2,5,140,1,2,2,10,2,'2019-08-24'),
(3,1,2,5,140,1,2,2,10,3,'2019-08-24'),
(2,1,2,5,140,1,2,3,24,4,'2019-08-24'),
(2,1,2,4,138,2,2,5,140,4,'2019-08-24'),
(1,1,2,5,140,2,2,1,1,2,'2019-08-24'),
(3,1,2,5,140,2,2,1,1,3,'2019-08-24'),
(2,1,2,5,140,2,2,1,1,4,'2019-08-24'),
(1,2,1,1,1,2,1,2,10,2,'2019-08-24'),
(1,2,1,1,1,1,1,3,24,2,'2019-08-24'),
(3,2,1,1,1,1,1,3,24,3,'2019-08-24'),
(2,2,1,1,1,1,1,4,64,4,'2019-08-24'),
(1,2,1,2,10,1,1,4,138,2,'2019-08-24'),
(3,2,1,2,10,1,1,4,138,3,'2019-08-24'),
(1,1,2,3,117,2,2,7,186,2,'2019-08-24'),
(3,1,2,3,117,2,2,8,204,3,'2019-08-24'),
(2,1,2,3,117,2,2,4,138,4,'2019-08-24'),
(1,1,2,4,138,2,2,5,140,2,'2019-08-24'),
(3,1,2,4,138,2,2,5,140,3,'2019-08-24'),
(2,2,1,2,10,1,1,5,140,4,'2019-08-24'),
(1,2,1,3,24,1,1,5,140,2,'2019-08-24'),
(3,2,1,3,24,1,1,5,140,3,'2019-08-24'),
(2,2,1,3,24,1,1,2,101,4,'2019-08-24'),
(2,1,1,3,24,2,1,9,247,4,'2019-08-24'),
(1,1,1,4,64,2,1,10,259,2,'2019-08-24'),
(3,1,1,4,64,2,1,7,181,3,'2019-08-24'),
(2,1,1,4,64,2,1,8,199,4,'2019-08-24'),
(1,1,1,5,66,2,1,9,209,2,'2019-08-24'),
(3,1,1,5,66,2,1,10,261,3,'2019-08-24'),
(2,1,1,5,66,2,1,7,186,4,'2019-08-24'),
(1,1,2,2,101,2,2,8,204,2,'2019-08-24'),
(3,1,2,2,101,2,2,9,209,3,'2019-08-24'),
(2,1,2,2,101,2,2,10,261,4,'2019-08-24'),
(1,2,1,4,64,1,1,2,101,2,'2019-08-24'),
(3,2,1,4,64,1,1,3,117,3,'2019-08-24'),
(2,2,1,4,64,1,1,7,181,4,'2019-08-24'),
(1,2,1,5,66,1,1,7,181,2,'2019-08-24'),
(3,2,1,5,66,1,1,8,204,3,'2019-08-24'),
(2,2,1,5,66,1,1,9,209,4,'2019-08-24'),
(1,2,2,2,101,1,2,10,261,2,'2019-08-24'),
(3,2,2,2,101,1,2,10,261,3,'2019-08-24'),
(2,2,2,2,101,1,2,8,204,4,'2019-08-24'),
(1,2,2,3,117,1,2,9,209,2,'2019-08-24'),
(3,2,2,3,117,1,2,8,204,3,'2019-08-24'),
(3,2,2,5,140,1,2,9,209,3,'2019-08-24'),
(2,2,2,5,140,1,2,9,209,4,'2019-08-24'),
(1,1,1,1,1,2,1,10,261,2,'2019-08-24'),
(3,1,1,1,1,2,1,10,261,3,'2019-08-24'),
(2,1,1,1,1,2,1,2,10,4,'2019-08-24'),
(1,1,1,2,10,2,1,3,24,2,'2019-08-24'),
(3,1,1,2,10,2,1,4,64,3,'2019-08-24'),
(2,1,1,2,10,2,1,5,66,4,'2019-08-24'),
(1,1,1,3,24,2,1,7,181,2,'2019-08-24'),
(3,1,1,3,24,2,1,8,199,3,'2019-08-24'),
(2,2,2,3,117,1,2,9,209,4,'2019-08-24'),
(1,2,2,4,138,1,2,7,181,2,'2019-08-24'),
(3,2,2,4,138,1,2,7,181,3,'2019-08-24'),
(2,2,2,4,138,1,2,8,204,4,'2019-08-24'),
(1,2,2,5,140,1,2,8,204,2,'2019-08-24'),
(1,2,1,1,1,1,1,3,24,2,'2019-08-24'),
(1,2,1,1,1,1,1,3,24,2,'2019-08-24'),
(1,2,1,6,1,1,1,3,24,2,'2019-08-25'),
(1,2,1,6,274,1,1,3,24,2,'2019-08-25'),
(1,2,1,6,274,1,1,3,24,2,'2019-08-25'),
(1,1,1,1,1,1,1,1,1,1,'2019-08-29'),
(1,1,1,1,3,1,1,1,1,1,'2019-08-29'),
(1,1,1,1,3,1,1,1,1,2,'2019-08-29'),
(1,1,1,1,1,1,1,1,1,1,'2019-08-29'),
(1,1,1,1,1,1,1,1,122,1,'2019-08-29'),
(1,1,1,1,1,1,1,1,1000,1,'2019-08-29'),
(1,1,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,3,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,3,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29'),
(1,2,1,1,1,1,1,1,1,2,'2019-08-29');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `rut` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ap_pat` varchar(30) NOT NULL,
  `ap_mat` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `fono` int(10) NOT NULL,
  `id_tipousuario` int(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`rut`,`nombre`,`ap_pat`,`ap_mat`,`user`,`pass`,`fono`,`id_tipousuario`) values 
(1,'111-2','Rocio','Contreras','Aguila','rcontreras','1234',11223344,2),
(2,'1-9','Andrea','Silva','Loncon','asilva','1234',11223334,4),
(3,'0','Otras ','Ã¡reas','agrosuper','Otras','123456',666666666,3);

/* Function  structure for function  `FU_Login` */

/*!50003 DROP FUNCTION IF EXISTS `FU_Login` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`bitbiosis`@`localhost` FUNCTION `FU_Login`(user VARCHAR(15), pwd VARCHAR(100)) RETURNS int(11)
BEGIN

	DECLARE salida INT(1);

	IF EXISTS (SELECT usuario.id_usuario FROM usuario WHERE usuario.rut = user AND usuario.pass = pwd) THEN
		BEGIN
		    SELECT usuario.id_usuario INTO salida FROM usuario WHERE usuario.rut = user AND usuario.pass = pwd;
		END;	
	ELSE
			SET salida = 0; 
	END IF;

	RETURN salida;	

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_Calculo_NocheVacio` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_Calculo_NocheVacio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`bitbiosis`@`localhost` PROCEDURE `SP_Calculo_NocheVacio`(IN `id_tipo_usuario` INT, IN `id_usuario` INT, IN `id_rol` INT, IN `id_especie_or` INT, IN `id_zona_or` INT, IN `id_nivel_or` INT, IN `id_subnivel_or` INT, IN `id_especie_des` INT, IN `id_zona_des` INT, IN `id_nivel_des` INT, IN `id_subnivel_des` INT, OUT `result` INT)
BEGIN 

	DECLARE nivel_or INT;

    DECLARE nivel_des INT;

    set result = 10;

    

    -- Rescato el numero del nivel de origen

    select cod_nivel into nivel_or from nivel where id_especie=id_especie_or and id_nivel=id_nivel_or;

    

    -- Rescato el numero del nivel destino

    select cod_nivel into nivel_des from nivel where id_especie=id_especie_des and id_nivel=id_nivel_des;

  	

    -- Busca el valor si es la misma pirÃ¡mide

	IF id_especie_or = id_especie_des THEN

    	SELECT valor INTO result FROM piramide WHERE tipo_rol=id_rol and id_especie = id_especie_des;

        

        -- este seria para nivel de origen mayor al destino

        IF nivel_or > nivel_des THEN

        	select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

        

        -- este seria para nivel origen menor al destino

        IF nivel_or < nivel_des THEN

            select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

        

        -- este para ver si el nivel es igual

        IF nivel_or = nivel_des THEN

            select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

	END IF;



	-- Busca el valor si es piramide diferente

	IF id_especie_or <> id_especie_des THEN

    	SELECT valor INTO result FROM piramide WHERE tipo_rol=id_rol and id_especie = id_especie_des;

         

         -- este seria para nivel de origen mayor al destino

    	IF nivel_or > nivel_des THEN

        	 select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

        

        -- este seria para nivel origen menor al destino

        IF nivel_or < nivel_des THEN

        	 select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

        

        -- este para ver si el nivel es igual

        IF nivel_or = nivel_des THEN

        	select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;

        END IF;

	END IF;

	

	-- Inserción de datos en trazabilidad

	INSERT INTO trazabilidad (id_usuario, id_especie_or, id_zona_or, id_nivel_or, id_subnivel_or, id_especie_des, id_zona_des, id_nivel_des, id_subnivel_des, id_tipo_usuario, fecha) VALUES (id_usuario, id_especie_or, id_zona_or, id_nivel_or, id_subnivel_or, id_especie_des, id_zona_des, id_nivel_des, id_subnivel_des, id_tipo_usuario, now());



SELECT result;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_Cal_NocheVacio` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_Cal_NocheVacio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`bitbiosis`@`localhost` PROCEDURE `SP_Cal_NocheVacio`(IN `id_tipo_usuario` INT, IN `id_usuario` INT, IN `id_rol` INT, IN `id_especie_or` INT, IN `id_zona_or` INT, IN `id_nivel_or` INT, IN `id_subnivel_or` INT, IN `id_especie_des` INT, IN `id_zona_des` INT, IN `id_nivel_des` INT, IN `id_subnivel_des` INT, OUT `result` INT)
    SQL SECURITY INVOKER
BEGIN 

	DECLARE nivel_or INT;

    DECLARE nivel_des INT;

    set result = 10;

    

    -- Rescato el numero del nivel de origen

    select cod_nivel into nivel_or from nivel where id_especie=id_especie_or and id_nivel=id_nivel_or;

    

    -- Rescato el numero del nivel destino

    select cod_nivel into nivel_des from nivel where id_especie=id_especie_des and id_nivel=id_nivel_des;

  	

    -- Busca el valor segÃºn filtros

    select valor INTO result from piramide_especies where especie_origen= id_especie_or and especie_destino= id_especie_des and nivel_origen= nivel_or and nivel_destino= nivel_des and tipo_rol=id_rol and id_zona_origen=id_zona_or and id_zona_destino = id_zona_des;



	-- Inserción de datos en trazabilidad

	INSERT INTO trazabilidad (id_usuario, id_especie_or, id_zona_or, id_nivel_or, id_subnivel_or, id_especie_des, id_zona_des, id_nivel_des, id_subnivel_des, id_tipo_usuario, fecha) VALUES (id_usuario, id_especie_or, id_zona_or, id_nivel_or, id_subnivel_or, id_especie_des, id_zona_des, id_nivel_des, id_subnivel_des, id_tipo_usuario, now());



SELECT result;

END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_Grilla_NocheVacio` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_Grilla_NocheVacio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`bitbiosis`@`localhost` PROCEDURE `SP_Grilla_NocheVacio`(
		IN id_tipo_usuario INT,
		IN id_usuario INT,
		IN id_rol INT,
		IN id_especie_or INT,
		IN id_zona_or INT,
		IN id_nivel_or INT,
		IN id_subnivel_or INT,
		IN id_especie_des INT,
		IN id_zona_des INT,
		IN id_nivel_des INT,
		IN id_subnivel_des INT
	)
BEGIN
 select
		b.nombre,
		c.nombre_nivel,
		a.valor
	from
		piramide_especies a join especie b on
		(
			a.especie_destino = b.id_especie
		) join nivel c on
		(
			a.nivel_destino = c.id_nivel
		)
	where
		a.especie_origen = id_especie_or
		and a.especie_destino = id_especie_des
		and a.nivel_origen = id_nivel_or
		and a.nivel_destino = id_nivel_des
		and a.tipo_rol = id_rol
		and a.id_zona_origen = id_zona_or
		and a.id_zona_destino = id_zona_des; -- Inserción de datos en trazabilidad
 INSERT
			INTO
				trazabilidad(
					id_usuario,
					id_especie_or,
					id_zona_or,
					id_nivel_or,
					id_subnivel_or,
					id_especie_des,
					id_zona_des,
					id_nivel_des,
					id_subnivel_des,
					id_tipo_usuario,
					fecha
				)
			VALUES(
				id_usuario,
				id_especie_or,
				id_zona_or,
				id_nivel_or,
				id_subnivel_or,
				id_especie_des,
				id_zona_des,
				id_nivel_des,
				id_subnivel_des,
				id_tipo_usuario,
				now()
			);
		END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
