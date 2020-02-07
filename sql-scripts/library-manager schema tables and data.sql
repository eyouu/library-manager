CREATE DATABASE  IF NOT EXISTS `librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarydb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `country` varchar(56) DEFAULT NULL,
  `publication_date` varchar(10) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Marcel Proust','In Search of Lost Time','Novel','French','1913-11-14',10),(2,'James Joyce','Ulysses','Modernist novel','Ireland','1922-02-02',0),(3,'Miguel de Cervantes','Don Quixote','Novel','Spain','1605-00-00',9),(4,'F. Scott Fitzgerald','The Great Gatsby','Tragedy','English','1925-04-10',4),(5,'Gabriel Garcia Marquez','One Hundred Years of Solitude','Magic realism, novel','Argentina','1967-00-00',1),(6,'Herman Melville','Moby Dick','Novel, Adventure fiction','United States','1851-00-00',1),(7,'Leo Tolstoy','War and Peace','Novel','Russia','1869-00-00',6),(8,'Vladimir Nabokov','Lolita','Novel','France','1955-00-00',17),(9,'William Shakespeare','Hamlet','Tragedy, Drama','United Kingdom','1609-00-00',5),(10,'J. D. Salinger','The Catcher in the Rye','Realistic fiction','United States','1951-07-16',0),(11,'Helen DeWitt','The Last Samurai','Novel','United States','2000-09-00',9),(12,'Fyodor Dostoyevsky','Crime and Punishment','Novel','Russia','1866-00-00',7),(13,'Dante Alighieri','The Divine Comedy','Epic poetry','Italy','1472-00-00',4),(14,'John Steinbeck','The Grapes of Wrath','Novel','United States','1939-04-14',2),(15,'J. R. R. Tolkien','The Lord of the Rings','Fantasy, Adventure','United Kingdom','1954-07-29',2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_reader`
--

DROP TABLE IF EXISTS `book_reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_reader` (
  `book_id` bigint NOT NULL,
  `reader_id` bigint NOT NULL,
  PRIMARY KEY (`book_id`,`reader_id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `book_reader_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `book_reader_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_reader`
--

LOCK TABLES `book_reader` WRITE;
/*!40000 ALTER TABLE `book_reader` DISABLE KEYS */;
INSERT INTO `book_reader` VALUES (1,1),(8,3),(8,9);
/*!40000 ALTER TABLE `book_reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `date_of_birth` varchar(10) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `registration_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1,'Keanu','Reeves','063-145-9552','Manhattan, 9A','keanu@gmail.com','1964-09-02','Male','2020-02-06'),(2,'David','Leitch','063-205-8424','Times Square, 47','leitch@gmail.com','1975-11-16','Male','2020-02-06'),(3,'Eva','Longoria','063-774-5543','Brooklyn, 718','langoria@gmail.com','1975-03-15','Female','2020-02-06');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `date_of_birth` varchar(10) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `registration_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (1,'Chris','Columbus','063-774-4955','columbus15@gmail.com','1964-02-18','Male','2020-02-15'),(2,'John','Hughes','097-555-0176','hughes.john@gmail.com','1978-07-18','Male','2020-02-18'),(3,'Macaulay','Culkin','097-563-0795','culkin.galkin@gmail.com','1981-05-13','Male','2020-02-06'),(4,'Joe','Pesci','098-019-7484','pesci16@gmail.com','1999-05-31','Male','2020-02-19'),(5,'Daniel','Stern','099-563-7011','stern.pattern@gmail.com','2001-12-05','Male','2020-02-20'),(6,'Catherine','O\'Hara','073-917-4777','harabusiness@gmail.com','1999-05-19','Female','2020-02-14'),(7,'John','Heard','074-999-0755','herald.rivia@gmail.com','1987-06-17','Male','2020-02-06'),(8,'Ashton','Kutcher','073-902-0771','kutcher@outlook.com','1989-11-17','Male','2020-02-21'),(9,'Amy','Smart','044-794-3324','smart.mini@gmail.com','2002-04-01','Female','2020-02-19'),(10,'Roman','Abramovich','093-114-7777','abramovich@mail.ru','1975-02-19','Male','2020-02-19'),(11,'Melora','Walters','097-725-0179','walters@gmail.com','1997-02-16','Female','2020-02-19'),(12,'Elden','Henson','077-995-4054','henson@gmail.com','2000-06-09','Male','2020-02-28'),(13,'Logan','Lerman','099-945-1221','lermontov@gmail.com','1999-11-11','Male','2020-02-19'),(14,'Irene','Gorovaia','099-771-4495','golova@gmail.com','1998-05-19','Female','2020-02-07'),(15,'Sarah','Widdows','093-022-1116','windows.almost97@gmail.com','1997-01-19','Female','2020-02-16'),(16,'Nathaniel','DeVeaux','099-457-0015','devve.job@gmail.com','1999-12-01','Male','2020-02-08');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_info`
--

DROP TABLE IF EXISTS `rent_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_info` (
  `rent_id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  `reader_id` bigint DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `date_of_rent` date DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `rent_info_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rent_info_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_info`
--

LOCK TABLES `rent_info` WRITE;
/*!40000 ALTER TABLE `rent_info` DISABLE KEYS */;
INSERT INTO `rent_info` VALUES (14,'IN RENT',1,1,'2020-02-07'),(15,'RETURNED',4,1,'2020-02-07'),(16,'IN RENT',3,8,'2020-02-07'),(17,'IN RENT',9,8,'2020-02-07');
/*!40000 ALTER TABLE `rent_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_LIBRARIAN'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$JVSBAdAcUOJHnJq88cZ/3OScNCuo.6nPgclkFOMjgJvv4aOSv8Dl.','Admin','Admin','admin@testmail.com'),(2,'testlibrarian','$2a$10$RKcRgZ43X1QCJUQhM.q.g.Fx8.wPYoEI8QMnlPBXc4vYCfnpbkR0.','Testlibrarian','Testlibrarian','testlibrarian@testmail.com'),(3,'keanu','$2a$10$cNLFNM3geL6PGRjBwTKOcebhIGb3JKcH.BqIO0VGnrv2UIMCJoc9O','Keanu','Reeves','keanu@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ROLE_idx` (`role_id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,1),(1,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-07 17:15:54
