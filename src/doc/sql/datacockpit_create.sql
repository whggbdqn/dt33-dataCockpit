
CREATE DATABASE `datacockpit` ;

USE `datacockpit`;

DROP TABLE IF EXISTS `companyinfo`;
  #企业表
CREATE TABLE `companyinfo` (
  #企业编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #企业名称
  `corpName` VARCHAR(50) DEFAULT NULL,
  #企业电话
  `phone` VARCHAR(50) DEFAULT NULL,
  #姓名
  `name` VARCHAR(50)    DEFAULT NULL,
  #职务
  `job` VARCHAR(50)     DEFAULT NULL,
  #密码
  `password` VARCHAR(50) DEFAULT NULL,
  #邮箱
  `email` VARCHAR(50) DEFAULT NULL,
  #状态
  `state` INT(11) DEFAULT NULL COMMENT '状态    禁：0,不禁1',
  #审批状态
  `approval` INT(11) DEFAULT NULL COMMENT '审批状态  拒：0，过：1',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `inform`;
#通知信息表
CREATE TABLE `inform` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #标题
  `title` VARCHAR(200) DEFAULT NULL,
  #发布日期
  `publishDate` DATETIME DEFAULT NULL,
  #详情
  `details` VARCHAR(1000) DEFAULT NULL,
  #发布人
  `publisher` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `inform` */

/*Table structure for table `powerassets` */

DROP TABLE IF EXISTS `powerassets`;
#权限资源表
CREATE TABLE `powerassets` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #权限名
  `name` VARCHAR(50) DEFAULT NULL,
  #资源类型
  `type` VARCHAR(50) DEFAULT NULL,
  #权限代码
  `percode` VARCHAR(50) DEFAULT NULL,
  #目标地址
  `url` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `powerassets` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

#角色表
CREATE TABLE `role` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #角色名
  `name` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `rolepowerrelationship` */

DROP TABLE IF EXISTS `rolepowerrelationship`;

#角色权限表
CREATE TABLE `rolepowerrelationship` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #角色编号
  `rid` INT(11) DEFAULT NULL COMMENT '角色ID',
  #权限编号
  `pid` INT(11) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `rolepowerrelationship` */

/*Table structure for table `tablecolumninfo` */

DROP TABLE IF EXISTS `tablecolumninfo`;

#表列名表
CREATE TABLE `tablecolumninfo` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #表id
  `tid` INT(11) DEFAULT NULL,
  #列名
  `columnName` VARCHAR(50) DEFAULT NULL,
  #列数据类型
  `columnType` VARCHAR(50) DEFAULT NULL,
 
  #物理列名
  `physicalColumnName` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


/*Data for the table `tablecolumninfo` */

/*Table structure for table `tableinfo` */

DROP TABLE IF EXISTS `tableinfo`;

CREATE TABLE `tableinfo` (
  #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  #表名
  `name` VARCHAR(100) DEFAULT NULL,
  #上传时间
  `updateTime` DATETIME DEFAULT NULL,
  #物理表名
  `physicalTableName` VARCHAR(200) DEFAULT NULL,
  #企业编号
  `cid` INT(11) DEFAULT NULL COMMENT '企业ID',
  #表使用状态
  `state` INT(11) DEFAULT NULL COMMENT '0禁用，1启用',
   #数值列显示方式
  `showtype` VARCHAR(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
#添加cid外键关联到企业表
ALTER TABLE `datacockpit`.`tableinfo`  ADD FOREIGN KEY (`cid`) REFERENCES `datacockpit`.`companyinfo`(`id`); 
/*Data for the table `tableinfo` */
#添加tid外键关联tableinfo表
ALTER TABLE `datacockpit`.`tablecolumninfo` ADD FOREIGN KEY (`tid`) REFERENCES `datacockpit`.`tableinfo`(`id`); 

DROP TABLE IF EXISTS `datarelation`;

#数据关系表
CREATE TABLE `datarelation` (
   #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
   #名称
  `name` VARCHAR(100) DEFAULT NULL,
   #企业编号
  `cid` INT(11) DEFAULT NULL COMMENT '企业ID',
   #表信息表编号
  `tid1` INT(11) DEFAULT NULL,
   #表信息表编号
  `tid2` INT(11) DEFAULT NULL,
   #表列信息表列名
  `col1` INT(11) DEFAULT NULL,
   #表列信息表列名
  `col2` INT(11) DEFAULT NULL,
   #状态
  `state` INT(11) DEFAULT NULL COMMENT '关联关系状态 禁：0,不禁1',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
#添加tid1外键关联tableinfo
ALTER TABLE `datacockpit`.`datarelation` ADD CONSTRAINT `datarelation_ibfk_1` FOREIGN KEY (`tid1`) REFERENCES `datacockpit`.`tableinfo`(`id`);
#添加tid2外键关联tableinfo
ALTER TABLE `datacockpit`.`datarelation` ADD CONSTRAINT `datarelation_ibfk_2` FOREIGN KEY (`tid2`) REFERENCES `datacockpit`.`tableinfo`(`id`); 

#添加col1外键关联tablecolumninfo
ALTER TABLE `datacockpit`.`datarelation` ADD CONSTRAINT `datarelation_col_1` FOREIGN KEY (`col1`) REFERENCES `datacockpit`.`tablecolumninfo`(`id`);
#添加col2外键关联tablecolumninfo
ALTER TABLE `datacockpit`.`datarelation` ADD CONSTRAINT `datarelation_col_2` FOREIGN KEY (`col2`) REFERENCES `datacockpit`.`tablecolumninfo`(`id`); 

#添加cid外键关联companyinfo
ALTER TABLE `datacockpit`.`datarelation` ADD CONSTRAINT `datarelation_com_1` FOREIGN KEY (`cid`) REFERENCES `datacockpit`.`companyinfo`(`id`); 


/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

#用户表（管理员表）
CREATE TABLE `userinfo` (
   #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
   #姓名
  `name` VARCHAR(50)     DEFAULT NULL,
   #职务
  `job` VARCHAR(50)     DEFAULT NULL,
   #密码
  `password` VARCHAR(50)   DEFAULT NULL,
   #电话（账号）
  `phone` VARCHAR(50)   DEFAULT NULL,
   #邮箱
  `email` VARCHAR(50)     DEFAULT NULL,
   #使用状态
  `state` INT(11) DEFAULT NULL COMMENT '状态    禁：0,不禁1',
  
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `userrolerelationship`;

#用户角色
CREATE TABLE `userrolerelationship` (
   #编号
  `id` INT(11) NOT NULL AUTO_INCREMENT,
   #角色编号
  `rid` INT(11) DEFAULT NULL COMMENT '角色ID',
   #用户编号
  `uid` INT(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
#分析任务表
CREATE TABLE `analysistasks` (
    #编号
  `id` int(11) not null auto_increment,
   #开始时间
  `starttime` datetime default null,
   #结束时间
  `endtime` date default null,
   #企业编号
  `cid` int(11) default null comment '企业编号',
   #关联关系编号
   `did` int(11) default null comment '关联关系编号',
   #任务状态 
  `taskstatus` int(11) default null comment '已添加:0,进行中:1，完成:2,失败:-1' ,
   #规则
   `rule` varchar(50)  default null,
   #反馈
   `feedback` varchar(1000)  default null,  
   #算法编号
   `arithmeticid` int(11) default null comment '算法ID', 
  PRIMARY KEY (`id`),
  KEY `did` (`did`),
  CONSTRAINT `analysistasks_ibfk_1` FOREIGN KEY (`did`) REFERENCES `datarelation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
