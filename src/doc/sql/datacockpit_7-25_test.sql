/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - datacockpit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`datacockpit` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `datacockpit`;

/*Table structure for table `companyinfo` */

DROP TABLE IF EXISTS `companyinfo`;

CREATE TABLE `companyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corpName` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态    禁：0,不禁1',
  `approval` int(11) DEFAULT NULL COMMENT '审批状态  拒：0，过：1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `companyinfo` */

insert  into `companyinfo`(`id`,`corpName`,`phone`,`name`,`job`,`password`,`email`,`state`,`approval`) values (2,'aaa','aaa','aaa','aaa','aaa','zzz@qq.com',1,1),(4,'123456','123456','123456','123456','123456','admin@qq.cim',1,1),(5,'asdjlkas','asdasd','asdj','asdjka','228152909ba4c3e3fd42988dad1c6fea','sadas@qq.com',1,1),(8,'zx','czx','cxzc','zx',NULL,NULL,1,1),(23,'123456789','1223456789','123456789','123456789','123456789','admin@qq.com',1,1),(25,'的记录口水鸡打开撒娇','上当了空间爱上了大神','熟练度空间as拉到筋AAS','爱神的箭老师都as','700f86c86dbb8294ddef03d5c877f0e1','sddaskjd@qq.com',1,1);

/*Table structure for table `datarelation` */

DROP TABLE IF EXISTS `datarelation`;

CREATE TABLE `datarelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '企业ID',
  `tid1` int(11) DEFAULT NULL,
  `tid2` int(11) DEFAULT NULL,
  `col1` int(11) DEFAULT NULL,
  `col2` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '关联关系状态 禁：0,不禁1',
  PRIMARY KEY (`id`),
  KEY `datarelation_ibfk_1` (`tid1`),
  KEY `datarelation_ibfk_2` (`tid2`),
  CONSTRAINT `datarelation_ibfk_1` FOREIGN KEY (`tid1`) REFERENCES `tableinfo` (`id`),
  CONSTRAINT `datarelation_ibfk_2` FOREIGN KEY (`tid2`) REFERENCES `tableinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `datarelation` */

/*Table structure for table `inform` */

DROP TABLE IF EXISTS `inform`;

CREATE TABLE `inform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `inform` */

insert  into `inform`(`id`,`title`,`publishDate`,`details`,`publisher`) values (1,'我好事达撒开了多久as',NULL,'水电费的身份水电费的身份但是是发','第三方第三方的身份'),(5,'的思考了房间的时刻房顶上可令肌肤',NULL,'啥年代了扩三的卡萨打开按时打卡哈萨克的按时打卡发时了肯德基奥克兰的骄傲刻录机；但是看了发健康了电视剧付款了电视剧；分类','多少级分类看电视剧分类看电视积分了看电视剧分类可视对讲分类'),(6,'代发货的首付款范德萨范德萨',NULL,'的水库附近合适的房间号实地发挥的飞碟说回复对方','客户第三节课返回讲的是房间看电视尽快发货'),(7,'你好',NULL,'撒大声地','是机读卡是就');

/*Table structure for table `powerassets` */

DROP TABLE IF EXISTS `powerassets`;

CREATE TABLE `powerassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `percode` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `powerassets` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `rolepowerrelationship` */

DROP TABLE IF EXISTS `rolepowerrelationship`;

CREATE TABLE `rolepowerrelationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `pid` int(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rolepowerrelationship` */

/*Table structure for table `tablecolumninfo` */

DROP TABLE IF EXISTS `tablecolumninfo`;

CREATE TABLE `tablecolumninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `columnName` varchar(50) DEFAULT NULL,
  `colunmType` varchar(50) DEFAULT NULL,
  `physicalColumnName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  CONSTRAINT `tablecolumninfo_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tableinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tablecolumninfo` */

/*Table structure for table `tableinfo` */

DROP TABLE IF EXISTS `tableinfo`;

CREATE TABLE `tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  `physicalTableName` varchar(200) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '企业ID',
  `state` int(11) DEFAULT NULL COMMENT '0禁用，1启用',
  `showtype` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tableinfo` */

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '1' COMMENT '状态    禁：0,不禁1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`name`,`job`,`password`,`phone`,`email`,`state`) values (8,'admin','admin','f35c264bd5e4ce61ebb81e16be39a021','admin','admin@qq.com',1),(13,'sdsa','dsad','sadsadsa','dsad',NULL,1),(14,'asd','dsad','sasadas','d',NULL,1),(15,'ds','adsa',NULL,'vff','asdas@qq.com',NULL),(17,'asdsd','sad',NULL,NULL,NULL,1),(18,'dsadsa','as',NULL,NULL,NULL,1),(19,'sadsadsa','dsa','d','asd','as',1),(20,NULL,NULL,NULL,NULL,'adsad',1),(21,NULL,NULL,NULL,'ad',NULL,1),(22,NULL,NULL,'dsa',NULL,NULL,1),(23,NULL,NULL,NULL,'as','sad',1),(24,NULL,NULL,NULL,'sadas',NULL,1),(25,NULL,NULL,'dsadsa',NULL,NULL,1),(26,NULL,NULL,NULL,'asdasd',NULL,1),(27,'13410102345','asdas','48e1a118a99e59fb09254e42a0335bc8','13410102345',NULL,1),(28,'sad',NULL,NULL,NULL,NULL,1),(29,NULL,NULL,NULL,NULL,'sadsadsadas',1),(30,NULL,NULL,NULL,NULL,'dasdasdsad',1),(31,NULL,NULL,NULL,NULL,'dasd',1),(32,NULL,NULL,NULL,'dasdas',NULL,1),(33,NULL,NULL,NULL,NULL,'dsad',1),(36,'打死你啊','撒大家好撒娇','207616316da19a302190ee6aceae2d04','23456781','sadkjasklj@qq.com',NULL);

/*Table structure for table `userrolerelationship` */

DROP TABLE IF EXISTS `userrolerelationship`;

CREATE TABLE `userrolerelationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userrolerelationship` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
