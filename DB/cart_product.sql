CREATE DATABASE  IF NOT EXISTS `cart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cart`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cart
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pId` int NOT NULL AUTO_INCREMENT,
  `pDescription` varchar(3000) DEFAULT NULL,
  `pDiscount` int NOT NULL,
  `pName` varchar(255) DEFAULT NULL,
  `pPhoto` varchar(255) DEFAULT NULL,
  `pPrice` int NOT NULL,
  `pQuantity` int NOT NULL,
  `category_categoryID` int DEFAULT NULL,
  PRIMARY KEY (`pId`),
  KEY `FK987q0koesbyk7oqky7lg431xr` (`category_categoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'this is a test',10,'shoe ','shoes.jpg',24,2,1),(2,'This is a shoe',5,'Shoe1','shoes.jpg',25,5,1),(3,'test test',5,'Test','shoes.jpg',24,5,1),(4,'this is another test',20,'Another test','valentines day.jpg',50,10,2),(5,'this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test this is a test ',10,'Test','theGOAT.jpg',25,5,2),(6,'fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs fsdfsdfdsfsdfs ',25,'Valentines day card','valentines day.jpg',100,5,2),(7,'A hip T-shirt with acdc logo ',10,'Acdc T-Shirt','acdc.jpg',40,10,2),(8,'A button down shirt for all your events whether casual or formal. You can still rock it!',15,'Button down ','buttondown.jpg',70,10,2),(9,'A well rounded sneaker to fit all kinds of occasions!',10,'Nike sneaker','nike shoe.jpg',125,5,1),(10,'An all time favourite! Ready to go with a pair of jean of pants!',15,'Adidas sneaker','adidas.jpg',140,5,1),(13,'Button down',15,'Button down ','buttondown.jpg',25,8,2),(12,'This is a sneaker',10,'Sneaker','3.PNG',50,10,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 13:12:36
