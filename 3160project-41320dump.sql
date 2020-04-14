-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campus_eats
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
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `license_number` varchar(75) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `fk_D_student_id` (`student_id`),
  CONSTRAINT `fk_D_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (101,1,'fi3980','2019-06-29',4),(201,2,'js4003','2020-02-15',5),(301,3,'do7654','2019-06-29',4),(401,4,'sm9475','2020-02-15',5),(501,5,'qh1735','2019-06-29',4),(601,6,'jd9355','2020-02-15',5),(701,7,'hr9265','2019-06-29',4),(801,8,'wj2346','2020-02-15',5);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL,
  `title` varchar(75) DEFAULT NULL,
  `degree_college` varchar(75) DEFAULT NULL,
  `highest_degree` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  CONSTRAINT `fk_F_person_id` FOREIGN KEY (`faculty_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (26,'Assistant Professor','UF','PhD'),(27,'Professor','SJSU','Master'),(28,'Adjunct Professor','UNCC','Master'),(29,'Professor','UNCC','PhD');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(45) DEFAULT NULL,
  `location_address` varchar(150) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `items` longtext,
  `total_price` double DEFAULT NULL,
  `delivery_charge` int DEFAULT NULL,
  `delivery_time` date DEFAULT NULL,
  `driver_id` int NOT NULL,
  `location_id` int NOT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_driver1_idx` (`driver_id`),
  KEY `fk_order_location1_idx` (`location_id`),
  KEY `fk_order_person1_idx` (`person_id`),
  CONSTRAINT `fk_order_driver1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `fk_order_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_order_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `person_name` varchar(300) DEFAULT NULL,
  `person_email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Kelvin Gibbons','kgibbons@uncc.edu'),(2,'Jan Barrow','jbarrow@uncc.edu'),(3,'Josie Whitehead','jwhitehead@uncc.edu'),(4,'Noah Griffiths','ngriffiths@uncc.edu'),(5,'Chardonnay Melendez','cmelendez@uncc.edu'),(6,'Kendall Wilde','kwilde@uncc.edu'),(7,'Sarah Mann','smann@uncc.edu'),(8,'Mcauley Maxwell','mmaxwell@uncc.edu'),(26,'Savanna Liu','sliu@uncc.edu'),(27,'Lillie-Rose Charlton','lrcharlton@uncc.edu'),(28,'Fred Hammond','fhammond@uncc.edu'),(29,'Alberto Fernandez','afernandez@uncc.edu'),(39,'Nafisa Haynes','nhaynes@uncc.edu'),(46,'Amelia-Lily Lott','allott@uncc.edu'),(47,'Kai Hussain','khussain@uncc.edu'),(48,'Rocky Reeves','rreeves@uncc.edu');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resturant`
--

DROP TABLE IF EXISTS `resturant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resturant` (
  `resturant_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(45) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `schedule` varchar(45) DEFAULT NULL,
  `restuant_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`resturant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resturant`
--

LOCK TABLES `resturant` WRITE;
/*!40000 ALTER TABLE `resturant` DISABLE KEYS */;
INSERT INTO `resturant` VALUES (1,'1 Main St','www.islandgrill.com','M-F 8am-9pm','Island Grill'),(2,'10 S. Orchard Rd.','www.veganiccorner.com','Every Day 12pm-11pm','Veganic Corner'),(3,'15 Lincoln Rd','www.pancakeworld.com','T-S 5am-2pm','Pancake World'),(4,'857 Milton St','www.grandmassweets.com','Every Day 7am-5pm','Grandma’s Sweets'),(5,'2897 Beaufort Rd','www.whisperingbamboo.com','Every Day 12pm-2am','Whispering Bamboo'),(6,'3749  Willow Way','www.greenanicsmoothies.com','M-F 7am-8pm','Greenanic Smoothies'),(7,'1273 Hill St','www.macrobites.com','Th-S 8am-5pm','Macro Bites'),(8,'3 Elizabeth Rd','www.easyeats.com','Every Day 5pm-12am','Easy Eats'),(9,'967 Fairfield Ct','www.fareandfeed.com','M-F 10am-9pm','Fare & Feed'),(10,'986 Crescent Rd','www.eatable.com','Every Day 24/7','Eatable');
/*!40000 ALTER TABLE `resturant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `position` varchar(75) DEFAULT NULL,
  `is_admin` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `fk_Staff_person_id` FOREIGN KEY (`staff_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (2,'Lab Assistant','N'),(4,'Teaching Assistant','N'),(26,'VP Acad Affairs','Y'),(28,'Dean Engineering','Y');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL,
  `graduation_year` int DEFAULT NULL,
  `major` varchar(75) DEFAULT NULL,
  `type` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `fk_Student_person_id` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,2021,'Philosophy','Undergraduate'),(2,2020,'Accounting','Undergraduate'),(3,2017,'Electronics','Graduate'),(4,2018,'Computer Science','Graduate'),(5,2022,'Economics','Undergraduate'),(6,2017,'Mechanical Engineering','Undergraduate'),(7,2015,'Nursing','Graduate'),(8,2020,'Chemistry','Graduate');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'campus_eats'
--

--
-- Dumping routines for database 'campus_eats'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14 16:36:27
