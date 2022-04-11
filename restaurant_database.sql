CREATE DATABASE  IF NOT EXISTS `restarunt_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restarunt_management`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: restarunt_management
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(455) NOT NULL,
  `password` varchar(455) NOT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `emp_fk_idx` (`empid`),
  CONSTRAINT `emp_fk` FOREIGN KEY (`empid`) REFERENCES `employees` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(455) NOT NULL,
  `location` varchar(1005) DEFAULT NULL,
  `invoiceid` int DEFAULT NULL,
  PRIMARY KEY (`customerid`),
  UNIQUE KEY `customerid_UNIQUE` (`customerid`),
  KEY `fk_invoice_idx` (`invoiceid`),
  CONSTRAINT `fk_inv` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Arun','Coimbatore',1301);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `empid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(455) NOT NULL,
  `salary` int NOT NULL,
  `joiningdate` datetime DEFAULT NULL,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(1000) DEFAULT NULL,
  `designation` varchar(455) DEFAULT NULL,
  PRIMARY KEY (`empid`),
  UNIQUE KEY `idemployees_UNIQUE` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Arun',100000,'2022-04-07 10:26:38','2022-04-07 10:26:38','santhi nagar,avarampalayam,cbe',NULL),(2,'sabarish',1000000,'2022-04-07 10:26:50','2022-04-07 10:26:50','santhi nagar,avarampalayam,cbe',NULL),(3,'megha',10000,'2022-04-07 10:27:03','2022-04-07 10:27:03','santhi nagar,avarampalayam,cbe',NULL),(4,'lakshmika',100000,'2022-04-07 10:27:17','2022-04-07 10:27:17','santhi nagar,avarampalayam,cbe',NULL),(5,'akhil',100000,'2022-04-07 10:27:45','2022-04-07 10:27:45','kondayampalayam,cbe',NULL),(6,'akhilas',100000,'2022-04-08 18:48:32','2022-04-08 18:48:32','kondayampalayam,cbe',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(455) NOT NULL,
  `amount` int NOT NULL,
  `chef` int DEFAULT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fid_UNIQUE` (`fid`),
  KEY `chef_id_idx` (`chef`),
  CONSTRAINT `chef_id` FOREIGN KEY (`chef`) REFERENCES `employees` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Chicken-65',500,1),(2,'Chicken Biryani',800,2);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoiceid` int NOT NULL AUTO_INCREMENT,
  `totalamount` int DEFAULT NULL,
  `saledate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoiceid`),
  UNIQUE KEY `invoiceid_UNIQUE` (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=1302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1800,'2022-04-11 12:50:57'),(1301,1300,'2022-04-11 16:49:27');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `tableid` int DEFAULT NULL,
  `foodid` int NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attender` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `invoiceid` int DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  UNIQUE KEY `orderid_UNIQUE` (`orderid`),
  KEY `fk_id_idx` (`foodid`),
  KEY `cus_id_idx` (`customerid`),
  KEY `emp_id_idx` (`attender`),
  KEY `fk_invoice_idx` (`invoiceid`),
  CONSTRAINT `cus_id` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`),
  CONSTRAINT `emp_id` FOREIGN KEY (`attender`) REFERENCES `employees` (`empid`),
  CONSTRAINT `fk_id` FOREIGN KEY (`foodid`) REFERENCES `food` (`fid`),
  CONSTRAINT `fk_invoice` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'2022-04-11 16:53:33',5,1,1301),(2,1,1,2,'2022-04-11 16:53:50',5,1,1301);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pop`
--

DROP TABLE IF EXISTS `pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pop` (
  `popid` int NOT NULL AUTO_INCREMENT,
  `fid` int NOT NULL,
  `invoiceid` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`popid`),
  UNIQUE KEY `popid_UNIQUE` (`popid`),
  KEY `fd_fk_idx` (`fid`),
  KEY `inv_fk_idx` (`invoiceid`),
  CONSTRAINT `fd_fk` FOREIGN KEY (`fid`) REFERENCES `food` (`fid`),
  CONSTRAINT `inv_fk` FOREIGN KEY (`invoiceid`) REFERENCES `invoice` (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pop`
--

LOCK TABLES `pop` WRITE;
/*!40000 ALTER TABLE `pop` DISABLE KEYS */;
INSERT INTO `pop` VALUES (1,1,1,2),(2,2,1,1);
/*!40000 ALTER TABLE `pop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_reservation`
--

DROP TABLE IF EXISTS `table_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_reservation` (
  `reserveid` int NOT NULL AUTO_INCREMENT,
  `tablenumber` int NOT NULL,
  `customerid` int NOT NULL,
  PRIMARY KEY (`reserveid`),
  UNIQUE KEY `reserveid_UNIQUE` (`reserveid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_reservation`
--

LOCK TABLES `table_reservation` WRITE;
/*!40000 ALTER TABLE `table_reservation` DISABLE KEYS */;
INSERT INTO `table_reservation` VALUES (1,1,1);
/*!40000 ALTER TABLE `table_reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-11 19:15:37
