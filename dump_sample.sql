-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sample
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
-- Temporary table structure for view `constraint_check`
--

DROP TABLE IF EXISTS `constraint_check`;
/*!50001 DROP VIEW IF EXISTS `constraint_check`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `constraint_check` AS SELECT
 1 AS `constraint_name`,
  1 AS `table_schema`,
  1 AS `table_name`,
  1 AS `constraint_type` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptno` int(2) NOT NULL,
  `dname` varchar(14) DEFAULT NULL,
  `loc` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept2`
--

DROP TABLE IF EXISTS `dept2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept2` (
  `deptno` int(2) NOT NULL,
  `dname` varchar(14) DEFAULT NULL,
  `loc` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept2`
--

LOCK TABLES `dept2` WRITE;
/*!40000 ALTER TABLE `dept2` DISABLE KEYS */;
INSERT INTO `dept2` VALUES
(20,'개발','제주'),
(30,'운영','부산');
/*!40000 ALTER TABLE `dept2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `empno` int(4) NOT NULL,
  `ename` varchar(10) DEFAULT NULL,
  `job` varchar(9) DEFAULT NULL,
  `mgr` int(4) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `sal` decimal(7,2) DEFAULT NULL,
  `comm` decimal(7,2) DEFAULT NULL,
  `deptno` int(2) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES
(7369,'SMITH','CLERK',7902,'2010-12-17',800.00,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'2011-02-20',1600.00,300.00,30),
(7521,'WARD','SALESMAN',7698,'2011-02-22',1250.00,500.00,30),
(7566,'JONES','MANAGER',7839,'2011-04-02',2975.00,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'2011-09-28',1250.00,1400.00,30),
(7698,'BLAKE','MANAGER',7839,'2011-05-01',2850.00,NULL,30),
(7782,'CLARK','MANAGER',7839,'2011-06-09',2450.00,NULL,10),
(7788,'SCOTT','ANALYST',7566,'2017-07-13',3000.00,NULL,20),
(7839,'KING','PRESIDENT',NULL,'2011-11-17',5000.00,NULL,10),
(7844,'TURNER','SALESMAN',7698,'2011-09-08',1500.00,0.00,30),
(7876,'ADAMS','CLERK',7788,'2017-07-13',1100.00,NULL,20),
(7900,'JAMES','CLERK',7698,'2011-12-03',950.00,NULL,30),
(7902,'FORD','ANALYST',7566,'2011-12-03',3000.00,NULL,20),
(7934,'MILLER','CLERK',7782,'2012-01-23',1300.00,NULL,10);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `emp_dept`
--

DROP TABLE IF EXISTS `emp_dept`;
/*!50001 DROP VIEW IF EXISTS `emp_dept`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `emp_dept` AS SELECT
 1 AS `no`,
  1 AS `name`,
  1 AS `deptno`,
  1 AS `dname`,
  1 AS `loc` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salgrade`
--

DROP TABLE IF EXISTS `salgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salgrade` (
  `grade` int(1) DEFAULT NULL,
  `losal` decimal(7,2) DEFAULT NULL,
  `hisal` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salgrade`
--

LOCK TABLES `salgrade` WRITE;
/*!40000 ALTER TABLE `salgrade` DISABLE KEYS */;
INSERT INTO `salgrade` VALUES
(1,700.00,1200.00),
(2,1201.00,1400.00),
(3,1401.00,2000.00),
(4,2001.00,3000.00),
(5,3001.00,9999.00);
/*!40000 ALTER TABLE `salgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_i`
--

DROP TABLE IF EXISTS `table_i`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_i` (
  `deptno` int(2) NOT NULL,
  `dname` varchar(14) DEFAULT NULL,
  `loc` varchar(13) DEFAULT NULL,
  KEY `table_i_idx` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_i`
--

LOCK TABLES `table_i` WRITE;
/*!40000 ALTER TABLE `table_i` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_i` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtb1`
--

DROP TABLE IF EXISTS `testtb1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtb1` (
  `col1` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtb1`
--

LOCK TABLES `testtb1` WRITE;
/*!40000 ALTER TABLE `testtb1` DISABLE KEYS */;
/*!40000 ALTER TABLE `testtb1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `constraint_check`
--

/*!50001 DROP VIEW IF EXISTS `constraint_check`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `constraint_check` AS select `information_schema`.`table_constraints`.`CONSTRAINT_NAME` AS `constraint_name`,`information_schema`.`table_constraints`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`table_constraints`.`TABLE_NAME` AS `table_name`,`information_schema`.`table_constraints`.`CONSTRAINT_TYPE` AS `constraint_type` from `information_schema`.`table_constraints` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emp_dept`
--

/*!50001 DROP VIEW IF EXISTS `emp_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_dept` AS select `emp`.`empno` AS `no`,`emp`.`ename` AS `name`,`emp`.`deptno` AS `deptno`,`dept`.`dname` AS `dname`,`dept`.`loc` AS `loc` from (`emp` join `dept`) where `emp`.`deptno` = `dept`.`deptno` */;
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

-- Dump completed on 2023-04-10 13:05:45
