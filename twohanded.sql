/*
SQLyog Professional v12.09 (64 bit)
MySQL - 8.0.16 : Database - twohanded
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`twohanded` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `twohanded`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) DEFAULT NULL,
  `member_sid` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `describes` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `conditions` varchar(255) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `item` */

insert  into `item`(`id`,`name`,`price`,`number`,`publisher`,`describes`,`image`,`quality`,`conditions`,`publish_time`,`update_time`) values (1,'Almonds, 100g',149,50,'16044254','商品3描述','images/m1.jpg',1,'出售','2019-07-01 03:31:28','2019-07-01 03:31:32'),(2,'Cashew Nuts, 100g',200,70,'12033531','商品2描述','images/m2.jpg',5,'出售','2019-07-01 03:32:05','2019-07-01 03:34:40'),(3,'Pista..., 250g',520,44,'15052342','商品4描述','images/m3.jpg',7,'出售','2019-07-01 03:34:37','2017-07-01 03:34:39'),(4,'test',100,23,'16053524','商品1描述','images/s1.jpg',10,'出售','2019-06-01 03:34:41','2020-05-01 03:34:44'),(5,'求购商品1',100,1,'17025356','求购需求','images/mk4.jpg',6,'求购','2010-05-04 01:38:19','2019-07-04 01:38:35'),(6,'求购商品2',50,10,'18026554','求购需求','images/mk5.jpg',9,'求购','2009-07-04 01:39:07','2019-09-04 01:39:16'),(7,'求购商品3',10,5,'16046257','求购需求','images/mk6.jpg',8,'求购','2013-07-04 01:39:51','2019-06-04 01:39:59'),(8,'求购商品4',200,1,'15052294','求购需求','images/mk5.jpg',7,'求购','2016-07-04 01:40:53','2019-10-04 01:41:01'),(11,'但如果',20,1,'16046621','5434','images/3.jpg',6,'出售','2019-07-05 18:30:38','2019-07-05 18:30:38'),(12,'地方',20,1,'16046621','dfdefrg','images/3.jpg',5,'求购','2019-07-05 18:50:09','2019-07-05 18:50:09'),(13,'地方',4,1,'16046621','rtyhrhyerg','images/3.jpg',6,'出售','2019-07-05 18:54:30','2019-07-05 18:54:30');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`id`,`username`,`password`) values (1,'admin','4297f44b13955235245b2497399d7a93');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `sid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dormitory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`sid`,`username`,`password`,`dormitory`,`name`,`avatar`,`phone`) values ('15022364','123','4297f44b13955235245b2497399d7a93',5521,'但如果','default.jpg','15503125215'),('15025236','932421804','4297f44b13955235245b2497399d7a93',5521,'开户行沟通','default.jpg','15504618935'),('16025426','admin','4297f44b13955235245b2497399d7a93',2202,'地方','default.jpg','15504618935'),('16046621','xlj','4297f44b13955235245b2497399d7a93',2202,'xlj','xlj.png','15504618935');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_paid` varchar(255) DEFAULT NULL,
  `is_received` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
