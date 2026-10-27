-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: panaderia_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `line_group_key` varchar(80) NOT NULL,
  `line_type` enum('sale','bonus','gift','exchange') NOT NULL DEFAULT 'sale',
  `commercial_mode` varchar(20) DEFAULT NULL,
  `capture_mode` enum('quantity','amount') NOT NULL DEFAULT 'quantity',
  `requested_amount` decimal(12,2) DEFAULT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `tax_percent` decimal(5,2) NOT NULL,
  `line_subtotal` decimal(12,2) NOT NULL,
  `line_tax` decimal(12,2) NOT NULL,
  `line_total` decimal(12,2) NOT NULL,
  `commercial_value` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_items_order_group_type` (`order_id`,`line_group_key`,`line_type`),
  KEY `idx_order_items_product` (`product_id`),
  KEY `idx_order_items_order` (`order_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_order_items_amounts` CHECK (((`unit_price` >= 0) and (`tax_percent` >= 0) and (`tax_percent` <= 100) and (`line_subtotal` >= 0) and (`line_tax` >= 0) and (`line_total` >= 0))),
  CONSTRAINT `chk_order_items_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2,2,'legacy-1','sale','sale','quantity',NULL,5.000,20.00,19.00,100.00,19.00,119.00,119.00,'2026-05-25 20:27:30'),(2,3,3,'legacy-2','sale','sale','quantity',NULL,4.000,25.00,19.00,100.00,19.00,119.00,119.00,'2026-05-25 20:28:03'),(3,8,2,'legacy-3','sale','sale','quantity',NULL,11111.000,10.00,19.00,111110.00,21110.90,132220.90,132220.90,'2026-05-28 12:38:30'),(4,8,3,'legacy-4','sale','sale','quantity',NULL,1111.000,25.00,19.00,27775.00,5277.25,33052.25,33052.25,'2026-05-28 12:38:30'),(5,8,6,'legacy-5','sale','sale','quantity',NULL,111.000,1500.00,5.00,166500.00,8325.00,174825.00,174825.00,'2026-05-28 12:38:30'),(6,8,4,'legacy-6','sale','sale','quantity',NULL,1111.000,15.00,19.00,16665.00,3166.35,19831.35,19831.35,'2026-05-28 12:38:30'),(7,8,5,'legacy-7','sale','sale','quantity',NULL,111.000,10000.00,5.00,1110000.00,55500.00,1165500.00,1165500.00,'2026-05-28 12:38:30'),(8,9,5,'legacy-8','sale','sale','quantity',NULL,100.000,10000.00,5.00,1000000.00,50000.00,1050000.00,1050000.00,'2026-05-29 03:56:00'),(9,9,6,'legacy-9','sale','sale','quantity',NULL,100.000,1500.00,5.00,150000.00,7500.00,157500.00,157500.00,'2026-05-29 03:56:00'),(15,10,5,'legacy-15','sale','sale','quantity',NULL,190.000,10000.00,5.00,1900000.00,95000.00,1995000.00,1995000.00,'2026-05-29 03:58:56'),(16,10,6,'legacy-16','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 03:58:56'),(17,10,7,'legacy-17','sale','sale','quantity',NULL,200.000,1500.00,5.00,300000.00,15000.00,315000.00,315000.00,'2026-05-29 03:58:56'),(18,11,4,'legacy-18','sale','sale','quantity',NULL,10.000,15.00,19.00,150.00,28.50,178.50,178.50,'2026-05-29 04:13:56'),(19,11,5,'legacy-19','sale','sale','quantity',NULL,10.000,10000.00,5.00,100000.00,5000.00,105000.00,105000.00,'2026-05-29 04:13:56'),(20,11,6,'legacy-20','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 04:13:56'),(21,11,7,'legacy-21','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 04:13:56'),(23,12,7,'legacy-23','sale','sale','quantity',NULL,5.000,1500.00,5.00,7500.00,375.00,7875.00,7875.00,'2026-05-29 04:25:56'),(24,13,7,'legacy-24','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 04:28:02'),(25,14,6,'legacy-25','sale','sale','quantity',NULL,5.000,1500.00,5.00,7500.00,375.00,7875.00,7875.00,'2026-05-29 04:44:07'),(26,14,4,'legacy-26','sale','sale','quantity',NULL,3.000,15.00,19.00,45.00,8.55,53.55,53.55,'2026-05-29 04:44:07'),(27,14,7,'legacy-27','sale','sale','quantity',NULL,2.000,1500.00,5.00,3000.00,150.00,3150.00,3150.00,'2026-05-29 04:44:07'),(28,15,4,'legacy-28','sale','sale','quantity',NULL,10.000,15.00,19.00,150.00,28.50,178.50,178.50,'2026-05-29 18:06:24'),(29,15,5,'legacy-29','sale','sale','quantity',NULL,10.000,10000.00,5.00,100000.00,5000.00,105000.00,105000.00,'2026-05-29 18:06:24'),(30,15,6,'legacy-30','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 18:06:24'),(31,15,7,'legacy-31','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-05-29 18:06:24'),(32,16,5,'legacy-32','sale','sale','quantity',NULL,100.000,10000.00,5.00,1000000.00,50000.00,1050000.00,1050000.00,'2026-06-01 14:27:06'),(33,16,6,'legacy-33','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-06-01 14:27:06'),(34,16,7,'legacy-34','sale','sale','quantity',NULL,100.000,1500.00,5.00,150000.00,7500.00,157500.00,157500.00,'2026-06-01 14:27:06'),(35,17,4,'legacy-35','sale','sale','quantity',NULL,10.000,15.00,19.00,150.00,28.50,178.50,178.50,'2026-06-01 14:31:02'),(36,17,5,'legacy-36','sale','sale','quantity',NULL,10.000,10000.00,5.00,100000.00,5000.00,105000.00,105000.00,'2026-06-01 14:31:02'),(37,17,7,'legacy-37','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-06-01 14:31:02'),(38,18,8,'legacy-38','sale','sale','quantity',NULL,100.000,10000.00,5.00,1000000.00,50000.00,1050000.00,1050000.00,'2026-06-01 15:09:04'),(39,19,5,'legacy-39','sale','sale','quantity',NULL,200.000,10000.00,5.00,2000000.00,100000.00,2100000.00,2100000.00,'2026-06-01 20:39:00'),(40,19,7,'legacy-40','sale','sale','quantity',NULL,10.000,1500.00,5.00,15000.00,750.00,15750.00,15750.00,'2026-06-01 20:39:00'),(41,19,8,'legacy-41','sale','sale','quantity',NULL,200.000,10000.00,5.00,2000000.00,100000.00,2100000.00,2100000.00,'2026-06-01 20:39:00'),(42,20,10,'legacy-42','sale','sale','amount',5000.00,9.000,501.00,5.00,4509.00,225.45,4734.45,4734.45,'2026-06-11 17:09:30'),(43,20,11,'legacy-43','sale','sale','amount',100000.00,99.000,1001.00,5.00,99099.00,4954.95,104053.95,104053.95,'2026-06-11 17:09:30'),(44,20,12,'legacy-44','sale','sale','amount',200000.00,99.000,2001.00,5.00,198099.00,9904.95,208003.95,208003.95,'2026-06-11 17:09:30'),(45,20,13,'legacy-45','sale','sale','amount',500000.00,99.000,5001.00,5.00,495099.00,24754.95,519853.95,519853.95,'2026-06-11 17:09:30'),(46,20,11,'legacy-46','bonus','bonus','amount',3000.00,2.000,1001.00,5.00,0.00,0.00,0.00,2102.10,'2026-06-11 17:17:34'),(47,21,13,'legacy-47','sale','sale','amount',100000.00,19.000,5001.00,5.00,95019.00,4750.95,99769.95,99769.95,'2026-06-11 21:56:29'),(48,21,13,'legacy-48','bonus','bonus','quantity',NULL,1.000,5001.00,5.00,0.00,0.00,0.00,5251.05,'2026-06-11 21:56:29'),(49,21,14,'legacy-49','sale','sale','amount',10000.00,5.000,2000.00,5.00,10000.00,500.00,10500.00,10500.00,'2026-06-11 21:56:29'),(50,21,15,'legacy-50','sale','sale','amount',80000.00,26.000,2999.00,5.00,77974.00,3898.70,81872.70,81872.70,'2026-06-11 21:56:29'),(51,21,15,'legacy-51','bonus','bonus','quantity',NULL,5.000,2999.00,5.00,0.00,0.00,0.00,15744.75,'2026-06-11 21:56:29'),(52,22,13,'legacy-52','sale','sale','amount',50000.00,9.000,5001.00,5.00,45009.00,2250.45,47259.45,47259.45,'2026-06-11 21:59:51'),(53,22,13,'legacy-53','bonus','bonus','quantity',NULL,1.000,5001.00,5.00,0.00,0.00,0.00,5251.05,'2026-06-11 21:59:51'),(54,22,15,'legacy-54','sale','sale','amount',50000.00,16.000,2999.00,5.00,47984.00,2399.20,50383.20,50383.20,'2026-06-11 21:59:51'),(55,22,15,'legacy-55','bonus','bonus','quantity',NULL,3.000,2999.00,5.00,0.00,0.00,0.00,9446.85,'2026-06-11 21:59:51'),(56,22,10,'legacy-56','sale','sale','amount',50000.00,99.000,501.00,5.00,49599.00,2479.95,52078.95,52078.95,'2026-06-11 21:59:51'),(59,23,14,'legacy-59','sale','sale','amount',10000.00,5.000,2000.00,5.00,10000.00,500.00,10500.00,10500.00,'2026-06-25 17:49:56'),(60,23,14,'legacy-60','bonus','bonus','quantity',NULL,1.000,2000.00,5.00,0.00,0.00,0.00,2100.00,'2026-06-25 17:49:56'),(61,23,15,'legacy-61','sale','sale','amount',12000.00,4.000,2999.00,5.00,11996.00,599.80,12595.80,12595.80,'2026-06-25 17:49:56'),(62,23,10,'legacy-62','sale','sale','amount',10000.00,19.000,501.00,5.00,9519.00,475.95,9994.95,9994.95,'2026-06-25 17:49:56'),(63,23,11,'legacy-63','sale','sale','amount',10000.00,9.000,1001.00,5.00,9009.00,450.45,9459.45,9459.45,'2026-06-25 17:49:56'),(64,23,12,'legacy-64','bonus','bonus','amount',8000.00,3.000,2001.00,5.00,0.00,0.00,0.00,6303.15,'2026-06-25 17:49:56'),(66,24,15,'legacy-66','sale','sale','quantity',NULL,100.000,2999.00,5.00,299900.00,14995.00,314895.00,314895.00,'2026-06-25 20:54:24'),(69,25,15,'legacy-69','sale','sale','amount',10000.00,3.000,2999.00,5.00,8997.00,449.85,9446.85,9446.85,'2026-06-25 22:22:57'),(70,25,14,'legacy-70','sale','sale','amount',10000.00,5.000,2000.00,5.00,10000.00,500.00,10500.00,10500.00,'2026-06-25 22:22:57'),(71,25,10,'legacy-71','sale','sale','amount',100000.00,199.000,501.00,5.00,99699.00,4984.95,104683.95,104683.95,'2026-06-25 22:22:57'),(72,26,14,'legacy-72','sale','sale','amount',20000.00,10.000,2000.00,5.00,20000.00,1000.00,21000.00,21000.00,'2026-06-26 13:24:39'),(73,26,15,'legacy-73','sale','sale','amount',20000.00,6.000,2999.00,5.00,17994.00,899.70,18893.70,18893.70,'2026-06-26 13:24:39'),(74,26,10,'legacy-74','sale','sale','amount',10000.00,19.000,501.00,5.00,9519.00,475.95,9994.95,9994.95,'2026-06-26 13:24:39'),(75,26,11,'legacy-75','sale','sale','amount',2000.00,1.000,1001.00,5.00,1001.00,50.05,1051.05,1051.05,'2026-06-26 13:24:39'),(76,26,12,'legacy-76','sale','sale','amount',8000.00,3.000,2001.00,5.00,6003.00,300.15,6303.15,6303.15,'2026-06-26 13:24:39'),(77,27,11,'legacy-77','sale','sale','amount',10000.00,9.000,1001.00,5.00,9009.00,450.45,9459.45,9459.45,'2026-07-04 04:08:08'),(78,27,14,'legacy-78','sale','sale','amount',50000.00,25.000,2000.00,5.00,50000.00,2500.00,52500.00,52500.00,'2026-07-04 04:08:08'),(79,27,15,'legacy-79','bonus','bonus','amount',11000.00,3.000,2999.00,5.00,0.00,0.00,0.00,9446.85,'2026-07-04 04:08:08'),(80,27,12,'legacy-80','bonus','bonus','amount',2945.00,1.000,2001.00,5.00,0.00,0.00,0.00,2101.05,'2026-07-04 04:08:08'),(81,28,10,'legacy-81','sale','sale','amount',100000.00,199.000,501.00,5.00,99699.00,4984.95,104683.95,104683.95,'2026-07-04 04:09:35'),(82,29,11,'legacy-82','sale','sale','amount',10000.00,9.000,1001.00,5.00,9009.00,450.45,9459.45,9459.45,'2026-07-04 04:33:06'),(83,29,15,'legacy-83','sale','sale','amount',10000.00,3.000,2999.00,5.00,8997.00,449.85,9446.85,9446.85,'2026-07-04 04:33:06'),(84,30,14,'legacy-84','sale','sale','amount',10000.00,5.000,2000.00,5.00,10000.00,500.00,10500.00,10500.00,'2026-07-04 14:26:39'),(85,31,14,'legacy-85','sale','sale','amount',10000.00,5.000,2000.00,5.00,10000.00,500.00,10500.00,10500.00,'2026-07-04 14:31:33'),(86,32,11,'legacy-86','sale','sale','amount',8000.00,7.000,1001.00,5.00,7007.00,350.35,7357.35,7357.35,'2026-07-14 21:07:42'),(87,32,15,'legacy-87','sale','sale','quantity',NULL,8.000,2999.00,5.00,23992.00,1199.60,25191.60,25191.60,'2026-07-14 21:07:42'),(90,33,15,'legacy-90','sale','sale','amount',50000.00,16.000,2999.00,5.00,47984.00,2399.20,50383.20,50383.20,'2026-07-15 05:03:01'),(91,33,11,'legacy-91','sale','sale','amount',10000.00,9.000,1001.00,5.00,9009.00,450.45,9459.45,9459.45,'2026-07-15 05:03:01'),(92,33,12,'legacy-92','sale','sale','amount',10000.00,4.000,2001.00,5.00,8004.00,400.20,8404.20,8404.20,'2026-07-15 05:03:01'),(93,34,10,'legacy-93','sale','sale','amount',10000.00,19.000,501.00,5.00,9519.00,475.95,9994.95,9994.95,'2026-07-31 15:05:37'),(104,35,11,'legacy-104','sale','sale','amount',200000.00,199.000,1001.00,5.00,199199.00,9959.95,209158.95,209158.95,'2026-08-03 18:37:14'),(110,35,14,'legacy-110','sale','sale','amount',50000.00,25.000,2000.00,5.00,50000.00,2500.00,52500.00,52500.00,'2026-08-03 18:43:59'),(113,35,11,'legacy-113','bonus','bonus','quantity',NULL,39.000,1001.00,5.00,0.00,0.00,0.00,40990.95,'2026-08-03 18:44:11'),(114,36,14,'legacy-114','sale','sale','amount',100000.00,50.000,2000.00,5.00,100000.00,5000.00,105000.00,105000.00,'2026-08-03 18:58:31'),(115,36,14,'legacy-115','bonus','bonus','quantity',NULL,10.000,2000.00,5.00,0.00,0.00,0.00,21000.00,'2026-08-03 18:58:31'),(116,37,10,'legacy-116','sale','sale','amount',100000.00,199.000,501.00,5.00,99699.00,4984.95,104683.95,104683.95,'2026-08-03 18:58:45'),(117,37,11,'legacy-117','sale','sale','amount',100000.00,99.000,1001.00,5.00,99099.00,4954.95,104053.95,104053.95,'2026-08-03 18:58:45'),(118,38,10,'legacy-118','sale','sale','amount',20000.00,39.000,501.00,5.00,19539.00,976.95,20515.95,20515.95,'2026-08-03 19:01:36'),(119,39,15,'legacy-119','sale','sale','amount',344545.00,114.000,2999.00,5.00,341886.00,17094.30,358980.30,358980.30,'2026-08-03 19:01:46'),(120,40,12,'legacy-120','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 14:33:10'),(121,40,12,'legacy-121','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 14:33:10'),(122,41,14,'legacy-122','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 14:33:52'),(123,41,14,'legacy-123','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 14:33:52'),(124,41,12,'legacy-124','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 14:33:52'),(125,41,12,'legacy-125','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 14:33:52'),(126,42,14,'legacy-126','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 14:41:43'),(127,42,14,'legacy-127','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 14:41:43'),(128,43,12,'legacy-128','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 16:36:29'),(129,43,12,'legacy-129','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 16:36:29'),(130,44,12,'legacy-130','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-20 16:37:04'),(131,44,12,'legacy-131','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-20 16:37:04'),(132,45,11,'legacy-132','sale','sale','amount',170000.00,169.000,1001.00,5.00,161904.76,8095.24,170000.00,170000.00,'2026-08-20 16:50:50'),(133,45,11,'legacy-133','bonus','bonus','quantity',NULL,33.000,1001.00,5.00,0.00,0.00,0.00,34684.65,'2026-08-20 16:50:50'),(134,45,12,'legacy-134','sale','sale','amount',50000.00,25.000,2000.00,0.00,50000.00,0.00,50000.00,50000.00,'2026-08-20 16:50:50'),(135,45,12,'legacy-135','bonus','bonus','quantity',NULL,5.000,2000.00,0.00,0.00,0.00,0.00,10000.00,'2026-08-20 16:50:50'),(136,46,15,'legacy-136','sale','sale','amount',50000.00,16.000,2999.00,5.00,47619.05,2380.95,50000.00,50000.00,'2026-08-20 16:51:15'),(137,46,15,'legacy-137','bonus','bonus','quantity',NULL,3.000,2999.00,5.00,0.00,0.00,0.00,9446.85,'2026-08-20 16:51:15'),(138,46,14,'legacy-138','sale','sale','amount',80000.00,40.000,2000.00,0.00,80000.00,0.00,80000.00,80000.00,'2026-08-20 16:51:15'),(139,47,14,'legacy-139','sale','sale','amount',50000.00,25.000,2000.00,0.00,50000.00,0.00,50000.00,50000.00,'2026-08-21 17:49:57'),(140,47,15,'legacy-140','bonus','bonus','amount',12000.00,4.000,3000.00,5.00,0.00,0.00,0.00,12600.00,'2026-08-21 17:49:57'),(141,48,14,'legacy-141','bonus','bonus','amount',800000.00,400.000,2000.00,0.00,0.00,0.00,0.00,800000.00,'2026-08-21 17:51:40'),(142,48,12,'legacy-142','sale','sale','amount',70000.00,35.000,2000.00,0.00,70000.00,0.00,70000.00,70000.00,'2026-08-21 17:51:40'),(143,49,12,'legacy-143','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-22 14:23:35'),(144,49,12,'legacy-144','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:23:35'),(145,49,11,'legacy-145','bonus','bonus','amount',2000.00,2.000,1000.00,5.00,0.00,0.00,0.00,2100.00,'2026-08-22 14:23:35'),(146,49,15,'legacy-146','sale','sale','amount',6000.00,2.000,3000.00,0.00,6000.00,0.00,6000.00,6000.00,'2026-08-22 14:23:35'),(147,50,12,'legacy-147','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-22 14:31:31'),(148,50,12,'legacy-148','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:31:31'),(149,50,11,'legacy-149','bonus','bonus','amount',2000.00,2.000,1000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:31:31'),(150,50,15,'legacy-150','sale','sale','amount',6000.00,2.000,3000.00,0.00,6000.00,0.00,6000.00,6000.00,'2026-08-22 14:31:31'),(151,51,14,'legacy-151','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-22 14:39:34'),(152,51,14,'legacy-152','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:39:34'),(153,51,12,'legacy-153','bonus','bonus','amount',2000.00,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:39:34'),(154,52,12,'legacy-154','sale','sale','amount',10000.00,5.000,2000.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-08-22 14:56:56'),(155,52,14,'legacy-155','bonus','bonus','amount',4000.00,2.000,2000.00,0.00,0.00,0.00,0.00,4000.00,'2026-08-22 14:56:56'),(156,52,10,'legacy-156','sale','sale','amount',10000.00,20.000,500.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-08-22 14:56:56'),(157,52,10,'legacy-157','bonus','bonus','quantity',NULL,4.000,500.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-22 14:56:56'),(158,53,14,'legacy-158','sale','sale','amount',90000.00,45.000,2000.00,0.00,90000.00,0.00,90000.00,90000.00,'2026-08-24 14:20:19'),(159,53,15,'legacy-159','exchange','exchange','amount',10000.00,3.000,3000.00,0.00,0.00,0.00,0.00,10000.00,'2026-08-24 14:20:19'),(160,54,14,'legacy-160','sale','sale','amount',50000.00,25.000,2000.00,0.00,50000.00,0.00,50000.00,50000.00,'2026-08-25 15:45:40'),(161,54,14,'legacy-161','bonus','bonus','quantity',NULL,5.000,2000.00,0.00,0.00,0.00,0.00,10000.00,'2026-08-25 15:45:40'),(162,54,15,'legacy-162','sale','sale','amount',60000.00,20.000,3000.00,0.00,60000.00,0.00,60000.00,60000.00,'2026-08-25 15:45:40'),(163,55,14,'legacy-163','sale','sale','amount',400000.00,200.000,2000.00,0.00,400000.00,0.00,400000.00,400000.00,'2026-08-25 15:56:50'),(164,55,14,'legacy-164','bonus','bonus','quantity',NULL,40.000,2000.00,0.00,0.00,0.00,0.00,80000.00,'2026-08-25 15:56:50'),(165,55,15,'legacy-165','sale','sale','amount',90000.00,30.000,3000.00,0.00,90000.00,0.00,90000.00,90000.00,'2026-08-25 15:56:50'),(166,55,12,'legacy-166','sale','sale','amount',90000.00,45.000,2000.00,0.00,90000.00,0.00,90000.00,90000.00,'2026-08-25 15:56:50'),(167,56,14,'legacy-167','sale','sale','amount',50000.00,25.000,2000.00,0.00,50000.00,0.00,50000.00,50000.00,'2026-08-25 16:06:59'),(168,56,14,'legacy-168','bonus','bonus','quantity',NULL,5.000,2000.00,0.00,0.00,0.00,0.00,10000.00,'2026-08-25 16:06:59'),(169,56,15,'legacy-169','sale','sale','amount',60000.00,20.000,3000.00,0.00,60000.00,0.00,60000.00,60000.00,'2026-08-25 16:06:59'),(170,56,12,'legacy-170','sale','sale','amount',160000.00,80.000,2000.00,0.00,160000.00,0.00,160000.00,160000.00,'2026-08-25 16:06:59'),(171,56,12,'legacy-171','bonus','bonus','quantity',NULL,16.000,2000.00,0.00,0.00,0.00,0.00,32000.00,'2026-08-25 16:06:59'),(172,56,11,'legacy-172','sale','sale','amount',9000.00,9.000,1000.00,0.00,9000.00,0.00,9000.00,9000.00,'2026-08-25 16:06:59'),(173,57,14,'legacy-173','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-26 14:42:58'),(174,57,14,'legacy-174','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-26 14:42:58'),(175,58,12,'legacy-175','sale','sale','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-08-26 15:32:09'),(176,58,12,'legacy-176','bonus','bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-08-26 15:32:09'),(177,59,12,'legacy-177','sale','sale','amount',80000.00,40.000,2000.00,0.00,80000.00,0.00,80000.00,80000.00,'2026-08-26 15:36:34'),(178,60,14,'legacy-178','gift','gift','amount',6000.00,3.000,2000.00,0.00,0.00,0.00,0.00,6000.00,'2026-08-26 19:53:25'),(179,60,15,'legacy-179','sale','sale','amount',6000.00,2.000,3000.00,0.00,6000.00,0.00,6000.00,6000.00,'2026-08-26 19:53:25'),(180,60,14,'legacy-180','exchange','exchange','amount',4000.00,2.000,2000.00,0.00,0.00,0.00,0.00,4000.00,'2026-08-26 20:04:24'),(181,60,10,'legacy-181','sale','sale','amount',6000.00,12.000,500.00,0.00,6000.00,0.00,6000.00,6000.00,'2026-08-26 20:04:42'),(182,60,10,'legacy-182','bonus','bonus','quantity',NULL,3.000,500.00,0.00,0.00,0.00,0.00,1500.00,'2026-08-26 20:04:42'),(183,61,9,'legacy-183','sale','sale','amount',200000.00,133.000,1500.00,5.00,190476.19,9523.81,200000.00,200000.00,'2026-08-27 14:03:03'),(184,61,9,'legacy-184','bonus','bonus','quantity',NULL,26.000,1500.00,5.00,0.00,0.00,0.00,40950.00,'2026-08-27 14:03:03'),(185,62,9,'legacy-185','sale','sale','quantity',NULL,500.000,1500.00,5.00,750000.00,37500.00,787500.00,787500.00,'2026-08-27 14:56:08'),(186,63,9,'legacy-186','sale','sale','amount',90000.00,60.000,1500.00,5.00,85714.29,4285.71,90000.00,90000.00,'2026-08-27 14:56:19'),(187,64,9,'legacy-187','sale','sale','amount',90000.00,60.000,1500.00,5.00,85714.29,4285.71,90000.00,90000.00,'2026-08-27 14:58:02'),(188,65,9,'legacy-188','sale','sale','amount',900000.00,600.000,1500.00,5.00,857142.86,42857.14,900000.00,900000.00,'2026-08-27 19:50:22'),(189,66,9,'legacy-189','sale','sale','amount',5000.00,3.000,1500.00,5.00,4761.90,238.10,5000.00,5000.00,'2026-08-27 20:31:56'),(190,66,9,'legacy-190','bonus','bonus','quantity',NULL,1.000,1500.00,5.00,0.00,0.00,0.00,1575.00,'2026-08-27 20:31:56'),(191,67,5,'legacy-191','sale','sale','amount',200000.00,20.000,10000.00,5.00,190476.19,9523.81,200000.00,200000.00,'2026-08-28 14:10:02'),(192,67,5,'legacy-192','bonus','bonus','quantity',NULL,3.000,10000.00,5.00,0.00,0.00,0.00,31500.00,'2026-08-28 14:10:02'),(193,68,9,'legacy-193','sale','sale','amount',4500.00,3.000,1500.00,5.00,4285.71,214.29,4500.00,4500.00,'2026-08-29 09:48:28'),(194,69,9,'legacy-194','sale','sale','amount',45000.00,30.000,1500.00,5.00,42857.14,2142.86,45000.00,45000.00,'2026-08-29 09:49:02'),(195,70,9,'legacy-195','sale','sale','amount',45000.00,30.000,1500.00,5.00,42857.14,2142.86,45000.00,45000.00,'2026-08-29 09:57:36'),(196,71,14,'legacy-196','sale','sale','amount',6000.00,3.000,2000.00,0.00,6000.00,0.00,6000.00,6000.00,'2026-08-29 09:57:50'),(197,72,9,'legacy-197','sale','sale','amount',1500.00,1.000,1500.00,5.00,1428.57,71.43,1500.00,1500.00,'2026-08-29 12:24:09'),(198,73,9,'legacy-198','sale','sale','amount',15000.00,10.000,1500.00,5.00,14285.71,714.29,15000.00,15000.00,'2026-08-31 13:15:54'),(199,74,6,'legacy-199','sale','sale','quantity',NULL,10.000,1500.00,0.00,15000.00,0.00,15000.00,15000.00,'2026-09-01 13:56:49'),(200,75,11,'legacy-200','sale','sale','amount',5000.00,5.000,1000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-09-01 21:50:50'),(201,75,11,'legacy-201','bonus','bonus','quantity',NULL,1.000,1000.00,0.00,0.00,0.00,0.00,1000.00,'2026-09-01 21:50:50'),(202,76,15,'legacy-202','sale','sale','amount',10000.00,3.000,3000.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-09-04 01:48:43'),(203,76,15,'legacy-203','bonus','bonus','quantity',NULL,1.000,3000.00,0.00,0.00,0.00,0.00,3000.00,'2026-09-04 01:48:43'),(204,76,14,'legacy-204','sale','sale','amount',50000.00,25.000,2000.00,0.00,50000.00,0.00,50000.00,50000.00,'2026-09-04 02:05:50'),(205,76,14,'legacy-205','bonus','bonus','quantity',NULL,5.000,2000.00,0.00,0.00,0.00,0.00,10000.00,'2026-09-04 02:05:50'),(206,77,14,'legacy-206','sale','sale','amount',15000.00,7.000,2000.00,0.00,15000.00,0.00,15000.00,15000.00,'2026-09-04 02:06:56'),(207,77,14,'legacy-207','bonus','bonus','quantity',NULL,2.000,2000.00,0.00,0.00,0.00,0.00,4000.00,'2026-09-04 02:06:56'),(208,78,14,'14-1788487650964','sale','sale_bonus','amount',10000.00,5.000,2000.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-09-04 02:14:50'),(209,78,14,'14-1788487650964','bonus','sale_bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-09-04 02:14:50'),(210,78,14,'14-1788487658875','sale','sale_bonus','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-09-04 02:14:50'),(211,78,14,'14-1788487658875','bonus','sale_bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-09-04 02:14:50'),(212,79,15,'15-1788946240497','sale','sale_bonus','amount',2500.00,1.000,3000.00,0.00,2500.00,0.00,2500.00,2500.00,'2026-09-09 09:30:46'),(213,79,15,'15-1788946240497','bonus','sale_bonus','quantity',NULL,1.000,3000.00,0.00,0.00,0.00,0.00,3000.00,'2026-09-09 09:30:46'),(214,80,15,'15-1789440481746','sale','sale','amount',3000.00,1.000,3000.00,0.00,3000.00,0.00,3000.00,3000.00,'2026-09-15 02:48:25'),(216,81,15,'15-1789440556464','sale','sale','amount',2500.00,1.000,3000.00,0.00,2500.00,0.00,2500.00,2500.00,'2026-09-15 02:49:26'),(218,80,8,'edit-80-1789442910851','sale','sale_bonus','amount',10000.00,1.000,10000.00,5.00,9523.81,476.19,10000.00,10000.00,'2026-09-15 03:28:30'),(219,82,15,'15-1789447258521','sale','sale_bonus','amount',10000.00,3.000,3000.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-09-15 04:51:22'),(220,82,15,'15-1789447258521','bonus','sale_bonus','quantity',NULL,1.000,3000.00,0.00,0.00,0.00,0.00,3000.00,'2026-09-15 04:51:22'),(221,83,15,'15-1789447984723','sale','sale_bonus','amount',2500.00,1.000,3000.00,0.00,2500.00,0.00,2500.00,2500.00,'2026-09-15 04:56:46'),(222,83,12,'12-1789448126898','gift','gift','amount',2000.00,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-09-15 04:56:46'),(223,83,11,'11-1789448142606','exchange','exchange','amount',1000.00,1.000,1000.00,0.00,0.00,0.00,0.00,1000.00,'2026-09-15 04:56:46'),(224,83,10,'10-1789448154404','bonus','bonus','amount',500.00,1.000,500.00,0.00,0.00,0.00,0.00,500.00,'2026-09-15 04:56:46'),(225,83,14,'14-1789448178704','sale','sale','amount',8000.00,4.000,2000.00,0.00,8000.00,0.00,8000.00,8000.00,'2026-09-15 04:56:46'),(226,84,14,'14-1789569015663','sale','sale_bonus','amount',5000.00,2.000,2000.00,0.00,5000.00,0.00,5000.00,5000.00,'2026-09-16 14:30:31'),(227,84,14,'14-1789569015663','bonus','sale_bonus','quantity',NULL,1.000,2000.00,0.00,0.00,0.00,0.00,2000.00,'2026-09-16 14:30:31'),(232,85,15,'15-1790035678813','sale','sale_bonus','amount',10000.00,3.000,3000.00,0.00,10000.00,0.00,10000.00,10000.00,'2026-09-22 00:08:09'),(233,85,15,'15-1790035678813','bonus','sale_bonus','quantity',NULL,1.000,3000.00,0.00,0.00,0.00,0.00,3000.00,'2026-09-22 00:08:09');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wholesale_price_lists`
--

DROP TABLE IF EXISTS `wholesale_price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wholesale_price_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `change_reason` varchar(500) DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_wholesale_price_lists_code` (`code`),
  KEY `idx_wholesale_price_lists_active` (`is_active`,`name`),
  KEY `fk_wholesale_price_lists_created_by` (`created_by`),
  KEY `fk_wholesale_price_lists_updated_by` (`updated_by`),
  CONSTRAINT `fk_wholesale_price_lists_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_wholesale_price_lists_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_wholesale_price_lists_active` CHECK ((`is_active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wholesale_price_lists`
--

LOCK TABLES `wholesale_price_lists` WRITE;
/*!40000 ALTER TABLE `wholesale_price_lists` DISABLE KEYS */;
INSERT INTO `wholesale_price_lists` VALUES (1,'MAYORISTAS','MAYORISTAS',1,'MAYORISTAS',4,4,'2026-09-25 02:34:57','2026-09-25 02:34:57');
/*!40000 ALTER TABLE `wholesale_price_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_wholesale_profiles`
--

DROP TABLE IF EXISTS `customer_wholesale_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_wholesale_profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `price_list_id` bigint unsigned NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `change_reason` varchar(500) DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_customer_wholesale_profiles_customer` (`customer_id`),
  KEY `idx_customer_wholesale_profiles_list` (`price_list_id`,`is_active`),
  KEY `idx_customer_wholesale_profiles_validity` (`is_active`,`valid_from`,`valid_to`),
  KEY `fk_customer_wholesale_profiles_created_by` (`created_by`),
  KEY `fk_customer_wholesale_profiles_updated_by` (`updated_by`),
  CONSTRAINT `fk_customer_wholesale_profiles_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_customer_wholesale_profiles_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_customer_wholesale_profiles_list` FOREIGN KEY (`price_list_id`) REFERENCES `wholesale_price_lists` (`id`),
  CONSTRAINT `fk_customer_wholesale_profiles_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_customer_wholesale_profiles_active` CHECK ((`is_active` in (0,1))),
  CONSTRAINT `chk_customer_wholesale_profiles_dates` CHECK (((`valid_to` is null) or (`valid_to` >= `valid_from`)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_wholesale_profiles`
--

LOCK TABLES `customer_wholesale_profiles` WRITE;
/*!40000 ALTER TABLE `customer_wholesale_profiles` DISABLE KEYS */;
INSERT INTO `customer_wholesale_profiles` VALUES (1,4,1,'2026-09-24',NULL,1,'MAYORISTAS',4,4,'2026-09-25 02:35:38','2026-09-25 02:35:38');
/*!40000 ALTER TABLE `customer_wholesale_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wholesale_product_prices`
--

DROP TABLE IF EXISTS `wholesale_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wholesale_product_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price_list_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_scope_id` bigint unsigned GENERATED ALWAYS AS (coalesce(`customer_id`,0)) STORED,
  `regular_price_reference` decimal(14,2) NOT NULL,
  `wholesale_price` decimal(14,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `change_reason` varchar(500) DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_wholesale_product_prices_start` (`price_list_id`,`product_id`,`customer_scope_id`,`valid_from`),
  KEY `idx_wholesale_product_prices_resolution` (`price_list_id`,`product_id`,`customer_scope_id`,`is_active`,`valid_from`,`valid_to`),
  KEY `idx_wholesale_product_prices_customer` (`customer_id`,`is_active`),
  KEY `fk_wholesale_product_prices_product` (`product_id`),
  KEY `fk_wholesale_product_prices_created_by` (`created_by`),
  KEY `fk_wholesale_product_prices_updated_by` (`updated_by`),
  CONSTRAINT `fk_wholesale_product_prices_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_wholesale_product_prices_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `fk_wholesale_product_prices_list` FOREIGN KEY (`price_list_id`) REFERENCES `wholesale_price_lists` (`id`),
  CONSTRAINT `fk_wholesale_product_prices_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_wholesale_product_prices_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `chk_wholesale_product_prices_active` CHECK ((`is_active` in (0,1))),
  CONSTRAINT `chk_wholesale_product_prices_dates` CHECK (((`valid_to` is null) or (`valid_to` >= `valid_from`))),
  CONSTRAINT `chk_wholesale_product_prices_values` CHECK (((`regular_price_reference` > 0) and (`wholesale_price` > 0))),
  CONSTRAINT `chk_wholesale_product_prices_whole_value` CHECK ((`wholesale_price` = floor(`wholesale_price`)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wholesale_product_prices`
--

LOCK TABLES `wholesale_product_prices` WRITE;
/*!40000 ALTER TABLE `wholesale_product_prices` DISABLE KEYS */;
INSERT INTO `wholesale_product_prices` (`id`, `price_list_id`, `product_id`, `customer_id`, `regular_price_reference`, `wholesale_price`, `valid_from`, `valid_to`, `is_active`, `change_reason`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES (1,1,7,NULL,1500.00,1000.00,'2026-09-24',NULL,1,'MAYORISTAS',4,4,'2026-09-25 02:35:28','2026-09-25 02:35:28'),(2,1,15,NULL,3000.00,2000.00,'2026-09-24',NULL,1,'MAYORISTAS',4,4,'2026-09-25 02:36:05','2026-09-25 02:36:05'),(3,1,16,NULL,5000.00,4000.00,'2026-09-24',NULL,1,NULL,4,4,'2026-09-25 02:42:10','2026-09-25 02:42:10');
/*!40000 ALTER TABLE `wholesale_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wholesale_configuration_history`
--

DROP TABLE IF EXISTS `wholesale_configuration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wholesale_configuration_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` enum('price_list','customer_profile','product_price') NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  `action_type` enum('created','updated','activated','deactivated') NOT NULL,
  `previous_values_json` json DEFAULT NULL,
  `new_values_json` json DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `changed_by` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_wholesale_configuration_history_entity` (`entity_type`,`entity_id`,`created_at`),
  KEY `idx_wholesale_configuration_history_actor` (`changed_by`,`created_at`),
  CONSTRAINT `fk_wholesale_configuration_history_actor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wholesale_configuration_history`
--

LOCK TABLES `wholesale_configuration_history` WRITE;
/*!40000 ALTER TABLE `wholesale_configuration_history` DISABLE KEYS */;
INSERT INTO `wholesale_configuration_history` VALUES (1,'price_list',1,'created',NULL,'{\"id\": 1, \"code\": \"MAYORISTAS\", \"name\": \"MAYORISTAS\", \"is_active\": 1}','MAYORISTAS',4,'2026-09-25 02:34:57'),(2,'product_price',1,'created',NULL,'{\"id\": 1, \"valid_to\": null, \"is_active\": 1, \"product_id\": 7, \"valid_from\": \"2026-09-24\", \"customer_id\": null, \"price_list_id\": 1, \"wholesale_price\": 1000, \"regular_price_reference\": 1500}','MAYORISTAS',4,'2026-09-25 02:35:28'),(3,'customer_profile',1,'created',NULL,'{\"id\": 1, \"valid_to\": null, \"is_active\": 1, \"valid_from\": \"2026-09-24\", \"customer_id\": 4, \"price_list_id\": 1}','MAYORISTAS',4,'2026-09-25 02:35:38'),(4,'product_price',2,'created',NULL,'{\"id\": 2, \"valid_to\": null, \"is_active\": 1, \"product_id\": 15, \"valid_from\": \"2026-09-24\", \"customer_id\": null, \"price_list_id\": 1, \"wholesale_price\": 2000, \"regular_price_reference\": 3000}','MAYORISTAS',4,'2026-09-25 02:36:05'),(5,'product_price',3,'created',NULL,'{\"id\": 3, \"valid_to\": null, \"is_active\": 1, \"product_id\": 16, \"valid_from\": \"2026-09-24\", \"customer_id\": null, \"price_list_id\": 1, \"wholesale_price\": 4000, \"regular_price_reference\": 5000}',NULL,4,'2026-09-25 02:42:10');
/*!40000 ALTER TABLE `wholesale_configuration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'panaderia_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_std_error_json` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_std_error_json`(
  p_error_code VARCHAR(80),
  p_detail VARCHAR(255),
  p_meta JSON
) RETURNS json
    READS SQL DATA
BEGIN
  DECLARE v_domain VARCHAR(40);
  DECLARE v_category VARCHAR(20);
  DECLARE v_default_message VARCHAR(255);
  DECLARE v_http_status SMALLINT UNSIGNED;
  DECLARE v_retryable TINYINT(1);

  SELECT
    domain,
    category,
    default_message,
    http_status,
    retryable
  INTO
    v_domain,
    v_category,
    v_default_message,
    v_http_status,
    v_retryable
  FROM std_error_catalog
  WHERE error_code = p_error_code
    AND is_active = 1
  LIMIT 1;

  IF v_default_message IS NULL THEN
    SET v_domain = 'COMMON';
    SET v_category = 'technical';
    SET v_default_message = 'Codigo de error estandar desconocido';
    SET v_http_status = 500;
    SET v_retryable = 1;
  END IF;

  RETURN JSON_OBJECT(
    'error_code', IFNULL(p_error_code, 'COMMON.SQL_ERROR'),
    'domain', v_domain,
    'category', v_category,
    'http_status', v_http_status,
    'retryable', v_retryable,
    'message', v_default_message,
    'detail', p_detail,
    'meta', IFNULL(p_meta, JSON_OBJECT())
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_apply_inventory_movement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_apply_inventory_movement`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_item_type VARCHAR(20),
  IN p_item_id BIGINT UNSIGNED,
  IN p_movement_type VARCHAR(30),
  IN p_quantity DECIMAL(14,3),
  IN p_unit_cost DECIMAL(12,4),
  IN p_reference_type VARCHAR(50),
  IN p_reference_id BIGINT UNSIGNED,
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_movement_id BIGINT UNSIGNED
)
BEGIN
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_current_qty DECIMAL(14,3) DEFAULT 0;
  DECLARE v_new_qty DECIMAL(14,3) DEFAULT 0;
  DECLARE v_is_out TINYINT(1) DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_movement_id = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'operacion completada';
  SET o_movement_id = NULL;

  IF p_quantity IS NULL OR p_quantity <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad (quantity) debe ser mayor que 0';
  END IF;

  SET v_is_out = CASE
    WHEN p_movement_type IN ('production_out', 'sale_out', 'adjustment_out', 'waste_out') THEN 1
    ELSE 0
  END;

  START TRANSACTION;

  IF NOT EXISTS (SELECT 1 FROM branches WHERE id = p_branch_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'sede no encontrada o inactiva';
  END IF;

  IF p_item_type = 'raw_material' THEN
    IF NOT EXISTS (
      SELECT 1 FROM raw_materials
      WHERE id = p_item_id AND is_active = 1 AND deleted_at IS NULL
    ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'materia prima no encontrada o inactiva';
    END IF;

    INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
    VALUES (p_branch_id, p_item_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_current_qty
    FROM stock_raw_materials
    WHERE branch_id = p_branch_id
      AND raw_material_id = p_item_id
    FOR UPDATE;

    IF v_is_out = 1 AND v_current_qty < p_quantity THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'stock de materia prima insuficiente';
    END IF;

    SET v_new_qty = CASE WHEN v_is_out = 1 THEN v_current_qty - p_quantity ELSE v_current_qty + p_quantity END;

    UPDATE stock_raw_materials
    SET quantity_on_hand = v_new_qty
    WHERE branch_id = p_branch_id
      AND raw_material_id = p_item_id;

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      p_branch_id, 'raw_material', p_item_id, NULL, p_movement_type,
      p_quantity, p_unit_cost, p_reference_type, p_reference_id, p_notes, p_actor_user_id
    );

  ELSEIF p_item_type = 'product' THEN
    IF NOT EXISTS (
      SELECT 1 FROM products
      WHERE id = p_item_id AND is_active = 1 AND deleted_at IS NULL
    ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto no encontrado o inactivo';
    END IF;

    INSERT IGNORE INTO stock_products (branch_id, product_id, quantity_on_hand, min_stock)
    VALUES (p_branch_id, p_item_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_current_qty
    FROM stock_products
    WHERE branch_id = p_branch_id
      AND product_id = p_item_id
    FOR UPDATE;

    IF v_is_out = 1 AND v_current_qty < p_quantity THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'stock de producto insuficiente';
    END IF;

    SET v_new_qty = CASE WHEN v_is_out = 1 THEN v_current_qty - p_quantity ELSE v_current_qty + p_quantity END;

    UPDATE stock_products
    SET quantity_on_hand = v_new_qty
    WHERE branch_id = p_branch_id
      AND product_id = p_item_id;

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      p_branch_id, 'product', NULL, p_item_id, p_movement_type,
      p_quantity, p_unit_cost, p_reference_type, p_reference_id, p_notes, p_actor_user_id
    );

  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el tipo de item (item_type) es invalido';
  END IF;

  SET o_movement_id = LAST_INSERT_ID();

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'inventory.movement.apply',
    'inventory_movements',
    CAST(o_movement_id AS CHAR),
    JSON_OBJECT('branch_id', p_branch_id, 'item_type', p_item_type, 'item_id', p_item_id, 'qty', p_quantity)
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'movimiento de inventario aplicado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_change_password`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_expected_current_hash VARCHAR(255),
  IN p_new_password_hash VARCHAR(255),
  IN p_new_password_algo VARCHAR(30),
  IN p_revoke_all_sessions TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_current_hash VARCHAR(255);
  DECLARE v_rows INT DEFAULT 0;
  DECLARE v_revoked_count INT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_new_password_hash IS NULL OR CHAR_LENGTH(p_new_password_hash) < 40 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el hash de la nueva contrasena es invalido';
  END IF;

  START TRANSACTION;

  SELECT password_hash
    INTO v_current_hash
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL
  FOR UPDATE;

  IF v_current_hash IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSEIF p_expected_current_hash IS NOT NULL AND p_expected_current_hash <> v_current_hash THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'el hash de la contrasena actual no coincide';
    SET o_data_json = NULL;
  ELSE
    UPDATE users
    SET password_hash = p_new_password_hash,
        password_algo = IFNULL(p_new_password_algo, 'argon2id'),
        password_changed_at = CURRENT_TIMESTAMP,
        must_change_password = 0,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_user_id;

    SET v_rows = ROW_COUNT();

    IF IFNULL(p_revoke_all_sessions, 1) = 1 THEN
      UPDATE user_sessions
      SET revoked_at = CURRENT_TIMESTAMP
      WHERE user_id = p_user_id
        AND revoked_at IS NULL;

      SET v_revoked_count = ROW_COUNT();
    END IF;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'auth.change_password',
      'users',
      CAST(p_user_id AS CHAR),
      JSON_OBJECT('sessions_revoked', v_revoked_count)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'contrasena actualizada';
    SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'sessions_revoked', v_revoked_count, 'updated_rows', v_rows);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_login_fail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_login_fail`(
  IN p_identifier VARCHAR(255),
  IN p_user_id BIGINT UNSIGNED,
  IN p_ip_address VARCHAR(45),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_failed_attempts INT DEFAULT 0;
  DECLARE v_max_attempts INT DEFAULT 5;
  DECLARE v_blocked TINYINT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  INSERT INTO login_attempts (user_id, email_or_username, ip_address, success)
  VALUES (p_user_id, TRIM(p_identifier), p_ip_address, 0);

  IF p_user_id IS NOT NULL THEN
    SELECT COUNT(*)
      INTO v_failed_attempts
    FROM login_attempts
    WHERE user_id = p_user_id
      AND success = 0
      AND attempted_at >= (CURRENT_TIMESTAMP - INTERVAL 15 MINUTE);

    IF v_failed_attempts >= v_max_attempts THEN
      UPDATE users
      SET status = 'blocked',
          updated_at = CURRENT_TIMESTAMP
      WHERE id = p_user_id
        AND status <> 'blocked';

      SET v_blocked = 1;

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        NULL,
        'auth.account_blocked',
        'users',
        CAST(p_user_id AS CHAR),
        JSON_OBJECT('failed_attempts_15m', v_failed_attempts)
      );
    END IF;
  END IF;

  COMMIT;

  SET o_code = 1;
  IF v_blocked = 1 THEN
    SET o_message = 'inicio de sesion fallido y cuenta bloqueada';
  ELSE
    SET o_message = 'fallo de inicio de sesion registrado';
  END IF;

  SET o_data_json = JSON_OBJECT(
    'failed_attempts_15m', v_failed_attempts,
    'max_attempts_15m', v_max_attempts,
    'account_blocked', v_blocked
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_login_start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_login_start`(
  IN p_identifier VARCHAR(255),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_user_id BIGINT UNSIGNED;
  DECLARE v_username VARCHAR(60);
  DECLARE v_email VARCHAR(255);
  DECLARE v_password_hash VARCHAR(255);
  DECLARE v_password_algo VARCHAR(30);
  DECLARE v_status VARCHAR(20);
  DECLARE v_must_change_password TINYINT;
  DECLARE v_failed_attempts INT DEFAULT 0;

  SET o_code = 0;
  SET o_message = 'credenciales invalidas';
  SET o_data_json = NULL;

  SELECT
    id,
    username,
    email,
    password_hash,
    password_algo,
    status,
    must_change_password
  INTO
    v_user_id,
    v_username,
    v_email,
    v_password_hash,
    v_password_algo,
    v_status,
    v_must_change_password
  FROM users
  WHERE (username = TRIM(p_identifier) OR email = LOWER(TRIM(p_identifier)))
    AND deleted_at IS NULL
  LIMIT 1;

  IF v_user_id IS NULL THEN
    SET o_code = 0;
    SET o_message = 'credenciales invalidas';
    SET o_data_json = NULL;
  ELSEIF v_status <> 'active' THEN
    SET o_code = 0;
    SET o_message = CONCAT('estado de la cuenta: ', v_status);
    SET o_data_json = NULL;
  ELSE
    SELECT COUNT(*)
      INTO v_failed_attempts
    FROM login_attempts
    WHERE user_id = v_user_id
      AND success = 0
      AND attempted_at >= (CURRENT_TIMESTAMP - INTERVAL 15 MINUTE);

    SET o_code = 1;
    SET o_message = 'datos de validacion de inicio de sesion listos';
    SET o_data_json = JSON_OBJECT(
      'user_id', v_user_id,
      'username', v_username,
      'email', v_email,
      'password_hash', v_password_hash,
      'password_algo', v_password_algo,
      'must_change_password', v_must_change_password,
      'failed_attempts_15m', v_failed_attempts
    );
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_login_success` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_login_success`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_identifier VARCHAR(255),
  IN p_refresh_token_hash CHAR(64),
  IN p_user_agent VARCHAR(255),
  IN p_ip_address VARCHAR(45),
  IN p_expires_at TIMESTAMP,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_status VARCHAR(20);
  DECLARE v_must_change_password TINYINT;
  DECLARE v_session_id BIGINT UNSIGNED;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  SELECT status, must_change_password
    INTO v_status, v_must_change_password
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL
  FOR UPDATE;

  IF v_status IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSEIF v_status <> 'active' THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = CONCAT('estado de la cuenta: ', v_status);
    SET o_data_json = NULL;
  ELSE
    INSERT INTO login_attempts (user_id, email_or_username, ip_address, success)
    VALUES (p_user_id, TRIM(p_identifier), p_ip_address, 1);

    UPDATE users
    SET last_login_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_user_id;

    INSERT INTO user_sessions (
      user_id,
      refresh_token_hash,
      user_agent,
      ip_address,
      expires_at,
      revoked_at
    )
    VALUES (
      p_user_id,
      p_refresh_token_hash,
      p_user_agent,
      p_ip_address,
      p_expires_at,
      NULL
    );

    SET v_session_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (
      p_user_id,
      'auth.login_success',
      'user_sessions',
      CAST(v_session_id AS CHAR)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'inicio de sesion exitoso registrado';
    SET o_data_json = JSON_OBJECT(
      'session_id', v_session_id,
      'user_id', p_user_id,
      'must_change_password', v_must_change_password
    );
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_logout`(
  IN p_session_id BIGINT UNSIGNED,
  IN p_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  UPDATE user_sessions
  SET revoked_at = CURRENT_TIMESTAMP
  WHERE id = p_session_id
    AND user_id = p_user_id
    AND revoked_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'sesion no encontrada o ya revocada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (
      p_user_id,
      'auth.logout',
      'user_sessions',
      CAST(p_session_id AS CHAR)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'sesion revocada';
    SET o_data_json = JSON_OBJECT('session_id', p_session_id, 'revoked', 1);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_logout_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_logout_all`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_user_exists INT DEFAULT 0;
  DECLARE v_revoked_count INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_user_exists
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL
  FOR UPDATE;

  IF v_user_exists = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    UPDATE user_sessions
    SET revoked_at = CURRENT_TIMESTAMP
    WHERE user_id = p_user_id
      AND revoked_at IS NULL;

    SET v_revoked_count = ROW_COUNT();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'auth.logout_all',
      'users',
      CAST(p_user_id AS CHAR),
      JSON_OBJECT('revoked_sessions', v_revoked_count)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'todas las sesiones activas fueron revocadas';
    SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'revoked_sessions', v_revoked_count);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_refresh_session` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_refresh_session`(
  IN p_session_id BIGINT UNSIGNED,
  IN p_user_id BIGINT UNSIGNED,
  IN p_current_refresh_hash CHAR(64),
  IN p_new_refresh_hash CHAR(64),
  IN p_new_expires_at TIMESTAMP,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  UPDATE user_sessions
  SET refresh_token_hash = p_new_refresh_hash,
      expires_at = p_new_expires_at
  WHERE id = p_session_id
    AND user_id = p_user_id
    AND refresh_token_hash = p_current_refresh_hash
    AND revoked_at IS NULL
    AND expires_at > CURRENT_TIMESTAMP;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'sesion no encontrada, expirada, revocada o con hash no valido';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (
      p_user_id,
      'auth.refresh_session',
      'user_sessions',
      CAST(p_session_id AS CHAR)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'sesion renovada';
    SET o_data_json = JSON_OBJECT('session_id', p_session_id, 'expires_at', p_new_expires_at);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_reset_password_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_reset_password_admin`(
  IN p_target_user_id BIGINT UNSIGNED,
  IN p_new_password_hash VARCHAR(255),
  IN p_new_password_algo VARCHAR(30),
  IN p_force_change_next_login TINYINT,
  IN p_revoke_all_sessions TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;
  DECLARE v_revoked_count INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_new_password_hash IS NULL OR CHAR_LENGTH(p_new_password_hash) < 40 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el hash de la nueva contrasena es invalido';
  END IF;

  START TRANSACTION;

  UPDATE users
  SET password_hash = p_new_password_hash,
      password_algo = IFNULL(p_new_password_algo, 'argon2id'),
      must_change_password = IFNULL(p_force_change_next_login, 1),
      password_changed_at = CURRENT_TIMESTAMP,
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_target_user_id
    AND deleted_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario objetivo no encontrado';
    SET o_data_json = NULL;
  ELSE
    IF IFNULL(p_revoke_all_sessions, 1) = 1 THEN
      UPDATE user_sessions
      SET revoked_at = CURRENT_TIMESTAMP
      WHERE user_id = p_target_user_id
        AND revoked_at IS NULL;

      SET v_revoked_count = ROW_COUNT();
    END IF;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'auth.reset_password_admin',
      'users',
      CAST(p_target_user_id AS CHAR),
      JSON_OBJECT(
        'force_change_next_login', IFNULL(p_force_change_next_login, 1),
        'sessions_revoked', v_revoked_count
      )
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'contrasena restablecida por administrador';
    SET o_data_json = JSON_OBJECT(
      'target_user_id', p_target_user_id,
      'sessions_revoked', v_revoked_count,
      'must_change_password', IFNULL(p_force_change_next_login, 1)
    );
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auth_validate_password_policy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auth_validate_password_policy`(
  IN p_password VARCHAR(255),
  IN p_username VARCHAR(60),
  IN p_email VARCHAR(255),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_errors JSON DEFAULT JSON_ARRAY();
  DECLARE v_password_lower VARCHAR(255);
  DECLARE v_username_lower VARCHAR(60);
  DECLARE v_email_local VARCHAR(255);
  DECLARE v_password_length INT;

  SET v_password_length = CHAR_LENGTH(p_password);
  SET v_password_lower = LOWER(IFNULL(p_password, ''));
  SET v_username_lower = LOWER(IFNULL(p_username, ''));
  SET v_email_local = LOWER(IFNULL(SUBSTRING_INDEX(p_email, '@', 1), ''));

  IF p_password IS NULL OR v_password_length < 10 THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña debe tener al menos 10 caracteres');
  END IF;

  IF p_password IS NOT NULL AND NOT REGEXP_LIKE(p_password, '[A-Z]') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña debe contener al menos una letra mayúscula');
  END IF;

  IF p_password IS NOT NULL AND NOT REGEXP_LIKE(p_password, '[a-z]') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña debe contener al menos una letra minúscula');
  END IF;

  IF p_password IS NOT NULL AND NOT REGEXP_LIKE(p_password, '[0-9]') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña debe contener al menos un número');
  END IF;

  IF p_password IS NOT NULL AND NOT REGEXP_LIKE(p_password, '[^A-Za-z0-9]') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña debe contener al menos un carácter especial');
  END IF;

  IF p_password IS NOT NULL AND REGEXP_LIKE(p_password, '[[:space:]]') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña no puede contener espacios en blanco');
  END IF;

  IF v_username_lower <> '' AND v_password_lower LIKE CONCAT('%', v_username_lower, '%') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña no puede contener el nombre de usuario');
  END IF;

  IF v_email_local <> '' AND v_password_lower LIKE CONCAT('%', v_email_local, '%') THEN
    SET v_errors = JSON_ARRAY_APPEND(v_errors, '$', 'La contraseña no puede contener la parte local del correo electrónico');
  END IF;

  IF JSON_LENGTH(v_errors) > 0 THEN
    SET o_code = 0;
    SET o_message = 'política de contraseña no cumplida';
    SET o_data_json = JSON_OBJECT('errors', v_errors);
  ELSE
    SET o_code = 1;
    SET o_message = 'contraseña válida';
    SET o_data_json = JSON_OBJECT('valid', TRUE);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_create`(
  IN p_code VARCHAR(30),
  IN p_name VARCHAR(120),
  IN p_address VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_branch_id BIGINT UNSIGNED;

  IF p_code IS NULL OR CHAR_LENGTH(TRIM(p_code)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el codigo de sede es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el nombre de sede es obligatorio';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM branches WHERE code = TRIM(p_code)) THEN
    SET o_code = 0;
    SET o_message = 'el codigo de sede ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO branches (code, name, address, phone, is_active)
    VALUES (TRIM(p_code), TRIM(p_name), p_address, p_phone, 1);

    SET v_branch_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'branch.create', 'branches', CAST(v_branch_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'sede creada';
    SET o_data_json = JSON_OBJECT('branch_id', v_branch_id, 'code', TRIM(p_code));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_list`(
  IN p_only_active TINYINT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_items_json LONGTEXT;

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', b.id,
             'code', b.code,
             'name', b.name,
             'address', b.address,
             'phone', b.phone,
             'is_active', b.is_active
           ) ORDER BY b.name SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM branches b
  WHERE (IFNULL(p_only_active, 0) = 0 OR b.is_active = 1);

  SET o_code = 1;
  SET o_message = 'sedes listadas';
  SET o_data_json = CONCAT('{"items":', IFNULL(v_items_json, '[]'), '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_branch_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branch_update`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_name VARCHAR(120),
  IN p_address VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE branches
  SET name = TRIM(p_name),
      address = p_address,
      phone = p_phone,
      is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_branch_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'sede no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'branch.update', 'branches', CAST(p_branch_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'sede actualizada';
    SET o_data_json = JSON_OBJECT('branch_id', p_branch_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cancel_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cancel_order`(
  IN p_order_id BIGINT UNSIGNED,
  IN p_reason VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_status VARCHAR(30);
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  SELECT status
    INTO v_status
  FROM orders
  WHERE id = p_order_id
  FOR UPDATE;

  IF v_status IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'pedido no encontrado';
    SET o_data_json = NULL;
  ELSEIF v_status NOT IN ('draft', 'confirmed') THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = CONCAT('el pedido no se puede cancelar desde el estado ', v_status);
    SET o_data_json = NULL;
  ELSE
    UPDATE orders
    SET status = 'cancelled',
        notes = CONCAT(IFNULL(notes, ''), ' | CANCEL_REASON: ', IFNULL(p_reason, 'not provided')),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_order_id;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'order.cancel',
      'orders',
      CAST(p_order_id AS CHAR),
      JSON_OBJECT('reason', IFNULL(p_reason, 'not provided'))
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'pedido cancelado';
    SET o_data_json = JSON_OBJECT('order_id', p_order_id, 'status', 'cancelled');
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_close_production_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_close_production_order`(
  IN p_production_order_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_status VARCHAR(30);
  DECLARE v_pending_items INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = 'orden de produccion no encontrada';
    SET o_data_json = NULL;
  END;

    SET o_message = CONCAT('la orden de produccion ya se encuentra en estado ', v_status);

  SELECT status
    INTO v_status
  FROM production_orders
  WHERE id = p_production_order_id
  FOR UPDATE;

  IF v_status IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'orden de produccion no encontrada';
    SET o_data_json = NULL;
  ELSEIF v_status IN ('completed', 'cancelled') THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = CONCAT('la orden de produccion ya se encuentra en estado ', v_status);
    SET o_data_json = NULL;
  ELSE
    SELECT COUNT(*)
      INTO v_pending_items
    FROM production_order_items
    WHERE production_order_id = p_production_order_id
      AND status NOT IN ('done', 'cancelled');

    IF v_pending_items > 0 THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'la orden de produccion tiene items pendientes';
      SET o_data_json = JSON_OBJECT('pending_items', v_pending_items);
    ELSE
      UPDATE production_orders
      SET status = 'completed',
          updated_at = CURRENT_TIMESTAMP
      WHERE id = p_production_order_id;

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (
        p_actor_user_id,
        'production_order.close',
        'production_orders',
        CAST(p_production_order_id AS CHAR)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'orden de produccion cerrada';
      SET o_data_json = JSON_OBJECT('production_order_id', p_production_order_id, 'status', 'completed');
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_confirm_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_confirm_order`(
  IN p_order_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255)
)
BEGIN
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_status VARCHAR(30);
  DECLARE v_item_count INT DEFAULT 0;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
  END;

  SET o_code = 0;
  SET o_message = 'operacion completada';

  START TRANSACTION;

  SELECT status INTO v_status
  FROM orders
  WHERE id = p_order_id
  FOR UPDATE;

  IF v_status IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'pedido no encontrado';
  END IF;

  IF v_status <> 'draft' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'solo un pedido en borrador puede confirmarse';
  END IF;

  SELECT COUNT(*) INTO v_item_count
  FROM order_items
  WHERE order_id = p_order_id;

  IF v_item_count = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el pedido no tiene items';
  END IF;

  UPDATE orders
  SET status = 'confirmed', updated_at = CURRENT_TIMESTAMP
  WHERE id = p_order_id;

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
  VALUES (
    p_actor_user_id,
    'order.confirm',
    'orders',
    CAST(p_order_id AS CHAR)
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'pedido confirmado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_order`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_customer_id BIGINT UNSIGNED,
  IN p_route_id BIGINT UNSIGNED,
  IN p_order_date DATE,
  IN p_delivery_date DATE,
  IN p_notes VARCHAR(255),
  IN p_created_by BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_order_id BIGINT UNSIGNED
)
BEGIN
  DECLARE v_bonus_percent DECIMAL(5,2) DEFAULT 20.00;
  DECLARE v_bonus_minimum DECIMAL(12,2) DEFAULT 2000.00;
  DECLARE v_commission_percent DECIMAL(5,2) DEFAULT 15.00;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1
      v_sqlstate = RETURNED_SQLSTATE,
      v_errno = MYSQL_ERRNO,
      v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_order_id = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'operacion completada';
  SET o_order_id = NULL;

  IF p_order_date IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la fecha del pedido es obligatoria';
  END IF;

  START TRANSACTION;

  IF NOT EXISTS (SELECT 1 FROM branches WHERE id = p_branch_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'sucursal no encontrada o inactiva';
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM customers
    WHERE id = p_customer_id
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'cliente no encontrado o inactivo';
  END IF;

  IF p_route_id IS NOT NULL AND NOT EXISTS (
    SELECT 1
    FROM delivery_routes
    WHERE id = p_route_id
      AND is_active = 1
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ruta no encontrada o inactiva';
  END IF;

  SELECT
    bonus_percent,
    bonus_minimum_amount,
    external_seller_commission_percent
  INTO
    v_bonus_percent,
    v_bonus_minimum,
    v_commission_percent
  FROM sales_settings
  WHERE id = 1;

  INSERT INTO orders (
    branch_id,
    customer_id,
    sales_agent_user_id,
    route_id,
    order_date,
    delivery_date,
    status,
    subtotal,
    tax_total,
    grand_total,
    bonus_percent,
    bonus_minimum_amount,
    seller_commission_percent,
    bonus_total,
    gift_total,
    exchange_total,
    notes,
    created_by
  )
  VALUES (
    p_branch_id,
    p_customer_id,
    p_created_by,
    p_route_id,
    p_order_date,
    p_delivery_date,
    'draft',
    0,
    0,
    0,
    v_bonus_percent,
    v_bonus_minimum,
    v_commission_percent,
    0,
    0,
    0,
    p_notes,
    p_created_by
  );

  SET o_order_id = LAST_INSERT_ID();

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_created_by,
    'order.create',
    'orders',
    CAST(o_order_id AS CHAR),
    JSON_OBJECT(
      'branch_id', p_branch_id,
      'customer_id', p_customer_id,
      'bonus_percent', v_bonus_percent,
      'bonus_minimum_amount', v_bonus_minimum,
      'seller_commission_percent', v_commission_percent
    )
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'pedido creado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customer_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customer_create`(
  IN p_tax_id VARCHAR(30),
  IN p_name VARCHAR(150),
  IN p_email VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_address VARCHAR(255),
  IN p_neighborhood VARCHAR(120),
  IN p_status VARCHAR(20),
  IN p_credit_limit DECIMAL(12,2),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el nombre del cliente es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_status NOT IN ('active', 'inactive') THEN
    SET o_code = 0;
    SET o_message = 'estado de cliente invalido';
    SET o_data_json = NULL;
  ELSEIF IFNULL(p_credit_limit, 0) < 0 THEN
    SET o_code = 0;
    SET o_message = 'credit_limit debe ser >= 0';
    SET o_data_json = NULL;
  ELSEIF p_tax_id IS NOT NULL AND TRIM(p_tax_id) <> ''
      AND EXISTS (SELECT 1 FROM customers WHERE tax_id = TRIM(p_tax_id) AND deleted_at IS NULL) THEN
    SET o_code = 0;
    SET o_message = 'el tax_id del cliente ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO customers (
      tax_id,
      name,
      email,
      phone,
      address,
      neighborhood,
      status,
      credit_limit
    ) VALUES (
      NULLIF(TRIM(p_tax_id), ''),
      TRIM(p_name),
      p_email,
      p_phone,
      p_address,
      NULLIF(TRIM(p_neighborhood), ''),
      p_status,
      IFNULL(p_credit_limit, 0)
    );

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'customer.create', 'customers', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'cliente creado';
    SET o_data_json = JSON_OBJECT('customer_id', v_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customer_list`(
  IN p_status VARCHAR(20),
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_total BIGINT DEFAULT 0;
  DECLARE v_items_json LONGTEXT;
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 20;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = IFNULL(NULLIF(p_page, 0), 1);
  IF v_page < 1 THEN
    SET v_page = 1;
  END IF;

  SET v_page_size = IFNULL(NULLIF(p_page_size, 0), 20);
  IF v_page_size < 1 THEN
    SET v_page_size = 20;
  ELSEIF v_page_size > 200 THEN
    SET v_page_size = 200;
  END IF;

  SET v_offset = (v_page - 1) * v_page_size;

  SELECT COUNT(*)
    INTO v_total
  FROM customers c
  WHERE c.deleted_at IS NULL
    AND (p_status IS NULL OR p_status = '' OR c.status = p_status)
    AND (
      p_search IS NULL OR p_search = ''
      OR c.tax_id LIKE CONCAT('%', p_search, '%')
      OR c.name LIKE CONCAT('%', p_search, '%')
      OR c.phone LIKE CONCAT('%', p_search, '%')
      OR c.address LIKE CONCAT('%', p_search, '%')
      OR c.neighborhood LIKE CONCAT('%', p_search, '%')
    );

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'tax_id', x.tax_id,
             'name', x.name,
             'email', x.email,
             'phone', x.phone,
             'address', x.address,
             'neighborhood', x.neighborhood,
             'status', x.status,
             'credit_limit', x.credit_limit
           ) ORDER BY x.id SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT
      c.id,
      c.tax_id,
      c.name,
      c.email,
      c.phone,
      c.address,
      c.neighborhood,
      c.status,
      c.credit_limit
    FROM customers c
    WHERE c.deleted_at IS NULL
      AND (p_status IS NULL OR p_status = '' OR c.status = p_status)
      AND (
        p_search IS NULL OR p_search = ''
        OR c.tax_id LIKE CONCAT('%', p_search, '%')
        OR c.name LIKE CONCAT('%', p_search, '%')
        OR c.phone LIKE CONCAT('%', p_search, '%')
        OR c.address LIKE CONCAT('%', p_search, '%')
        OR c.neighborhood LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY c.id DESC
    LIMIT v_offset, v_page_size
  ) x;

  SET o_code = 1;
  SET o_message = 'clientes listados';
  SET o_data_json = CONCAT(
    '{"page":', v_page,
    ',"page_size":', v_page_size,
    ',"total":', v_total,
    ',"items":', IFNULL(v_items_json, '[]'),
    '}'
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customer_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customer_set_status`(
  IN p_customer_id BIGINT UNSIGNED,
  IN p_status VARCHAR(20),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_status NOT IN ('active', 'inactive') THEN
    SET o_code = 0;
    SET o_message = 'estado de cliente invalido';
    SET o_data_json = NULL;
  ELSE
    UPDATE customers
    SET status = p_status,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_customer_id
      AND deleted_at IS NULL;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'cliente no encontrado';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'customer.set_status',
        'customers',
        CAST(p_customer_id AS CHAR),
        JSON_OBJECT('status', p_status)
      );

      SET o_code = 1;
      SET o_message = 'estado de cliente actualizado';
      SET o_data_json = JSON_OBJECT('customer_id', p_customer_id, 'status', p_status);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_customer_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_customer_update`(
  IN p_customer_id BIGINT UNSIGNED,
  IN p_tax_id VARCHAR(30),
  IN p_name VARCHAR(150),
  IN p_email VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_address VARCHAR(255),
  IN p_neighborhood VARCHAR(120),
  IN p_status VARCHAR(20),
  IN p_credit_limit DECIMAL(12,2),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el nombre del cliente es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_status NOT IN ('active', 'inactive') THEN
    SET o_code = 0;
    SET o_message = 'estado de cliente invalido';
    SET o_data_json = NULL;
  ELSEIF IFNULL(p_credit_limit, 0) < 0 THEN
    SET o_code = 0;
    SET o_message = 'credit_limit debe ser >= 0';
    SET o_data_json = NULL;
  ELSEIF p_tax_id IS NOT NULL AND TRIM(p_tax_id) <> ''
      AND EXISTS (
        SELECT 1
        FROM customers
        WHERE tax_id = TRIM(p_tax_id)
          AND id <> p_customer_id
          AND deleted_at IS NULL
      ) THEN
    SET o_code = 0;
    SET o_message = 'el tax_id del cliente ya existe';
    SET o_data_json = NULL;
  ELSE
    UPDATE customers
    SET tax_id = NULLIF(TRIM(p_tax_id), ''),
        name = TRIM(p_name),
        email = p_email,
        phone = p_phone,
        address = p_address,
        neighborhood = NULLIF(TRIM(p_neighborhood), ''),
        status = p_status,
        credit_limit = IFNULL(p_credit_limit, 0),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_customer_id
      AND deleted_at IS NULL;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'cliente no encontrado';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (p_actor_user_id, 'customer.update', 'customers', CAST(p_customer_id AS CHAR));

      SET o_code = 1;
      SET o_message = 'cliente actualizado';
      SET o_data_json = JSON_OBJECT('customer_id', p_customer_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dispatch_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dispatch_order`(
  IN p_order_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_status VARCHAR(30);
  DECLARE v_branch_id BIGINT UNSIGNED;
  DECLARE v_items_count INT DEFAULT 0;
  DECLARE v_dispatched_rows INT DEFAULT 0;
  DECLARE v_pending_reservations INT DEFAULT 0;
  DECLARE v_item_id BIGINT UNSIGNED;
  DECLARE v_product_id BIGINT UNSIGNED;
  DECLARE v_qty DECIMAL(12,3);
  DECLARE v_direct_qty DECIMAL(14,3);
  DECLARE v_stock_dispatch_qty DECIMAL(14,3);
  DECLARE v_has_cutoff INT DEFAULT 0;
  DECLARE done INT DEFAULT 0;
  DECLARE v_signal_msg VARCHAR(255);
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE cur_items CURSOR FOR
    SELECT id, product_id, quantity FROM order_items WHERE order_id = p_order_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1
      v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;
  SELECT status, branch_id INTO v_status, v_branch_id FROM orders WHERE id = p_order_id FOR UPDATE;
  IF v_status IS NULL THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'pedido no encontrado'; END IF;
  IF v_status NOT IN ('confirmed', 'ready', 'in_production') THEN
    SET v_signal_msg = CONCAT('el pedido no se puede despachar desde el estado ', v_status);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_signal_msg;
  END IF;

  SELECT COUNT(*) INTO v_items_count FROM order_items WHERE order_id = p_order_id;
  IF v_items_count = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el pedido no tiene items'; END IF;

  SELECT COUNT(*) INTO v_pending_reservations
  FROM production_sale_reservations psr
  INNER JOIN order_items oi ON oi.id = psr.order_item_id
  WHERE oi.order_id = p_order_id
    AND psr.status IN ('reserved','partially_delivered')
    AND psr.delivered_quantity < psr.quantity;
  IF v_pending_reservations > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el pedido tiene reservas pendientes; confirma la entrega directa o libera la reserva';
  END IF;

  OPEN cur_items;
  read_loop: LOOP
    FETCH cur_items INTO v_item_id, v_product_id, v_qty;
    IF done = 1 THEN LEAVE read_loop; END IF;

    SELECT COALESCE(SUM(delivered_quantity), 0) INTO v_direct_qty
    FROM production_sale_reservations
    WHERE order_item_id = v_item_id AND status = 'delivered';
    SET v_stock_dispatch_qty = GREATEST(v_qty - v_direct_qty, 0);

    IF v_stock_dispatch_qty > 0 THEN
      SELECT COUNT(*) INTO v_has_cutoff
      FROM product_inventory_daily_cutoffs
      WHERE branch_id = v_branch_id AND product_id = v_product_id AND business_date = CURRENT_DATE;

      INSERT INTO product_sale_inventory_commitments (
        order_id, order_item_id, branch_id, product_id, committed_quantity,
        applied_quantity, status, applied_at
      ) VALUES (
        p_order_id, v_item_id, v_branch_id, v_product_id, v_stock_dispatch_qty,
        IF(v_has_cutoff > 0, v_stock_dispatch_qty, 0),
        IF(v_has_cutoff > 0, 'applied', 'pending'),
        IF(v_has_cutoff > 0, CURRENT_TIMESTAMP, NULL)
      ) ON DUPLICATE KEY UPDATE
        committed_quantity = VALUES(committed_quantity),
        applied_quantity = VALUES(applied_quantity),
        status = VALUES(status),
        applied_at = VALUES(applied_at),
        updated_at = CURRENT_TIMESTAMP;

      IF v_has_cutoff > 0 THEN
        INSERT INTO stock_products (branch_id, product_id, quantity_on_hand, min_stock)
        VALUES (v_branch_id, v_product_id, -v_stock_dispatch_qty, 0)
        ON DUPLICATE KEY UPDATE
          quantity_on_hand = quantity_on_hand - v_stock_dispatch_qty,
          updated_at = CURRENT_TIMESTAMP;
        INSERT INTO inventory_movements (
          branch_id, item_type, raw_material_id, product_id, movement_type,
          quantity, unit_cost, reference_type, reference_id, notes, created_by
        ) VALUES (
          v_branch_id, 'product', NULL, v_product_id, 'sale_out',
          v_stock_dispatch_qty, NULL, 'order', p_order_id,
          CONCAT('Venta posterior al reporte diario; item ', v_item_id), p_actor_user_id
        );
      END IF;
    END IF;
    SET v_dispatched_rows = v_dispatched_rows + 1;
  END LOOP;
  CLOSE cur_items;

  UPDATE orders SET status = 'dispatched', updated_at = CURRENT_TIMESTAMP WHERE id = p_order_id;
  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (p_actor_user_id, 'order.dispatch', 'orders', CAST(p_order_id AS CHAR),
    JSON_OBJECT('dispatched_items', v_dispatched_rows, 'inventory_mode', 'deferred_until_daily_production'));
  COMMIT;
  SET o_code = 1;
  SET o_message = 'pedido despachado';
  SET o_data_json = JSON_OBJECT('order_id', p_order_id, 'dispatched_items', v_dispatched_rows);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_employee_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_employee_create`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_employee_code VARCHAR(60),
  IN p_document_id VARCHAR(30),
  IN p_job_type VARCHAR(30),
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_employee_id BIGINT UNSIGNED;
  DECLARE v_job_type VARCHAR(30) DEFAULT 'other';

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET v_job_type = CASE
    WHEN p_job_type IN ('baker','packer','operator','admin','other') THEN p_job_type
    ELSE 'other'
  END;

  START TRANSACTION;

  IF NOT EXISTS (
    SELECT 1
    FROM users
    WHERE id = p_user_id
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'usuario no encontrado o inactivo';
  END IF;

  INSERT INTO employees (
    user_id,
    employee_code,
    document_id,
    job_type,
    status,
    notes
  )
  VALUES (
    p_user_id,
    NULLIF(TRIM(p_employee_code), ''),
    NULLIF(TRIM(p_document_id), ''),
    v_job_type,
    'active',
    p_notes
  );

  SET v_employee_id = LAST_INSERT_ID();

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'employee.create',
    'employees',
    CAST(v_employee_id AS CHAR),
    JSON_OBJECT('user_id', p_user_id, 'job_type', v_job_type)
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'empleado creado';
  SET o_data_json = JSON_OBJECT('employee_id', v_employee_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_employee_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_employee_list`(
  IN p_status VARCHAR(20),
  IN p_job_type VARCHAR(30),
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 50;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = GREATEST(COALESCE(p_page, 1), 1);
  SET v_page_size = LEAST(GREATEST(COALESCE(p_page_size, 50), 1), 200);
  SET v_offset = (v_page - 1) * v_page_size;

  SET o_code = 1;
  SET o_message = 'empleados listados';

  SELECT JSON_OBJECT(
    'items',
    COALESCE(JSON_ARRAYAGG(
      JSON_OBJECT(
        'id', x.id,
        'user_id', x.user_id,
        'employee_code', x.employee_code,
        'document_id', x.document_id,
        'job_type', x.job_type,
        'status', x.status,
        'notes', x.notes,
        'full_name', x.full_name,
        'username', x.username,
        'email', x.email
      )
    ), JSON_ARRAY()),
    'page', v_page,
    'pageSize', v_page_size
  )
  INTO o_data_json
  FROM (
    SELECT
      e.id,
      e.user_id,
      e.employee_code,
      e.document_id,
      e.job_type,
      e.status,
      e.notes,
      u.full_name,
      u.username,
      u.email
    FROM employees e
    INNER JOIN users u ON u.id = e.user_id
    WHERE e.deleted_at IS NULL
      AND (p_status IS NULL OR p_status = '' OR e.status = p_status)
      AND (p_job_type IS NULL OR p_job_type = '' OR e.job_type = p_job_type)
      AND (
        p_search IS NULL OR p_search = ''
        OR u.full_name LIKE CONCAT('%', p_search, '%')
        OR u.username LIKE CONCAT('%', p_search, '%')
        OR u.email LIKE CONCAT('%', p_search, '%')
        OR e.employee_code LIKE CONCAT('%', p_search, '%')
        OR e.document_id LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY u.full_name
    LIMIT v_page_size OFFSET v_offset
  ) x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_order_upsert_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_order_upsert_item`(
  IN p_order_id BIGINT UNSIGNED,
  IN p_product_id BIGINT UNSIGNED,
  IN p_quantity DECIMAL(12,3),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255)
)
BEGIN
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_status VARCHAR(30);
  DECLARE v_unit_price DECIMAL(12,2);
  DECLARE v_tax_percent DECIMAL(5,2);
  DECLARE v_subtotal DECIMAL(12,2);
  DECLARE v_tax DECIMAL(12,2);
  DECLARE v_total DECIMAL(12,2);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
  END;

  SET o_code = 0;
  SET o_message = 'operacion completada';

  IF p_quantity IS NULL OR p_quantity <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad (quantity) debe ser mayor que 0';
  END IF;

  START TRANSACTION;

  SELECT status
    INTO v_status
  FROM orders
  WHERE id = p_order_id
  FOR UPDATE;

  IF v_status IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'pedido no encontrado';
  END IF;

  IF v_status NOT IN ('draft', 'confirmed') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el estado del pedido no permite cambios de items';
  END IF;

  SELECT p.base_price, t.rate_percent
    INTO v_unit_price, v_tax_percent
  FROM products p
  INNER JOIN tax_rates t ON t.id = p.tax_rate_id
  WHERE p.id = p_product_id
    AND p.is_active = 1
    AND p.deleted_at IS NULL
    AND t.is_active = 1;

  IF v_unit_price IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto no encontrado o inactivo';
  END IF;

  SET v_subtotal = ROUND(p_quantity * v_unit_price, 2);
  SET v_tax = ROUND(v_subtotal * (v_tax_percent / 100), 2);
  SET v_total = ROUND(v_subtotal + v_tax, 2);

  INSERT INTO order_items (
    order_id, product_id, quantity, unit_price, tax_percent,
    line_subtotal, line_tax, line_total
  )
  VALUES (
    p_order_id, p_product_id, p_quantity, v_unit_price, v_tax_percent,
    v_subtotal, v_tax, v_total
  )
  ON DUPLICATE KEY UPDATE
    quantity = VALUES(quantity),
    unit_price = VALUES(unit_price),
    tax_percent = VALUES(tax_percent),
    line_subtotal = VALUES(line_subtotal),
    line_tax = VALUES(line_tax),
    line_total = VALUES(line_total);

  UPDATE orders o
  INNER JOIN (
    SELECT
      order_id,
      ROUND(SUM(line_subtotal), 2) AS subtotal,
      ROUND(SUM(line_tax), 2) AS tax_total,
      ROUND(SUM(line_total), 2) AS grand_total
    FROM order_items
    WHERE order_id = p_order_id
    GROUP BY order_id
  ) x ON x.order_id = o.id
  SET
    o.subtotal = x.subtotal,
    o.tax_total = x.tax_total,
    o.grand_total = x.grand_total,
    o.updated_at = CURRENT_TIMESTAMP;

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'order.item.upsert',
    'orders',
    CAST(p_order_id AS CHAR),
    JSON_OBJECT('product_id', p_product_id, 'quantity', p_quantity)
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'item de pedido insertado o actualizado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_packing_pending_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_packing_pending_list`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_search VARCHAR(120),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  SET o_code = 1;
  SET o_message = 'pendientes por contar listados';

  SELECT COALESCE(JSON_ARRAYAGG(
    JSON_OBJECT(
      'production_batch_id', x.production_batch_id,
      'branch_id', x.branch_id,
      'branch_name', x.branch_name,
      'recipe_id', x.recipe_id,
      'recipe_name', x.recipe_name,
      'baker_employee_id', x.baker_employee_id,
      'baker_name', x.baker_name,
      'produced_date', x.produced_date,
      'status', x.status,
      'items', x.items
    )
  ), JSON_ARRAY())
  INTO o_data_json
  FROM (
    SELECT
      pb.id AS production_batch_id,
      pb.branch_id,
      b.name AS branch_name,
      pb.recipe_id,
      COALESCE(NULLIF(SUBSTRING_INDEX(r.notes, ' - ', 1), ''), p.name, CONCAT('Receta #', r.id)) AS recipe_name,
      pb.baker_employee_id,
      u.full_name AS baker_name,
      pb.produced_date,
      pb.status,
      JSON_ARRAYAGG(
        JSON_OBJECT(
          'production_batch_output_id', pbo.id,
          'product_id', pbo.product_id,
          'product_name', po.name,
          'product_sku', po.sku,
          'counted_quantity', pbo.counted_quantity,
          'packed_quantity', pbo.packed_quantity,
          'damaged_quantity', pbo.damaged_quantity,
          'missing_quantity', pbo.missing_quantity,
          'direct_delivered_quantity', pbo.direct_delivered_quantity,
          'reserved_quantity', COALESCE(res.reserved_quantity, 0),
          'packing_note', pbo.packing_note
        )
      ) AS items
    FROM production_batches pb
    INNER JOIN branches b ON b.id = pb.branch_id
    INNER JOIN recipes r ON r.id = pb.recipe_id
    LEFT JOIN products p ON p.id = r.product_id
    INNER JOIN employees e ON e.id = pb.baker_employee_id
    INNER JOIN users u ON u.id = e.user_id
    INNER JOIN production_batch_outputs pbo ON pbo.production_batch_id = pb.id
    INNER JOIN products po ON po.id = pbo.product_id
    LEFT JOIN (
      SELECT
        production_batch_output_id,
        SUM(quantity - delivered_quantity) AS reserved_quantity
      FROM production_sale_reservations
      WHERE status IN ('reserved','partially_delivered')
      GROUP BY production_batch_output_id
    ) res ON res.production_batch_output_id = pbo.id
    WHERE pb.status IN ('pending_packaging','partially_packed')
      AND (p_branch_id IS NULL OR pb.branch_id = p_branch_id)
      AND (
        p_search IS NULL OR p_search = ''
        OR po.name LIKE CONCAT('%', p_search, '%')
        OR u.full_name LIKE CONCAT('%', p_search, '%')
        OR p.name LIKE CONCAT('%', p_search, '%')
        OR r.notes LIKE CONCAT('%', p_search, '%')
      )
    GROUP BY
      pb.id, pb.branch_id, b.name, pb.recipe_id, r.notes, p.name,
      pb.baker_employee_id, u.full_name, pb.produced_date, pb.status
    ORDER BY pb.produced_date DESC, pb.id DESC
  ) x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_packing_report_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_packing_report_create`(
  IN p_production_batch_id BIGINT UNSIGNED,
  IN p_packer_employee_id BIGINT UNSIGNED,
  IN p_packed_date DATE,
  IN p_items_json JSON,
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_report_id BIGINT UNSIGNED;
  DECLARE v_branch_id BIGINT UNSIGNED;
  DECLARE v_item_count INT DEFAULT 0;
  DECLARE v_pending_count INT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1
      v_sqlstate = RETURNED_SQLSTATE,
      v_errno = MYSQL_ERRNO,
      v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    DROP TEMPORARY TABLE IF EXISTS tmp_packing_items;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  SELECT branch_id INTO v_branch_id
  FROM production_batches
  WHERE id = p_production_batch_id
    AND status IN ('pending_packaging','partially_packed')
  FOR UPDATE;

  IF v_branch_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'produccion no encontrada o no pendiente por contar';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM employees
    WHERE id = p_packer_employee_id
      AND job_type = 'packer'
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'contador o empaquetador no encontrado o inactivo';
  END IF;

  DROP TEMPORARY TABLE IF EXISTS tmp_packing_items;
  CREATE TEMPORARY TABLE tmp_packing_items (
    production_batch_output_id BIGINT UNSIGNED NOT NULL,
    counted_quantity DECIMAL(14,3) NOT NULL,
    packed_quantity DECIMAL(14,3) NOT NULL,
    damaged_quantity DECIMAL(14,3) NOT NULL,
    missing_quantity DECIMAL(14,3) NOT NULL,
    damage_reason VARCHAR(30) NULL,
    missing_reason VARCHAR(40) NULL,
    notes VARCHAR(255) NULL
  ) ENGINE=Memory;

  INSERT INTO tmp_packing_items (
    production_batch_output_id, counted_quantity, packed_quantity, damaged_quantity,
    missing_quantity, damage_reason, missing_reason, notes
  )
  SELECT
    jt.production_batch_output_id,
    COALESCE(jt.counted_quantity, 0),
    COALESCE(jt.packed_quantity, 0),
    COALESCE(jt.damaged_quantity, 0),
    COALESCE(jt.missing_quantity, 0),
    jt.damage_reason,
    jt.missing_reason,
    jt.notes
  FROM JSON_TABLE(
    p_items_json,
    '$[*]' COLUMNS (
      production_batch_output_id BIGINT UNSIGNED PATH '$.production_batch_output_id',
      counted_quantity DECIMAL(14,3) PATH '$.counted_quantity' DEFAULT '0' ON EMPTY,
      packed_quantity DECIMAL(14,3) PATH '$.packed_quantity' DEFAULT '0' ON EMPTY,
      damaged_quantity DECIMAL(14,3) PATH '$.damaged_quantity' DEFAULT '0' ON EMPTY,
      missing_quantity DECIMAL(14,3) PATH '$.missing_quantity' DEFAULT '0' ON EMPTY,
      damage_reason VARCHAR(30) PATH '$.damage_reason' NULL ON EMPTY,
      missing_reason VARCHAR(40) PATH '$.missing_reason' NULL ON EMPTY,
      notes VARCHAR(255) PATH '$.notes' NULL ON EMPTY
    )
  ) jt;

  SELECT COUNT(*) INTO v_item_count FROM tmp_packing_items;

  IF v_item_count = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'agrega al menos un producto contado';
  END IF;

  IF EXISTS (
    SELECT 1 FROM tmp_packing_items
    WHERE counted_quantity < 0
      OR packed_quantity < 0
      OR damaged_quantity < 0
      OR missing_quantity < 0
      OR counted_quantity <= 0
      OR (packed_quantity + damaged_quantity) > counted_quantity
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el conteo debe ser mayor a cero y empacados/danados no pueden superar lo contado';
  END IF;

  IF EXISTS (
    SELECT 1 FROM tmp_packing_items
    WHERE missing_quantity > 0
      AND (
        missing_reason IS NULL
        OR missing_reason NOT IN ('count_difference','handling_loss','suspected_theft','other')
        OR notes IS NULL
        OR TRIM(notes) = ''
      )
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'todo faltante debe tener motivo y explicacion';
  END IF;

  IF EXISTS (
    SELECT 1
    FROM tmp_packing_items t
    LEFT JOIN production_batch_outputs pbo
      ON pbo.id = t.production_batch_output_id
     AND pbo.production_batch_id = p_production_batch_id
    WHERE pbo.id IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'un producto no pertenece a la produccion seleccionada';
  END IF;

  INSERT INTO packing_reports (
    production_batch_id, packer_employee_id, packed_date, notes, created_by
  ) VALUES (
    p_production_batch_id, p_packer_employee_id,
    COALESCE(p_packed_date, CURRENT_DATE), p_notes, p_actor_user_id
  );

  SET v_report_id = LAST_INSERT_ID();

  INSERT INTO packing_report_items (
    packing_report_id, production_batch_output_id, product_id,
    counted_quantity, packed_quantity, damaged_quantity, missing_quantity,
    damage_reason, missing_reason, notes
  )
  SELECT
    v_report_id, pbo.id, pbo.product_id,
    t.counted_quantity, t.packed_quantity, t.damaged_quantity, t.missing_quantity,
    CASE
      WHEN t.damage_reason IN ('production','oven','cut','packaging') THEN t.damage_reason
      ELSE NULL
    END,
    CASE
      WHEN t.missing_reason IN ('count_difference','handling_loss','suspected_theft','other')
      THEN t.missing_reason
      ELSE NULL
    END,
    t.notes
  FROM tmp_packing_items t
  INNER JOIN production_batch_outputs pbo ON pbo.id = t.production_batch_output_id;

  INSERT INTO production_damages (
    production_batch_id, production_batch_output_id, product_id,
    responsible_employee_id, damage_stage, quantity, damaged_date, notes, created_by
  )
  SELECT
    p_production_batch_id, pbo.id, pbo.product_id, p_packer_employee_id,
    CASE
      WHEN t.damage_reason IN ('production','oven','cut','packaging') THEN t.damage_reason
      ELSE 'packaging'
    END,
    t.damaged_quantity, COALESCE(p_packed_date, CURRENT_DATE), t.notes, p_actor_user_id
  FROM tmp_packing_items t
  INNER JOIN production_batch_outputs pbo ON pbo.id = t.production_batch_output_id
  WHERE t.damaged_quantity > 0;

  UPDATE production_batch_outputs pbo
  INNER JOIN tmp_packing_items t ON t.production_batch_output_id = pbo.id
  SET pbo.counted_quantity = pbo.counted_quantity + t.counted_quantity,
      pbo.packed_quantity = pbo.packed_quantity + t.packed_quantity,
      pbo.damaged_quantity = pbo.damaged_quantity + t.damaged_quantity,
      pbo.missing_quantity = pbo.missing_quantity + t.missing_quantity,
      pbo.updated_at = CURRENT_TIMESTAMP;

  INSERT INTO inventory_movements (
    branch_id, item_type, raw_material_id, product_id, movement_type,
    quantity, unit_cost, reference_type, reference_id, notes, created_by
  )
  SELECT
    v_branch_id, 'product', NULL, pbo.product_id, 'production_in',
    t.packed_quantity, NULL, 'packing_report', v_report_id, p_notes, p_actor_user_id
  FROM tmp_packing_items t
  INNER JOIN production_batch_outputs pbo ON pbo.id = t.production_batch_output_id
  WHERE t.packed_quantity > 0;

  INSERT INTO stock_products (branch_id, product_id, quantity_on_hand, min_stock)
  SELECT DISTINCT v_branch_id, pbo.product_id, 0, 0
  FROM tmp_packing_items t
  INNER JOIN production_batch_outputs pbo ON pbo.id = t.production_batch_output_id
  ON DUPLICATE KEY UPDATE quantity_on_hand = quantity_on_hand;

  UPDATE stock_products sp
  INNER JOIN (
    SELECT pbo.product_id, SUM(t.packed_quantity) AS qty
    FROM tmp_packing_items t
    INNER JOIN production_batch_outputs pbo ON pbo.id = t.production_batch_output_id
    GROUP BY pbo.product_id
  ) x ON x.product_id = sp.product_id
  SET sp.quantity_on_hand = sp.quantity_on_hand + x.qty
  WHERE sp.branch_id = v_branch_id;

  SELECT COUNT(*) INTO v_pending_count
  FROM production_batch_outputs
  WHERE production_batch_id = p_production_batch_id
    AND counted_quantity <= 0;

  UPDATE production_batches
  SET status = CASE WHEN v_pending_count = 0 THEN 'packed' ELSE 'partially_packed' END,
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_production_batch_id;

  DROP TEMPORARY TABLE IF EXISTS tmp_packing_items;

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'packing.report.create',
    'packing_reports',
    CAST(v_report_id AS CHAR),
    JSON_OBJECT(
      'production_batch_id', p_production_batch_id,
      'packer_employee_id', p_packer_employee_id,
      'independent_count', true
    )
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'conteo y empaque registrados';
  SET o_data_json = JSON_OBJECT('packing_report_id', v_report_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_packing_summary_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_packing_summary_report`(
  IN p_date_from DATE,
  IN p_date_to DATE,
  IN p_branch_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  SET o_code = 1;
  SET o_message = 'reporte de empaque generado';

  SELECT COALESCE(JSON_ARRAYAGG(
    JSON_OBJECT(
      'product_id', x.product_id,
      'product_name', x.product_name,
      'product_sku', x.product_sku,
      'packed_quantity', x.packed_quantity,
      'damaged_quantity', x.damaged_quantity,
      'bakers', x.bakers,
      'packers', x.packers
    )
  ), JSON_ARRAY())
  INTO o_data_json
  FROM (
    SELECT
      p.id AS product_id,
      p.name AS product_name,
      p.sku AS product_sku,
      SUM(pri.packed_quantity) AS packed_quantity,
      SUM(pri.damaged_quantity) AS damaged_quantity,
      GROUP_CONCAT(DISTINCT baker_user.full_name ORDER BY baker_user.full_name SEPARATOR ', ') AS bakers,
      GROUP_CONCAT(DISTINCT packer_user.full_name ORDER BY packer_user.full_name SEPARATOR ', ') AS packers
    FROM packing_report_items pri
    INNER JOIN packing_reports pr ON pr.id = pri.packing_report_id
    INNER JOIN production_batches pb ON pb.id = pr.production_batch_id
    INNER JOIN products p ON p.id = pri.product_id
    INNER JOIN employees baker ON baker.id = pb.baker_employee_id
    INNER JOIN users baker_user ON baker_user.id = baker.user_id
    INNER JOIN employees packer ON packer.id = pr.packer_employee_id
    INNER JOIN users packer_user ON packer_user.id = packer.user_id
    WHERE pr.packed_date BETWEEN COALESCE(p_date_from, CURRENT_DATE) AND COALESCE(p_date_to, CURRENT_DATE)
      AND (p_branch_id IS NULL OR pb.branch_id = p_branch_id)
    GROUP BY p.id, p.name, p.sku
    ORDER BY p.name
  ) x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permission_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permission_create`(
  IN p_code VARCHAR(100),
  IN p_name VARCHAR(150),
  IN p_description VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_permission_id BIGINT UNSIGNED;

  IF p_code IS NULL OR CHAR_LENGTH(TRIM(p_code)) < 3 THEN
    SET o_code = 0;
    SET o_message = 'el codigo de permiso es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 3 THEN
    SET o_code = 0;
    SET o_message = 'el nombre de permiso es obligatorio';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM permissions WHERE code = TRIM(p_code)) THEN
    SET o_code = 0;
    SET o_message = 'el codigo de permiso ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO permissions (code, name, description)
    VALUES (TRIM(p_code), TRIM(p_name), p_description);

    SET v_permission_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'permission.create', 'permissions', CAST(v_permission_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'permiso creado';
    SET o_data_json = JSON_OBJECT('permission_id', v_permission_id, 'code', TRIM(p_code));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_permission_list_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_permission_list_by_user`(
  IN p_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_user_exists INT DEFAULT 0;
  DECLARE v_permission_mode VARCHAR(20) DEFAULT 'inherit';
  DECLARE v_roles_json LONGTEXT;
  DECLARE v_permissions_json LONGTEXT;

  SELECT COUNT(*)
    INTO v_user_exists
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL;

  IF v_user_exists = 0 THEN
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    SELECT COALESCE(MAX(permission_mode), 'inherit')
      INTO v_permission_mode
    FROM user_permission_profiles
    WHERE user_id = p_user_id;

    SELECT IFNULL(
             CONCAT('[', GROUP_CONCAT(DISTINCT JSON_QUOTE(r.code) ORDER BY r.code SEPARATOR ','), ']'),
             '[]'
           )
      INTO v_roles_json
    FROM user_roles ur
    INNER JOIN roles r ON r.id = ur.role_id
    WHERE ur.user_id = p_user_id;

    IF v_permission_mode = 'custom' THEN
      SELECT IFNULL(
               CONCAT('[', GROUP_CONCAT(JSON_QUOTE(x.code) ORDER BY x.code SEPARATOR ','), ']'),
               '[]'
             )
        INTO v_permissions_json
      FROM (
        SELECT DISTINCT p.code
        FROM user_permissions up
        INNER JOIN permissions p ON p.id = up.permission_id
        WHERE up.user_id = p_user_id
        ORDER BY p.code
      ) x;
    ELSE
      SELECT IFNULL(
               CONCAT('[', GROUP_CONCAT(JSON_QUOTE(x.code) ORDER BY x.code SEPARATOR ','), ']'),
               '[]'
             )
        INTO v_permissions_json
      FROM (
        SELECT DISTINCT p.code
        FROM user_roles ur
        INNER JOIN role_permissions rp ON rp.role_id = ur.role_id
        INNER JOIN permissions p ON p.id = rp.permission_id
        WHERE ur.user_id = p_user_id
        UNION
        SELECT DISTINCT p.code
        FROM user_permissions up
        INNER JOIN permissions p ON p.id = up.permission_id
        WHERE up.user_id = p_user_id
        ORDER BY code
      ) x;
    END IF;

    SET o_code = 1;
    SET o_message = 'permisos cargados';
    SET o_data_json = CONCAT(
      '{',
      '"user_id":', p_user_id, ',',
      '"permission_mode":', JSON_QUOTE(v_permission_mode), ',',
      '"roles":', IFNULL(v_roles_json, '[]'), ',',
      '"permissions":', IFNULL(v_permissions_json, '[]'),
      '}'
    );
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_production_batch_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_production_batch_register`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_baker_employee_id BIGINT UNSIGNED,
  IN p_produced_date DATE,
  IN p_batch_quantity DECIMAL(14,3),
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_batch_id BIGINT UNSIGNED;
  DECLARE v_batch_qty DECIMAL(14,3) DEFAULT 1;
  DECLARE v_recipe_output_qty DECIMAL(12,3);
  DECLARE v_output_count INT DEFAULT 0;

  DECLARE v_raw_material_id BIGINT UNSIGNED;
  DECLARE v_base_qty DECIMAL(12,4);
  DECLARE v_wastage DECIMAL(5,2);
  DECLARE v_required_qty DECIMAL(14,3);
  DECLARE v_stock_qty DECIMAL(14,3);
  DECLARE v_signal_msg VARCHAR(255);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE done INT DEFAULT 0;

  DECLARE cur_recipe CURSOR FOR
    SELECT raw_material_id, quantity, wastage_percent
    FROM recipe_items
    WHERE recipe_id = p_recipe_id;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET v_batch_qty = COALESCE(p_batch_quantity, 1);

  IF v_batch_qty <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad de produccion debe ser mayor que 0';
  END IF;

  START TRANSACTION;

  IF NOT EXISTS (SELECT 1 FROM branches WHERE id = p_branch_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'sucursal no encontrada o inactiva';
  END IF;

  SELECT output_quantity
    INTO v_recipe_output_qty
  FROM recipes
  WHERE id = p_recipe_id
    AND is_active = 1
  FOR UPDATE;

  IF v_recipe_output_qty IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'receta no encontrada o inactiva';
  END IF;

  SELECT COUNT(*) INTO v_output_count
  FROM recipe_outputs
  WHERE recipe_id = p_recipe_id;

  IF v_output_count = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la receta no tiene productos finales asociados';
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM employees
    WHERE id = p_baker_employee_id
      AND job_type = 'baker'
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'panadero no encontrado o inactivo';
  END IF;

  INSERT INTO production_batches (
    branch_id,
    recipe_id,
    baker_employee_id,
    produced_date,
    batch_quantity,
    status,
    notes,
    created_by
  )
  VALUES (
    p_branch_id,
    p_recipe_id,
    p_baker_employee_id,
    COALESCE(p_produced_date, CURRENT_DATE),
    v_batch_qty,
    'pending_packaging',
    p_notes,
    p_actor_user_id
  );

  SET v_batch_id = LAST_INSERT_ID();

  OPEN cur_recipe;

  read_loop: LOOP
    FETCH cur_recipe INTO v_raw_material_id, v_base_qty, v_wastage;
    IF done = 1 THEN
      LEAVE read_loop;
    END IF;

    SET v_required_qty = ROUND((v_base_qty * v_batch_qty) * (1 + (v_wastage / 100)), 3);

    INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
    VALUES (p_branch_id, v_raw_material_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_stock_qty
    FROM stock_raw_materials
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id
    FOR UPDATE;

    IF v_stock_qty < v_required_qty THEN
      SET v_signal_msg = CONCAT('stock insuficiente para materia prima ', v_raw_material_id);
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_signal_msg;
    END IF;

    UPDATE stock_raw_materials
    SET quantity_on_hand = quantity_on_hand - v_required_qty
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id;

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      p_branch_id, 'raw_material', v_raw_material_id, NULL, 'production_out',
      v_required_qty, NULL, 'production_batch', v_batch_id, p_notes, p_actor_user_id
    );
  END LOOP;

  CLOSE cur_recipe;

  INSERT INTO production_batch_outputs (
    production_batch_id,
    product_id,
    expected_quantity,
    produced_quantity,
    packing_note
  )
  SELECT
    v_batch_id,
    product_id,
    expected_quantity,
    ROUND(expected_quantity * v_batch_qty, 3),
    packing_note
  FROM recipe_outputs
  WHERE recipe_id = p_recipe_id;

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'production_batch.register',
    'production_batches',
    CAST(v_batch_id AS CHAR),
    JSON_OBJECT('branch_id', p_branch_id, 'recipe_id', p_recipe_id, 'baker_employee_id', p_baker_employee_id, 'batch_quantity', v_batch_qty)
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'produccion registrada y pendiente por empacar';
  SET o_data_json = JSON_OBJECT('production_batch_id', v_batch_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_production_batch_register_selected` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_production_batch_register_selected`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_baker_employee_id BIGINT UNSIGNED,
  IN p_produced_date DATE,
  IN p_batch_quantity DECIMAL(14,3),
  IN p_outputs_json JSON,
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_batch_id BIGINT UNSIGNED;
  DECLARE v_batch_qty DECIMAL(14,3) DEFAULT 1;
  DECLARE v_output_count INT DEFAULT 0;

  DECLARE v_raw_material_id BIGINT UNSIGNED;
  DECLARE v_base_qty DECIMAL(12,4);
  DECLARE v_wastage DECIMAL(5,2);
  DECLARE v_required_qty DECIMAL(14,3);
  DECLARE v_stock_qty DECIMAL(14,3);
  DECLARE v_signal_msg VARCHAR(255);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE done INT DEFAULT 0;

  DECLARE cur_recipe CURSOR FOR
    SELECT raw_material_id, quantity, wastage_percent
    FROM recipe_items
    WHERE recipe_id = p_recipe_id;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    DROP TEMPORARY TABLE IF EXISTS tmp_selected_outputs;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET v_batch_qty = COALESCE(p_batch_quantity, 1);

  IF v_batch_qty <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad de mojes debe ser mayor que 0';
  END IF;

  DROP TEMPORARY TABLE IF EXISTS tmp_selected_outputs;
  CREATE TEMPORARY TABLE tmp_selected_outputs (
    product_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (product_id)
  ) ENGINE=Memory;

  INSERT IGNORE INTO tmp_selected_outputs (product_id)
  SELECT jt.product_id
  FROM JSON_TABLE(
    COALESCE(p_outputs_json, JSON_ARRAY()),
    '$[*]' COLUMNS (
      product_id BIGINT UNSIGNED PATH '$.product_id'
    )
  ) jt
  WHERE jt.product_id IS NOT NULL;

  SELECT COUNT(*) INTO v_output_count
  FROM tmp_selected_outputs;

  IF v_output_count = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'selecciona al menos un producto final para realizar';
  END IF;

  IF EXISTS (
    SELECT 1
    FROM tmp_selected_outputs t
    LEFT JOIN recipe_outputs ro
      ON ro.recipe_id = p_recipe_id
     AND ro.product_id = t.product_id
    WHERE ro.id IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'un producto final no pertenece a la receta seleccionada';
  END IF;

  START TRANSACTION;

  IF NOT EXISTS (SELECT 1 FROM branches WHERE id = p_branch_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'sucursal no encontrada o inactiva';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM recipes WHERE id = p_recipe_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'receta no encontrada o inactiva';
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM employees
    WHERE id = p_baker_employee_id
      AND job_type = 'baker'
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'panadero no encontrado o inactivo';
  END IF;

  INSERT INTO production_batches (
    branch_id,
    recipe_id,
    baker_employee_id,
    produced_date,
    batch_quantity,
    status,
    notes,
    created_by
  )
  VALUES (
    p_branch_id,
    p_recipe_id,
    p_baker_employee_id,
    COALESCE(p_produced_date, CURRENT_DATE),
    v_batch_qty,
    'pending_packaging',
    p_notes,
    p_actor_user_id
  );

  SET v_batch_id = LAST_INSERT_ID();

  OPEN cur_recipe;

  read_loop: LOOP
    FETCH cur_recipe INTO v_raw_material_id, v_base_qty, v_wastage;
    IF done = 1 THEN
      LEAVE read_loop;
    END IF;

    SET v_required_qty = ROUND((v_base_qty * v_batch_qty) * (1 + (v_wastage / 100)), 3);

    INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
    VALUES (p_branch_id, v_raw_material_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_stock_qty
    FROM stock_raw_materials
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id
    FOR UPDATE;

    IF v_stock_qty < v_required_qty THEN
      SET v_signal_msg = CONCAT('stock insuficiente para materia prima ', v_raw_material_id);
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_signal_msg;
    END IF;

    UPDATE stock_raw_materials
    SET quantity_on_hand = quantity_on_hand - v_required_qty
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id;

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      p_branch_id, 'raw_material', v_raw_material_id, NULL, 'production_out',
      v_required_qty, NULL, 'production_batch', v_batch_id, p_notes, p_actor_user_id
    );
  END LOOP;

  CLOSE cur_recipe;

  INSERT INTO production_batch_outputs (
    production_batch_id,
    product_id,
    expected_quantity,
    produced_quantity,
    packing_note
  )
  SELECT
    v_batch_id,
    ro.product_id,
    ro.expected_quantity,
    ROUND(ro.expected_quantity * v_batch_qty, 3),
    ro.packing_note
  FROM recipe_outputs ro
  INNER JOIN tmp_selected_outputs t ON t.product_id = ro.product_id
  WHERE ro.recipe_id = p_recipe_id;

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'production_batch.register_selected',
    'production_batches',
    CAST(v_batch_id AS CHAR),
    JSON_OBJECT('branch_id', p_branch_id, 'recipe_id', p_recipe_id, 'baker_employee_id', p_baker_employee_id, 'batch_quantity', v_batch_qty, 'outputs', v_output_count)
  );

  COMMIT;

  DROP TEMPORARY TABLE IF EXISTS tmp_selected_outputs;

  SET o_code = 1;
  SET o_message = 'produccion registrada con productos seleccionados y pendiente por empacar';
  SET o_data_json = JSON_OBJECT('production_batch_id', v_batch_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_production_damage_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_production_damage_register`(
  IN p_production_batch_id BIGINT UNSIGNED,
  IN p_production_batch_output_id BIGINT UNSIGNED,
  IN p_product_id BIGINT UNSIGNED,
  IN p_responsible_employee_id BIGINT UNSIGNED,
  IN p_damage_stage VARCHAR(30),
  IN p_quantity DECIMAL(14,3),
  IN p_damaged_date DATE,
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_damage_id BIGINT UNSIGNED;
  DECLARE v_output_id BIGINT UNSIGNED;
  DECLARE v_product_id BIGINT UNSIGNED;
  DECLARE v_pending_qty DECIMAL(14,3);
  DECLARE v_output_count INT DEFAULT 0;
  DECLARE v_pending_count INT DEFAULT 0;
  DECLARE v_stage VARCHAR(30);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET v_stage = CASE
    WHEN p_damage_stage IN ('oven','cut','packaging') THEN p_damage_stage
    ELSE NULL
  END;

  IF v_stage IS NULL THEN
    SET o_code = 0;
    SET o_message = 'motivo de dano invalido';
    SET o_data_json = NULL;
  ELSEIF p_quantity IS NULL OR p_quantity <= 0 THEN
    SET o_code = 0;
    SET o_message = 'la cantidad danada debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    IF p_production_batch_output_id IS NOT NULL THEN
      SELECT COUNT(*) INTO v_output_count
      FROM production_batch_outputs pbo
      WHERE pbo.id = p_production_batch_output_id
        AND pbo.production_batch_id = p_production_batch_id;
    ELSE
      SET v_output_count = 0;
    END IF;

    IF v_output_count > 0 THEN
      SELECT
        pbo.id,
        pbo.product_id,
        (pbo.produced_quantity - pbo.packed_quantity - pbo.damaged_quantity)
      INTO v_output_id, v_product_id, v_pending_qty
      FROM production_batch_outputs pbo
      WHERE pbo.production_batch_id = p_production_batch_id
        AND pbo.id = p_production_batch_output_id
      FOR UPDATE;
    ELSE
      SELECT COUNT(*) INTO v_output_count
      FROM production_batch_outputs pbo
      WHERE pbo.production_batch_id = p_production_batch_id
        AND pbo.product_id = p_product_id;

      IF v_output_count > 0 THEN
        SELECT
          pbo.id,
          pbo.product_id,
          (pbo.produced_quantity - pbo.packed_quantity - pbo.damaged_quantity)
        INTO v_output_id, v_product_id, v_pending_qty
        FROM production_batch_outputs pbo
        WHERE pbo.production_batch_id = p_production_batch_id
          AND pbo.product_id = p_product_id
        LIMIT 1
        FOR UPDATE;
      END IF;
    END IF;

    IF v_output_id IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto producido no encontrado';
    END IF;

    IF v_pending_qty < p_quantity THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad danada supera el pendiente';
    END IF;

    IF p_responsible_employee_id IS NOT NULL
      AND NOT EXISTS (
        SELECT 1
        FROM employees
        WHERE id = p_responsible_employee_id
          AND status = 'active'
          AND deleted_at IS NULL
      ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'responsable no encontrado o inactivo';
    END IF;

    INSERT INTO production_damages (
      production_batch_id,
      production_batch_output_id,
      product_id,
      responsible_employee_id,
      damage_stage,
      quantity,
      damaged_date,
      notes,
      created_by
    )
    VALUES (
      p_production_batch_id,
      v_output_id,
      v_product_id,
      p_responsible_employee_id,
      v_stage,
      p_quantity,
      COALESCE(p_damaged_date, CURRENT_DATE),
      p_notes,
      p_actor_user_id
    );

    SET v_damage_id = LAST_INSERT_ID();

    UPDATE production_batch_outputs
    SET damaged_quantity = damaged_quantity + p_quantity,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = v_output_id;

    SELECT COUNT(*) INTO v_pending_count
    FROM production_batch_outputs
    WHERE production_batch_id = p_production_batch_id
      AND (produced_quantity - packed_quantity - damaged_quantity) > 0;

    UPDATE production_batches
    SET status = CASE WHEN v_pending_count = 0 THEN 'packed' ELSE 'partially_packed' END,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_production_batch_id;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'production.damage.register',
      'production_damages',
      CAST(v_damage_id AS CHAR),
      JSON_OBJECT('production_batch_id', p_production_batch_id, 'product_id', v_product_id, 'damage_stage', v_stage, 'quantity', p_quantity)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'dano de produccion registrado';
    SET o_data_json = JSON_OBJECT('production_damage_id', v_damage_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_production_output_materials_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_production_output_materials_list`(
  IN p_production_batch_id BIGINT UNSIGNED,
  IN p_production_batch_output_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  SET o_code = 1;
  SET o_message = 'ingredientes posteriores listados';

  SELECT COALESCE(JSON_ARRAYAGG(
    JSON_OBJECT(
      'id', x.id,
      'production_batch_id', x.production_batch_id,
      'production_batch_output_id', x.production_batch_output_id,
      'product_id', x.product_id,
      'product_name', x.product_name,
      'raw_material_id', x.raw_material_id,
      'raw_material_name', x.raw_material_name,
      'raw_material_unit', x.raw_material_unit,
      'concept', x.concept,
      'quantity', x.quantity,
      'notes', x.notes,
      'created_at', x.created_at
    )
  ), JSON_ARRAY())
  INTO o_data_json
  FROM (
    SELECT
      pom.id,
      pom.production_batch_id,
      pom.production_batch_output_id,
      pom.product_id,
      p.name AS product_name,
      pom.raw_material_id,
      rm.name AS raw_material_name,
      rm.unit AS raw_material_unit,
      pom.concept,
      pom.quantity,
      pom.notes,
      pom.created_at
    FROM production_output_materials pom
    INNER JOIN products p ON p.id = pom.product_id
    INNER JOIN raw_materials rm ON rm.id = pom.raw_material_id
    WHERE (p_production_batch_id IS NULL OR pom.production_batch_id = p_production_batch_id)
      AND (p_production_batch_output_id IS NULL OR pom.production_batch_output_id = p_production_batch_output_id)
    ORDER BY pom.created_at DESC, pom.id DESC
  ) x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_production_output_material_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_production_output_material_add`(
  IN p_production_batch_id BIGINT UNSIGNED,
  IN p_production_batch_output_id BIGINT UNSIGNED,
  IN p_raw_material_id BIGINT UNSIGNED,
  IN p_concept VARCHAR(60),
  IN p_quantity DECIMAL(14,4),
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_material_entry_id BIGINT UNSIGNED;
  DECLARE v_branch_id BIGINT UNSIGNED;
  DECLARE v_product_id BIGINT UNSIGNED;
  DECLARE v_stock_qty DECIMAL(14,3);
  DECLARE v_concept VARCHAR(60);
  DECLARE v_signal_msg VARCHAR(255);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET v_concept = COALESCE(NULLIF(TRIM(p_concept), ''), 'RELLENO');

  IF p_quantity IS NULL OR p_quantity <= 0 THEN
    SET o_code = 0;
    SET o_message = 'la cantidad debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    SELECT
      pb.branch_id,
      pbo.product_id
    INTO
      v_branch_id,
      v_product_id
    FROM production_batch_outputs pbo
    INNER JOIN production_batches pb ON pb.id = pbo.production_batch_id
    WHERE pb.id = p_production_batch_id
      AND pbo.id = p_production_batch_output_id
      AND pb.status IN ('pending_packaging','partially_packed')
    FOR UPDATE;

    IF v_branch_id IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto de produccion no encontrado o no pendiente por conteo';
    END IF;

    IF NOT EXISTS (
      SELECT 1
      FROM raw_materials
      WHERE id = p_raw_material_id
        AND is_active = 1
        AND deleted_at IS NULL
    ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'materia prima no encontrada o inactiva';
    END IF;

    INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
    VALUES (v_branch_id, p_raw_material_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_stock_qty
    FROM stock_raw_materials
    WHERE branch_id = v_branch_id
      AND raw_material_id = p_raw_material_id
    FOR UPDATE;

    IF v_stock_qty < p_quantity THEN
      SET v_signal_msg = CONCAT('stock insuficiente para materia prima ', p_raw_material_id);
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_signal_msg;
    END IF;

    UPDATE stock_raw_materials
    SET quantity_on_hand = quantity_on_hand - p_quantity
    WHERE branch_id = v_branch_id
      AND raw_material_id = p_raw_material_id;

    INSERT INTO production_output_materials (
      production_batch_id,
      production_batch_output_id,
      product_id,
      raw_material_id,
      concept,
      quantity,
      notes,
      created_by
    )
    VALUES (
      p_production_batch_id,
      p_production_batch_output_id,
      v_product_id,
      p_raw_material_id,
      v_concept,
      p_quantity,
      p_notes,
      p_actor_user_id
    );

    SET v_material_entry_id = LAST_INSERT_ID();

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      v_branch_id, 'raw_material', p_raw_material_id, NULL, 'production_out',
      p_quantity, NULL, 'production_output_material', v_material_entry_id, p_notes, p_actor_user_id
    );

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'production.output_material.add',
      'production_output_materials',
      CAST(v_material_entry_id AS CHAR),
      JSON_OBJECT(
        'production_batch_id', p_production_batch_id,
        'production_batch_output_id', p_production_batch_output_id,
        'raw_material_id', p_raw_material_id,
        'quantity', p_quantity
      )
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'ingrediente posterior registrado';
    SET o_data_json = JSON_OBJECT('production_output_material_id', v_material_entry_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_category_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_category_create`(
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF EXISTS (SELECT 1 FROM product_categories WHERE name = TRIM(p_name)) THEN
    SET o_code = 0;
    SET o_message = 'la categoria de producto ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO product_categories (name, description, is_active)
    VALUES (TRIM(p_name), p_description, IFNULL(p_is_active, 1));

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'product_category.create', 'product_categories', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'categoria de producto creada';
    SET o_data_json = JSON_OBJECT('category_id', v_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_category_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_category_list`(
  IN p_only_active TINYINT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_items_json LONGTEXT;

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', c.id,
             'name', c.name,
             'description', c.description,
             'is_active', c.is_active
           ) ORDER BY c.name SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM product_categories c
  WHERE (IFNULL(p_only_active, 0) = 0 OR c.is_active = 1);

  SET o_code = 1;
  SET o_message = 'categorias de producto listadas';
  SET o_data_json = CONCAT('{"items":', IFNULL(v_items_json, '[]'), '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_category_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_category_update`(
  IN p_category_id BIGINT UNSIGNED,
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE product_categories
  SET name = TRIM(p_name),
      description = p_description,
      is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_category_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'categoria de producto no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'product_category.update', 'product_categories', CAST(p_category_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'categoria de producto actualizada';
    SET o_data_json = JSON_OBJECT('category_id', p_category_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_create`(
  IN p_sku VARCHAR(60), IN p_name VARCHAR(150), IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED, IN p_tax_rate_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20), IN p_base_price DECIMAL(12,2), IN p_min_stock DECIMAL(12,3),
  IN p_units_per_bag DECIMAL(14,3), IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT, OUT o_message VARCHAR(255), OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_base_price < 0 OR p_min_stock < 0 THEN
    SET o_code = 0; SET o_message = 'base_price y min_stock deben ser >= 0'; SET o_data_json = NULL;
  ELSEIF p_units_per_bag IS NOT NULL AND p_units_per_bag <= 0 THEN
    SET o_code = 0; SET o_message = 'unidades por bulto debe ser mayor que 0'; SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM product_categories WHERE id = p_category_id AND is_active = 1) THEN
    SET o_code = 0; SET o_message = 'categoria de producto no encontrada o inactiva'; SET o_data_json = NULL;
  ELSEIF p_tax_rate_id IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM tax_rates WHERE id = p_tax_rate_id AND is_active = 1) THEN
    SET o_code = 0; SET o_message = 'tasa de impuesto no encontrada o inactiva'; SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM products WHERE sku = TRIM(p_sku)) THEN
    SET o_code = 0; SET o_message = 'el sku de producto ya existe'; SET o_data_json = NULL;
  ELSE
    INSERT INTO products (
      sku, name, description, category_id, tax_rate_id, unit,
      base_price, min_stock, units_per_bag, is_active
    ) VALUES (
      TRIM(p_sku), TRIM(p_name), p_description, p_category_id, p_tax_rate_id,
      p_unit, p_base_price, p_min_stock, p_units_per_bag, IFNULL(p_is_active, 1)
    );
    SET v_id = LAST_INSERT_ID();
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (p_actor_user_id, 'product.create', 'products', CAST(v_id AS CHAR),
      JSON_OBJECT('units_per_bag', p_units_per_bag, 'tax_rate_id', p_tax_rate_id));
    SET o_code = 1; SET o_message = 'producto creado';
    SET o_data_json = JSON_OBJECT('product_id', v_id, 'sku', TRIM(p_sku));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_list`(
  IN p_only_active TINYINT,
  IN p_category_id BIGINT UNSIGNED,
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_total BIGINT DEFAULT 0;
  DECLARE v_items_json LONGTEXT;
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 20;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = IFNULL(NULLIF(p_page, 0), 1);
  IF v_page < 1 THEN
    SET v_page = 1;
  END IF;

  SET v_page_size = IFNULL(NULLIF(p_page_size, 0), 20);
  IF v_page_size < 1 THEN
    SET v_page_size = 20;
  ELSEIF v_page_size > 200 THEN
    SET v_page_size = 200;
  END IF;

  SET v_offset = (v_page - 1) * v_page_size;

  SELECT COUNT(*)
    INTO v_total
  FROM products p
  WHERE p.deleted_at IS NULL
    AND (IFNULL(p_only_active, 0) = 0 OR p.is_active = 1)
    AND (p_category_id IS NULL OR p.category_id = p_category_id)
    AND (
      p_search IS NULL OR p_search = ''
      OR p.sku LIKE CONCAT('%', p_search, '%')
      OR p.name LIKE CONCAT('%', p_search, '%')
    );

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'sku', x.sku,
             'name', x.name,
             'description', x.description,
             'category_id', x.category_id,
             'tax_rate_id', x.tax_rate_id,
             'unit', x.unit,
             'base_price', x.base_price,
             'min_stock', x.min_stock,
             'units_per_bag', x.units_per_bag,
             'is_active', x.is_active
           ) ORDER BY x.id SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT
      p.id,
      p.sku,
      p.name,
      p.description,
      p.category_id,
      p.tax_rate_id,
      p.unit,
      p.base_price,
      p.min_stock,
      p.units_per_bag,
      p.is_active
    FROM products p
    WHERE p.deleted_at IS NULL
      AND (IFNULL(p_only_active, 0) = 0 OR p.is_active = 1)
      AND (p_category_id IS NULL OR p.category_id = p_category_id)
      AND (
        p_search IS NULL OR p_search = ''
        OR p.sku LIKE CONCAT('%', p_search, '%')
        OR p.name LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY p.id DESC
    LIMIT v_offset, v_page_size
  ) x;

  SET o_code = 1;
  SET o_message = 'productos listados';
  SET o_data_json = CONCAT(
    '{',
    '"page":', v_page, ',',
    '"page_size":', v_page_size, ',',
    '"total":', v_total, ',',
    '"items":', IFNULL(v_items_json, '[]'),
    '}'
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_set_status`(
  IN p_product_id BIGINT UNSIGNED,
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE products
  SET is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_product_id
    AND deleted_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'producto no encontrado';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'product.set_status',
      'products',
      CAST(p_product_id AS CHAR),
      JSON_OBJECT('is_active', IFNULL(p_is_active, 1))
    );

    SET o_code = 1;
    SET o_message = 'estado de producto actualizado';
    SET o_data_json = JSON_OBJECT('product_id', p_product_id, 'is_active', IFNULL(p_is_active, 1));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_update`(
  IN p_product_id BIGINT UNSIGNED, IN p_name VARCHAR(150), IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED, IN p_tax_rate_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20), IN p_base_price DECIMAL(12,2), IN p_min_stock DECIMAL(12,3),
  IN p_units_per_bag DECIMAL(14,3), IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT, OUT o_message VARCHAR(255), OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_base_price < 0 OR p_min_stock < 0 THEN
    SET o_code = 0; SET o_message = 'base_price y min_stock deben ser >= 0'; SET o_data_json = NULL;
  ELSEIF p_units_per_bag IS NOT NULL AND p_units_per_bag <= 0 THEN
    SET o_code = 0; SET o_message = 'unidades por bulto debe ser mayor que 0'; SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM product_categories WHERE id = p_category_id) THEN
    SET o_code = 0; SET o_message = 'categoria de producto no encontrada'; SET o_data_json = NULL;
  ELSEIF p_tax_rate_id IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM tax_rates WHERE id = p_tax_rate_id) THEN
    SET o_code = 0; SET o_message = 'tasa de impuesto no encontrada'; SET o_data_json = NULL;
  ELSE
    UPDATE products
    SET name = TRIM(p_name), description = p_description, category_id = p_category_id,
        tax_rate_id = p_tax_rate_id, unit = p_unit, base_price = p_base_price,
        min_stock = p_min_stock, units_per_bag = p_units_per_bag,
        is_active = IFNULL(p_is_active, is_active), updated_at = CURRENT_TIMESTAMP
    WHERE id = p_product_id AND deleted_at IS NULL;
    SET v_rows = ROW_COUNT();
    IF v_rows = 0 THEN
      SET o_code = 0; SET o_message = 'producto no encontrado'; SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (p_actor_user_id, 'product.update', 'products', CAST(p_product_id AS CHAR),
        JSON_OBJECT('units_per_bag', p_units_per_bag, 'tax_rate_id', p_tax_rate_id));
      SET o_code = 1; SET o_message = 'producto actualizado';
      SET o_data_json = JSON_OBJECT('product_id', p_product_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_yield_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_product_yield_update`(
  IN p_product_id BIGINT UNSIGNED,
  IN p_units_per_bag DECIMAL(14,3),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_units_per_bag IS NULL OR p_units_per_bag <= 0 THEN
    SET o_code = 0;
    SET o_message = 'unidades por bulto debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSE
    UPDATE products
    SET units_per_bag = p_units_per_bag,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_product_id
      AND deleted_at IS NULL;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'producto no encontrado';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'product.yield.update',
        'products',
        CAST(p_product_id AS CHAR),
        JSON_OBJECT('units_per_bag', p_units_per_bag)
      );

      SET o_code = 1;
      SET o_message = 'rendimiento por bulto actualizado';
      SET o_data_json = JSON_OBJECT('product_id', p_product_id, 'units_per_bag', p_units_per_bag);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_category_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_category_create`(
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF EXISTS (SELECT 1 FROM raw_material_categories WHERE name = TRIM(p_name)) THEN
    SET o_code = 0;
    SET o_message = 'la categoria de materia prima ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO raw_material_categories (name, description, is_active)
    VALUES (TRIM(p_name), p_description, IFNULL(p_is_active, 1));

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'raw_material_category.create', 'raw_material_categories', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'categoria de materia prima creada';
    SET o_data_json = JSON_OBJECT('category_id', v_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_category_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_category_list`(
  IN p_only_active TINYINT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_items_json LONGTEXT;

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', c.id,
             'name', c.name,
             'description', c.description,
             'is_active', c.is_active
           ) ORDER BY c.name SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM raw_material_categories c
  WHERE (IFNULL(p_only_active, 0) = 0 OR c.is_active = 1);

  SET o_code = 1;
  SET o_message = 'categorias de materia prima listadas';
  SET o_data_json = CONCAT('{"items":', IFNULL(v_items_json, '[]'), '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_category_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_category_update`(
  IN p_category_id BIGINT UNSIGNED,
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE raw_material_categories
  SET name = TRIM(p_name),
      description = p_description,
      is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_category_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'categoria de materia prima no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'raw_material_category.update', 'raw_material_categories', CAST(p_category_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'categoria de materia prima actualizada';
    SET o_data_json = JSON_OBJECT('category_id', p_category_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_create`(
  IN p_sku VARCHAR(60),
  IN p_name VARCHAR(150),
  IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED,
  IN p_supplier_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20),
  IN p_unit_cost DECIMAL(12,4),
  IN p_min_stock DECIMAL(12,3),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_unit_cost < 0 OR p_min_stock < 0 THEN
    SET o_code = 0;
    SET o_message = 'unit_cost y min_stock deben ser >= 0';
    SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM raw_material_categories WHERE id = p_category_id AND is_active = 1) THEN
    SET o_code = 0;
    SET o_message = 'categoria de materia prima no encontrada o inactiva';
    SET o_data_json = NULL;
  ELSEIF p_supplier_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM suppliers WHERE id = p_supplier_id AND status = 'active') THEN
    SET o_code = 0;
    SET o_message = 'proveedor no encontrado o inactivo';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM raw_materials WHERE sku = TRIM(p_sku)) THEN
    SET o_code = 0;
    SET o_message = 'el sku de materia prima ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO raw_materials (
      sku, name, description, category_id, supplier_id, unit, unit_cost, min_stock, is_active
    ) VALUES (
      TRIM(p_sku), TRIM(p_name), p_description, p_category_id, p_supplier_id,
      p_unit, p_unit_cost, p_min_stock, IFNULL(p_is_active, 1)
    );

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'raw_material.create', 'raw_materials', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'materia prima creada';
    SET o_data_json = JSON_OBJECT('raw_material_id', v_id, 'sku', TRIM(p_sku));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_list`(
  IN p_only_active TINYINT,
  IN p_category_id BIGINT UNSIGNED,
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_total BIGINT DEFAULT 0;
  DECLARE v_items_json LONGTEXT;
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 20;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = IFNULL(NULLIF(p_page, 0), 1);
  IF v_page < 1 THEN
    SET v_page = 1;
  END IF;

  SET v_page_size = IFNULL(NULLIF(p_page_size, 0), 20);
  IF v_page_size < 1 THEN
    SET v_page_size = 20;
  ELSEIF v_page_size > 200 THEN
    SET v_page_size = 200;
  END IF;

  SET v_offset = (v_page - 1) * v_page_size;

  SELECT COUNT(*)
    INTO v_total
  FROM raw_materials rm
  WHERE rm.deleted_at IS NULL
    AND (IFNULL(p_only_active, 0) = 0 OR rm.is_active = 1)
    AND (p_category_id IS NULL OR rm.category_id = p_category_id)
    AND (
      p_search IS NULL OR p_search = ''
      OR rm.sku LIKE CONCAT('%', p_search, '%')
      OR rm.name LIKE CONCAT('%', p_search, '%')
    );

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'sku', x.sku,
             'name', x.name,
             'category_id', x.category_id,
             'supplier_id', x.supplier_id,
             'unit', x.unit,
             'unit_cost', x.unit_cost,
             'min_stock', x.min_stock,
             'is_active', x.is_active
           ) ORDER BY x.id SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT rm.id, rm.sku, rm.name, rm.category_id, rm.supplier_id, rm.unit, rm.unit_cost, rm.min_stock, rm.is_active
    FROM raw_materials rm
    WHERE rm.deleted_at IS NULL
      AND (IFNULL(p_only_active, 0) = 0 OR rm.is_active = 1)
      AND (p_category_id IS NULL OR rm.category_id = p_category_id)
      AND (
        p_search IS NULL OR p_search = ''
        OR rm.sku LIKE CONCAT('%', p_search, '%')
        OR rm.name LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY rm.id DESC
    LIMIT v_offset, v_page_size
  ) x;

  SET o_code = 1;
  SET o_message = 'materias primas listadas';
  SET o_data_json = CONCAT(
    '{',
    '"page":', v_page, ',',
    '"page_size":', v_page_size, ',',
    '"total":', v_total, ',',
    '"items":', IFNULL(v_items_json, '[]'),
    '}'
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_set_status`(
  IN p_raw_material_id BIGINT UNSIGNED,
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE raw_materials
  SET is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_raw_material_id
    AND deleted_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'materia prima no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'raw_material.set_status',
      'raw_materials',
      CAST(p_raw_material_id AS CHAR),
      JSON_OBJECT('is_active', IFNULL(p_is_active, 1))
    );

    SET o_code = 1;
    SET o_message = 'estado de materia prima actualizado';
    SET o_data_json = JSON_OBJECT('raw_material_id', p_raw_material_id, 'is_active', IFNULL(p_is_active, 1));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_update`(
  IN p_raw_material_id BIGINT UNSIGNED,
  IN p_name VARCHAR(150),
  IN p_description VARCHAR(255),
  IN p_category_id BIGINT UNSIGNED,
  IN p_supplier_id BIGINT UNSIGNED,
  IN p_unit VARCHAR(20),
  IN p_unit_cost DECIMAL(12,4),
  IN p_min_stock DECIMAL(12,3),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_unit_cost < 0 OR p_min_stock < 0 THEN
    SET o_code = 0;
    SET o_message = 'unit_cost y min_stock deben ser >= 0';
    SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM raw_material_categories WHERE id = p_category_id) THEN
    SET o_code = 0;
    SET o_message = 'categoria de materia prima no encontrada';
    SET o_data_json = NULL;
  ELSEIF p_supplier_id IS NOT NULL AND NOT EXISTS (SELECT 1 FROM suppliers WHERE id = p_supplier_id) THEN
    SET o_code = 0;
    SET o_message = 'proveedor no encontrado';
    SET o_data_json = NULL;
  ELSE
    UPDATE raw_materials
    SET name = TRIM(p_name),
        description = p_description,
        category_id = p_category_id,
        supplier_id = p_supplier_id,
        unit = p_unit,
        unit_cost = p_unit_cost,
        min_stock = p_min_stock,
        is_active = IFNULL(p_is_active, is_active),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_raw_material_id
      AND deleted_at IS NULL;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'materia prima no encontrada';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (p_actor_user_id, 'raw_material.update', 'raw_materials', CAST(p_raw_material_id AS CHAR));

      SET o_code = 1;
      SET o_message = 'materia prima actualizada';
      SET o_data_json = JSON_OBJECT('raw_material_id', p_raw_material_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_raw_material_usage_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_raw_material_usage_report`(
  IN p_date_from DATE,
  IN p_date_to DATE,
  IN p_branch_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  SET o_code = 1;
  SET o_message = 'reporte de materias primas generado';

  SELECT COALESCE(JSON_ARRAYAGG(
    JSON_OBJECT(
      'raw_material_id', x.raw_material_id,
      'raw_material_name', x.raw_material_name,
      'raw_material_sku', x.raw_material_sku,
      'grams_used', x.grams_used,
      'bag_size_grams', x.bag_size_grams,
      'bags_used', x.bags_used,
      'unit_cost', x.unit_cost,
      'estimated_cost', x.estimated_cost
    )
  ), JSON_ARRAY())
  INTO o_data_json
  FROM (
    SELECT
      rm.id AS raw_material_id,
      rm.name AS raw_material_name,
      rm.sku AS raw_material_sku,
      SUM(im.quantity) AS grams_used,
      rm.bag_size_grams,
      CASE
        WHEN rm.bag_size_grams IS NULL OR rm.bag_size_grams <= 0 THEN NULL
        ELSE ROUND(SUM(im.quantity) / rm.bag_size_grams, 3)
      END AS bags_used,
      rm.unit_cost,
      ROUND(SUM(im.quantity) * rm.unit_cost, 2) AS estimated_cost
    FROM inventory_movements im
    INNER JOIN raw_materials rm ON rm.id = im.raw_material_id
    WHERE im.item_type = 'raw_material'
      AND im.movement_type = 'production_out'
      AND DATE(im.moved_at) BETWEEN COALESCE(p_date_from, CURRENT_DATE) AND COALESCE(p_date_to, CURRENT_DATE)
      AND (p_branch_id IS NULL OR im.branch_id = p_branch_id)
    GROUP BY rm.id, rm.name, rm.sku, rm.bag_size_grams, rm.unit_cost
    ORDER BY rm.name
  ) x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_receive_purchase_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_receive_purchase_order`(
  IN p_purchase_order_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_status VARCHAR(30);
  DECLARE v_branch_id BIGINT UNSIGNED;
  DECLARE v_items_count INT DEFAULT 0;
  DECLARE v_received_rows INT DEFAULT 0;

  DECLARE v_item_id BIGINT UNSIGNED;
  DECLARE v_raw_material_id BIGINT UNSIGNED;
  DECLARE v_qty DECIMAL(12,3);
  DECLARE v_unit_cost DECIMAL(12,4);
  DECLARE done INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE cur_items CURSOR FOR
    SELECT id, raw_material_id, quantity, unit_cost
    FROM purchase_order_items
    WHERE purchase_order_id = p_purchase_order_id;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = 'orden de compra no encontrada';
    SET o_data_json = NULL;
  END;

    SET o_message = CONCAT('la orden de compra no se puede recibir desde el estado ', v_status);

  SELECT status, branch_id
    INTO v_status, v_branch_id
  FROM purchase_orders
  WHERE id = p_purchase_order_id
  FOR UPDATE;

  IF v_status IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'orden de compra no encontrada';
    SET o_data_json = NULL;
  ELSEIF v_status NOT IN ('sent', 'partially_received', 'draft') THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = CONCAT('la orden de compra no se puede recibir desde el estado ', v_status);
    SET o_data_json = NULL;
  ELSE
    SELECT COUNT(*)
      INTO v_items_count
    FROM purchase_order_items
    WHERE purchase_order_id = p_purchase_order_id;

    IF v_items_count = 0 THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'la orden de compra no tiene items';
      SET o_data_json = NULL;
    ELSE
      OPEN cur_items;

      read_loop: LOOP
        FETCH cur_items INTO v_item_id, v_raw_material_id, v_qty, v_unit_cost;
        IF done = 1 THEN
          LEAVE read_loop;
        END IF;

        INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
        VALUES (v_branch_id, v_raw_material_id, 0, 0);

        UPDATE stock_raw_materials
        SET quantity_on_hand = quantity_on_hand + v_qty,
            updated_at = CURRENT_TIMESTAMP
        WHERE branch_id = v_branch_id
          AND raw_material_id = v_raw_material_id;

        INSERT INTO inventory_movements (
          branch_id,
          item_type,
          raw_material_id,
          product_id,
          movement_type,
          quantity,
          unit_cost,
          reference_type,
          reference_id,
          notes,
          created_by
        ) VALUES (
          v_branch_id,
          'raw_material',
          v_raw_material_id,
          NULL,
          'purchase_in',
          v_qty,
          v_unit_cost,
          'purchase_order',
          p_purchase_order_id,
          CONCAT('received from purchase_order_item ', v_item_id),
          p_actor_user_id
        );

        SET v_received_rows = v_received_rows + 1;
      END LOOP;

      CLOSE cur_items;

      UPDATE purchase_orders
      SET status = 'received',
          updated_at = CURRENT_TIMESTAMP
      WHERE id = p_purchase_order_id;

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'purchase_order.receive',
        'purchase_orders',
        CAST(p_purchase_order_id AS CHAR),
        JSON_OBJECT('received_items', v_received_rows)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'orden de compra recibida';
      SET o_data_json = JSON_OBJECT('purchase_order_id', p_purchase_order_id, 'received_items', v_received_rows);
    END IF;
   END IF;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_add_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_add_item`(
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_raw_material_id BIGINT UNSIGNED,
  IN p_quantity DECIMAL(12,4),
  IN p_wastage_percent DECIMAL(5,2),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_product_id BIGINT UNSIGNED;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_quantity IS NULL OR p_quantity <= 0 THEN
    SET o_code = 0;
    SET o_message = 'la cantidad (quantity) debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSEIF p_wastage_percent IS NULL OR p_wastage_percent < 0 OR p_wastage_percent > 100 THEN
    SET o_code = 0;
    SET o_message = 'wastage_percent debe estar entre 0 y 100';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    SELECT product_id
      INTO v_product_id
    FROM recipes
    WHERE id = p_recipe_id
    FOR UPDATE;

    IF v_product_id IS NULL THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'receta no encontrada';
      SET o_data_json = NULL;
    ELSEIF NOT EXISTS (
      SELECT 1
      FROM raw_materials
      WHERE id = p_raw_material_id
        AND is_active = 1
        AND deleted_at IS NULL
    ) THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'materia prima no encontrada o inactiva';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO recipe_items (recipe_id, raw_material_id, quantity, wastage_percent)
      VALUES (p_recipe_id, p_raw_material_id, p_quantity, p_wastage_percent)
      ON DUPLICATE KEY UPDATE
        quantity = VALUES(quantity),
        wastage_percent = VALUES(wastage_percent);

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'recipe.item.upsert',
        'recipes',
        CAST(p_recipe_id AS CHAR),
        JSON_OBJECT('raw_material_id', p_raw_material_id, 'quantity', p_quantity, 'wastage_percent', p_wastage_percent)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'item de receta insertado o actualizado';
      SET o_data_json = JSON_OBJECT('recipe_id', p_recipe_id, 'raw_material_id', p_raw_material_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_costing_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_costing_create`(
  IN p_primary_product_id BIGINT UNSIGNED,
  IN p_recipe_name VARCHAR(150),
  IN p_notes VARCHAR(255),
  IN p_base_items_json JSON,
  IN p_outputs_json JSON,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_recipe_id BIGINT UNSIGNED;
  DECLARE v_next_version INT UNSIGNED DEFAULT 1;
  DECLARE v_base_count INT DEFAULT 0;
  DECLARE v_output_count INT DEFAULT 0;
  DECLARE v_output_quantity DECIMAL(12,3) DEFAULT 1;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    DROP TEMPORARY TABLE IF EXISTS tmp_recipe_base_items;
    DROP TEMPORARY TABLE IF EXISTS tmp_recipe_outputs;
    DROP TEMPORARY TABLE IF EXISTS tmp_recipe_output_items;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_base_items;
  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_outputs;
  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_output_items;

  CREATE TEMPORARY TABLE tmp_recipe_base_items (
    concept VARCHAR(60) NOT NULL,
    raw_material_id BIGINT UNSIGNED NOT NULL,
    quantity DECIMAL(14,4) NOT NULL,
    wastage_percent DECIMAL(5,2) NOT NULL DEFAULT 0
  ) ENGINE=Memory;

  CREATE TEMPORARY TABLE tmp_recipe_outputs (
    row_no INT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    expected_quantity DECIMAL(14,3) NOT NULL,
    unit_weight_grams DECIMAL(14,3) NULL,
    sale_price DECIMAL(14,2) NULL,
    packing_note VARCHAR(255) NULL,
    sort_order INT UNSIGNED NOT NULL,
    items_json JSON NULL,
    recipe_output_id BIGINT UNSIGNED NULL
  ) ENGINE=InnoDB;

  CREATE TEMPORARY TABLE tmp_recipe_output_items (
    output_row_no INT UNSIGNED NOT NULL,
    concept VARCHAR(60) NOT NULL,
    raw_material_id BIGINT UNSIGNED NOT NULL,
    quantity DECIMAL(14,4) NOT NULL,
    wastage_percent DECIMAL(5,2) NOT NULL DEFAULT 0
  ) ENGINE=Memory;

  INSERT INTO tmp_recipe_base_items (concept, raw_material_id, quantity, wastage_percent)
  SELECT
    COALESCE(NULLIF(TRIM(jt.concept), ''), 'MOJE'),
    jt.raw_material_id,
    jt.quantity,
    COALESCE(jt.wastage_percent, 0)
  FROM JSON_TABLE(
    COALESCE(p_base_items_json, JSON_ARRAY()),
    '$[*]' COLUMNS (
      concept VARCHAR(60) PATH '$.concept' NULL ON EMPTY,
      raw_material_id BIGINT UNSIGNED PATH '$.raw_material_id',
      quantity DECIMAL(14,4) PATH '$.quantity',
      wastage_percent DECIMAL(5,2) PATH '$.wastage_percent' DEFAULT '0' ON EMPTY
    )
  ) jt;

  INSERT INTO tmp_recipe_outputs (
    row_no,
    product_id,
    expected_quantity,
    unit_weight_grams,
    sale_price,
    packing_note,
    sort_order,
    items_json
  )
  SELECT
    jt.row_no,
    jt.product_id,
    jt.expected_quantity,
    jt.unit_weight_grams,
    jt.sale_price,
    jt.packing_note,
    COALESCE(jt.sort_order, jt.row_no),
    jt.items_json
  FROM JSON_TABLE(
    COALESCE(p_outputs_json, JSON_ARRAY()),
    '$[*]' COLUMNS (
      row_no FOR ORDINALITY,
      product_id BIGINT UNSIGNED PATH '$.product_id',
      expected_quantity DECIMAL(14,3) PATH '$.expected_quantity',
      unit_weight_grams DECIMAL(14,3) PATH '$.unit_weight_grams' NULL ON EMPTY,
      sale_price DECIMAL(14,2) PATH '$.sale_price' NULL ON EMPTY,
      packing_note VARCHAR(255) PATH '$.packing_note' NULL ON EMPTY,
      sort_order INT UNSIGNED PATH '$.sort_order' NULL ON EMPTY,
      items_json JSON PATH '$.items' NULL ON EMPTY
    )
  ) jt;

  INSERT INTO tmp_recipe_output_items (output_row_no, concept, raw_material_id, quantity, wastage_percent)
  SELECT
    o.row_no,
    COALESCE(NULLIF(TRIM(jt.concept), ''), 'MOJE'),
    jt.raw_material_id,
    jt.quantity,
    COALESCE(jt.wastage_percent, 0)
  FROM tmp_recipe_outputs o
  JOIN JSON_TABLE(
    COALESCE(o.items_json, JSON_ARRAY()),
    '$[*]' COLUMNS (
      concept VARCHAR(60) PATH '$.concept' NULL ON EMPTY,
      raw_material_id BIGINT UNSIGNED PATH '$.raw_material_id',
      quantity DECIMAL(14,4) PATH '$.quantity',
      wastage_percent DECIMAL(5,2) PATH '$.wastage_percent' DEFAULT '0' ON EMPTY
    )
  ) jt;

  SELECT COUNT(*) INTO v_base_count FROM tmp_recipe_base_items;
  SELECT COUNT(*) INTO v_output_count FROM tmp_recipe_outputs;

  IF v_base_count = 0 THEN
    SET o_code = 0;
    SET o_message = 'agrega al menos un ingrediente base';
    SET o_data_json = NULL;
  ELSEIF v_output_count = 0 THEN
    SET o_code = 0;
    SET o_message = 'agrega al menos un producto final';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1 FROM tmp_recipe_base_items
    WHERE raw_material_id IS NULL OR quantity <= 0 OR wastage_percent < 0 OR wastage_percent > 100
  ) THEN
    SET o_code = 0;
    SET o_message = 'revisa los ingredientes base';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1 FROM tmp_recipe_outputs
    WHERE product_id IS NULL OR expected_quantity <= 0
  ) THEN
    SET o_code = 0;
    SET o_message = 'revisa los productos finales';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1 FROM tmp_recipe_output_items
    WHERE raw_material_id IS NULL OR quantity <= 0 OR wastage_percent < 0 OR wastage_percent > 100
  ) THEN
    SET o_code = 0;
    SET o_message = 'revisa los ingredientes posteriores';
    SET o_data_json = NULL;
  ELSEIF p_primary_product_id IS NOT NULL AND NOT EXISTS (
    SELECT 1 FROM products WHERE id = p_primary_product_id AND is_active = 1 AND deleted_at IS NULL
  ) THEN
    SET o_code = 0;
    SET o_message = 'producto principal no encontrado o inactivo';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1
    FROM tmp_recipe_base_items t
    LEFT JOIN raw_materials rm ON rm.id = t.raw_material_id AND rm.is_active = 1 AND rm.deleted_at IS NULL
    WHERE rm.id IS NULL
  ) THEN
    SET o_code = 0;
    SET o_message = 'una materia prima base no existe o esta inactiva';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1
    FROM tmp_recipe_output_items t
    LEFT JOIN raw_materials rm ON rm.id = t.raw_material_id AND rm.is_active = 1 AND rm.deleted_at IS NULL
    WHERE rm.id IS NULL
  ) THEN
    SET o_code = 0;
    SET o_message = 'una materia prima posterior no existe o esta inactiva';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1
    FROM tmp_recipe_outputs t
    LEFT JOIN products p ON p.id = t.product_id AND p.is_active = 1 AND p.deleted_at IS NULL
    WHERE p.id IS NULL
  ) THEN
    SET o_code = 0;
    SET o_message = 'un producto final no existe o esta inactivo';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    SELECT expected_quantity
      INTO v_output_quantity
    FROM tmp_recipe_outputs
    ORDER BY sort_order, row_no
    LIMIT 1;

    IF p_primary_product_id IS NULL THEN
      SET v_next_version = 1;
    ELSE
      SELECT COALESCE(MAX(version_no), 0) + 1
        INTO v_next_version
      FROM recipes
      WHERE product_id = p_primary_product_id
      FOR UPDATE;

      UPDATE recipes
      SET is_active = 0,
          updated_at = CURRENT_TIMESTAMP
      WHERE product_id = p_primary_product_id
        AND is_active = 1;
    END IF;

    INSERT INTO recipes (
      product_id,
      version_no,
      output_quantity,
      notes,
      is_active
    ) VALUES (
      p_primary_product_id,
      v_next_version,
      v_output_quantity,
      LEFT(CONCAT(COALESCE(NULLIF(TRIM(p_recipe_name), ''), 'Receta'), IF(p_notes IS NULL OR p_notes = '', '', CONCAT(' - ', p_notes))), 255),
      1
    );

    SET v_recipe_id = LAST_INSERT_ID();

    INSERT INTO recipe_items (recipe_id, raw_material_id, concept, quantity, wastage_percent)
    SELECT v_recipe_id, raw_material_id, concept, quantity, wastage_percent
    FROM tmp_recipe_base_items;

    INSERT INTO recipe_outputs (
      recipe_id,
      product_id,
      expected_quantity,
      unit_weight_grams,
      sale_price,
      packing_note,
      sort_order
    )
    SELECT
      v_recipe_id,
      product_id,
      expected_quantity,
      unit_weight_grams,
      sale_price,
      packing_note,
      sort_order
    FROM tmp_recipe_outputs
    ORDER BY sort_order, row_no;

    UPDATE tmp_recipe_outputs t
    JOIN recipe_outputs ro
      ON ro.recipe_id = v_recipe_id
     AND ro.product_id = t.product_id
    SET t.recipe_output_id = ro.id;

    INSERT INTO recipe_output_items (
      recipe_output_id,
      concept,
      raw_material_id,
      quantity,
      wastage_percent
    )
    SELECT
      o.recipe_output_id,
      i.concept,
      i.raw_material_id,
      i.quantity,
      i.wastage_percent
    FROM tmp_recipe_output_items i
    JOIN tmp_recipe_outputs o ON o.row_no = i.output_row_no;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'recipe.costing.create',
      'recipes',
      CAST(v_recipe_id AS CHAR),
      JSON_OBJECT('primary_product_id', p_primary_product_id, 'version_no', v_next_version, 'outputs', v_output_count)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'receta con costeo creada';
    SET o_data_json = JSON_OBJECT('recipe_id', v_recipe_id, 'product_id', p_primary_product_id, 'version_no', v_next_version);
  END IF;

  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_base_items;
  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_outputs;
  DROP TEMPORARY TABLE IF EXISTS tmp_recipe_output_items;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_create`(
  IN p_product_id BIGINT UNSIGNED,
  IN p_output_quantity DECIMAL(12,3),
  IN p_notes VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_recipe_id BIGINT UNSIGNED;
  DECLARE v_next_version INT UNSIGNED DEFAULT 1;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_output_quantity IS NULL OR p_output_quantity <= 0 THEN
    SET o_code = 0;
    SET o_message = 'la cantidad de salida (output_quantity) debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    IF NOT EXISTS (
      SELECT 1
      FROM products
      WHERE id = p_product_id
        AND is_active = 1
        AND deleted_at IS NULL
    ) THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'producto no encontrado o inactivo';
      SET o_data_json = NULL;
    ELSE
      SELECT COALESCE(MAX(version_no), 0) + 1
        INTO v_next_version
      FROM recipes
      WHERE product_id = p_product_id
      FOR UPDATE;

      UPDATE recipes
      SET is_active = 0,
          updated_at = CURRENT_TIMESTAMP
      WHERE product_id = p_product_id
        AND is_active = 1;

      INSERT INTO recipes (
        product_id,
        version_no,
        output_quantity,
        notes,
        is_active
      ) VALUES (
        p_product_id,
        v_next_version,
        p_output_quantity,
        p_notes,
        1
      );

      SET v_recipe_id = LAST_INSERT_ID();

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'recipe.create',
        'recipes',
        CAST(v_recipe_id AS CHAR),
        JSON_OBJECT('product_id', p_product_id, 'version_no', v_next_version)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'receta creada';
      SET o_data_json = JSON_OBJECT('recipe_id', v_recipe_id, 'product_id', p_product_id, 'version_no', v_next_version);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_outputs_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_outputs_list`(
  IN p_recipe_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  SET o_code = 1;
  SET o_message = 'productos finales de receta listados';

  SELECT COALESCE(JSON_ARRAYAGG(
    JSON_OBJECT(
      'id', ro.id,
      'recipe_id', ro.recipe_id,
      'product_id', ro.product_id,
      'product_name', p.name,
      'product_sku', p.sku,
      'expected_quantity', ro.expected_quantity,
      'packing_note', ro.packing_note,
      'sort_order', ro.sort_order
    )
  ), JSON_ARRAY())
  INTO o_data_json
  FROM recipe_outputs ro
  INNER JOIN products p ON p.id = ro.product_id
  WHERE ro.recipe_id = p_recipe_id
  ORDER BY ro.sort_order, p.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_output_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_output_add`(
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_product_id BIGINT UNSIGNED,
  IN p_expected_quantity DECIMAL(14,3),
  IN p_packing_note VARCHAR(255),
  IN p_sort_order INT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_output_id BIGINT UNSIGNED;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_expected_quantity IS NULL OR p_expected_quantity <= 0 THEN
    SET o_code = 0;
    SET o_message = 'la cantidad esperada debe ser mayor que 0';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM recipes WHERE id = p_recipe_id) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'receta no encontrada';
    END IF;

    IF NOT EXISTS (
      SELECT 1
      FROM products
      WHERE id = p_product_id
        AND is_active = 1
        AND deleted_at IS NULL
    ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto no encontrado o inactivo';
    END IF;

    INSERT INTO recipe_outputs (
      recipe_id,
      product_id,
      expected_quantity,
      packing_note,
      sort_order
    )
    VALUES (
      p_recipe_id,
      p_product_id,
      p_expected_quantity,
      p_packing_note,
      COALESCE(p_sort_order, 1)
    )
    ON DUPLICATE KEY UPDATE
      expected_quantity = VALUES(expected_quantity),
      packing_note = VALUES(packing_note),
      sort_order = VALUES(sort_order),
      updated_at = CURRENT_TIMESTAMP;

    SELECT id INTO v_output_id
    FROM recipe_outputs
    WHERE recipe_id = p_recipe_id
      AND product_id = p_product_id;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'recipe.output.upsert',
      'recipe_outputs',
      CAST(v_output_id AS CHAR),
      JSON_OBJECT('recipe_id', p_recipe_id, 'product_id', p_product_id, 'expected_quantity', p_expected_quantity)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'producto final de receta guardado';
    SET o_data_json = JSON_OBJECT('recipe_output_id', v_output_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_output_remove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_output_remove`(
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_product_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_output_id BIGINT UNSIGNED;
  DECLARE v_output_count INT DEFAULT 0;

  SELECT COUNT(*) INTO v_output_count
  FROM recipe_outputs
  WHERE recipe_id = p_recipe_id
    AND product_id = p_product_id;

  IF v_output_count = 0 THEN
    SET o_code = 0;
    SET o_message = 'producto final de receta no encontrado';
    SET o_data_json = NULL;
  ELSE
    SELECT id INTO v_output_id
    FROM recipe_outputs
    WHERE recipe_id = p_recipe_id
      AND product_id = p_product_id;

    START TRANSACTION;

    DELETE FROM recipe_outputs WHERE id = v_output_id;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'recipe.output.remove',
      'recipe_outputs',
      CAST(v_output_id AS CHAR),
      JSON_OBJECT('recipe_id', p_recipe_id, 'product_id', p_product_id)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'producto final de receta eliminado';
    SET o_data_json = JSON_OBJECT('recipe_output_id', v_output_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_publish_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_publish_version`(
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_product_id BIGINT UNSIGNED;
  DECLARE v_item_count INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  SELECT product_id
    INTO v_product_id
  FROM recipes
  WHERE id = p_recipe_id
  FOR UPDATE;

  IF v_product_id IS NULL THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'receta no encontrada';
    SET o_data_json = NULL;
  ELSE
    SELECT COUNT(*)
      INTO v_item_count
    FROM recipe_items
    WHERE recipe_id = p_recipe_id;

    IF v_item_count = 0 THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'la receta no tiene items';
      SET o_data_json = NULL;
    ELSE
      UPDATE recipes
      SET is_active = 0,
          updated_at = CURRENT_TIMESTAMP
      WHERE product_id = v_product_id;

      UPDATE recipes
      SET is_active = 1,
          updated_at = CURRENT_TIMESTAMP
      WHERE id = p_recipe_id;

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'recipe.publish',
        'recipes',
        CAST(p_recipe_id AS CHAR),
        JSON_OBJECT('product_id', v_product_id)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'receta publicada';
      SET o_data_json = JSON_OBJECT('recipe_id', p_recipe_id, 'product_id', v_product_id, 'is_active', 1);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recipe_remove_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recipe_remove_item`(
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_raw_material_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  START TRANSACTION;

  DELETE FROM recipe_items
  WHERE recipe_id = p_recipe_id
    AND raw_material_id = p_raw_material_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'item de receta no encontrado';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'recipe.item.remove',
      'recipes',
      CAST(p_recipe_id AS CHAR),
      JSON_OBJECT('raw_material_id', p_raw_material_id)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'item de receta eliminado';
    SET o_data_json = JSON_OBJECT('recipe_id', p_recipe_id, 'raw_material_id', p_raw_material_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_register_production_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_production_result`(
  IN p_branch_id BIGINT UNSIGNED,
  IN p_product_id BIGINT UNSIGNED,
  IN p_recipe_id BIGINT UNSIGNED,
  IN p_produced_qty DECIMAL(12,3),
  IN p_actor_user_id BIGINT UNSIGNED,
  IN p_reference_type VARCHAR(50),
  IN p_reference_id BIGINT UNSIGNED,
  IN p_notes VARCHAR(255),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_recipe_output_qty DECIMAL(12,3);
  DECLARE v_factor DECIMAL(18,6);

  DECLARE v_raw_material_id BIGINT UNSIGNED;
  DECLARE v_base_qty DECIMAL(12,4);
  DECLARE v_wastage DECIMAL(5,2);
  DECLARE v_required_qty DECIMAL(14,3);
  DECLARE v_stock_qty DECIMAL(14,3);
  DECLARE v_signal_msg VARCHAR(255);

  DECLARE done INT DEFAULT 0;

  DECLARE cur_recipe CURSOR FOR
    SELECT raw_material_id, quantity, wastage_percent
    FROM recipe_items
    WHERE recipe_id = p_recipe_id;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'operacion completada';
  SET o_data_json = NULL;

  IF p_produced_qty IS NULL OR p_produced_qty <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'la cantidad producida (produced_qty) debe ser mayor que 0';
  END IF;

  START TRANSACTION;

  IF NOT EXISTS (SELECT 1 FROM branches WHERE id = p_branch_id AND is_active = 1) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'sede no encontrada o inactiva';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM products
    WHERE id = p_product_id AND is_active = 1 AND deleted_at IS NULL
  ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'producto no encontrado o inactivo';
  END IF;

  SELECT COALESCE(ro.expected_quantity, r.output_quantity)
    INTO v_recipe_output_qty
  FROM recipes r
  LEFT JOIN recipe_outputs ro
    ON ro.recipe_id = r.id
   AND ro.product_id = p_product_id
  WHERE r.id = p_recipe_id
    AND r.is_active = 1
    AND COALESCE(ro.product_id, r.product_id) = p_product_id
  LIMIT 1
  FOR UPDATE;

  IF v_recipe_output_qty IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'receta no encontrada, inactiva o no asociada al producto';
  END IF;

  IF v_recipe_output_qty <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'output_quantity de receta debe ser > 0';
  END IF;

  SET v_factor = p_produced_qty / v_recipe_output_qty;

  OPEN cur_recipe;

  read_loop: LOOP
    FETCH cur_recipe INTO v_raw_material_id, v_base_qty, v_wastage;
    IF done = 1 THEN
      LEAVE read_loop;
    END IF;

    SET v_required_qty = ROUND((v_base_qty * v_factor) * (1 + (v_wastage / 100)), 3);

    INSERT IGNORE INTO stock_raw_materials (branch_id, raw_material_id, quantity_on_hand, min_stock)
    VALUES (p_branch_id, v_raw_material_id, 0, 0);

    SELECT quantity_on_hand
      INTO v_stock_qty
    FROM stock_raw_materials
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id
    FOR UPDATE;

    IF v_stock_qty < v_required_qty THEN
      SET v_signal_msg = CONCAT('insufficient raw stock for material_id=', v_raw_material_id);
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_signal_msg;
    END IF;

    UPDATE stock_raw_materials
    SET quantity_on_hand = quantity_on_hand - v_required_qty
    WHERE branch_id = p_branch_id
      AND raw_material_id = v_raw_material_id;

    INSERT INTO inventory_movements (
      branch_id, item_type, raw_material_id, product_id, movement_type,
      quantity, unit_cost, reference_type, reference_id, notes, created_by
    )
    VALUES (
      p_branch_id, 'raw_material', v_raw_material_id, NULL, 'production_out',
      v_required_qty, NULL, p_reference_type, p_reference_id, p_notes, p_actor_user_id
    );
  END LOOP;

  CLOSE cur_recipe;

  INSERT IGNORE INTO stock_products (branch_id, product_id, quantity_on_hand, min_stock)
  VALUES (p_branch_id, p_product_id, 0, 0);

  UPDATE stock_products
  SET quantity_on_hand = quantity_on_hand + p_produced_qty
  WHERE branch_id = p_branch_id
    AND product_id = p_product_id;

  INSERT INTO inventory_movements (
    branch_id, item_type, raw_material_id, product_id, movement_type,
    quantity, unit_cost, reference_type, reference_id, notes, created_by
  )
  VALUES (
    p_branch_id, 'product', NULL, p_product_id, 'production_in',
    p_produced_qty, NULL, p_reference_type, p_reference_id, p_notes, p_actor_user_id
  );

  INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
  VALUES (
    p_actor_user_id,
    'production.register',
    'products',
    CAST(p_product_id AS CHAR),
    JSON_OBJECT(
      'branch_id', p_branch_id,
      'recipe_id', p_recipe_id,
      'produced_qty', p_produced_qty,
      'reference_type', p_reference_type,
      'reference_id', p_reference_id
    )
  );

  COMMIT;

  SET o_code = 1;
  SET o_message = 'produccion registrada e inventario actualizado';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_role_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_create`(
  IN p_code VARCHAR(50),
  IN p_name VARCHAR(100),
  IN p_description VARCHAR(255),
  IN p_is_system_role TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_role_id BIGINT UNSIGNED;

  IF p_code IS NULL OR CHAR_LENGTH(TRIM(p_code)) < 3 THEN
    SET o_code = 0;
    SET o_message = 'el codigo de rol es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 3 THEN
    SET o_code = 0;
    SET o_message = 'el nombre de rol es obligatorio';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM roles WHERE code = TRIM(p_code)) THEN
    SET o_code = 0;
    SET o_message = 'el codigo de rol ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO roles (code, name, description, is_system_role)
    VALUES (TRIM(p_code), TRIM(p_name), p_description, IFNULL(p_is_system_role, 0));

    SET v_role_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'role.create', 'roles', CAST(v_role_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'rol creado';
    SET o_data_json = JSON_OBJECT('role_id', v_role_id, 'code', TRIM(p_code));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_role_set_permissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_set_permissions`(
  IN p_role_id BIGINT UNSIGNED,
  IN p_permission_codes_json JSON,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_role_exists INT DEFAULT 0;
  DECLARE v_input_count INT DEFAULT 0;
  DECLARE v_found_count INT DEFAULT 0;
  DECLARE v_assigned_count INT DEFAULT 0;
  DECLARE v_idx INT DEFAULT 0;
  DECLARE v_permission_code VARCHAR(100);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_permission_codes_json IS NULL OR JSON_VALID(p_permission_codes_json) = 0 OR JSON_TYPE(p_permission_codes_json) <> 'ARRAY' THEN
    SET o_code = 0;
    SET o_message = 'el parametro p_permission_codes_json debe ser un arreglo JSON valido';
    SET o_data_json = NULL;
  ELSE
    START TRANSACTION;

    SELECT COUNT(*)
      INTO v_role_exists
    FROM roles
    WHERE id = p_role_id
    FOR UPDATE;

    IF v_role_exists = 0 THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'rol no encontrado';
      SET o_data_json = NULL;
    ELSE
      DROP TEMPORARY TABLE IF EXISTS tmp_permission_codes;
      CREATE TEMPORARY TABLE tmp_permission_codes (
        permission_code VARCHAR(100) NOT NULL,
        PRIMARY KEY (permission_code)
      ) ENGINE=Memory;

      SET v_idx = 0;
      WHILE v_idx < JSON_LENGTH(p_permission_codes_json) DO
        SET v_permission_code = TRIM(JSON_UNQUOTE(JSON_EXTRACT(p_permission_codes_json, CONCAT('$[', v_idx, ']'))));

        IF v_permission_code IS NOT NULL AND v_permission_code <> '' THEN
          INSERT IGNORE INTO tmp_permission_codes (permission_code)
          VALUES (v_permission_code);
        END IF;

        SET v_idx = v_idx + 1;
      END WHILE;

      SELECT COUNT(*) INTO v_input_count FROM tmp_permission_codes;

      IF v_input_count = 0 THEN
        ROLLBACK;
        SET o_code = 0;
        SET o_message = 'al menos un codigo de permiso es obligatorio';
        SET o_data_json = NULL;
      ELSE
        SELECT COUNT(*)
          INTO v_found_count
        FROM tmp_permission_codes t
        INNER JOIN permissions p ON p.code = t.permission_code;

        IF v_input_count <> v_found_count THEN
          ROLLBACK;
          SET o_code = 0;
          SET o_message = 'uno o mas permisos no existen';
          SET o_data_json = NULL;
        ELSE
          DELETE FROM role_permissions WHERE role_id = p_role_id;

          INSERT INTO role_permissions (role_id, permission_id)
          SELECT p_role_id, p.id
          FROM tmp_permission_codes t
          INNER JOIN permissions p ON p.code = t.permission_code;

          SET v_assigned_count = ROW_COUNT();

          INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
          VALUES (
            p_actor_user_id,
            'role.set_permissions',
            'roles',
            CAST(p_role_id AS CHAR),
            JSON_OBJECT('permissions_assigned', v_assigned_count)
          );

          COMMIT;

          SET o_code = 1;
          SET o_message = 'permisos del rol actualizados';
          SET o_data_json = JSON_OBJECT('role_id', p_role_id, 'permissions_assigned', v_assigned_count);
        END IF;
      END IF;
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_role_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_role_update`(
  IN p_role_id BIGINT UNSIGNED,
  IN p_name VARCHAR(100),
  IN p_description VARCHAR(255),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 3 THEN
    SET o_code = 0;
    SET o_message = 'el nombre de rol es obligatorio';
    SET o_data_json = NULL;
  ELSE
    UPDATE roles
    SET name = TRIM(p_name),
        description = p_description,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_role_id;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'rol no encontrado';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (p_actor_user_id, 'role.update', 'roles', CAST(p_role_id AS CHAR));

      SET o_code = 1;
      SET o_message = 'rol actualizado';
      SET o_data_json = JSON_OBJECT('role_id', p_role_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_route_assign_driver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_route_assign_driver`(
  IN p_route_id BIGINT UNSIGNED,
  IN p_user_id BIGINT UNSIGNED,
  IN p_assigned_from DATE,
  IN p_assigned_to DATE,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_assignment_id BIGINT UNSIGNED;

  IF p_assigned_from IS NULL THEN
    SET o_code = 0;
    SET o_message = 'la fecha inicial de asignacion (assigned_from) es obligatoria';
    SET o_data_json = NULL;
  ELSEIF p_assigned_to IS NOT NULL AND p_assigned_to < p_assigned_from THEN
    SET o_code = 0;
    SET o_message = 'la fecha final de asignacion (assigned_to) debe ser mayor o igual que assigned_from';
    SET o_data_json = NULL;
  ELSEIF NOT EXISTS (SELECT 1 FROM delivery_routes WHERE id = p_route_id AND is_active = 1) THEN
    SET o_code = 0;
    SET o_message = 'ruta no encontrada o inactiva';
    SET o_data_json = NULL;
  ELSEIF NOT EXISTS (
    SELECT 1
    FROM users
    WHERE id = p_user_id
      AND status = 'active'
      AND deleted_at IS NULL
  ) THEN
    SET o_code = 0;
    SET o_message = 'usuario repartidor no encontrado o inactivo';
    SET o_data_json = NULL;
  ELSEIF EXISTS (
    SELECT 1
    FROM route_drivers rd
    WHERE rd.route_id = p_route_id
      AND rd.user_id = p_user_id
      AND (
        p_assigned_to IS NULL
        OR rd.assigned_to IS NULL
        OR rd.assigned_from <= p_assigned_to
      )
      AND (
        rd.assigned_to IS NULL
        OR rd.assigned_to >= p_assigned_from
      )
  ) THEN
    SET o_code = 0;
    SET o_message = 'repartidor ya asignado en periodo traslapado';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO route_drivers (route_id, user_id, assigned_from, assigned_to)
    VALUES (p_route_id, p_user_id, p_assigned_from, p_assigned_to);

    SET v_assignment_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'route.assign_driver',
      'route_drivers',
      CAST(v_assignment_id AS CHAR),
      JSON_OBJECT('route_id', p_route_id, 'user_id', p_user_id)
    );

    SET o_code = 1;
    SET o_message = 'repartidor asignado a ruta';
    SET o_data_json = JSON_OBJECT('route_driver_id', v_assignment_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_route_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_route_create`(
  IN p_code VARCHAR(30),
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_code IS NULL OR CHAR_LENGTH(TRIM(p_code)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el codigo de ruta es obligatorio';
    SET o_data_json = NULL;
  ELSEIF p_name IS NULL OR CHAR_LENGTH(TRIM(p_name)) < 2 THEN
    SET o_code = 0;
    SET o_message = 'el nombre de ruta es obligatorio';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM delivery_routes WHERE code = TRIM(p_code)) THEN
    SET o_code = 0;
    SET o_message = 'el codigo de ruta ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO delivery_routes (code, name, description, is_active)
    VALUES (TRIM(p_code), TRIM(p_name), p_description, IFNULL(p_is_active, 1));

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'route.create', 'delivery_routes', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'ruta creada';
    SET o_data_json = JSON_OBJECT('route_id', v_id, 'code', TRIM(p_code));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_route_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_route_list`(
  IN p_only_active TINYINT,
  IN p_ref_date DATE,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_items_json LONGTEXT;
  DECLARE v_ref_date DATE;

  SET v_ref_date = IFNULL(p_ref_date, CURRENT_DATE());

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'code', x.code,
             'name', x.name,
             'description', x.description,
             'is_active', x.is_active,
             'current_driver_user_id', x.current_driver_user_id,
             'current_driver_name', x.current_driver_name
           ) ORDER BY x.name SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT
      r.id,
      r.code,
      r.name,
      r.description,
      r.is_active,
      u.id AS current_driver_user_id,
      u.full_name AS current_driver_name
    FROM delivery_routes r
    LEFT JOIN route_drivers rd
      ON rd.route_id = r.id
     AND rd.assigned_from <= v_ref_date
     AND (rd.assigned_to IS NULL OR rd.assigned_to >= v_ref_date)
    LEFT JOIN users u ON u.id = rd.user_id
    WHERE (IFNULL(p_only_active, 0) = 0 OR r.is_active = 1)
    ORDER BY r.name
  ) x;

  SET o_code = 1;
  SET o_message = 'rutas listadas';
  SET o_data_json = CONCAT('{"items":', IFNULL(v_items_json, '[]'), '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_route_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_route_set_status`(
  IN p_route_id BIGINT UNSIGNED,
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE delivery_routes
  SET is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_route_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'ruta no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'route.set_status',
      'delivery_routes',
      CAST(p_route_id AS CHAR),
      JSON_OBJECT('is_active', IFNULL(p_is_active, 1))
    );

    SET o_code = 1;
    SET o_message = 'estado de ruta actualizado';
    SET o_data_json = JSON_OBJECT('route_id', p_route_id, 'is_active', IFNULL(p_is_active, 1));
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_route_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_route_update`(
  IN p_route_id BIGINT UNSIGNED,
  IN p_name VARCHAR(120),
  IN p_description VARCHAR(255),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  UPDATE delivery_routes
  SET name = TRIM(p_name),
      description = p_description,
      is_active = IFNULL(p_is_active, is_active),
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_route_id;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    SET o_code = 0;
    SET o_message = 'ruta no encontrada';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'route.update', 'delivery_routes', CAST(p_route_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'ruta actualizada';
    SET o_data_json = JSON_OBJECT('route_id', p_route_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_std_config_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_std_config_get`(
  IN p_config_key VARCHAR(100),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_value VARCHAR(255);
  DECLARE v_description VARCHAR(255);

  SELECT config_value, description
    INTO v_value, v_description
  FROM std_app_config
  WHERE config_key = p_config_key
    AND is_active = 1
  LIMIT 1;

  IF v_value IS NULL THEN
    SET o_code = 0;
    SET o_message = 'clave de configuracion no encontrada';
    SET o_data_json = NULL;
  ELSE
    SET o_code = 1;
    SET o_message = 'clave de configuracion encontrada';
    SET o_data_json = JSON_OBJECT('config_key', p_config_key, 'config_value', v_value, 'description', v_description);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_std_error_lookup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_std_error_lookup`(
  IN p_error_code VARCHAR(80),
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;

  SELECT COUNT(*) INTO v_exists
  FROM std_error_catalog
  WHERE error_code = p_error_code
    AND is_active = 1;

  IF v_exists = 0 THEN
    SET o_code = 0;
    SET o_message = 'codigo de error estandar no encontrado';
    SET o_data_json = CAST(fn_std_error_json('COMMON.SQL_ERROR', CONCAT('codigo no registrado: ', IFNULL(p_error_code, 'NULL')), JSON_OBJECT()) AS CHAR);
  ELSE
    SET o_code = 1;
    SET o_message = 'codigo de error estandar encontrado';
    SET o_data_json = CAST(fn_std_error_json(p_error_code, NULL, JSON_OBJECT()) AS CHAR);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_std_template_operation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_std_template_operation`(
  IN p_actor_user_id BIGINT UNSIGNED,
  IN p_request_json JSON,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  /* ---------------------------------------------------------------------------
   * Project           :- Panaderia
   * Procedure         :- sp_std_template_operation
   * Created By        :- Team
   * Date              :- 2026-05-14
   * Modified By       :-
   * Modified Date     :-
   * ---------------------------------------------------------------------------
   * Comment:
   *   Plantilla base para nuevos SP en MySQL con contrato estandar.
   *
   * Rules:
   *   1) Validar actor y payload.
   *   2) Encapsular logica de negocio en transaccion.
   *   3) Responder por OUT params (sin SELECT principal suelto).
   *
   * Output Contract:
   *   o_code      : 1 success | 0 business validation | -1 sql exception
   *   o_message   : summary text
   *   o_data_json : json payload
   *
   * Smoke Test:
   *   SET @payload = JSON_OBJECT('operation', 'demo', 'entity_ref', 'X-1');
   *   CALL sp_std_template_operation(1, @payload, @o_code, @o_message, @o_data_json);
   *   SELECT @o_code, @o_message, @o_data_json;
   * --------------------------------------------------------------------------- */

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_operation VARCHAR(80);
  DECLARE v_entity_ref VARCHAR(120);

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1
      v_sqlstate = RETURNED_SQLSTATE,
      v_errno = MYSQL_ERRNO,
      v_errmsg = MESSAGE_TEXT;

    ROLLBACK;

    SET o_code = -1;
      SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = JSON_OBJECT(
      'error_type', 'sql_exception',
      'sqlstate', v_sqlstate,
      'errno', v_errno,
      'detail', v_errmsg
    );
  END;

  SET o_code = 0;
  SET o_message = 'error de validacion';
  SET o_data_json = NULL;

  -- 1) Input validation
  IF p_actor_user_id IS NULL OR p_actor_user_id = 0 THEN
    SET o_code = 0;
    SET o_message = 'el actor_user_id es obligatorio';
    SET o_data_json = JSON_OBJECT('field', 'p_actor_user_id');
  ELSEIF p_request_json IS NULL OR JSON_VALID(p_request_json) = 0 THEN
    SET o_code = 0;
    SET o_message = 'request_json debe ser un JSON valido';
    SET o_data_json = JSON_OBJECT('field', 'p_request_json');
  ELSE
    SET v_operation = JSON_UNQUOTE(JSON_EXTRACT(p_request_json, '$.operation'));
    SET v_entity_ref = JSON_UNQUOTE(JSON_EXTRACT(p_request_json, '$.entity_ref'));

    IF v_operation IS NULL OR CHAR_LENGTH(TRIM(v_operation)) = 0 THEN
      SET o_code = 0;
      SET o_message = 'operation es obligatorio';
      SET o_data_json = JSON_OBJECT('field', '$.operation');
    ELSE
      -- 2) Transactional business block
      START TRANSACTION;

      -- TODO: Implement domain logic here.
      -- TODO: Insert audit row in audit_logs when mutating entities.

      COMMIT;

      SET o_code = 1;
      SET o_message = 'operacion completada';
      SET o_data_json = JSON_OBJECT(
        'operation', v_operation,
        'entity_ref', v_entity_ref,
        'actor_user_id', p_actor_user_id,
        'executed_at', DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %H:%i:%s')
      );
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_supplier_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_supplier_create`(
  IN p_tax_id VARCHAR(30),
  IN p_name VARCHAR(150),
  IN p_email VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_address VARCHAR(255),
  IN p_contact_name VARCHAR(120),
  IN p_status VARCHAR(20),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_id BIGINT UNSIGNED;

  IF p_status NOT IN ('active', 'inactive') THEN
    SET o_code = 0;
    SET o_message = 'estado de proveedor invalido';
    SET o_data_json = NULL;
  ELSEIF p_tax_id IS NOT NULL AND p_tax_id <> '' AND EXISTS (SELECT 1 FROM suppliers WHERE tax_id = TRIM(p_tax_id)) THEN
    SET o_code = 0;
    SET o_message = 'el tax_id del proveedor ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO suppliers (tax_id, name, email, phone, address, contact_name, status)
    VALUES (NULLIF(TRIM(p_tax_id), ''), TRIM(p_name), p_email, p_phone, p_address, p_contact_name, p_status);

    SET v_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'supplier.create', 'suppliers', CAST(v_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'proveedor creado';
    SET o_data_json = JSON_OBJECT('supplier_id', v_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_supplier_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_supplier_list`(
  IN p_status VARCHAR(20),
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_total BIGINT DEFAULT 0;
  DECLARE v_items_json LONGTEXT;
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 20;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = IFNULL(NULLIF(p_page, 0), 1);
  IF v_page < 1 THEN
    SET v_page = 1;
  END IF;

  SET v_page_size = IFNULL(NULLIF(p_page_size, 0), 20);
  IF v_page_size < 1 THEN
    SET v_page_size = 20;
  ELSEIF v_page_size > 200 THEN
    SET v_page_size = 200;
  END IF;

  SET v_offset = (v_page - 1) * v_page_size;

  SELECT COUNT(*)
    INTO v_total
  FROM suppliers s
  WHERE (p_status IS NULL OR p_status = '' OR s.status = p_status)
    AND (
      p_search IS NULL OR p_search = ''
      OR s.name LIKE CONCAT('%', p_search, '%')
      OR s.tax_id LIKE CONCAT('%', p_search, '%')
      OR s.email LIKE CONCAT('%', p_search, '%')
    );

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'tax_id', x.tax_id,
             'name', x.name,
             'email', x.email,
             'phone', x.phone,
             'status', x.status
           ) ORDER BY x.id SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT s.id, s.tax_id, s.name, s.email, s.phone, s.status
    FROM suppliers s
    WHERE (p_status IS NULL OR p_status = '' OR s.status = p_status)
      AND (
        p_search IS NULL OR p_search = ''
        OR s.name LIKE CONCAT('%', p_search, '%')
        OR s.tax_id LIKE CONCAT('%', p_search, '%')
        OR s.email LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY s.id DESC
    LIMIT v_offset, v_page_size
  ) x;

  SET o_code = 1;
  SET o_message = 'proveedores listados';
  SET o_data_json = CONCAT(
    '{',
    '"page":', v_page, ',',
    '"page_size":', v_page_size, ',',
    '"total":', v_total, ',',
    '"items":', IFNULL(v_items_json, '[]'),
    '}'
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_supplier_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_supplier_update`(
  IN p_supplier_id BIGINT UNSIGNED,
  IN p_tax_id VARCHAR(30),
  IN p_name VARCHAR(150),
  IN p_email VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_address VARCHAR(255),
  IN p_contact_name VARCHAR(120),
  IN p_status VARCHAR(20),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_status NOT IN ('active', 'inactive') THEN
    SET o_code = 0;
    SET o_message = 'estado de proveedor invalido';
    SET o_data_json = NULL;
  ELSEIF p_tax_id IS NOT NULL AND p_tax_id <> '' AND EXISTS (
    SELECT 1 FROM suppliers WHERE tax_id = TRIM(p_tax_id) AND id <> p_supplier_id
  ) THEN
    SET o_code = 0;
    SET o_message = 'el tax_id del proveedor ya existe';
    SET o_data_json = NULL;
  ELSE
    UPDATE suppliers
    SET tax_id = NULLIF(TRIM(p_tax_id), ''),
        name = TRIM(p_name),
        email = p_email,
        phone = p_phone,
        address = p_address,
        contact_name = p_contact_name,
        status = p_status,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_supplier_id;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'proveedor no encontrado';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (p_actor_user_id, 'supplier.update', 'suppliers', CAST(p_supplier_id AS CHAR));

      SET o_code = 1;
      SET o_message = 'proveedor actualizado';
      SET o_data_json = JSON_OBJECT('supplier_id', p_supplier_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tax_rate_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tax_rate_create`(
  IN p_code VARCHAR(30),
  IN p_name VARCHAR(100),
  IN p_rate_percent DECIMAL(5,2),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_tax_id BIGINT UNSIGNED;

  IF p_rate_percent < 0 OR p_rate_percent > 100 THEN
    SET o_code = 0;
    SET o_message = 'rate_percent debe estar entre 0 y 100';
    SET o_data_json = NULL;
  ELSEIF EXISTS (SELECT 1 FROM tax_rates WHERE code = TRIM(p_code)) THEN
    SET o_code = 0;
    SET o_message = 'el codigo de impuesto ya existe';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO tax_rates (code, name, rate_percent, is_active)
    VALUES (TRIM(p_code), TRIM(p_name), p_rate_percent, IFNULL(p_is_active, 1));

    SET v_tax_id = LAST_INSERT_ID();

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (p_actor_user_id, 'tax_rate.create', 'tax_rates', CAST(v_tax_id AS CHAR));

    SET o_code = 1;
    SET o_message = 'tasa de impuesto creada';
    SET o_data_json = JSON_OBJECT('tax_rate_id', v_tax_id);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tax_rate_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tax_rate_list`(
  IN p_only_active TINYINT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_items_json LONGTEXT;

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', t.id,
             'code', t.code,
             'name', t.name,
             'rate_percent', t.rate_percent,
             'is_active', t.is_active
           ) ORDER BY t.code SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM tax_rates t
  WHERE (IFNULL(p_only_active, 0) = 0 OR t.is_active = 1);

  SET o_code = 1;
  SET o_message = 'tasas de impuesto listadas';
  SET o_data_json = CONCAT('{"items":', IFNULL(v_items_json, '[]'), '}');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tax_rate_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tax_rate_update`(
  IN p_tax_rate_id BIGINT UNSIGNED,
  IN p_name VARCHAR(100),
  IN p_rate_percent DECIMAL(5,2),
  IN p_is_active TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  IF p_rate_percent < 0 OR p_rate_percent > 100 THEN
    SET o_code = 0;
    SET o_message = 'rate_percent debe estar entre 0 y 100';
    SET o_data_json = NULL;
  ELSE
    UPDATE tax_rates
    SET name = TRIM(p_name),
        rate_percent = p_rate_percent,
        is_active = IFNULL(p_is_active, is_active),
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_tax_rate_id;

    SET v_rows = ROW_COUNT();

    IF v_rows = 0 THEN
      SET o_code = 0;
      SET o_message = 'tasa de impuesto no encontrada';
      SET o_data_json = NULL;
    ELSE
      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
      VALUES (p_actor_user_id, 'tax_rate.update', 'tax_rates', CAST(p_tax_rate_id AS CHAR));

      SET o_code = 1;
      SET o_message = 'tasa de impuesto actualizada';
      SET o_data_json = JSON_OBJECT('tax_rate_id', p_tax_rate_id);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_assign_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_assign_roles`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_role_codes_json JSON,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_user_exists INT DEFAULT 0;
  DECLARE v_input_count INT DEFAULT 0;
  DECLARE v_found_count INT DEFAULT 0;
  DECLARE v_assigned_count INT DEFAULT 0;
  DECLARE v_idx INT DEFAULT 0;
  DECLARE v_role_code VARCHAR(50);

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'error de validacion';
  SET o_data_json = NULL;

  IF p_role_codes_json IS NULL OR JSON_VALID(p_role_codes_json) = 0 OR JSON_TYPE(p_role_codes_json) <> 'ARRAY' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el parametro p_role_codes_json debe ser un arreglo JSON valido';
  END IF;

  SET v_input_count = JSON_LENGTH(p_role_codes_json);
  IF v_input_count = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'al menos un rol es obligatorio';
  END IF;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_user_exists
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL
  FOR UPDATE;

  IF v_user_exists = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
  ELSE
    DROP TEMPORARY TABLE IF EXISTS tmp_role_codes;
    CREATE TEMPORARY TABLE tmp_role_codes (
      role_code VARCHAR(50) NOT NULL,
      PRIMARY KEY (role_code)
    ) ENGINE=Memory;

    SET v_idx = 0;
    WHILE v_idx < JSON_LENGTH(p_role_codes_json) DO
      SET v_role_code = TRIM(JSON_UNQUOTE(JSON_EXTRACT(p_role_codes_json, CONCAT('$[', v_idx, ']'))));

      IF v_role_code IS NOT NULL AND v_role_code <> '' THEN
        INSERT IGNORE INTO tmp_role_codes (role_code)
        VALUES (v_role_code);
      END IF;

      SET v_idx = v_idx + 1;
    END WHILE;

    SELECT COUNT(*) INTO v_input_count FROM tmp_role_codes;

    SELECT COUNT(*) INTO v_found_count
    FROM tmp_role_codes t
    INNER JOIN roles r ON r.code = t.role_code;

    IF v_input_count <> v_found_count THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'uno o mas roles no existen';
    ELSE
      DELETE FROM user_roles WHERE user_id = p_user_id;

      INSERT INTO user_roles (user_id, role_id)
      SELECT p_user_id, r.id
      FROM tmp_role_codes t
      INNER JOIN roles r ON r.code = t.role_code;

      SET v_assigned_count = ROW_COUNT();

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'user.assign_roles',
        'users',
        CAST(p_user_id AS CHAR),
        JSON_OBJECT('roles_count', v_assigned_count)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'roles asignados';
      SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'roles_assigned', v_assigned_count);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_create`(
  IN p_username VARCHAR(60),
  IN p_email VARCHAR(255),
  IN p_password_hash VARCHAR(255),
  IN p_password_algo VARCHAR(30),
  IN p_full_name VARCHAR(150),
  IN p_phone VARCHAR(30),
  IN p_role_code VARCHAR(50),
  IN p_must_change_password TINYINT,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE v_role_id BIGINT UNSIGNED;
  DECLARE v_user_id BIGINT UNSIGNED;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'error de validacion';
  SET o_data_json = NULL;

  IF p_username IS NULL OR CHAR_LENGTH(TRIM(p_username)) < 3 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el nombre de usuario (username) debe tener al menos 3 caracteres';
  END IF;

  IF p_email IS NULL OR CHAR_LENGTH(TRIM(p_email)) < 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el correo es obligatorio';
  END IF;

  IF p_password_hash IS NULL OR CHAR_LENGTH(p_password_hash) < 40 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el hash de contrasena (password_hash) es invalido';
  END IF;

  IF p_full_name IS NULL OR CHAR_LENGTH(TRIM(p_full_name)) < 3 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el nombre completo es obligatorio';
  END IF;

  START TRANSACTION;

  IF EXISTS (SELECT 1 FROM users WHERE username = p_username) THEN
    SET o_code = 0;
    SET o_message = 'el nombre de usuario ya existe';
    ROLLBACK;
  ELSEIF EXISTS (SELECT 1 FROM users WHERE email = p_email) THEN
    SET o_code = 0;
    SET o_message = 'el correo ya existe';
    ROLLBACK;
  ELSE
    SELECT id INTO v_role_id
    FROM roles
    WHERE code = p_role_code;

    IF v_role_id IS NULL THEN
      SET o_code = 0;
      SET o_message = 'rol no encontrado';
      ROLLBACK;
    ELSE
      INSERT INTO users (
        username,
        email,
        password_hash,
        password_algo,
        full_name,
        phone,
        status,
        must_change_password,
        password_changed_at
      )
      VALUES (
        TRIM(p_username),
        LOWER(TRIM(p_email)),
        p_password_hash,
        IFNULL(p_password_algo, 'argon2id'),
        TRIM(p_full_name),
        p_phone,
        'active',
        IFNULL(p_must_change_password, 1),
        CURRENT_TIMESTAMP
      );

      SET v_user_id = LAST_INSERT_ID();

      INSERT INTO user_roles (user_id, role_id)
      VALUES (v_user_id, v_role_id);

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'user.create',
        'users',
        CAST(v_user_id AS CHAR),
        JSON_OBJECT('username', p_username, 'email', p_email, 'role_code', p_role_code)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'usuario creado';
      SET o_data_json = JSON_OBJECT('user_id', v_user_id, 'username', p_username, 'email', p_email);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_force_password_reset` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_force_password_reset`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;
  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  START TRANSACTION;

  UPDATE users
  SET must_change_password = 1,
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_user_id
    AND deleted_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id)
    VALUES (
      p_actor_user_id,
      'user.force_password_reset',
      'users',
      CAST(p_user_id AS CHAR)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'se activo el cambio obligatorio de contrasena';
    SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'must_change_password', 1);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_get_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_get_by_id`(
  IN p_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;

  SELECT COUNT(*)
    INTO v_exists
  FROM users u
  WHERE u.id = p_user_id
    AND u.deleted_at IS NULL;

  IF v_exists = 0 THEN
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    SET o_code = 1;
    SET o_message = 'usuario obtenido';

    SELECT JSON_OBJECT(
      'id', u.id,
      'username', u.username,
      'email', u.email,
      'full_name', u.full_name,
      'phone', u.phone,
      'status', u.status,
      'must_change_password', u.must_change_password,
      'last_login_at', u.last_login_at,
      'roles', IFNULL(
        (
          SELECT CONCAT('[', GROUP_CONCAT(JSON_QUOTE(r.code) ORDER BY r.code SEPARATOR ','), ']')
          FROM user_roles ur
          INNER JOIN roles r ON r.id = ur.role_id
          WHERE ur.user_id = u.id
        ),
        '[]'
      )
    )
    INTO o_data_json
    FROM users u
    WHERE u.id = p_user_id
      AND u.deleted_at IS NULL
    LIMIT 1;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_list`(
  IN p_status VARCHAR(20),
  IN p_search VARCHAR(120),
  IN p_page INT,
  IN p_page_size INT,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_total BIGINT DEFAULT 0;
  DECLARE v_items_json LONGTEXT;
  DECLARE v_page INT DEFAULT 1;
  DECLARE v_page_size INT DEFAULT 20;
  DECLARE v_offset INT DEFAULT 0;

  SET v_page = IFNULL(NULLIF(p_page, 0), 1);
  IF v_page < 1 THEN
    SET v_page = 1;
  END IF;

  SET v_page_size = IFNULL(NULLIF(p_page_size, 0), 20);
  IF v_page_size < 1 THEN
    SET v_page_size = 20;
  ELSEIF v_page_size > 200 THEN
    SET v_page_size = 200;
  END IF;

  SET v_offset = (v_page - 1) * v_page_size;

  SELECT COUNT(*)
    INTO v_total
  FROM users u
  WHERE u.deleted_at IS NULL
    AND (p_status IS NULL OR p_status = '' OR u.status = p_status)
    AND (
      p_search IS NULL OR p_search = ''
      OR u.username LIKE CONCAT('%', p_search, '%')
      OR u.email LIKE CONCAT('%', p_search, '%')
      OR u.full_name LIKE CONCAT('%', p_search, '%')
    );

  SELECT IFNULL(
           CONCAT('[', GROUP_CONCAT(JSON_OBJECT(
             'id', x.id,
             'username', x.username,
             'email', x.email,
             'full_name', x.full_name,
             'status', x.status,
             'must_change_password', x.must_change_password,
             'last_login_at', x.last_login_at,
             'created_at', x.created_at
           ) ORDER BY x.id SEPARATOR ','), ']'),
           '[]'
         )
    INTO v_items_json
  FROM (
    SELECT u.id, u.username, u.email, u.full_name, u.status, u.must_change_password, u.last_login_at, u.created_at
    FROM users u
    WHERE u.deleted_at IS NULL
      AND (p_status IS NULL OR p_status = '' OR u.status = p_status)
      AND (
        p_search IS NULL OR p_search = ''
        OR u.username LIKE CONCAT('%', p_search, '%')
        OR u.email LIKE CONCAT('%', p_search, '%')
        OR u.full_name LIKE CONCAT('%', p_search, '%')
      )
    ORDER BY u.id DESC
    LIMIT v_offset, v_page_size
  ) x;

  SET o_code = 1;
  SET o_message = 'usuarios listados';
  SET o_data_json = CONCAT(
    '{',
    '"page":', v_page, ',',
    '"page_size":', v_page_size, ',',
    '"total":', v_total, ',',
    '"items":', IFNULL(v_items_json, '[]'),
    '}'
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_set_status`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_status VARCHAR(20),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_rows INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  IF p_status NOT IN ('active', 'inactive', 'blocked') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el estado es invalido';
  END IF;

  START TRANSACTION;

  UPDATE users
  SET status = p_status,
      updated_at = CURRENT_TIMESTAMP
  WHERE id = p_user_id
    AND deleted_at IS NULL;

  SET v_rows = ROW_COUNT();

  IF v_rows = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
    SET o_data_json = NULL;
  ELSE
    IF p_status <> 'active' THEN
      UPDATE user_sessions
      SET revoked_at = CURRENT_TIMESTAMP
      WHERE user_id = p_user_id
        AND revoked_at IS NULL;
    END IF;

    INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
    VALUES (
      p_actor_user_id,
      'user.set_status',
      'users',
      CAST(p_user_id AS CHAR),
      JSON_OBJECT('status', p_status)
    );

    COMMIT;

    SET o_code = 1;
    SET o_message = 'estado de usuario actualizado';
    SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'status', p_status);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_update_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_update_profile`(
  IN p_user_id BIGINT UNSIGNED,
  IN p_full_name VARCHAR(150),
  IN p_email VARCHAR(255),
  IN p_phone VARCHAR(30),
  IN p_status VARCHAR(20),
  IN p_actor_user_id BIGINT UNSIGNED,
  OUT o_code INT,
  OUT o_message VARCHAR(255),
  OUT o_data_json LONGTEXT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;
  DECLARE v_email_conflict INT DEFAULT 0;
  DECLARE v_status_ok INT DEFAULT 0;
  DECLARE v_rows INT DEFAULT 0;

  DECLARE v_sqlstate CHAR(5) DEFAULT '00000';
  DECLARE v_errno INT DEFAULT 0;
  DECLARE v_errmsg TEXT;

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_sqlstate = RETURNED_SQLSTATE, v_errno = MYSQL_ERRNO, v_errmsg = MESSAGE_TEXT;
    ROLLBACK;
    SET o_code = -1;
    SET o_message = CONCAT('ERROR_SQL ', v_errno, ' ', v_sqlstate, ': ', v_errmsg);
    SET o_data_json = NULL;
  END;

  SET o_code = 0;
  SET o_message = 'error de validacion';
  SET o_data_json = NULL;

  IF p_full_name IS NULL OR CHAR_LENGTH(TRIM(p_full_name)) < 3 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el nombre completo es obligatorio';
  END IF;

  IF p_email IS NULL OR CHAR_LENGTH(TRIM(p_email)) < 5 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el correo es obligatorio';
  END IF;

  SET v_status_ok = CASE WHEN p_status IN ('active', 'inactive', 'blocked') THEN 1 ELSE 0 END;
  IF v_status_ok = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'el estado es invalido';
  END IF;

  START TRANSACTION;

  SELECT COUNT(*) INTO v_exists
  FROM users
  WHERE id = p_user_id
    AND deleted_at IS NULL
  FOR UPDATE;

  IF v_exists = 0 THEN
    ROLLBACK;
    SET o_code = 0;
    SET o_message = 'usuario no encontrado';
  ELSE
    SELECT COUNT(*) INTO v_email_conflict
    FROM users
    WHERE email = LOWER(TRIM(p_email))
      AND id <> p_user_id;

    IF v_email_conflict > 0 THEN
      ROLLBACK;
      SET o_code = 0;
      SET o_message = 'el correo ya existe';
    ELSE
      UPDATE users
      SET full_name = TRIM(p_full_name),
          email = LOWER(TRIM(p_email)),
          phone = p_phone,
          status = p_status,
          updated_at = CURRENT_TIMESTAMP
      WHERE id = p_user_id;

      SET v_rows = ROW_COUNT();

      INSERT INTO audit_logs (actor_user_id, action, entity_name, entity_id, metadata_json)
      VALUES (
        p_actor_user_id,
        'user.update_profile',
        'users',
        CAST(p_user_id AS CHAR),
        JSON_OBJECT('status', p_status)
      );

      COMMIT;

      SET o_code = 1;
      SET o_message = 'perfil de usuario actualizado';
      SET o_data_json = JSON_OBJECT('user_id', p_user_id, 'updated_rows', v_rows);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-24 22:17:38
