CREATE DATABASE  IF NOT EXISTS `pipeline_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pipeline_management`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pipeline_management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Temporary view structure for view `account_value_distribution`
--

DROP TABLE IF EXISTS `account_value_distribution`;
/*!50001 DROP VIEW IF EXISTS `account_value_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `account_value_distribution` AS SELECT 
 1 AS `account_name`,
 1 AS `total_opportunity_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dim_currency`
--

DROP TABLE IF EXISTS `dim_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_currency` (
  `currency_code` varchar(10) NOT NULL,
  `currency_name` varchar(100) DEFAULT 'Unknown',
  `currency_rate` decimal(12,5) DEFAULT NULL,
  `c__createddate` date DEFAULT (curdate()),
  PRIMARY KEY (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_currency`
--

LOCK TABLES `dim_currency` WRITE;
/*!40000 ALTER TABLE `dim_currency` DISABLE KEYS */;
INSERT INTO `dim_currency` VALUES ('AUD','Australian Dollar',0.77000,'2024-06-05'),('CNY','Chinese Yuan',0.16000,'2024-04-25'),('INR','Indian Rupee',0.01400,'2024-01-10'),('JPY','Japanese Yen',0.00930,'2024-02-15'),('KRW','South Korean Won',0.00088,'2024-03-20'),('NZD','New Zealand Dollar',0.71000,'2024-07-10'),('PHP','Philippine Peso',0.02000,'2024-07-15'),('SGD','Singapore Dollar',0.74000,'2024-05-30'),('THB','Thai Baht',0.03200,'2024-08-15'),('TWD','New Taiwan Dollar',0.03600,'2024-08-15'),('USD','United States Dollar',1.00000,'2023-04-10');
/*!40000 ALTER TABLE `dim_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_users`
--

DROP TABLE IF EXISTS `dim_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `u__email` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT 'User_Name',
  `last_name` varchar(50) DEFAULT 'User_LastName',
  `u__createddate` date DEFAULT (curdate()),
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `u__type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_users`
--

LOCK TABLES `dim_users` WRITE;
/*!40000 ALTER TABLE `dim_users` DISABLE KEYS */;
INSERT INTO `dim_users` VALUES (1,'john@management.com','John','Doe','2023-01-01',1,'Reseller'),(2,'marta_gomez@management.com','Marta','Gomez','2023-07-01',1,'Sales Rep'),(3,'fer_rodriguez@management.com','Fernando','Rodriguez','2023-12-01',1,'Technician'),(4,'emma@management.com','Emma','Johnson','2023-03-20',1,'Reseller'),(5,'david_wong@management.com','David','Wong','2023-04-25',1,'Technician'),(6,'laura_smith@management.com','Laura','Smith','2023-05-30',1,'Sales Rep'),(7,'alex@management.com','Alex','Martinez','2023-06-05',1,'Technician'),(8,'jessica@management.com','Jessica','Brown','2023-07-10',1,'Reseller'),(9,'michael@management.com','Michael','Davis','2023-08-15',1,'Sales Rep'),(10,'sophia@management.com','Sophia','Wilson','2023-09-20',1,'Reseller'),(11,'adam@management.com','Adam','Anderson','2023-10-25',1,'Technician'),(12,'olivia@management.com','Olivia','Taylor','2023-11-30',1,'Sales Rep'),(13,'william@management.com','William','Thomas','2023-12-05',1,'Reseller'),(14,'emily@management.com','Emily','Harris','2024-01-10',1,'Sales Rep'),(15,'james@management.com','James','Walker','2024-02-15',1,'Technician'),(16,'ava@management.com','Ava','White','2024-03-20',1,'Reseller'),(17,'benjamin@management.com','Benjamin','Jackson','2024-04-25',1,'Sales Rep'),(18,'harper@management.com','Harper','Moore','2024-05-30',1,'Technician'),(19,'emma@management.com','Emma','Martinez','2024-06-05',1,'Reseller'),(20,'logan@management.com','Logan','Lee','2024-07-10',1,'Sales Rep'),(21,'grace@management.com','Grace','Perez','2024-08-15',1,'Technician'),(22,'noah@management.com','Noah','Gonzalez','2024-09-20',1,'Reseller'),(23,'chloe@management.com','Chloe','Rodriguez','2024-10-25',1,'Sales Rep');
/*!40000 ALTER TABLE `dim_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts_account`
--

DROP TABLE IF EXISTS `facts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facts_account` (
  `accountid` int NOT NULL AUTO_INCREMENT,
  `a__name` varchar(255) DEFAULT 'NAME',
  `a__number` varchar(50) DEFAULT '5324534_NB',
  `a__country` varchar(50) DEFAULT 'Uruguay',
  `primary_contactid` int NOT NULL,
  `a__createddate` date DEFAULT (curdate()),
  PRIMARY KEY (`accountid`),
  KEY `primary_contactid` (`primary_contactid`),
  CONSTRAINT `facts_account_ibfk_1` FOREIGN KEY (`primary_contactid`) REFERENCES `dim_users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_account`
--

LOCK TABLES `facts_account` WRITE;
/*!40000 ALTER TABLE `facts_account` DISABLE KEYS */;
INSERT INTO `facts_account` VALUES (1,'ABC Corporation','ABC123','United States',1,'2021-05-15'),(2,'XYZ Enterprises','XYZ456','Canada',2,'2021-06-20'),(3,'123 Industries','123789','United Kingdom',3,'2021-07-25'),(4,'123 Industries','123789','United Kingdom',3,'2021-07-25'),(5,'PQR Solutions','PQR123','India',4,'2021-11-15'),(6,'LMN Tech','LMN789','Japan',5,'2021-12-20'),(7,'XYZ Innovations','XYZ789','South Korea',6,'2022-01-25'),(8,'ABC Tech','ABC123','China',7,'2022-02-10'),(9,'EFG Innovations','EFG456','Singapore',8,'2022-03-15'),(10,'GHI Solutions','GHI789','Australia',9,'2022-04-20'),(11,'JKL Tech','JKL123','New Zealand',10,'2022-05-25'),(12,'MNO Innovations','MNO456','Taiwan',11,'2022-06-10'),(13,'RST Solutions','RST789','Philippines',12,'2022-07-15'),(14,'UVW Tech','UVW123','Thailand',13,'2022-08-20'),(15,'QRS Innovations','QRS456','Malaysia',14,'2022-09-25'),(16,'TUV Solutions','TUV789','Vietnam',15,'2022-10-10'),(17,'WXY Tech','WXY123','Indonesia',16,'2022-11-15'),(18,'ZAB Innovations','ZAB456','Myanmar',17,'2022-12-20'),(19,'CDE Tech','CDE789','Cambodia',18,'2023-01-25'),(20,'FGH Innovations','FGH123','Laos',19,'2023-02-10'),(21,'IJK Solutions','IJK456','Bangladesh',20,'2023-03-15'),(22,'LMN Tech','LMN789','Nepal',21,'2023-04-20'),(23,'OPQ Innovations','OPQ123','Pakistan',22,'2023-05-25');
/*!40000 ALTER TABLE `facts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts_opportunities`
--

DROP TABLE IF EXISTS `facts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facts_opportunities` (
  `opportunityid` int NOT NULL AUTO_INCREMENT,
  `accountid` int DEFAULT NULL,
  `ownerid` int DEFAULT NULL,
  `o__name` varchar(150) DEFAULT 'Opportunity_name',
  `o__statusname` varchar(50) DEFAULT 'Stages',
  `o__closeddate` date DEFAULT (curdate()),
  `o__createddate` date DEFAULT (curdate()),
  `o_amount` decimal(10,2) DEFAULT '650000.00',
  `productid` int DEFAULT NULL,
  `currencycode` varchar(10) DEFAULT 'USD',
  PRIMARY KEY (`opportunityid`),
  KEY `ownerid` (`ownerid`),
  KEY `accountid` (`accountid`),
  KEY `fk_opportunity_currency` (`currencycode`),
  CONSTRAINT `facts_opportunities_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `dim_users` (`userid`),
  CONSTRAINT `facts_opportunities_ibfk_2` FOREIGN KEY (`accountid`) REFERENCES `facts_account` (`accountid`),
  CONSTRAINT `fk_opportunity_currency` FOREIGN KEY (`currencycode`) REFERENCES `dim_currency` (`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_opportunities`
--

LOCK TABLES `facts_opportunities` WRITE;
/*!40000 ALTER TABLE `facts_opportunities` DISABLE KEYS */;
INSERT INTO `facts_opportunities` VALUES (1,1,1,'Xaiomi and Dell products USA customer','Won','2024-02-12','2023-04-10',650000.00,1,'USD'),(2,2,2,'Phillips and GM - special discount','Won','2024-02-12','2023-04-10',650000.00,2,'USD'),(3,3,3,'Fashion closthing different size','Won','2024-02-12','2023-04-10',650000.00,3,'USD'),(4,1,1,'Xaiomi and Dell products USA customer','Won','2024-02-12','2023-04-10',650000.00,1,'USD'),(5,2,2,'Phillips and GM - special discount','Won','2024-02-12','2023-04-10',650000.00,2,'USD'),(6,3,3,'Fashion closthing different size','Won','2024-02-12','2023-04-10',650000.00,3,'USD'),(7,1,4,'Software Development Project','Lost','2025-05-15','2024-01-10',650000.00,4,'INR'),(8,2,5,'Tech Consultation Service','Lost','2025-05-15','2024-02-15',650000.00,5,'JPY'),(9,3,6,'Hardware Upgrade Contract','Lost','2025-05-15','2024-03-20',650000.00,6,'KRW'),(10,1,7,'Cloud Services Implementation','Lost','2025-05-15','2024-04-25',650000.00,7,'CNY'),(11,2,8,'AI Integration Project','Lost','2025-05-15','2024-05-30',650000.00,8,'SGD'),(12,3,9,'Digital Marketing Campaign','Lost','2024-09-05','2024-06-05',650000.00,9,'AUD'),(13,1,10,'E-commerce Platform Development','Lost','2025-05-15','2024-07-10',650000.00,10,'NZD'),(14,2,11,'IoT Solutions Implementation','Lost','2025-05-15','2024-08-15',650000.00,11,'TWD'),(15,3,12,'Network Infrastructure Upgrade','Lost','2025-05-15','2024-08-15',650000.00,12,'THB'),(16,1,13,'Mobile App Development','Lost','2025-02-12','2024-07-15',650000.00,13,'PHP'),(17,2,14,'Web Development Project','Lost','2024-10-15','2024-03-15',650000.00,14,'SGD'),(18,3,15,'Database Optimization','Lost','2024-12-15','2024-08-15',650000.00,15,'AUD'),(19,4,3,'New Software Installation Project','Open','2024-05-19','2024-05-19',650000.00,16,'USD');
/*!40000 ALTER TABLE `facts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_technician_opportunities` AFTER INSERT ON `facts_opportunities` FOR EACH ROW BEGIN 
    DECLARE user_type VARCHAR(50);

   
    SELECT u.u__type INTO user_type 
    FROM dim_users u 
    WHERE u.userid = NEW.ownerid;


    IF user_type = 'Technician' THEN
        INSERT INTO technician_opportunity_log (opportunity_id, technician_id, opportunity_name, created_at)
        VALUES (NEW.opportunityid, NEW.ownerid, NEW.o__name, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facts_products`
--

DROP TABLE IF EXISTS `facts_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facts_products` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `product__code` varchar(50) DEFAULT NULL,
  `product__name` varchar(50) DEFAULT NULL,
  `product__type` varchar(50) DEFAULT NULL,
  `serial__number` varchar(150) DEFAULT 'JFSADFA_5345_4267',
  `product__price` decimal(10,2) DEFAULT '450.00',
  `currencycode` varchar(10) DEFAULT 'USD',
  `opportunityid` int NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `opportunityid` (`opportunityid`),
  CONSTRAINT `facts_products_ibfk_1` FOREIGN KEY (`opportunityid`) REFERENCES `facts_opportunities` (`opportunityid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_products`
--

LOCK TABLES `facts_products` WRITE;
/*!40000 ALTER TABLE `facts_products` DISABLE KEYS */;
INSERT INTO `facts_products` VALUES (1,'P1234','Xiaomi phone L2','Electronics','JFSADFA_5345_4267',899.99,'USD',1),(2,'P343536','Tablet Apple','Electronics','JFSADFA_5345_4267',699.99,'USD',1),(3,'P737475','Rice Cooker Zojirushi','Home Appliances','JFSADFA_5345_4267',129.99,'USD',2),(4,'P404142','Adidas Sneakers','Footwear','JFSADFA_5345_4267',129.99,'GBP',3),(5,'P91011','Sara Jeans','Clothing XXL','JFSADFA_5345_4267',49.99,'GBP',3),(6,'P495051','Puma Joggers','Clothing M','JFSADFA_5345_4267',39.99,'CNY',6),(7,'P13234','Computer Dell','Electronics','JFSADFA_5345_4267',750.00,'JPY',4),(8,'P434445','Smart TV Sony','Electronics','JFSADFA_5345_4267',1499.99,'JPY',4),(9,'P464748','Microwave Panasonic','Home Appliances','JFSADFA_5345_4267',149.99,'INR',5),(10,'P4378','Blender Philips','Home Appliances','JFSADFA_5345_4267',5000.00,'INR',5),(11,'P94511','Desigual Sweater','Clothing XXS','JFSADFA_5345_4267',1500.00,'CNY',6),(12,'P495051','Puma Joggers','Clothing M','JFSADFA_5345_4267',39.99,'CNY',6),(13,'P162738','Smartwatch Y3','Electronics','JFSADFA_5345_4267',349.99,'AUD',7),(14,'P525354','Digital Camera Canon','Electronics','JFSADFA_5345_4267',599.99,'AUD',7),(15,'P192021','Refrigerator Samsung','Home Appliances','JFSADFA_5345_4267',899.99,'NZD',8),(16,'P555657','Air Fryer Philips','Home Appliances','JFSADFA_5345_4267',249.99,'NZD',8),(17,'P222324','Levi Jeans','Clothing XL','JFSADFA_5345_4267',59.99,'TWD',9),(18,'P585960','Leather Jacket','Clothing S','JFSADFA_5345_4267',119.99,'TWD',9),(19,'P252627','Laptop HP','Electronics','JFSADFA_5345_4267',899.99,'THB',10),(20,'P616263','Bluetooth Speaker JBL','Electronics','JFSADFA_5345_4267',199.99,'THB',10),(21,'P282930','Toaster KitchenAid','Home Appliances','JFSADFA_5345_4267',13500.00,'SGD',11),(22,'P646566','Vacuum Cleaner Dyson','Home Appliances','JFSADFA_5345_4267',399.99,'SGD',11),(23,'P313233','Nike Hoodie','Clothing L','JFSADFA_5345_4267',79.99,'PHP',12),(24,'P676869','Summer Dress','Clothing XS','JFSADFA_5345_4267',29.99,'PHP',13),(25,'P707172','Wireless Headphones Sony','Electronics','JFSADFA_5345_4267',299.99,'USD',15),(26,'P5678','Fridge GM','Home Appliances','JFSADFA_5345_4267',399.50,'USD',15),(27,'P737475','Rice Cooker Zojirushi','Home Appliances','JFSADFA_5345_4267',129.99,'USD',14);
/*!40000 ALTER TABLE `facts_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `opportunity_status_breakdown`
--

DROP TABLE IF EXISTS `opportunity_status_breakdown`;
/*!50001 DROP VIEW IF EXISTS `opportunity_status_breakdown`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `opportunity_status_breakdown` AS SELECT 
 1 AS `status`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `opportunity_summary`
--

DROP TABLE IF EXISTS `opportunity_summary`;
/*!50001 DROP VIEW IF EXISTS `opportunity_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `opportunity_summary` AS SELECT 
 1 AS `userid`,
 1 AS `account_name`,
 1 AS `account_country`,
 1 AS `full_name`,
 1 AS `opportunityid`,
 1 AS `opportunity_name`,
 1 AS `opportunity_value`,
 1 AS `currencycode`,
 1 AS `o__closeddate`,
 1 AS `o__statusname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `product_performance`
--

DROP TABLE IF EXISTS `product_performance`;
/*!50001 DROP VIEW IF EXISTS `product_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_performance` AS SELECT 
 1 AS `product_type`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sales_target_achieved_log`
--

DROP TABLE IF EXISTS `sales_target_achieved_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_target_achieved_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sales_rep` varchar(255) DEFAULT NULL,
  `total_value` decimal(10,2) DEFAULT NULL,
  `currencycode` varchar(10) DEFAULT 'USD',
  `achieved_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_target_achieved_log`
--

LOCK TABLES `sales_target_achieved_log` WRITE;
/*!40000 ALTER TABLE `sales_target_achieved_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_target_achieved_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician_opportunity_log`
--

DROP TABLE IF EXISTS `technician_opportunity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician_opportunity_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL,
  `technician_id` int DEFAULT NULL,
  `opportunity_name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician_opportunity_log`
--

LOCK TABLES `technician_opportunity_log` WRITE;
/*!40000 ALTER TABLE `technician_opportunity_log` DISABLE KEYS */;
INSERT INTO `technician_opportunity_log` VALUES (1,19,3,'New Software Installation Project','2024-05-20 15:29:41');
/*!40000 ALTER TABLE `technician_opportunity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_sales_reps`
--

DROP TABLE IF EXISTS `top_sales_reps`;
/*!50001 DROP VIEW IF EXISTS `top_sales_reps`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_sales_reps` AS SELECT 
 1 AS `sales_rep_name`,
 1 AS `total_opportunity_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'pipeline_management'
--

--
-- Dumping routines for database 'pipeline_management'
--
/*!50003 DROP FUNCTION IF EXISTS `TotalAmountSoldByCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalAmountSoldByCountry`(country_name VARCHAR(100)) RETURNS decimal(12,2)
    READS SQL DATA
BEGIN
    DECLARE total_amount DECIMAL(12, 2);
    
    SELECT SUM(P.product__price) INTO total_amount
    FROM facts_products P
    JOIN facts_opportunities O ON P.opportunityid = O.opportunityid
    JOIN facts_account A ON O.accountid = A.accountid
    WHERE A.a__country = country_name;
    
    RETURN total_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalOpportunitiesByUserType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalOpportunitiesByUserType`(user_type VARCHAR(50)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_opportunities INT;
    
    SELECT COUNT(*) INTO total_opportunities
    FROM facts_opportunities O
    JOIN dim_users U ON O.ownerid = U.userid
    WHERE U.u__type = user_type;
    
    RETURN total_opportunities;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalSalesInFiscalYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalSalesInFiscalYear`(fiscal_year INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE total_sales DECIMAL(10, 2);

    -- Calculate start and end dates of the fiscal year
    SET start_date = STR_TO_DATE(CONCAT(fiscal_year, '-01-01'), '%Y-%m-%d');
    SET end_date = STR_TO_DATE(CONCAT(fiscal_year, '-12-31'), '%Y-%m-%d');

    -- Calculate total sales
    SELECT SUM(o_amount) INTO total_sales
    FROM facts_opportunities
    WHERE o__closeddate BETWEEN start_date AND end_date;

    RETURN total_sales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccountValueDistribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountValueDistribution`()
BEGIN
    CREATE TEMPORARY TABLE temp_account_value_distribution (
        account_name VARCHAR(255),
        total_opportunity_value DECIMAL(10, 2)
    );

    INSERT INTO temp_account_value_distribution
    SELECT 
        A.a__name AS account_name, 
        SUM(P.product__price) AS total_opportunity_value
    FROM facts_account A
    JOIN facts_opportunities O ON O.accountid = A.accountid
    JOIN facts_products P ON P.opportunityid = O.opportunityid
    GROUP BY A.accountid
    ORDER BY total_opportunity_value DESC;

    SELECT * FROM temp_account_value_distribution;

    DROP TEMPORARY TABLE IF EXISTS temp_account_value_distribution;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMostSoldProductsBySalesRep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMostSoldProductsBySalesRep`()
BEGIN
    SELECT 
        CONCAT(U.first_name, ' ', U.last_name) AS sales_rep_name,
        P.product__name AS product_name,
        COUNT(*) AS total_sold,
        SUM(P.product__price) AS total_value
    FROM dim_users U
    JOIN facts_opportunities O ON O.ownerid = U.userid
    JOIN facts_products P ON P.opportunityid = O.opportunityid
    WHERE O.o__statusname = 'Won'
    GROUP BY U.userid, P.product__name
    ORDER BY total_sold DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateOpportunityStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOpportunityStatus`()
BEGIN
    UPDATE facts_opportunities
    SET o__statusname = 
        CASE 
            WHEN o__closeddate > DATE_ADD(CURDATE(), INTERVAL 90 DAY) THEN 'Lost'
            ELSE o__statusname
        END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `account_value_distribution`
--

/*!50001 DROP VIEW IF EXISTS `account_value_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `account_value_distribution` AS select `a`.`a__name` AS `account_name`,sum(`p`.`product__price`) AS `total_opportunity_value` from ((`facts_account` `a` join `facts_opportunities` `o` on((`o`.`accountid` = `a`.`accountid`))) join `facts_products` `p` on((`p`.`opportunityid` = `o`.`opportunityid`))) group by `a`.`accountid` order by `total_opportunity_value` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `opportunity_status_breakdown`
--

/*!50001 DROP VIEW IF EXISTS `opportunity_status_breakdown`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `opportunity_status_breakdown` AS select `o`.`o__statusname` AS `status`,count(0) AS `count` from `facts_opportunities` `o` group by `o`.`o__statusname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `opportunity_summary`
--

/*!50001 DROP VIEW IF EXISTS `opportunity_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `opportunity_summary` AS select `u`.`userid` AS `userid`,`a`.`a__name` AS `account_name`,`a`.`a__country` AS `account_country`,concat(`u`.`first_name`,' ',`u`.`last_name`) AS `full_name`,`o`.`opportunityid` AS `opportunityid`,`o`.`o__name` AS `opportunity_name`,sum(`p`.`product__price`) AS `opportunity_value`,`o`.`currencycode` AS `currencycode`,`o`.`o__closeddate` AS `o__closeddate`,`o`.`o__statusname` AS `o__statusname` from (((`dim_users` `u` join `facts_account` `a` on((`a`.`primary_contactid` = `u`.`userid`))) join `facts_opportunities` `o` on((`o`.`accountid` = `a`.`accountid`))) join `facts_products` `p` on((`p`.`opportunityid` = `o`.`opportunityid`))) group by `o`.`opportunityid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_performance`
--

/*!50001 DROP VIEW IF EXISTS `product_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_performance` AS select `facts_products`.`product__type` AS `product_type`,sum(`facts_products`.`product__price`) AS `total_revenue` from `facts_products` group by `facts_products`.`product__type` order by `total_revenue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_sales_reps`
--

/*!50001 DROP VIEW IF EXISTS `top_sales_reps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_sales_reps` AS select concat(`u`.`first_name`,' ',`u`.`last_name`) AS `sales_rep_name`,sum(`p`.`product__price`) AS `total_opportunity_value` from ((`dim_users` `u` join `facts_opportunities` `o` on((`o`.`ownerid` = `u`.`userid`))) join `facts_products` `p` on((`p`.`opportunityid` = `o`.`opportunityid`))) where (`o`.`o__statusname` = 'Won') group by `u`.`userid` order by `total_opportunity_value` desc limit 5 */;
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

-- Dump completed on 2024-05-22 18:12:41
