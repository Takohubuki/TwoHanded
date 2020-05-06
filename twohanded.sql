/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.11 : Database - twohanded
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

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品id',
  `member_sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户id',
  `item_num` int(11) DEFAULT NULL COMMENT '单种商品数量',
  `is_checked` tinyint(1) DEFAULT '0' COMMENT '是否结账 0已付 1未付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

insert  into `cart`(`id`,`item_id`,`member_sid`,`item_num`,`is_checked`) values 
(1,'2019071819193815025236','15025236',1,0),
(2,'2019072011554916046621','15025236',1,0),
(48,'2019060103344116053524','15022364',7,0),
(50,'2019070518303816046621','15022364',1,0),
(61,'2019070103320512033531','16046621',3,0),
(62,'2019060103344116053524','16046621',3,0),
(88,'2019070103312816044254','15022364',1,0);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品名称',
  `price` int(11) DEFAULT NULL COMMENT '单价',
  `number` int(11) DEFAULT '0' COMMENT '库存',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发布用户id',
  `describes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'images/default.jpg' COMMENT '图片',
  `kind` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '杂物' COMMENT '分类',
  `quality` int(11) DEFAULT NULL COMMENT '商品成色 x表示x成新',
  `conditions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出售或求购',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '信息更新时间',
  `is_undercarriage` tinyint(1) DEFAULT '0' COMMENT '是否下架',
  `undercarriage_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '下架原因',
  `viewed_times` int(11) DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `item` */

insert  into `item`(`id`,`serial_num`,`name`,`price`,`number`,`publisher`,`describes`,`image`,`kind`,`quality`,`conditions`,`publish_time`,`update_time`,`is_undercarriage`,`undercarriage_reason`,`viewed_times`) values 
(1,'2019070103312816044254','商品3',149,10,'16046621','商品3描述','images/m1.jpg','电子产品',1,'出售','2019-07-01 03:31:28','2019-07-01 03:31:32',0,'',10),
(2,'2019070103320512033531','坚果',200,237,'15025236','商品2描述','images/m2.jpg','衣物',5,'出售','2019-07-01 03:32:05','2019-07-01 03:34:40',1,'数量太多',21),
(3,'2019070103343715052342','商品4',520,43,'15025236','商品4描述','images/m3.jpg','电子产品',7,'出售','2019-07-01 03:34:37','2017-07-01 03:34:39',0,'',6),
(4,'2019060103344116053524','test',100,0,'18047828','商品1描述','images/s1.jpg','杂物',10,'出售','2019-06-01 03:34:41','2020-05-01 03:34:44',1,'库存不足',23),
(5,'2010050401381917025356','求购商品1',100,1,'15025236','求购需求','images/mk4.jpg','生活用品',6,'求购','2010-05-04 01:38:19','2019-07-04 01:38:35',0,'',0),
(6,'2009070401390718026554','求购商品2',50,12,'16046621','求购需求','images/mk5.jpg','体育用品',9,'求购','2009-07-04 01:39:07','2019-09-04 01:39:16',1,'二哥',8),
(7,'2013070401395116046257','求购商品3',10,5,'16046257','求购需求','images/mk6.jpg','电子产品',8,'求购','2013-07-04 01:39:51','2019-06-04 01:39:59',0,NULL,0),
(8,'2016070401405315052294','求购商品4',200,1,'15052294','求购需求','images/mk5.jpg','生活用品',7,'求购','2016-07-04 01:40:53','2019-10-04 01:41:01',0,NULL,1),
(11,'2019070518303816046621','但如果',20,10,'16046621','5434','images/3.jpg','衣物',6,'出售','2019-07-05 18:30:38','2019-07-05 18:30:38',0,'',3),
(12,'2019070518500916046621','地方',20,3,'16046621','dfdefrg','images/3.jpg','杂物',5,'求购','2019-07-05 18:50:09','2019-07-05 18:50:09',1,'字显示不出',5),
(13,'2019070518543016046621','出售商品02',4,10,'16046621','rtyhrhyerg','images/3.jpg','体育用品',6,'出售','2019-07-05 18:54:30','2019-07-05 18:54:30',0,'',1),
(14,'2019071819193815025236','出售商品01',5,10,'15025236','拖把','images/a7.jpg','衣物',8,'出售','2019-07-18 19:19:38','2019-07-18 19:19:38',0,'',2),
(15,'2019072011554916046621','xlj发布3',20,19,'16046621','洗衣液','images/a2.jpg','生活用品',6,'出售','2019-07-20 11:55:50','2019-07-20 11:55:50',0,'',0),
(16,'2020031716582916025426','admin出售',10,10,'16025426','9成新自用扫把，有意者来  ==','images/default.jpg','电子产品',9,'出售','2020-03-17 16:58:29','2020-04-15 19:57:54',0,'',0),
(17,'2020032417343716046621','二手电脑',5000,10,'16046621','8成新电脑  i5-9400f + 2080TI','images/default.jpg','电子产品',8,'出售','2020-03-24 17:34:38','2020-03-24 17:34:38',0,'',6),
(18,'2020041121340416025426','二手篮球',50,4,'16025426','高中用过的篮球  便宜出','images/default.jpg','体育用品',10,'出售','2020-04-11 21:34:05','2020-04-11 21:34:05',1,'价格太高',1),
(19,'2020041122263016025426','二手游戏机',1000,10,'16025426','小时候玩的游戏机','images/default.jpg','电子产品',8,'出售','2020-04-11 22:26:30','2020-04-15 20:05:11',0,'',1),
(20,'2020041416420415022364','洗衣液',10,8,'15022364','要毕业了 用不完的洗衣液便宜出','images/default.jpg','生活用品',NULL,'出售','2020-04-14 16:42:04','2020-04-14 16:42:04',0,'',4),
(22,'2020041520473716025426','衣架',10,20,'16025426','多的衣架 1块钱一个 10个起卖','images/default.jpg','生活用品',NULL,'出售','2020-04-15 20:47:37','2020-04-15 20:47:37',0,'',1),
(23,'2020041522375616025426','二手足球',50,1,'16025426','','images/default.jpg','体育用品',NULL,'出售','2020-04-15 22:37:56','2020-04-15 22:37:56',0,'',6),
(24,'2020042020471216025426','椰子正品',5000,0,'16025426','官方抽奖得的 绝对正品','images/default.jpg','衣物',NULL,'出售','2020-04-20 20:47:12','2020-04-20 20:47:12',1,'库存不足',2),
(25,'2020042020474816025426','球鞋',543,1,'16025426','便宜收一个回力球鞋','images/default.jpg','电子产品',NULL,'求购','2020-04-20 20:47:48','2020-04-20 20:47:48',0,'',1),
(26,'2020042020481916046621','二手手机',3000,10,'16046621','华为','images/default.jpg','电子产品',NULL,'出售','2020-04-20 20:48:19','2020-04-20 20:48:19',0,'',2),
(27,'2020042119252818047828','二手电脑',1000,0,'18047828','自用','images/default.jpg','电子产品',NULL,'求购','2020-04-21 19:25:29','2020-04-21 19:25:29',0,'',0);

/*Table structure for table `item_kind` */

DROP TABLE IF EXISTS `item_kind`;

CREATE TABLE `item_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `item_kind` */

insert  into `item_kind`(`id`,`kind_name`) values 
(1,'电子产品'),
(2,'体育用品'),
(3,'生活用品'),
(4,'衣物'),
(5,'杂物');

/*Table structure for table `key_config` */

DROP TABLE IF EXISTS `key_config`;

CREATE TABLE `key_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_key` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `private_key` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `key_config` */

insert  into `key_config`(`id`,`public_key`,`private_key`) values 
(1,'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');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `manager` */

insert  into `manager`(`id`,`username`,`password`) values 
(1,'admin','4297f44b13955235245b2497399d7a93');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户登录密码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default.jpg' COMMENT '用户头像路径',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话号',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '封禁状态 0禁用 1正常',
  `signin_time` datetime DEFAULT NULL COMMENT '注册时间',
  `recent_login` datetime DEFAULT NULL COMMENT '最近登录时间',
  `positive_comment` int(11) DEFAULT '0' COMMENT '好评数',
  `negative_comment` int(11) DEFAULT '0' COMMENT '差评数',
  `trad_record_num` int(11) DEFAULT '0' COMMENT '成交次数',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'U' COMMENT '用户状态 U正常 S限制交易 D停止使用 V待实名',
  `identification_material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户上传的学生证照片',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`sid`,`username`,`password`,`email`,`name`,`avatar`,`phone`,`is_active`,`signin_time`,`recent_login`,`positive_comment`,`negative_comment`,`trad_record_num`,`status`,`identification_material`) values 
('15022364','123','4297f44b13955235245b2497399d7a93','243510508@qq.com','但如果','default.jpg','15503125215',1,'2019-07-19 09:43:58','2020-04-29 22:55:44',0,0,5,'U',NULL),
('15025236','932421804','4297f44b13955235245b2497399d7a93','932421804@qq.com','开户行沟通','default.jpg','15504618935',1,'2019-07-19 09:44:22','2019-08-02 14:37:20',0,1,13,'U',NULL),
('16025425','。。。','202cb962ac59075b964b07152d234b70','Takohubuki@163.com','但如果','default.jpg','15504618935',1,'2020-05-06 16:24:39','2020-05-06 16:56:50',0,0,0,'V','/images/user/identificationPhoto/7A0E483C8E69A175C9DF8C512FDEBDA2.png'),
('16025426','admin','e10adc3949ba59abbe56e057f20f883e','Takohubuki@163.com','地方','default.jpg','15504618935',1,'2019-07-19 09:44:26','2020-05-01 20:46:30',0,0,6,'D',NULL),
('16044606','htd','4297f44b13955235245b2497399d7a93','932421804@qq.com','htd','default.jpg','15504618935',1,'2020-05-01 19:59:51','2020-05-01 19:59:51',0,0,0,'U',NULL),
('16046621','htd','4297f44b13955235245b2497399d7a93','670526299@qq.com','xlj','right.png','15504618935',1,'2019-07-19 09:44:31','2020-04-27 21:20:45',2,0,18,'U',NULL),
('18047828','热心人','4297f44b13955235245b2497399d7a93','a932421804@gmail.com','想吃肉','default.jpg','15504618935',1,'2019-07-19 09:44:31','2020-04-21 19:25:06',6,0,14,'S',NULL);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `receiver` varchar(20) DEFAULT NULL COMMENT '接收通知的用户',
  `body` varchar(255) NOT NULL COMMENT '通知内容',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '通知状态 E已读 U未读',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `notice` */

insert  into `notice`(`id`,`receiver`,`body`,`status`,`create_time`) values 
(1,'16025426','测试','E','2020-04-21 17:13:53'),
(2,'16046621','热心人已经拍下您的商品 二手手机','E','2020-04-21 18:51:13'),
(3,'16025426','热心人已经拍下您的商品 椰子正品','E','2020-04-21 18:51:13'),
(4,'16025426','热心人已经拍下您的商品 二手足球','E','2020-04-21 18:51:13'),
(5,'16046621','htd已经确认收货，订单完成','E','2020-04-21 18:58:56'),
(6,'16025426','admin已经确认收货，订单完成','E','2020-04-21 18:58:57'),
(7,'16025426','admin已经确认收货，订单完成','E','2020-04-21 18:58:57'),
(8,'16025426','热心人回应了你的求购：球鞋','E','2020-04-21 19:21:41'),
(9,'16025426','热心人已经拍下您的商品 二手足球','E','2020-04-21 19:22:02'),
(10,'16025426','您的椰子正品已经售罄','E','2020-04-21 19:22:02'),
(11,'16025426','热心人已经拍下您的商品 椰子正品','E','2020-04-21 19:22:02'),
(12,'16046621','热心人已经拍下您的商品 二手手机','E','2020-04-21 19:22:03'),
(13,'16025426','热心人已经付款','E','2020-04-21 19:22:04'),
(14,'16025426','热心人已经付款','E','2020-04-21 19:22:04'),
(15,'16046621','热心人已经付款','E','2020-04-21 19:22:04'),
(16,'18047828','管理员已同意您的二手电脑的发布申请','E','2020-04-21 19:25:45'),
(17,'16025426','热心人已经确认收货，订单完成','E','2020-04-21 19:26:18'),
(18,'16025426','热心人已经确认收货，订单完成','E','2020-04-21 19:26:18'),
(19,'16046621','热心人已经确认收货，订单完成','E','2020-04-21 19:26:18'),
(20,'18047828','收到来自 admin 的好评','U','2020-04-21 21:48:41'),
(21,'18047828','收到来自 admin 的好评','U','2020-04-21 22:00:48'),
(22,'15022364','admin已经拍下您的商品 洗衣液','E','2020-04-21 22:18:57'),
(23,'16046621','admin已经拍下您的商品 二手手机','E','2020-04-21 22:18:57'),
(24,'15022364','admin已经确认收货，订单完成','E','2020-04-21 22:19:30'),
(25,'16046621','admin已经确认收货，订单完成','E','2020-04-21 22:19:30'),
(26,'15022364','admin已经确认收货，订单完成','E','2020-04-21 22:21:01'),
(27,'16046621','admin已经确认收货，订单完成','E','2020-04-21 22:21:01'),
(28,'18047828','收到来自 admin 的好评','U','2020-04-21 22:21:09'),
(29,'18047828','收到来自 admin 的好评','U','2020-04-21 22:22:47'),
(30,'15025236','收到来自 admin 的差评','U','2020-04-21 22:24:44'),
(31,'18047828','收到来自 admin 的好评','U','2020-04-21 22:24:49'),
(32,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:01'),
(33,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:01'),
(34,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:07'),
(35,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:07'),
(36,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:10'),
(37,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:13'),
(38,'15025236','htd已经确认收货，订单完成','U','2020-04-27 20:38:13'),
(39,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:15'),
(40,'15025236','htd已经确认收货，订单完成','U','2020-04-27 20:38:15'),
(41,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:24'),
(42,'15025236','htd已经确认收货，订单完成','U','2020-04-27 20:38:24'),
(43,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:24'),
(44,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:26'),
(45,'15025236','htd已经确认收货，订单完成','U','2020-04-27 20:38:26'),
(46,'18047828','htd已经确认收货，订单完成','U','2020-04-27 20:38:26'),
(47,'16046621','htd已经确认收货，订单完成','U','2020-04-27 20:38:28'),
(48,'18047828','收到来自 htd 的好评','U','2020-04-27 20:38:32'),
(49,'16046621','收到来自 htd 的好评','U','2020-04-27 20:38:38'),
(50,'16046621','收到来自 htd 的好评','U','2020-04-27 20:38:43'),
(51,'16046621','admin已经拍下您的商品 二手手机','U','2020-04-27 21:32:33'),
(52,'15022364','admin已经拍下您的商品 洗衣液','E','2020-04-27 21:32:33'),
(53,'16046621','admin已经确认收货，订单完成','U','2020-04-27 21:32:48'),
(54,'15022364','admin已经确认收货，订单完成','E','2020-04-27 21:32:48'),
(55,'16046621','admin已经确认收货，订单完成','U','2020-04-29 16:05:03'),
(56,'15022364','admin已经确认收货，订单完成','E','2020-04-29 16:05:04'),
(57,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:39:59'),
(58,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:39:59'),
(59,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:40:13'),
(60,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:40:13'),
(61,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:40:35'),
(62,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:40:35'),
(63,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:42:07'),
(64,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:42:17'),
(65,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:51:07'),
(66,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:51:15'),
(67,'15025236','123已经确认收货，订单完成','U','2020-04-29 22:51:22'),
(68,'16046621','123已经确认收货，订单完成','U','2020-04-29 22:51:24'),
(69,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:51:30'),
(70,'16046621','123已经确认收货，订单完成','U','2020-04-29 22:51:33'),
(71,'16046621','123已经确认收货，订单完成','U','2020-04-29 22:51:37'),
(72,'18047828','123已经确认收货，订单完成','U','2020-04-29 22:51:40'),
(73,'16046621','123已经确认收货，订单完成','U','2020-04-29 22:51:42'),
(74,'16046621','管理员拒绝了您发布 商品3 的申请','U','2020-05-04 21:23:05'),
(75,'16025426','管理员拒绝了您发布 二手足球 的申请','U','2020-05-04 21:27:43');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单id',
  `sum_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单种商品总价',
  `item_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品id',
  `buyer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '买家用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_paid` tinyint(1) DEFAULT NULL COMMENT '是否付款 1付款 0未付',
  `is_received` tinyint(1) DEFAULT NULL COMMENT '是否收货 0未受 1收货',
  `is_canceled` tinyint(1) DEFAULT NULL COMMENT '是否取消 0正常 1取消',
  `is_checked` tinyint(1) DEFAULT '0' COMMENT '买家是否评价 0未评价 1已评价',
  `pay_method` varchar(255) DEFAULT NULL COMMENT '支付方式',
  `display` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'U' COMMENT '用户是否删除 B买家删除 S卖家删除 D都删除 E订单超过4年可以删除',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态 C已取消 P已付待收货 U待付款 R收货待评价 V已评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order` */

insert  into `order`(`id`,`order_id`,`sum_price`,`item_num`,`item_id`,`buyer_id`,`create_time`,`update_time`,`is_paid`,`is_received`,`is_canceled`,`is_checked`,`pay_method`,`display`,`status`) values 
(66,'15022364202003241636','¥100',1,'2019060103344116053524','15022364','2020-03-24 16:36:51','2020-04-29 22:51:15',1,1,0,0,'cashpay','E','R'),
(67,'15022364202003241636','¥100',1,'2019060103344116053524','15022364','2020-03-24 16:36:51','2020-04-29 22:51:15',1,1,0,0,'cashpay','E','R'),
(69,'15022364202003241643','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:43:14','2020-04-29 22:51:37',1,1,0,0,'alipay','E','R'),
(70,'15022364202003241643','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:43:14','2020-04-29 22:51:37',1,1,0,0,'alipay','E','R'),
(71,'15022364202003241643','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:43:14','2020-04-29 22:51:37',1,1,0,0,'alipay','E','R'),
(72,'15022364202003241644','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:44:23','2020-04-29 22:51:24',1,1,0,0,'alipay','E','R'),
(73,'15022364202003241644','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:44:23','2020-04-29 22:51:24',1,1,0,0,'alipay','E','R'),
(74,'15022364202003241644','¥20',1,'2019070518303816046621','15022364','2020-03-24 16:44:23','2020-04-29 22:51:24',1,1,0,0,'alipay','E','R'),
(75,'16046621202003241726','¥149',1,'2019070103312816044254','16046621','2020-03-24 17:26:07','2020-04-27 20:38:38',1,1,0,1,'alipay','E','V'),
(76,'16046621202003241726','¥149',1,'2019070103312816044254','16046621','2020-03-24 17:26:07','2020-04-27 20:38:38',1,1,0,1,'alipay','E','V'),
(77,'16046621202003251751','¥149',1,'2019070103312816044254','16046621','2020-03-25 17:51:12','2020-04-27 20:38:42',1,1,0,1,'alipay','E','V'),
(78,'16046621202003251755','¥149',1,'2019070103312816044254','16046621','2020-03-25 17:55:04','2020-04-27 20:38:27',1,1,0,0,'cashpay','E','R'),
(79,'16046621202003251756','¥100',1,'2019060103344116053524','16046621','2020-03-25 17:56:43','2020-04-27 20:38:24',1,1,0,0,'alipay','E','R'),
(80,'16046621202003251756','¥100',1,'2019060103344116053524','16046621','2020-03-25 17:56:43','2020-04-27 20:38:24',1,1,0,0,'alipay','E','R'),
(81,'16046621202003251756','¥100',1,'2019060103344116053524','16046621','2020-03-25 17:56:43','2020-04-27 20:38:24',1,1,0,0,'alipay','E','R'),
(82,'16046621202003251757','¥200',1,'2019070103320512033531','16046621','2020-03-25 17:57:41','2020-04-27 20:38:13',1,1,0,0,'alipay','E','R'),
(83,'16046621202003251757','¥200',1,'2019070103320512033531','16046621','2020-03-25 17:57:41','2020-04-27 20:38:13',1,1,0,0,'alipay','E','R'),
(84,'16025426202003260937','¥300',3,'2019060103344116053524','16025426','2020-03-26 09:37:17','2020-04-21 22:22:47',1,1,0,1,'cashpay','E','V'),
(85,'16025426202003260943','¥200',2,'2019060103344116053524','16025426','2020-03-26 09:43:14','2020-04-21 22:24:49',1,1,0,1,'alipay','E','V'),
(86,'16025426202003260943','¥200',2,'2019060103344116053524','16025426','2020-03-26 09:43:14','2020-04-21 22:24:49',1,1,0,1,'alipay','E','V'),
(87,'16025426202003281850','¥149',1,'2019070103312816044254','16025426','2020-03-28 18:50:45','2020-03-28 18:50:45',1,1,0,0,'alipay','E','R'),
(88,'16025426202003281850','¥149',1,'2019070103312816044254','16025426','2020-03-28 18:50:45','2020-03-28 18:50:45',1,1,0,0,'alipay','E','R'),
(89,'16025426202004112055','¥5000',1,'2020032417343716046621','16025426','2020-04-11 20:55:05','2020-04-11 20:55:05',1,1,0,0,'alipay','E','R'),
(90,'16025426202004112055','¥5000',1,'2020032417343716046621','16025426','2020-04-11 20:55:05','2020-04-11 20:55:05',1,1,0,0,'alipay','E','R'),
(91,'16025426202004112105','¥500',5,'2019060103344116053524','16025426','2020-04-11 21:05:38','2020-04-11 21:05:38',1,1,0,0,'cashpay','E','R'),
(92,'16025426202004112109','¥200',1,'2019070103320512033531','16025426','2020-04-11 21:09:26','2020-04-11 21:09:26',1,1,0,0,'alipay','E','R'),
(93,'16025426202004112113','¥100',1,'2019060103344116053524','16025426','2020-04-11 21:13:21','2020-04-11 21:13:21',1,1,0,0,'cashpay','E','R'),
(94,'16025426202004112114','¥10',1,'2020031716582916025426','16025426','2020-04-11 21:14:47','2020-04-11 21:14:47',1,1,0,0,'cashpay','E','R'),
(95,'16025426202004112151','¥10',1,'2020031716582916025426','16025426','2020-04-11 21:51:21','2020-04-11 21:51:21',1,1,0,0,'cashpay','E','R'),
(96,'16025426202004112226','¥200',1,'2019070103320512033531','16025426','2020-04-11 22:26:40','2020-04-11 22:26:40',1,1,0,0,'cashpay','E','R'),
(97,'16025426202004121319','¥1000',1,'2020041122263016025426','16025426','2020-04-12 13:19:35','2020-04-12 13:19:35',1,1,0,0,'cashpay','E','R'),
(98,'16025426202004121319','¥1000',1,'2020041122263016025426','16025426','2020-04-12 13:19:35','2020-04-12 13:19:35',1,1,0,0,'cashpay','E','R'),
(99,'16025426202004121319','¥1000',1,'2020041122263016025426','16025426','2020-04-12 13:19:35','2020-04-12 13:19:35',1,1,0,0,'cashpay','E','R'),
(100,'16025426202004131608','¥200',1,'2019070103320512033531','16025426','2020-04-13 16:08:58','2020-04-13 16:08:58',0,0,1,0,NULL,'E','C'),
(101,'16025426202004131608','¥200',1,'2019070103320512033531','16025426','2020-04-13 16:08:58','2020-04-13 16:08:58',0,0,1,0,NULL,'E','C'),
(102,'16025426202004131612','¥149',1,'2019070103312816044254','16025426','2020-04-13 16:12:20','2020-04-13 16:12:20',0,0,1,0,NULL,'E','C'),
(103,'16025426202004131612','¥149',1,'2019070103312816044254','16025426','2020-04-13 16:12:20','2020-04-13 16:12:20',0,0,1,0,NULL,'E','C'),
(104,'16025426202004131637','¥149',1,'2019070103312816044254','16025426','2020-04-13 16:37:15','2020-04-15 21:42:49',1,1,0,0,'alipay','E','R'),
(105,'16025426202004131637','¥149',1,'2019070103312816044254','16025426','2020-04-13 16:37:15','2020-04-15 21:42:49',1,1,0,0,'alipay','E','R'),
(106,'15022364202004131803','¥200',1,'2019070103320512033531','15022364','2020-04-13 18:03:03','2020-04-29 22:51:22',1,1,0,0,'alipay','E','R'),
(107,'16025426202004162119','¥20',2,'2020041416420415022364','16025426','2020-04-16 21:19:06','2020-04-16 22:39:22',1,1,0,0,'alipay','E','R'),
(108,'16025426202004162238','¥149',1,'2019070103312816044254','16025426','2020-04-16 22:38:55','2020-04-16 22:39:27',1,1,0,0,'cashpay','E','R'),
(109,'16025426202004162238','¥149',1,'2019070103312816044254','16025426','2020-04-16 22:38:55','2020-04-16 22:39:27',1,1,0,0,'cashpay','E','R'),
(110,'16025426202004162238','¥149',1,'2019070103312816044254','16025426','2020-04-16 22:38:55','2020-04-16 22:39:27',1,1,0,0,'cashpay','E','R'),
(111,'18047828202004211851','¥50',1,'2020041522375616025426','18047828','2020-04-21 18:51:13','2020-04-21 18:58:57',1,1,0,0,'alipay','E','R'),
(112,'18047828202004211851','¥50',1,'2020041522375616025426','18047828','2020-04-21 18:51:13','2020-04-21 18:58:57',1,1,0,0,'alipay','E','R'),
(113,'18047828202004211851','¥50',1,'2020041522375616025426','18047828','2020-04-21 18:51:13','2020-04-21 18:58:57',1,1,0,0,'alipay','E','R'),
(114,'18047828202004211922','¥3000',1,'2020042020481916046621','18047828','2020-04-21 19:22:02','2020-04-21 19:26:18',1,1,0,0,'alipay','E','R'),
(115,'18047828202004211922','¥3000',1,'2020042020481916046621','18047828','2020-04-21 19:22:02','2020-04-21 19:26:18',1,1,0,0,'alipay','E','R'),
(116,'18047828202004211922','¥3000',1,'2020042020481916046621','18047828','2020-04-21 19:22:02','2020-04-21 19:26:18',1,1,0,0,'alipay','E','R'),
(117,'16025426202004212218','¥3000',1,'2020042020481916046621','16025426','2020-04-21 22:18:57','2020-04-21 22:21:01',1,1,0,0,'cashpay','E','R'),
(118,'16025426202004212218','¥3000',1,'2020042020481916046621','16025426','2020-04-21 22:18:57','2020-04-21 22:21:01',1,1,0,0,'cashpay','E','R'),
(119,'16025426202004272132','¥10',1,'2020041416420415022364','16025426','2020-04-27 21:32:33','2020-04-29 16:05:03',1,1,0,0,'cashpay','E','R'),
(120,'16025426202004272132','¥10',1,'2020041416420415022364','16025426','2020-04-27 21:32:33','2020-04-29 16:05:03',1,1,0,0,'cashpay','E','R');

/*Table structure for table `scheduled_task` */

DROP TABLE IF EXISTS `scheduled_task`;

CREATE TABLE `scheduled_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL COMMENT '定时任务名称',
  `path` varchar(255) DEFAULT NULL COMMENT '定时任务路径',
  `swich` tinyint(1) DEFAULT NULL COMMENT '定时任务开关 0关闭 1启动',
  `frequency` int(255) DEFAULT NULL COMMENT '定时任务执行周期 单位分钟',
  `marks` varchar(255) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `scheduled_task` */

insert  into `scheduled_task`(`id`,`task_name`,`path`,`swich`,`frequency`,`marks`) values 
(1,'unpaidOrder','com.zdh.scheduler.OrderScheduler#cancelOrder',1,30,'检查过期未付订单并自动取消'),
(2,'expiredOrder','com.zdh.scheduler.OrderScheduler#deletableOrder',1,1440,'检查超过4年的订单并标为可删除状态'),
(3,'delOrder','com.zdh.scheduler.OrderScheduler#batchDelOrder',0,1440,'批量删除订单'),
(4,'tokenCheck','com.zdh.scheduler.TokenScheduler#handleExpiredToken',1,720,'检查过期token'),
(5,'emailVerifyCodeCheck','com.zdh.scheduler.VerifyCodeScheduler#checkCodeStatus',1,5,'检查过期邮箱验证码');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(512) DEFAULT NULL COMMENT 'token',
  `user` varchar(255) DEFAULT NULL COMMENT 'token接收方学号',
  `issue_date` datetime DEFAULT NULL COMMENT 'token签发时间',
  `expire_date` datetime DEFAULT NULL COMMENT 'token过期时间',
  `status` varchar(1) DEFAULT NULL COMMENT 'token状态 U可用 E过期 V已验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `token` */

insert  into `token`(`id`,`token`,`user`,`issue_date`,`expire_date`,`status`) values 
(1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NTcwNjQsImlhdCI6MTU4NjUxMzg2NCwic2lkIjoiMTYwMjU0MjYifQ.ActWYs9RhjZRJGTnlrt0BoAWnnellmTFsuxDlCzVyww','16025426','2020-04-10 18:17:46','2020-04-11 06:17:46','E'),
(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NTc0NzAsImlhdCI6MTU4NjUxNDI3MCwic2lkIjoiMTYwMjU0MjYifQ.O2MATPkmDF604nlNcn23swkzuzFFjZN_9-Nm4Y0gd4Y','16025426','2020-04-10 18:24:30','2020-04-11 06:24:30','V'),
(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NTg0NjgsImlhdCI6MTU4NjUxNTI2OCwic2lkIjoiMTYwMjU0MjYifQ.bgImDacBzC_yULaOunsV_FOvgULfCt-TahOyzbAsFMg','16025426','2020-04-10 18:41:09','2020-04-11 06:41:09','V'),
(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjIzNjQsImlhdCI6MTU4NjUxOTE2NCwic2lkIjoiMTYwMjU0MjYifQ.AvgEr7FHZ49_LGoYWrJsDokkNCm3ERO4Gpw4CmrPY1s','16025426','2020-04-10 19:46:05','2020-04-11 07:46:05','V'),
(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjQ1NjIsImlhdCI6MTU4NjUyMTM2Miwic2lkIjoiMTYwMjU0MjYifQ.U1hmldg1ICjitCp27HWmM4V3TMpzyyhs7L8KSeh72ro','16025426','2020-04-10 20:22:43','2020-04-11 08:22:43','V'),
(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjUwNjksImlhdCI6MTU4NjUyMTg2OSwic2lkIjoiMTYwMjU0MjYifQ.42zXRxg7L1vJWDgWr-d0p0IXT5STez_3rHr5_QlfPqc','16025426','2020-04-10 20:31:10','2020-04-11 08:31:10','V'),
(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjUyMDcsImlhdCI6MTU4NjUyMjAwNywic2lkIjoiMTYwMjU0MjYifQ.ItMg0vjYIkaB_c_iaNFujm8gQ2Sz9UJGPS-Ju0YZWDs','16025426','2020-04-10 20:33:28','2020-04-11 08:33:28','V'),
(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjY0NjAsImlhdCI6MTU4NjUyMzI2MCwic2lkIjoiMTYwMjU0MjYifQ.JsyMk1LKw5dWrOYEJSuJbuKoYFEf7xEGRDHB8uneEBo','16025426','2020-04-10 20:54:21','2020-04-11 08:54:21','V'),
(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjY5NjQsImlhdCI6MTU4NjUyMzc2NCwic2lkIjoiMTYwMjU0MjYifQ.6JTE6dFh8Ep80ruD5qAOfLiQyAlfpxCUBZlVdo5w5Aw','16025426','2020-04-10 21:02:45','2020-04-11 09:02:45','V'),
(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1NjcxMzIsImlhdCI6MTU4NjUyMzkzMiwic2lkIjoiMTYwMjU0MjYifQ.JlTMzZFYfGwcHgeCf4dUC3XR4rOacgEzd2PoUuZ5VBQ','16025426','2020-04-10 21:05:32','2020-04-11 09:05:32','V'),
(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1Njc0NTAsImlhdCI6MTU4NjUyNDI1MCwic2lkIjoiMTYwMjU0MjYifQ.cYWqh0cDx6GbH_TcM3Z3Zk4sTiAItINevMDV61cuGiE','16025426','2020-04-10 21:10:51','2020-04-11 09:10:51','V'),
(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIUkJfU0VDT05EX0hBTkRfUExBVEZPUk0iLCJleHAiOjE1ODY1Njc3MjMsImlhdCI6MTU4NjUyNDUyMywic2lkIjoiMTYwMjU0MjYifQ.ZpxNP9V7IPQEGRiTdiLW_1GmZzYNndj9nWBk2EsAVVw','16025426','2020-04-10 21:15:24','2020-04-11 09:15:24','V');

/*Table structure for table `verify_code` */

DROP TABLE IF EXISTS `verify_code`;

CREATE TABLE `verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user` varchar(255) NOT NULL COMMENT '申请验证码的用户学号',
  `verify_code` varchar(255) NOT NULL COMMENT '验证码',
  `create_time` datetime NOT NULL COMMENT '验证码申请时间',
  `expire_time` datetime NOT NULL COMMENT '验证码过期时间',
  `state` varchar(1) DEFAULT NULL COMMENT '验证码状态 U可用 E过期 V已验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `verify_code` */

insert  into `verify_code`(`id`,`user`,`verify_code`,`create_time`,`expire_time`,`state`) values 
(1,'16025426','lfswP3','2020-04-09 20:42:32','2020-04-09 20:47:32','V'),
(2,'16025426','5A38LY','2020-04-09 22:16:46','2020-04-09 22:21:46','V'),
(3,'16025426','0Lxq8c','2020-04-09 22:18:52','2020-04-09 22:23:52','V'),
(4,'16025426','TKQq4a','2020-04-09 22:21:24','2020-04-09 22:26:24','V'),
(5,'16025426','uMjPwz','2020-04-09 22:22:34','2020-04-09 22:27:34','V'),
(6,'16025426','crQWlG','2020-04-09 22:26:57','2020-04-09 22:31:57','V'),
(7,'16025426','gFH5sp','2020-04-09 22:29:21','2020-04-09 22:34:21','V'),
(8,'16025426','V6m2Py','2020-04-09 22:31:11','2020-04-09 22:36:11','V'),
(9,'16025426','WfUOuU','2020-04-09 22:34:25','2020-04-09 22:39:25','V'),
(10,'16025426','mb8p2E','2020-04-10 18:17:16','2020-04-10 18:22:16','V'),
(11,'16025426','DKeINP','2020-04-10 18:24:15','2020-04-10 18:29:15','V'),
(12,'16025426','0wSPU0','2020-04-10 18:35:49','2020-04-10 18:40:49','V'),
(13,'16025426','A408oF','2020-04-10 19:45:49','2020-04-10 19:50:49','V'),
(14,'16025426','TIUPpF','2020-04-10 20:16:46','2020-04-10 20:21:46','E'),
(15,'16025426','tKCdNU','2020-04-10 20:19:56','2020-04-10 20:24:56','E'),
(16,'16025426','6M9gXG','2020-04-10 20:20:03','2020-04-10 20:25:03','E'),
(17,'16025426','IqywHN','2020-04-10 20:20:29','2020-04-10 20:25:29','E'),
(18,'16025426','xqXABL','2020-04-10 20:21:54','2020-04-10 20:26:54','V'),
(19,'16025426','Umg2V6','2020-04-10 20:24:51','2020-04-10 20:29:51','V'),
(20,'16025426','xVbVIz','2020-04-10 20:25:43','2020-04-10 20:30:43','V'),
(21,'16025426','HmnqRc','2020-04-10 20:27:29','2020-04-10 20:32:29','V'),
(22,'16025426','6NsiIA','2020-04-10 20:30:19','2020-04-10 20:35:19','V'),
(23,'16025426','s5jwa7','2020-04-10 20:33:15','2020-04-10 20:38:15','V'),
(24,'16025426','aLf3kU','2020-04-10 20:53:43','2020-04-10 20:58:43','V'),
(25,'16025426','3ASo9c','2020-04-10 21:02:26','2020-04-10 21:07:26','V'),
(26,'16025426','QnA6xR','2020-04-10 21:03:52','2020-04-10 21:08:52','V'),
(27,'16025426','AhludJ','2020-04-10 21:10:29','2020-04-10 21:15:29','V'),
(28,'16025426','LAkroB','2020-04-10 21:15:06','2020-04-10 21:20:06','V');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
