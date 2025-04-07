-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: BD
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passw` varchar(255) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','$A$005$=[W}pW;[.\nB 0tkg8MT/CN474cGEczaSrdgZyq67fuUaReJy1N3uVOEBmz3'),(2,'user10','$A$005$p(*qf5j\n<e%n|pAi<]O8eh.Bbtc4B3yJam33lmO0zLzoxzn0xyFsdSntJ.3/a4'),(3,'user2','$A$005$y!>f=@hr2NHCFGCHssz5axoOR8g.gOWlctUsS0W9lEwswIczu02s2.9'),(4,'user3','$A$005$_%XvFR	7M?aIl\n9.61gNf6scLW8cKonNxge4iyjFSwdp3uY4Fm3ns3sJL7X09'),(5,'user4','$A$005$S.%)t\'!E#6__/rqhhldVmXSSGENijlC8KhWQCEFUUNir1NzcDDoiA9ynLMzA'),(6,'user5','$A$005$Fd\nKpmEVA}s4(8/epSKx9sN7FIwUfy2ABh9f6uwCYk5NzuipCm.9K.mb79'),(7,'user6','$A$005$.}M|`U/5k6#[fHx\nrvI0JCkqGW0ioLxzXLiAT/rSqQQMI9FRsvrVH0hyaXvK/'),(8,'user7','$A$005$eJUJ\';(h7#,>dZqW\rfRGtIi7lQUq2O8gig1z8gB81YCwmU42sWMVV2IeYug9D'),(9,'user8','$A$005$[yv]Kq\\XOzF2*>K\"W0VTmbpw6lwATGaTOvczpNeETrrEQEKMgL9/H0olRU1'),(10,'user9','$A$005$X=e.dTeY;O%P?&x]%Heyi1PC9DkccZ002OZYo7ZMTMMdbOEhlNUcy612rld2');
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

-- Dump completed on 2025-04-07 20:21:24
