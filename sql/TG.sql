-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TG_1
-- ------------------------------------------------------
-- Server version	5.5.40-0+wheezy1

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
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cups` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'CONSULTA PRIMERA VEZ MEDICINA ESPECIALIZADA','890202',NULL,NULL),(2,'ECOCARDIOGRAMA MODO M Y BIDIMENSIONAL CON DOPPLER A COLOR','881234',NULL,NULL),(3,'ELECTROCARDIOGRAFIA DINAMICA (HOLTER)','895001',NULL,NULL),(4,'PRUEBA ERGOMETRICA (TEST DE EJERCICIO)','894102',NULL,NULL),(5,'ELECTROCARDIOGRAMA DE RITMO O DE SUPERFICIE SOD','895100',NULL,NULL),(6,'MIBI','920407',NULL,NULL),(7,'DIPIRIDAMOLes','920408',NULL,NULL),(8,'ESPIROMETRIA O CURVA DE FLUJO VOLUMEN PRE Y POST BRONCODILATADORES','893805',NULL,NULL),(9,'ECOCARDIOGRAMA DE STRESS CON PRUEBA DE ESFUERZO O CON PRUEBA FARMACOLOGICA','881236',NULL,NULL),(10,'MONITOREO DE PRESION ARTERIAL SISTEMICA','896100',NULL,NULL),(11,'TERAPIA DE REHABILITACION  CARDIACA SOD','933600',NULL,NULL),(12,'ELECTROENCEFALOGRAMA DIGITAL COMPUTARIZADO','891401',NULL,NULL),(13,'CONSULTA INTERDICCIÓN','890203',NULL,NULL),(14,'CONSULTA CARDIOLOGÍA PEDIATRICA','890202',NULL,NULL),(15,'TERAPIA FISICA INTEGRAL','931000',NULL,NULL),(16,'TERAPIA RESPIRATORIA INTEGRAL','939400',NULL,NULL),(17,'TERAPIA CARDIO PULMONAR','010101',NULL,'2015-01-30 00:45:02'),(18,'ECOCARDIOGRAMA PEDIATRICO','881234',NULL,NULL),(19,'Mapeo Cerebral','891401',NULL,NULL);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorios`
--

DROP TABLE IF EXISTS `consultorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorios`
--

LOCK TABLES `consultorios` WRITE;
/*!40000 ALTER TABLE `consultorios` DISABLE KEYS */;
INSERT INTO `consultorios` VALUES (1,'#1','Radiologia','2015-01-19 23:40:18','2015-01-19 23:40:18'),(2,'#2','Pediatria','2015-02-19 01:40:54','2015-02-19 01:40:54'),(3,'#3','Cardiologia','2015-02-19 01:52:43','2015-02-19 01:52:43'),(4,'#4','Odontologia','2015-02-19 01:53:07','2015-02-19 01:53:07'),(5,'#5','RX','2015-02-19 01:53:27','2015-02-19 01:53:27'),(6,'#6','Pruebas','2015-02-19 01:54:08','2015-02-19 01:54:08'),(7,'#7','Computacion','2015-02-19 01:56:16','2015-02-19 01:56:16'),(8,'#8','Electronica','2015-02-19 01:58:23','2015-02-19 01:58:23'),(9,'#9','Evolutiva','2015-02-19 01:58:48','2015-02-19 01:58:48'),(10,'#10','Sistemas Complejos','2015-02-19 01:59:42','2015-02-19 01:59:42');
/*!40000 ALTER TABLE `consultorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `out_put_solutions`
--

DROP TABLE IF EXISTS `out_put_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `out_put_solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monday` varchar(255) DEFAULT NULL,
  `tuesday` varchar(255) DEFAULT NULL,
  `wenesday` varchar(255) DEFAULT NULL,
  `thursday` varchar(255) DEFAULT NULL,
  `friday` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `out_put_solutions`
--

LOCK TABLES `out_put_solutions` WRITE;
/*!40000 ALTER TABLE `out_put_solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `out_put_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150108214746'),('20150108223419'),('20150108223450'),('20150108231400'),('20150122193648'),('20150415002138');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cargo_works`
--

DROP TABLE IF EXISTS `user_cargo_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cargo_works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `monday` varchar(255) DEFAULT NULL,
  `tuesday` varchar(255) DEFAULT NULL,
  `wednesday` varchar(255) DEFAULT NULL,
  `thursday` varchar(255) DEFAULT NULL,
  `friday` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cargo_works`
--

LOCK TABLES `user_cargo_works` WRITE;
/*!40000 ALTER TABLE `user_cargo_works` DISABLE KEYS */;
INSERT INTO `user_cargo_works` VALUES (9,2,7,'1','x','x','x','f','f','2015-02-03 19:48:50','2015-02-19 02:32:06'),(10,2,14,'1','f','f','f','x','x','2015-02-03 19:48:52','2015-02-19 02:32:18'),(11,28,3,'1','f','x','a','m','x','2015-02-03 19:49:03','2015-02-11 01:28:39'),(12,28,8,'1','x','m','x','a','m','2015-02-03 19:49:09','2015-02-11 02:38:58'),(13,28,17,'1','x','a','m','x','a','2015-02-03 19:49:22','2015-02-11 02:39:51'),(14,20,7,'0',NULL,NULL,NULL,NULL,NULL,'2015-02-03 19:49:36','2015-02-03 19:49:36'),(15,20,16,'0',NULL,NULL,NULL,NULL,NULL,'2015-02-03 19:49:41','2015-02-03 19:49:41'),(16,6,17,'0',NULL,NULL,NULL,NULL,NULL,'2015-02-03 19:49:53','2015-02-03 19:49:53'),(17,7,7,'1','f','f','f','f','f','2015-02-11 01:54:36','2015-02-19 02:28:34'),(19,23,14,'1','m','a','m','x','f','2015-02-19 02:11:23','2015-02-19 02:34:40'),(20,23,9,'1','x','m','a','f','x','2015-02-19 02:11:25','2015-02-19 02:35:03'),(21,9,14,'1','f','f','f','a','a','2015-02-19 02:11:59','2015-02-19 02:12:47'),(22,9,1,'1','x','x','x','m','m','2015-02-19 02:12:04','2015-02-19 02:13:30');
/*!40000 ALTER TABLE `user_cargo_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1115063331,'Hernando','Bocanegra Grajales','ROLE_ADMIN','3157785189','calle 13 # 17 - 60','Aministrador','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','yfreldragon@gmail.com',NULL,'2015-01-24 02:08:08'),(2,13006865,'Oscar','Narvaez Moreno','ROLE_MEDICO','3166930278','Carrera 8 # 16 Sur - 100','Cardiólogo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','onarvaez@ccv.com.co',NULL,NULL),(3,31641045,'Monica Maria','Nieto','ROLE_MEDICO','3174233256','Santa Rita',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','mnieto@ccv.com.co',NULL,NULL),(4,241946,'Lola','Montenegro','ROLE_ADMIN','3174233256','Bogota',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','lmontenegro@ccv.com.co',NULL,NULL),(5,31837884,'Luz Maria','Giraldo','ROLE_MEDICO','2288680','Calle 7 Oeste # 2- 110','Cardióloga Pediatra','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','lgiraldo@ccv.com.co',NULL,NULL),(6,29543899,'Cielo Carolina','Quiñonez Sarria','ROLE_MEDICO','3156105921',NULL,NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','csarria@ccv.com.co',NULL,NULL),(7,14876243,'Alvaro','Lopez Figueroa','ROLE_MEDICO','2361800','Km. 3 - Via la Magdalena','Neurocirugia','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','alvarolopezfigueroa@hotmail.com',NULL,NULL),(8,66731564,'Lidia','Melvis Claret','ROLE_MEDICO','3178185398','carrera 19 # 19 - 16',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','lmelvis@ccv.com.co',NULL,NULL),(9,16628744,'Jaime','Benavides Mora','ROLE_MEDICO','2288680','Carrera 8 16 sur 10','Cardiólogo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','jbenavidez@ccv.com.co',NULL,NULL),(10,1115077805,'Stephani','Lopez Viafara','ROLE_MEDICO','3158041282','Calle 14 # 15 - 76','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','slopez@ccv.com.co',NULL,'2015-01-31 19:18:44'),(11,38471535,'Shirly','Quiñonez','ROLE_MEDICO','3015470020','Brisas del mar',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','squinonez@ccv.com.co',NULL,NULL),(12,31204401,'Luz Marina','Sanabria','ROLE_MEDICO','3136638241','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','luzmarina.sanabria@hotmail.com',NULL,'2015-01-31 19:16:59'),(13,66803918,'Silvia Maria','Valencia Duque','ROLE_MEDICO','3175738600','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','silviavalenciad@hotmail.com',NULL,'2015-01-31 19:17:31'),(14,29876894,'Dulfay','Posada Bedoya','ROLE_MEDICO','2304569','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','dulfayp@hotmail.com',NULL,'2015-01-31 19:16:14'),(15,29886941,'Claudia Patricia','Gonzalez','ROLE_MEDICO','3147315959','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','claudiapatriciago@hotmail.com',NULL,'2015-01-31 19:16:44'),(16,1116236154,'Krystel','Charria Ortiz','ROLE_MEDICO','3183904459','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','krystelcha@hotmail.com',NULL,'2015-01-31 19:18:27'),(17,18401779,'Nelson','Rojas Toro','ROLE_MEDICO','2323622','Hospital Tomas Uribe Uribe','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','nels_083@hotmail.com',NULL,'2015-01-31 19:13:44'),(18,891901158,'Tomas','Uribe uribe','ROLE_MEDICO','2244262','Carrera 39 calle 27 esquina','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','mustang@ccv.com.co',NULL,'2015-01-31 19:19:56'),(19,27333567,'Sonia Elvira','Lopez Jurado','ROLE_MEDICO','3146257250','Piedra Ancha',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','hbocanegra@ccv.com.co',NULL,NULL),(20,25171778,'Nora Elena','Sanchez Valencia','ROLE_MEDICO','3104248321','Sevilla',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','nsanchez@ccv.com.co',NULL,NULL),(21,1115076752,'Gloria Stephani','Marles Lozano','ROLE_MEDICO','3153237246','Carrera 15 27B - 20 2do Piso',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','gmarles@ccv.com.co',NULL,NULL),(22,800084362,'Hospital','Civil de Ipiales','ROLE_MEDICO','2288680','Ipiales','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','info@ccv.com.co',NULL,'2015-01-31 19:20:58'),(23,11222333,'Prueba','Prueba','ROLE_MEDICO','3138467319','crr 15B # 30-25','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','example@ccv.com.co',NULL,'2015-01-31 19:15:44'),(24,793771989,'Mario Fernando','Pantoja','ROLE_MEDICO','3145107154','Ipiales','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','mpantoja@ccv.com.co',NULL,NULL),(25,1113304917,'Julieth Andrea','Castañeda Vanegas','ROLE_MEDICO','3103855737','Hospital de sevilla',NULL,'$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','yulyandrea817@hotmail.com',NULL,NULL),(26,1085922568,'Lina Maria','Montenegro','ROLE_MEDICO','3103855737','Ipiales','Cardiologo','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','example@gmail.com',NULL,'2015-01-31 19:19:16'),(27,1094920670,'Erika Jissed','Porras Valderrama','ROLE_MEDICO','3168308377','Calle 22 # 20-09','Enfermeria','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','eiji529@hotmail.com',NULL,NULL),(28,91608,'Yamira','Martinez Gamez','ROLE_MEDICO','3188710236','Cali','Ecocardiografista','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','yamiramartinezgamez@gmail.com',NULL,NULL),(29,52776065,'Eleonora Marcela','Castiblanco Diaz','ROLE_MEDICO','2288680','Sevilla','Internista','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','$2a$10$vIrTXqdD9/NXvgGR9DGdcOO8k4pLLSS90hrMNmTUX32MDD2Fbv6DS','macadi1981@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-19 17:17:54
