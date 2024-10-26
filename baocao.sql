-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.5.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for shop
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `shop`;

-- Dumping structure for table shop.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.account: ~6 rows (approximately)
INSERT INTO `account` (`id`, `email`, `password`) VALUES
	(1, 'duy1@gmail.com', '1'),
	(2, 'duy2@gmail.com', '2'),
	(3, 'duy3@gmail.com', '3'),
	(4, 'duy4@gmail.com', '4'),
	(5, 'duy5@gmail.com', '5'),
	(6, '1', '1');

-- Dumping structure for table shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.categories: ~3 rows (approximately)
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Smartphone'),
	(2, 'Ipad'),
	(3, 'Macbook');

-- Dumping structure for table shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.products: ~32 rows (approximately)
INSERT INTO `products` (`id`, `name`, `category_id`, `url`, `price`) VALUES
	(1, 'Iphone 11', 1, 'ip11.jpg', 500),
	(2, 'Iphone 12', 1, 'ip12.jpg', 600),
	(3, 'Iphone 13', 1, 'ip13.jpg', 700),
	(4, 'Iphone 13 Plus', 1, 'ip13plus.jpg', 750),
	(5, 'Iphone 14', 1, 'ip14.jpg', 850),
	(6, 'Iphone 14 Promax', 1, 'ip14prm.jpg', 950),
	(7, 'Iphone 14 Plus', 1, 'ip14plus.jpg', 900),
	(8, 'Iphone 14 Pro', 1, 'ip14pro.jpg', 900),
	(9, 'Iphone 15', 1, 'ip15.jpg', 950),
	(10, 'Iphone 15 Plus', 1, 'ip15plus.jpg', 1000),
	(11, 'Iphone 15 Promax', 1, 'ip15prm.jpg', 1100),
	(12, 'Iphone 16', 1, 'ip16.jpg', 1200),
	(13, 'Iphone 16 Pro', 1, 'ip16pr.jpg', 1300),
	(14, 'Iphone 16 Promax', 1, 'ip16prm.jpg', 1400),
	(15, 'Macbook M1 13 inch', 3, 'm1_13.jpg', 1200),
	(16, 'Macbook M2 13 inch', 3, 'm2_13.jpg', 1300),
	(17, 'Macbook M2 15 inch', 3, 'm2_15.jpg', 1350),
	(18, 'Macbook M3 13 inch', 3, 'm3_13.jpg', 1400),
	(19, 'Macbook M3 15 inch', 3, 'm3_15.jpg', 1480),
	(20, 'Macbook M3 Pro 14 inch', 3, 'pro_m3_14.jpg', 1500),
	(21, 'Macbook M3 Pro 16 inch', 3, 'pro_m3_max_16.jpg', 1600),
	(22, 'Ipad 9 4G', 2, 'ipad_9_4g.jpg', 500),
	(23, 'Ipad 9 Wifi', 2, 'ipad_9_wifi.jpg', 550),
	(24, 'Ipad 10 5G', 2, 'ipad_10_5g.jpg', 600),
	(25, 'Ipad 10 Wifi', 2, 'ipad_10_wifi.jpg', 580),
	(26, 'Ipad Air M2 11 inch', 2, 'ipad_air_m2_11inch.jpg', 800),
	(27, 'Ipad Air M4 11 inch', 2, 'ipad_air_m4_11inch_wifi.jpg', 1000),
	(28, 'Ipad Air M2 11 inch 5G', 2, 'ipad_m2_11inch_5g.jpg', 900),
	(29, 'Ipad Air M2 13 inch 5G', 2, 'ipad_m2_13inch_5g.jpg', 990),
	(30, 'Ipad Air M2 13 inch Wifi', 2, 'ipad_m2_13inch_wifi.jpg', 900),
	(31, 'Ipad Air M4 13 inch 5G', 2, 'ipad_m4_13inch_5g.jpg', 1200),
	(32, 'Ipad Pro M4 13 inch', 2, 'ipad_pro_m4_13inch.jpg', 1400);

-- Dumping structure for table shop.product_attributes
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `attribute_type` enum('best_sales','best_matched','popular') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_attributes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.product_attributes: ~32 rows (approximately)
INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_type`) VALUES
	(1, 1, 'best_sales'),
	(2, 2, 'best_sales'),
	(3, 3, 'best_sales'),
	(4, 4, 'best_sales'),
	(5, 5, 'best_matched'),
	(6, 6, 'best_matched'),
	(7, 7, 'best_matched'),
	(8, 8, 'best_matched'),
	(9, 9, 'popular'),
	(10, 10, 'popular'),
	(11, 11, 'popular'),
	(12, 12, 'popular'),
	(13, 13, 'popular'),
	(14, 14, 'popular'),
	(15, 15, 'best_sales'),
	(16, 16, 'best_sales'),
	(17, 17, 'best_sales'),
	(18, 18, 'best_matched'),
	(19, 19, 'best_matched'),
	(20, 20, 'popular'),
	(21, 21, 'popular'),
	(22, 22, 'best_sales'),
	(23, 23, 'best_sales'),
	(24, 24, 'best_sales'),
	(25, 25, 'best_matched'),
	(26, 26, 'best_matched'),
	(27, 27, 'popular'),
	(28, 28, 'best_matched'),
	(29, 29, 'popular'),
	(30, 30, 'best_matched'),
	(31, 31, 'popular'),
	(32, 32, 'best_sales');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
