-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bookmark
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookmarklist`
--

DROP TABLE IF EXISTS `bookmarklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarklist` (
  `id` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `bookmarkName` varchar(20) NOT NULL,
  `URL` varchar(512) NOT NULL,
  `createDate` date NOT NULL,
  UNIQUE KEY `id` (`id`,`groupName`,`bookmarkName`),
  CONSTRAINT `bookmarklist_ibfk_1` FOREIGN KEY (`id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarklist`
--

LOCK TABLES `bookmarklist` WRITE;
/*!40000 ALTER TABLE `bookmarklist` DISABLE KEYS */;
INSERT INTO `bookmarklist` VALUES
('honggildong','그룹1','MAVEN REPSITORY','https://mvnrepository.com/','2023-04-20'),
('honggildong','그룹1','구글','https://www.google.com','2023-04-20'),
('honggildong','그룹1','네이버 뉴스','https://newsstand.naver.com/','2023-04-20'),
('honggildong','그룹1','다음','https://www.daum.net','2023-04-20'),
('honggildong','그룹2','Lombok','https://projectlombok.org/','2023-04-20'),
('qkreogh','그룹1','구글 뉴스','https://news.google.com/home?hl=ko&gl=KR&ceid=KR:ko','2023-04-20'),
('qkreogh','그룹1','다음 뉴스','https://news.daum.net/','2023-04-20'),
('swift1234','그룹1','네이버','https://www.naver.com','2023-04-20'),
('swift1234','그룹1','네이버 지도','https://map.naver.com/v5/?c=15,0,0,0,dh','2023-04-20'),
('swift1234','그룹1','카카오 지도','https://map.kakao.com/','2023-04-20');
/*!40000 ALTER TABLE `bookmarklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouplist`
--

DROP TABLE IF EXISTS `grouplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouplist` (
  `id` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `createDate` date NOT NULL,
  UNIQUE KEY `id` (`id`,`groupName`),
  CONSTRAINT `grouplist_ibfk_1` FOREIGN KEY (`id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouplist`
--

LOCK TABLES `grouplist` WRITE;
/*!40000 ALTER TABLE `grouplist` DISABLE KEYS */;
INSERT INTO `grouplist` VALUES
('honggildong','그룹1','2023-04-20'),
('honggildong','그룹2','2023-04-20'),
('qkreogh','그룹1','2023-04-20'),
('swift1234','그룹1','2023-04-20');
/*!40000 ALTER TABLE `grouplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES
('honggildong','123456789','홍길동','010-1111-1111','hong@naver.com','2023-04-20'),
('java1234','123456789','자바','010-5555-5555','java@google.com','2023-04-20'),
('parkmunsoo','123456789','박문수','010-2222-2222','park@daum.net','2023-04-20'),
('qkreogh','123456789','박대호','010-4787-1074','qkreogh0@naver.com','2023-04-20'),
('swift1234','123456789','스위프트','010-4444-4444','swift@naver.com','2023-04-20');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 17:08:57
