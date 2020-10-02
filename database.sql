CREATE DATABASE  IF NOT EXISTS `horario` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `horario`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: horario
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actiproy`
--

DROP TABLE IF EXISTS `actiproy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actiproy` (
  `idActiProy` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla actiproy',
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'el nombre del actividad  y el proyecto',
  PRIMARY KEY (`idActiProy`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actiproy`
--

LOCK TABLES `actiproy` WRITE;
/*!40000 ALTER TABLE `actiproy` DISABLE KEYS */;
INSERT INTO `actiproy` VALUES (1,'java'),(2,'app android'),(3,'wed zase'),(4,'modelo relacional'),(5,'Python'),(6,'Emprendimiento');
/*!40000 ALTER TABLE `actiproy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambiente` (
  `idAmbiente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla ambiente',
  `idTipoAmbien` int(11) NOT NULL COMMENT 'id de la tabla tipo de  ambiente',
  `nombre` varchar(40) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del ambiente',
  `capacidad` int(11) NOT NULL COMMENT 'la capacidad de personas que pueden haber en el ambiente\\n',
  PRIMARY KEY (`idAmbiente`),
  KEY `idTipoAmbien` (`idTipoAmbien`),
  CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`idTipoAmbien`) REFERENCES `tipoambiente` (`idTipoAmbien`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
INSERT INTO `ambiente` VALUES (1,1,'Software 1',40),(2,1,'Software 2',35),(3,1,'Software 3',30),(4,2,'Multimedia 1',35);
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro`
--

DROP TABLE IF EXISTS `centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro` (
  `idCentro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del centro ',
  `idSede` int(11) NOT NULL COMMENT 'id de la tabla sede',
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del centro',
  `direccion` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'donde esta ubicado el el centro',
  `telefono` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'telefono del centro al cual se pueda comunicar',
  `correo` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'correo  del centro al cual se pueda comunicar',
  `director` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del director del centro',
  `estado` int(11) NOT NULL COMMENT 'estado en que se  encuentra el centro',
  PRIMARY KEY (`idCentro`),
  KEY `idSede` (`idSede`),
  CONSTRAINT `centro_ibfk_1` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro`
--

LOCK TABLES `centro` WRITE;
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` VALUES (1,1,'Centro de Tecnología de la Manufactura Avanzada','Carrera 68 #104, Complejo Norte,','(4) 4442800','******','******',1);
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia`
--

DROP TABLE IF EXISTS `competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competencia` (
  `idCompetencia` int(11) NOT NULL AUTO_INCREMENT,
  `idPrograma` int(11) NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `codigo` varchar(25) CHARACTER SET latin1 NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idCompetencia`),
  KEY `idPrograma` (`idPrograma`),
  CONSTRAINT `competencia_ibfk_1` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`idPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia`
--

LOCK TABLES `competencia` WRITE;
/*!40000 ALTER TABLE `competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleasignacion`
--

DROP TABLE IF EXISTS `detalleasignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleasignacion` (
  `idDetalleA` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identicador de la tabla',
  `idFicha` int(11) NOT NULL COMMENT 'id de la tabla ficha',
  `idAmbiente` int(11) NOT NULL COMMENT 'id de latabla ambiente ',
  `idDia` int(11) NOT NULL COMMENT 'id de la tabla dia',
  `idUsuario` int(11) NOT NULL COMMENT 'id de la tabla usuario',
  `idActiProy` int(11) NOT NULL,
  `Periodo` year(4) NOT NULL COMMENT 'Año lectivo (2020)',
  `TrimPeriodo` int(11) NOT NULL COMMENT 'Trimestre del periodo.\nSolo son 4 porque el año tiene 4 trimestres',
  `horaInicio` time NOT NULL COMMENT 'es la hora de de inicio de cada clase',
  `horaFin` time NOT NULL COMMENT 'marca el fin  de las clases ',
  PRIMARY KEY (`idDetalleA`),
  KEY `idFicha` (`idFicha`),
  KEY `idAmbiente` (`idAmbiente`),
  KEY `idDia` (`idDia`),
  KEY `idUsuario` (`idUsuario`),
  KEY `fk_detalleasignacion_actiproy1_idx` (`idActiProy`),
  CONSTRAINT `detalleasignacion_ibfk_3` FOREIGN KEY (`idAmbiente`) REFERENCES `ambiente` (`idAmbiente`),
  CONSTRAINT `detalleasignacion_ibfk_4` FOREIGN KEY (`idDia`) REFERENCES `dia` (`idDia`),
  CONSTRAINT `detalleasignacion_ibfk_5` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fk_detalleasignacion_actiproy1` FOREIGN KEY (`idActiProy`) REFERENCES `actiproy` (`idActiProy`),
  CONSTRAINT `idFicha1` FOREIGN KEY (`idFicha`) REFERENCES `ficha` (`idFicha`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleasignacion`
--

LOCK TABLES `detalleasignacion` WRITE;
/*!40000 ALTER TABLE `detalleasignacion` DISABLE KEYS */;
INSERT INTO `detalleasignacion` VALUES (1,1,2,1,36,2,2020,3,'06:00:00','12:00:00'),(2,1,1,2,36,5,2020,3,'06:00:00','12:00:00'),(3,1,3,3,36,5,2020,3,'06:00:00','12:00:00'),(4,1,3,3,36,5,2020,3,'12:00:00','18:00:00'),(5,1,3,3,36,5,2020,3,'12:00:00','06:00:00'),(6,1,3,3,36,5,2020,3,'12:00:00','06:00:00'),(7,1,2,1,36,3,2020,3,'06:00:00','00:00:00'),(8,1,1,1,36,3,2020,3,'18:00:00','21:00:00'),(9,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(10,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(11,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(12,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(13,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(14,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(15,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(16,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(17,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(18,1,1,1,36,5,2020,3,'06:00:00','12:00:00'),(19,1,1,1,36,5,2020,3,'06:00:00','12:00:00');
/*!40000 ALTER TABLE `detalleasignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleusu`
--

DROP TABLE IF EXISTS `detalleusu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleusu` (
  `idDetalleF` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `idFicha` int(11) NOT NULL COMMENT 'id de la tabla detalle de la ficha',
  `idUsuario` int(11) NOT NULL COMMENT 'id de la tabla usuario',
  `jornada` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT 'las jornadas determinadas M.T.N',
  `estado` int(11) NOT NULL COMMENT 'El estado de la jornada activa o no activa',
  PRIMARY KEY (`idDetalleF`),
  KEY `idFicha` (`idFicha`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `detalleficha_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `idFicha` FOREIGN KEY (`idFicha`) REFERENCES `ficha` (`idFicha`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='detalle de aprendiz';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleusu`
--

LOCK TABLES `detalleusu` WRITE;
/*!40000 ALTER TABLE `detalleusu` DISABLE KEYS */;
INSERT INTO `detalleusu` VALUES (1,1,1,'Mañana',0),(2,1,2,'Mañana',0),(3,1,3,'Mañana',0),(4,1,4,'Mañana',0),(5,1,5,'Mañana',0),(6,1,6,'Mañana',0),(7,1,7,'Mañana',0),(8,1,8,'Mañana',0),(9,1,9,'Mañana',0),(10,1,10,'Mañana',0),(11,1,11,'Mañana',0),(12,1,12,'Mañana',0),(13,1,13,'Mañana',0),(14,1,14,'Mañana',0),(15,1,15,'Mañana',0),(16,1,16,'Mañana',0),(17,1,17,'Mañana',0),(18,1,18,'Mañana',0),(19,1,19,'Mañana',0),(20,1,20,'Mañana',0),(21,1,21,'Mañana',0),(22,1,22,'Mañana',0),(23,1,23,'Mañana',0),(24,1,24,'Mañana',0),(25,1,25,'Mañana',0),(26,1,26,'Mañana',0),(27,1,27,'Mañana',0),(28,1,28,'Mañana',0),(29,1,29,'Mañana',0),(30,1,30,'Mañana',0),(31,1,31,'Mañana',0),(32,1,32,'Mañana',0),(33,1,33,'Mañana',0),(34,1,34,'Mañana',0);
/*!40000 ALTER TABLE `detalleusu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleusuario`
--

DROP TABLE IF EXISTS `detalleusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleusuario` (
  `idDetalleUsu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'EL identificador de la tabla',
  `idUsuario` int(11) NOT NULL COMMENT 'El id de la tabla  usuario',
  `idTipoDoc` int(11) NOT NULL COMMENT 'el id de la tabla tipo  documento',
  `documento` int(11) NOT NULL COMMENT 'numero de identificacion del usuario',
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Nombre propio del usuario',
  `apellido` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'apellido propio de un usuario',
  `telefono` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'numero a cual se le puede contatar',
  `genero` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'que al que pertece la pertenece la persona',
  PRIMARY KEY (`idDetalleUsu`),
  KEY `fk_detalleusuario_usuario1_idx` (`idUsuario`),
  KEY `fk_detalleusuario_tipodoc1_idx` (`idTipoDoc`),
  CONSTRAINT `fk_detalleusuario_tipodoc1` FOREIGN KEY (`idTipoDoc`) REFERENCES `tipodoc` (`idTipoDoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleusuario_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleusuario`
--

LOCK TABLES `detalleusuario` WRITE;
/*!40000 ALTER TABLE `detalleusuario` DISABLE KEYS */;
INSERT INTO `detalleusuario` VALUES (1,1,1,1000084228,'YENNIFER','GOMEZ GIL','1234','F'),(2,2,1,1000304810,'KEVIN ANDRES','ORREGO GOMEZ','1234','M'),(3,3,1,1000565214,'DAWINZON ARLEY','POLO CIRO','1234','M'),(4,4,1,1000748038,'JUAN SEBASTIAN','	VAHOS RODAS','1234','M'),(5,5,1,1000883553,'DIEGO ALEJANDRO','ROMERO MOSQUERA','1234','M'),(6,6,1,1000922106,'CAROLINA','CALLE VELEZ','1234','F'),(7,7,1,1000922445,'MANUELA','REYES PEÑARANDA','1234','F'),(8,8,1,1001362780,'JOSE DAVID','RAMIREZ GOMEZ','1234','M'),(9,9,1,1001463874,'ANDRES MARIANO','BUSTAMANTE CASTRO','1234','M'),(10,10,1,1003290312,'JHON HADER','ROJAS CABRERA','1234','M'),(11,11,1,1007239563,'VERONICA','PEREZ ZEA','1234','F'),(12,12,1,1007240178,'SANTIAGO','HERNANDEZ CHAVARRIAGA','1234','M'),(13,13,1,1007304708,'FELIPE','RESTREPO CARDONA','1234','M'),(14,14,1,1007704966,'SEBASTIAN','ORTIZ MUÑOZ','1234','M'),(15,15,1,1017262417,'ESTEFANIA','GONZALEZ LOAIZA','1234','F'),(16,16,1,1020453300,'MARIA VIRGINIA','CADAVID ROJAS','1234','F'),(17,17,1,1020463781,'LUIS FELIPE','LONDOÑO GUTIERREZ','1234','M'),(18,18,1,1035875909,'MANUEL ALEJANDRO','SILVA SALDARRIAGA','1234','M'),(19,19,1,1036631006,'YENNYFER ALEXANDRA','GONZALEZ PULGARIN','1234','F'),(20,20,1,1036672733,'KEVIN','ARDILA LOPERA','1234','M'),(21,21,1,1036682388,'KEVIN ANDRES','GUTIERREZ VERGARA','1234','M'),(22,22,1,1054993942,'IRMA LORENA','VELEZ PEREZ','1234','F'),(23,23,1,1060596704,'KELLY DANIELA','VELEZ ECHEVERRIA','1234','F'),(24,24,1,1117553876,'JUAN DAVID','VARGAS MAHECHA','1234','M'),(25,25,1,1128427257,'JHOAN CAMILO','MURILLO CASTAÑEDA','1234','M'),(26,26,1,1128459336,'JHON EVER','VELASQUEZ ROLDAN','1234','M'),(27,27,1,1152460225,'SARA LIZETH','URREA QUINTERO','1234','F'),(28,28,1,1152714062,'MIGUEL ANGEL','RUIZ AVENDAÑO','1234','M'),(29,29,1,1152714894,'YESID DE JESUS','RODELO SAENZ','1234','M'),(30,30,1,1152715837,'BRAINER ESTEBAN','BETANCUR GONZALEZ','1234','M'),(31,31,1,1192895823,'JUAN JOSE','VILLA ALZATE','1234','M'),(32,32,1,1234990789,'JHON DAVINSON','HIGUITA OSORIO','1234','M'),(33,33,1,98699456,'JOSE ANDERSON','CARMONA RIVERA','1234','M'),(34,34,1,1007836261,'JAIBER ALESSIS','RUA VILLA','1234','M'),(35,35,1,1001619330,'SERGIO DAVID','SEPULVEDA MONTOYA','3136201431','M'),(36,36,1,14399999,'Eder','Lara Trujillo','3115780589','Masculino'),(37,37,1,121212,'Camila','Zuluaga','32143215','Femenino');
/*!40000 ALTER TABLE `detalleusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detaproject`
--

DROP TABLE IF EXISTS `detaproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detaproject` (
  `iddetaProject` int(11) NOT NULL AUTO_INCREMENT,
  `idActiProy` int(11) NOT NULL,
  `idResultA` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`iddetaProject`),
  KEY `fk_detaProject_actiproy1_idx` (`idActiProy`),
  KEY `fk_detaProject_resulta1_idx` (`idResultA`),
  CONSTRAINT `fidresulta` FOREIGN KEY (`idResultA`) REFERENCES `resulta` (`idResultA`),
  CONSTRAINT `idAtivi` FOREIGN KEY (`idActiProy`) REFERENCES `actiproy` (`idActiProy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detaproject`
--

LOCK TABLES `detaproject` WRITE;
/*!40000 ALTER TABLE `detaproject` DISABLE KEYS */;
/*!40000 ALTER TABLE `detaproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dia` (
  `idDia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla dia',
  `nombre` varchar(30) CHARACTER SET latin1 NOT NULL COMMENT 'se nombra el dia en que la clase sera presentada',
  `estado` int(11) NOT NULL COMMENT 'es el estado de la clase ',
  PRIMARY KEY (`idDia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia`
--

LOCK TABLES `dia` WRITE;
/*!40000 ALTER TABLE `dia` DISABLE KEYS */;
INSERT INTO `dia` VALUES (1,'Lunes',1),(2,'Martes',1),(3,'Miércoles',1),(4,'Jueves',1),(5,'Viernes',1),(6,'Sábado',1),(7,'Domingo',1);
/*!40000 ALTER TABLE `dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha`
--

DROP TABLE IF EXISTS `ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha` (
  `idFicha` int(11) NOT NULL COMMENT 'identificador de la tabla ficha',
  `idPrograma` int(11) NOT NULL COMMENT 'indentificador de la tabla programa',
  `fechaInicio` date NOT NULL COMMENT 'es al fecha donde se empiza el cuso y trimestre',
  `fechaFin` date NOT NULL COMMENT 'marca el fin del trimestre y el cuso\n',
  `cantidadAprendiz` int(11) NOT NULL COMMENT 'muestra el numero total de todos los aprendices que hay ',
  `numeroFicha` int(11) NOT NULL COMMENT 'es el numero de tiene cada grupo para identificarlo',
  PRIMARY KEY (`idFicha`),
  KEY `idPrograma` (`idPrograma`),
  CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`idPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,1,'2019-01-28','2021-01-28',0,1800888);
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instructores`
--

DROP TABLE IF EXISTS `instructores`;
/*!50001 DROP VIEW IF EXISTS `instructores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructores` AS SELECT 
 1 AS `idUsuario`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `login`
--

DROP TABLE IF EXISTS `login`;
/*!50001 DROP VIEW IF EXISTS `login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `login` AS SELECT 
 1 AS `correo`,
 1 AS `password`,
 1 AS `usuario`,
 1 AS `tipoUsuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `idMunicipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identiifcador de la tabla ',
  `idRegional` int(11) NOT NULL COMMENT 'id de la tabla region ',
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del municipio',
  `estado` int(11) NOT NULL COMMENT 'estado del municipio',
  PRIMARY KEY (`idMunicipio`),
  KEY `idRegional` (`idRegional`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idRegional`) REFERENCES `regional` (`idRegional`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'Medellin',1);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del pais',
  `estado` int(11) NOT NULL COMMENT 'estado del pais',
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Colombia',1);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa` (
  `idPrograma` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `idCentro` int(11) NOT NULL COMMENT 'id de la tabla centro',
  `nombre` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del sentro en cual esta funcionando  programa',
  `tipoFormacion` varchar(40) CHARACTER SET latin1 NOT NULL COMMENT 'el tipo de la formacion si es tics o otra caena de formacion',
  `estado` int(11) NOT NULL COMMENT 'el estado del grupo',
  PRIMARY KEY (`idPrograma`),
  KEY `idCentro` (`idCentro`),
  CONSTRAINT `Fkcentro` FOREIGN KEY (`idCentro`) REFERENCES `centro` (`idCentro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,1,'Analisis y desarrollo de sistemas de informacio','precencial ',1);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regional`
--

DROP TABLE IF EXISTS `regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional` (
  `idRegional` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla ',
  `idPais` int(11) NOT NULL COMMENT 'id de tabla pais',
  `nombre` mediumtext CHARACTER SET latin1 NOT NULL COMMENT 'nombre de la region ',
  `estado` int(11) NOT NULL COMMENT 'estado de la region',
  PRIMARY KEY (`idRegional`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `regional_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regional`
--

LOCK TABLES `regional` WRITE;
/*!40000 ALTER TABLE `regional` DISABLE KEYS */;
INSERT INTO `regional` VALUES (1,1,'Antioquia',1);
/*!40000 ALTER TABLE `regional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resulta`
--

DROP TABLE IF EXISTS `resulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resulta` (
  `idResultA` int(11) NOT NULL COMMENT 'identificador de la tabla de la tabla resultado',
  `idTrimestre` int(11) NOT NULL COMMENT 'id de la tabla tirmeestre',
  `idCompetencia` int(11) NOT NULL COMMENT 'id de la tabla competencia',
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'Nombre del resultado',
  `estado` int(11) NOT NULL COMMENT 'estado del resultado actual',
  `resultacom` int(11) NOT NULL COMMENT 'el resultado de la competencia',
  PRIMARY KEY (`idResultA`),
  KEY `idTrimestre` (`idTrimestre`),
  KEY `idCompetencia` (`idCompetencia`),
  CONSTRAINT `resulta_ibfk_1` FOREIGN KEY (`idTrimestre`) REFERENCES `trimestre` (`idTrimestre`),
  CONSTRAINT `resulta_ibfk_2` FOREIGN KEY (`idCompetencia`) REFERENCES `competencia` (`idCompetencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resulta`
--

LOCK TABLES `resulta` WRITE;
/*!40000 ALTER TABLE `resulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `idTipoUsuario` int(11) NOT NULL COMMENT 'id perteneciente a la tabla de tipo de usuario',
  `idUsuario` int(11) NOT NULL COMMENT 'id perteneciente a la tabla ususario',
  `estado` tinyint(1) NOT NULL COMMENT 'estado en el que se actualmente un usuario ',
  PRIMARY KEY (`idRol`),
  KEY `fk_Rol_usuario1_idx` (`idUsuario`),
  KEY `fk_Rol_tipousuario1_idx` (`idTipoUsuario`),
  CONSTRAINT `fk_Rol_tipousuario1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Rol_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,3,1,1),(2,3,2,1),(3,3,3,1),(4,3,4,1),(5,3,5,1),(6,3,6,1),(7,3,7,1),(8,3,8,1),(9,3,9,1),(10,3,10,1),(11,3,11,1),(12,3,12,1),(13,3,13,1),(14,3,14,1),(15,3,15,1),(16,3,16,1),(17,3,17,1),(18,3,18,1),(19,3,19,1),(20,3,20,1),(21,3,21,1),(22,3,22,1),(23,3,23,1),(24,3,24,1),(25,3,25,1),(26,3,26,1),(27,3,27,1),(28,3,28,1),(29,3,29,1),(30,3,30,1),(31,3,31,1),(32,3,32,1),(33,3,33,1),(34,3,34,1),(35,1,35,1),(36,2,36,1),(37,1,37,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `idSede` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `idMunicipio` int(11) NOT NULL COMMENT 'id de tabla municipio',
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'nombre de la sede',
  `direccion` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'en que parte de la region esta la seda',
  `telefono` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'telefono de la sede al cual comunicarse ',
  `correo` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'correo nombre de la sede',
  `director` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'nombre del director de esa sede',
  `estado` int(11) NOT NULL COMMENT 'estado de la sede',
  PRIMARY KEY (`idSede`),
  KEY `idMunicipio` (`idMunicipio`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`idMunicipio`) REFERENCES `municipio` (`idMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,1,'Centro De Comercio Sena','Cl. 51 ##57-70',' (4) 5760000','****','*****',1);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoambiente`
--

DROP TABLE IF EXISTS `tipoambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoambiente` (
  `idTipoAmbien` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `nombre` varchar(40) CHARACTER SET latin1 NOT NULL COMMENT 'Nombre del ambiente',
  `estado` int(11) NOT NULL COMMENT 'el estado del ambiente',
  PRIMARY KEY (`idTipoAmbien`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoambiente`
--

LOCK TABLES `tipoambiente` WRITE;
/*!40000 ALTER TABLE `tipoambiente` DISABLE KEYS */;
INSERT INTO `tipoambiente` VALUES (1,'Interno',1),(2,'Externo',1);
/*!40000 ALTER TABLE `tipoambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodoc`
--

DROP TABLE IF EXISTS `tipodoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodoc` (
  `idTipoDoc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla',
  `tipoDocumento` varchar(25) CHARACTER SET latin1 NOT NULL COMMENT 'el tipo de documento de un usuario',
  PRIMARY KEY (`idTipoDoc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodoc`
--

LOCK TABLES `tipodoc` WRITE;
/*!40000 ALTER TABLE `tipodoc` DISABLE KEYS */;
INSERT INTO `tipodoc` VALUES (1,'Cedula de ciudadania'),(2,'Tarjeta de identidad'),(3,'Registro Civil'),(4,'Pasaporte');
/*!40000 ALTER TABLE `tipodoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico de la tabla',
  `tipoUsuario` varchar(25) CHARACTER SET latin1 NOT NULL COMMENT 'la definicion de de cada tipo de usuario\n',
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Admin'),(2,'Instructor'),(3,'Aprendiz');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trimestre` (
  `idTrimestre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador  de la tabla ',
  `idPrograma` int(11) NOT NULL COMMENT 'id de la tabla programa',
  `descripcion` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'descrebe las actividades que hay en el trimestre',
  `estado` int(11) NOT NULL COMMENT 'el estado de en que se encuantra el trimestre',
  PRIMARY KEY (`idTrimestre`),
  KEY `idPrograma` (`idPrograma`),
  CONSTRAINT `trimestre_ibfk_1` FOREIGN KEY (`idPrograma`) REFERENCES `programa` (`idPrograma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trimestre`
--

LOCK TABLES `trimestre` WRITE;
/*!40000 ALTER TABLE `trimestre` DISABLE KEYS */;
INSERT INTO `trimestre` VALUES (1,1,'Primer trimestre',1),(2,1,'Segundo trimestre',1),(3,1,'Tercer trimestre',1),(4,1,'Cuarto trimestre',1),(5,1,'Quinto trimestr',1),(6,1,'Sexto trimestre',1),(7,1,'Septimo trimestre',1),(8,1,'Octavo trimestre',1);
/*!40000 ALTER TABLE `trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la tabla',
  `correo` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Es el correo con que el usuario se resgistro',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Contraseña  que eligio el usuario',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'YENNIFER@SENA.COM','fa2622d2600ce596f8c621c247a93845'),(2,'KEVIN@SENA.COM','9eeec22ddd55896e2dd44879d110c31b'),(3,'DAWINZON@SENA.COM','89c8213d990754f9b122bcd74641bce0'),(4,'JUAN@SENA.COM','d03369934be50a1b3af0826dd2c9d82b'),(5,'DIEGO@SENA.COM','e0d4778b8f2efce059844fc54dc68005'),(6,'CAROLINA@SENA.COM','4f2a6b4eaf5adafa7402bcafe739802a'),(7,'MANUELA@SENA.COM','4960e1b347a82726a3ba963e6afd98de'),(8,'JOSE@SENA.COM','ff6656fe41c382020a8e2119f3b7b50f'),(9,'ANDRES@SENA.COM','8dc53542c9eedd14aefdd90b0d368b37'),(10,'JHON@SENA.COM','ebb600eb4180d38883e2ef4190aae94f'),(11,'VERONICA@SENA.COM','1a7464246b101fa9e31c95510d771d06'),(12,'SANTIAGO@SENA.COM','24407dbc7f400cc5f127dee9defb708f'),(13,'FELIPE@SENA.COM','03b8443e2da22a8ad17d75046c113c95'),(14,'SEBASTIAN@SENA.COM','cba735671962e77f08b12770fe04a5dd'),(15,'ESTEFANIA@SENA.COM','1ad89206dbe267b1114f675ac602d7fb'),(16,'MARIA@SENA.COM','d5071e4e80cb0ed976a187a505804718'),(17,'LUIS@SENA.COM','db104549bb81a0ff37786b50266f6170'),(18,'MANUEL@SENA.COM','54a9a8b9c94a1eca3146892ddcde3fe0'),(19,'ALEXANDRA@SENA.COM','e140507874c4335b68a68ec39af7a97e'),(20,'KEVINARDILA@SENA.COM','cec12a0c04fd3687002d4ad1163ca341'),(21,'KEVINANDRES@SENA.COM','2a939e0e289a443d3993096bdc2d57bb'),(22,'IRMA@SENA.COM','c33a29311814df72bd3a28bcc5dcdb93'),(23,'KELLY@SENA.COM','fe876cf5bcb508c16d3860a951e66401'),(24,'JUANDAVID@SENA.COM','a65e873712093ec5e67e7e65cfa3b0d6'),(25,'JHOANCAMILO@SENA.COM','c13cee63cfa2f6d8e57c67aebc6c1804'),(26,'JHONEVER@SENA.COM','f30341d09a021220d4105d9dc0f8ef21'),(27,'SARA@SENA.COM','0085ff8e03fbac3ace36934908c76cd1'),(28,'MIGUEL@SENA.COM','34be9b7cef82a598bed71a19ba00779c'),(29,'YESID@SENA.COM','4c28f46aca450d7eb0d64735fcb2438e'),(30,'BRAINER@SENA.COM','60eaa25e4d6847062516c28b2a5d3100'),(31,'JUAN@SENA.COM','e7d3fe3847bd03f585f115f0ab03e773'),(32,'JHON@SENA.COM','242acb353c8ffbf4d296b8fb127ded4d'),(33,'JOSE@SENA.COM','2844a3a5e1fc2df793f2272179fe6c00'),(34,'JAIBER@SENA.COM','6b606c45316dc5e24c4b4dbf2c6a25f3'),(35,'SERGIOSE534@GMAIL.COM','9f38da18351f303bf9b64db46cdd3c64'),(36,'ederlara@misena.edu.co','48058e0c99bf7d689ce71c360699a14ce2f99774'),(37,'camila@mail.com','48058e0c99bf7d689ce71c360699a14ce2f99774');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_listarusuarios`
--

DROP TABLE IF EXISTS `v_listarusuarios`;
/*!50001 DROP VIEW IF EXISTS `v_listarusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_listarusuarios` AS SELECT 
 1 AS `TipoDocumento`,
 1 AS `Documento`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `correo`,
 1 AS `password`,
 1 AS `tipoUsuario`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_login`
--

DROP TABLE IF EXISTS `v_login`;
/*!50001 DROP VIEW IF EXISTS `v_login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_login` AS SELECT 
 1 AS `idusuario`,
 1 AS `usuario`,
 1 AS `correo`,
 1 AS `password`,
 1 AS `tipousuario`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'horario'
--

--
-- Dumping routines for database 'horario'
--
/*!50003 DROP PROCEDURE IF EXISTS `areaFormacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `areaFormacion`(
	in nombreArea varchar(70)
)
BEGIN

Select td.TipoDocumento, dt.Documento, dt.nombre, dt.apellido, tu.tipoUsuario, f.numeroFicha, t.descripcion as Ficha, df.jornada, p.nombre
from detalleusuario dt 
inner join tipodoc td on td.idTipoDoc = dt.idTipodoc
inner join usuario u on u.idUsuario = dt.idUsuario
inner join roles r  on u.idUsuario = r.idUsuario
inner join tipousuario tu on r.idTipoUsuario = tu.idTipoUsuario 
inner join detalleasignacion da on u.idUsuario = da.idUsuario 
inner join detalleficha df on  u.idUsuario = df.idUsuario
inner join ficha f on df.idFicha = f.idFicha 
inner join resulta re on da.idResultA = re.idResultA 
inner join trimestre t on re.idTrimestre = t.idTrimestre
inner join programa p on t.idPrograma = p.idPrograma
where p.nombre  = nombreArea;

/*
select td.TipoDocumento, dt.Documento, dt.nombre, dt.apellido,u.correo,u.password, tu.tipoUsuario,r.estado
from detalleusuario dt 
inner join tipodoc td on td.idTipoDoc = dt.idTipodoc
inner join usuario u on u.idUsuario = dt.idUsuario
inner join roles r  on u.idUsuario = r.idUsuario
inner join tipousuario tu on r.idTipoUsuario = tu.idTipoUsuario 
#where dt.Documento  = v_documento;
*/
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalleUsu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleUsu`()
BEGIN
declare idaprendiz int;
DECLARE findelbucle INTEGER DEFAULT 0;

declare users cursor for 
	select distinct u.idUsuario from usuario u
	inner join roles r 
	on (u.idUsuario = r.idUsuario)
	inner join tipousuario t
	on (r.idTipoUsuario = t.idTipoUsuario)
	where t.idTipoUsuario = 3;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET findelbucle=1;

open users; 
bucle: loop
IF findelbucle = 1 THEN
	LEAVE bucle;
END IF;

fetch users into idaprendiz;

set @jornada = 'Mañana';
set @estado = 'Formación';

insert into detalleusu values (null,1,idaprendiz,@jornada,@estado);

end loop;
close users;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detaProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detaProject`(
 in v_iddetaProject int, 
 in v_idActiProy int,
 in v_idResultA int, 
 in v_estado int,
in v_opcion varchar(255)

)
BEGIN
	declare msj varchar(255);
	case
    when opcion = 'Guardar' then 
    insert into detaProject values (v_iddetaProject,v_idActiProy,v_idResultA,v_estado);
    set msj = ("Se ha Guardado los datos");
    select msj;
    
    when opcion = 'Actualizar' then
    update detaProject
    set v_iddetaProject = v_iddetaProject;
    set msj = ("Se han Actualizado los datos");
    select msj;
    
    when opcion = 'Consultar' then
    select * from detaProject
    where v_iddetaProject = v_iddetaProject;
    
    end case;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarAprenndiz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAprenndiz`(
	in buscar int
    
)
BEGIN


Select td.TipoDocumento, dt.Documento, dt.nombre, dt.apellido, tu.tipoUsuario, f.numeroFicha, t.descripcion as Ficha, df.jornada
from detalleusuario dt 
inner join tipodoc td on td.idTipoDoc = dt.idTipodoc
inner join usuario u on u.idUsuario = dt.idUsuario
inner join roles r  on u.idUsuario = r.idUsuario
inner join tipousuario tu on r.idTipoUsuario = tu.idTipoUsuario 
inner join detalleasignacion da on u.idUsuario = da.idUsuario 
inner join detalleficha df on  u.idUsuario = df.idUsuario
inner join ficha f on df.idFicha = f.idFicha 
inner join resulta re on da.idResultA = re.idResultA 
inner join trimestre t on re.idTrimestre = t.idTrimestre
where f.numeroFicha = buscar or  dt.documento = buscar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarAprendiz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarAprendiz`(
in v_idTipoDoc int,
 in v_documento varchar(255),
 in v_nombre varchar(255),
 in v_apellido varchar(255),
 in v_telefono varchar(255),
 in v_genero varchar(20),
 in v_correo varchar(255),
 in v_password varchar(255),
 in v_idTipoUsuario int,
 in v_idPrograma int , 
 in v_descripcion varchar(50),
 in v_fechaInicio date,
 in v_fechaFin date,
 in v_numeroFicha int,
 in v_idFicha int,  
 in v_jornada varchar(30), 
 in v_estado TINYINT(1)
 )
BEGIN
declare mensaje varchar (255);
 set @aux = (select idDetalleUsu from detalleusuario where documento = v_documento);

if  @aux > 0 then
    set mensaje= "-------------------Este usuario ya existe--------------------";
	select mensaje;
else
	call sp_usuario(null, v_correo,v_password,'guardar');
	set @idus = (select  max(idUsuario) from usuario);
	call sp_detalleusuario(null, @idus,v_idTipoDoc,v_documento,v_nombre,v_apellido,v_telefono,v_genero, 'guardar');
	call sp_roles(null, v_idTipoUsuario,@idus,  v_estado, 'guardar');
	call sp_trimestre(null, v_idPrograma, v_descripcion, v_estado, 'guardar');
    call sp_ficha(null, v_idPrograma, v_fechaInicio, v_fechaFin, null, v_numeroFicha, v_estado, 'guardar');
    call sp_detalleficha(null, v_idFicha, @idus, v_jornada, v_estado, 'guardar');
	set mensaje="elemento guardado";
    select mensaje;
 end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `simple_loop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `simple_loop`( )
BEGIN
  DECLARE counter BIGINT DEFAULT 0;
 
  my_loop: LOOP
    SET counter=counter+1;

    IF counter=33 THEN
      LEAVE my_loop;
    END IF;

    update usuario set password = MD5(password) WHERE idUsuario = counter;

  END LOOP my_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actiproy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actiproy`(	
	in v_idActiProy int,
    in v_nombre varchar(255),
    in v_opcion varchar(255)
)
BEGIN
#crud de la tabla actipoy, esta estroturado por clases 
	declare msj varchar(255);
	case
    
    when opcion = 'guardar' then 
    insert into actiproy values (v_idActiProy,v_nombre,v_estado);
    set msj = ("Se ha Guardado los datos");
    select msj;
    
    when opcion = 'actualizar' then
    update actiproy
    set v_nombre = v_nombre;
    set msj = ("Se han Actualizado los datos");
    select msj;
    
    when opcion = 'consultar' then
    select * from actiproy
    where idActiProy = v_idActiProy;
    
	end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActualizarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarUsuario`(

#ponemos los datos que le vamos a pedir al usuario para actualizar 
 in v_documento int,
 in v_idTipoDoc int,
 in v_correo varchar(255),
 in v_password varchar(255),
in v_telefono varchar(255),
 in v_idTipoUsuario int,
 in v_estado int
)
BEGIN
	#Declaramos las variales que vamos a utizar mas adelante en el codigo
    declare usuarioId int;
    declare mensaje varchar (255);
    
# funcion que almacena el id del usuario 
	set usuarioId = (SELECT idUsuario from detalleusuario WHERE  documento = v_documento);

#funcion de comprovacion de que el numero de documento exista 
    if usuarioId then
			#llamamos los procedimientos almacenados  de las tablas  usuario, detalleusuario, roles
			call sp_usuario(usuarioId, v_correo,v_password,'actualizar');
			call sp_detalleusuario(0, usuarioId, v_idTipoDoc, " ", " ", " ",  v_telefono, " ", 'actualizar');
			call sp_roles(0, v_idTipoUsuario, usuarioId, v_estado, 'actualizar');
            
			#mensaje que mostrara por pantalla en caso de que la accion se alla completado
			set mensaje="elemento Actualizado";
			select mensaje;
   else
			select "Este usuario no existe" as Mensaje;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ambiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ambiente`(
	in v_idAmbiente int,
    in v_idTipoAmbiente int,
    in v_nombre varchar(40),
    in v_capacidad int,
    in opcion varchar(40)
)
BEGIN
#crud de la tabla ambiente, esta estroturado por clases 

declare msj varchar (255);

case
	when opcion = 'guardar' then
		insert into ambiente values(null,v_idTipoAmbiente,v_nombre,v_capacidad);
		set msj = ("se guardo el ambiente");
		select msj;

	when opcion = 'actualizar' then
		update ambiente set nombre = v-nombre,capacidad = v_capacidad where idAmbiente = v_idAmbiente;
		set msj = ("se actualizo el ambiente");  
		select msj;

	when opcion = 'consultar' then
		select * from ambiente where idAmbiente = v_idAmbiente;
		
	when opcion = 'listar' then
		select * from ambiente;

end case;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_competencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_competencia`(
	in v_idCompetencia int,
    in v_idPrograma int,
    in v_nombre Varchar(50),
    in v_codigo int,
    in v_estado int,
    in opcion varchar(50)
)
BEGIN
#crud de la tabla competencia, esta estroturado por clases 
declare msj varchar(255);
case
	when opcion = 'guardar' then
		INSERT INTO competencia VALUES(null,v_idPrograma,v_nombre,v_codigo,v_estado);
		set msj = ("se ha guardado la competencia");
		select msj;

	when opcion = 'actualizar' then
		update competencia set nombre=v_nombre,codigo=v_codigo where idCompetencia=v_idCompetencia;
		set msj = ("se ha actualizado la competencia");
		select msj;

	when opcion = 'eliminar' then
		update competencia set estado=v_estado where idCompetencia=v_idCompetencia;
		set msj = ("se ha eliminado la competencia");
		select msj;

	when opcion = 'listar' then 
		select * from competencia;

	when opcion = 'consultar' then 
		select * from competencia where idCompetencia=v_idCompetencia;
        
end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_detalleasignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalleasignacion`(
    in v_idDetalleA int,
    in v_idficha int,
    in v_idAmbiente int, 
    in v_idDia int,
    in v_idUsuario int,
    in v_idActiProy int,
    in v_periodo year,
    in v_trimestre int,
    in v_horaIncio time,
    in v_horaFin time,
    in opcion varchar (50)
)
BEGIN
#crud de la tabla detalleasignacion, esta estroturado por clases 
declare msj varchar (255);
set v_horaIncio = (SELECT DATE_FORMAT(concat('0000-00-00 ',v_horaIncio), "%H:%i"));
set v_horaFin = (SELECT DATE_FORMAT(concat('0000-00-00 ',v_horaFin), "%H:%i"));
case
	when opcion = 'guardar' then
		insert into detalleasignacion values (null,v_idficha,v_idAmbiente,v_idDia,v_idUsuario,v_idActiProy,v_periodo,v_trimestre,v_horaIncio,v_horaFin);
		set msj = ("se han guardado los detalles de asignacion");
		select msj;

	when opcion = 'actualizar' then
		update detalleasignacion set horaInicio = v_horaInicio,horaFin = v_horaFin where idDetalleA = v_idDetalleA;
		set msj = ("se han actualizado los detalles de asignacion");
		select msj;
    
	when opcion ='consultar' then 
		select * from detalleasignacion where idDetalleA = v_idDetalleA;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_detalleficha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalleficha`(
	in v_idDetalleF int,
    in v_idFicha int,
    in v_idUsuario int,
    in v_jornada varchar(30),
    in v_estado int,
    in opcion varchar(45)
)
BEGIN
#crud de la tabla detalleficha, esta estroturado por clases 
declare msj varchar (255);
case
	when opcion = 'guardar' then
		insert into detalleficha values(null,v_idFicha,v_idUsuario,v_jornada,v_estado);
        set msj = ("se han guardado los detalles de la ficha");
		select msj;
        
	when opcion = 'actualizar' then
		update detalleficha set jornada=v_jornada where idDetalleF=v_idDetalleF;
        set msj = ("se han actualizado los detalles de la ficha");
		select msj;
        
	when opcion = 'eliminar' then
		update detalleficha set estado=v_estado where idDetalleF=v_idDetalleF;
        set msj = ("se han eliminado los detalles de la ficha");
		select msj;
        
	when opcion = 'listar' then
		select * from detalleficha;
        
end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_detalleusuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalleusuario`(
in v_idDetalleUsu int,
in v_idUsuario int,
in v_idTipoDoc int,
in v_documento varchar (255),
in v_nombre varchar (255),
in v_apellido varchar(255),
in v_telefono varchar(255),
in v_genero varchar(255),
in opcion varchar(255)
)
BEGIN
#crud de la tabla detalleusuario, esta estroturado por clases 
case
	when opcion='guardar' then
		insert into detalleusuario values (v_idDetalleUsu,v_idUsuario,V_idTipoDoc,v_documento,v_nombre,v_apellido,v_telefono,v_genero);

	when opcion = 'consultar'
		then select * from detalleusuario where idUsuario=v_idUsuario;

	when opcion = 'actualizar' then 
		update detalleusuario set  idTipoDoc=v_idTipoDoc,telefono=v_telefono where idUsuario=v_idUsuario;

	when opcion='eliminar' then
		delete from detalleusuario where idDetalleUsu = v_idDetalleUsu;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dia`(
	in v_idDia int,
    in v_nombre varchar (30),
    in v_estado int,
    in opcion varchar (50)
)
BEGIN
#crud de la tabla dia, esta estroturado por clases 
declare msj varchar (255);
case
	when opcion ='guardar' then
		insert into dia values (null,v_nombre,v_estado);
		set msj = ("se ha guardado el dia");
		select msj;

	when opcion = 'actualizar' then
		update dia set nombre = v_nombre,estado = v_estado where idDia = v_idDia;
		set msj = ("se ha actualizado el dia");
		select msj;

	when opcion = 'listar' then 
		select * from dia where idDia = v_idDia;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarUsuario`(

in v_documento int
)
BEGIN
    #decalracion de la variable de mensajes 
    declare mensaje varchar (255);
    
	# Declaramos variables para almacenar los ids
    declare ax_usuario int;
    declare ax_idDetalleUsuario int;
    declare ax_idRoles int;
    
	#almacenamos el id de la tabla  DetalleUsuario
    set ax_idDetalleUsuario=(select idDetalleUsu from  detalleusuario where  documento = v_documento);
    #almacenamos el id de la tabla  usuario
	set ax_usuario= (SELECT idUsuario from detalleusuario WHERE  documento = v_documento);
    #almacenamos el id de la tabla  Roles
    set ax_idRoles=(select idRol from roles where ax_usuario=idUsuario);

	#compravacion del que el documeto no alla sido eliminado antes
	if ax_idDetalleUsuario then
			#llamos los procedimietos almacenados de las tablas detalleusuario,usuario y roles con la opcion eliminar
			call sp_detalleusuario(ax_idDetalleUsuario, 0,0, " ", " ", " ",  " ", " ", 'eliminar');
			call sp_usuario(ax_usuario, " "," ",'eliminar');
			call sp_roles(ax_idRoles,0, 0,0, 'eliminar');
            #el mesaje de que retorna si el elemento a sido eliminado
			select  "Este elemento ", v_documento," fue eliminado"  as Mensaje;
	   else
       #mesaje que retorna en caso de que este elemento ya alla sido eliminado o no exista
				select "Este usuario  ",v_documento as Documento," ya fue eliminado" as Mensaje;
		end if; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ficha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ficha`(
	in v_idFicha int,
    in v_idPrograma int,
    in v_fechaInicio date,
    in v_fechaFin date,
    in v_cantidadAprendiz int,
    in v_numeroFicha int,
    in v_estado int,
    in opcion varchar(45)
)
BEGIN
#crud de la tabla ficha, esta estroturado por clases 
declare msj varchar(255);

case
	when opcion = 'guardar' then
		insert into ficha values(null,v_idPrograma,v_fechaInicio,v_fechaFin,v_cantidadAprendiz,v_numeroFicha,v_estado); 
        set msj = ("se ha guardado la ficha");
		select msj;
        
	when opcion = 'actualizar' then 
		update ficha set fechaFin=v_fechaFin,cantidadAprendiz=v_cantidadAprendiz where idFicha=v_idFicha;
        set msj = ("se ha actualizado la ficha");
		select msj;
        
	when  opcion = 'eliminar' then
		update ficha set estado=v_estado where idFicha=v_idFicha;
        set msj = ("se ha eliminado la ficha");
		select msj;
        
	when opcion = 'listar' then
		select * from ficha;
        
	when opcion = 'consultar' then
		select * from ficha where idFicha=v_idFicha;
        
end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GuardarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GuardarUsuario`(

#ponemos los datos que le vamos a pedir al usuario para guardar
 in v_idTipoDoc int,
 in v_documento varchar(255),
 in v_nombre varchar(255),
 in v_apellido varchar(255),
 in v_telefono varchar(255),
 in v_genero varchar(20),
 in v_correo varchar(255),
 in v_idTipoUsuario int,
 in v_estado TINYINT(1)
)
BEGIN
#Declaramos las variales que vamos a utizar mas adelante en el codigo
declare mensaje varchar (255);

#la siguiente funcion compruba si el numero de documento existe 
 set @aux = (select idDetalleUsu from detalleusuario where documento = v_documento);

#comprovacion  de si el usuario ya existe 
if  @aux > 0 then
    set mensaje= "-------------------Este usuario ya existe--------------------";
	select mensaje;
else
	#llamamos los procedimientos almacenados  de las tablas  usuario, detalleusuario, roles
	call sp_usuario(null, v_correo,v_documento,'guardar');
	set @idus = (select  max(idUsuario) from usuario); #almacenamos el ultimo  idUsuario que fue registrado
	call sp_detalleusuario(null, @idus,v_idTipoDoc,v_documento,v_nombre,v_apellido,v_telefono,v_genero, 'guardar');
	call sp_roles(null, v_idTipoUsuario,@idus,  v_estado, 'guardar');
      set mensaje="elemento guardado";
    select mensaje;
 end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(
in user varchar(256),
in pass varchar(256)
)
BEGIN
declare
sesion varchar(256);

set @perfiles = (SELECT count(*) FROM login WHERE correo = user and password = sha(pass) and estado = 1);
set @user = (SELECT usuario FROM login WHERE correo = user and password = sha(pass) and estado = 1 limit 1);

if @perfiles = 1 then
    set sesion = 'Admin';
else
    set sesion = 'Instructor;Aprendiz';
    
end if;
set @resultado =(concat(@user,';',sesion));
select @resultado as resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_programa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_programa`(
    in v_idCentro int,
    in v_nombre varchar(50),
    in v_tipoFormacion varchar(50),
    in v_estado int,
    in opcion varchar(50)
)
BEGIN
#crud de la tabla programa, esta estroturado por clases 
declare msj varchar (255);

case 
	when opcion = 'guardar' then
		insert into programa values(null,v_idCentro,v_nombre,v_tipoFormacion,v_estado);
		set msj = ("se ha guardado el programa");
		select msj;
        
	when opcion = 'actualizar' then
		update programa set nombre=v_nombre,tipoFormacion=v_tipoFormacion,horario=v_horario where idPrograma=v_idPrograma;
		set msj = ("se ha actualizado el programa");
		select msj;
        
	when opcion = 'eliminar' then
		update programa set estado=v_estado where idPrograma=v_idPrograma;
        set msj = ("se ha eliminado el programa");
		select msj;
        
	when opcion = 'listar' then
		select * from programa;
        
	when opcion = 'consultar' then
		select * from programa where idPrograma=v_idPrograma;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_resulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_resulta`(
	in v_idResultA int,
    in v_idTrimestre int,
    in v_idCompetencia int,
    in v_nombre varchar(255),
    in v_resultacom int,
    in v_estado int,
    in opcion varchar(255)
 
)
BEGIN
#crud de la tabla resulta, esta estroturado por clases 
declare msj varchar(255);
case
    when opcion = 'Guardar' then
		insert into resulta values (v_idResultA,v_idTrimestre,v_idCompetencia,v_nombre,v_resultacom,v_estado);
		set msj = ("Se han Guardado los datos");
		select msj;
		
    when opcion = 'Actualizar' then
		update resulta set nombre = v_nombre, estado = v_estado,resultacom=v_resultacom
		where idResultA = v_idResultA;
		set msj = ("Se han Actualizado los datos");
		select msj;
		
    when opcion = 'Consultar' then 
		select * from resulta where idResultA = v_idResultA;
    
end case;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_roles`(
in v_idRol int,
in v_idTipoUsuario int,
in v_idUsuario int,
in v_estado int,
in opcion varchar(255)
)
BEGIN
#crud de la tabla resulta, esta estroturado por clases 
case 
	when opcion='guardar' then
		INSERT INTO roles VALUES (v_idRol,v_idTipoUsuario,v_idUsuario,v_estado);

	when opcion='actualizar' then
		update roles set idTipoUsuario=v_idTipoUsuario,estado=v_estado where idUsuario=v_idUsuario;

	when opcion='consultar' then 
		select * from roles where idRol=v_idRol;

	when opcion='eliminar' then 
		delete from roles where idRol=v_idRol;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipoambiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipoambiente`(
	in v_idTipoAmbiente int,
    in v_nombre varchar (50),
    in v_estado int,
    in opcion varchar(40)
)
BEGIN
#crud de la tabla tipoambiente, esta estroturado por clases 
declare msj varchar(255);
case
	when opcion = 'Guardar' then
		insert into tipoambiente values (v_idTipoAmbiente,v_nombre,v_estado);
		set msj = ("se ha guardado el tipo de ambiente");
		SELECT msj;

	when opcion ='Actualizar' then
		update tipoambiente set nombre = v_nombre,estado = v_estado where idTipoAmbiente = v_idTipoAmbiente;
		set msj = ("se ha actualizado el tipo de ambiente");
		SELECT msj;

	when opcion = 'Listar' then
		select * from tipoambiente where idTipoAmbiente = v_idTipoAmbiente;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_trimestre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_trimestre`(
	in v_idTrimestre int,
    in v_idPrograma int,
    in v_descripcion varchar(255),
    in v_estado varchar(255),
    in opcion varchar(255)
)
BEGIN
#crud de la tabla trimestre, esta estroturado por clases 
declare msj varchar(255);
case
	when opcion = 'cuardar' then
		insert into trimestre values (v_idTrimestre,v_idPrograma,v_descripcion,v_estado);
		set msj=("Se han Guardado los datos");
		select msj;

	when opcion = 'actualizar' then 
		update trimestre set descripcion = v_descripcion, estado = v_estado where v_idTrimestre = v_idTrimestre;
		set msj =("Se ha Actualizado el trimestre");
		select msj;

	when opcion = 'consultar'then 
		select * from trimestre where idTrimestre = v_idTrimestre;
    
	end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario`(

in v_idUsuario int,
in v_correo varchar(255),
in v_pass varchar(255),
in opcion varchar (255)
)
BEGIN
#crud de la tabla usuario, esta estroturado por clases 
case
	when opcion='guardar' then
		insert into usuario values(v_idUsuario,v_correo,MD5(v_pass));

	when opcion = 'actualizar' then
		update usuario set correo = v_correo,password=v_pass where idUsuario=V_idUsuario;

	when opcion ='consultar' then
		select * from usuario where idUsuario=v_idUsuario;

	when opcion='eliminar' then 
		delete from usuario where idUsuario=v_idUsuario;

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `instructores`
--

/*!50001 DROP VIEW IF EXISTS `instructores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructores` AS select `u`.`idUsuario` AS `idUsuario`,concat(`dt`.`nombre`,' ',`dt`.`apellido`) AS `nombre` from (((`usuario` `u` join `detalleusuario` `dt` on((`dt`.`idUsuario` = `u`.`idUsuario`))) join `roles` `r` on((`u`.`idUsuario` = `r`.`idUsuario`))) join `tipousuario` `t` on((`r`.`idTipoUsuario` = `t`.`idTipoUsuario`))) where (`t`.`idTipoUsuario` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `login`
--

/*!50001 DROP VIEW IF EXISTS `login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `login` AS select `u`.`correo` AS `correo`,`u`.`password` AS `password`,concat(`dt`.`nombre`,' ',`dt`.`apellido`) AS `usuario`,`t`.`tipoUsuario` AS `tipoUsuario` from (((`usuario` `u` join `detalleusuario` `dt` on((`dt`.`idUsuario` = `u`.`idUsuario`))) join `roles` `r` on((`r`.`idUsuario` = `u`.`idUsuario`))) join `tipousuario` `t` on((`r`.`idTipoUsuario` = `t`.`idTipoUsuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_listarusuarios`
--

/*!50001 DROP VIEW IF EXISTS `v_listarusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_listarusuarios` AS select `td`.`tipoDocumento` AS `TipoDocumento`,`dt`.`documento` AS `Documento`,`dt`.`nombre` AS `nombre`,`dt`.`apellido` AS `apellido`,`u`.`correo` AS `correo`,`u`.`password` AS `password`,`tu`.`tipoUsuario` AS `tipoUsuario`,`r`.`estado` AS `estado` from ((((`detalleusuario` `dt` join `tipodoc` `td` on((`td`.`idTipoDoc` = `dt`.`idTipoDoc`))) join `usuario` `u` on((`u`.`idUsuario` = `dt`.`idUsuario`))) join `roles` `r` on((`u`.`idUsuario` = `r`.`idUsuario`))) join `tipousuario` `tu` on((`r`.`idTipoUsuario` = `tu`.`idTipoUsuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_login`
--

/*!50001 DROP VIEW IF EXISTS `v_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_login` AS select 1 AS `idusuario`,1 AS `usuario`,1 AS `correo`,1 AS `password`,1 AS `tipousuario`,1 AS `estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26 12:21:32
