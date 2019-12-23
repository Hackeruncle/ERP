-- MySQL dump 10.13  Distrib 5.6.23, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: ruozedata_erp
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ruozedata_account`
--

DROP TABLE IF EXISTS `ruozedata_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_account` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `SerialNo` varchar(50) DEFAULT NULL COMMENT '编号',
  `InitialAmount` decimal(24,6) DEFAULT NULL COMMENT '期初金额',
  `CurrentAmount` decimal(24,6) DEFAULT NULL COMMENT '当前余额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `IsDefault` bit(1) DEFAULT NULL COMMENT '是否默认',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='账户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_account`
--

LOCK TABLES `ruozedata_account` WRITE;
/*!40000 ALTER TABLE `ruozedata_account` DISABLE KEYS */;
INSERT INTO `ruozedata_account` VALUES (19,'供应商1结算账户','0001',0.000000,NULL,'','\0',1,'0'),(20,'客户1结算账户','0002',0.000000,NULL,'','\0',1,'0'),(21,'零售结算账户','0003',0.000000,NULL,'','\0',1,'0'),(22,'供应商2结算账户','0004',0.000000,NULL,'','\0',1,'0'),(23,'客户2结算账户','0005',0.000000,NULL,'','\0',1,'0');
/*!40000 ALTER TABLE `ruozedata_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_accounthead`
--

DROP TABLE IF EXISTS `ruozedata_accounthead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_accounthead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '单位Id(收款/付款单位)',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '经手人Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户(收款/付款)',
  `BillNo` varchar(50) DEFAULT NULL COMMENT '单据编号',
  `BillTime` datetime DEFAULT NULL COMMENT '单据日期',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK9F4C0D8DB610FC06` (`OrganId`),
  KEY `FK9F4C0D8DAAE50527` (`AccountId`),
  KEY `FK9F4C0D8DC4170B37` (`HandsPersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='财务主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_accounthead`
--

LOCK TABLES `ruozedata_accounthead` WRITE;
/*!40000 ALTER TABLE `ruozedata_accounthead` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_accounthead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_accountitem`
--

DROP TABLE IF EXISTS `ruozedata_accountitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_accountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `InOutItemId` bigint(20) DEFAULT NULL COMMENT '收支项目Id',
  `EachAmount` decimal(24,6) DEFAULT NULL COMMENT '单项金额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '单据备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK9F4CBAC0AAE50527` (`AccountId`),
  KEY `FK9F4CBAC0C5FE6007` (`HeaderId`),
  KEY `FK9F4CBAC0D203EDC5` (`InOutItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='财务子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_accountitem`
--

LOCK TABLES `ruozedata_accountitem` WRITE;
/*!40000 ALTER TABLE `ruozedata_accountitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_accountitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_depot`
--

DROP TABLE IF EXISTS `ruozedata_depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '仓库名称',
  `address` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `warehousing` decimal(24,6) DEFAULT NULL COMMENT '仓储费',
  `truckage` decimal(24,6) DEFAULT NULL COMMENT '搬运费',
  `type` int(10) DEFAULT NULL COMMENT '类型',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  `principal` bigint(20) DEFAULT NULL COMMENT '负责人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_depot`
--

LOCK TABLES `ruozedata_depot` WRITE;
/*!40000 ALTER TABLE `ruozedata_depot` DISABLE KEYS */;
INSERT INTO `ruozedata_depot` VALUES (16,'上海仓库01','上海浦东',5.000000,NULL,0,'','',NULL,1,'0',NULL,'2019-12-22 11:15:15'),(17,'上海仓库02','上海奉贤',3.000000,NULL,0,'','',NULL,1,'0',NULL,'2019-12-22 11:15:15'),(18,'北京仓库01','北京西二旗',8.000000,NULL,0,'','',NULL,1,'0',NULL,'2019-12-22 11:15:15'),(19,'广州仓库01','广州xxx',4.000000,NULL,0,'','',120,1,'0',NULL,'2019-12-22 13:30:47');
/*!40000 ALTER TABLE `ruozedata_depot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_depothead`
--

DROP TABLE IF EXISTS `ruozedata_depothead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_depothead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(出库/入库)',
  `SubType` varchar(50) DEFAULT NULL COMMENT '出入库分类',
  `ProjectId` bigint(20) DEFAULT NULL COMMENT '项目Id',
  `DefaultNumber` varchar(50) DEFAULT NULL COMMENT '初始票据号',
  `Number` varchar(50) DEFAULT NULL COMMENT '票据号',
  `OperPersonName` varchar(50) DEFAULT NULL COMMENT '操作员名字',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `OperTime` datetime DEFAULT NULL COMMENT '出入库时间',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '供应商Id',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '采购/领料-经手人Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(收款/付款)',
  `AllocationProjectId` bigint(20) DEFAULT NULL COMMENT '调拨时，对方项目Id',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `PayType` varchar(50) DEFAULT NULL COMMENT '付款类型(现金、记账等)',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `Salesman` varchar(50) DEFAULT NULL COMMENT '业务员（可以多个）',
  `AccountIdList` varchar(50) DEFAULT NULL COMMENT '多账户ID列表',
  `AccountMoneyList` varchar(200) DEFAULT '' COMMENT '多账户金额列表',
  `Discount` decimal(24,6) DEFAULT NULL COMMENT '优惠率',
  `DiscountMoney` decimal(24,6) DEFAULT NULL COMMENT '优惠金额',
  `DiscountLastMoney` decimal(24,6) DEFAULT NULL COMMENT '优惠后金额',
  `OtherMoney` decimal(24,6) DEFAULT NULL COMMENT '销售或采购费用合计',
  `OtherMoneyList` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目Id数组（包括快递、招待等）',
  `OtherMoneyItem` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目（包括快递、招待等）',
  `AccountDay` int(10) DEFAULT NULL COMMENT '结算天数',
  `Status` varchar(1) DEFAULT '0' COMMENT '状态，0未审核、1已审核、2已转采购|销售',
  `LinkNumber` varchar(50) DEFAULT NULL COMMENT '关联订单号',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK2A80F214CA633ABA` (`AllocationProjectId`),
  KEY `FK2A80F214C4170B37` (`HandsPersonId`),
  KEY `FK2A80F214B610FC06` (`OrganId`),
  KEY `FK2A80F2142888F9A` (`ProjectId`),
  KEY `FK2A80F214AAE50527` (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COMMENT='单据主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_depothead`
--

LOCK TABLES `ruozedata_depothead` WRITE;
/*!40000 ALTER TABLE `ruozedata_depothead` DISABLE KEYS */;
INSERT INTO `ruozedata_depothead` VALUES (209,'其它','采购订单',NULL,'CGDD00000000345','CGDD00000000345','若泽数据@J哥','2019-12-22 19:17:50','2019-12-22 19:17:38',74,120,NULL,0.000000,NULL,-4800.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','',1,'0','2019-12-22 11:18:17'),(210,'入库','采购',NULL,'CGRK00000000346','CGRK00000000346','若泽数据@J哥','2019-12-22 19:18:26','2019-12-22 19:18:18',74,120,19,-4560.000000,NULL,-4800.000000,'现付','','',NULL,'',5.000000,240.000000,4560.000000,NULL,NULL,NULL,NULL,'0','CGDD00000000345',1,'0','2019-12-22 11:18:16'),(211,'入库','其它',NULL,'QTRK00000000347','QTRK00000000347','若泽数据@J哥','2019-12-22 19:22:13','2019-12-22 19:21:58',74,120,NULL,0.000000,NULL,26640.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 11:22:02'),(212,'其它','销售订单',NULL,'XSDD00000000348','XSDD00000000348','若泽数据@J哥','2019-12-22 19:28:20','2019-12-22 19:28:01',75,120,NULL,0.000000,NULL,71928.000000,'现付','','<14>',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','',1,'0','2019-12-22 11:29:34'),(216,'出库','销售',NULL,'XSCK00000000350','XSCK00000000350','若泽数据@J哥','2019-12-22 19:29:44','2019-12-22 19:29:29',75,120,20,6480.000000,NULL,6480.000000,'现付','','<14>',NULL,'',0.000000,0.000000,6480.000000,NULL,NULL,NULL,NULL,'0','XSDD00000000348',1,'0','2019-12-22 11:29:33'),(218,'出库','其它',NULL,'QTCK00000000353','QTCK00000000353','若泽数据@J哥','2019-12-22 19:32:02','2019-12-22 19:31:33',75,120,NULL,0.000000,NULL,144.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 11:31:51'),(220,'出库','零售',NULL,'LSCK00000000357','LSCK00000000357','若泽数据@J哥','2019-12-22 19:38:35','2019-12-22 19:38:14',76,120,21,576.000000,NULL,576.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 11:38:25'),(221,'入库','零售退货',NULL,'LSTH00000000359','LSTH00000000359','若泽数据@J哥','2019-12-22 19:41:04','2019-12-22 19:40:47',76,120,21,-360.000000,NULL,-360.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 11:40:53'),(222,'其它','采购订单',NULL,'CGDD00000000365','CGDD00000000365','若泽数据@J哥','2019-12-22 21:42:13','2019-12-22 21:42:58',77,120,NULL,0.000000,NULL,-103500.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','',1,'0','2019-12-22 13:48:10'),(223,'入库','采购',NULL,'CGRK00000000367','CGRK00000000367','若泽数据@J哥','2019-12-22 21:48:20','2019-12-22 21:45:07',77,120,22,-98325.000000,NULL,-103500.000000,'现付','','',NULL,'',5.000000,5175.000000,98325.000000,NULL,NULL,NULL,NULL,'0','CGDD00000000365',1,'0','2019-12-22 13:48:09'),(224,'入库','其它',NULL,'QTRK00000000369','QTRK00000000369','若泽数据@J哥','2019-12-22 22:01:35','2019-12-22 22:00:13',77,120,NULL,0.000000,NULL,26640.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 14:01:25'),(225,'其它','销售订单',NULL,'XSDD00000000373','XSDD00000000373','若泽数据@J哥','2019-12-22 22:03:42','2019-12-22 22:05:36',78,120,NULL,0.000000,NULL,11000.000000,'现付','','<14>',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','',1,'0','2019-12-22 14:11:03'),(227,'出库','销售',NULL,'XSCK00000000375','XSCK00000000375','若泽数据@J哥','2019-12-22 22:11:13','2019-12-22 22:08:01',78,120,23,159516.500000,NULL,164450.000000,'现付','','<14>',NULL,'',3.000000,4933.500000,159516.500000,NULL,NULL,NULL,NULL,'0','XSDD00000000373',1,'0','2019-12-22 14:11:03'),(228,'出库','其它',NULL,'QTCK00000000376','QTCK00000000376','若泽数据@J哥','2019-12-22 22:14:14','2019-12-22 22:13:08',78,120,NULL,0.000000,NULL,220.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 14:14:03'),(230,'出库','零售',NULL,'LSCK00000000377','LSCK00000000377','若泽数据@J哥','2019-12-22 22:16:21','2019-12-22 22:13:52',79,120,21,480.000000,NULL,480.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 14:16:11'),(231,'入库','零售退货',NULL,'LSTH00000000378','LSTH00000000378','若泽数据@J哥','2019-12-22 22:17:10','2019-12-22 22:15:48',79,120,21,-320.000000,NULL,-320.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','',1,'0','2019-12-22 14:17:00'),(232,'其它','采购订单',NULL,'CGDD00000000379','CGDD00000000379','若泽数据@J哥','2019-12-23 11:17:43','2019-12-23 11:17:40',74,120,NULL,0.000000,NULL,-80000.000000,'现付','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','',1,'0','2019-12-23 03:18:07'),(233,'入库','采购',NULL,'CGRK00000000380','CGRK00000000380','若泽数据@J哥','2019-12-23 11:18:08','2019-12-23 11:18:07',74,120,19,-76800.000000,NULL,-80000.000000,'现付','','',NULL,'',4.000000,3200.000000,76800.000000,NULL,NULL,NULL,NULL,'0','CGDD00000000379',1,'0','2019-12-23 03:18:07');
/*!40000 ALTER TABLE `ruozedata_depothead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_depotitem`
--

DROP TABLE IF EXISTS `ruozedata_depotitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_depotitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `MaterialId` bigint(20) NOT NULL COMMENT '材料Id',
  `MUnit` varchar(20) DEFAULT NULL COMMENT '商品计量单位',
  `OperNumber` decimal(24,6) DEFAULT NULL COMMENT '数量',
  `BasicNumber` decimal(24,6) DEFAULT NULL COMMENT '基础数量，如kg、瓶',
  `UnitPrice` decimal(24,6) DEFAULT NULL COMMENT '单价',
  `TaxUnitPrice` decimal(24,6) DEFAULT NULL COMMENT '含税单价',
  `AllPrice` decimal(24,6) DEFAULT NULL COMMENT '金额',
  `Remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `Img` varchar(50) DEFAULT NULL COMMENT '图片',
  `Incidentals` decimal(24,6) DEFAULT NULL COMMENT '运杂费',
  `DepotId` bigint(20) DEFAULT NULL COMMENT '仓库ID（库存是统计出来的）',
  `AnotherDepotId` bigint(20) DEFAULT NULL COMMENT '调拨时，对方仓库Id',
  `TaxRate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `TaxMoney` decimal(24,6) DEFAULT NULL COMMENT '税额',
  `TaxLastMoney` decimal(24,6) DEFAULT NULL COMMENT '价税合计',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT '自定义字段1-品名',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT '自定义字段2-型号',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT '自定义字段3-制造商',
  `OtherField4` varchar(50) DEFAULT NULL COMMENT '自定义字段4',
  `OtherField5` varchar(50) DEFAULT NULL COMMENT '自定义字段5',
  `MType` varchar(20) DEFAULT NULL COMMENT '商品类型',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK2A819F475D61CCF7` (`MaterialId`),
  KEY `FK2A819F474BB6190E` (`HeaderId`),
  KEY `FK2A819F479485B3F5` (`DepotId`),
  KEY `FK2A819F47729F5392` (`AnotherDepotId`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='单据子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_depotitem`
--

LOCK TABLES `ruozedata_depotitem` WRITE;
/*!40000 ALTER TABLE `ruozedata_depotitem` DISABLE KEYS */;
INSERT INTO `ruozedata_depotitem` VALUES (223,209,588,'袋',100.000000,100.000000,48.000000,48.000000,4800.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,4800.000000,'','','','','','',1,'0','2019-12-22 11:17:40'),(224,210,588,'袋',100.000000,100.000000,48.000000,48.000000,4800.000000,'来自订单',NULL,NULL,16,NULL,0.000000,0.000000,4800.000000,'','','','','','',1,'0','2019-12-22 11:18:16'),(225,211,588,'袋',555.000000,555.000000,48.000000,48.000000,26640.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,26640.000000,'','','','','','',1,'0','2019-12-22 11:22:03'),(226,212,588,'袋',999.000000,999.000000,72.000000,72.000000,71928.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,71928.000000,'','','','','','',1,'0','2019-12-22 11:28:09'),(227,216,588,'袋',90.000000,90.000000,72.000000,72.000000,6480.000000,'来自订单',NULL,NULL,16,NULL,0.000000,0.000000,6480.000000,'','','','','','',1,'0','2019-12-22 11:29:34'),(228,218,588,'袋',2.000000,2.000000,72.000000,72.000000,144.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,144.000000,'','','','','','',1,'0','2019-12-22 11:31:52'),(229,220,588,'袋',8.000000,8.000000,72.000000,72.000000,576.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,576.000000,'','','','','','',1,'0','2019-12-22 11:38:25'),(230,221,588,'袋',5.000000,5.000000,72.000000,74.160000,360.000000,'',NULL,NULL,16,NULL,3.000000,10.800000,370.800000,'','','','','','',1,'0','2019-12-22 11:40:53'),(231,222,589,'只',300.000000,300.000000,30.000000,30.000000,9000.000000,'',NULL,NULL,19,NULL,0.000000,0.000000,9000.000000,'','','','','','',1,'0','2019-12-22 13:42:03'),(232,222,589,'只',150.000000,150.000000,30.000000,30.000000,4500.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,4500.000000,'','','','','','',1,'0','2019-12-22 13:42:03'),(233,222,589,'只',3000.000000,3000.000000,30.000000,30.000000,90000.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,90000.000000,'','','','','','',1,'0','2019-12-22 13:42:48'),(234,223,589,'只',300.000000,300.000000,30.000000,30.000000,9000.000000,'来自订单',NULL,NULL,19,NULL,0.000000,0.000000,9000.000000,'','','','','','',1,'0','2019-12-22 13:48:10'),(235,223,589,'只',150.000000,150.000000,30.000000,30.000000,4500.000000,'来自订单',NULL,NULL,16,NULL,0.000000,0.000000,4500.000000,'','','','','','',1,'0','2019-12-22 13:48:10'),(236,223,589,'只',3000.000000,3000.000000,30.000000,30.000000,90000.000000,'来自订单',NULL,NULL,18,NULL,0.000000,0.000000,90000.000000,'','','','','','',1,'0','2019-12-22 13:48:10'),(237,224,589,'只',888.000000,888.000000,30.000000,30.000000,26640.000000,'',NULL,NULL,16,NULL,0.000000,0.000000,26640.000000,'','','','','','',1,'0','2019-12-22 14:01:25'),(238,225,589,'只',200.000000,200.000000,55.000000,55.000000,11000.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,11000.000000,'','','','','','',1,'0','2019-12-22 14:05:13'),(239,227,589,'只',2990.000000,2990.000000,55.000000,55.000000,164450.000000,'来自订单',NULL,NULL,18,NULL,0.000000,0.000000,164450.000000,'','','','','','',1,'0','2019-12-22 14:11:03'),(240,228,589,'只',4.000000,4.000000,55.000000,55.000000,220.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,220.000000,'','','','','','',1,'0','2019-12-22 14:14:04'),(241,230,589,'只',6.000000,6.000000,80.000000,80.000000,480.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,480.000000,'','','','','','',1,'0','2019-12-22 14:16:11'),(242,231,589,'只',4.000000,4.000000,80.000000,80.000000,320.000000,'',NULL,NULL,18,NULL,0.000000,0.000000,320.000000,'','','','','','',1,'0','2019-12-22 14:17:00'),(243,232,587,'kg',1000.000000,1000.000000,80.000000,80.000000,80000.000000,'',NULL,NULL,17,NULL,0.000000,0.000000,80000.000000,'','','','','','',1,'0','2019-12-23 03:17:43'),(244,233,587,'kg',1000.000000,1000.000000,80.000000,80.000000,80000.000000,'来自订单',NULL,NULL,17,NULL,0.000000,0.000000,80000.000000,'','','','','','',1,'0','2019-12-23 03:18:07');
/*!40000 ALTER TABLE `ruozedata_depotitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_functions`
--

DROP TABLE IF EXISTS `ruozedata_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_functions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Number` varchar(50) DEFAULT NULL COMMENT '编号',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `PNumber` varchar(50) DEFAULT NULL COMMENT '上级编号',
  `URL` varchar(100) DEFAULT NULL COMMENT '链接',
  `State` bit(1) DEFAULT NULL COMMENT '收缩',
  `Sort` varchar(50) DEFAULT NULL COMMENT '排序',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型',
  `PushBtn` varchar(50) DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='功能模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_functions`
--

LOCK TABLES `ruozedata_functions` WRITE;
/*!40000 ALTER TABLE `ruozedata_functions` DISABLE KEYS */;
INSERT INTO `ruozedata_functions` VALUES (1,'0001','系统管理','0','','','0910','','电脑版','','icon-settings','0'),(13,'000102','角色管理','0001','/pages/manage/role.html','\0','0130','','电脑版','','icon-notebook','0'),(14,'000103','用户管理','0001','/pages/manage/user.html','\0','0140','','电脑版',NULL,'icon-notebook','0'),(15,'000104','日志管理','0001','/pages/manage/log.html','\0','0160','','电脑版',NULL,'icon-notebook','0'),(16,'000105','功能管理','0001','/pages/manage/functions.html','\0','0135','','电脑版',NULL,'icon-notebook','0'),(21,'0101','商品管理','0','','\0','0620','','电脑版',NULL,'icon-social-dropbox','0'),(22,'010101','商品类别','0101','/pages/materials/materialcategory.html','\0','0230','','电脑版',NULL,'icon-notebook','0'),(23,'010102','商品信息','0101','/pages/materials/material.html','\0','0240','','电脑版',NULL,'icon-notebook','0'),(24,'0102','基本资料','0','','\0','0750','','电脑版',NULL,'icon-grid','0'),(25,'01020101','供应商信息','0102','/pages/manage/vendor.html','\0','0260','','电脑版','1,2','icon-notebook','0'),(26,'010202','仓库信息','0102','/pages/manage/depot.html','\0','0270','','电脑版',NULL,'icon-notebook','0'),(31,'010206','经手人管理','0102','/pages/materials/person.html','\0','0284','','电脑版',NULL,'icon-notebook','0'),(32,'0502','采购管理','0','','\0','0330','','电脑版','','icon-loop','0'),(33,'050201','采购入库','0502','/pages/materials/purchase_in_list.html','\0','0340','','电脑版','3,4,5','icon-notebook','0'),(38,'0603','销售管理','0','','\0','0390','','电脑版','','icon-briefcase','0'),(40,'080107','调拨出库','0801','/pages/materials/allocation_out_list.html','\0','0807','','电脑版','3,4,5','icon-notebook','0'),(41,'060303','销售出库','0603','/pages/materials/sale_out_list.html','\0','0394','','电脑版','3,4,5','icon-notebook','0'),(44,'0704','财务管理','0','','\0','0450','','电脑版','','icon-map','0'),(59,'030101','库存状况','0301','/pages/reports/in_out_stock_report.html','\0','0600','','电脑版',NULL,'icon-notebook','0'),(194,'010204','收支项目','0102','/pages/manage/inOutItem.html','\0','0282','','电脑版',NULL,'icon-notebook','0'),(195,'010205','结算账户','0102','/pages/manage/account.html','\0','0283','','电脑版',NULL,'icon-notebook','0'),(197,'070402','收入单','0704','/pages/financial/item_in.html','\0','0465','','电脑版','','icon-notebook','0'),(198,'0301','报表查询','0','','\0','0570','','电脑版',NULL,'icon-pie-chart','0'),(199,'050204','采购退货','0502','/pages/materials/purchase_back_list.html','\0','0345','','电脑版','3,4,5','icon-notebook','0'),(200,'060305','销售退货','0603','/pages/materials/sale_back_list.html','\0','0396','','电脑版','3,4,5','icon-notebook','0'),(201,'080103','其它入库','0801','/pages/materials/other_in_list.html','\0','0803','','电脑版','3,4,5','icon-notebook','0'),(202,'080105','其它出库','0801','/pages/materials/other_out_list.html','\0','0805','','电脑版','3,4,5','icon-notebook','0'),(203,'070403','支出单','0704','/pages/financial/item_out.html','\0','0470','','电脑版','','icon-notebook','0'),(204,'070404','收款单','0704','/pages/financial/money_in.html','\0','0475','','电脑版','','icon-notebook','0'),(205,'070405','付款单','0704','/pages/financial/money_out.html','\0','0480','','电脑版','','icon-notebook','0'),(206,'070406','转账单','0704','/pages/financial/giro.html','\0','0490','','电脑版','','icon-notebook','0'),(207,'030102','结算账户','0301','/pages/reports/account_report.html','\0','0610','','电脑版',NULL,'icon-notebook','0'),(208,'030103','进货统计','0301','/pages/reports/buy_in_report.html','\0','0620','','电脑版',NULL,'icon-notebook','0'),(209,'030104','销售统计','0301','/pages/reports/sale_out_report.html','\0','0630','','电脑版',NULL,'icon-notebook','0'),(210,'040102','零售出库','0401','/pages/materials/retail_out_list.html','\0','0405','','电脑版','3,4,5','icon-notebook','0'),(211,'040104','零售退货','0401','/pages/materials/retail_back_list.html','\0','0407','','电脑版','3,4,5','icon-notebook','0'),(212,'070407','收预付款','0704','/pages/financial/advance_in.html','\0','0495','','电脑版','','icon-notebook','0'),(217,'01020102','客户信息','0102','/pages/manage/customer.html','\0','0262','','电脑版','1,2','icon-notebook','0'),(218,'01020103','会员信息','0102','/pages/manage/member.html','\0','0263','','电脑版','1,2','icon-notebook','0'),(219,'000107','资产管理','0001','/pages/asset/asset.html','\0','0170','\0','电脑版',NULL,'icon-notebook','0'),(220,'010103','计量单位','0101','/pages/manage/unit.html','\0','0245','','电脑版',NULL,'icon-notebook','0'),(225,'0401','零售管理','0','','\0','0101','','电脑版','','icon-present','0'),(226,'030106','入库明细','0301','/pages/reports/in_detail.html','\0','0640','','电脑版','','icon-notebook','0'),(227,'030107','出库明细','0301','/pages/reports/out_detail.html','\0','0645','','电脑版','','icon-notebook','0'),(228,'030108','入库汇总','0301','/pages/reports/in_material_count.html','\0','0650','','电脑版','','icon-notebook','0'),(229,'030109','出库汇总','0301','/pages/reports/out_material_count.html','\0','0655','','电脑版','','icon-notebook','0'),(232,'080109','组装单','0801','/pages/materials/assemble_list.html','\0','0809','','电脑版','3,4,5','icon-notebook','0'),(233,'080111','拆卸单','0801','/pages/materials/disassemble_list.html','\0','0811','','电脑版','3,4,5','icon-notebook','0'),(234,'000105','系统配置','0001','/pages/manage/systemConfig.html','\0','0165','','电脑版','','icon-notebook','0'),(235,'030110','客户对账','0301','/pages/reports/customer_account.html','\0','0660','','电脑版','','icon-notebook','0'),(236,'000106','商品属性','0001','/pages/materials/materialProperty.html','\0','0168','','电脑版','','icon-notebook','0'),(237,'030111','供应商对账','0301','/pages/reports/vendor_account.html','\0','0665','','电脑版','','icon-notebook','0'),(239,'0801','仓库管理','0','','\0','0420','','电脑版','','icon-layers','0'),(240,'010104','序列号','0101','/pages/manage/serialNumber.html','\0','0246','','电脑版','','icon-notebook','0'),(241,'050202','采购订单','0502','/pages/materials/purchase_orders_list.html','\0','0335','','电脑版','3','icon-notebook','0'),(242,'060301','销售订单','0603','/pages/materials/sale_orders_list.html','\0','0392','','电脑版','3','icon-notebook','0'),(243,'000108','机构管理','0001','/pages/manage/organization.html','','0139','','电脑版','','icon-notebook','0'),(244,'030112','库存预警','0301','/pages/reports/stock_warning_report.html','\0','0670','','电脑版','','icon-notebook','0');
/*!40000 ALTER TABLE `ruozedata_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_inoutitem`
--

DROP TABLE IF EXISTS `ruozedata_inoutitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_inoutitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='收支项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_inoutitem`
--

LOCK TABLES `ruozedata_inoutitem` WRITE;
/*!40000 ALTER TABLE `ruozedata_inoutitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_inoutitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_log`
--

DROP TABLE IF EXISTS `ruozedata_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6656 DEFAULT CHARSET=utf8 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_log`
--

LOCK TABLES `ruozedata_log` WRITE;
/*!40000 ALTER TABLE `ruozedata_log` DISABLE KEYS */;
INSERT INTO `ruozedata_log` VALUES (6529,120,'用户','192.168.0.102','2019-12-22 19:17:25',0,'登录,id:120用户',NULL,1),(6530,120,'单据','192.168.0.102','2019-12-22 19:17:50',0,'新增单据',NULL,1),(6531,120,'单据明细','192.168.0.102','2019-12-22 19:17:50',0,'新增单据明细',NULL,1),(6532,120,'单据明细','192.168.0.102','2019-12-22 19:17:50',0,'删除,id:单据明细',NULL,1),(6533,120,'单据','192.168.0.102','2019-12-22 19:18:15',0,'修改,id:209单据',NULL,1),(6534,120,'单据','192.168.0.102','2019-12-22 19:18:26',0,'新增单据',NULL,1),(6535,120,'单据明细','192.168.0.102','2019-12-22 19:18:26',0,'新增单据明细',NULL,1),(6536,120,'单据明细','192.168.0.102','2019-12-22 19:18:27',0,'删除,id:单据明细',NULL,1),(6537,120,'单据','192.168.0.102','2019-12-22 19:22:12',0,'新增单据',NULL,1),(6538,120,'单据明细','192.168.0.102','2019-12-22 19:22:13',0,'新增单据明细',NULL,1),(6539,120,'单据明细','192.168.0.102','2019-12-22 19:22:13',0,'删除,id:单据明细',NULL,1),(6540,120,'单据','192.168.0.102','2019-12-22 19:28:20',0,'新增单据',NULL,1),(6541,120,'单据明细','192.168.0.102','2019-12-22 19:28:20',0,'新增单据明细',NULL,1),(6542,120,'单据明细','192.168.0.102','2019-12-22 19:28:20',0,'删除,id:单据明细',NULL,1),(6543,120,'单据','192.168.0.102','2019-12-22 19:28:27',0,'修改,id:212单据',NULL,1),(6553,120,'单据','192.168.0.102','2019-12-22 19:29:44',0,'新增单据',NULL,1),(6554,120,'单据明细','192.168.0.102','2019-12-22 19:29:44',0,'新增单据明细',NULL,1),(6555,120,'单据明细','192.168.0.102','2019-12-22 19:29:44',0,'删除,id:单据明细',NULL,1),(6559,120,'单据','192.168.0.102','2019-12-22 19:32:02',0,'新增单据',NULL,1),(6560,120,'单据明细','192.168.0.102','2019-12-22 19:32:02',0,'新增单据明细',NULL,1),(6561,120,'单据明细','192.168.0.102','2019-12-22 19:32:02',0,'删除,id:单据明细',NULL,1),(6562,120,'商家','192.168.0.102','2019-12-22 19:37:02',0,'新增商家',NULL,1),(6563,120,'账户','192.168.0.102','2019-12-22 19:37:46',0,'新增账户',NULL,1),(6567,120,'单据','192.168.0.102','2019-12-22 19:38:35',0,'新增单据',NULL,1),(6568,120,'单据明细','192.168.0.102','2019-12-22 19:38:35',0,'新增单据明细',NULL,1),(6569,120,'单据明细','192.168.0.102','2019-12-22 19:38:35',0,'删除,id:单据明细',NULL,1),(6570,120,'单据','192.168.0.102','2019-12-22 19:41:04',0,'新增单据',NULL,1),(6571,120,'单据明细','192.168.0.102','2019-12-22 19:41:04',0,'新增单据明细',NULL,1),(6572,120,'单据明细','192.168.0.102','2019-12-22 19:41:04',0,'删除,id:单据明细',NULL,1),(6573,120,'用户','192.168.0.104','2019-12-22 19:49:16',0,'登录,id:120用户',NULL,1),(6574,120,'用户','192.168.0.104','2019-12-22 19:49:16',0,'登录,id:120用户',NULL,1),(6575,120,'用户','192.168.0.104','2019-12-22 19:49:56',0,'登录,id:120用户',NULL,1),(6576,120,'用户','192.168.0.102','2019-12-22 19:51:37',0,'登录,id:120用户',NULL,1),(6577,120,'用户','192.168.0.104','2019-12-22 19:53:47',0,'登录,id:120用户',NULL,1),(6578,120,'用户','192.168.0.102','2019-12-22 19:53:57',0,'登录,id:120用户',NULL,1),(6579,120,'用户','192.168.0.102','2019-12-22 20:17:45',0,'登录,id:120用户',NULL,1),(6580,120,'用户','192.168.0.104','2019-12-22 20:18:00',0,'登录,id:120用户',NULL,1),(6581,120,'用户','192.168.0.104','2019-12-22 20:19:16',0,'登录,id:120用户',NULL,1),(6582,120,'用户','192.168.0.104','2019-12-22 20:19:17',0,'登录,id:120用户',NULL,1),(6583,120,'用户','192.168.0.104','2019-12-22 20:40:45',0,'登录,id:120用户',NULL,1),(6584,120,'用户','192.168.0.104','2019-12-22 21:13:21',0,'登录,id:120用户',NULL,1),(6585,120,'商品类型','192.168.0.104','2019-12-22 21:18:42',0,'新增商品类型',NULL,1),(6586,120,'商品','192.168.0.104','2019-12-22 21:24:19',0,'新增商品',NULL,1),(6587,120,'商家','192.168.0.104','2019-12-22 21:28:51',0,'新增商家',NULL,1),(6588,120,'仓库','192.168.0.104','2019-12-22 21:30:58',0,'新增仓库',NULL,1),(6589,120,'单据','192.168.0.104','2019-12-22 21:42:13',0,'新增单据',NULL,1),(6590,120,'单据明细','192.168.0.104','2019-12-22 21:42:13',0,'新增单据明细',NULL,1),(6591,120,'单据明细','192.168.0.104','2019-12-22 21:42:13',0,'删除,id:单据明细',NULL,1),(6592,120,'单据','192.168.0.104','2019-12-22 21:42:58',0,'修改,id:222单据',NULL,1),(6593,120,'单据明细','192.168.0.104','2019-12-22 21:42:58',0,'新增单据明细',NULL,1),(6594,120,'单据明细','192.168.0.104','2019-12-22 21:42:58',0,'删除,id:单据明细',NULL,1),(6595,120,'账户','192.168.0.104','2019-12-22 21:45:53',0,'新增账户',NULL,1),(6596,120,'单据','192.168.0.104','2019-12-22 21:48:20',0,'新增单据',NULL,1),(6597,120,'单据明细','192.168.0.104','2019-12-22 21:48:20',0,'新增单据明细',NULL,1),(6598,120,'单据明细','192.168.0.104','2019-12-22 21:48:20',0,'删除,id:单据明细',NULL,1),(6599,120,'单据','192.168.0.104','2019-12-22 22:01:35',0,'新增单据',NULL,1),(6600,120,'单据明细','192.168.0.104','2019-12-22 22:01:35',0,'新增单据明细',NULL,1),(6601,120,'单据明细','192.168.0.104','2019-12-22 22:01:36',0,'删除,id:单据明细',NULL,1),(6602,120,'商家','192.168.0.104','2019-12-22 22:02:50',0,'新增商家',NULL,1),(6603,120,'单据','192.168.0.104','2019-12-22 22:03:42',0,'新增单据',NULL,1),(6604,120,'单据明细','192.168.0.104','2019-12-22 22:03:42',0,'新增单据明细',NULL,1),(6605,120,'单据明细','192.168.0.104','2019-12-22 22:03:42',0,'删除,id:单据明细',NULL,1),(6606,120,'单据','192.168.0.104','2019-12-22 22:04:50',0,'修改,id:225单据',NULL,1),(6607,120,'单据明细','192.168.0.104','2019-12-22 22:04:50',0,'新增单据明细',NULL,1),(6608,120,'单据明细','192.168.0.104','2019-12-22 22:04:50',0,'删除,id:单据明细',NULL,1),(6609,120,'单据','192.168.0.104','2019-12-22 22:05:23',0,'修改,id:225单据',NULL,1),(6610,120,'单据明细','192.168.0.104','2019-12-22 22:05:23',0,'新增单据明细',NULL,1),(6611,120,'单据明细','192.168.0.104','2019-12-22 22:05:23',0,'删除,id:单据明细',NULL,1),(6612,120,'单据','192.168.0.104','2019-12-22 22:05:36',0,'修改,id:225单据',NULL,1),(6613,120,'单据明细','192.168.0.104','2019-12-22 22:05:36',0,'新增单据明细',NULL,1),(6614,120,'单据明细','192.168.0.104','2019-12-22 22:05:36',0,'删除,id:单据明细',NULL,1),(6615,120,'单据','192.168.0.104','2019-12-22 22:05:41',0,'修改,id:225单据',NULL,1),(6616,120,'账户','192.168.0.104','2019-12-22 22:08:45',0,'新增账户',NULL,1),(6620,120,'单据','192.168.0.104','2019-12-22 22:11:13',0,'新增单据',NULL,1),(6621,120,'单据明细','192.168.0.104','2019-12-22 22:11:13',0,'新增单据明细',NULL,1),(6622,120,'单据明细','192.168.0.104','2019-12-22 22:11:14',0,'删除,id:单据明细',NULL,1),(6623,120,'单据','192.168.0.104','2019-12-22 22:14:14',0,'新增单据',NULL,1),(6624,120,'单据明细','192.168.0.104','2019-12-22 22:14:14',0,'新增单据明细',NULL,1),(6625,120,'单据明细','192.168.0.104','2019-12-22 22:14:14',0,'删除,id:单据明细',NULL,1),(6626,120,'商家','192.168.0.104','2019-12-22 22:15:03',0,'新增商家',NULL,1),(6630,120,'单据','192.168.0.104','2019-12-22 22:16:21',0,'新增单据',NULL,1),(6631,120,'单据明细','192.168.0.104','2019-12-22 22:16:21',0,'新增单据明细',NULL,1),(6632,120,'单据明细','192.168.0.104','2019-12-22 22:16:21',0,'删除,id:单据明细',NULL,1),(6633,120,'单据','192.168.0.104','2019-12-22 22:17:10',0,'新增单据',NULL,1),(6634,120,'单据明细','192.168.0.104','2019-12-22 22:17:10',0,'新增单据明细',NULL,1),(6635,120,'单据明细','192.168.0.104','2019-12-22 22:17:10',0,'删除,id:单据明细',NULL,1),(6636,120,'用户','114.82.51.103','2019-12-23 11:17:06',0,'登录,id:120用户',NULL,1),(6637,120,'单据','114.82.51.103','2019-12-23 11:17:43',0,'新增单据',NULL,1),(6638,120,'单据明细','114.82.51.103','2019-12-23 11:17:43',0,'新增单据明细',NULL,1),(6639,120,'单据明细','114.82.51.103','2019-12-23 11:17:43',0,'删除,id:单据明细',NULL,1),(6640,120,'单据','114.82.51.103','2019-12-23 11:17:51',0,'修改,id:232单据',NULL,1),(6641,120,'单据','114.82.51.103','2019-12-23 11:18:08',0,'新增单据',NULL,1),(6642,120,'单据明细','114.82.51.103','2019-12-23 11:18:08',0,'新增单据明细',NULL,1),(6643,120,'单据明细','114.82.51.103','2019-12-23 11:18:08',0,'删除,id:单据明细',NULL,1),(6644,120,'用户','61.50.125.102','2019-12-23 11:19:13',0,'登录,id:120用户',NULL,1),(6645,120,'用户','222.211.162.111','2019-12-23 11:19:32',0,'登录,id:120用户',NULL,1),(6646,120,'用户','115.236.50.15','2019-12-23 11:19:46',0,'登录,id:120用户',NULL,1),(6647,120,'用户','113.200.106.39','2019-12-23 11:19:54',0,'登录,id:120用户',NULL,1),(6648,120,'用户','223.255.43.88','2019-12-23 11:20:11',0,'登录,id:120用户',NULL,1),(6649,120,'用户','218.17.27.206','2019-12-23 11:20:49',0,'登录,id:120用户',NULL,1),(6650,120,'用户','60.30.67.146','2019-12-23 11:21:39',0,'登录,id:120用户',NULL,1),(6651,120,'用户','114.82.51.103','2019-12-23 11:27:45',0,'登录,id:120用户',NULL,1),(6652,120,'用户','222.92.76.69','2019-12-23 11:32:03',0,'登录,id:120用户',NULL,1),(6653,120,'用户','203.207.126.39','2019-12-23 11:33:56',0,'登录,id:120用户',NULL,1),(6654,120,'用户','117.136.103.155','2019-12-23 11:42:13',0,'登录,id:120用户',NULL,1),(6655,120,'用户','124.64.18.68','2019-12-23 11:53:47',0,'登录,id:120用户',NULL,1);
/*!40000 ALTER TABLE `ruozedata_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_material`
--

DROP TABLE IF EXISTS `ruozedata_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_material` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CategoryId` bigint(20) DEFAULT NULL COMMENT '产品类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Mfrs` varchar(50) DEFAULT NULL COMMENT '制造商',
  `Packing` decimal(24,6) DEFAULT NULL COMMENT '包装（KG/包）',
  `SafetyStock` decimal(24,6) DEFAULT NULL COMMENT '安全存量（KG）',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Standard` varchar(50) DEFAULT NULL COMMENT '规格',
  `Color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `Unit` varchar(50) DEFAULT NULL COMMENT '单位-单个',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `RetailPrice` decimal(24,6) DEFAULT NULL COMMENT '零售价',
  `LowPrice` decimal(24,6) DEFAULT NULL COMMENT '最低售价',
  `PresetPriceOne` decimal(24,6) DEFAULT NULL COMMENT '预设售价一',
  `PresetPriceTwo` decimal(24,6) DEFAULT NULL COMMENT '预设售价二',
  `UnitId` bigint(20) DEFAULT NULL COMMENT '计量单位Id',
  `FirstOutUnit` varchar(50) DEFAULT NULL COMMENT '首选出库单位',
  `FirstInUnit` varchar(50) DEFAULT NULL COMMENT '首选入库单位',
  `PriceStrategy` varchar(500) DEFAULT NULL COMMENT '价格策略',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用 0-禁用  1-启用',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT '自定义1',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT '自定义2',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT '自定义3',
  `enableSerialNumber` varchar(1) DEFAULT '0' COMMENT '是否开启序列号，0否，1是',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK675951272AB6672C` (`CategoryId`),
  KEY `UnitId` (`UnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8 COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_material`
--

LOCK TABLES `ruozedata_material` WRITE;
/*!40000 ALTER TABLE `ruozedata_material` DISABLE KEYS */;
INSERT INTO `ruozedata_material` VALUES (586,23,'新疆阿克苏苹果','',NULL,100.000000,'塞外红 3~4个','果径80-85mm','','kg','',12.000000,9.000000,8.000000,12.000000,NULL,NULL,NULL,'[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]','','','','','0',1,'0','2019-12-22 11:14:09'),(587,26,'智利进口冷冻三文鱼','',NULL,2000.000000,'中段生鱼片 500g','','','kg','',140.000000,130.000000,80.000000,140.000000,NULL,NULL,NULL,'[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]','','','','','0',1,'0','2019-12-22 11:14:09'),(588,30,'澳洲西冷牛排套餐','',NULL,100.000000,'750g/袋 5片装','','','袋','',72.000000,70.000000,48.000000,72.000000,NULL,NULL,NULL,'[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]','','','','','0',1,'0','2019-12-22 11:14:09'),(589,33,'散养柴鸡500天走地鸡','',NULL,1000.000000,'3斤/只','净膛 3斤/只','','只','',80.000000,55.000000,30.000000,55.000000,NULL,NULL,NULL,'[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]','','','','','0',1,'0','2019-12-22 13:24:09');
/*!40000 ALTER TABLE `ruozedata_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_material_stock`
--

DROP TABLE IF EXISTS `ruozedata_material_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_material_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `number` decimal(24,6) DEFAULT NULL COMMENT '初始库存数量',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_fag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品初始库存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_material_stock`
--

LOCK TABLES `ruozedata_material_stock` WRITE;
/*!40000 ALTER TABLE `ruozedata_material_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_material_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_materialcategory`
--

DROP TABLE IF EXISTS `ruozedata_materialcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_materialcategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `CategoryLevel` smallint(6) DEFAULT NULL COMMENT '等级',
  `ParentId` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `sort` varchar(10) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(1) DEFAULT '0' COMMENT '状态，0系统默认，1启用，2删除',
  `serial_no` varchar(100) DEFAULT NULL COMMENT '编号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK3EE7F725237A77D8` (`ParentId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='产品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_materialcategory`
--

LOCK TABLES `ruozedata_materialcategory` WRITE;
/*!40000 ALTER TABLE `ruozedata_materialcategory` DISABLE KEYS */;
INSERT INTO `ruozedata_materialcategory` VALUES (18,'新鲜水果',NULL,-1,'','1','01','','2019-12-17 18:08:58',120,'2019-12-17 18:08:58',120,1,'2019-12-22 11:13:53'),(19,'海鲜水产',NULL,-1,'','1','02','','2019-12-17 18:09:10',120,'2019-12-17 18:09:10',120,1,'2019-12-22 11:13:53'),(20,'精选肉类',NULL,-1,'','1','03','','2019-12-17 18:09:22',120,'2019-12-17 18:09:22',120,1,'2019-12-22 11:13:53'),(21,'冷饮冻食',NULL,-1,'','1','04','','2019-12-17 18:09:40',120,'2019-12-17 18:09:40',120,1,'2019-12-22 11:13:54'),(22,'蔬菜蛋品',NULL,-1,'','1','05','','2019-12-17 18:09:56',120,'2019-12-17 18:09:56',120,1,'2019-12-22 11:13:54'),(23,'热销水果',NULL,18,'','1','010001','','2019-12-17 18:10:32',120,'2019-12-17 18:10:32',120,1,'2019-12-22 11:13:54'),(24,'时令水果',NULL,18,'','1','010002','','2019-12-17 18:10:54',120,'2019-12-17 18:10:54',120,1,'2019-12-22 11:13:54'),(25,'热带鲜果',NULL,18,'','1','010003','','2019-12-17 18:11:46',120,'2019-12-17 18:11:46',120,1,'2019-12-22 11:13:54'),(26,'鱼类',NULL,19,'','1','020001','','2019-12-17 18:12:17',120,'2019-12-17 18:12:17',120,1,'2019-12-22 11:13:54'),(27,'虾类',NULL,19,'','1','020002','','2019-12-17 18:12:40',120,'2019-12-17 18:12:40',120,1,'2019-12-22 11:13:54'),(28,'蟹类',NULL,19,'','1','020003','','2019-12-17 18:13:04',120,'2019-12-17 18:13:04',120,1,'2019-12-22 11:13:54'),(29,'贝类',NULL,19,'','1','020004','','2019-12-17 18:13:29',120,'2019-12-17 18:13:29',120,1,'2019-12-22 11:13:54'),(30,'牛肉',NULL,20,'','1','030001','','2019-12-17 20:19:27',120,'2019-12-17 20:19:27',120,1,'2019-12-22 11:13:54'),(32,'羊肉',NULL,20,'','1','030002','','2019-12-17 20:20:03',120,'2019-12-17 20:20:03',120,1,'2019-12-22 11:13:54'),(33,'老母鸡',NULL,20,'','1','030003','03第三个一级类别 精选肉类\r\n0003在这个一级类别的第三个二级类别','2019-12-22 21:18:42',120,'2019-12-22 21:18:42',120,1,'2019-12-22 13:18:32');
/*!40000 ALTER TABLE `ruozedata_materialcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_materialproperty`
--

DROP TABLE IF EXISTS `ruozedata_materialproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_materialproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nativeName` varchar(50) DEFAULT NULL COMMENT '原始名称',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否启用',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `anotherName` varchar(50) DEFAULT NULL COMMENT '别名',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品扩展字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_materialproperty`
--

LOCK TABLES `ruozedata_materialproperty` WRITE;
/*!40000 ALTER TABLE `ruozedata_materialproperty` DISABLE KEYS */;
INSERT INTO `ruozedata_materialproperty` VALUES (1,'规格','','02','规格','0'),(2,'颜色','','01','颜色','0'),(3,'制造商','\0','03','制造商','0'),(4,'自定义1','\0','04','自定义1','0'),(5,'自定义2','\0','05','自定义2','0'),(6,'自定义3','\0','06','自定义3','0');
/*!40000 ALTER TABLE `ruozedata_materialproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_msg`
--

DROP TABLE IF EXISTS `ruozedata_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `status` varchar(1) DEFAULT NULL COMMENT '状态，1未读 2已读',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_msg`
--

LOCK TABLES `ruozedata_msg` WRITE;
/*!40000 ALTER TABLE `ruozedata_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_orga_user_rel`
--

DROP TABLE IF EXISTS `ruozedata_orga_user_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_orga_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orga_id` bigint(20) NOT NULL COMMENT '机构id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_blng_orga_dspl_seq` varchar(20) DEFAULT NULL COMMENT '用户在所属机构中显示顺序',
  `delete_flag` char(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='机构用户关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_orga_user_rel`
--

LOCK TABLES `ruozedata_orga_user_rel` WRITE;
/*!40000 ALTER TABLE `ruozedata_orga_user_rel` DISABLE KEYS */;
INSERT INTO `ruozedata_orga_user_rel` VALUES (10,12,120,'0001','0','2019-12-22 19:04:44',120,'2019-12-22 19:04:44',120,1);
/*!40000 ALTER TABLE `ruozedata_orga_user_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_organization`
--

DROP TABLE IF EXISTS `ruozedata_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_no` varchar(20) DEFAULT NULL COMMENT '机构编号',
  `org_full_name` varchar(500) DEFAULT NULL COMMENT '机构全称',
  `org_abr` varchar(20) DEFAULT NULL COMMENT '机构简称',
  `org_tpcd` varchar(9) DEFAULT NULL COMMENT '机构类型',
  `org_stcd` char(1) DEFAULT NULL COMMENT '机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名',
  `org_parent_no` varchar(20) DEFAULT NULL COMMENT '机构父节点编号',
  `sort` varchar(20) DEFAULT NULL COMMENT '机构显示顺序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `org_create_time` datetime DEFAULT NULL COMMENT '机构创建时间',
  `org_stop_time` datetime DEFAULT NULL COMMENT '机构停运时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_organization`
--

LOCK TABLES `ruozedata_organization` WRITE;
/*!40000 ALTER TABLE `ruozedata_organization` DISABLE KEYS */;
INSERT INTO `ruozedata_organization` VALUES (12,'0001','若泽数据','若泽数据',NULL,'2','-1','0001','','2019-12-22 19:04:28',120,'2019-12-22 19:04:28',120,NULL,NULL,1);
/*!40000 ALTER TABLE `ruozedata_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_person`
--

DROP TABLE IF EXISTS `ruozedata_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_person` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='经手人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_person`
--

LOCK TABLES `ruozedata_person` WRITE;
/*!40000 ALTER TABLE `ruozedata_person` DISABLE KEYS */;
INSERT INTO `ruozedata_person` VALUES (14,'业务员','呼呼',1,'0');
/*!40000 ALTER TABLE `ruozedata_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_role`
--

DROP TABLE IF EXISTS `ruozedata_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_role`
--

LOCK TABLES `ruozedata_role` WRITE;
/*!40000 ALTER TABLE `ruozedata_role` DISABLE KEYS */;
INSERT INTO `ruozedata_role` VALUES (4,'管理员',NULL,NULL,NULL,1,'0');
/*!40000 ALTER TABLE `ruozedata_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_sequence`
--

DROP TABLE IF EXISTS `ruozedata_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_sequence` (
  `seq_name` varchar(50) NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT '1' COMMENT '增长步数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sequence表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_sequence`
--

LOCK TABLES `ruozedata_sequence` WRITE;
/*!40000 ALTER TABLE `ruozedata_sequence` DISABLE KEYS */;
INSERT INTO `ruozedata_sequence` VALUES ('depot_number_seq',1,999999999999999999,380,1,'单据编号sequence');
/*!40000 ALTER TABLE `ruozedata_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_serial_number`
--

DROP TABLE IF EXISTS `ruozedata_serial_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_serial_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_Id` bigint(20) DEFAULT NULL COMMENT '产品表id',
  `serial_Number` varchar(64) DEFAULT NULL COMMENT '序列号',
  `is_Sell` varchar(1) DEFAULT '0' COMMENT '是否卖出，0未卖出，1卖出',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_Time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `depothead_Id` bigint(20) DEFAULT NULL COMMENT '单据主表id，用于跟踪序列号流向',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='序列号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_serial_number`
--

LOCK TABLES `ruozedata_serial_number` WRITE;
/*!40000 ALTER TABLE `ruozedata_serial_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruozedata_serial_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_supplier`
--

DROP TABLE IF EXISTS `ruozedata_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phonenum` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `isystem` tinyint(4) DEFAULT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `AdvanceIn` decimal(24,6) DEFAULT '0.000000' COMMENT '预收款',
  `BeginNeedGet` decimal(24,6) DEFAULT NULL COMMENT '期初应收',
  `BeginNeedPay` decimal(24,6) DEFAULT NULL COMMENT '期初应付',
  `AllNeedGet` decimal(24,6) DEFAULT NULL COMMENT '累计应收',
  `AllNeedPay` decimal(24,6) DEFAULT NULL COMMENT '累计应付',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `telephone` varchar(30) DEFAULT NULL COMMENT '手机',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `taxNum` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `bankName` varchar(50) DEFAULT NULL COMMENT '开户行',
  `accountNumber` varchar(50) DEFAULT NULL COMMENT '账号',
  `taxRate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='供应商/客户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_supplier`
--

LOCK TABLES `ruozedata_supplier` WRITE;
/*!40000 ALTER TABLE `ruozedata_supplier` DISABLE KEYS */;
INSERT INTO `ruozedata_supplier` VALUES (74,'供应商1','J哥','','','',NULL,'供应商','',0.000000,NULL,NULL,NULL,NULL,'','13811111111','','','','',NULL,1,'0','2019-12-22 11:12:16'),(75,'客户1','若泽','','','',NULL,'客户','',0.000000,NULL,NULL,NULL,NULL,'','13922222222','','','','',NULL,1,'0','2019-12-22 11:12:16'),(76,'女神','女神','','','',NULL,'会员','',0.000000,NULL,NULL,NULL,NULL,'','13900000000','','','','',3.000000,1,'0','2019-12-22 11:36:52'),(77,'供应商2','老母鸡J哥','','','',NULL,'供应商','',0.000000,NULL,NULL,NULL,NULL,'','13922222222','','','','',NULL,1,'0','2019-12-22 13:28:41'),(78,'客户2','老母鸡若泽','','','',NULL,'客户','',0.000000,NULL,NULL,NULL,NULL,'','18911111111','','','','',NULL,1,'0','2019-12-22 14:02:40'),(79,'女神2号','女神2号','','','',NULL,'会员','',0.000000,NULL,NULL,NULL,NULL,'','','','','','',NULL,1,'0','2019-12-22 14:14:53');
/*!40000 ALTER TABLE `ruozedata_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_systemconfig`
--

DROP TABLE IF EXISTS `ruozedata_systemconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_contacts` varchar(20) DEFAULT NULL COMMENT '公司联系人',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_tel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) DEFAULT NULL COMMENT '公司传真',
  `company_post_code` varchar(20) DEFAULT NULL COMMENT '公司邮编',
  `depot_flag` varchar(1) DEFAULT '0' COMMENT '仓库启用标记，0未启用，1启用',
  `customer_flag` varchar(1) DEFAULT '0' COMMENT '客户启用标记，0未启用，1启用',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_systemconfig`
--

LOCK TABLES `ruozedata_systemconfig` WRITE;
/*!40000 ALTER TABLE `ruozedata_systemconfig` DISABLE KEYS */;
INSERT INTO `ruozedata_systemconfig` VALUES (7,'ERP公司','J哥','','','','','0','0',1,'0');
/*!40000 ALTER TABLE `ruozedata_systemconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_tenant`
--

DROP TABLE IF EXISTS `ruozedata_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) DEFAULT NULL COMMENT '用户数量限制',
  `bills_num_limit` int(11) DEFAULT NULL COMMENT '单据数量限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='租户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_tenant`
--

LOCK TABLES `ruozedata_tenant` WRITE;
/*!40000 ALTER TABLE `ruozedata_tenant` DISABLE KEYS */;
INSERT INTO `ruozedata_tenant` VALUES (82,1,'jepson',1,100,'2019-12-10 00:00:00');
/*!40000 ALTER TABLE `ruozedata_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_unit`
--

DROP TABLE IF EXISTS `ruozedata_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UName` varchar(50) DEFAULT NULL COMMENT '名称，支持多单位',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='多单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_unit`
--

LOCK TABLES `ruozedata_unit` WRITE;
/*!40000 ALTER TABLE `ruozedata_unit` DISABLE KEYS */;
INSERT INTO `ruozedata_unit` VALUES (2,'kg,包(1:25)',1,'0'),(8,'瓶,箱(1:12)',1,'0');
/*!40000 ALTER TABLE `ruozedata_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_user`
--

DROP TABLE IF EXISTS `ruozedata_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `loginame` varchar(255) DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统自带数据 ',
  `Status` tinyint(4) DEFAULT '0' COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_user`
--

LOCK TABLES `ruozedata_user` WRITE;
/*!40000 ALTER TABLE `ruozedata_user` DISABLE KEYS */;
INSERT INTO `ruozedata_user` VALUES (120,'若泽数据@J哥','jepson','e10adc3949ba59abbe56e057f20f883e','大数据架构',NULL,'','',1,1,0,'',NULL,1);
/*!40000 ALTER TABLE `ruozedata_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruozedata_userbusiness`
--

DROP TABLE IF EXISTS `ruozedata_userbusiness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruozedata_userbusiness` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类别',
  `KeyId` varchar(50) DEFAULT NULL COMMENT '主ID',
  `Value` varchar(10000) DEFAULT NULL COMMENT '值',
  `BtnStr` varchar(2000) DEFAULT NULL COMMENT '按钮权限',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruozedata_userbusiness`
--

LOCK TABLES `ruozedata_userbusiness` WRITE;
/*!40000 ALTER TABLE `ruozedata_userbusiness` DISABLE KEYS */;
INSERT INTO `ruozedata_userbusiness` VALUES (5,'RoleFunctions','4','[245][13][12][16][243][14][15][234][236][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]','[{\"funId\":\"25\",\"btnStr\":\"1,2\"},{\"funId\":\"217\",\"btnStr\":\"1,2\"},{\"funId\":\"218\",\"btnStr\":\"1,2\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"33\",\"btnStr\":\"3,4,5\"},{\"funId\":\"199\",\"btnStr\":\"3,4,5\"},{\"funId\":\"242\",\"btnStr\":\"3\"},{\"funId\":\"41\",\"btnStr\":\"3,4,5\"},{\"funId\":\"200\",\"btnStr\":\"3,4,5\"},{\"funId\":\"210\",\"btnStr\":\"3,4,5\"},{\"funId\":\"211\",\"btnStr\":\"3,4,5\"},{\"funId\":\"201\",\"btnStr\":\"3,4,5\"},{\"funId\":\"202\",\"btnStr\":\"3,4,5\"},{\"funId\":\"40\",\"btnStr\":\"3,4,5\"},{\"funId\":\"232\",\"btnStr\":\"3,4,5\"},{\"funId\":\"233\",\"btnStr\":\"3,4,5\"}]','0'),(6,'RoleFunctions','5','[22][23][25][26][194][195][31][33][200][201][41][199][202]',NULL,'0'),(7,'RoleFunctions','6','[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]','[{\"funId\":\"33\",\"btnStr\":\"4\"}]','0'),(9,'RoleFunctions','7','[168][13][12][16][14][15][189][18][19][132]',NULL,'0'),(10,'RoleFunctions','8','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]',NULL,'0'),(11,'RoleFunctions','9','[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]',NULL,'0'),(12,'UserRole','1','[5]',NULL,'0'),(13,'UserRole','2','[6][7]',NULL,'0'),(14,'UserDepot','2','[1][2][6][7]',NULL,'0'),(15,'UserDepot','1','[1][2][5][6][7][10][12][14][15][17]',NULL,'0'),(16,'UserRole','63','[10]',NULL,'0'),(18,'UserDepot','63','[14][15]',NULL,'0'),(19,'UserDepot','5','[6][45][46][50]',NULL,'0'),(20,'UserRole','5','[5]',NULL,'0'),(21,'UserRole','64','[13]',NULL,'0'),(22,'UserDepot','64','[1]',NULL,'0'),(23,'UserRole','65','[5]',NULL,'0'),(24,'UserDepot','65','[1]',NULL,'0'),(25,'UserCustomer','64','[5][2]',NULL,'0'),(26,'UserCustomer','65','[6]',NULL,'0'),(27,'UserCustomer','63','[58]',NULL,'0'),(28,'UserDepot','96','[7]',NULL,'0'),(29,'UserRole','96','[6]',NULL,'0'),(30,'UserRole','113','[10]',NULL,'0'),(32,'RoleFunctions','10','[245][13][243][14][15][234][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]','[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]','0'),(34,'UserRole','115','[10]',NULL,'0'),(35,'UserRole','117','[10]',NULL,'0'),(36,'UserDepot','117','[8][9]',NULL,'0'),(37,'UserCustomer','117','[52]',NULL,'0'),(38,'UserRole','120','[4]',NULL,'0'),(39,'UserDepot','120','[7][8][9][10][11][12][2][1][3]',NULL,'0'),(40,'UserCustomer','120','[52][48][6][5][2]',NULL,'0'),(41,'RoleFunctions','12','',NULL,'0'),(48,'RoleFunctions','13','[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]',NULL,'0'),(51,'UserRole','74','[10]',NULL,'0'),(52,'UserDepot','121','[13]',NULL,'0'),(54,'UserDepot','115','[13]',NULL,'0'),(56,'UserCustomer','115','[56]',NULL,'0'),(57,'UserCustomer','121','[56]',NULL,'0'),(58,'UserRole','121','[15]',NULL,'0'),(59,'UserRole','123','[10]',NULL,'0'),(60,'UserRole','124','[10]',NULL,'0'),(61,'UserRole','125','[10]',NULL,'0'),(62,'UserRole','126','[10]',NULL,'0'),(63,'UserRole','127','[10]',NULL,'0'),(64,'UserRole','128','[10]',NULL,'0'),(65,'UserRole','129','[10]',NULL,'0'),(66,'UserRole','130','[10]',NULL,'0');
/*!40000 ALTER TABLE `ruozedata_userbusiness` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-23 11:59:08
