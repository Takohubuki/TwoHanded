/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.15 : Database - twohanded
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`twohanded` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `twohanded`;

/*Table structure for table `buyer` */

DROP TABLE IF EXISTS `buyer`;

CREATE TABLE `buyer` (
  `BID` varchar(99) NOT NULL,
  `username` varchar(99) DEFAULT NULL,
  `password` varchar(99) DEFAULT NULL,
  `phone` varchar(99) DEFAULT NULL,
  `dormitory` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `buyer` */

insert  into `buyer`(`BID`,`username`,`password`,`phone`,`dormitory`) values 
('B16044521','123','e10adc3949ba59abbe56e057f20f883e','15242415623','5521'),
('B16044619','xlj','e10adc3949ba59abbe56e057f20f883e','15242415623','2502');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` varchar(99) NOT NULL,
  `name` varchar(99) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(99) DEFAULT NULL,
  `tags` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `items_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `items` */

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` varchar(99) NOT NULL,
  `name` varchar(99) DEFAULT NULL,
  `password` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`id`,`name`,`password`) values 
('1','admin','21232f297a57a5a743894a0e4a801fc3');

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `userId` varchar(99) NOT NULL,
  `password` varchar(99) DEFAULT NULL,
  `phoneNum` varchar(99) DEFAULT NULL,
  `username` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `members_userId_uindex` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `members` */

insert  into `members`(`userId`,`password`,`phoneNum`,`username`) values 
('20190422123','123','12521262215','123');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orders_id` varchar(99) NOT NULL,
  `items_id` varchar(99) NOT NULL,
  `buyer_id` varchar(99) DEFAULT NULL,
  `seller_id` varchar(99) DEFAULT NULL,
  `items_num` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`orders_id`,`items_id`),
  KEY `orders___buyer` (`buyer_id`),
  KEY `orders___items` (`items_id`),
  KEY `orders___seller` (`seller_id`),
  CONSTRAINT `orders___buyer` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`BID`),
  CONSTRAINT `orders___items` FOREIGN KEY (`items_id`) REFERENCES `items` (`id`),
  CONSTRAINT `orders___seller` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `SID` varchar(99) NOT NULL,
  `username` varchar(99) DEFAULT NULL,
  `password` varchar(99) DEFAULT NULL,
  `phone` varchar(99) DEFAULT NULL,
  `dormitory` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `seller` */

insert  into `seller`(`SID`,`username`,`password`,`phone`,`dormitory`) values 
('S16044521','123','e10adc3949ba59abbe56e057f20f883e','15242415623','5521'),
('S16044619','xlj','e10adc3949ba59abbe56e057f20f883e','15242415623','2502');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
