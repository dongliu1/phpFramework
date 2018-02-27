# rcms bakfile
# version:1.8.1 
# time:2016-03-23 17:20:17
# http://www.rcms.net
# --------------------------------------------------------


DROP TABLE IF EXISTS `fn_assets`;
CREATE TABLE `fn_assets` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `name` varchar(30) NOT NULL,
  `idx` varchar(30) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchilds` varchar(1023) NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pids` varchar(1023) DEFAULT NULL,
  `cpid` text,
  PRIMARY KEY (`id`),
  KEY `list` (`site`,`parentid`,`keyid`,`listorder`),
  KEY `keyid` (`site`,`keyid`),
  KEY `child` (`child`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `fn_assets` VALUES('1','1','组织机构','','','0','0','','0','0','','');
INSERT INTO `fn_assets` VALUES('2','1','上海分公司','SHGS','','0','1','2,6,7,8,9,10','1','2','','');
INSERT INTO `fn_assets` VALUES('3','1','四川分公司','SCGS','','0','1','3,11,12,13','1','1','','');
INSERT INTO `fn_assets` VALUES('4','1','云南分公司','YNGS','','0','1','4,14,15','1','3','','');
INSERT INTO `fn_assets` VALUES('6','1','麻城电站','MC','','2','1','6','1','0','','');
INSERT INTO `fn_assets` VALUES('7','1','神农架电站','SNJ','','2','0','7','1','0','','');
INSERT INTO `fn_assets` VALUES('8','1','电站3','DZ3','','2','0','8','1','0','','');
INSERT INTO `fn_assets` VALUES('11','1','溪洛渡电站','XLD','','3','0','11','1','0','','');
INSERT INTO `fn_assets` VALUES('12','1','乌东德电站','WDD','','3','1','12','1','0','','');
INSERT INTO `fn_assets` VALUES('14','1','向家坝电站','XJB','','4','0','14','1','0','','');
INSERT INTO `fn_assets` VALUES('15','1','白鹤滩电站','BHT','','4','0','15','1','0','','');
INSERT INTO `fn_assets` VALUES('24','1','虎跳峡电站','HTX','','4','0','','1','0','','');
INSERT INTO `fn_assets` VALUES('28','1','陕西定边','DB','','0','0','','1','4','','');
INSERT INTO `fn_assets` VALUES('29','1','宁波电站','NBDZ','MW|2','2','0','','1','0','','');
INSERT INTO `fn_assets` VALUES('30','1','方阵1','FZ1','','12','0','','1','0','','');

DROP TABLE IF EXISTS `fn_block`;
CREATE TABLE `fn_block` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `type` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_category`;
CREATE TABLE `fn_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `typeid` tinyint(1) NOT NULL COMMENT '类别(1内容,2单页,3外链)',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `arrparentid` varchar(255) NOT NULL,
  `childs` text,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，1，存在',
  `arrchildid` varchar(255) NOT NULL,
  `catname` varchar(30) NOT NULL COMMENT '栏目名称',
  `image` varchar(100) NOT NULL COMMENT '图片',
  `icon` varchar(100) DEFAULT NULL,
  `content` mediumtext NOT NULL COMMENT '单网页内容',
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `catdir` varchar(30) NOT NULL COMMENT '栏目URL目录',
  `url` varchar(100) NOT NULL COMMENT 'URL地址',
  `urlpath` varchar(255) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '内容数量',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否为菜单',
  `authority` text,
  `categorytpl` varchar(50) NOT NULL,
  `listtpl` varchar(50) NOT NULL,
  `showtpl` varchar(50) NOT NULL,
  `setting` text NOT NULL,
  `pagesize` smallint(5) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `listorder` (`listorder`,`child`),
  KEY `ismenu` (`ismenu`),
  KEY `parentid` (`parentid`),
  KEY `site` (`site`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

INSERT INTO `fn_category` VALUES('57','1','2','0','0','0','','1','94,95,93','生产实时','','sk icon-shengchanshishi','','','','','shengchanshishi','','','0','3','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('45','1','1','23','44','44,0','','0','','已办事项','','fa fa-bell-o','','','','','yibanshixiang','','','10','0','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"],[\"添加\",\"add\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('124','1','2','0','54','54,0','','0','','角色管理','','fa fa-bell-o','','','','','jiaoseguanli','','','0','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"user/group\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('40','1','1','23','44','44,0','','0','','待办事项','','fa fa-bell-o','','','','','daibanshixiang','','','18','1','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','daibanshixiang/category.html','daibanshixiang/content_list.html','_todo_show.html','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('62','1','2','0','0','0','','1','66,88','缺陷管理','','sk icon-quexianguanli','','','','','quexianguanli','','','17','4','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('47','1','2','0','0','0','','1','103,50,51,128','工作票管理','','sk icon-gongzuopiaoguanli','','','','','gongzuopiaoguanli','','','4','6','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('66','1','1','27','62','62,0','','0','','缺陷追踪','','fa fa-bell-o','','','','','quexianzhuizong','','','17','1','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('100','1','1','74','53','53,0','','0','','交接班记录','','fa fa-bell-o','','','','','jiaojiebanguanli','','','0','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('43','1','1','42','53','53,0','','0','','排班表','','fa fa-bell-o','','','','','paibanbiao','','','0','1','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"修改\",\"edit\"],[\"删除\",\"delete\"]]','_dailyplan_category.html','_dailyplan_list.html','_dailyplan_show.html','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('44','1','2','0','0','0','','1','45,40,92','日常办公','','sk icon-richangbangong','','','','','dailywork','','','29','1','1','[[\"查看\",\"view\"]]','','','_dailywork_show.html','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('65','1','2','0','0','0','','1','126,127,75,106','设备管理','','sk icon-shebei','','','','','shebeiguanli','','','7','8','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('53','1','2','0','0','0','','1','100,43,104','运行管理','','sk icon-yunxingguanli','','','','','yunxingguanli','','','3','2','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('64','1','2','0','0','0','','1','71,129','操作票管理','','sk icon-caozuopiaoguanli','','','','','caozuopiaoguanli','','','7','7','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('103','1','1','76','47','47,0','','0','','工作票','','fa fa-bell-o','','','','','gongzuopiao','','','2','1','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"修改\",\"edit\"],[\"删除\",\"delete\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('54','1','2','0','0','0','','1','124,79,125','基础设置','','sk icon-jichushezhi','','','','','jichushezhi','','','0','13','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('92','1','1','73','44','44,0','','0','','发电计划','','fa fa-bell-o','','','','','fadianjihua','','','1','2','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('50','1','1','58','47','47,0','','0','','电气一种工作票','','fa fa-bell-o','','','','','gongzuopiao1','','','0','2','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"],[\"审核\",\"audit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('110','1','2','0','109','109,0','','0','','告警信息','','fa fa-bell-o','','','','','gaojingxinxi','','','0','0','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('51','1','1','59','47','47,0','','0','','电气二种工作票','','fa fa-bell-o','','','','','gongzuopiao2','','','0','3','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"],[\"审核\",\"audit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('126','1','1','78','65','65,0','','0','','设备型号','','fa fa-bell-o','','','','','shebeixinghao','','','6','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('98','1','1','72','99','99,0','','0','','计划完成分析','','fa fa-bell-o','','','','','jihuafenxi','','','0','3','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('96','1','1','72','99','99,0','','0','','纵向对比','','fa fa-bell-o','','','','','zongxiangduibi','','','0','1','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('90','1','1','24','89','89,0','','0','','未处理警告','','fa fa-bell-o','','','','','weichulijinggao','','','0','0','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','16');
INSERT INTO `fn_category` VALUES('94','1','2','0','57','57,0','','0','','电站首页','','fa fa-bell-o','','','','','index-site','','','0','2','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('95','1','2','0','57','57,0','','0','','电站实时方阵','','fa fa-bell-o','','','','','dianzhanfangzhen','','','0','3','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('71','1','1','61','64','64,0','','0','','操作票','','fa fa-bell-o','','','','','caozuopiao','','','4','1','1','[[\"查看\",\"view\"],[\"开票\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('88','1','2','0','62','62,0','','0','','缺陷统计','','fa fa-bell-o','&lt;p&gt;缺陷统计&lt;/p&gt;','','','','quexiantongji','','','0','0','1','[[\"查看\",\"view\"]]','','','','{\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('127','1','1','29','65','65,0','','0','','设备台账','','fa fa-bell-o','','','','','shebeitaizhang','','','1','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','15');
INSERT INTO `fn_category` VALUES('75','1','1','64','65','65,0','','0','','设备评估','','fa fa-bell-o','','','','','shebeipinggu','','','0','2','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('129','1','1','83','64','64,0','','0','','操作票模板','','fa fa-bell-o','','','','','caozuopiaomoban','','','3','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('128','1','1','82','47','47,0','','0','','工作票模板','','fa fa-bell-o','','','','','gongzuopiaomoban','','','2','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('89','1','2','0','0','0','','1','90','预警管理','','sk icon-yujingguanli','','','','','yujingguanli','','','0','10','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('93','1','2','0','57','57,0','','0','','集团首页','','fa fa-bell-o','','','','','index-group','','','0','1','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('79','1','1','68','54','54,0','','0','','员工管理','','fa fa-bell-o','','','','','yuangongguanli','','','0','2','1','[[\"查看\",\"view\"],[\"删除\",\"delete\"],[\"编辑\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('97','1','1','72','99','99,0','','0','','横向对比','','fa fa-bell-o','','','','','hengxiangduibi','','','0','2','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('99','1','2','0','0','0','','1','98,96,97','对标管理','','sk icon-zhibiaoguanli','','','','','duibiaoguanli','','','0','6','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"redirect\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('104','1','1','77','53','53,0','','0','','运行记录','','fa fa-bell-o','','','','','yunxingjilu','','','3','2','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('106','1','1','78','65','65,0','','0','','设备详情','','fa fa-bell-o','','','','','shebeixiangqing','','','0','3','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','16');
INSERT INTO `fn_category` VALUES('108','1','2','0','0','0','','1','119,120,121,123','组态图管理','','fa fa-bell-o','','','','','zutaituguanli','','','0','12','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('109','1','2','0','0','0','','1','110,112,113,115,114,116,117,118','告警管理','','fa fa-bell-o','','','','','gaojingguanli','','','0','11','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('112','1','2','0','109','109,0','','0','','设备树','','fa fa-bell-o','','','','','shebeishu','','','0','1','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('113','1','2','0','109','109,0','','0','','设备树可切','','fa fa-bell-o','','','','','shebeishukeqie','','','0','2','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('115','1','2','0','109','109,0','','0','','汇流箱状态','','fa fa-bell-o','','','','','huiliuxiang','','','0','4','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('114','1','2','0','109','109,0','','0','','逆变器状态','','fa fa-bell-o','','','','','nibianqi','','','0','3','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('116','1','2','0','109','109,0','','0','','箱变状态','','fa fa-bell-o','','','','','xiangbian','','','0','5','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('117','1','2','0','109','109,0','','0','','站变状态','','fa fa-bell-o','','','','','zhanbian','','','0','6','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('118','1','2','0','109','109,0','','0','','pv过压','','fa fa-bell-o','','','','','pvguoya','','','0','7','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('119','1','2','0','108','108,0','','0','','主目录','','fa fa-bell-o','','','','','zhumulu','','','0','1','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('120','1','2','0','108','108,0','','0','','拓扑图','','fa fa-bell-o','','','','','tuoputu','','','0','2','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('121','1','2','0','108','108,0','','0','','逆变器','','fa fa-bell-o','','','','','nibianqi-info','','','0','3','1','','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');
INSERT INTO `fn_category` VALUES('125','1','2','0','54','54,0','','0','','电站管理','','fa fa-bell-o','','','','','dianzhanguanli','','','0','0','1','[[\"查看\",\"view\"],[\"添加\",\"add\"],[\"删除\",\"delete\"],[\"修改\",\"edit\"]]','','','','{\"document\":\"\",\"redirect\":\"assets\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"},\"memberpost\":null,\"modelpost\":null,\"adminpost\":null,\"rolepost\":null,\"grouppost\":null,\"guestpost\":null,\"verifypost\":null,\"verifyrole\":null,\"reprint\":null,\"reprintrole\":null,\"reprinttimes\":null}','20');
INSERT INTO `fn_category` VALUES('123','1','2','0','108','108,0','','0','','组态图','','fa fa-bell-o','','','','','zutaitu','','','0','0','1','[[\"查看\",\"view\"]]','','','','{\"document\":\"\",\"guest\":{\"post\":\"1\"},\"url\":{\"use\":\"0\"}}','20');

DROP TABLE IF EXISTS `fn_content`;
CREATE TABLE `fn_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

INSERT INTO `fn_content` VALUES('197');
INSERT INTO `fn_content` VALUES('198');
INSERT INTO `fn_content` VALUES('199');

DROP TABLE IF EXISTS `fn_content_1`;
CREATE TABLE `fn_content_1` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sysadd` tinyint(1) NOT NULL COMMENT '是否后台添加',
  `userid` smallint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `admin` (`modelid`,`status`,`listorder`,`updatetime`),
  KEY `catid` (`catid`,`status`,`updatetime`),
  KEY `member` (`userid`,`modelid`,`status`,`sysadd`,`updatetime`),
  KEY `status` (`status`,`updatetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1` VALUES('1','2','1','深圳5名医院正副院长涉嫌受贿被捕','','深圳,受贿','近期深圳检察机关在医疗系统掀起的“反腐风暴”广受社会公众和媒体关注。深圳市人民检察院21日向媒体通报说，在6月份立案侦查的16人中，5名医院正副院长、4名科室主任因涉嫌受贿罪已被检察机关批准逮捕，另外7人被依...','/index.php?c=content&a=show&id=1','0','1','3','1','0','admin','1340300221','1340300221');
INSERT INTO `fn_content_1` VALUES('2','2','1','北京5.7亿彩票巨奖得主兑奖介绍投注方式','','北京,彩票','据得主介绍，当天投注时先以机选一注乘以10倍的方式投注，之后让销售员将这注心仪号码以手工输入的方式进行100倍投注。同时中奖者表示自身经济情况良好，所以习惯采用大额倍投方式进行投注。兑奖过程中还发生了一个...','/index.php?c=content&a=show&id=2','0','1','1','1','0','admin','1340300498','1340300498');
INSERT INTO `fn_content_1` VALUES('3','2','1','蛟龙22日5时准备第三次下潜试验','','蛟龙','据了解，这次下潜时间预计达10小时，计划下潜深度为6960米左右。试验任务是按照已定的海试计划，继续对潜水器各项指标进行验证和考核，同时对前两次下潜出现故障的改进情况进行验证，为最终冲击7000米深度做好充分准...','/index.php?c=content&a=show&id=3','0','1','0','1','0','admin','1340300547','1340300547');
INSERT INTO `fn_content_1` VALUES('4','2','1','湖南洞口县高考提前收卷续:考生利益获补偿','','补偿,高考,洞口县','6月8日上午的高考综合科目考试中，邵阳市洞口县九中考点因信号员错发终考信号导致考试提前结束。湖南省委、省政府高度重视，要求妥善处置，严肃查处相关责任人。省教育厅派出专人赴洞口县会同当地有关部门就此事进行...','/index.php?c=content&a=show&id=4','0','1','0','1','0','admin','1340300592','1340300592');
INSERT INTO `fn_content_1` VALUES('5','2','1','云南沾益县否认看守所在押人员看球激动而死','','看守所,云南,在押人员,沾益县','一名网友最近在微博爆料称：沾益县大坡乡新庄村委会老黄口村民舒树兵，在沾益县小河底看守所“自行死亡”，有新说法称，死者“是看欧洲杯足球太精彩过于激动而死！”此事引发了网友较大反响。对此，沾益县政府新闻办...','/index.php?c=content&a=show&id=5','0','1','0','1','0','admin','1340300627','1340300627');
INSERT INTO `fn_content_1` VALUES('6','2','1','民政部:设地级三沙市有助加强其开发建设','','沙市,民政部,开发','发言人：国务院于近日批准，撤销海南省西沙群岛、南沙群岛、中沙群岛办事处，设立地级三沙市，管辖西沙群岛、中沙群岛、南沙群岛的岛礁及其海域。三沙市人民政府驻西沙永兴岛。记者：据了解，我国一直设有专门行政机...','/index.php?c=content&a=show&id=6','0','1','1','1','0','admin','1340300664','1340300664');
INSERT INTO `fn_content_1` VALUES('7','2','1','西安嫌犯当街杀害1名女子被路人控制','','西安','华商网快讯2012年6月21日晚18时，有多名网友在微博中称，西安东大街一年轻女性被杀。记者从柏树林派出所了解到确有此事，警方表示，具体原因正在调查之中。据警方透露，死者身着白色连衣裙。西安市公安局的刘宏伟科...','/index.php?c=content&a=show&id=7','0','1','1','1','0','admin','1340301272','1340301272');
INSERT INTO `fn_content_1` VALUES('8','2','1','青年在青岛创业可申请万元奖励','','创业,奖励,青年','　据介绍，此次评选对象是自主创办生产服务型项目、企业或从事个体经营，同时吸纳了一定数量的社会人员实现就业再就业的城乡各类青年劳动者。评选活动设“青岛市杰出青年创业奖”10名、“青岛市优秀青年创业奖”20名...','/index.php?c=content&a=show&id=8','0','1','2','1','0','admin','1340301300','1340301300');
INSERT INTO `fn_content_1` VALUES('9','2','1','北京1名垃圾站站长贪污上万元被公诉','','北京,贪污,垃圾站','据检方指控，2010年7月至2011年7月间，张某利用经手收取垃圾清运费的便利，采用减低收费价格、不开具发票等方式，截留侵吞应上缴的垃圾清运费共计人民币1.3万元。公诉机关认为，应以贪污罪追究张某的刑事责任。记者...','/index.php?c=content&a=show&id=9','0','1','21','1','0','admin','1340301336','1340357564');
INSERT INTO `fn_content_1` VALUES('10','3','1','日本民主党前干事长小泽一郎称可能退党建新党','','日本,小泽一郎,干事长','当天下午，在约50名亲小泽派众议员召开的非公开集会上，小泽明确表示将追求最佳解决方案，如果未能实现，也有可能考虑组建新党。由于日本公共债务负担沉重，公债总额约为国内生产总值的两倍。为减轻债务压力，野田内...','/index.php?c=content&a=show&id=10','0','1','0','1','0','admin','1340301368','1340301368');
INSERT INTO `fn_content_1` VALUES('11','3','1','美国商务部长布赖森辞职','','美国,商务部长','　奥巴马当天在声明中对布赖森担任商务部长以来所做的工作表示感谢。奥巴马说，布赖森不辞辛苦地工作，为促进美国出口和制造业生产作出了贡献。他称布赖森是有执行力的、杰出的领导，并透露布赖森将在总统出口委员会...','/index.php?c=content&a=show&id=11','0','1','0','1','0','admin','1340301388','1340301388');
INSERT INTO `fn_content_1` VALUES('12','3','1','巴基斯坦发生2起爆炸致4死42伤','','巴基斯坦','当地时间21日晚6时30分许，巴基斯坦西北部城市白沙瓦的哈扎尔卡瓦尼地区的一个神庙附近发生炸弹袭击事件。当地消息人士说，爆炸造成包括2名儿童在内的至少3人死亡，另有24人受伤。据悉，此次袭击使用了约10至12公斤...','/index.php?c=content&a=show&id=12','0','1','1','1','0','admin','1340301406','1340301406');
INSERT INTO `fn_content_1` VALUES('13','3','1','美媒称中情局协助向叙利亚反对派分发武器','','反对派,叙利亚,中情局','报道援引美国官员和阿拉伯情报官员的话说，这些中情局官员人数不多，他们已在土耳其南部秘密活动数个星期。通过帮助甄别叙利亚反对派武装人员，这些情报官员希望了解更多有关叙利亚境内反对派情况并与之建立关系。报...','/index.php?c=content&a=show&id=13','0','1','0','1','0','admin','1340301423','1340301423');
INSERT INTO `fn_content_1` VALUES('14','3','1','土耳其将解除对法国制裁','','土耳其,法国','达武特奥卢表示，两国首脑的会晤是一个良好开端，他本人也将于7月5日造访巴黎开展正式会谈。他称，相互尊重是土耳其外交的准则之一。去年12月，土耳其因法国议会通过的有关“亚美尼亚大屠杀”法案而对法国采取制裁措...','/index.php?c=content&a=show&id=14','0','1','1','1','0','admin','1340301449','1340301449');
INSERT INTO `fn_content_1` VALUES('15','3','1','俄罗斯首次证实运送武装直升机赴叙利亚','','俄罗斯,叙利亚,武装直升机','他说，当这艘船经北海驶往大西洋时，船主得知第三方保险已经撤出，该船所处位置的航海分局要求这艘船入港接受检查。为避免延误，这艘船决定停靠在摩尔曼斯克港，预计将于22日抵达。这艘船悬挂俄罗斯国旗，将进行再次...','/index.php?c=content&a=show&id=15','0','1','2','1','0','admin','1340301467','1340301467');
INSERT INTO `fn_content_1` VALUES('16','3','1','英国医生抗议养老金改革罢工百万患者受影响','','医生,英国,养老金改革,影响','人民网伦敦6月21日电(记者白阳)由于对政府养老金改革不满，英国国家医疗保障体系(NHS)的医生21日开始进行为期一天的罢工，这是1975年以来英国医生首次进行罢工。据悉，当天约有30000台手术和20000个预约门诊被取消并...','/index.php?c=content&a=show&id=16','0','1','0','1','0','admin','1340301485','1340301485');
INSERT INTO `fn_content_1` VALUES('42','20','10','粮食','','','','/index.php?c=content&a=show&id=42','0','1','3','1','0','system','1403010525','1403169923');
INSERT INTO `fn_content_1` VALUES('43','17','8','粮食','','','','/index.php?c=content&a=show&id=43','0','1','23','1','0','system','1403171500','1403172176');
INSERT INTO `fn_content_1` VALUES('41','2','1','省局组织召开《关于交通运输推进物流业健康发展的指导意见》专题学习座谈会','uploadfiles/image/201406/5dd25598baa524d230899352ed5a01bc.jpg','交通运输,物流业,座谈会,健康','6月14日上午，省局组织召开专题学习座谈会，学习讨论交通运输部《关于交通运输推进物流业健康发展的指导意见》，物流产业处全体人员、综合计划处、办公室、客货运输处、政策法规处、财务审计处、科技信息处等处室主...','/index.php?c=content&a=show&id=41','0','1','25','0','4','dagong','1402998551','1403010304');
INSERT INTO `fn_content_1` VALUES('31','2','1','国务院发布意见建立现代流通体系','','国务院','北京谋智火狐信息技术有限公司版权所有北京谋智火狐信息技术有限公司版权所有北京谋智火狐信息技术有限公司版权所有北京谋智火狐信息技术有限公司版权所有...','/index.php?c=content&a=show&id=31','0','1','33','1','0','admin','1340357603','1403010192');
INSERT INTO `fn_content_1` VALUES('72','2','1','阿斯发顺丰','','顺丰','','/index.php?c=content&a=show&id=72','0','0','0','0','4','dagong','1417600779','1417600779');
INSERT INTO `fn_content_1` VALUES('73','2','1','啊沙发上','','沙发','','/index.php?c=content&a=show&id=73','0','0','0','0','4','dagong','1417600832','1417600832');
INSERT INTO `fn_content_1` VALUES('74','2','1','阿双方都','','阿双方','','/index.php?c=content&a=show&id=74','0','0','0','0','4','dagong','1417600933','1417600933');
INSERT INTO `fn_content_1` VALUES('75','2','1','阿斯发顺丰','','顺丰','','/index.php?c=content&a=show&id=75','0','0','0','0','4','dagong','1417601271','1417601271');
INSERT INTO `fn_content_1` VALUES('76','2','1','啊沙发上','','沙发','','/index.php?c=content&a=show&id=76','0','0','0','0','4','dagong','1417601293','1417601293');
INSERT INTO `fn_content_1` VALUES('77','2','1','啊啊丰富的','','','','/index.php?c=content&a=show&id=77','0','0','0','0','4','dagong','1417601326','1417601326');
INSERT INTO `fn_content_1` VALUES('80','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=80','0','1','0','0','6','zg','1456814744','1457748852');
INSERT INTO `fn_content_1` VALUES('79','40','23','','','','测试一下','/optcloud/index.php?c=content&a=show&id=79','0','0','0','0','6','zg','1453360486','1453360486');
INSERT INTO `fn_content_1` VALUES('81','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=81','0','0','0','0','6','zg','1456826963','1456833668');
INSERT INTO `fn_content_1` VALUES('82','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=82','0','0','0','0','6','zg','1456827109','1456833677');
INSERT INTO `fn_content_1` VALUES('83','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=83','0','0','0','0','6','zg','1456828453','1457677086');
INSERT INTO `fn_content_1` VALUES('84','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=84','0','0','0','0','6','zg','1456829383','1456829383');
INSERT INTO `fn_content_1` VALUES('85','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=85','0','0','0','0','6','zg','1456829433','1456829433');
INSERT INTO `fn_content_1` VALUES('86','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=86','0','0','0','0','6','zg','1456831829','1456831829');
INSERT INTO `fn_content_1` VALUES('87','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=87','0','0','0','0','6','zg','1456831844','1456833628');
INSERT INTO `fn_content_1` VALUES('88','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=88','0','0','0','0','6','zg','1456831876','1456831876');
INSERT INTO `fn_content_1` VALUES('89','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=89','0','0','0','0','6','zg','1456831888','1456833616');
INSERT INTO `fn_content_1` VALUES('90','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=90','0','0','0','0','6','zg','1456831898','1456833598');
INSERT INTO `fn_content_1` VALUES('91','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=91','0','0','0','0','6','zg','1456831910','1456831910');
INSERT INTO `fn_content_1` VALUES('92','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=92','0','0','0','0','6','zg','1456831918','1456833578');
INSERT INTO `fn_content_1` VALUES('93','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=93','0','0','0','0','6','zg','1456831929','1456833568');
INSERT INTO `fn_content_1` VALUES('94','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=94','0','0','0','0','6','zg','1456833483','1456833540');
INSERT INTO `fn_content_1` VALUES('95','92','73','','','','','/SolarKloud/index.php?c=content&a=show&id=95','0','1','0','0','6','zg','1456895525','1456895525');
INSERT INTO `fn_content_1` VALUES('96','71','61','','','','','/SolarKloud/index.php?c=content&a=show&id=96','0','1','0','0','6','zg','1456903288','1456903288');
INSERT INTO `fn_content_1` VALUES('97','40','23','','','','','/SolarKloud/index.php?c=content&a=show&id=97','0','1','0','0','6','zg','1456972020','1456972020');
INSERT INTO `fn_content_1` VALUES('98','40','23','','','','','/SolarKloud/index.php?c=content&a=show&id=98','0','1','0','0','6','zg','1456972024','1456972024');
INSERT INTO `fn_content_1` VALUES('134','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=134','0','1','0','0','6','zg','1458094005','1458096521');
INSERT INTO `fn_content_1` VALUES('100','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=100','0','0','0','0','6','zg','1456982899','1457677072');
INSERT INTO `fn_content_1` VALUES('101','40','23','','','','','/SolarKloud/index.php?c=content&a=show&id=101','0','1','0','0','6','zg','1456983042','1456983042');
INSERT INTO `fn_content_1` VALUES('102','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=102','0','0','0','0','6','zg','1456983104','1457677053');
INSERT INTO `fn_content_1` VALUES('103','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=103','0','0','0','0','6','zg','1456983137','1457677039');
INSERT INTO `fn_content_1` VALUES('104','66','27','','','','设备故障','/solarkloud/index.php?c=content&a=show&id=104','0','1','0','0','6','zg','1456984788','1458011086');
INSERT INTO `fn_content_1` VALUES('105','71','61','','','','','/solarkloud/index.php?c=content&a=show&id=105','0','0','0','0','6','zg','1456995063','1458180114');
INSERT INTO `fn_content_1` VALUES('111','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=111','0','0','0','0','6','zg','1457513253','1457513253');
INSERT INTO `fn_content_1` VALUES('110','104','77','','','','','/solarkloud/index.php?c=content&a=show&id=110','0','1','0','0','6','zg','1457489771','1458196500');
INSERT INTO `fn_content_1` VALUES('108','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=108','0','0','0','0','6','zg','1457330192','1457677022');
INSERT INTO `fn_content_1` VALUES('109','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=109','0','0','0','0','6','zg','1457436091','1457677007');
INSERT INTO `fn_content_1` VALUES('112','43','42','','','','','/SolarKloud/index.php?c=content&a=show&id=112','0','0','0','0','6','zg','1457513273','1457513273');
INSERT INTO `fn_content_1` VALUES('113','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=113','0','1','0','0','6','zg','1457748807','1457748807');
INSERT INTO `fn_content_1` VALUES('114','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=114','0','1','0','0','6','zg','1457749187','1457749187');
INSERT INTO `fn_content_1` VALUES('115','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=115','0','1','0','0','6','zg','1457749225','1457749225');
INSERT INTO `fn_content_1` VALUES('116','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=116','0','0','0','0','6','zg','1457939278','1457939278');
INSERT INTO `fn_content_1` VALUES('117','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=117','0','0','0','0','6','zg','1457939290','1457939290');
INSERT INTO `fn_content_1` VALUES('118','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=118','0','0','0','0','6','zg','1457945028','1457945028');
INSERT INTO `fn_content_1` VALUES('119','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=119','0','0','0','0','6','zg','1457945066','1457945066');
INSERT INTO `fn_content_1` VALUES('120','66','27','','','','逆变器数据为零','/solarkloud/index.php?c=content&a=show&id=120','0','1','0','0','6','zg','1458006985','1458011017');
INSERT INTO `fn_content_1` VALUES('121','66','27','','','','撒打开呢1','/solarkloud/index.php?c=content&a=show&id=121','0','1','0','0','6','zg','1458007136','1458010955');
INSERT INTO `fn_content_1` VALUES('122','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=122','0','0','0','0','6','zg','1458009332','1458009332');
INSERT INTO `fn_content_1` VALUES('123','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=123','0','0','0','0','6','zg','1458009432','1458009432');
INSERT INTO `fn_content_1` VALUES('124','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=124','0','1','0','0','6','zg','1458009648','1458011333');
INSERT INTO `fn_content_1` VALUES('125','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=125','0','1','0','0','6','zg','1458009725','1458011277');
INSERT INTO `fn_content_1` VALUES('126','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=126','0','1','0','0','6','zg','1458010015','1458010909');
INSERT INTO `fn_content_1` VALUES('127','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=127','0','0','0','0','6','zg','1458010582','1458010870');
INSERT INTO `fn_content_1` VALUES('128','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=128','0','1','0','0','6','zg','1458011211','1458011246');
INSERT INTO `fn_content_1` VALUES('129','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=129','0','1','0','0','6','zg','1458011712','1458011727');
INSERT INTO `fn_content_1` VALUES('130','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=130','0','1','0','0','6','zg','1458011807','1458281748');
INSERT INTO `fn_content_1` VALUES('131','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=131','0','1','0','0','6','zg','1458011826','1458013960');
INSERT INTO `fn_content_1` VALUES('132','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=132','0','1','0','0','6','zg','1458011875','1458088942');
INSERT INTO `fn_content_1` VALUES('133','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=133','0','1','0','0','6','zg','1458012009','1458012039');
INSERT INTO `fn_content_1` VALUES('135','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=135','0','1','0','0','6','zg','1458096580','1458099750');
INSERT INTO `fn_content_1` VALUES('136','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=136','0','0','0','0','6','zg','1458100525','1458120269');
INSERT INTO `fn_content_1` VALUES('137','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=137','0','1','0','0','6','zg','1458120177','1458709790');
INSERT INTO `fn_content_1` VALUES('138','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=138','0','0','0','0','6','zg','1458186310','1458186310');
INSERT INTO `fn_content_1` VALUES('139','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=139','0','0','0','0','6','zg','1458205393','1458205393');
INSERT INTO `fn_content_1` VALUES('140','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=140','0','0','0','0','6','zg','1458281956','1458281956');
INSERT INTO `fn_content_1` VALUES('141','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=141','0','0','0','0','6','zg','1458286973','1458286973');
INSERT INTO `fn_content_1` VALUES('142','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=142','0','0','0','0','6','zg','1458288351','1458288351');
INSERT INTO `fn_content_1` VALUES('143','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=143','0','0','0','0','6','zg','1458288366','1458288366');
INSERT INTO `fn_content_1` VALUES('144','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=144','0','1','0','0','6','zg','1458288735','1458288735');
INSERT INTO `fn_content_1` VALUES('145','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=145','0','1','0','0','6','zg','1458288851','1458288851');
INSERT INTO `fn_content_1` VALUES('146','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=146','0','1','0','0','6','zg','1458288922','1458288922');
INSERT INTO `fn_content_1` VALUES('147','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=147','0','1','0','0','6','zg','1458288931','1458288966');
INSERT INTO `fn_content_1` VALUES('148','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=148','0','1','0','0','6','zg','1458289047','1458289047');
INSERT INTO `fn_content_1` VALUES('149','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=149','0','1','0','0','6','zg','1458289111','1458289111');
INSERT INTO `fn_content_1` VALUES('150','104','77','','','','','/solarkloud/index.php?c=content&a=show&id=150','0','1','0','0','6','zg','1458352561','1458352561');
INSERT INTO `fn_content_1` VALUES('151','43','42','','','','','/solarkloud/index.php?c=content&a=show&id=151','0','0','0','0','6','zg','1458354455','1458354455');
INSERT INTO `fn_content_1` VALUES('152','127','29','','','','','/solarkloud/index.php?c=content&a=show&id=152','0','1','0','0','6','zg','1458537695','1458722563');
INSERT INTO `fn_content_1` VALUES('187','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=187','0','1','0','0','6','zg','1458632044','1458632044');
INSERT INTO `fn_content_1` VALUES('154','71','61','','','','','/solarkloud/index.php?c=content&a=show&id=154','0','1','0','0','6','zg','1458544971','1458545484');
INSERT INTO `fn_content_1` VALUES('186','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=186','0','1','0','0','6','zg','1458631564','1458631564');
INSERT INTO `fn_content_1` VALUES('182','129','83','','','','','/solarkloud/index.php?c=content&a=show&id=182','0','1','0','0','6','zg','1458614024','1458614024');
INSERT INTO `fn_content_1` VALUES('183','129','83','','','','','/solarkloud/index.php?c=content&a=show&id=183','0','1','0','0','6','zg','1458614063','1458614063');
INSERT INTO `fn_content_1` VALUES('184','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=184','0','1','0','0','6','zg','1458627151','1458627151');
INSERT INTO `fn_content_1` VALUES('185','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=185','0','1','0','0','6','zg','1458631420','1458631420');
INSERT INTO `fn_content_1` VALUES('181','129','83','','','','','/solarkloud/index.php?c=content&a=show&id=181','0','1','0','0','6','zg','1458613978','1458613978');
INSERT INTO `fn_content_1` VALUES('180','128','82','','','','','/solarkloud/index.php?c=content&a=show&id=180','0','1','0','0','6','zg','1458613381','1458613381');
INSERT INTO `fn_content_1` VALUES('179','128','82','','','','','/solarkloud/index.php?c=content&a=show&id=179','0','1','0','0','6','zg','1458613095','1458613095');
INSERT INTO `fn_content_1` VALUES('164','45','23','','','','','/solarkloud/index.php?c=content&a=show&id=164','0','1','0','0','6','zg','1458557087','1458557087');
INSERT INTO `fn_content_1` VALUES('165','71','61','','','','','/solarkloud/index.php?c=content&a=show&id=165','0','1','0','0','6','zg','1458557467','1458557467');
INSERT INTO `fn_content_1` VALUES('166','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=166','0','1','0','0','6','zg','1458557486','1458557486');
INSERT INTO `fn_content_1` VALUES('167','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=167','0','1','0','0','6','zg','1458557501','1458557501');
INSERT INTO `fn_content_1` VALUES('168','103','76','','','','','/solarkloud/index.php?c=content&a=show&id=168','0','1','0','0','6','zg','1458557511','1458557511');
INSERT INTO `fn_content_1` VALUES('169','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=169','0','1','0','0','6','zg','1458557519','1458557519');
INSERT INTO `fn_content_1` VALUES('170','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=170','0','1','0','0','6','zg','1458557530','1458557530');
INSERT INTO `fn_content_1` VALUES('171','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=171','0','1','0','0','6','zg','1458557542','1458557542');
INSERT INTO `fn_content_1` VALUES('172','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=172','0','1','0','0','6','zg','1458557552','1458557552');
INSERT INTO `fn_content_1` VALUES('173','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=173','0','1','0','0','6','zg','1458557560','1458557560');
INSERT INTO `fn_content_1` VALUES('174','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=174','0','1','0','0','6','zg','1458557568','1458557568');
INSERT INTO `fn_content_1` VALUES('175','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=175','0','1','0','0','6','zg','1458557577','1458557577');
INSERT INTO `fn_content_1` VALUES('176','40','23','','','','','/solarkloud/index.php?c=content&a=show&id=176','0','1','0','0','6','zg','1458557586','1458557586');
INSERT INTO `fn_content_1` VALUES('177','104','77','','','','','/solarkloud/index.php?c=content&a=show&id=177','0','1','0','0','6','zg','1458558869','1458558869');
INSERT INTO `fn_content_1` VALUES('178','103','76','','','','','/solarkloud/index.php?c=content&a=show&id=178','0','1','0','0','6','zg','1458609211','1458609211');
INSERT INTO `fn_content_1` VALUES('188','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=188','0','1','0','0','6','zg','1458632097','1458632097');
INSERT INTO `fn_content_1` VALUES('189','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=189','0','1','0','0','6','zg','1458632148','1458632148');
INSERT INTO `fn_content_1` VALUES('190','66','27','','','','','/solarkloud/index.php?c=content&a=show&id=190','0','1','0','0','6','zg','1458632208','1458632208');
INSERT INTO `fn_content_1` VALUES('191','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=191','0','1','0','0','6','zg','1458697251','1458720162');
INSERT INTO `fn_content_1` VALUES('192','71','61','','','','','/solarkloud/index.php?c=content&a=show&id=192','0','1','0','0','6','zg','1458698844','1458698844');
INSERT INTO `fn_content_1` VALUES('193','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=193','0','1','0','0','6','zg','1458716046','1458716046');
INSERT INTO `fn_content_1` VALUES('194','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=194','0','1','0','0','6','zg','1458716164','1458716164');
INSERT INTO `fn_content_1` VALUES('195','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=195','0','1','0','0','6','zg','1458716216','1458716216');
INSERT INTO `fn_content_1` VALUES('196','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=196','0','1','0','0','6','zg','1458716218','1458716232');
INSERT INTO `fn_content_1` VALUES('197','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=197','0','1','0','0','6','zg','1458719906','1458720186');
INSERT INTO `fn_content_1` VALUES('198','127','29','','','','','/solarkloud/index.php?c=content&a=show&id=198','0','1','0','0','6','zg','1458720003','1458721759');
INSERT INTO `fn_content_1` VALUES('199','126','78','','','','','/solarkloud/index.php?c=content&a=show&id=199','0','1','0','0','6','zg','1458720214','1458720253');

DROP TABLE IF EXISTS `fn_content_1_alarm`;
CREATE TABLE `fn_content_1_alarm` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `jibie` varchar(255) DEFAULT NULL,
  `fashengshijian` bigint(10) DEFAULT NULL,
  `huifushijian` bigint(10) DEFAULT NULL,
  `suozaichangzhan` varchar(255) DEFAULT NULL,
  `jiange` varchar(255) DEFAULT NULL,
  `shebei` varchar(255) DEFAULT NULL,
  `leixing` varchar(255) DEFAULT NULL,
  `gaojingqueren` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_benchmarking`;
CREATE TABLE `fn_content_1_benchmarking` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_business`;
CREATE TABLE `fn_content_1_business` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_consumption`;
CREATE TABLE `fn_content_1_consumption` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_dailyplan`;
CREATE TABLE `fn_content_1_dailyplan` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `zhibanren` varchar(255) DEFAULT NULL,
  `starttime` bigint(10) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_dailyplan` VALUES('81','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('82','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('83','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('84','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('85','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('86','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('87','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('88','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('89','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('90','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('91','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('92','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('93','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('94','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('100','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('102','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('103','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('108','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('109','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('111','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('112','43','','2','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('116','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('117','43','','3','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('118','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('119','43','','2','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('138','43','','1','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('140','43','','刘东','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('141','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('142','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('143','43','','','','');
INSERT INTO `fn_content_1_dailyplan` VALUES('151','43','','','','');

DROP TABLE IF EXISTS `fn_content_1_dailyrecord`;
CREATE TABLE `fn_content_1_dailyrecord` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `zhibanren` varchar(255) DEFAULT NULL,
  `jiluleixing` varchar(255) DEFAULT NULL,
  `jiluneirong` text,
  `jilushijian` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_dailyrecord` VALUES('110','104','','zg','0','','0');
INSERT INTO `fn_content_1_dailyrecord` VALUES('150','104','','zg','临时通知','通知中','1456970100');
INSERT INTO `fn_content_1_dailyrecord` VALUES('177','104','','刘东','临时通知','已通知','1458213240');

DROP TABLE IF EXISTS `fn_content_1_defect`;
CREATE TABLE `fn_content_1_defect` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `faxianren` varchar(255) DEFAULT NULL,
  `faxianshijian` bigint(10) DEFAULT NULL,
  `quexianjibie` varchar(255) DEFAULT NULL,
  `chulijieguo` text,
  `liuchengzhuangtai` varchar(255) DEFAULT NULL,
  `gaojing` varchar(255) DEFAULT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `quexianmiaoshu` text,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_defect` VALUES('104','66','&lt;p&gt;设备故障&lt;/p&gt;','专工','1456984740','1','','0','','1','没有直流输入，逆变器LCD由直流供电');
INSERT INTO `fn_content_1_defect` VALUES('120','66','&lt;p&gt;逆变器数据为零&lt;/p&gt;','专工','1455501240','1','','0','','5','逆变器显示“GFCI Fault”或者“lleak&amp;nbsp;error”');
INSERT INTO `fn_content_1_defect` VALUES('121','66','&lt;p&gt;撒打开呢1&lt;/p&gt;','专工','1457402280','1','','1','','4','逆变器显示“Isolation&amp;nbsp;error”和“Isolation&amp;nbsp;Fault”');
INSERT INTO `fn_content_1_defect` VALUES('126','66','','专工','1458009960','1','','0','','3','逆变器显示“Vin&amp;nbsp;overvoltage”或者“PV&amp;nbsp;Over&amp;nbsp;Voltage”');
INSERT INTO `fn_content_1_defect` VALUES('127','66','','专工','1458010440','1','','1','','2','逆变器不并网。逆变器显示“No&amp;nbsp;grid”或者“No&amp;nbsp;Utility”&lt;br /&gt;');
INSERT INTO `fn_content_1_defect` VALUES('128','66','','专工','0','0','','0','','6','逆变器显示“Grid&amp;nbsp;Volt.Fault”电压错误“Grid&amp;nbsp;Freq.Fault”频率错误');
INSERT INTO `fn_content_1_defect` VALUES('129','66','','专工','0','1','','0','','7','&lt;strong&gt;逆变器屏幕没有显示&lt;/strong&gt;');
INSERT INTO `fn_content_1_defect` VALUES('130','66','','专工','0','一般','开始处理','待处理','','9','&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;逆变器没有反应&lt;span&gt;&lt;/span&gt;&lt;/span&gt;');
INSERT INTO `fn_content_1_defect` VALUES('131','66','','专工','0','1','','0','','10','&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;逆变器输出电压低&lt;/span&gt;');
INSERT INTO `fn_content_1_defect` VALUES('139','66','','专工','0','0','ewr','0','ewr','er','er');
INSERT INTO `fn_content_1_defect` VALUES('184','66','','专工','0','一般','','待处理','','','');
INSERT INTO `fn_content_1_defect` VALUES('132','66','','专工','1458011820','1','&lt;p&gt;\r\n	&lt;span style=&quot;font-family:宋体;color:#000000;font-size:9pt;&quot;&gt;&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;color:;&quot;&gt;．电池没电了需要充电。&lt;/span&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#000000;font-size:9pt;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;．电池电压太低或者接触不良，再充电，检查电池端子或者用干布清理端子。&lt;/span&gt; \r\n&lt;/p&gt;','2','','11','&lt;span style=&quot;font-family:宋体;font-size:9pt;&quot;&gt;逆变器低电压报警&lt;/span&gt;');
INSERT INTO `fn_content_1_defect` VALUES('185','66','','刘东','1458631320','0','处理中','0','一级告警','2','散热器过热');
INSERT INTO `fn_content_1_defect` VALUES('133','66','','专工','1458012000','2','&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	1．电池电压太低，重新充电或者更换电池。2．负载电流太高，关闭部分负载重新启动逆变器。\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	3．逆变器过温保护。让逆变器降温一段时间，并放在通风的地方。\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	4．逆变器启动失败，重新启动。\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	5．端子接反，保险丝熔断，更换保险丝。\r\n&lt;/p&gt;','2','','12','逆变器无输出');
INSERT INTO `fn_content_1_defect` VALUES('186','66','','专工','1459322640','2','未处理','1','二级告警','12','箱变损坏');
INSERT INTO `fn_content_1_defect` VALUES('187','66','','朱秀','1458113580','1','已修复','2','二级告警','32','汇流箱漏电');
INSERT INTO `fn_content_1_defect` VALUES('188','66','','刘东','1458718440','2','已降温','1','三级告警','55','逆变器过热');
INSERT INTO `fn_content_1_defect` VALUES('189','66','','专工','1459323300','2','未处理','0','一级告警','78','风机损坏');
INSERT INTO `fn_content_1_defect` VALUES('190','66','','专工','1459409760','1','未处理','0','三级告警','88','逆变器2损坏');

DROP TABLE IF EXISTS `fn_content_1_duty`;
CREATE TABLE `fn_content_1_duty` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `jiebanzhichang` varchar(255) DEFAULT NULL,
  `jiebanshijian` bigint(10) DEFAULT NULL,
  `jiaobanshijian` bigint(10) DEFAULT NULL,
  `banci` varchar(255) DEFAULT NULL,
  `zhibanzhuangtai` varchar(255) DEFAULT NULL,
  `jiaobanjilu` varchar(255) DEFAULT NULL,
  `zhibanzuyuan` varchar(255) DEFAULT NULL,
  `shebeizhuangtai` varchar(255) DEFAULT NULL,
  `miaoshu` text,
  `zhibanrizhi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_eqlist`;
CREATE TABLE `fn_content_1_eqlist` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `shebeibianhao` varchar(255) DEFAULT NULL,
  `shebeimingcheng` varchar(255) DEFAULT NULL,
  `shebeileibie` varchar(255) DEFAULT NULL,
  `yewubianhao` varchar(255) DEFAULT NULL,
  `KKSbianma` varchar(255) DEFAULT NULL,
  `IPdizhi` varchar(255) DEFAULT NULL,
  `ESNhao` varchar(255) DEFAULT NULL,
  `gudingzichanbianhao` varchar(255) DEFAULT NULL,
  `yunxingzhuangtai` varchar(255) DEFAULT NULL,
  `zujiantouchanriqi` bigint(10) DEFAULT NULL,
  `eqmodelid` varchar(255) DEFAULT NULL,
  `cpid` varchar(50) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `beizhuxinxi` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `suoshudianzhan` varchar(255) DEFAULT NULL,
  `shebeixinghao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_eqlist` VALUES('152','127','','A7889','逆变器-3','11','','','','','','','1458537660','196','','','','uploadfiles/member/6/image/201603/3.jpg','7','逆变器-6[易事特]');
INSERT INTO `fn_content_1_eqlist` VALUES('198','127','','NBQ20160300001','逆变器-1','15','','','','','','','0','199','','','','','2','逆变器-4[易事特]');

DROP TABLE IF EXISTS `fn_content_1_eqmodel`;
CREATE TABLE `fn_content_1_eqmodel` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `xinghaomingcheng` varchar(255) DEFAULT NULL,
  `xinghaodaima` varchar(255) DEFAULT NULL,
  `shebeichangshang` varchar(255) DEFAULT NULL,
  `biaochengzhuanhuanlv` varchar(255) DEFAULT NULL,
  `zhuanhuanxiaolv` varchar(255) DEFAULT NULL,
  `shebeileibie` varchar(255) DEFAULT NULL,
  `shebeidianbiao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_eqmodel` VALUES('137','126','','光伏并网逆变器','EA500KTM2','易事特','','98.7%','11','[\"18\",\"19\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('191','126','','太阳能板','SOLAR20160301','无锡尚能','','','15','[\"30\",\"31\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('193','126','','逆变器-3','EA500KTM3','易事特','','','11','[\"16\",\"17\",\"18\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('194','126','','逆变器-4','EA500KTM4','易事特','','','11','[\"17\",\"18\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('195','126','','逆变器-5','EA500KTM5','易事特','','','11','[\"19\",\"20\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('196','126','','逆变器-6','EA500KTM5','易事特','','','11','[\"19\",\"20\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('197','126','','太阳能板-2','SOLAR20160302','无锡尚能','','','15','[\"29\",\"30\"]');
INSERT INTO `fn_content_1_eqmodel` VALUES('199','126','','太阳能板-3','太阳能板-4','无锡尚德','','','15','[\"29\",\"30\",\"31\"]');

DROP TABLE IF EXISTS `fn_content_1_evaluation`;
CREATE TABLE `fn_content_1_evaluation` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `shebeibanben` varchar(255) DEFAULT NULL,
  `changshangmingcheng` varchar(255) DEFAULT NULL,
  `banbenmingcheng` varchar(255) DEFAULT NULL,
  `shebeishuliang` varchar(255) DEFAULT NULL,
  `gaojingshuliang` varchar(255) DEFAULT NULL,
  `yizhongshuliang` varchar(255) DEFAULT NULL,
  `erzhongshuliang` varchar(255) DEFAULT NULL,
  `quexianshuliang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_extend`;
CREATE TABLE `fn_content_1_extend` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `verify` varchar(255) NOT NULL,
  `position` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_extend` VALUES('31','2','','','2');

DROP TABLE IF EXISTS `fn_content_1_monitoring`;
CREATE TABLE `fn_content_1_monitoring` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_operational`;
CREATE TABLE `fn_content_1_operational` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_optemplate`;
CREATE TABLE `fn_content_1_optemplate` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `mobanmingcheng` varchar(255) DEFAULT NULL,
  `moban` text,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_optemplate` VALUES('181','129','','操作票1','&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-size:16.0pt;font-family:宋体;&quot;&gt;光伏电站电气倒闸操作票&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:16.0pt;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:220.5pt;&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;编号：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作开始时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分 终了时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作任务：&lt;span&gt;#1&lt;/span&gt;发电单元&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串拆除安措恢备&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;执行情况&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;序号&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;作&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;项&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;目&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;1&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;检查&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串工作票全部终结，设备具备投运条件；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;2&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串上收回“在此工作”标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;3&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串的熔断器上收回“禁止操作”标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;4&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;核对&lt;span&gt;#1&lt;/span&gt;汇流箱直流断路器位置、编号正确；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;5&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;断开&lt;span&gt;#1&lt;/span&gt;汇流箱直流断路器；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;6&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;送上&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串的熔断器；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;7&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;合上&lt;span&gt;#1&lt;/span&gt;汇流箱直流断路器；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;8&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;检查&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串的电流值在正常范围内；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;汇报站长，操作完毕。&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;备注：&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;监护人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;值班负责人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;');
INSERT INTO `fn_content_1_optemplate` VALUES('182','129','','操作票2','&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-size:16.0pt;font-family:宋体;&quot;&gt;光伏电站电气倒闸操作票&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:16.0pt;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:220.5pt;&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;编号：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作开始时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分 终了时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作任务：&lt;span&gt;#1&lt;/span&gt;发电单元&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串解备做安措&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;执行情况&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;序号&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;作&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;项&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;目&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;1&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;核对&lt;span&gt;#1&lt;/span&gt;汇流箱直流断路器编号、位置正确；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;2&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;断开汇流箱直流断路器；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;3&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;核对&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串的熔断器编号、位置正确；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;4&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;断开&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串对应的熔断器；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;5&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串的熔断器上悬挂“禁止操作”标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;6&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;合上&lt;span&gt;#1&lt;/span&gt;汇流箱直流断路器，查其他组串正常投运；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;7&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;汇流箱&lt;span&gt;#1&lt;/span&gt;电池组串上悬挂“在此工作”标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;汇报站长，操作完毕。&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:5.25pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;left&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:5.25pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;left&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:5.25pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:5.25pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;left&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:5.25pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;备注：&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;监护人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;值班负责人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;');
INSERT INTO `fn_content_1_optemplate` VALUES('183','129','','操作票3','&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-size:16.0pt;font-family:宋体;&quot;&gt;光伏电站电气倒闸操作票&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:16.0pt;&quot;&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:220.5pt;&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;编号：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作开始时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分 终了时间：&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作任务：&lt;span&gt;#1&lt;/span&gt;发电单元&lt;span&gt;#1&lt;/span&gt;汇流箱拆除安措恢备&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;执行情况&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;序号&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;作&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;项&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;目&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;1&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;检查&lt;span&gt;#1&lt;/span&gt;汇流箱工作票全部终结，设备具备投运条件；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;2&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;汇流箱输出侧拆除接地线一组：&lt;span&gt;_____&lt;/span&gt;；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;3&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;在&lt;span&gt;#1&lt;/span&gt;直流配电柜输入侧拆除接地线一组：&lt;span&gt;_____&lt;/span&gt;；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;4&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;核对&lt;span&gt;#1&lt;/span&gt;汇流箱输出侧开关&lt;span&gt;QF&lt;/span&gt;位置、编号正确；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;5&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;收回标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;6&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;合上&lt;span&gt;#1&lt;/span&gt;汇流箱输出侧开关&lt;span&gt;QF&lt;/span&gt;；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;7&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;核对&lt;span&gt;#1&lt;/span&gt;直流配电柜输入侧开关&lt;span&gt;QF1&lt;/span&gt;位置、编号正确；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;8&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;收回标示牌；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;9&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;合上&lt;span&gt;#1&lt;/span&gt;直流配电柜输入侧开关&lt;span&gt;QF1&lt;/span&gt;；&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;汇报站长，操作完毕。&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;72&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;47&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;495&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;614&quot; colspan=&quot;3&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;备注：&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;操作人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;监护人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;值班负责人&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;');

DROP TABLE IF EXISTS `fn_content_1_opticket`;
CREATE TABLE `fn_content_1_opticket` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `jihao` varchar(255) DEFAULT NULL,
  `caozuoxuhao` varchar(255) DEFAULT NULL,
  `caozuoxiangmu` varchar(255) DEFAULT NULL,
  `caozuoshijian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_opticket` VALUES('96','71','','B5840','25','逆变器','2016-03-02 15:21:37');
INSERT INTO `fn_content_1_opticket` VALUES('105','71','','33','12','低压','03/17/2016 00:00');
INSERT INTO `fn_content_1_opticket` VALUES('154','71','','AS4567','15','箱变','03/21/2016 15:23');
INSERT INTO `fn_content_1_opticket` VALUES('165','71','','77','1','4','03/30/2016 18:51');
INSERT INTO `fn_content_1_opticket` VALUES('192','71','','23','213','213','03/23/2016 10:07');

DROP TABLE IF EXISTS `fn_content_1_plant`;
CREATE TABLE `fn_content_1_plant` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_plantdata`;
CREATE TABLE `fn_content_1_plantdata` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `dianzhandanyuan` varchar(255) DEFAULT NULL,
  `shijian` bigint(10) DEFAULT NULL,
  `fadianliang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_powerplan`;
CREATE TABLE `fn_content_1_powerplan` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `fadianzuzhi` varchar(255) DEFAULT NULL,
  `jihualeixing` varchar(255) DEFAULT NULL,
  `fadianliang` varchar(255) DEFAULT NULL,
  `shangwang` varchar(255) DEFAULT NULL,
  `changyong` varchar(255) DEFAULT NULL,
  `gouwang` varchar(255) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_powerplan` VALUES('95','92','','','daily','150','222','428','357','');

DROP TABLE IF EXISTS `fn_content_1_quantitative`;
CREATE TABLE `fn_content_1_quantitative` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_role`;
CREATE TABLE `fn_content_1_role` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `jiaosemingcheng` varchar(255) DEFAULT NULL,
  `miaoshu` text,
  `jiaosezhuangtai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_run`;
CREATE TABLE `fn_content_1_run` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_sensor`;
CREATE TABLE `fn_content_1_sensor` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_staff`;
CREATE TABLE `fn_content_1_staff` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_todo`;
CREATE TABLE `fn_content_1_todo` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `zhixingren` varchar(255) DEFAULT NULL,
  `liuchengmingcheng` varchar(255) DEFAULT NULL,
  `chulihuanjie` varchar(255) DEFAULT NULL,
  `shenqingren` char(50) DEFAULT NULL,
  `chuangjianshijian` bigint(10) DEFAULT NULL,
  `renwuneirong` text,
  `renwulaiyuan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_todo` VALUES('79','40','测试一下','饶鹏','测试流程','环节1','饶鹏','1453360080','','');
INSERT INTO `fn_content_1_todo` VALUES('80','40','','暗暗','aaaa','','','1457748780','&lt;p&gt;123&lt;br /&gt;&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('97','40','','专工','','','专工','1459218360','&lt;p&gt;asd &lt;/p&gt;','');
INSERT INTO `fn_content_1_todo` VALUES('98','40','','专工','','','专工','1459218360','','');
INSERT INTO `fn_content_1_todo` VALUES('101','40','','专工','','','专工','0','&lt;p&gt;&lt;img src=&quot;/SolarKloud/uploadfiles/member/6/image/201603/1.png&quot; /&gt;&lt;/p&gt;','');
INSERT INTO `fn_content_1_todo` VALUES('113','40','','专工','12','12','专工','0','','2');
INSERT INTO `fn_content_1_todo` VALUES('114','40','','专工','1234','','专工','1457749140','&lt;p&gt;123455&lt;br /&gt;&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('115','40','','专工','12345','12','专工','1457749200','&lt;p&gt;123&lt;br /&gt;&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('122','45','','专工','a\'d\'f','a\'s\'d\'f','专工','1458009300','&lt;p&gt;s&amp;#39;f&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('123','45','','专工','aaa','顶顶顶','专工','1458009360','&lt;p&gt;唉唉唉&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('124','45','','专工','事实上','生生世世','专工','1458009600','&lt;p&gt;\r\n	是\r\n&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('125','45','','专工','实时','阿道夫','专工','1458009660','&lt;p&gt;\r\n	安防1\r\n&lt;/p&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('134','45','','专工','汇流箱巡检','','专工','1458093900','巡检#1~#5方阵汇流箱&lt;br /&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('135','45','','专工','逆变器巡检','','专工','1458096600','巡检#1~#5方阵逆变器&lt;br /&gt;','0');
INSERT INTO `fn_content_1_todo` VALUES('136','45','','专工','输出功率偏小','','专工','1458186900','系统输出功率偏小：达不到理想的输出功率','1');
INSERT INTO `fn_content_1_todo` VALUES('144','45','','ld','巡检','处理中','刘冬','1458288660','检测#15方阵逆变器','预警出来');
INSERT INTO `fn_content_1_todo` VALUES('145','45','','刘东','巡检','已处理','刘东','1458202380','检测#3逆变器','操作票');
INSERT INTO `fn_content_1_todo` VALUES('146','45','','专工','预警','预警中','专工','1458116100','#14逆变器预警','预警出来');
INSERT INTO `fn_content_1_todo` VALUES('147','45','','专工','逆变器屏幕没有显示','','专工','0','组件串联时，某一个接头没有接好。','巡检计划');
INSERT INTO `fn_content_1_todo` VALUES('148','45','','专工','操作票','操作中','专工','1457511420','#15逆变器操作','操作票');
INSERT INTO `fn_content_1_todo` VALUES('149','40','','专工','#1方阵逆变器效率过低','','专工','0','','预警出来');
INSERT INTO `fn_content_1_todo` VALUES('164','45','','专工','','','专工','0','','');
INSERT INTO `fn_content_1_todo` VALUES('166','40','','专工','45','45','专工','1458039060','45','');
INSERT INTO `fn_content_1_todo` VALUES('167','40','','专工','4545','45','专工','1459162260','45','');
INSERT INTO `fn_content_1_todo` VALUES('169','40','','专工','4521','12','专工','1458557520','12','');
INSERT INTO `fn_content_1_todo` VALUES('170','40','','专工','12','12','专工','1458557520','331','');
INSERT INTO `fn_content_1_todo` VALUES('171','40','','专工','213','458','专工','-1946898480','34','');
INSERT INTO `fn_content_1_todo` VALUES('172','40','','专工','69','8778','专工','1459248720','698','');
INSERT INTO `fn_content_1_todo` VALUES('173','40','','专工','867','867','专工','1458643920','678','');
INSERT INTO `fn_content_1_todo` VALUES('174','40','','专工','86','876','专工','-34511749680','687','');
INSERT INTO `fn_content_1_todo` VALUES('175','40','','专工','986','986','专工','1458643980','98','');
INSERT INTO `fn_content_1_todo` VALUES('176','40','','专工','96','897','专工','1458643980','8967','');

DROP TABLE IF EXISTS `fn_content_1_unit`;
CREATE TABLE `fn_content_1_unit` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_verify`;
CREATE TABLE `fn_content_1_verify` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `modelid` smallint(5) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tablename` char(30) NOT NULL,
  `updatetime` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `content` longtext NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `modelid` (`modelid`,`updatetime`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_verify` VALUES('44','21','11','0','127.0.0.1','沙发达省份大厦','content_1_troute','1404029694','3','a:17:{s:5:\"title\";s:21:\"沙发达省份大厦\";s:8:\"keywords\";s:0:\"\";s:5:\"thumb\";s:0:\"\";s:11:\"description\";s:0:\"\";s:7:\"content\";s:0:\"\";s:16:\"fn_add_introduce\";s:1:\"1\";s:19:\"fn_introcude_length\";s:3:\"200\";s:13:\"fn_auto_thumb\";s:1:\"1\";s:13:\"fn_down_image\";s:1:\"1\";s:5:\"catid\";s:2:\"21\";s:6:\"userid\";s:1:\"0\";s:6:\"sysadd\";s:1:\"0\";s:6:\"status\";s:1:\"3\";s:7:\"modelid\";s:2:\"11\";s:8:\"username\";s:9:\"127.0.0.1\";s:10:\"updatetime\";s:10:\"1404029693\";s:9:\"inputtime\";s:10:\"1404029693\";}');
INSERT INTO `fn_content_1_verify` VALUES('45','20','10','2','sino','泡货','content_1_tcargo','1404098382','3','a:18:{s:5:\"catid\";s:2:\"20\";s:5:\"title\";s:6:\"泡货\";s:7:\"chexing\";a:1:{i:0;s:3:\"c01\";}s:8:\"chechang\";a:1:{i:0;s:3:\"6.8\";}s:7:\"chufadi\";s:3:\"931\";s:6:\"mudedi\";s:3:\"931\";s:12:\"chufashijian\";s:10:\"1401638400\";s:12:\"daodashijian\";s:10:\"1401984000\";s:9:\"lianxiren\";s:6:\"饶鹏\";s:13:\"lianxifangshi\";s:11:\"13908766653\";s:7:\"content\";s:0:\"\";s:6:\"userid\";s:1:\"2\";s:6:\"sysadd\";s:1:\"0\";s:6:\"status\";s:1:\"3\";s:7:\"modelid\";s:2:\"10\";s:8:\"username\";s:4:\"sino\";s:10:\"updatetime\";s:10:\"1404098382\";s:9:\"inputtime\";s:10:\"1404098382\";}');

DROP TABLE IF EXISTS `fn_content_1_work`;
CREATE TABLE `fn_content_1_work` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `gongzuofuzeren` varchar(255) DEFAULT NULL,
  `danwei` varchar(255) DEFAULT NULL,
  `banzuzuoyexiaozu` varchar(255) DEFAULT NULL,
  `gongzuochengyuan` varchar(255) DEFAULT NULL,
  `renyuanshuliang` int(10) DEFAULT NULL,
  `gongzuorenwu` varchar(255) DEFAULT NULL,
  `gongzuodidian` varchar(255) DEFAULT NULL,
  `guanlianshebei` varchar(255) DEFAULT NULL,
  `jihuagongzuoshijian` bigint(10) DEFAULT NULL,
  `yingcaiqucuoshi` text,
  `yicaiquanquancuoshi` text,
  `yingcaiqugerenanquan` text,
  `yicaiqugerenanquan` text,
  `tourujiedidaozha` text,
  `shezhiduanluxian` text,
  `anquanzhelan` text,
  `anquansheng` text,
  `zhongyaoweixiandian` text,
  `daiyashebei` text,
  `gongzuopiaoqianfaren` varchar(255) DEFAULT NULL,
  `workticketsubmittime` bigint(10) DEFAULT NULL,
  `gongzuopiaofuzeren` varchar(255) DEFAULT NULL,
  `jieshoushijian` bigint(10) DEFAULT NULL,
  `yunxingzhibanfuzeren` varchar(255) DEFAULT NULL,
  `jianxiupizhunshijian` bigint(10) DEFAULT NULL,
  `zhibanchang` varchar(255) DEFAULT NULL,
  `xukekaigongshijian` bigint(10) DEFAULT NULL,
  `gongzuoxukeren` varchar(255) DEFAULT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `kaishishijian` bigint(10) DEFAULT NULL,
  `jieshushijian` bigint(10) DEFAULT NULL,
  `chuangjianshijian` bigint(10) DEFAULT NULL,
  `liuchengzhuangtai` varchar(255) DEFAULT NULL,
  `gaojing` varchar(255) DEFAULT NULL,
  `jianxiujiaodai` text,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_worksheet2`;
CREATE TABLE `fn_content_1_worksheet2` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `bianhao` varchar(255) DEFAULT NULL,
  `gongzuofuzeren` varchar(255) DEFAULT NULL,
  `kaishishijian` varchar(255) DEFAULT NULL,
  `jieshushijian` varchar(255) DEFAULT NULL,
  `gongzuorenwu` varchar(255) DEFAULT NULL,
  `chuangjianshijian` varchar(255) DEFAULT NULL,
  `liuchengzhuangtai` varchar(255) DEFAULT NULL,
  `gaojing` varchar(255) DEFAULT NULL,
  `jianxiujiaodai` text,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_content_1_worktemplate`;
CREATE TABLE `fn_content_1_worktemplate` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `moban` text,
  `mobanmingcheng` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_worktemplate` VALUES('179','128','','&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-size:22.0pt;line-height:125%;font-family:黑体;&quot;&gt;光伏电站第一种工作票&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-family:黑体;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;单位：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;编号：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作负责人（监护人）：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;b&gt;&lt;span style=&quot;font-size:18.0pt;line-height:125%;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;班组：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作班人员（不包括工作负责人）：&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;line-height:125%;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;line-height:125%;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．&lt;/span&gt;&lt;span style=&quot;line-height:125%;font-family:宋体;&quot;&gt;工作的光伏电站名称、子系统编号及线路段名称等&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;4&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作任务&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; width=&quot;540&quot; style=&quot;width:405.0pt;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;271&quot; style=&quot;border:1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;text-indent:10.5pt;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作地点及设备&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;双重名称&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;269&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作内容&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;271&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;269&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;271&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;269&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;5&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．计划工作时间：自&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt; &lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:89.25pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;至&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;6&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．安全措施（必要时可附页绘图说明）&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;应拉断路器（开关）、隔离开关（刀闸）&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;已执行&lt;/span&gt;&lt;span&gt;*&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;应装接地线、应合接地刀闸（注明确实地点、名称及接地线编号）&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;已执行&lt;/span&gt;&lt;span&gt;*&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;应设遮拦、应挂标示牌及防止二次回路误碰等措施&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;已执行&lt;/span&gt;&lt;span&gt;*&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;403&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;165&quot; valign=&quot;top&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;已执行栏目及接地线编号由工作许可人填写。&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;288&quot; style=&quot;border:1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作地点保留带电部分或注意事项&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;（由工作票签发人填写）：&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;252&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;补充工作地点保留带电部分或注意事项（由工作许可人填写）：&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;288&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;252&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;288&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;252&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作票签发人签名：&lt;/span&gt;&lt;u&gt; &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;签发日期：&lt;/span&gt;&lt;u&gt; &lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;7&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．收到工作票时间：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:15.75pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;站长（值班负责人）签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;8&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．确认本工作票&lt;/span&gt;&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;～&lt;/span&gt;&lt;span&gt;7&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:15.75pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:15.75pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;许可开始工作时间：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;9&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工负责人变动情况&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;原工作负责人：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;离去，变更&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;为工作负责人&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;备注：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作票签发人：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:15.75pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人签名&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;10&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作票延期&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;有效期延长到&lt;/span&gt; &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人签名&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人签名&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;11&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．每日开工和收工时间（使用一天的工作票不必填写）&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable&quot; border=&quot;1&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;border:none;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;158&quot; colspan=&quot;4&quot; style=&quot;border:1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;收工时间&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;57&quot; rowspan=&quot;2&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;57&quot; rowspan=&quot;2&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;149&quot; colspan=&quot;4&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;开工时间&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;60&quot; rowspan=&quot;2&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;60&quot; rowspan=&quot;2&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;36&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;36&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;49&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;时&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;分&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;时&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;38&quot; style=&quot;border:solid windowtext 1.0pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-family:宋体;&quot;&gt;分&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;36&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;36&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;49&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;57&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;57&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;37&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;38&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;60&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;60&quot; style=&quot;border:solid windowtext 1.5pt;&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;12&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作终结&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;全部工作于&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;结束，设备及安全措施已恢复开工前状态，工作人员已全部撤离，材料工具已清理完毕，工作已终结。&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作负责人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;13&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．工作票终结&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;临时遮栏、标示牌已拆除，常设遮栏已恢复。未拆除或未拉开的接地线编号&lt;/span&gt; &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;等共&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;组、接地刀闸（小车）共&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;副（台），已汇报值班负责人。&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;工作许可人签名：&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;14&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．备注&lt;/span&gt;&lt;u&gt;&lt;span&gt;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;（&lt;/span&gt;&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;）指定专责监护人&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;负责监护&lt;/span&gt;&lt;u&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size:14.0pt;line-height:125%;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size:18.0pt;line-height:125%;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size:14.0pt;line-height:125%;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size:18.0pt;line-height:125%;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;（地点及具体工作）&lt;/span&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:宋体;&quot;&gt;（&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;）其他事项&lt;/span&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size:18.0pt;line-height:125%;font-family:宋体;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/b&gt;&lt;span&gt;&lt;/span&gt;\r\n&lt;/p&gt;','电气一种工作票');
INSERT INTO `fn_content_1_worktemplate` VALUES('180','128','','&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n	&lt;b&gt;&lt;span style=&quot;font-size:18.0pt;font-family:仿宋_GB2312;&quot;&gt;电气第二种工作票&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/b&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span&gt;&amp;nbsp;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;单位：&lt;u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;编号：&lt;u&gt; &amp;nbsp;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作负责人（监护人）：&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;班组：&lt;u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作班成员（不包括工作负责人）&lt;span&gt; &lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;共 &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;人&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作设备名称&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;4&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作任务&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;table class=&quot;MsoNormalTable ke-zeroborder&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse:collapse;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作地点或地段&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot; align=&quot;center&quot; style=&quot;text-align:center;&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作内容&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;355&quot; valign=&quot;top&quot;&gt;\r\n				&lt;p class=&quot;MsoNormal&quot;&gt;\r\n					&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&lt;/span&gt;\r\n				&lt;/p&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;5&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．计划工作时间：自 &lt;u&gt;&amp;nbsp;&amp;nbsp;年 月 日 时\r\n分 &lt;/u&gt;&amp;nbsp;至 &lt;u&gt;&amp;nbsp;&amp;nbsp;年 &amp;nbsp;月 日 时 分&lt;span&gt; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作条件（停电或不停电，或邻近及保留带电设备名称）&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．注意事项（安全措施）&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作票签发人签名：&lt;u&gt; &amp;nbsp;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;签发日期：&lt;u&gt;&lt;span&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分 &lt;/u&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:414.0pt;&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:仿宋_GB2312;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．补充安全措施（工作许可人填写）&lt;/span&gt;&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;9&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．确认本工作票&lt;span&gt;1&lt;/span&gt;—&lt;span&gt;8&lt;/span&gt;项&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作负责人签名：&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作许可人签名：&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;许可工作时间：&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．确认工作负责人布置的工作任务和安全措施，工作班人员签名：&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;11&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作票延期&lt;/span&gt;&lt;u&gt;&lt;span style=&quot;font-size:12.0pt;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:11.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;有效期延长到&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&lt;u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/u&gt;&lt;/span&gt;&lt;u&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;/u&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:18.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作负责人签名： &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/u&gt;&lt;/span&gt;&lt;u&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:18.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作许可人签名： &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/u&gt;&lt;/span&gt;&lt;u&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．工作票终结&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:24.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;全部工作于&lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分 &lt;/u&gt;&amp;nbsp;结束，工作人员已全部撤离，材料工具已清理完毕。&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:18.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作负责人签名： &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/u&gt;&lt;/span&gt;&lt;u&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:18.0pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;工作许可人签名： &lt;u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/u&gt;&lt;/span&gt;&lt;u&gt;年&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;月&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;日&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;时&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;分&lt;span&gt;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;13&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt;font-family:宋体;&quot;&gt;．备注&lt;span&gt;&lt;/span&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:11.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:11.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;u&gt;&lt;span style=&quot;font-size:11.0pt;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/u&gt;\r\n&lt;/p&gt;\r\n&lt;u&gt;&lt;span style=&quot;font-size:11.0pt;font-family:宋体;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/u&gt;&lt;br /&gt;','电气二种工作票');

DROP TABLE IF EXISTS `fn_content_1_workticket`;
CREATE TABLE `fn_content_1_workticket` (
  `id` int(10) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `content` mediumtext NOT NULL,
  `gongzuoneirong` varchar(255) DEFAULT NULL,
  `kaipiaoren` varchar(255) DEFAULT NULL,
  `kaipiaoshijian` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_content_1_workticket` VALUES('168','103','','','刘东','1458557520');
INSERT INTO `fn_content_1_workticket` VALUES('178','103','','','hht','1458609240');

DROP TABLE IF EXISTS `fn_favorite`;
CREATE TABLE `fn_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `contentid` int(10) NOT NULL,
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`),
  KEY `userid` (`userid`),
  KEY `site` (`site`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_form`;
CREATE TABLE `fn_form` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_form_1_answer`;
CREATE TABLE `fn_form_1_answer` (
  `id` int(10) NOT NULL,
  `cid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_form_1_audit`;
CREATE TABLE `fn_form_1_audit` (
  `id` int(10) NOT NULL,
  `cid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_gbook`;
CREATE TABLE `fn_gbook` (
  `id` smallint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) NOT NULL,
  `r_name` varchar(100) NOT NULL,
  `r_content` text NOT NULL,
  `r_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_ip`;
CREATE TABLE `fn_ip` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `addtime` bigint(10) NOT NULL,
  `endtime` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_link`;
CREATE TABLE `fn_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`,`listorder`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_linkage`;
CREATE TABLE `fn_linkage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `idx` varchar(30) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `arrchilds` text COMMENT '下级所有id',
  `keyid` int(5) DEFAULT '0',
  `listorder` int(10) DEFAULT '0',
  `pids` varchar(1023) DEFAULT NULL COMMENT '所有上级id',
  `cpid` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list` (`site`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

INSERT INTO `fn_linkage` VALUES('1','0','设备参数','','','0','0','','0','1','','');
INSERT INTO `fn_linkage` VALUES('2','0','联动02','','','0','0','','0','2','','');
INSERT INTO `fn_linkage` VALUES('3','0','联动03','','','0','0','','0','3','','');
INSERT INTO `fn_linkage` VALUES('4','0','联动04','','','0','0','','0','4','','');
INSERT INTO `fn_linkage` VALUES('5','0','联动05','','','0','0','','0','5','','');
INSERT INTO `fn_linkage` VALUES('6','0','联动06','','','0','0','','0','6','','');
INSERT INTO `fn_linkage` VALUES('7','0','联动07','','','0','0','','0','10','','');
INSERT INTO `fn_linkage` VALUES('8','0','联动08','','','0','0','','0','7','','');
INSERT INTO `fn_linkage` VALUES('9','0','联动09','','','0','0','','0','8','','');
INSERT INTO `fn_linkage` VALUES('10','0','联动10','','','0','0','','0','9','','');
INSERT INTO `fn_linkage` VALUES('11','1','逆变器','inverter','','0','1','','1','0','','');
INSERT INTO `fn_linkage` VALUES('12','1','汇流箱','junction','','0','1','','1','0','','');
INSERT INTO `fn_linkage` VALUES('13','1','箱变','box','','0','1','','1','0','','');
INSERT INTO `fn_linkage` VALUES('14','1','站变','station','','0','1','','1','0','','');
INSERT INTO `fn_linkage` VALUES('15','1','太阳能面板','solarboard','','0','1','','1','0','','');
INSERT INTO `fn_linkage` VALUES('16','1','直流电流','zldl','A|0','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('17','1','直流电压','zldy','V|0','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('18','1','电网频率','dwpl','Hz|0','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('19','1','输入功率','srgl','KW|2','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('20','1','输出功率','scgl','KW|2','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('21','1','环境温度','hjwd','°C|2','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('22','1','当日发电量','drfdl','Kwh|2','11','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('23','1','直流电流','zldl|A|0','A|0','12','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('24','1','直流电压','zldy|V|0','V|0','12','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('25','1','直流电流','zldl|A|0','A|0','13','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('26','1','直流电压','zldy|V|0','V|0','13','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('27','1','直流电流','zldl|A|0','A|0','14','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('28','1','直流电压','zldy|V|0','V|0','14','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('29','1','直流电流','zldl|A|0','A|0','15','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('30','1','直流电压','zldy|V|0','V|0','15','0','','1','0','','');
INSERT INTO `fn_linkage` VALUES('31','1','当日发电量','drfdl|Kwh|2','Kwh|2','15','0','','1','0','','');

DROP TABLE IF EXISTS `fn_member`;
CREATE TABLE `fn_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `salt` char(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `groupid` smallint(5) NOT NULL DEFAULT '1',
  `modelid` smallint(5) NOT NULL,
  `credits` int(10) NOT NULL,
  `regdate` bigint(10) unsigned NOT NULL DEFAULT '0',
  `regip` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `randcode` varchar(32) NOT NULL,
  `lastloginip` varchar(15) NOT NULL,
  `lastlogintime` bigint(10) NOT NULL,
  `loginip` varchar(15) NOT NULL,
  `logintime` bigint(10) NOT NULL,
  `spacestatus` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`),
  KEY `status` (`status`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `fn_member` VALUES('5','ld','96ab0d97ae99b665199096250cdfd6c1','7fe1f8abaa','rao@shenku.net','','','5','33','0','1452489611','192.168.1.122','1','','','1452490287','','1452491988','0');
INSERT INTO `fn_member` VALUES('6','zg','9c59523402235ff2eef4da7f8f773fba','19bc916108','zg@shenku.net','专工','','3','37','0','1452489633','192.168.1.122','1','','','1458722161','','1458722699','0');

DROP TABLE IF EXISTS `fn_member_count`;
CREATE TABLE `fn_member_count` (
  `id` mediumint(8) NOT NULL,
  `post` mediumint(5) NOT NULL,
  `dpost` text,
  `pms` mediumint(5) NOT NULL,
  `updatetime` bigint(10) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_member_count` VALUES('1','0','','0','1402814495');
INSERT INTO `fn_member_count` VALUES('6','9','{\"78\":1}','0','1458693909');
INSERT INTO `fn_member_count` VALUES('5','0','','0','1452490294');

DROP TABLE IF EXISTS `fn_member_extend_alarmmsg`;
CREATE TABLE `fn_member_extend_alarmmsg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `touserid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  `verify` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `userid` (`userid`),
  KEY `touserid` (`touserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_member_extend_opmsg`;
CREATE TABLE `fn_member_extend_opmsg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `touserid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  `verify` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `userid` (`userid`),
  KEY `touserid` (`touserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_member_extend_workmsg`;
CREATE TABLE `fn_member_extend_workmsg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `touserid` mediumint(8) NOT NULL,
  `userid` mediumint(8) NOT NULL,
  `username` char(20) NOT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(20) DEFAULT NULL,
  `verify` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `userid` (`userid`),
  KEY `touserid` (`touserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_member_group`;
CREATE TABLE `fn_member_group` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `modelid` smallint(5) DEFAULT NULL,
  `credits` mediumint(8) NOT NULL,
  `allowpost` mediumint(8) NOT NULL,
  `allowpms` mediumint(8) NOT NULL,
  `allowattachment` tinyint(1) NOT NULL,
  `postverify` tinyint(1) NOT NULL,
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `filesize` smallint(5) NOT NULL,
  `listorder` tinyint(3) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `setting` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `fn_member_group` VALUES('1','新手上路','15','0','3','1','0','1','1','5','0','0','');
INSERT INTO `fn_member_group` VALUES('3','高级专工','37','50','10','0','1','0','1','20','0','0','{\"assets\":[\"view\"],\"130\":[\"view\"],\"44\":[\"view\"],\"45\":[\"view\",\"delete\",\"edit\",\"add\"],\"40\":[\"view\",\"add\",\"delete\",\"edit\"],\"92\":[\"view\",\"add\",\"delete\",\"edit\"],\"53\":[\"view\"],\"100\":[\"view\",\"add\",\"delete\",\"edit\"],\"43\":[\"view\",\"add\",\"edit\",\"delete\"],\"104\":[\"view\",\"add\",\"delete\",\"edit\"],\"57\":[\"view\"],\"93\":[\"view\"],\"94\":[\"view\"],\"95\":[\"view\"],\"62\":[\"view\"],\"88\":[\"view\"],\"66\":[\"view\",\"add\",\"delete\",\"edit\"],\"47\":[\"view\"],\"128\":[\"view\",\"add\",\"delete\",\"edit\"],\"103\":[\"view\",\"add\",\"edit\",\"delete\"],\"99\":[\"view\"],\"96\":[\"view\"],\"98\":[\"view\"],\"64\":[\"view\"],\"129\":[\"view\",\"add\",\"delete\",\"edit\"],\"71\":[\"view\",\"add\",\"delete\",\"edit\"],\"65\":[\"view\"],\"126\":[\"view\",\"add\",\"delete\",\"edit\"],\"127\":[\"view\",\"add\",\"delete\",\"edit\"],\"75\":[\"view\",\"edit\"],\"106\":[\"view\",\"add\",\"delete\",\"edit\"],\"89\":[\"view\"],\"90\":[\"view\"],\"109\":[\"view\"],\"110\":[\"view\"],\"112\":[\"view\"],\"113\":[\"view\"],\"108\":[\"view\"],\"123\":[\"view\"],\"54\":[\"view\"],\"124\":[\"view\",\"add\",\"delete\",\"edit\"],\"125\":[\"view\",\"add\",\"delete\",\"edit\"],\"79\":[\"view\"]}');
INSERT INTO `fn_member_group` VALUES('4','分厂领导','33','100','12','0','1','0','1','0','0','0','{\"31\":{\"allowview\":\"1\",\"allowpost\":\"0\"},\"30\":{\"allowview\":\"1\",\"allowpost\":\"0\"}}');
INSERT INTO `fn_member_group` VALUES('5','集团领导','33','200','100','100','1','0','1','0','0','0','{\"31\":{\"allowview\":\"1\",\"allowpost\":\"0\"},\"30\":{\"allowview\":\"1\",\"allowpost\":\"0\"}}');

DROP TABLE IF EXISTS `fn_member_manager`;
CREATE TABLE `fn_member_manager` (
  `id` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_member_manager` VALUES('5');

DROP TABLE IF EXISTS `fn_member_pms`;
CREATE TABLE `fn_member_pms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sendname` varchar(30) NOT NULL DEFAULT '',
  `sendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toname` varchar(30) NOT NULL DEFAULT '',
  `toid` mediumint(8) NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `sendtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `hasview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `senddel` mediumint(8) NOT NULL,
  `todel` mediumint(8) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `sendtime` (`sendtime`),
  KEY `sendid` (`sendid`),
  KEY `hasview` (`hasview`),
  KEY `isadmin` (`isadmin`),
  KEY `toid` (`toid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_member_roster`;
CREATE TABLE `fn_member_roster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `group` varchar(60) NOT NULL DEFAULT '',
  `content` text,
  `myid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `isfav` tinyint(4) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sendid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `fn_member_roster` VALUES('1','2','sino','admin','哈哈哈','沙发沙发','0','','','');
INSERT INTO `fn_member_roster` VALUES('2','0','sino','赛络','','','4','','0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `fn_member_roster` VALUES('3','0','dagong','大公物流','','','2','','0000-00-00 00:00:00','0000-00-00 00:00:00');

DROP TABLE IF EXISTS `fn_member_workereletronic`;
CREATE TABLE `fn_member_workereletronic` (
  `id` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fn_member_workereletronic` VALUES('6');

DROP TABLE IF EXISTS `fn_model`;
CREATE TABLE `fn_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `typeid` tinyint(3) NOT NULL,
  `modelname` char(30) NOT NULL,
  `tablename` varchar(30) NOT NULL,
  `categorytpl` varchar(30) NOT NULL,
  `listtpl` varchar(30) NOT NULL,
  `showtpl` varchar(30) NOT NULL,
  `joinid` smallint(5) DEFAULT NULL,
  `setting` text,
  `listorder` int(5) NOT NULL DEFAULT '0',
  `modelcode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`modelid`),
  KEY `typeid` (`typeid`),
  KEY `site` (`site`),
  KEY `joinid` (`joinid`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

INSERT INTO `fn_model` VALUES('73','1','1','发电计划','content_1_powerplan','_powerplan_category.html','_powerplan_list.html','_powerplan_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','1','powerplan');
INSERT INTO `fn_model` VALUES('29','1','1','设备台账','content_1_eqlist','_eqlist_category.html','_eqlist_list.html','_eqlist_show.html','0','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\",\"default\":[]}','32','eqlist');
INSERT INTO `fn_model` VALUES('27','1','1','缺陷管理','content_1_defect','_defect_category.html','_defect_list.html','_defect_show.html','0','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\",\"default\":[]}','0','defect');
INSERT INTO `fn_model` VALUES('40','1','3','审核','form_1_audit','_audit_category.html','_audit_list.html','_audit_show.html','','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\"}','1','audit');
INSERT INTO `fn_model` VALUES('35','1','4','操作票消息','member_extend_opmsg','post_opmsg.html','_opmsg_list.html','_opmsg_show.html','','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\"}','2','opmsg');
INSERT INTO `fn_model` VALUES('46','1','1','集团级实施监视','content_1_monitoring','_monitoring_category.html','_monitoring_list.html','_monitoring_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','80','monitoring');
INSERT INTO `fn_model` VALUES('33','1','2','管理层','member_manager','category_manager.html','list_manager.html','show_manager.html','','','1','manager');
INSERT INTO `fn_model` VALUES('72','1','1','发电数据','content_1_plantdata','_plantdata_category.html','_plantdata_list.html','_plantdata_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','0','plantdata');
INSERT INTO `fn_model` VALUES('77','1','1','运行记录','content_1_dailyrecord','_dailyrecord_category.html','_dailyrecord_list.html','_dailyrecord_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','0','dailyrecord');
INSERT INTO `fn_model` VALUES('41','1','3','回单','form_1_answer','_answer_category.html','_answer_list.html','_answer_show.html','','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\"}','2','answer');
INSERT INTO `fn_model` VALUES('36','1','4','工作票消息','member_extend_workmsg','post_workmsg.html','_workmsg_list.html','_workmsg_show.html','','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"}}','3','workmsg');
INSERT INTO `fn_model` VALUES('37','1','2','专工','member_workereletronic','category_workereletronic.html','list_workereletronic.html','show_workereletronic.html','','','3','workereletronic');
INSERT INTO `fn_model` VALUES('23','1','1','工作事项','content_1_todo','_todo_category.html','_todo_list.html','_todo_show.html','0','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\",\"default\":[]}','0','todo');
INSERT INTO `fn_model` VALUES('24','1','1','预警管理','content_1_alarm','_alarm_category.html','_alarm_list.html','_alarm_show.html','0','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\",\"default\":[]}','222','alarm');
INSERT INTO `fn_model` VALUES('74','1','1','值班表','content_1_duty','_duty_category.html','_duty_list.html','_duty_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','12','duty');
INSERT INTO `fn_model` VALUES('34','1','4','报警消息','member_extend_alarmmsg','post_alarmmsg.html','_alarmmsg_list.html','_alarmmsg_show.html','','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\"}','1','alarmmsg');
INSERT INTO `fn_model` VALUES('42','1','1','排班表','content_1_dailyplan','_dailyplan_category.html','_dailyplan_list.html','_dailyplan_show.html','0','{\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"isnewsmodel\":\"0\",\"default\":[]}','20','dailyplan');
INSERT INTO `fn_model` VALUES('78','1','1','设备型号','content_1_eqmodel','_eqmodel_category.html','_eqmodel_list.html','_eqmodel_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','30','eqdetails');
INSERT INTO `fn_model` VALUES('82','1','1','工作票模板','content_1_worktemplate','_worktemplate_category.html','_worktemplate_list.html','_worktemplate_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','0','worktemplate');
INSERT INTO `fn_model` VALUES('48','1','1','传感器状态监测','content_1_sensor','_sensor_category.html','_sensor_list.html','_sensor_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','1000','sensor');
INSERT INTO `fn_model` VALUES('76','1','1','工作票','content_1_workticket','_workticket_category.html','_workticket_list.html','_workticket_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','11','workticket');
INSERT INTO `fn_model` VALUES('51','1','1','运行指标管理','content_1_run','_run_category.html','_run_list.html','_run_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','68','run');
INSERT INTO `fn_model` VALUES('52','1','1','经营指标管理','content_1_business','_business_category.html','_business_list.html','_business_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','69','business');
INSERT INTO `fn_model` VALUES('53','1','1','能耗指标管理','content_1_consumption','_consumption_category.html','_consumption_list.html','_consumption_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','64','consumption');
INSERT INTO `fn_model` VALUES('54','1','1','电站损失量化分析','content_1_quantitative','_quantitative_category.html','_quantitative_list.html','_quantitative_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','61','quantitative');
INSERT INTO `fn_model` VALUES('55','1','1','低效发电单元分析','content_1_unit','_unit_category.html','_unit_list.html','_unit_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','62','unit');
INSERT INTO `fn_model` VALUES('56','1','1','班组运维统计','content_1_operational','_operational_category.html','_operational_list.html','_operational_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','63','operational');
INSERT INTO `fn_model` VALUES('57','1','1','对标管理','content_1_benchmarking','_benchmarking_category.html','_benchmarking_list.html','_benchmarking_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','24','benchmarking');
INSERT INTO `fn_model` VALUES('58','1','1','电气工作票1','content_1_work','_work_category.html','_work_list.html','_work_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','25','work');
INSERT INTO `fn_model` VALUES('59','1','1','电气工作票2','content_1_worksheet2','_worksheet_category.html','_worksheet_list.html','_worksheet_show.html','0','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','26','worksheet');
INSERT INTO `fn_model` VALUES('61','1','1','操作票','content_1_opticket','__category.html','__list.html','__show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','29','opticket');
INSERT INTO `fn_model` VALUES('64','1','1','设备评估','content_1_evaluation','_evaluation_category.html','_evaluation_list.html','_evaluation_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','32','evaluation');
INSERT INTO `fn_model` VALUES('66','1','1','电站管理','content_1_plant','_plant_category.html','_plant_list.html','_plant_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','34','plant');
INSERT INTO `fn_model` VALUES('67','1','1','角色管理','content_1_role','_role_category.html','_role_list.html','_role_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','35','role');
INSERT INTO `fn_model` VALUES('68','1','1','员工管理','content_1_staff','_staff_category.html','_staff_list.html','_staff_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','37','staff');
INSERT INTO `fn_model` VALUES('83','1','1','操作票模板','content_1_optemplate','_optemplate_category.html','_optemplate_list.html','_optemplate_show.html','','{\"isnewsmodel\":\"0\",\"auth\":{\"adminpost\":\"0\",\"verifypost\":\"0\"},\"default\":[]}','28','optemplate');

DROP TABLE IF EXISTS `fn_model_field`;
CREATE TABLE `fn_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `fgroup` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(15) NOT NULL,
  `length` char(10) NOT NULL,
  `indexkey` varchar(10) NOT NULL,
  `isshow` tinyint(1) NOT NULL,
  `tips` text NOT NULL,
  `not_null` tinyint(1) NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

INSERT INTO `fn_model_field` VALUES('108','27','content','','缺陷描述','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','100','1');
INSERT INTO `fn_model_field` VALUES('253','73','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('110','29','content','','备注','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','100','1');
INSERT INTO `fn_model_field` VALUES('201','29','shebeimingcheng','','设备名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','7','0');
INSERT INTO `fn_model_field` VALUES('175','46','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('259','73','changyong','','计划厂用电量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','6','0');
INSERT INTO `fn_model_field` VALUES('165','27','faxianren','','发现人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','2','0');
INSERT INTO `fn_model_field` VALUES('166','27','faxianshijian','','发现时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','3','0');
INSERT INTO `fn_model_field` VALUES('167','27','quexianjibie','','缺陷级别','VARCHAR','255','','1','','0','','','select','{\"content\":\"一般|0\r\n重要|1\r\n严重|2\",\"default\":\"0\"}','4','0');
INSERT INTO `fn_model_field` VALUES('168','27','chulijieguo','','处理结果','','','','1','','0','','','editor','{\"width\":\"99\",\"height\":\"60\",\"type\":\"0\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('169','27','liuchengzhuangtai','','流程状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"待处理|0\r\n处理中|1\r\n已处理|2\",\"default\":\"0\"}','6','0');
INSERT INTO `fn_model_field` VALUES('170','27','gaojing','','告警','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','7','0');
INSERT INTO `fn_model_field` VALUES('282','74','banci','','班次','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('254','73','fadianzuzhi','','发电组织','VARCHAR','255','','1','','0','','','linkage','{\"id\":\"1157\",\"level\":\"3\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('283','74','zhibanzhuangtai','','值班状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"值班中|onduty\r\n下班中|afterwork\",\"default\":\"值班中|onduty\"}','5','0');
INSERT INTO `fn_model_field` VALUES('257','73','fadianliang','','计划发电量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('310','73','shijian','','时间','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('255','73','jihualeixing','','计划类型','VARCHAR','255','','1','','0','','','radio','{\"content\":\"年计划|year\r\n月计划|month\r\n日计划|daily\",\"default\":\"daily\"}','2','0');
INSERT INTO `fn_model_field` VALUES('280','74','jiebanshijian','','接班时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','2','0');
INSERT INTO `fn_model_field` VALUES('279','74','jiebanzhichang','','接班值长','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('258','73','shangwang','','计划上网电量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('206','58','gongzuofuzeren','','工作负责人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','2','0');
INSERT INTO `fn_model_field` VALUES('365','29','cpid','','cpid','VARCHAR','50','','0','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('204','29','shebeileibie','','设备类别','VARCHAR','255','','1','','0','','','linkage','{\"id\":\"1\",\"level\":\"1\",\"default\":\"11\"}','3','0');
INSERT INTO `fn_model_field` VALUES('126','42','content','','备注','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','10','0');
INSERT INTO `fn_model_field` VALUES('127','24','jibie','','级别','VARCHAR','255','','1','','0','','','select','{\"content\":\"重要\r\n中等\r\n一般\",\"default\":\"重要\"}','1','0');
INSERT INTO `fn_model_field` VALUES('135','24','gaojingqueren','','告警确认','VARCHAR','10','','1','','0','','','radio','{\"content\":\"已确认|1\r\n未确认|0\",\"default\":\"0\"}','2','0');
INSERT INTO `fn_model_field` VALUES('129','24','fashengshijian','','发生时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','3','0');
INSERT INTO `fn_model_field` VALUES('130','24','huifushijian','','恢复时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','4','0');
INSERT INTO `fn_model_field` VALUES('131','24','suozaichangzhan','','所在厂站','VARCHAR','255','','1','','0','','','select','{\"content\":\"金伏麻城中驿馆\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('132','24','jiange','','间隔','VARCHAR','255','','1','','0','','','select','{\"content\":\"#1集电线路\r\n#2集电线路\r\n#3集电线路\r\n#4集电线路\r\n#5集电线路\r\n#6集电线路\r\n#7集电线路\",\"default\":\"#1集电线路\"}','6','0');
INSERT INTO `fn_model_field` VALUES('133','24','shebei','','设备','VARCHAR','255','','1','','0','','','linkage','{\"id\":\"1157\",\"level\":\"3\",\"default\":\"1163\"}','7','0');
INSERT INTO `fn_model_field` VALUES('134','24','leixing','','类型','VARCHAR','255','','1','','0','','','select','{\"content\":\"自检\r\n巡检\",\"default\":\"\"}','8','0');
INSERT INTO `fn_model_field` VALUES('136','23','zhixingren','','执行人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','1','0');
INSERT INTO `fn_model_field` VALUES('137','23','liuchengmingcheng','','流程名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('138','23','chulihuanjie','','处理环节','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('139','23','shenqingren','','申请人','CHAR','50','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','6','0');
INSERT INTO `fn_model_field` VALUES('140','23','chuangjianshijian','','创建时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','7','0');
INSERT INTO `fn_model_field` VALUES('354','78','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('377','29','suoshudianzhan','','所属电站','VARCHAR','255','','1','','0','','','assets','{\"id\":\"1\",\"level\":\"3\",\"default\":\"2\"}','2','0');
INSERT INTO `fn_model_field` VALUES('104','23','content','','任务内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"100\",\"type\":\"0\",\"default\":\"\"}','100','1');
INSERT INTO `fn_model_field` VALUES('105','24','content','','内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','10','0');
INSERT INTO `fn_model_field` VALUES('200','29','shebeibianhao','','设备编号','VARCHAR','255','','1','','1','','','input','{\"size\":\"150\",\"default\":\"\"}','6','0');
INSERT INTO `fn_model_field` VALUES('172','23','renwuneirong','','任务内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"100\",\"type\":\"0\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('177','48','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('180','51','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('181','52','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('182','53','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('183','54','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('184','55','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('185','56','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('186','57','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('187','58','content','','内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','0','1');
INSERT INTO `fn_model_field` VALUES('188','59','content','','内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','0','1');
INSERT INTO `fn_model_field` VALUES('190','61','content','','内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','0','1');
INSERT INTO `fn_model_field` VALUES('366','29','parentid','','parentid','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('193','64','content','','内容','','','','1','','0','','','editor','','0','1');
INSERT INTO `fn_model_field` VALUES('195','66','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('196','67','content','','内容','','','','1','','0','','','editor','','0','1');
INSERT INTO `fn_model_field` VALUES('197','68','content','','内容','','','','1','','0','','','editor','','0','0');
INSERT INTO `fn_model_field` VALUES('219','58','danwei','','单位','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('276','74','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('281','74','jiaobanshijian','','交班时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','3','0');
INSERT INTO `fn_model_field` VALUES('221','58','banzuzuoyexiaozu','','班组/作业小组','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('222','58','gongzuochengyuan','','工作成员','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('223','58','renyuanshuliang','','人员数量','INT','10','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('224','58','gongzuorenwu','','工作任务','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','5','0');
INSERT INTO `fn_model_field` VALUES('225','58','gongzuodidian','','工作地点','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('226','58','guanlianshebei','','关联设备','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('227','58','jihuagongzuoshijian','','计划工作时间','','','','0','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','0','0');
INSERT INTO `fn_model_field` VALUES('228','58','yingcaiqucuoshi','','应采取措施（工作人员填写）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('229','58','yicaiquanquancuoshi','','已采取安全措施（许可人填写）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('230','58','yingcaiqugerenanquan','','应采取个人安全措施（工作人员填写）','VARCHAR','255','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('231','58','yicaiqugerenanquan','','已采取个人安全技术措施（许可人填写）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('232','58','tourujiedidaozha','','应装设接地线/投入接地刀闸/设置短路线','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('233','58','shezhiduanluxian','','应装设接地线/投入接地刀闸/设置短路线（含编号地址）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('234','58','anquanzhelan','','应设置安全警示标志票/安全遮拦/安全绳','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('235','58','anquansheng','','应设置安全警示标志票/安全遮拦/安全绳（含编号地址）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('236','58','zhongyaoweixiandian','','重要危险点及预防措施（可附在三措中）','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('237','58','daiyashebei','','工作地点保留带电设备/带压设备/转动设备/注意事项','','','','0','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('239','58','gongzuopiaoqianfaren','','工作票签发人','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('240','58','workticketsubmittime','','工作票提交时间','','','','0','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','0','0');
INSERT INTO `fn_model_field` VALUES('241','58','gongzuopiaofuzeren','','工作票负责人','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('242','58','jieshoushijian','','接收时间','','','','0','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','0','0');
INSERT INTO `fn_model_field` VALUES('243','58','yunxingzhibanfuzeren','','运行值班负责人','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('244','58','jianxiupizhunshijian','','检修作业批准时间','','','','0','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','0','0');
INSERT INTO `fn_model_field` VALUES('245','58','zhibanchang','','值班长','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('246','58','xukekaigongshijian','','工作许可开工时间','','','','0','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','0','0');
INSERT INTO `fn_model_field` VALUES('247','58','gongzuoxukeren','','工作许可人','VARCHAR','255','','0','','0','','','input','{\"size\":\"150\",\"default\":\"{M:nickname}\"}','0','0');
INSERT INTO `fn_model_field` VALUES('249','72','content','','数据','','','','1','','0','','','editor','','0','1');
INSERT INTO `fn_model_field` VALUES('250','72','dianzhandanyuan','','电站/单元','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('251','72','shijian','','时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H\"}','0','0');
INSERT INTO `fn_model_field` VALUES('252','72','fadianliang','','发电量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('260','73','gouwang','','计划购网电量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','7','0');
INSERT INTO `fn_model_field` VALUES('353','42','zhibanren','','值班人','VARCHAR','255','','1','','0','','','select','{\"content\":\"刘东|1\r\n徐进凯|2\r\n饶鹏|3\",\"default\":\"1\"}','3','0');
INSERT INTO `fn_model_field` VALUES('263','61','jihao','','记号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('264','61','caozuoxuhao','','操作序号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('265','61','caozuoxiangmu','','操作项目','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','3','0');
INSERT INTO `fn_model_field` VALUES('266','61','caozuoshijian','','操作时间','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('267','59','bianhao','','编号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('268','59','gongzuofuzeren','','工作负责人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('269','59','kaishishijian','','计划工作开始时间','VARCHAR','255','','1','','0','','','input','null','0','0');
INSERT INTO `fn_model_field` VALUES('270','59','jieshushijian','','计划工作结束时间','VARCHAR','255','','1','','0','','','input','null','0','0');
INSERT INTO `fn_model_field` VALUES('271','59','gongzuorenwu','','工作任务','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('272','59','chuangjianshijian','','创建时间','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('273','59','liuchengzhuangtai','','流程状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"正常|normal\r\n异常|error\",\"default\":\"正常|normal\"}','0','0');
INSERT INTO `fn_model_field` VALUES('274','59','gaojing','','告警','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('275','59','jianxiujiaodai','','检修交代','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('284','74','jiaobanjilu','','交班记录','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','6','0');
INSERT INTO `fn_model_field` VALUES('285','74','zhibanzuyuan','','值班组员','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','7','0');
INSERT INTO `fn_model_field` VALUES('286','74','shebeizhuangtai','','设备状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"正常|normal\r\n异常|error\",\"default\":\"正常|normal\"}','8','0');
INSERT INTO `fn_model_field` VALUES('287','74','miaoshu','','描述','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','9','0');
INSERT INTO `fn_model_field` VALUES('288','74','zhibanrizhi','','值班日志','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','10','0');
INSERT INTO `fn_model_field` VALUES('289','67','jiaosemingcheng','','角色名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('290','67','miaoshu','','描述','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('291','67','jiaosezhuangtai','','角色状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"启用|enable \r\n禁用|disable\",\"default\":\"启用|enable\"}','0','0');
INSERT INTO `fn_model_field` VALUES('292','27','bianhao','','编号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','0','0');
INSERT INTO `fn_model_field` VALUES('293','58','bianhao','','编号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('294','58','kaishishijian','','计划工作开始时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','3','0');
INSERT INTO `fn_model_field` VALUES('295','58','jieshushijian','','计划工作结束时间','','','','1','','0','','','date','null','4','0');
INSERT INTO `fn_model_field` VALUES('296','58','chuangjianshijian','','创建时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','6','0');
INSERT INTO `fn_model_field` VALUES('297','58','liuchengzhuangtai','','流程状态','VARCHAR','255','','1','','0','','','select','{\"content\":\"待审批|todo\r\n审批中|doing\r\n已审批|done\",\"default\":\"待审批|todo\"}','7','0');
INSERT INTO `fn_model_field` VALUES('298','58','gaojing','','告警','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','8','0');
INSERT INTO `fn_model_field` VALUES('299','58','jianxiujiaodai','','检修交代','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','9','0');
INSERT INTO `fn_model_field` VALUES('392','83','moban','','模板','','','','1','','0','','','editor','{\"width\":\"99\",\"height\":\"400\",\"type\":\"1\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('312','76','content','','数据','','','','1','','0','','','editor','','0','1');
INSERT INTO `fn_model_field` VALUES('390','83','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('391','83','mobanmingcheng','','模板名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('315','76','gongzuoneirong','','工作内容','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','3','0');
INSERT INTO `fn_model_field` VALUES('316','76','kaipiaoren','','开票人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('387','82','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('318','76','kaipiaoshijian','','开票时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','5','0');
INSERT INTO `fn_model_field` VALUES('319','64','shebeibanben','','设备版本','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('320','64','changshangmingcheng','','厂商名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('321','64','banbenmingcheng','','版本名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','3','0');
INSERT INTO `fn_model_field` VALUES('322','64','shebeishuliang','','设备数量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('323','64','gaojingshuliang','','告警数量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('326','64','erzhongshuliang','','二种工作票数量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','7','0');
INSERT INTO `fn_model_field` VALUES('325','64','yizhongshuliang','','一种工作票数量','VARCHAR','255','','1','','0','','','input','null','6','0');
INSERT INTO `fn_model_field` VALUES('327','64','quexianshuliang','','缺陷数量','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','8','0');
INSERT INTO `fn_model_field` VALUES('373','42','duration','','持续时长','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('371','42','starttime','','开始时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','1','0');
INSERT INTO `fn_model_field` VALUES('374','29','beizhuxinxi','','备注信息','VARCHAR','1023','','1','','0','','','textarea','{\"width\":\"400\",\"height\":\"90\",\"default\":\"\"}','16','0');
INSERT INTO `fn_model_field` VALUES('376','29','tupian','','图片','VARCHAR','255','','1','','0','','','image','{\"width\":\"200\",\"height\":\"160\",\"size\":\"2\"}','17','1');
INSERT INTO `fn_model_field` VALUES('333','29','yewubianhao','','业务编号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','8','0');
INSERT INTO `fn_model_field` VALUES('334','29','KKSbianma','','KKS编码','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','9','0');
INSERT INTO `fn_model_field` VALUES('335','29','IPdizhi','','IP地址','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','11','0');
INSERT INTO `fn_model_field` VALUES('336','29','ESNhao','','ESN号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','12','0');
INSERT INTO `fn_model_field` VALUES('337','29','gudingzichanbianhao','','固定资产编号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','14','0');
INSERT INTO `fn_model_field` VALUES('338','29','yunxingzhuangtai','','运行状态','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','15','0');
INSERT INTO `fn_model_field` VALUES('394','29','shebeixinghao','','设备型号','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('368','78','shebeileibie','common','设备类别','VARCHAR','255','','1','','0','','','linkage','{\"id\":\"1\",\"level\":\"1\",\"default\":\"11\"}','1','0');
INSERT INTO `fn_model_field` VALUES('389','82','mobanmingcheng','','模板名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('367','78','zhuanhuanxiaolv','inverter','转换效率','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','11','0');
INSERT INTO `fn_model_field` VALUES('364','29','eqmodelid','','型号id','VARCHAR','255','','0','','0','','','select','{\"content\":\"\\&quot;sql\\&quot;:{ \\&quot;catid\\&quot;:126, \\&quot;field\\&quot;:\\&quot;shebeileibie\\&quot; }\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('344','29','zujiantouchanriqi','','设备投产日期','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','13','0');
INSERT INTO `fn_model_field` VALUES('347','23','renwulaiyuan','','任务来源','VARCHAR','255','','1','','0','','','radio','{\"content\":\"巡检计划|0\r\n预警出来|1\r\n操作票|2\r\n工作票|3\",\"default\":\"0\"}','3','0');
INSERT INTO `fn_model_field` VALUES('348','77','content','','数据','','','','1','','0','','','editor','','100','1');
INSERT INTO `fn_model_field` VALUES('349','77','zhibanren','','值班人','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"{M:username}\"}','1','0');
INSERT INTO `fn_model_field` VALUES('350','77','jiluleixing','','记录类型','VARCHAR','255','','1','','0','','','radio','{\"content\":\"临时通知|0\r\n电网调度命令|1\r\n请示汇报|2\r\n工作安排|3\",\"default\":\"3\"}','2','0');
INSERT INTO `fn_model_field` VALUES('351','77','jiluneirong','','记录内容','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"0\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('352','77','jilushijian','','记录时间','','','','1','','0','','','date','{\"width\":\"150\",\"type\":\"%Y-%m-%d %H:%M:%S\"}','3','0');
INSERT INTO `fn_model_field` VALUES('358','27','quexianmiaoshu','','缺陷描述','','','','1','','0','','','editor','{\"width\":\"99\",\"height\":\"60\",\"type\":\"0\",\"default\":\"\"}','1','0');
INSERT INTO `fn_model_field` VALUES('359','78','xinghaomingcheng','common','型号名称','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','5','0');
INSERT INTO `fn_model_field` VALUES('360','78','xinghaodaima','common','型号代码','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','3','0');
INSERT INTO `fn_model_field` VALUES('361','78','shebeichangshang','common','设备厂商','VARCHAR','255','','1','','1','','','input','{\"size\":\"150\",\"default\":\"\"}','4','0');
INSERT INTO `fn_model_field` VALUES('385','78','shebeidianbiao','common','设备点表','VARCHAR','1023','','1','','0','','','linkage','{\"id\":\"1\",\"level\":\"1\",\"default\":\"16\"}','2','0');
INSERT INTO `fn_model_field` VALUES('388','82','moban','','模板','','','','1','','0','','','editor','{\"width\":\"100\",\"height\":\"300\",\"type\":\"1\",\"default\":\"\"}','2','0');
INSERT INTO `fn_model_field` VALUES('363','78','biaochengzhuanhuanlv','solarboard','标称转换率','VARCHAR','255','','1','','0','','','input','{\"size\":\"150\",\"default\":\"\"}','21','0');

DROP TABLE IF EXISTS `fn_oauth`;
CREATE TABLE `fn_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `oauth_openid` varchar(80) NOT NULL DEFAULT '',
  `oauth_name` varchar(30) NOT NULL DEFAULT '',
  `oauth_data` text NOT NULL,
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `logintimes` bigint(10) unsigned NOT NULL DEFAULT '0',
  `logintime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `addtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `site` (`oauth_openid`,`oauth_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_plugin`;
CREATE TABLE `fn_plugin` (
  `pluginid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) NOT NULL,
  `markid` smallint(5) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `controller` varchar(30) NOT NULL DEFAULT '',
  `dir` varchar(30) NOT NULL,
  `author` varchar(100) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `disable` tinyint(1) NOT NULL DEFAULT '0',
  `setting` text NOT NULL,
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `dir` (`dir`),
  KEY `markid` (`markid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `fn_plugin` VALUES('2','1','2001','友情链接','友情链接使用说明参考论坛','','link','finecms','1.2','0','array (\n)');
INSERT INTO `fn_plugin` VALUES('5','1','1013','留言本','用户留言系统，前台模板调用代码:<br>{list table=gbook.gbook order=id_desc}<br>内容区域<br>{/list}<br><br>前台提交页面url(\'gbook/index/post\');','','gbook','lirui','1.3','0','a:3:{s:6:\"status\";s:1:\"0\";s:7:\"emailto\";s:1:\"0\";s:4:\"code\";s:1:\"0\";}');
INSERT INTO `fn_plugin` VALUES('7','1','1010','内容维护工具','对内容进行关键字获取，重复文章检测，字段内容替换，内容处理等功能','','maintain','finecms','2.5','0','array (\n)');
INSERT INTO `fn_plugin` VALUES('8','1','1001','在线升级','升级程序有可能覆盖模版文件，请注意备份！linux服务器需检查文件所有者权限和组权限，确保WEB SERVER用户有文件写入权限','','upgrade','finecms','2.1','1','NULL');
INSERT INTO `fn_plugin` VALUES('12','1','2001','通讯录','为每个用户建立通讯录','','roster','rox','1.0','0','array (\n)');
INSERT INTO `fn_plugin` VALUES('15','1','1002','数据库工具','数据备份功能根据您的选择备份全部RCMS数据，导出的数据文件可用“数据恢复”功能或 phpMyAdmin 导入。','','database','rcms','1.5','0','array (\n)');

DROP TABLE IF EXISTS `fn_position`;
CREATE TABLE `fn_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) NOT NULL COMMENT '站点id',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_position_data`;
CREATE TABLE `fn_position_data` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) NOT NULL,
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` mediumint(8) DEFAULT NULL,
  `thumb` varchar(100) NOT NULL DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `url` varchar(200) NOT NULL,
  `listorder` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`),
  KEY `catid` (`catid`),
  KEY `contentid` (`contentid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_relatedlink`;
CREATE TABLE `fn_relatedlink` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `sort` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fn_role`;
CREATE TABLE `fn_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `fn_role` VALUES('1','超级管理员','超级管理员');
INSERT INTO `fn_role` VALUES('2','管理员','管理员');
INSERT INTO `fn_role` VALUES('4','系统管理员','系统管理员');

DROP TABLE IF EXISTS `fn_search`;
CREATE TABLE `fn_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) NOT NULL,
  `catid` smallint(5) NOT NULL,
  `params` varchar(32) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `addtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sql` text NOT NULL,
  `total` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `params` (`params`,`addtime`),
  KEY `modelid` (`modelid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `fn_search` VALUES('1','0','0','4923371a85c41d2a44321bba7fcca288','货','1404045910','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (41)','1');
INSERT INTO `fn_search` VALUES('2','0','0','a88d5805135d7dde6414b47134a2f396','粮食','1404046159','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (43,42)','2');
INSERT INTO `fn_search` VALUES('3','0','0','a66d932f4338f60a0f41522eebfacaed','是','1404046600','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (3,5,8,11,14,16,23,27,34,33)','10');
INSERT INTO `fn_search` VALUES('4','0','0','e139255475ee816a4b2a727aa0c8af19','省','1404047882','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (4,6,41)','3');
INSERT INTO `fn_search` VALUES('5','0','0','80a2da46dbd62d2ee5a68b74ccc6e698','交通','1404050846','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (33,34,41)','3');
INSERT INTO `fn_search` VALUES('6','0','0','cb40004e03b37bb730de24a120910234','房','1404097650','SELECT * FROM fn_content_1 WHERE `fn_content_1`.`id` IN (33,34)','2');

DROP TABLE IF EXISTS `fn_tag`;
CREATE TABLE `fn_tag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `letter` varchar(200) NOT NULL,
  `listorder` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`letter`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `fn_tag` VALUES('1','交通运输','jiaotongyunshu','0');
INSERT INTO `fn_tag` VALUES('2','物流业','wuliuye','0');
INSERT INTO `fn_tag` VALUES('3','座谈会','zuotanhui','0');
INSERT INTO `fn_tag` VALUES('4','健康','jiankang','0');
INSERT INTO `fn_tag` VALUES('5','国务院','guowuyuan','0');
INSERT INTO `fn_tag` VALUES('6','阿双方','ashuangfang','0');
INSERT INTO `fn_tag` VALUES('7','范德萨发','fandesafa','0');
INSERT INTO `fn_tag` VALUES('8','顺丰','shunfeng','0');
INSERT INTO `fn_tag` VALUES('9','沙发','shafa','0');

DROP TABLE IF EXISTS `fn_tag_cache`;
CREATE TABLE `fn_tag_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `params` varchar(32) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `addtime` bigint(10) unsigned NOT NULL DEFAULT '0',
  `sql` mediumtext NOT NULL,
  `total` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `params` (`params`,`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `fn_tag_cache` VALUES('1','5272dbcd7a979d045747da0c886a2fbf','jiaotongyunshu','1402998736','SELECT * FROM fn_content_1 WHERE `id` IN (41) ORDER BY `updatetime` DESC','1');
INSERT INTO `fn_tag_cache` VALUES('2','5d43ea2e14af2e71bdddaf00f6da2ff8','wuliuye','1402998740','SELECT * FROM fn_content_1 WHERE `id` IN (41) ORDER BY `updatetime` DESC','1');
INSERT INTO `fn_tag_cache` VALUES('3','11a31d03c0cf0041563cc1431c033fa3','jiankang','1402998744','SELECT * FROM fn_content_1 WHERE `id` IN (41) ORDER BY `updatetime` DESC','1');
INSERT INTO `fn_tag_cache` VALUES('4','59060da24fc3c2454ce239914e2d3778','guowuyuan','1404097734','SELECT * FROM fn_content_1 WHERE `id` IN (6,31) ORDER BY `updatetime` DESC','2');

DROP TABLE IF EXISTS `fn_user`;
CREATE TABLE `fn_user` (
  `userid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` tinyint(3) DEFAULT NULL COMMENT '站点id',
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` char(10) NOT NULL,
  `roleid` int(3) NOT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` bigint(10) unsigned DEFAULT '0',
  `loginip` varchar(15) DEFAULT NULL,
  `logintime` bigint(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) DEFAULT '',
  `usermenu` text,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `fn_user` VALUES('1','0','system','c5408b11501b77e5d4ada226033f3052','02f59eb1be','1','121.60.28.18','1457748098','115.175.29.113','1457954372','','网站创始人','a:0:{}');
INSERT INTO `fn_user` VALUES('2','1','admin','b1502535855b89373c2bdb1705a6629f','5f872a1b78','4','127.0.0.1','1402808125','59.174.162.21','1420612504','bernardrao@gmail.com','系统管理员','a:0:{}');

DROP TABLE IF EXISTS `tk_cities`;
CREATE TABLE `tk_cities` (
  `code` varchar(20) DEFAULT NULL,
  `pcode` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `callcode` varchar(10) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `jianpin` varchar(255) DEFAULT NULL,
  `ishot` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tk_cities` VALUES('110000','0','北京市','北京市','','北京市','','1','100000','010','','','','','1');
INSERT INTO `tk_cities` VALUES('110101','110000','东城区','北京市-东城区','东城区','北京市','','3','100000','010','','','dongchengqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('110102','110000','西城区','北京市-西城区','西城区','北京市','','3','100000','010','','','xichengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('110105','110000','朝阳区','北京市-朝阳区','朝阳区','北京市','','3','100000','010','','','chaoyangqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('110106','110000','丰台区','北京市-丰台区','丰台区','北京市','','3','100000','010','','','fengtaiqu','FTQ','0');
INSERT INTO `tk_cities` VALUES('110107','110000','石景山区','北京市-石景山区','石景山区','北京市','','3','100000','010','','','shijingshanqu','SJSQ','0');
INSERT INTO `tk_cities` VALUES('110108','110000','海淀区','北京市-海淀区','海淀区','北京市','','3','100000','010','','','haidianqu','HDQ','0');
INSERT INTO `tk_cities` VALUES('110109','110000','门头沟区','北京市-门头沟区','门头沟区','北京市','','3','102300','010','','','mentougouqu','MTGQ','0');
INSERT INTO `tk_cities` VALUES('110111','110000','房山区','北京市-房山区','房山区','北京市','','3','102400','010','','','fangshanqu','FSQ','0');
INSERT INTO `tk_cities` VALUES('110112','110000','通州区','北京市-通州区','通州区','北京市','','3','101100','010','','','tongzhouqu','TZQ','0');
INSERT INTO `tk_cities` VALUES('110113','110000','顺义区','北京市-顺义区','顺义区','北京市','','3','101300','010','','','shunyiqu','SYQ','0');
INSERT INTO `tk_cities` VALUES('110114','110000','昌平区','北京市-昌平区','昌平区','北京市','','3','102200','010','','','changpingqu','CPQ','0');
INSERT INTO `tk_cities` VALUES('110115','110000','大兴区','北京市-大兴区','大兴区','北京市','','3','102600','010','','','daxingqu','DXQ','0');
INSERT INTO `tk_cities` VALUES('110116','110000','怀柔区','北京市-怀柔区','怀柔区','北京市','','3','101400','010','','','huairouqu','HRQ','0');
INSERT INTO `tk_cities` VALUES('110117','110000','平谷区','北京市-平谷区','平谷区','北京市','','3','101200','010','','','pingguqu','PGQ','0');
INSERT INTO `tk_cities` VALUES('110228','110000','密云县','北京市-密云县','密云县','北京市','','3','101500','010','','','miyunxian','MYX','0');
INSERT INTO `tk_cities` VALUES('110229','110000','延庆县','北京市-延庆县','延庆县','北京市','','3','102100','010','','','yanqingxian','YQX','0');
INSERT INTO `tk_cities` VALUES('120000','0','天津市','天津市','','天津市','','1','300000','022','','','','','1');
INSERT INTO `tk_cities` VALUES('120101','120000','和平区','天津市-和平区','和平区','天津市','','3','300000','022','','','hepingqu','HPQ','0');
INSERT INTO `tk_cities` VALUES('120102','120000','河东区','天津市-河东区','河东区','天津市','','3','300000','022','','','hedongqu','HDQ','0');
INSERT INTO `tk_cities` VALUES('120103','120000','河西区','天津市-河西区','河西区','天津市','','3','300000','022','','','hexiqu','HXQ','0');
INSERT INTO `tk_cities` VALUES('120104','120000','南开区','天津市-南开区','南开区','天津市','','3','300000','022','','','nankaiqu','NKQ','0');
INSERT INTO `tk_cities` VALUES('120105','120000','河北区','天津市-河北区','河北区','天津市','','3','300000','022','','','hebeiqu','HBQ','0');
INSERT INTO `tk_cities` VALUES('120106','120000','红桥区','天津市-红桥区','红桥区','天津市','','3','300000','022','','','hongqiaoqu','HQQ','0');
INSERT INTO `tk_cities` VALUES('120110','120000','东丽区','天津市-东丽区','东丽区','天津市','','3','300000','022','','','dongliqu','DLQ','0');
INSERT INTO `tk_cities` VALUES('120111','120000','西青区','天津市-西青区','西青区','天津市','','3','300000','022','','','xiqingqu','XQQ','0');
INSERT INTO `tk_cities` VALUES('120112','120000','津南区','天津市-津南区','津南区','天津市','','3','300000','022','','','jinnanqu','JNQ','0');
INSERT INTO `tk_cities` VALUES('120113','120000','北辰区','天津市-北辰区','北辰区','天津市','','3','300000','022','','','beichenqu','BCQ','0');
INSERT INTO `tk_cities` VALUES('120114','120000','武清区','天津市-武清区','武清区','天津市','','3','301700','022','','','wuqingqu','WQQ','0');
INSERT INTO `tk_cities` VALUES('120115','120000','宝坻区','天津市-宝坻区','宝坻区','天津市','','3','301800','022','','','baoqu','BQ','0');
INSERT INTO `tk_cities` VALUES('120116','120000','滨海新区','天津市-滨海新区','滨海新区','天津市','','3','300450','022','','','binhaixinqu','BHXQ','0');
INSERT INTO `tk_cities` VALUES('120221','120000','宁河县','天津市-宁河县','宁河县','天津市','','3','301500','022','','','ninghexian','NHX','0');
INSERT INTO `tk_cities` VALUES('120223','120000','静海县','天津市-静海县','静海县','天津市','','3','301600','022','','','jinghaixian','JHX','0');
INSERT INTO `tk_cities` VALUES('120225','120000','蓟县','天津市-蓟县','蓟县','天津市','','3','301900','022','','','jixian','JX','0');
INSERT INTO `tk_cities` VALUES('130000','0','河北省','河北省','','','河北省','1','','','','','hebeisheng','HBS','0');
INSERT INTO `tk_cities` VALUES('130100','130000','石家庄市','河北省-石家庄市','','石家庄市','河北省','2','050000','0311','','','shijiazhuangshi','SJZS','0');
INSERT INTO `tk_cities` VALUES('130200','130000','唐山市','河北省-唐山市','','唐山市','河北省','2','063000','0315','','','tangshanshi','TSS','0');
INSERT INTO `tk_cities` VALUES('130300','130000','秦皇岛市','河北省-秦皇岛市','','秦皇岛市','河北省','2','066000','0335','','','qinhuangdaoshi','QHDS','0');
INSERT INTO `tk_cities` VALUES('130400','130000','邯郸市','河北省-邯郸市','','邯郸市','河北省','2','056000','0310','','','handanshi','HDS','1');
INSERT INTO `tk_cities` VALUES('130500','130000','邢台市','河北省-邢台市','','邢台市','河北省','2','054000','0319','','','xingtaishi','XTS','0');
INSERT INTO `tk_cities` VALUES('130600','130000','保定市','河北省-保定市','','保定市','河北省','2','071000','0312','','','baodingshi','BDS','0');
INSERT INTO `tk_cities` VALUES('130700','130000','张家口市','河北省-张家口市','','张家口市','河北省','2','075000','0313','','','zhangjiakoushi','ZJKS','0');
INSERT INTO `tk_cities` VALUES('130800','130000','承德市','河北省-承德市','','承德市','河北省','2','067000','0314','','','chengdeshi','CDS','0');
INSERT INTO `tk_cities` VALUES('130900','130000','沧州市','河北省-沧州市','','沧州市','河北省','2','061000','0317','','','cangzhoushi','CZS','1');
INSERT INTO `tk_cities` VALUES('131000','130000','廊坊市','河北省-廊坊市','','廊坊市','河北省','2','065000','0316','','','langfangshi','LFS','0');
INSERT INTO `tk_cities` VALUES('131100','130000','衡水市','河北省-衡水市','','衡水市','河北省','2','053000','0318','','','hengshuishi','HSS','0');
INSERT INTO `tk_cities` VALUES('130102','130100','长安区','河北省-石家庄市-长安区','长安区','石家庄市','河北省','3','050000','0311','38.05018','114.51394','changanqu','CAQ','0');
INSERT INTO `tk_cities` VALUES('130103','130100','桥东区','河北省-石家庄市-桥东区','桥东区','石家庄市','河北省','3','050000','0311','38.05272','114.4972','qiaodongqu','QDQ','0');
INSERT INTO `tk_cities` VALUES('130104','130100','桥西区','河北省-石家庄市-桥西区','桥西区','石家庄市','河北省','3','050000','0311','38.02811','114.47275','qiaoxiqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('130105','130100','新华区','河北省-石家庄市-新华区','新华区','石家庄市','河北省','3','050000','0311','38.05156','114.47439','xinhuaqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('130107','130100','井陉矿区','河北省-石家庄市-井陉矿区','井陉矿区','石家庄市','河北省','3','051000','0311','38.07651','114.04354','jingkuangqu','JKQ','0');
INSERT INTO `tk_cities` VALUES('130108','130100','裕华区','河北省-石家庄市-裕华区','裕华区','石家庄市','河北省','3','050000','0311','38.02291','114.51274','yuhuaqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('130121','130100','井陉县','河北省-石家庄市-井陉县','井陉县','石家庄市','河北省','3','050300','0311','38.03608','114.13623','jingxian','JX','0');
INSERT INTO `tk_cities` VALUES('130123','130100','正定县','河北省-石家庄市-正定县','正定县','石家庄市','河北省','3','050800','0311','38.14397','114.56719','zhengdingxian','ZDX','0');
INSERT INTO `tk_cities` VALUES('130124','130100','栾城县','河北省-石家庄市-栾城县','栾城县','石家庄市','河北省','3','051430','0311','37.88365','114.65522','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('130125','130100','行唐县','河北省-石家庄市-行唐县','行唐县','石家庄市','河北省','3','050600','0311','38.4361','114.54732','xingtangxian','XTX','0');
INSERT INTO `tk_cities` VALUES('130126','130100','灵寿县','河北省-石家庄市-灵寿县','灵寿县','石家庄市','河北省','3','050500','0311','38.301','114.36888','lingshouxian','LSX','0');
INSERT INTO `tk_cities` VALUES('130127','130100','高邑县','河北省-石家庄市-高邑县','高邑县','石家庄市','河北省','3','051330','0311','37.6026','114.60565','gaoyixian','GYX','0');
INSERT INTO `tk_cities` VALUES('130128','130100','深泽县','河北省-石家庄市-深泽县','深泽县','石家庄市','河北省','3','052500','0311','38.1829','115.19744','shenzexian','SZX','0');
INSERT INTO `tk_cities` VALUES('130129','130100','赞皇县','河北省-石家庄市-赞皇县','赞皇县','石家庄市','河北省','3','051230','0311','37.66053','114.38162','zanhuangxian','ZHX','0');
INSERT INTO `tk_cities` VALUES('130130','130100','无极县','河北省-石家庄市-无极县','无极县','石家庄市','河北省','3','052400','0311','38.17603','114.96926','wujixian','WJX','0');
INSERT INTO `tk_cities` VALUES('130131','130100','平山县','河北省-石家庄市-平山县','平山县','石家庄市','河北省','3','050400','0311','38.25444','114.19722','pingshanxian','PSX','0');
INSERT INTO `tk_cities` VALUES('130132','130100','元氏县','河北省-石家庄市-元氏县','元氏县','石家庄市','河北省','3','051130','0311','37.74992','114.51226','yuanshixian','YSX','0');
INSERT INTO `tk_cities` VALUES('130133','130100','赵县','河北省-石家庄市-赵县','赵县','石家庄市','河北省','3','051530','0311','37.74971','114.77027','zhaoxian','ZX','0');
INSERT INTO `tk_cities` VALUES('130181','130100','辛集市','河北省-石家庄市-辛集市','辛集市','石家庄市','河北省','3','052300','0311','37.90953','115.21307','xinjishi','XJS','0');
INSERT INTO `tk_cities` VALUES('130182','130100','藁城市','河北省-石家庄市-藁城市','藁城市','石家庄市','河北省','3','052160','0311','38.03445','114.837','chengshi','CS','0');
INSERT INTO `tk_cities` VALUES('130183','130100','晋州市','河北省-石家庄市-晋州市','晋州市','石家庄市','河北省','3','052200','0311','38.03059','115.03742','jinzhoushi','JZS','0');
INSERT INTO `tk_cities` VALUES('130184','130100','新乐市','河北省-石家庄市-新乐市','新乐市','石家庄市','河北省','3','050700','0311','38.3437','114.68401','xinleshi','XLS','0');
INSERT INTO `tk_cities` VALUES('130185','130100','鹿泉市','河北省-石家庄市-鹿泉市','鹿泉市','石家庄市','河北省','3','050200','0311','38.08715','114.30734','luquanshi','LQS','0');
INSERT INTO `tk_cities` VALUES('130202','130200','路南区','河北省-唐山市-路南区','路南区','唐山市','河北省','3','063000','0315','39.62697','118.17261','lunanqu','LNQ','0');
INSERT INTO `tk_cities` VALUES('130203','130200','路北区','河北省-唐山市-路北区','路北区','唐山市','河北省','3','063000','0315','39.63512','118.21399','lubeiqu','LBQ','0');
INSERT INTO `tk_cities` VALUES('130204','130200','古冶区','河北省-唐山市-古冶区','古冶区','唐山市','河北省','3','063000','0315','39.72597','118.42078','guyequ','GYQ','0');
INSERT INTO `tk_cities` VALUES('130205','130200','开平区','河北省-唐山市-开平区','开平区','唐山市','河北省','3','063000','0315','39.67842','118.26627','kaipingqu','KPQ','0');
INSERT INTO `tk_cities` VALUES('130207','130200','丰南区','河北省-唐山市-丰南区','丰南区','唐山市','河北省','3','063300','0315','39.55963','118.10812','fengnanqu','FNQ','0');
INSERT INTO `tk_cities` VALUES('130208','130200','丰润区','河北省-唐山市-丰润区','丰润区','唐山市','河北省','3','063000','0315','39.83158','118.1686','fengrunqu','FRQ','0');
INSERT INTO `tk_cities` VALUES('130230','130200','曹妃甸区','河北省-唐山市-曹妃甸区','曹妃甸区','唐山市','河北省','3','063200','0315','','','caodianqu','CDQ','0');
INSERT INTO `tk_cities` VALUES('130223','130200','滦县','河北省-唐山市-滦县','滦县','唐山市','河北省','3','063700','0315','39.7463','118.69325','luanxian','LX','0');
INSERT INTO `tk_cities` VALUES('130224','130200','滦南县','河北省-唐山市-滦南县','滦南县','唐山市','河北省','3','063500','0315','39.50675','118.67852','luannanxian','LNX','0');
INSERT INTO `tk_cities` VALUES('130225','130200','乐亭县','河北省-唐山市-乐亭县','乐亭县','唐山市','河北省','3','063600','0315','39.4244','118.90353','letingxian','LTX','0');
INSERT INTO `tk_cities` VALUES('130227','130200','迁西县','河北省-唐山市-迁西县','迁西县','唐山市','河北省','3','064300','0315','40.1446','118.30997','qianxixian','QXX','0');
INSERT INTO `tk_cities` VALUES('130229','130200','玉田县','河北省-唐山市-玉田县','玉田县','唐山市','河北省','3','064100','0315','39.88097','117.72851','yutianxian','YTX','0');
INSERT INTO `tk_cities` VALUES('130281','130200','遵化市','河北省-唐山市-遵化市','遵化市','唐山市','河北省','3','064200','0315','40.18631','117.95832','zunhuashi','ZHS','0');
INSERT INTO `tk_cities` VALUES('130283','130200','迁安市','河北省-唐山市-迁安市','迁安市','唐山市','河北省','3','064400','0315','40.01306','118.69294','qiananshi','QAS','0');
INSERT INTO `tk_cities` VALUES('130302','130300','海港区','河北省-秦皇岛市-海港区','海港区','秦皇岛市','河北省','3','066000','0335','39.93477','119.59585','haigangqu','HGQ','0');
INSERT INTO `tk_cities` VALUES('130303','130300','山海关区','河北省-秦皇岛市-山海关区','山海关区','秦皇岛市','河北省','3','066200','0335','40.00766','119.76094','shanhaiguanqu','SHGQ','0');
INSERT INTO `tk_cities` VALUES('130304','130300','北戴河区','河北省-秦皇岛市-北戴河区','北戴河区','秦皇岛市','河北省','3','066100','0335','39.82717','119.48709','beidaihequ','BDHQ','0');
INSERT INTO `tk_cities` VALUES('130321','130300','青龙满族自治县','河北省-秦皇岛市-青龙满族自治县','青龙满族自治县','秦皇岛市','河北省','3','066500','0335','40.4063','118.94657','qinglongmanzuzizhixian','QLMZZZX','0');
INSERT INTO `tk_cities` VALUES('130322','130300','昌黎县','河北省-秦皇岛市-昌黎县','昌黎县','秦皇岛市','河北省','3','066600','0335','39.70751','119.15973','changlixian','CLX','0');
INSERT INTO `tk_cities` VALUES('130323','130300','抚宁县','河北省-秦皇岛市-抚宁县','抚宁县','秦皇岛市','河北省','3','066300','0335','39.89041','119.2314','funingxian','FNX','0');
INSERT INTO `tk_cities` VALUES('130324','130300','卢龙县','河北省-秦皇岛市-卢龙县','卢龙县','秦皇岛市','河北省','3','066400','0335','39.88084','118.86843','lulongxian','LLX','0');
INSERT INTO `tk_cities` VALUES('130402','130400','邯山区','河北省-邯郸市-邯山区','邯山区','邯郸市','河北省','3','056000','0310','36.60039','114.47705','hanshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('130403','130400','丛台区','河北省-邯郸市-丛台区','丛台区','邯郸市','河北省','3','056000','0310','36.62564','114.48771','congtaiqu','CTQ','0');
INSERT INTO `tk_cities` VALUES('130404','130400','复兴区','河北省-邯郸市-复兴区','复兴区','邯郸市','河北省','3','056000','0310','36.63182','114.4563','fuxingqu','FXQ','0');
INSERT INTO `tk_cities` VALUES('130406','130400','峰峰矿区','河北省-邯郸市-峰峰矿区','峰峰矿区','邯郸市','河北省','3','056200','0310','36.42406','114.20687','fengfengkuangqu','FFKQ','0');
INSERT INTO `tk_cities` VALUES('130421','130400','邯郸县','河北省-邯郸市-邯郸县','邯郸县','邯郸市','河北省','3','056000','0310','36.59383','114.52535','handanxian','HDX','0');
INSERT INTO `tk_cities` VALUES('130423','130400','临漳县','河北省-邯郸市-临漳县','临漳县','邯郸市','河北省','3','056600','0310','36.34466','114.60874','linzhangxian','LZX','0');
INSERT INTO `tk_cities` VALUES('130424','130400','成安县','河北省-邯郸市-成安县','成安县','邯郸市','河北省','3','056700','0310','36.43938','114.69126','chenganxian','CAX','0');
INSERT INTO `tk_cities` VALUES('130425','130400','大名县','河北省-邯郸市-大名县','大名县','邯郸市','河北省','3','056900','0310','36.27986','115.14766','damingxian','DMX','0');
INSERT INTO `tk_cities` VALUES('130426','130400','涉县','河北省-邯郸市-涉县','涉县','邯郸市','河北省','3','056400','0310','36.5613','113.66619','shexian','SX','0');
INSERT INTO `tk_cities` VALUES('130427','130400','磁县','河北省-邯郸市-磁县','磁县','邯郸市','河北省','3','056500','0310','36.35642','114.3739','cixian','CX','0');
INSERT INTO `tk_cities` VALUES('130428','130400','肥乡县','河北省-邯郸市-肥乡县','肥乡县','邯郸市','河北省','3','057550','0310','36.55349','114.8064','feixiangxian','FXX','0');
INSERT INTO `tk_cities` VALUES('130429','130400','永年县','河北省-邯郸市-永年县','永年县','邯郸市','河北省','3','057150','0310','36.78326','114.48333','yongnianxian','YNX','0');
INSERT INTO `tk_cities` VALUES('130430','130400','邱县','河北省-邯郸市-邱县','邱县','邯郸市','河北省','3','057450','0310','36.82046','115.16809','qiuxian','QX','0');
INSERT INTO `tk_cities` VALUES('130431','130400','鸡泽县','河北省-邯郸市-鸡泽县','鸡泽县','邯郸市','河北省','3','057350','0310','36.92359','114.86863','jizexian','JZX','0');
INSERT INTO `tk_cities` VALUES('130432','130400','广平县','河北省-邯郸市-广平县','广平县','邯郸市','河北省','3','057650','0310','36.48057','114.94098','guangpingxian','GPX','0');
INSERT INTO `tk_cities` VALUES('130433','130400','馆陶县','河北省-邯郸市-馆陶县','馆陶县','邯郸市','河北省','3','057750','0310','36.53705','115.29332','guantaoxian','GTX','0');
INSERT INTO `tk_cities` VALUES('130434','130400','魏县','河北省-邯郸市-魏县','魏县','邯郸市','河北省','3','056800','0310','36.36191','114.9297','weixian','WX','0');
INSERT INTO `tk_cities` VALUES('130435','130400','曲周县','河北省-邯郸市-曲周县','曲周县','邯郸市','河北省','3','057250','0310','36.7766','114.94635','quzhouxian','QZX','0');
INSERT INTO `tk_cities` VALUES('130481','130400','武安市','河北省-邯郸市-武安市','武安市','邯郸市','河北省','3','056300','0310','36.69258','114.1955','wuanshi','WAS','0');
INSERT INTO `tk_cities` VALUES('130502','130500','桥东区','河北省-邢台市-桥东区','桥东区','邢台市','河北省','3','054000','0319','38.05272','114.4972','qiaodongqu','QDQ','0');
INSERT INTO `tk_cities` VALUES('130503','130500','桥西区','河北省-邢台市-桥西区','桥西区','邢台市','河北省','3','054000','0319','38.02811','114.47275','qiaoxiqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('130521','130500','邢台县','河北省-邢台市-邢台县','邢台县','邢台市','河北省','3','054000','0319','37.07553','114.49736','xingtaixian','XTX','0');
INSERT INTO `tk_cities` VALUES('130522','130500','临城县','河北省-邢台市-临城县','临城县','邢台市','河北省','3','054300','0319','37.43913','114.49801','linchengxian','LCX','0');
INSERT INTO `tk_cities` VALUES('130523','130500','内丘县','河北省-邢台市-内丘县','内丘县','邢台市','河北省','3','054200','0319','37.29322','114.51531','neiqiuxian','NQX','0');
INSERT INTO `tk_cities` VALUES('130524','130500','柏乡县','河北省-邢台市-柏乡县','柏乡县','邢台市','河北省','3','055450','0319','37.49264','114.68538','baixiangxian','BXX','0');
INSERT INTO `tk_cities` VALUES('130525','130500','隆尧县','河北省-邢台市-隆尧县','隆尧县','邢台市','河北省','3','055350','0319','37.35291','114.77035','longyaoxian','LYX','0');
INSERT INTO `tk_cities` VALUES('130526','130500','任县','河北省-邢台市-任县','任县','邢台市','河北省','3','055150','0319','37.12538','114.67847','renxian','RX','0');
INSERT INTO `tk_cities` VALUES('130527','130500','南和县','河北省-邢台市-南和县','南和县','邢台市','河北省','3','054400','0319','36.99852','114.68946','nanhexian','NHX','0');
INSERT INTO `tk_cities` VALUES('130528','130500','宁晋县','河北省-邢台市-宁晋县','宁晋县','邢台市','河北省','3','055550','0319','37.61646','114.91554','ningjinxian','NJX','0');
INSERT INTO `tk_cities` VALUES('130529','130500','巨鹿县','河北省-邢台市-巨鹿县','巨鹿县','邢台市','河北省','3','055250','0319','37.21739','115.02926','juluxian','JLX','0');
INSERT INTO `tk_cities` VALUES('130530','130500','新河县','河北省-邢台市-新河县','新河县','邢台市','河北省','3','051730','0319','37.52651','115.24397','xinhexian','XHX','0');
INSERT INTO `tk_cities` VALUES('130531','130500','广宗县','河北省-邢台市-广宗县','广宗县','邢台市','河北省','3','054600','0319','37.0704','115.14754','guangzongxian','GZX','0');
INSERT INTO `tk_cities` VALUES('130532','130500','平乡县','河北省-邢台市-平乡县','平乡县','邢台市','河北省','3','054500','0319','37.06903','115.03128','pingxiangxian','PXX','0');
INSERT INTO `tk_cities` VALUES('130533','130500','威县','河北省-邢台市-威县','威县','邢台市','河北省','3','054700','0319','36.97642','115.25783','weixian','WX','0');
INSERT INTO `tk_cities` VALUES('130534','130500','清河县','河北省-邢台市-清河县','清河县','邢台市','河北省','3','054800','0319','37.07092','115.65909','qinghexian','QHX','0');
INSERT INTO `tk_cities` VALUES('130535','130500','临西县','河北省-邢台市-临西县','临西县','邢台市','河北省','3','054900','0319','36.85806','115.49188','linxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('130581','130500','南宫市','河北省-邢台市-南宫市','南宫市','邢台市','河北省','3','051800','0319','37.35721','115.38455','nangongshi','NGS','0');
INSERT INTO `tk_cities` VALUES('130582','130500','沙河市','河北省-邢台市-沙河市','沙河市','邢台市','河北省','3','054100','0319','36.85741','114.49226','shaheshi','SHS','0');
INSERT INTO `tk_cities` VALUES('130602','130600','新市区','河北省-保定市-新市区','新市区','保定市','河北省','3','071000','0312','38.87245','115.45278','xinshiqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('130603','130600','北市区','河北省-保定市-北市区','北市区','保定市','河北省','3','071000','0312','38.86281','115.48786','beishiqu','BSQ','0');
INSERT INTO `tk_cities` VALUES('130604','130600','南市区','河北省-保定市-南市区','南市区','保定市','河北省','3','071000','0312','38.85049','115.49557','nanshiqu','NSQ','0');
INSERT INTO `tk_cities` VALUES('130621','130600','满城县','河北省-保定市-满城县','满城县','保定市','河北省','3','072150','0312','38.94889','115.31679','manchengxian','MCX','0');
INSERT INTO `tk_cities` VALUES('130622','130600','清苑县','河北省-保定市-清苑县','清苑县','保定市','河北省','3','071100','0312','38.76633','115.48648','qingyuanxian','QYX','0');
INSERT INTO `tk_cities` VALUES('130623','130600','涞水县','河北省-保定市-涞水县','涞水县','保定市','河北省','3','074100','0312','39.39302','115.70912','shuixian','SX','0');
INSERT INTO `tk_cities` VALUES('130624','130600','阜平县','河北省-保定市-阜平县','阜平县','保定市','河北省','3','073200','0312','38.84688','114.19057','fupingxian','FPX','0');
INSERT INTO `tk_cities` VALUES('130625','130600','徐水县','河北省-保定市-徐水县','徐水县','保定市','河北省','3','072550','0312','39.0203','115.65235','xushuixian','XSX','0');
INSERT INTO `tk_cities` VALUES('130626','130600','定兴县','河北省-保定市-定兴县','定兴县','保定市','河北省','3','072650','0312','39.27295','115.77376','dingxingxian','DXX','0');
INSERT INTO `tk_cities` VALUES('130627','130600','唐县','河北省-保定市-唐县','唐县','保定市','河北省','3','072350','0312','38.74457','114.97922','tangxian','TX','0');
INSERT INTO `tk_cities` VALUES('130628','130600','高阳县','河北省-保定市-高阳县','高阳县','保定市','河北省','3','071500','0312','38.68835','115.77706','gaoyangxian','GYX','0');
INSERT INTO `tk_cities` VALUES('130629','130600','容城县','河北省-保定市-容城县','容城县','保定市','河北省','3','071700','0312','39.05279','115.86577','rongchengxian','RCX','0');
INSERT INTO `tk_cities` VALUES('130630','130600','涞源县','河北省-保定市-涞源县','涞源县','保定市','河北省','3','102900','0312','39.35298','114.68534','yuanxian','YX','0');
INSERT INTO `tk_cities` VALUES('130631','130600','望都县','河北省-保定市-望都县','望都县','保定市','河北省','3','072450','0312','38.70912','115.15041','wangduxian','WDX','0');
INSERT INTO `tk_cities` VALUES('130632','130600','安新县','河北省-保定市-安新县','安新县','保定市','河北省','3','071600','0312','38.92095','115.92855','anxinxian','AXX','0');
INSERT INTO `tk_cities` VALUES('130633','130600','易县','河北省-保定市-易县','易县','保定市','河北省','3','074200','0312','39.34783','115.49198','yixian','YX','0');
INSERT INTO `tk_cities` VALUES('130634','130600','曲阳县','河北省-保定市-曲阳县','曲阳县','保定市','河北省','3','073100','0312','38.62098','114.69529','quyangxian','QYX','0');
INSERT INTO `tk_cities` VALUES('130635','130600','蠡县','河北省-保定市-蠡县','蠡县','保定市','河北省','3','071400','0312','38.48927','115.57132','xian','X','0');
INSERT INTO `tk_cities` VALUES('130636','130600','顺平县','河北省-保定市-顺平县','顺平县','保定市','河北省','3','072250','0312','38.83761','115.1284','shunpingxian','SPX','0');
INSERT INTO `tk_cities` VALUES('130637','130600','博野县','河北省-保定市-博野县','博野县','保定市','河北省','3','071300','0312','38.45566','115.46417','boyexian','BYX','0');
INSERT INTO `tk_cities` VALUES('130638','130600','雄县','河北省-保定市-雄县','雄县','保定市','河北省','3','071800','0312','38.97756','116.09283','xiongxian','XX','0');
INSERT INTO `tk_cities` VALUES('130681','130600','涿州市','河北省-保定市-涿州市','涿州市','保定市','河北省','3','072750','0312','39.48525','115.97473','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('130682','130600','定州市','河北省-保定市-定州市','定州市','保定市','河北省','3','073000','0312','38.52013','114.96789','dingzhoushi','DZS','0');
INSERT INTO `tk_cities` VALUES('130683','130600','安国市','河北省-保定市-安国市','安国市','保定市','河北省','3','071200','0312','38.41327','115.31701','anguoshi','AGS','0');
INSERT INTO `tk_cities` VALUES('130684','130600','高碑店市','河北省-保定市-高碑店市','高碑店市','保定市','河北省','3','074000','0312','39.33487','115.84796','gaobeidianshi','GBDS','0');
INSERT INTO `tk_cities` VALUES('130702','130700','桥东区','河北省-张家口市-桥东区','桥东区','张家口市','河北省','3','075000','0313','38.05272','114.4972','qiaodongqu','QDQ','0');
INSERT INTO `tk_cities` VALUES('130703','130700','桥西区','河北省-张家口市-桥西区','桥西区','张家口市','河北省','3','075000','0313','38.02811','114.47275','qiaoxiqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('130705','130700','宣化区','河北省-张家口市-宣化区','宣化区','张家口市','河北省','3','075000','0313','40.60557','115.05313','xuanhuaqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('130706','130700','下花园区','河北省-张家口市-下花园区','下花园区','张家口市','河北省','3','075000','0313','40.48819','115.27406','xiahuayuanqu','XHYQ','0');
INSERT INTO `tk_cities` VALUES('130721','130700','宣化县','河北省-张家口市-宣化县','宣化县','张家口市','河北省','3','075100','0313','40.55212','115.02218','xuanhuaxian','XHX','0');
INSERT INTO `tk_cities` VALUES('130722','130700','张北县','河北省-张家口市-张北县','张北县','张家口市','河北省','3','076450','0313','41.15809','114.70812','zhangbeixian','ZBX','0');
INSERT INTO `tk_cities` VALUES('130723','130700','康保县','河北省-张家口市-康保县','康保县','张家口市','河北省','3','076650','0313','41.8528','114.60912','kangbaoxian','KBX','0');
INSERT INTO `tk_cities` VALUES('130724','130700','沽源县','河北省-张家口市-沽源县','沽源县','张家口市','河北省','3','076550','0313','41.67041','115.70119','guyuanxian','GYX','0');
INSERT INTO `tk_cities` VALUES('130725','130700','尚义县','河北省-张家口市-尚义县','尚义县','张家口市','河北省','3','076750','0313','41.07629','113.96479','shangyixian','SYX','0');
INSERT INTO `tk_cities` VALUES('130726','130700','蔚县','河北省-张家口市-蔚县','蔚县','张家口市','河北省','3','075700','0313','39.84247','114.56573','weixian','WX','0');
INSERT INTO `tk_cities` VALUES('130727','130700','阳原县','河北省-张家口市-阳原县','阳原县','张家口市','河北省','3','075800','0313','40.11516','114.16379','yangyuanxian','YYX','0');
INSERT INTO `tk_cities` VALUES('130728','130700','怀安县','河北省-张家口市-怀安县','怀安县','张家口市','河北省','3','076150','0313','40.67276','114.41352','huaianxian','HAX','0');
INSERT INTO `tk_cities` VALUES('130729','130700','万全县','河北省-张家口市-万全县','万全县','张家口市','河北省','3','076250','0313','40.75507','114.72375','wanquanxian','WQX','0');
INSERT INTO `tk_cities` VALUES('130730','130700','怀来县','河北省-张家口市-怀来县','怀来县','张家口市','河北省','3','075400','0313','40.40063','115.51425','huailaixian','HLX','0');
INSERT INTO `tk_cities` VALUES('130731','130700','涿鹿县','河北省-张家口市-涿鹿县','涿鹿县','张家口市','河北省','3','075600','0313','40.37514','115.2177','luxian','LX','0');
INSERT INTO `tk_cities` VALUES('130732','130700','赤城县','河北省-张家口市-赤城县','赤城县','张家口市','河北省','3','075500','0313','40.91296','115.82572','chichengxian','CCX','0');
INSERT INTO `tk_cities` VALUES('130733','130700','崇礼县','河北省-张家口市-崇礼县','崇礼县','张家口市','河北省','3','076350','0313','40.97364','115.27358','chonglixian','CLX','0');
INSERT INTO `tk_cities` VALUES('130802','130800','双桥区','河北省-承德市-双桥区','双桥区','承德市','河北省','3','067000','0314','40.96927','117.93113','shuangqiaoqu','SQQ','0');
INSERT INTO `tk_cities` VALUES('130803','130800','双滦区','河北省-承德市-双滦区','双滦区','承德市','河北省','3','067000','0314','40.95224','117.78863','shuangluanqu','SLQ','0');
INSERT INTO `tk_cities` VALUES('130804','130800','鹰手营子矿区','河北省-承德市-鹰手营子矿区','鹰手营子矿区','承德市','河北省','3','067200','0314','40.54683','117.65225','yingshouyingzikuangqu','YSYZKQ','0');
INSERT INTO `tk_cities` VALUES('130821','130800','承德县','河北省-承德市-承德县','承德县','承德市','河北省','3','067400','0314','40.76824','118.17002','chengdexian','CDX','0');
INSERT INTO `tk_cities` VALUES('130822','130800','兴隆县','河北省-承德市-兴隆县','兴隆县','承德市','河北省','3','067300','0314','40.42702','117.50865','xinglongxian','XLX','0');
INSERT INTO `tk_cities` VALUES('130823','130800','平泉县','河北省-承德市-平泉县','平泉县','承德市','河北省','3','067500','0314','41.00419','118.68483','pingquanxian','PQX','0');
INSERT INTO `tk_cities` VALUES('130824','130800','滦平县','河北省-承德市-滦平县','滦平县','承德市','河北省','3','068250','0314','40.93261','117.33047','luanpingxian','LPX','0');
INSERT INTO `tk_cities` VALUES('130825','130800','隆化县','河北省-承德市-隆化县','隆化县','承德市','河北省','3','068150','0314','41.31229','117.72323','longhuaxian','LHX','0');
INSERT INTO `tk_cities` VALUES('130826','130800','丰宁满族自治县','河北省-承德市-丰宁满族自治县','丰宁满族自治县','承德市','河北省','3','068350','0314','41.20315','116.64331','fengningmanzuzizhixian','FNMZZZX','0');
INSERT INTO `tk_cities` VALUES('130827','130800','宽城满族自治县','河北省-承德市-宽城满族自治县','宽城满族自治县','承德市','河北省','3','067600','0314','40.60684','118.48558','kuanchengmanzuzizhixian','KCMZZZX','0');
INSERT INTO `tk_cities` VALUES('130828','130800','围场满族蒙古族自治县','河北省-承德市-围场满族蒙古族自治县','围场满族蒙古族自治县','承德市','河北省','3','068450','0314','41.9416','117.75361','weichangmanzumengguzuzizhixian','WCMZMGZZZX','0');
INSERT INTO `tk_cities` VALUES('130902','130900','新华区','河北省-沧州市-新华区','新华区','沧州市','河北省','3','061000','0317','38.05156','114.47439','xinhuaqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('130903','130900','运河区','河北省-沧州市-运河区','运河区','沧州市','河北省','3','061000','0317','38.3135','116.85157','yunhequ','YHQ','0');
INSERT INTO `tk_cities` VALUES('130921','130900','沧县','河北省-沧州市-沧县','沧县','沧州市','河北省','3','061000','0317','38.29259','116.87038','cangxian','CX','0');
INSERT INTO `tk_cities` VALUES('130922','130900','青县','河北省-沧州市-青县','青县','沧州市','河北省','3','062650','0315','38.57574','116.82196','qingxian','QX','0');
INSERT INTO `tk_cities` VALUES('130923','130900','东光县','河北省-沧州市-东光县','东光县','沧州市','河北省','3','061600','0317','37.88511','116.53113','dongguangxian','DGX','0');
INSERT INTO `tk_cities` VALUES('130924','130900','海兴县','河北省-沧州市-海兴县','海兴县','沧州市','河北省','3','061200','0317','38.13895','117.49149','haixingxian','HXX','0');
INSERT INTO `tk_cities` VALUES('130925','130900','盐山县','河北省-沧州市-盐山县','盐山县','沧州市','河北省','3','061300','0317','38.05578','117.22489','yanshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('130926','130900','肃宁县','河北省-沧州市-肃宁县','肃宁县','沧州市','河北省','3','062350','0317','38.42949','115.82912','suningxian','SNX','0');
INSERT INTO `tk_cities` VALUES('130927','130900','南皮县','河北省-沧州市-南皮县','南皮县','沧州市','河北省','3','061500','0317','38.0405','116.69657','nanpixian','NPX','0');
INSERT INTO `tk_cities` VALUES('130928','130900','吴桥县','河北省-沧州市-吴桥县','吴桥县','沧州市','河北省','3','061800','0317','37.62457','116.37878','wuqiaoxian','WQX','0');
INSERT INTO `tk_cities` VALUES('130929','130900','献县','河北省-沧州市-献县','献县','沧州市','河北省','3','062250','0317','38.19148','116.12094','xianxian','XX','0');
INSERT INTO `tk_cities` VALUES('130930','130900','孟村回族自治县','河北省-沧州市-孟村回族自治县','孟村回族自治县','沧州市','河北省','3','061400','0317','38.05965','117.09546','mengcunhuizuzizhixian','MCHZZZX','0');
INSERT INTO `tk_cities` VALUES('130981','130900','泊头市','河北省-沧州市-泊头市','泊头市','沧州市','河北省','3','062150','0317','38.07402','116.57005','botoushi','BTS','0');
INSERT INTO `tk_cities` VALUES('130982','130900','任丘市','河北省-沧州市-任丘市','任丘市','沧州市','河北省','3','062550','0317','38.71037','116.09725','renqiushi','RQS','0');
INSERT INTO `tk_cities` VALUES('130983','130900','黄骅市','河北省-沧州市-黄骅市','黄骅市','沧州市','河北省','3','061100','0317','38.36911','117.34862','huangshi','HS','0');
INSERT INTO `tk_cities` VALUES('130984','130900','河间市','河北省-沧州市-河间市','河间市','沧州市','河北省','3','062450','0317','38.43563','116.08446','hejianshi','HJS','0');
INSERT INTO `tk_cities` VALUES('131002','131000','安次区','河北省-廊坊市-安次区','安次区','廊坊市','河北省','3','065000','0316','39.51466','116.68512','anciqu','ACQ','0');
INSERT INTO `tk_cities` VALUES('131003','131000','广阳区','河北省-廊坊市-广阳区','广阳区','廊坊市','河北省','3','065000','0316','39.52508','116.72024','guangyangqu','GYQ','0');
INSERT INTO `tk_cities` VALUES('131022','131000','固安县','河北省-廊坊市-固安县','固安县','廊坊市','河北省','3','065500','0316','39.43594','116.29539','guanxian','GAX','0');
INSERT INTO `tk_cities` VALUES('131023','131000','永清县','河北省-廊坊市-永清县','永清县','廊坊市','河北省','3','065600','0316','39.31964','116.49499','yongqingxian','YQX','0');
INSERT INTO `tk_cities` VALUES('131024','131000','香河县','河北省-廊坊市-香河县','香河县','廊坊市','河北省','3','065400','0316','39.76021','117.00023','xianghexian','XHX','0');
INSERT INTO `tk_cities` VALUES('131025','131000','大城县','河北省-廊坊市-大城县','大城县','廊坊市','河北省','3','065900','0316','38.69556','116.62717','dachengxian','DCX','0');
INSERT INTO `tk_cities` VALUES('131026','131000','文安县','河北省-廊坊市-文安县','文安县','廊坊市','河北省','3','065800','0316','38.86714','116.46409','wenanxian','WAX','0');
INSERT INTO `tk_cities` VALUES('131028','131000','大厂回族自治县','河北省-廊坊市-大厂回族自治县','大厂回族自治县','廊坊市','河北省','3','065300','0316','39.88535','116.98311','dachanghuizuzizhixian','DCHZZZX','0');
INSERT INTO `tk_cities` VALUES('131081','131000','霸州市','河北省-廊坊市-霸州市','霸州市','廊坊市','河北省','3','065700','0316','39.10695','116.39938','bazhoushi','BZS','0');
INSERT INTO `tk_cities` VALUES('131082','131000','三河市','河北省-廊坊市-三河市','三河市','廊坊市','河北省','3','065200','0316','39.98225','117.06594','sanheshi','SHS','0');
INSERT INTO `tk_cities` VALUES('131102','131100','桃城区','河北省-衡水市-桃城区','桃城区','衡水市','河北省','3','053000','0318','37.73615','115.69121','taochengqu','TCQ','0');
INSERT INTO `tk_cities` VALUES('131121','131100','枣强县','河北省-衡水市-枣强县','枣强县','衡水市','河北省','3','053100','0318','37.50964','115.7199','zaoqiangxian','ZQX','0');
INSERT INTO `tk_cities` VALUES('131122','131100','武邑县','河北省-衡水市-武邑县','武邑县','衡水市','河北省','3','053400','0318','37.80842','115.89083','wuyixian','WYX','0');
INSERT INTO `tk_cities` VALUES('131123','131100','武强县','河北省-衡水市-武强县','武强县','衡水市','河北省','3','053300','0318','38.0408','115.97653','wuqiangxian','WQX','0');
INSERT INTO `tk_cities` VALUES('131124','131100','饶阳县','河北省-衡水市-饶阳县','饶阳县','衡水市','河北省','3','053900','0318','38.24148','115.73603','raoyangxian','RYX','0');
INSERT INTO `tk_cities` VALUES('131125','131100','安平县','河北省-衡水市-安平县','安平县','衡水市','河北省','3','053600','0318','38.23328','115.51279','anpingxian','APX','0');
INSERT INTO `tk_cities` VALUES('131126','131100','故城县','河北省-衡水市-故城县','故城县','衡水市','河北省','3','053800','0318','37.34725','115.96516','guchengxian','GCX','0');
INSERT INTO `tk_cities` VALUES('131127','131100','景县','河北省-衡水市-景县','景县','衡水市','河北省','3','053500','0318','37.6919','116.26334','jingxian','JX','0');
INSERT INTO `tk_cities` VALUES('131128','131100','阜城县','河北省-衡水市-阜城县','阜城县','衡水市','河北省','3','053700','0318','37.86893','116.15008','fuchengxian','FCX','0');
INSERT INTO `tk_cities` VALUES('131181','131100','冀州市','河北省-衡水市-冀州市','冀州市','衡水市','河北省','3','053200','0318','37.56444','115.5609','jizhoushi','JZS','0');
INSERT INTO `tk_cities` VALUES('131182','131100','深州市','河北省-衡水市-深州市','深州市','衡水市','河北省','3','052800','0318','38.0096','115.55197','shenzhoushi','SZS','0');
INSERT INTO `tk_cities` VALUES('140000','0','山西省','山西省','','','山西省','1','','','','','shanxisheng','SXS','0');
INSERT INTO `tk_cities` VALUES('140100','140000','太原市','山西省-太原市','','太原市','山西省','2','030000','0351','','','taiyuanshi','TYS','0');
INSERT INTO `tk_cities` VALUES('140200','140000','大同市','山西省-大同市','','大同市','山西省','2','037000','0352','','','datongshi','DTS','0');
INSERT INTO `tk_cities` VALUES('140300','140000','阳泉市','山西省-阳泉市','','阳泉市','山西省','2','045000','0353','','','yangquanshi','YQS','0');
INSERT INTO `tk_cities` VALUES('140400','140000','长治市','山西省-长治市','','长治市','山西省','2','046000','0355','','','changzhishi','CZS','0');
INSERT INTO `tk_cities` VALUES('140500','140000','晋城市','山西省-晋城市','','晋城市','山西省','2','048000','0356','','','jinchengshi','JCS','0');
INSERT INTO `tk_cities` VALUES('140600','140000','朔州市','山西省-朔州市','','朔州市','山西省','2','038500','0349','','','shuozhoushi','SZS','0');
INSERT INTO `tk_cities` VALUES('140700','140000','晋中市','山西省-晋中市','','晋中市','山西省','2','030600','0354','','','jinzhongshi','JZS','0');
INSERT INTO `tk_cities` VALUES('140800','140000','运城市','山西省-运城市','','运城市','山西省','2','044000','0359','','','yunchengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('140900','140000','忻州市','山西省-忻州市','','忻州市','山西省','2','034000','0350','','','xinzhoushi','XZS','0');
INSERT INTO `tk_cities` VALUES('141000','140000','临汾市','山西省-临汾市','','临汾市','山西省','2','041000','0350','','','linfenshi','LFS','0');
INSERT INTO `tk_cities` VALUES('141100','140000','吕梁市','山西省-吕梁市','','吕梁市','山西省','2','033000','0358','','','lvliangshi','LLS','0');
INSERT INTO `tk_cities` VALUES('140105','140100','小店区','山西省-太原市-小店区','小店区','太原市','山西省','3','030000','0351','','','xiaodianqu','XDQ','0');
INSERT INTO `tk_cities` VALUES('140106','140100','迎泽区','山西省-太原市-迎泽区','迎泽区','太原市','山西省','3','030000','0351','','','yingzequ','YZQ','0');
INSERT INTO `tk_cities` VALUES('140107','140100','杏花岭区','山西省-太原市-杏花岭区','杏花岭区','太原市','山西省','3','030000','0351','','','xinghualingqu','XHLQ','0');
INSERT INTO `tk_cities` VALUES('140108','140100','尖草坪区','山西省-太原市-尖草坪区','尖草坪区','太原市','山西省','3','030000','0351','','','jiancaopingqu','JCPQ','0');
INSERT INTO `tk_cities` VALUES('140109','140100','万柏林区','山西省-太原市-万柏林区','万柏林区','太原市','山西省','3','030000','0351','','','wanbailinqu','WBLQ','0');
INSERT INTO `tk_cities` VALUES('140110','140100','晋源区','山西省-太原市-晋源区','晋源区','太原市','山西省','3','030000','0351','','','jinyuanqu','JYQ','0');
INSERT INTO `tk_cities` VALUES('140121','140100','清徐县','山西省-太原市-清徐县','清徐县','太原市','山西省','3','030400','0351','','','qingxuxian','QXX','0');
INSERT INTO `tk_cities` VALUES('140122','140100','阳曲县','山西省-太原市-阳曲县','阳曲县','太原市','山西省','3','030100','0351','','','yangquxian','YQX','0');
INSERT INTO `tk_cities` VALUES('140123','140100','娄烦县','山西省-太原市-娄烦县','娄烦县','太原市','山西省','3','030300','0351','','','loufanxian','LFX','0');
INSERT INTO `tk_cities` VALUES('140181','140100','古交市','山西省-太原市-古交市','古交市','太原市','山西省','3','030200','0351','','','gujiaoshi','GJS','0');
INSERT INTO `tk_cities` VALUES('140202','140200','城区','山西省-大同市-城区','城区','大同市','山西省','3','037000','0352','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('140203','140200','矿区','山西省-大同市-矿区','矿区','大同市','山西省','3','037000','0352','','','kuangqu','KQ','0');
INSERT INTO `tk_cities` VALUES('140211','140200','南郊区','山西省-大同市-南郊区','南郊区','大同市','山西省','3','037000','0352','','','nanjiaoqu','NJQ','0');
INSERT INTO `tk_cities` VALUES('140212','140200','新荣区','山西省-大同市-新荣区','新荣区','大同市','山西省','3','037000','0352','','','xinrongqu','XRQ','0');
INSERT INTO `tk_cities` VALUES('140221','140200','阳高县','山西省-大同市-阳高县','阳高县','大同市','山西省','3','038100','0352','','','yanggaoxian','YGX','0');
INSERT INTO `tk_cities` VALUES('140222','140200','天镇县','山西省-大同市-天镇县','天镇县','大同市','山西省','3','038200','0352','','','tianzhenxian','TZX','0');
INSERT INTO `tk_cities` VALUES('140223','140200','广灵县','山西省-大同市-广灵县','广灵县','大同市','山西省','3','037500','0352','','','guanglingxian','GLX','0');
INSERT INTO `tk_cities` VALUES('140224','140200','灵丘县','山西省-大同市-灵丘县','灵丘县','大同市','山西省','3','034400','0352','','','lingqiuxian','LQX','0');
INSERT INTO `tk_cities` VALUES('140225','140200','浑源县','山西省-大同市-浑源县','浑源县','大同市','山西省','3','037400','0352','','','hunyuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('140226','140200','左云县','山西省-大同市-左云县','左云县','大同市','山西省','3','037100','0352','','','zuoyunxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('140227','140200','大同县','山西省-大同市-大同县','大同县','大同市','山西省','3','037300','0352','','','datongxian','DTX','0');
INSERT INTO `tk_cities` VALUES('140302','140300','城区','山西省-阳泉市-城区','城区','阳泉市','山西省','3','045000','0353','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('140303','140300','矿区','山西省-阳泉市-矿区','矿区','阳泉市','山西省','3','045000','0353','','','kuangqu','KQ','0');
INSERT INTO `tk_cities` VALUES('140311','140300','郊区','山西省-阳泉市-郊区','郊区','阳泉市','山西省','3','045000','0353','','','jiaoqu','JQ','0');
INSERT INTO `tk_cities` VALUES('140321','140300','平定县','山西省-阳泉市-平定县','平定县','阳泉市','山西省','3','045200','0353','','','pingdingxian','PDX','0');
INSERT INTO `tk_cities` VALUES('140322','140300','盂县','山西省-阳泉市-盂县','盂县','阳泉市','山西省','3','045100','0353','','','yuxian','YX','0');
INSERT INTO `tk_cities` VALUES('140402','140400','城区','山西省-长治市-城区','城区','长治市','山西省','3','046000','0355','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('140411','140400','郊区','山西省-长治市-郊区','郊区','长治市','山西省','3','046000','0355','','','jiaoqu','JQ','0');
INSERT INTO `tk_cities` VALUES('140421','140400','长治县','山西省-长治市-长治县','长治县','长治市','山西省','3','046000','0355','','','changzhixian','CZX','0');
INSERT INTO `tk_cities` VALUES('140423','140400','襄垣县','山西省-长治市-襄垣县','襄垣县','长治市','山西省','3','046200','0355','','','xiangyuanxian','XYX','0');
INSERT INTO `tk_cities` VALUES('140424','140400','屯留县','山西省-长治市-屯留县','屯留县','长治市','山西省','3','046100','0355','','','tunliuxian','TLX','0');
INSERT INTO `tk_cities` VALUES('140425','140400','平顺县','山西省-长治市-平顺县','平顺县','长治市','山西省','3','047400','0355','','','pingshunxian','PSX','0');
INSERT INTO `tk_cities` VALUES('140426','140400','黎城县','山西省-长治市-黎城县','黎城县','长治市','山西省','3','047600','0355','','','lichengxian','LCX','0');
INSERT INTO `tk_cities` VALUES('140427','140400','壶关县','山西省-长治市-壶关县','壶关县','长治市','山西省','3','047300','0355','','','huguanxian','HGX','0');
INSERT INTO `tk_cities` VALUES('140428','140400','长子县','山西省-长治市-长子县','长子县','长治市','山西省','3','046600','0355','','','changzixian','CZX','0');
INSERT INTO `tk_cities` VALUES('140429','140400','武乡县','山西省-长治市-武乡县','武乡县','长治市','山西省','3','046300','0355','','','wuxiangxian','WXX','0');
INSERT INTO `tk_cities` VALUES('140430','140400','沁县','山西省-长治市-沁县','沁县','长治市','山西省','3','046400','0355','','','qinxian','QX','0');
INSERT INTO `tk_cities` VALUES('140431','140400','沁源县','山西省-长治市-沁源县','沁源县','长治市','山西省','3','046500','0355','','','qinyuanxian','QYX','0');
INSERT INTO `tk_cities` VALUES('140481','140400','潞城市','山西省-长治市-潞城市','潞城市','长治市','山西省','3','047500','0355','','','luchengshi','LCS','0');
INSERT INTO `tk_cities` VALUES('140502','140500','城区','山西省-晋城市-城区','城区','晋城市','山西省','3','048000','0356','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('140521','140500','沁水县','山西省-晋城市-沁水县','沁水县','晋城市','山西省','3','048200','0356','','','qinshuixian','QSX','0');
INSERT INTO `tk_cities` VALUES('140522','140500','阳城县','山西省-晋城市-阳城县','阳城县','晋城市','山西省','3','048100','0356','','','yangchengxian','YCX','0');
INSERT INTO `tk_cities` VALUES('140524','140500','陵川县','山西省-晋城市-陵川县','陵川县','晋城市','山西省','3','048300','0356','','','lingchuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('140525','140500','泽州县','山西省-晋城市-泽州县','泽州县','晋城市','山西省','3','048000','0356','','','zezhouxian','ZZX','0');
INSERT INTO `tk_cities` VALUES('140581','140500','高平市','山西省-晋城市-高平市','高平市','晋城市','山西省','3','046700','0356','','','gaopingshi','GPS','0');
INSERT INTO `tk_cities` VALUES('140602','140600','朔城区','山西省-朔州市-朔城区','朔城区','朔州市','山西省','3','038500','0349','','','shuochengqu','SCQ','0');
INSERT INTO `tk_cities` VALUES('140603','140600','平鲁区','山西省-朔州市-平鲁区','平鲁区','朔州市','山西省','3','038500','0349','','','pingluqu','PLQ','0');
INSERT INTO `tk_cities` VALUES('140621','140600','山阴县','山西省-朔州市-山阴县','山阴县','朔州市','山西省','3','038400','0349','','','shanyinxian','SYX','0');
INSERT INTO `tk_cities` VALUES('140622','140600','应县','山西省-朔州市-应县','应县','朔州市','山西省','3','037600','0349','','','yingxian','YX','0');
INSERT INTO `tk_cities` VALUES('140623','140600','右玉县','山西省-朔州市-右玉县','右玉县','朔州市','山西省','3','037200','0349','','','youyuxian','YYX','0');
INSERT INTO `tk_cities` VALUES('140624','140600','怀仁县','山西省-朔州市-怀仁县','怀仁县','朔州市','山西省','3','038300','0349','','','huairenxian','HRX','0');
INSERT INTO `tk_cities` VALUES('140702','140700','榆次区','山西省-晋中市-榆次区','榆次区','晋中市','山西省','3','030600','0354','','','yuciqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('140721','140700','榆社县','山西省-晋中市-榆社县','榆社县','晋中市','山西省','3','031800','0354','','','yushexian','YSX','0');
INSERT INTO `tk_cities` VALUES('140722','140700','左权县','山西省-晋中市-左权县','左权县','晋中市','山西省','3','032600','0354','','','zuoquanxian','ZQX','0');
INSERT INTO `tk_cities` VALUES('140723','140700','和顺县','山西省-晋中市-和顺县','和顺县','晋中市','山西省','3','032700','0354','','','heshunxian','HSX','0');
INSERT INTO `tk_cities` VALUES('140724','140700','昔阳县','山西省-晋中市-昔阳县','昔阳县','晋中市','山西省','3','045300','0354','','','xiyangxian','XYX','0');
INSERT INTO `tk_cities` VALUES('140725','140700','寿阳县','山西省-晋中市-寿阳县','寿阳县','晋中市','山西省','3','031700','0354','','','shouyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('140726','140700','太谷县','山西省-晋中市-太谷县','太谷县','晋中市','山西省','3','030800','0354','','','taiguxian','TGX','0');
INSERT INTO `tk_cities` VALUES('140727','140700','祁县','山西省-晋中市-祁县','祁县','晋中市','山西省','3','030900','0354','','','qixian','QX','0');
INSERT INTO `tk_cities` VALUES('140728','140700','平遥县','山西省-晋中市-平遥县','平遥县','晋中市','山西省','3','031100','0354','','','pingyaoxian','PYX','0');
INSERT INTO `tk_cities` VALUES('140729','140700','灵石县','山西省-晋中市-灵石县','灵石县','晋中市','山西省','3','031300','0354','','','lingshixian','LSX','0');
INSERT INTO `tk_cities` VALUES('140781','140700','介休市','山西省-晋中市-介休市','介休市','晋中市','山西省','3','031200','0354','','','jiexiushi','JXS','0');
INSERT INTO `tk_cities` VALUES('140802','140800','盐湖区','山西省-运城市-盐湖区','盐湖区','运城市','山西省','3','044000','0359','','','yanhuqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('140821','140800','临猗县','山西省-运城市-临猗县','临猗县','运城市','山西省','3','044100','0359','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('140822','140800','万荣县','山西省-运城市-万荣县','万荣县','运城市','山西省','3','044200','0359','','','wanrongxian','WRX','0');
INSERT INTO `tk_cities` VALUES('140823','140800','闻喜县','山西省-运城市-闻喜县','闻喜县','运城市','山西省','3','043800','0359','','','wenxixian','WXX','0');
INSERT INTO `tk_cities` VALUES('140824','140800','稷山县','山西省-运城市-稷山县','稷山县','运城市','山西省','3','043200','0359','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('140825','140800','新绛县','山西省-运城市-新绛县','新绛县','运城市','山西省','3','043100','0359','','','xinxian','XX','0');
INSERT INTO `tk_cities` VALUES('140826','140800','绛县','山西省-运城市-绛县','绛县','运城市','山西省','3','043600','0359','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('140827','140800','垣曲县','山西省-运城市-垣曲县','垣曲县','运城市','山西省','3','043700','0359','','','yuanquxian','YQX','0');
INSERT INTO `tk_cities` VALUES('140828','140800','夏县','山西省-运城市-夏县','夏县','运城市','山西省','3','044400','0359','','','xiaxian','XX','0');
INSERT INTO `tk_cities` VALUES('140829','140800','平陆县','山西省-运城市-平陆县','平陆县','运城市','山西省','3','044300','0359','','','pingluxian','PLX','0');
INSERT INTO `tk_cities` VALUES('140830','140800','芮城县','山西省-运城市-芮城县','芮城县','运城市','山西省','3','044600','0359','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('140881','140800','永济市','山西省-运城市-永济市','永济市','运城市','山西省','3','044500','0359','','','yongjishi','YJS','0');
INSERT INTO `tk_cities` VALUES('140882','140800','河津市','山西省-运城市-河津市','河津市','运城市','山西省','3','043300','0359','','','hejinshi','HJS','0');
INSERT INTO `tk_cities` VALUES('140902','140900','忻府区','山西省-忻州市-忻府区','忻府区','忻州市','山西省','3','034000','0350','','','xinfuqu','XFQ','0');
INSERT INTO `tk_cities` VALUES('140921','140900','定襄县','山西省-忻州市-定襄县','定襄县','忻州市','山西省','3','035400','0350','','','dingxiangxian','DXX','0');
INSERT INTO `tk_cities` VALUES('140922','140900','五台县','山西省-忻州市-五台县','五台县','忻州市','山西省','3','035500','0350','','','wutaixian','WTX','0');
INSERT INTO `tk_cities` VALUES('140923','140900','代县','山西省-忻州市-代县','代县','忻州市','山西省','3','034200','0350','','','daixian','DX','0');
INSERT INTO `tk_cities` VALUES('140924','140900','繁峙县','山西省-忻州市-繁峙县','繁峙县','忻州市','山西省','3','034300','0350','','','fanzhixian','FZX','0');
INSERT INTO `tk_cities` VALUES('140925','140900','宁武县','山西省-忻州市-宁武县','宁武县','忻州市','山西省','3','036000','0350','','','ningwuxian','NWX','0');
INSERT INTO `tk_cities` VALUES('140926','140900','静乐县','山西省-忻州市-静乐县','静乐县','忻州市','山西省','3','035100','0350','','','jinglexian','JLX','0');
INSERT INTO `tk_cities` VALUES('140927','140900','神池县','山西省-忻州市-神池县','神池县','忻州市','山西省','3','036100','0350','','','shenchixian','SCX','0');
INSERT INTO `tk_cities` VALUES('140928','140900','五寨县','山西省-忻州市-五寨县','五寨县','忻州市','山西省','3','036200','0350','','','wuzhaixian','WZX','0');
INSERT INTO `tk_cities` VALUES('140929','140900','岢岚县','山西省-忻州市-岢岚县','岢岚县','忻州市','山西省','3','036300','0350','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('140930','140900','河曲县','山西省-忻州市-河曲县','河曲县','忻州市','山西省','3','036500','0350','','','hequxian','HQX','0');
INSERT INTO `tk_cities` VALUES('140931','140900','保德县','山西省-忻州市-保德县','保德县','忻州市','山西省','3','036600','0350','','','baodexian','BDX','0');
INSERT INTO `tk_cities` VALUES('140932','140900','偏关县','山西省-忻州市-偏关县','偏关县','忻州市','山西省','3','036400','0350','','','pianguanxian','PGX','0');
INSERT INTO `tk_cities` VALUES('140981','140900','原平市','山西省-忻州市-原平市','原平市','忻州市','山西省','3','034100','0350','','','yuanpingshi','YPS','0');
INSERT INTO `tk_cities` VALUES('141002','141000','尧都区','山西省-临汾市-尧都区','尧都区','临汾市','山西省','3','041000','0357','','','yaoduqu','YDQ','0');
INSERT INTO `tk_cities` VALUES('141021','141000','曲沃县','山西省-临汾市-曲沃县','曲沃县','临汾市','山西省','3','043400','0357','','','quwoxian','QWX','0');
INSERT INTO `tk_cities` VALUES('141022','141000','翼城县','山西省-临汾市-翼城县','翼城县','临汾市','山西省','3','043500','0357','','','yichengxian','YCX','0');
INSERT INTO `tk_cities` VALUES('141023','141000','襄汾县','山西省-临汾市-襄汾县','襄汾县','临汾市','山西省','3','041500','0357','','','xiangfenxian','XFX','0');
INSERT INTO `tk_cities` VALUES('141024','141000','洪洞县','山西省-临汾市-洪洞县','洪洞县','临汾市','山西省','3','031600','0357','','','hongdongxian','HDX','0');
INSERT INTO `tk_cities` VALUES('141025','141000','古县','山西省-临汾市-古县','古县','临汾市','山西省','3','042400','0357','','','guxian','GX','0');
INSERT INTO `tk_cities` VALUES('141026','141000','安泽县','山西省-临汾市-安泽县','安泽县','临汾市','山西省','3','042500','0357','','','anzexian','AZX','0');
INSERT INTO `tk_cities` VALUES('141027','141000','浮山县','山西省-临汾市-浮山县','浮山县','临汾市','山西省','3','042600','0357','','','fushanxian','FSX','0');
INSERT INTO `tk_cities` VALUES('141028','141000','吉县','山西省-临汾市-吉县','吉县','临汾市','山西省','3','042200','0357','','','jixian','JX','0');
INSERT INTO `tk_cities` VALUES('141029','141000','乡宁县','山西省-临汾市-乡宁县','乡宁县','临汾市','山西省','3','042100','0357','','','xiangningxian','XNX','0');
INSERT INTO `tk_cities` VALUES('141030','141000','大宁县','山西省-临汾市-大宁县','大宁县','临汾市','山西省','3','042300','0357','','','daningxian','DNX','0');
INSERT INTO `tk_cities` VALUES('141031','141000','隰县','山西省-临汾市-隰县','隰县','临汾市','山西省','3','041300','0357','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('141032','141000','永和县','山西省-临汾市-永和县','永和县','临汾市','山西省','3','041400','0357','','','yonghexian','YHX','0');
INSERT INTO `tk_cities` VALUES('141033','141000','蒲县','山西省-临汾市-蒲县','蒲县','临汾市','山西省','3','041200','0357','','','puxian','PX','0');
INSERT INTO `tk_cities` VALUES('141034','141000','汾西县','山西省-临汾市-汾西县','汾西县','临汾市','山西省','3','031500','0357','','','fenxixian','FXX','0');
INSERT INTO `tk_cities` VALUES('141081','141000','侯马市','山西省-临汾市-侯马市','侯马市','临汾市','山西省','3','043000','0357','','','houmashi','HMS','0');
INSERT INTO `tk_cities` VALUES('141082','141000','霍州市','山西省-临汾市-霍州市','霍州市','临汾市','山西省','3','031400','0357','','','huozhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('141102','141100','离石区','山西省-吕梁市-离石区','离石区','吕梁市','山西省','3','033000','0358','','','lishiqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('141121','141100','文水县','山西省-吕梁市-文水县','文水县','吕梁市','山西省','3','032100','0358','','','wenshuixian','WSX','0');
INSERT INTO `tk_cities` VALUES('141122','141100','交城县','山西省-吕梁市-交城县','交城县','吕梁市','山西省','3','030500','0358','','','jiaochengxian','JCX','0');
INSERT INTO `tk_cities` VALUES('141123','141100','兴县','山西省-吕梁市-兴县','兴县','吕梁市','山西省','3','035300','0358','','','xingxian','XX','0');
INSERT INTO `tk_cities` VALUES('141124','141100','临县','山西省-吕梁市-临县','临县','吕梁市','山西省','3','033200','0358','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('141125','141100','柳林县','山西省-吕梁市-柳林县','柳林县','吕梁市','山西省','3','033300','0358','','','liulinxian','LLX','0');
INSERT INTO `tk_cities` VALUES('141126','141100','石楼县','山西省-吕梁市-石楼县','石楼县','吕梁市','山西省','3','032500','0358','','','shilouxian','SLX','0');
INSERT INTO `tk_cities` VALUES('141127','141100','岚县','山西省-吕梁市-岚县','岚县','吕梁市','山西省','3','035200','0358','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('141128','141100','方山县','山西省-吕梁市-方山县','方山县','吕梁市','山西省','3','033100','0358','','','fangshanxian','FSX','0');
INSERT INTO `tk_cities` VALUES('141129','141100','中阳县','山西省-吕梁市-中阳县','中阳县','吕梁市','山西省','3','033400','0358','','','zhongyangxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('141130','141100','交口县','山西省-吕梁市-交口县','交口县','吕梁市','山西省','3','032400','0358','','','jiaokouxian','JKX','0');
INSERT INTO `tk_cities` VALUES('141181','141100','孝义市','山西省-吕梁市-孝义市','孝义市','吕梁市','山西省','3','032300','0358','','','xiaoyishi','XYS','0');
INSERT INTO `tk_cities` VALUES('141182','141100','汾阳市','山西省-吕梁市-汾阳市','汾阳市','吕梁市','山西省','3','032200','0358','','','fenyangshi','FYS','0');
INSERT INTO `tk_cities` VALUES('150000','0','内蒙古自治区','内蒙古自治区','','','内蒙古自治区','1','','','','','neimengguzizhiqu','NMGZZQ','0');
INSERT INTO `tk_cities` VALUES('150100','150000','呼和浩特市','内蒙古自治区-呼和浩特市','','呼和浩特市','内蒙古自治区','2','010000','0471','','','huhehaoteshi','HHHTS','1');
INSERT INTO `tk_cities` VALUES('150200','150000','包头市','内蒙古自治区-包头市','','包头市','内蒙古自治区','2','014000','0472','','','baotoushi','BTS','0');
INSERT INTO `tk_cities` VALUES('150300','150000','乌海市','内蒙古自治区-乌海市','','乌海市','内蒙古自治区','2','016000','0473','','','wuhaishi','WHS','0');
INSERT INTO `tk_cities` VALUES('150400','150000','赤峰市','内蒙古自治区-赤峰市','','赤峰市','内蒙古自治区','2','024000','0476','','','chifengshi','CFS','0');
INSERT INTO `tk_cities` VALUES('150500','150000','通辽市','内蒙古自治区-通辽市','','通辽市','内蒙古自治区','2','028000','0475','','','tongliaoshi','TLS','0');
INSERT INTO `tk_cities` VALUES('150600','150000','鄂尔多斯市','内蒙古自治区-鄂尔多斯市','','鄂尔多斯市','内蒙古自治区','2','017000','0477','','','eerduosishi','EEDSS','0');
INSERT INTO `tk_cities` VALUES('150700','150000','呼伦贝尔市','内蒙古自治区-呼伦贝尔市','','呼伦贝尔市','内蒙古自治区','2','021000','0470','','','hulunbeiershi','HLBES','0');
INSERT INTO `tk_cities` VALUES('150800','150000','巴彦淖尔市','内蒙古自治区-巴彦淖尔市','','巴彦淖尔市','内蒙古自治区','2','015000','0478','','','bayannaoershi','BYNES','0');
INSERT INTO `tk_cities` VALUES('150900','150000','乌兰察布市','内蒙古自治区-乌兰察布市','','乌兰察布市','内蒙古自治区','2','012000','0474','','','wulanchabushi','WLCBS','0');
INSERT INTO `tk_cities` VALUES('152200','150000','兴安盟','内蒙古自治区-兴安盟','','兴安盟','内蒙古自治区','2','137400','0482','','','xinganmeng','XAM','0');
INSERT INTO `tk_cities` VALUES('152500','150000','锡林郭勒盟','内蒙古自治区-锡林郭勒盟','','锡林郭勒盟','内蒙古自治区','2','012600','0479','','','xilinguolemeng','XLGLM','0');
INSERT INTO `tk_cities` VALUES('152900','150000','阿拉善盟','内蒙古自治区-阿拉善盟','','阿拉善盟','内蒙古自治区','2','750300','0483','','','alashanmeng','ALSM','0');
INSERT INTO `tk_cities` VALUES('150102','150100','新城区','内蒙古自治区-呼和浩特市-新城区','新城区','呼和浩特市','内蒙古自治区','3','010000','0471','','','xinchengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('150103','150100','回民区','内蒙古自治区-呼和浩特市-回民区','回民区','呼和浩特市','内蒙古自治区','3','010000','0471','','','huiminqu','HMQ','0');
INSERT INTO `tk_cities` VALUES('150104','150100','玉泉区','内蒙古自治区-呼和浩特市-玉泉区','玉泉区','呼和浩特市','内蒙古自治区','3','010000','0471','','','yuquanqu','YQQ','0');
INSERT INTO `tk_cities` VALUES('150105','150100','赛罕区','内蒙古自治区-呼和浩特市-赛罕区','赛罕区','呼和浩特市','内蒙古自治区','3','010000','0471','','','saihanqu','SHQ','0');
INSERT INTO `tk_cities` VALUES('150121','150100','土默特左旗','内蒙古自治区-呼和浩特市-土默特左旗','土默特左旗','呼和浩特市','内蒙古自治区','3','010100','0471','','','tumotezuoqi','TMTZQ','0');
INSERT INTO `tk_cities` VALUES('150122','150100','托克托县','内蒙古自治区-呼和浩特市-托克托县','托克托县','呼和浩特市','内蒙古自治区','3','010200','0471','','','tuoketuoxian','TKTX','0');
INSERT INTO `tk_cities` VALUES('150123','150100','和林格尔县','内蒙古自治区-呼和浩特市-和林格尔县','和林格尔县','呼和浩特市','内蒙古自治区','3','011500','0471','','','helingeerxian','HLGEX','0');
INSERT INTO `tk_cities` VALUES('150124','150100','清水河县','内蒙古自治区-呼和浩特市-清水河县','清水河县','呼和浩特市','内蒙古自治区','3','011600','0471','','','qingshuihexian','QSHX','0');
INSERT INTO `tk_cities` VALUES('150125','150100','武川县','内蒙古自治区-呼和浩特市-武川县','武川县','呼和浩特市','内蒙古自治区','3','011700','0471','','','wuchuanxian','WCX','0');
INSERT INTO `tk_cities` VALUES('150202','150200','东河区','内蒙古自治区-包头市-东河区','东河区','包头市','内蒙古自治区','3','014000','0472','','','donghequ','DHQ','0');
INSERT INTO `tk_cities` VALUES('150203','150200','昆都仑区','内蒙古自治区-包头市-昆都仑区','昆都仑区','包头市','内蒙古自治区','3','014000','0472','','','kundulunqu','KDLQ','0');
INSERT INTO `tk_cities` VALUES('150204','150200','青山区','内蒙古自治区-包头市-青山区','青山区','包头市','内蒙古自治区','3','014000','0472','','','qingshanqu','QSQ','0');
INSERT INTO `tk_cities` VALUES('150205','150200','石拐区','内蒙古自治区-包头市-石拐区','石拐区','包头市','内蒙古自治区','3','014000','0472','','','shiguaiqu','SGQ','0');
INSERT INTO `tk_cities` VALUES('150206','150200','白云鄂博矿区','内蒙古自治区-包头市-白云鄂博矿区','白云鄂博矿区','包头市','内蒙古自治区','3','014000','0472','','','baiyunebokuangqu','BYEBKQ','0');
INSERT INTO `tk_cities` VALUES('150207','150200','九原区','内蒙古自治区-包头市-九原区','九原区','包头市','内蒙古自治区','3','014000','0472','','','jiuyuanqu','JYQ','0');
INSERT INTO `tk_cities` VALUES('150221','150200','土默特右旗','内蒙古自治区-包头市-土默特右旗','土默特右旗','包头市','内蒙古自治区','3','014100','0472','','','tumoteyouqi','TMTYQ','0');
INSERT INTO `tk_cities` VALUES('150222','150200','固阳县','内蒙古自治区-包头市-固阳县','固阳县','包头市','内蒙古自治区','3','014200','0472','','','guyangxian','GYX','0');
INSERT INTO `tk_cities` VALUES('150223','150200','达尔罕茂明安联合旗','内蒙古自治区-包头市-达尔罕茂明安联合旗','达尔罕茂明安联合旗','包头市','内蒙古自治区','3','014500','0472','','','daerhanmaominganlianheqi','DEHMMALHQ','0');
INSERT INTO `tk_cities` VALUES('150302','150300','海勃湾区','内蒙古自治区-乌海市-海勃湾区','海勃湾区','乌海市','内蒙古自治区','3','016000','0473','','','haibowanqu','HBWQ','0');
INSERT INTO `tk_cities` VALUES('150303','150300','海南区','内蒙古自治区-乌海市-海南区','海南区','乌海市','内蒙古自治区','3','016000','0473','','','hainanqu','HNQ','0');
INSERT INTO `tk_cities` VALUES('150304','150300','乌达区','内蒙古自治区-乌海市-乌达区','乌达区','乌海市','内蒙古自治区','3','016000','0473','','','wudaqu','WDQ','0');
INSERT INTO `tk_cities` VALUES('150402','150400','红山区','内蒙古自治区-赤峰市-红山区','红山区','赤峰市','内蒙古自治区','3','024000','0476','','','hongshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('150403','150400','元宝山区','内蒙古自治区-赤峰市-元宝山区','元宝山区','赤峰市','内蒙古自治区','3','024000','0476','','','yuanbaoshanqu','YBSQ','0');
INSERT INTO `tk_cities` VALUES('150404','150400','松山区','内蒙古自治区-赤峰市-松山区','松山区','赤峰市','内蒙古自治区','3','024000','0476','','','songshanqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('150421','150400','阿鲁科尔沁旗','内蒙古自治区-赤峰市-阿鲁科尔沁旗','阿鲁科尔沁旗','赤峰市','内蒙古自治区','3','025500','0476','','','alukeerqinqi','ALKEQQ','0');
INSERT INTO `tk_cities` VALUES('150422','150400','巴林左旗','内蒙古自治区-赤峰市-巴林左旗','巴林左旗','赤峰市','内蒙古自治区','3','025450','0476','','','balinzuoqi','BLZQ','0');
INSERT INTO `tk_cities` VALUES('150423','150400','巴林右旗','内蒙古自治区-赤峰市-巴林右旗','巴林右旗','赤峰市','内蒙古自治区','3','025150','0476','','','balinyouqi','BLYQ','0');
INSERT INTO `tk_cities` VALUES('150424','150400','林西县','内蒙古自治区-赤峰市-林西县','林西县','赤峰市','内蒙古自治区','3','025250','0476','','','linxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('150425','150400','克什克腾旗','内蒙古自治区-赤峰市-克什克腾旗','克什克腾旗','赤峰市','内蒙古自治区','3','025350','0476','','','keshiketengqi','KSKTQ','0');
INSERT INTO `tk_cities` VALUES('150426','150400','翁牛特旗','内蒙古自治区-赤峰市-翁牛特旗','翁牛特旗','赤峰市','内蒙古自治区','3','024500','0476','','','wengniuteqi','WNTQ','0');
INSERT INTO `tk_cities` VALUES('150428','150400','喀喇沁旗','内蒙古自治区-赤峰市-喀喇沁旗','喀喇沁旗','赤峰市','内蒙古自治区','3','024400','0476','','','kalaqinqi','KLQQ','0');
INSERT INTO `tk_cities` VALUES('150429','150400','宁城县','内蒙古自治区-赤峰市-宁城县','宁城县','赤峰市','内蒙古自治区','3','024200','0476','','','ningchengxian','NCX','0');
INSERT INTO `tk_cities` VALUES('150430','150400','敖汉旗','内蒙古自治区-赤峰市-敖汉旗','敖汉旗','赤峰市','内蒙古自治区','3','024300','0476','','','aohanqi','AHQ','0');
INSERT INTO `tk_cities` VALUES('150502','150500','科尔沁区','内蒙古自治区-通辽市-科尔沁区','科尔沁区','通辽市','内蒙古自治区','3','028000','0475','','','keerqinqu','KEQQ','0');
INSERT INTO `tk_cities` VALUES('150521','150500','科尔沁左翼中旗','内蒙古自治区-通辽市-科尔沁左翼中旗','科尔沁左翼中旗','通辽市','内蒙古自治区','3','029300','0475','','','keerqinzuoyizhongqi','KEQZYZQ','0');
INSERT INTO `tk_cities` VALUES('150522','150500','科尔沁左翼后旗','内蒙古自治区-通辽市-科尔沁左翼后旗','科尔沁左翼后旗','通辽市','内蒙古自治区','3','028100','0475','','','keerqinzuoyihouqi','KEQZYHQ','0');
INSERT INTO `tk_cities` VALUES('150523','150500','开鲁县','内蒙古自治区-通辽市-开鲁县','开鲁县','通辽市','内蒙古自治区','3','028400','0475','','','kailuxian','KLX','0');
INSERT INTO `tk_cities` VALUES('150524','150500','库伦旗','内蒙古自治区-通辽市-库伦旗','库伦旗','通辽市','内蒙古自治区','3','028200','0475','','','kulunqi','KLQ','0');
INSERT INTO `tk_cities` VALUES('150525','150500','奈曼旗','内蒙古自治区-通辽市-奈曼旗','奈曼旗','通辽市','内蒙古自治区','3','028300','0475','','','naimanqi','NMQ','0');
INSERT INTO `tk_cities` VALUES('150526','150500','扎鲁特旗','内蒙古自治区-通辽市-扎鲁特旗','扎鲁特旗','通辽市','内蒙古自治区','3','029100','0475','','','zhaluteqi','ZLTQ','0');
INSERT INTO `tk_cities` VALUES('150581','150500','霍林郭勒市','内蒙古自治区-通辽市-霍林郭勒市','霍林郭勒市','通辽市','内蒙古自治区','3','029200','0475','','','huolinguoleshi','HLGLS','0');
INSERT INTO `tk_cities` VALUES('150602','150600','东胜区','内蒙古自治区-鄂尔多斯市-东胜区','东胜区','鄂尔多斯市','内蒙古自治区','3','017000','0477','','','dongshengqu','DSQ','0');
INSERT INTO `tk_cities` VALUES('150621','150600','达拉特旗','内蒙古自治区-鄂尔多斯市-达拉特旗','达拉特旗','鄂尔多斯市','内蒙古自治区','3','014300','0477','','','dalateqi','DLTQ','0');
INSERT INTO `tk_cities` VALUES('150622','150600','准格尔旗','内蒙古自治区-鄂尔多斯市-准格尔旗','准格尔旗','鄂尔多斯市','内蒙古自治区','3','017100','0477','','','zhungeerqi','ZGEQ','0');
INSERT INTO `tk_cities` VALUES('150623','150600','鄂托克前旗','内蒙古自治区-鄂尔多斯市-鄂托克前旗','鄂托克前旗','鄂尔多斯市','内蒙古自治区','3','016200','0477','','','etuokeqianqi','ETKQQ','0');
INSERT INTO `tk_cities` VALUES('150624','150600','鄂托克旗','内蒙古自治区-鄂尔多斯市-鄂托克旗','鄂托克旗','鄂尔多斯市','内蒙古自治区','3','016100','0477','','','etuokeqi','ETKQ','0');
INSERT INTO `tk_cities` VALUES('150625','150600','杭锦旗','内蒙古自治区-鄂尔多斯市-杭锦旗','杭锦旗','鄂尔多斯市','内蒙古自治区','3','017400','0477','','','hangjinqi','HJQ','0');
INSERT INTO `tk_cities` VALUES('150626','150600','乌审旗','内蒙古自治区-鄂尔多斯市-乌审旗','乌审旗','鄂尔多斯市','内蒙古自治区','3','017300','0477','','','wushenqi','WSQ','0');
INSERT INTO `tk_cities` VALUES('150627','150600','伊金霍洛旗','内蒙古自治区-鄂尔多斯市-伊金霍洛旗','伊金霍洛旗','鄂尔多斯市','内蒙古自治区','3','017200','0477','','','yijinhuoluoqi','YJHLQ','0');
INSERT INTO `tk_cities` VALUES('150702','150700','海拉尔区','内蒙古自治区-呼伦贝尔市-海拉尔区','海拉尔区','呼伦贝尔市','内蒙古自治区','3','021000','0470','','','hailaerqu','HLEQ','0');
INSERT INTO `tk_cities` VALUES('150721','150700','阿荣旗','内蒙古自治区-呼伦贝尔市-阿荣旗','阿荣旗','呼伦贝尔市','内蒙古自治区','3','162750','0470','','','arongqi','ARQ','0');
INSERT INTO `tk_cities` VALUES('150722','150700','莫力达瓦达斡尔族自治旗','内蒙古自治区-呼伦贝尔市-莫力达瓦达斡尔族自治旗','莫力达瓦达斡尔族自治旗','呼伦贝尔市','内蒙古自治区','3','162850','0470','','','molidawadawoerzuzizhiqi','MLDWDWEZZZQ','0');
INSERT INTO `tk_cities` VALUES('150723','150700','鄂伦春自治旗','内蒙古自治区-呼伦贝尔市-鄂伦春自治旗','鄂伦春自治旗','呼伦贝尔市','内蒙古自治区','3','022450','0470','','','elunchunzizhiqi','ELCZZQ','0');
INSERT INTO `tk_cities` VALUES('150724','150700','鄂温克族自治旗','内蒙古自治区-呼伦贝尔市-鄂温克族自治旗','鄂温克族自治旗','呼伦贝尔市','内蒙古自治区','3','021100','0470','','','ewenkezuzizhiqi','EWKZZZQ','0');
INSERT INTO `tk_cities` VALUES('150725','150700','陈巴尔虎旗','内蒙古自治区-呼伦贝尔市-陈巴尔虎旗','陈巴尔虎旗','呼伦贝尔市','内蒙古自治区','3','021500','0470','','','chenbaerhuqi','CBEHQ','0');
INSERT INTO `tk_cities` VALUES('150726','150700','新巴尔虎左旗','内蒙古自治区-呼伦贝尔市-新巴尔虎左旗','新巴尔虎左旗','呼伦贝尔市','内蒙古自治区','3','021200','0470','','','xinbaerhuzuoqi','XBEHZQ','0');
INSERT INTO `tk_cities` VALUES('150727','150700','新巴尔虎右旗','内蒙古自治区-呼伦贝尔市-新巴尔虎右旗','新巴尔虎右旗','呼伦贝尔市','内蒙古自治区','3','021300','0470','','','xinbaerhuyouqi','XBEHYQ','0');
INSERT INTO `tk_cities` VALUES('150781','150700','满洲里市','内蒙古自治区-呼伦贝尔市-满洲里市','满洲里市','呼伦贝尔市','内蒙古自治区','3','021400','0470','','','manzhoulishi','MZLS','0');
INSERT INTO `tk_cities` VALUES('150782','150700','牙克石市','内蒙古自治区-呼伦贝尔市-牙克石市','牙克石市','呼伦贝尔市','内蒙古自治区','3','022150','0470','','','yakeshishi','YKSS','0');
INSERT INTO `tk_cities` VALUES('150783','150700','扎兰屯市','内蒙古自治区-呼伦贝尔市-扎兰屯市','扎兰屯市','呼伦贝尔市','内蒙古自治区','3','162650','0470','','','zhalantunshi','ZLTS','0');
INSERT INTO `tk_cities` VALUES('150784','150700','额尔古纳市','内蒙古自治区-呼伦贝尔市-额尔古纳市','额尔古纳市','呼伦贝尔市','内蒙古自治区','3','022250','0470','','','eergunashi','EEGNS','0');
INSERT INTO `tk_cities` VALUES('150785','150700','根河市','内蒙古自治区-呼伦贝尔市-根河市','根河市','呼伦贝尔市','内蒙古自治区','3','022350','0470','','','genheshi','GHS','0');
INSERT INTO `tk_cities` VALUES('150802','150800','临河区','内蒙古自治区-巴彦淖尔市-临河区','临河区','巴彦淖尔市','内蒙古自治区','3','015000','0478','','','linhequ','LHQ','0');
INSERT INTO `tk_cities` VALUES('150821','150800','五原县','内蒙古自治区-巴彦淖尔市-五原县','五原县','巴彦淖尔市','内蒙古自治区','3','015100','0478','','','wuyuanxian','WYX','0');
INSERT INTO `tk_cities` VALUES('150822','150800','磴口县','内蒙古自治区-巴彦淖尔市-磴口县','磴口县','巴彦淖尔市','内蒙古自治区','3','015200','0478','','','kouxian','KX','0');
INSERT INTO `tk_cities` VALUES('150823','150800','乌拉特前旗','内蒙古自治区-巴彦淖尔市-乌拉特前旗','乌拉特前旗','巴彦淖尔市','内蒙古自治区','3','014400','0478','','','wulateqianqi','WLTQQ','0');
INSERT INTO `tk_cities` VALUES('150824','150800','乌拉特中旗','内蒙古自治区-巴彦淖尔市-乌拉特中旗','乌拉特中旗','巴彦淖尔市','内蒙古自治区','3','015300','0478','','','wulatezhongqi','WLTZQ','0');
INSERT INTO `tk_cities` VALUES('150825','150800','乌拉特后旗','内蒙古自治区-巴彦淖尔市-乌拉特后旗','乌拉特后旗','巴彦淖尔市','内蒙古自治区','3','015500','0478','','','wulatehouqi','WLTHQ','0');
INSERT INTO `tk_cities` VALUES('150826','150800','杭锦后旗','内蒙古自治区-巴彦淖尔市-杭锦后旗','杭锦后旗','巴彦淖尔市','内蒙古自治区','3','015400','0478','','','hangjinhouqi','HJHQ','0');
INSERT INTO `tk_cities` VALUES('150902','150900','集宁区','内蒙古自治区-乌兰察布市-集宁区','集宁区','乌兰察布市','内蒙古自治区','3','012000','0474','','','jiningqu','JNQ','0');
INSERT INTO `tk_cities` VALUES('150921','150900','卓资县','内蒙古自治区-乌兰察布市-卓资县','卓资县','乌兰察布市','内蒙古自治区','3','012300','0474','','','zhuozixian','ZZX','0');
INSERT INTO `tk_cities` VALUES('150922','150900','化德县','内蒙古自治区-乌兰察布市-化德县','化德县','乌兰察布市','内蒙古自治区','3','013350','0474','','','huadexian','HDX','0');
INSERT INTO `tk_cities` VALUES('150923','150900','商都县','内蒙古自治区-乌兰察布市-商都县','商都县','乌兰察布市','内蒙古自治区','3','013400','0474','','','shangduxian','SDX','0');
INSERT INTO `tk_cities` VALUES('150924','150900','兴和县','内蒙古自治区-乌兰察布市-兴和县','兴和县','乌兰察布市','内蒙古自治区','3','013650','0474','','','xinghexian','XHX','0');
INSERT INTO `tk_cities` VALUES('150925','150900','凉城县','内蒙古自治区-乌兰察布市-凉城县','凉城县','乌兰察布市','内蒙古自治区','3','013750','0474','','','liangchengxian','LCX','0');
INSERT INTO `tk_cities` VALUES('150926','150900','察哈尔右翼前旗','内蒙古自治区-乌兰察布市-察哈尔右翼前旗','察哈尔右翼前旗','乌兰察布市','内蒙古自治区','3','012200','0474','','','chahaeryouyiqianqi','CHEYYQQ','0');
INSERT INTO `tk_cities` VALUES('150927','150900','察哈尔右翼中旗','内蒙古自治区-乌兰察布市-察哈尔右翼中旗','察哈尔右翼中旗','乌兰察布市','内蒙古自治区','3','013500','0474','','','chahaeryouyizhongqi','CHEYYZQ','0');
INSERT INTO `tk_cities` VALUES('150928','150900','察哈尔右翼后旗','内蒙古自治区-乌兰察布市-察哈尔右翼后旗','察哈尔右翼后旗','乌兰察布市','内蒙古自治区','3','012400','0474','','','chahaeryouyihouqi','CHEYYHQ','0');
INSERT INTO `tk_cities` VALUES('150929','150900','四子王旗','内蒙古自治区-乌兰察布市-四子王旗','四子王旗','乌兰察布市','内蒙古自治区','3','011800','0474','','','siziwangqi','SZWQ','0');
INSERT INTO `tk_cities` VALUES('150981','150900','丰镇市','内蒙古自治区-乌兰察布市-丰镇市','丰镇市','乌兰察布市','内蒙古自治区','3','012100','0474','','','fengzhenshi','FZS','0');
INSERT INTO `tk_cities` VALUES('152201','152200','乌兰浩特市','内蒙古自治区-兴安盟-乌兰浩特市','乌兰浩特市','兴安盟','内蒙古自治区','3','137400','0482','','','wulanhaoteshi','WLHTS','0');
INSERT INTO `tk_cities` VALUES('152202','152200','阿尔山市','内蒙古自治区-兴安盟-阿尔山市','阿尔山市','兴安盟','内蒙古自治区','3','137400','0482','','','aershanshi','AESS','0');
INSERT INTO `tk_cities` VALUES('152221','152200','科尔沁右翼前旗','内蒙古自治区-兴安盟-科尔沁右翼前旗','科尔沁右翼前旗','兴安盟','内蒙古自治区','3','137400','0482','','','keerqinyouyiqianqi','KEQYYQQ','0');
INSERT INTO `tk_cities` VALUES('152222','152200','科尔沁右翼中旗','内蒙古自治区-兴安盟-科尔沁右翼中旗','科尔沁右翼中旗','兴安盟','内蒙古自治区','3','029400','0482','','','keerqinyouyizhongqi','KEQYYZQ','0');
INSERT INTO `tk_cities` VALUES('152223','152200','扎赉特旗','内蒙古自治区-兴安盟-扎赉特旗','扎赉特旗','兴安盟','内蒙古自治区','3','137600','0482','','','zhateqi','ZTQ','0');
INSERT INTO `tk_cities` VALUES('152224','152200','突泉县','内蒙古自治区-兴安盟-突泉县','突泉县','兴安盟','内蒙古自治区','3','137500','0482','','','tuquanxian','TQX','0');
INSERT INTO `tk_cities` VALUES('152501','152500','二连浩特市','内蒙古自治区-锡林郭勒盟-二连浩特市','二连浩特市','锡林郭勒盟','内蒙古自治区','3','012600','0479','','','erlianhaoteshi','ELHTS','0');
INSERT INTO `tk_cities` VALUES('152502','152500','锡林浩特市','内蒙古自治区-锡林郭勒盟-锡林浩特市','锡林浩特市','锡林郭勒盟','内蒙古自治区','3','026000','0479','','','xilinhaoteshi','XLHTS','0');
INSERT INTO `tk_cities` VALUES('152522','152500','阿巴嘎旗','内蒙古自治区-锡林郭勒盟-阿巴嘎旗','阿巴嘎旗','锡林郭勒盟','内蒙古自治区','3','011400','0479','','','abagaqi','ABGQ','0');
INSERT INTO `tk_cities` VALUES('152523','152500','苏尼特左旗','内蒙古自治区-锡林郭勒盟-苏尼特左旗','苏尼特左旗','锡林郭勒盟','内蒙古自治区','3','011300','0479','','','sunitezuoqi','SNTZQ','0');
INSERT INTO `tk_cities` VALUES('152524','152500','苏尼特右旗','内蒙古自治区-锡林郭勒盟-苏尼特右旗','苏尼特右旗','锡林郭勒盟','内蒙古自治区','3','011200','0479','','','suniteyouqi','SNTYQ','0');
INSERT INTO `tk_cities` VALUES('152525','152500','东乌珠穆沁旗','内蒙古自治区-锡林郭勒盟-东乌珠穆沁旗','东乌珠穆沁旗','锡林郭勒盟','内蒙古自治区','3','026300','0479','','','dongwuzhumuqinqi','DWZMQQ','0');
INSERT INTO `tk_cities` VALUES('152526','152500','西乌珠穆沁旗','内蒙古自治区-锡林郭勒盟-西乌珠穆沁旗','西乌珠穆沁旗','锡林郭勒盟','内蒙古自治区','3','026200','0479','','','xiwuzhumuqinqi','XWZMQQ','0');
INSERT INTO `tk_cities` VALUES('152527','152500','太仆寺旗','内蒙古自治区-锡林郭勒盟-太仆寺旗','太仆寺旗','锡林郭勒盟','内蒙古自治区','3','027000','0479','','','taipusiqi','TPSQ','0');
INSERT INTO `tk_cities` VALUES('152528','152500','镶黄旗','内蒙古自治区-锡林郭勒盟-镶黄旗','镶黄旗','锡林郭勒盟','内蒙古自治区','3','013250','0479','','','xianghuangqi','XHQ','0');
INSERT INTO `tk_cities` VALUES('152529','152500','正镶白旗','内蒙古自治区-锡林郭勒盟-正镶白旗','正镶白旗','锡林郭勒盟','内蒙古自治区','3','013800','0479','','','zhengxiangbaiqi','ZXBQ','0');
INSERT INTO `tk_cities` VALUES('152530','152500','正蓝旗','内蒙古自治区-锡林郭勒盟-正蓝旗','正蓝旗','锡林郭勒盟','内蒙古自治区','3','027200','0479','','','zhenglanqi','ZLQ','0');
INSERT INTO `tk_cities` VALUES('152531','152500','多伦县','内蒙古自治区-锡林郭勒盟-多伦县','多伦县','锡林郭勒盟','内蒙古自治区','3','027300','0479','','','duolunxian','DLX','0');
INSERT INTO `tk_cities` VALUES('152921','152900','阿拉善左旗','内蒙古自治区-阿拉善盟-阿拉善左旗','阿拉善左旗','阿拉善盟','内蒙古自治区','3','750300','0483','','','alashanzuoqi','ALSZQ','0');
INSERT INTO `tk_cities` VALUES('152922','152900','阿拉善右旗','内蒙古自治区-阿拉善盟-阿拉善右旗','阿拉善右旗','阿拉善盟','内蒙古自治区','3','737300','0483','','','alashanyouqi','ALSYQ','0');
INSERT INTO `tk_cities` VALUES('152923','152900','额济纳旗','内蒙古自治区-阿拉善盟-额济纳旗','额济纳旗','阿拉善盟','内蒙古自治区','3','735400','0483','','','ejinaqi','EJNQ','0');
INSERT INTO `tk_cities` VALUES('210000','0','辽宁省','辽宁省','','','辽宁省','1','','','','','liaoningsheng','LNS','0');
INSERT INTO `tk_cities` VALUES('210100','210000','沈阳市','辽宁省-沈阳市','','沈阳市','辽宁省','2','110000','024','','','shenyangshi','SYS','1');
INSERT INTO `tk_cities` VALUES('210200','210000','大连市','辽宁省-大连市','','大连市','辽宁省','2','116000','0411','','','dalianshi','DLS','0');
INSERT INTO `tk_cities` VALUES('210300','210000','鞍山市','辽宁省-鞍山市','','鞍山市','辽宁省','2','114000','0412','','','anshanshi','ASS','0');
INSERT INTO `tk_cities` VALUES('210400','210000','抚顺市','辽宁省-抚顺市','','抚顺市','辽宁省','2','113000','0413','','','fushunshi','FSS','0');
INSERT INTO `tk_cities` VALUES('210500','210000','本溪市','辽宁省-本溪市','','本溪市','辽宁省','2','117000','0414','','','benxishi','BXS','0');
INSERT INTO `tk_cities` VALUES('210600','210000','丹东市','辽宁省-丹东市','','丹东市','辽宁省','2','118000','0415','','','dandongshi','DDS','0');
INSERT INTO `tk_cities` VALUES('210700','210000','锦州市','辽宁省-锦州市','','锦州市','辽宁省','2','121000','0416','','','jinzhoushi','JZS','0');
INSERT INTO `tk_cities` VALUES('210800','210000','营口市','辽宁省-营口市','','营口市','辽宁省','2','115000','0417','','','yingkoushi','YKS','0');
INSERT INTO `tk_cities` VALUES('210900','210000','阜新市','辽宁省-阜新市','','阜新市','辽宁省','2','123000','0418','','','fuxinshi','FXS','0');
INSERT INTO `tk_cities` VALUES('211000','210000','辽阳市','辽宁省-辽阳市','','辽阳市','辽宁省','2','111000','0419','','','liaoyangshi','LYS','0');
INSERT INTO `tk_cities` VALUES('211100','210000','盘锦市','辽宁省-盘锦市','','盘锦市','辽宁省','2','124000','0427','','','panjinshi','PJS','0');
INSERT INTO `tk_cities` VALUES('211200','210000','铁岭市','辽宁省-铁岭市','','铁岭市','辽宁省','2','112000','0410','','','tielingshi','TLS','0');
INSERT INTO `tk_cities` VALUES('211300','210000','朝阳市','辽宁省-朝阳市','','朝阳市','辽宁省','2','122000','0421','','','chaoyangshi','CYS','0');
INSERT INTO `tk_cities` VALUES('211400','210000','葫芦岛市','辽宁省-葫芦岛市','','葫芦岛市','辽宁省','2','125000','0429','','','huludaoshi','HLDS','0');
INSERT INTO `tk_cities` VALUES('210102','210100','和平区','辽宁省-沈阳市-和平区','和平区','沈阳市','辽宁省','3','110000','024','','','hepingqu','HPQ','0');
INSERT INTO `tk_cities` VALUES('210103','210100','沈河区','辽宁省-沈阳市-沈河区','沈河区','沈阳市','辽宁省','3','110000','024','','','shenhequ','SHQ','0');
INSERT INTO `tk_cities` VALUES('210104','210100','大东区','辽宁省-沈阳市-大东区','大东区','沈阳市','辽宁省','3','110000','024','','','dadongqu','DDQ','0');
INSERT INTO `tk_cities` VALUES('210105','210100','皇姑区','辽宁省-沈阳市-皇姑区','皇姑区','沈阳市','辽宁省','3','110000','024','','','huangguqu','HGQ','0');
INSERT INTO `tk_cities` VALUES('210106','210100','铁西区','辽宁省-沈阳市-铁西区','铁西区','沈阳市','辽宁省','3','110020','024','','','tiexiqu','TXQ','0');
INSERT INTO `tk_cities` VALUES('210111','210100','苏家屯区','辽宁省-沈阳市-苏家屯区','苏家屯区','沈阳市','辽宁省','3','110100','024','','','sujiatunqu','SJTQ','0');
INSERT INTO `tk_cities` VALUES('210112','210100','东陵区','辽宁省-沈阳市-东陵区','东陵区','沈阳市','辽宁省','3','110000','024','','','donglingqu','DLQ','0');
INSERT INTO `tk_cities` VALUES('210113','210100','沈北新区','辽宁省-沈阳市-沈北新区','沈北新区','沈阳市','辽宁省','3','110000','024','','','shenbeixinqu','SBXQ','0');
INSERT INTO `tk_cities` VALUES('210114','210100','于洪区','辽宁省-沈阳市-于洪区','于洪区','沈阳市','辽宁省','3','110000','024','','','yuhongqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('210122','210100','辽中县','辽宁省-沈阳市-辽中县','辽中县','沈阳市','辽宁省','3','110200','024','','','liaozhongxian','LZX','0');
INSERT INTO `tk_cities` VALUES('210123','210100','康平县','辽宁省-沈阳市-康平县','康平县','沈阳市','辽宁省','3','110500','024','','','kangpingxian','KPX','0');
INSERT INTO `tk_cities` VALUES('210124','210100','法库县','辽宁省-沈阳市-法库县','法库县','沈阳市','辽宁省','3','110400','024','','','fakuxian','FKX','0');
INSERT INTO `tk_cities` VALUES('210181','210100','新民市','辽宁省-沈阳市-新民市','新民市','沈阳市','辽宁省','3','110300','024','','','xinminshi','XMS','0');
INSERT INTO `tk_cities` VALUES('210202','210200','中山区','辽宁省-大连市-中山区','中山区','大连市','辽宁省','3','116000','0411','','','zhongshanqu','ZSQ','0');
INSERT INTO `tk_cities` VALUES('210203','210200','西岗区','辽宁省-大连市-西岗区','西岗区','大连市','辽宁省','3','116000','0411','','','xigangqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('210204','210200','沙河口区','辽宁省-大连市-沙河口区','沙河口区','大连市','辽宁省','3','116000','0411','','','shahekouqu','SHKQ','0');
INSERT INTO `tk_cities` VALUES('210211','210200','甘井子区','辽宁省-大连市-甘井子区','甘井子区','大连市','辽宁省','3','116000','0411','','','ganjingziqu','GJZQ','0');
INSERT INTO `tk_cities` VALUES('210212','210200','旅顺口区','辽宁省-大连市-旅顺口区','旅顺口区','大连市','辽宁省','3','116000','0411','','','lvshunkouqu','LSKQ','0');
INSERT INTO `tk_cities` VALUES('210213','210200','金州区','辽宁省-大连市-金州区','金州区','大连市','辽宁省','3','116000','0411','','','jinzhouqu','JZQ','0');
INSERT INTO `tk_cities` VALUES('210224','210200','长海县','辽宁省-大连市-长海县','长海县','大连市','辽宁省','3','116500','0411','','','changhaixian','CHX','0');
INSERT INTO `tk_cities` VALUES('210281','210200','瓦房店市','辽宁省-大连市-瓦房店市','瓦房店市','大连市','辽宁省','3','116300','0411','','','wafangdianshi','WFDS','0');
INSERT INTO `tk_cities` VALUES('210282','210200','普兰店市','辽宁省-大连市-普兰店市','普兰店市','大连市','辽宁省','3','116200','0411','','','pulandianshi','PLDS','0');
INSERT INTO `tk_cities` VALUES('210283','210200','庄河市','辽宁省-大连市-庄河市','庄河市','大连市','辽宁省','3','116400','0411','','','zhuangheshi','ZHS','0');
INSERT INTO `tk_cities` VALUES('210302','210300','铁东区','辽宁省-鞍山市-铁东区','铁东区','鞍山市','辽宁省','3','114000','0412','','','tiedongqu','TDQ','0');
INSERT INTO `tk_cities` VALUES('210303','210300','铁西区','辽宁省-鞍山市-铁西区','铁西区','鞍山市','辽宁省','3','114000','0412','','','tiexiqu','TXQ','0');
INSERT INTO `tk_cities` VALUES('210304','210300','立山区','辽宁省-鞍山市-立山区','立山区','鞍山市','辽宁省','3','114000','0412','','','lishanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('210311','210300','千山区','辽宁省-鞍山市-千山区','千山区','鞍山市','辽宁省','3','114000','0412','','','qianshanqu','QSQ','0');
INSERT INTO `tk_cities` VALUES('210321','210300','台安县','辽宁省-鞍山市-台安县','台安县','鞍山市','辽宁省','3','114100','0412','','','taianxian','TAX','0');
INSERT INTO `tk_cities` VALUES('210323','210300','岫岩满族自治县','辽宁省-鞍山市-岫岩满族自治县','岫岩满族自治县','鞍山市','辽宁省','3','118400','0412','','','yanmanzuzizhixian','YMZZZX','0');
INSERT INTO `tk_cities` VALUES('210381','210300','海城市','辽宁省-鞍山市-海城市','海城市','鞍山市','辽宁省','3','114200','0412','','','haichengshi','HCS','0');
INSERT INTO `tk_cities` VALUES('210402','210400','新抚区','辽宁省-抚顺市-新抚区','新抚区','抚顺市','辽宁省','3','113000','0413','','','xinfuqu','XFQ','0');
INSERT INTO `tk_cities` VALUES('210403','210400','东洲区','辽宁省-抚顺市-东洲区','东洲区','抚顺市','辽宁省','3','113000','0413','','','dongzhouqu','DZQ','0');
INSERT INTO `tk_cities` VALUES('210404','210400','望花区','辽宁省-抚顺市-望花区','望花区','抚顺市','辽宁省','3','113000','0413','','','wanghuaqu','WHQ','0');
INSERT INTO `tk_cities` VALUES('210411','210400','顺城区','辽宁省-抚顺市-顺城区','顺城区','抚顺市','辽宁省','3','113000','0413','','','shunchengqu','SCQ','0');
INSERT INTO `tk_cities` VALUES('210421','210400','抚顺县','辽宁省-抚顺市-抚顺县','抚顺县','抚顺市','辽宁省','3','113100','0413','','','fushunxian','FSX','0');
INSERT INTO `tk_cities` VALUES('210422','210400','新宾满族自治县','辽宁省-抚顺市-新宾满族自治县','新宾满族自治县','抚顺市','辽宁省','3','113200','0413','','','xinbinmanzuzizhixian','XBMZZZX','0');
INSERT INTO `tk_cities` VALUES('210423','210400','清原满族自治县','辽宁省-抚顺市-清原满族自治县','清原满族自治县','抚顺市','辽宁省','3','113300','0413','','','qingyuanmanzuzizhixian','QYMZZZX','0');
INSERT INTO `tk_cities` VALUES('210502','210500','平山区','辽宁省-本溪市-平山区','平山区','本溪市','辽宁省','3','117000','0414','','','pingshanqu','PSQ','0');
INSERT INTO `tk_cities` VALUES('210503','210500','溪湖区','辽宁省-本溪市-溪湖区','溪湖区','本溪市','辽宁省','3','117000','0414','','','xihuqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('210504','210500','明山区','辽宁省-本溪市-明山区','明山区','本溪市','辽宁省','3','117000','0414','','','mingshanqu','MSQ','0');
INSERT INTO `tk_cities` VALUES('210505','210500','南芬区','辽宁省-本溪市-南芬区','南芬区','本溪市','辽宁省','3','117000','0414','','','nanfenqu','NFQ','0');
INSERT INTO `tk_cities` VALUES('210521','210500','本溪满族自治县','辽宁省-本溪市-本溪满族自治县','本溪满族自治县','本溪市','辽宁省','3','117100','0414','','','benximanzuzizhixian','BXMZZZX','0');
INSERT INTO `tk_cities` VALUES('210522','210500','桓仁满族自治县','辽宁省-本溪市-桓仁满族自治县','桓仁满族自治县','本溪市','辽宁省','3','117200','0414','','','huanrenmanzuzizhixian','HRMZZZX','0');
INSERT INTO `tk_cities` VALUES('210602','210600','元宝区','辽宁省-丹东市-元宝区','元宝区','丹东市','辽宁省','3','118000','0415','','','yuanbaoqu','YBQ','0');
INSERT INTO `tk_cities` VALUES('210603','210600','振兴区','辽宁省-丹东市-振兴区','振兴区','丹东市','辽宁省','3','118000','0415','','','zhenxingqu','ZXQ','0');
INSERT INTO `tk_cities` VALUES('210604','210600','振安区','辽宁省-丹东市-振安区','振安区','丹东市','辽宁省','3','118000','0415','','','zhenanqu','ZAQ','0');
INSERT INTO `tk_cities` VALUES('210624','210600','宽甸满族自治县','辽宁省-丹东市-宽甸满族自治县','宽甸满族自治县','丹东市','辽宁省','3','118200','0415','','','kuandianmanzuzizhixian','KDMZZZX','0');
INSERT INTO `tk_cities` VALUES('210681','210600','东港市','辽宁省-丹东市-东港市','东港市','丹东市','辽宁省','3','118300','0415','','','donggangshi','DGS','0');
INSERT INTO `tk_cities` VALUES('210682','210600','凤城市','辽宁省-丹东市-凤城市','凤城市','丹东市','辽宁省','3','118100','0415','','','fengchengshi','FCS','0');
INSERT INTO `tk_cities` VALUES('210702','210700','古塔区','辽宁省-锦州市-古塔区','古塔区','锦州市','辽宁省','3','121000','0416','','','gutaqu','GTQ','0');
INSERT INTO `tk_cities` VALUES('210703','210700','凌河区','辽宁省-锦州市-凌河区','凌河区','锦州市','辽宁省','3','121000','0416','','','linghequ','LHQ','0');
INSERT INTO `tk_cities` VALUES('210711','210700','太和区','辽宁省-锦州市-太和区','太和区','锦州市','辽宁省','3','121000','0416','','','taihequ','THQ','0');
INSERT INTO `tk_cities` VALUES('210726','210700','黑山县','辽宁省-锦州市-黑山县','黑山县','锦州市','辽宁省','3','121400','0416','','','heishanxian','HSX','0');
INSERT INTO `tk_cities` VALUES('210727','210700','义县','辽宁省-锦州市-义县','义县','锦州市','辽宁省','3','121100','0416','','','yixian','YX','0');
INSERT INTO `tk_cities` VALUES('210781','210700','凌海市','辽宁省-锦州市-凌海市','凌海市','锦州市','辽宁省','3','121200','0416','','','linghaishi','LHS','0');
INSERT INTO `tk_cities` VALUES('210782','210700','北镇市','辽宁省-锦州市-北镇市','北镇市','锦州市','辽宁省','3','121300','0416','','','beizhenshi','BZS','0');
INSERT INTO `tk_cities` VALUES('210802','210800','站前区','辽宁省-营口市-站前区','站前区','营口市','辽宁省','3','115000','0417','','','zhanqianqu','ZQQ','0');
INSERT INTO `tk_cities` VALUES('210803','210800','西市区','辽宁省-营口市-西市区','西市区','营口市','辽宁省','3','115000','0417','','','xishiqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('210804','210800','鲅鱼圈区','辽宁省-营口市-鲅鱼圈区','鲅鱼圈区','营口市','辽宁省','3','115000','0417','','','yuquanqu','YQQ','0');
INSERT INTO `tk_cities` VALUES('210811','210800','老边区','辽宁省-营口市-老边区','老边区','营口市','辽宁省','3','115000','0417','','','laobianqu','LBQ','0');
INSERT INTO `tk_cities` VALUES('210881','210800','盖州市','辽宁省-营口市-盖州市','盖州市','营口市','辽宁省','3','115200','0417','','','gaizhoushi','GZS','0');
INSERT INTO `tk_cities` VALUES('210882','210800','大石桥市','辽宁省-营口市-大石桥市','大石桥市','营口市','辽宁省','3','115100','0417','','','dashiqiaoshi','DSQS','0');
INSERT INTO `tk_cities` VALUES('210902','210900','海州区','辽宁省-阜新市-海州区','海州区','阜新市','辽宁省','3','123000','0418','','','haizhouqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('210903','210900','新邱区','辽宁省-阜新市-新邱区','新邱区','阜新市','辽宁省','3','123000','0418','','','xinqiuqu','XQQ','0');
INSERT INTO `tk_cities` VALUES('210904','210900','太平区','辽宁省-阜新市-太平区','太平区','阜新市','辽宁省','3','123000','0418','','','taipingqu','TPQ','0');
INSERT INTO `tk_cities` VALUES('210905','210900','清河门区','辽宁省-阜新市-清河门区','清河门区','阜新市','辽宁省','3','123000','0418','','','qinghemenqu','QHMQ','0');
INSERT INTO `tk_cities` VALUES('210911','210900','细河区','辽宁省-阜新市-细河区','细河区','阜新市','辽宁省','3','123000','0418','','','xihequ','XHQ','0');
INSERT INTO `tk_cities` VALUES('210921','210900','阜新蒙古族自治县','辽宁省-阜新市-阜新蒙古族自治县','阜新蒙古族自治县','阜新市','辽宁省','3','123100','0418','','','fuxinmengguzuzizhixian','FXMGZZZX','0');
INSERT INTO `tk_cities` VALUES('210922','210900','彰武县','辽宁省-阜新市-彰武县','彰武县','阜新市','辽宁省','3','123200','0418','','','zhangwuxian','ZWX','0');
INSERT INTO `tk_cities` VALUES('211002','211000','白塔区','辽宁省-辽阳市-白塔区','白塔区','辽阳市','辽宁省','3','111000','0419','','','baitaqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('211003','211000','文圣区','辽宁省-辽阳市-文圣区','文圣区','辽阳市','辽宁省','3','111000','0419','','','wenshengqu','WSQ','0');
INSERT INTO `tk_cities` VALUES('211004','211000','宏伟区','辽宁省-辽阳市-宏伟区','宏伟区','辽阳市','辽宁省','3','111000','0419','','','hongweiqu','HWQ','0');
INSERT INTO `tk_cities` VALUES('211005','211000','弓长岭区','辽宁省-辽阳市-弓长岭区','弓长岭区','辽阳市','辽宁省','3','111000','0419','','','gongchanglingqu','GCLQ','0');
INSERT INTO `tk_cities` VALUES('211011','211000','太子河区','辽宁省-辽阳市-太子河区','太子河区','辽阳市','辽宁省','3','111000','0419','','','taizihequ','TZHQ','0');
INSERT INTO `tk_cities` VALUES('211021','211000','辽阳县','辽宁省-辽阳市-辽阳县','辽阳县','辽阳市','辽宁省','3','111200','0419','','','liaoyangxian','LYX','0');
INSERT INTO `tk_cities` VALUES('211081','211000','灯塔市','辽宁省-辽阳市-灯塔市','灯塔市','辽阳市','辽宁省','3','111300','0419','','','dengtashi','DTS','0');
INSERT INTO `tk_cities` VALUES('211102','211100','双台子区','辽宁省-盘锦市-双台子区','双台子区','盘锦市','辽宁省','3','124000','0427','','','shuangtaiziqu','STZQ','0');
INSERT INTO `tk_cities` VALUES('211103','211100','兴隆台区','辽宁省-盘锦市-兴隆台区','兴隆台区','盘锦市','辽宁省','3','124000','0427','','','xinglongtaiqu','XLTQ','0');
INSERT INTO `tk_cities` VALUES('211121','211100','大洼县','辽宁省-盘锦市-大洼县','大洼县','盘锦市','辽宁省','3','124200','0427','','','dawaxian','DWX','0');
INSERT INTO `tk_cities` VALUES('211122','211100','盘山县','辽宁省-盘锦市-盘山县','盘山县','盘锦市','辽宁省','3','124100','0427','','','panshanxian','PSX','0');
INSERT INTO `tk_cities` VALUES('211202','211200','银州区','辽宁省-铁岭市-银州区','银州区','铁岭市','辽宁省','3','112000','0410','','','yinzhouqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('211204','211200','清河区','辽宁省-铁岭市-清河区','清河区','铁岭市','辽宁省','3','112000','0410','','','qinghequ','QHQ','0');
INSERT INTO `tk_cities` VALUES('211221','211200','铁岭县','辽宁省-铁岭市-铁岭县','铁岭县','铁岭市','辽宁省','3','112600','0410','','','tielingxian','TLX','0');
INSERT INTO `tk_cities` VALUES('211223','211200','西丰县','辽宁省-铁岭市-西丰县','西丰县','铁岭市','辽宁省','3','112400','0410','','','xifengxian','XFX','0');
INSERT INTO `tk_cities` VALUES('211224','211200','昌图县','辽宁省-铁岭市-昌图县','昌图县','铁岭市','辽宁省','3','112500','0410','','','changtuxian','CTX','0');
INSERT INTO `tk_cities` VALUES('211281','211200','调兵山市','辽宁省-铁岭市-调兵山市','调兵山市','铁岭市','辽宁省','3','112700','0410','','','diaobingshanshi','DBSS','0');
INSERT INTO `tk_cities` VALUES('211282','211200','开原市','辽宁省-铁岭市-开原市','开原市','铁岭市','辽宁省','3','112300','0410','','','kaiyuanshi','KYS','0');
INSERT INTO `tk_cities` VALUES('211302','211300','双塔区','辽宁省-朝阳市-双塔区','双塔区','朝阳市','辽宁省','3','122000','0421','','','shuangtaqu','STQ','0');
INSERT INTO `tk_cities` VALUES('211303','211300','龙城区','辽宁省-朝阳市-龙城区','龙城区','朝阳市','辽宁省','3','122000','0421','','','longchengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('211321','211300','朝阳县','辽宁省-朝阳市-朝阳县','朝阳县','朝阳市','辽宁省','3','122000','0421','','','chaoyangxian','CYX','0');
INSERT INTO `tk_cities` VALUES('211322','211300','建平县','辽宁省-朝阳市-建平县','建平县','朝阳市','辽宁省','3','122400','0421','','','jianpingxian','JPX','0');
INSERT INTO `tk_cities` VALUES('211324','211300','喀喇沁左翼蒙古族自治县','辽宁省-朝阳市-喀喇沁左翼蒙古族自治县','喀喇沁左翼蒙古族自治县','朝阳市','辽宁省','3','122300','0421','','','kalaqinzuoyimengguzuzizhixian','KLQZYMGZZZX','0');
INSERT INTO `tk_cities` VALUES('211381','211300','北票市','辽宁省-朝阳市-北票市','北票市','朝阳市','辽宁省','3','122100','0421','','','beipiaoshi','BPS','0');
INSERT INTO `tk_cities` VALUES('211382','211300','凌源市','辽宁省-朝阳市-凌源市','凌源市','朝阳市','辽宁省','3','122500','0421','','','lingyuanshi','LYS','0');
INSERT INTO `tk_cities` VALUES('211402','211400','连山区','辽宁省-葫芦岛市-连山区','连山区','葫芦岛市','辽宁省','3','125000','0429','','','lianshanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('211403','211400','龙港区','辽宁省-葫芦岛市-龙港区','龙港区','葫芦岛市','辽宁省','3','125000','0429','','','longgangqu','LGQ','0');
INSERT INTO `tk_cities` VALUES('211404','211400','南票区','辽宁省-葫芦岛市-南票区','南票区','葫芦岛市','辽宁省','3','125000','0429','','','nanpiaoqu','NPQ','0');
INSERT INTO `tk_cities` VALUES('211421','211400','绥中县','辽宁省-葫芦岛市-绥中县','绥中县','葫芦岛市','辽宁省','3','125200','0429','','','suizhongxian','SZX','0');
INSERT INTO `tk_cities` VALUES('211422','211400','建昌县','辽宁省-葫芦岛市-建昌县','建昌县','葫芦岛市','辽宁省','3','125300','0429','','','jianchangxian','JCX','0');
INSERT INTO `tk_cities` VALUES('211481','211400','兴城市','辽宁省-葫芦岛市-兴城市','兴城市','葫芦岛市','辽宁省','3','125100','0429','','','xingchengshi','XCS','0');
INSERT INTO `tk_cities` VALUES('220000','0','吉林省','吉林省','','','吉林省','1','','','','','jilinsheng','JLS','0');
INSERT INTO `tk_cities` VALUES('220100','220000','长春市','吉林省-长春市','','长春市','吉林省','2','130000','0431','','','changchunshi','CCS','0');
INSERT INTO `tk_cities` VALUES('220200','220000','吉林市','吉林省-吉林市','','吉林市','吉林省','2','132000','0432','','','jilinshi','JLS','0');
INSERT INTO `tk_cities` VALUES('220300','220000','四平市','吉林省-四平市','','四平市','吉林省','2','136000','0434','','','sipingshi','SPS','0');
INSERT INTO `tk_cities` VALUES('220400','220000','辽源市','吉林省-辽源市','','辽源市','吉林省','2','136200','0437','','','liaoyuanshi','LYS','0');
INSERT INTO `tk_cities` VALUES('220500','220000','通化市','吉林省-通化市','','通化市','吉林省','2','134000','0435','','','tonghuashi','THS','0');
INSERT INTO `tk_cities` VALUES('220600','220000','白山市','吉林省-白山市','','白山市','吉林省','2','134300','0439','','','baishanshi','BSS','0');
INSERT INTO `tk_cities` VALUES('220700','220000','松原市','吉林省-松原市','','松原市','吉林省','2','138000','0438','','','songyuanshi','SYS','0');
INSERT INTO `tk_cities` VALUES('220800','220000','白城市','吉林省-白城市','','白城市','吉林省','2','137000','0436','','','baichengshi','BCS','0');
INSERT INTO `tk_cities` VALUES('222400','220000','延边朝鲜族自治州 ','吉林省-延边朝鲜族自治州 ','','延边朝鲜族自治州 ','吉林省','2','133000','0043','','','yanbianchaoxianzuzizhizhou','YBCXZZZZ','0');
INSERT INTO `tk_cities` VALUES('220102','220100','南关区','吉林省-长春市-南关区','南关区','长春市','吉林省','3','130000','0431','','','nanguanqu','NGQ','0');
INSERT INTO `tk_cities` VALUES('220103','220100','宽城区','吉林省-长春市-宽城区','宽城区','长春市','吉林省','3','130000','0431','','','kuanchengqu','KCQ','0');
INSERT INTO `tk_cities` VALUES('220104','220100','朝阳区','吉林省-长春市-朝阳区','朝阳区','长春市','吉林省','3','130000','0431','','','chaoyangqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('220105','220100','二道区','吉林省-长春市-二道区','二道区','长春市','吉林省','3','130000','0431','','','erdaoqu','EDQ','0');
INSERT INTO `tk_cities` VALUES('220106','220100','绿园区','吉林省-长春市-绿园区','绿园区','长春市','吉林省','3','130000','0431','','','lvyuanqu','LYQ','0');
INSERT INTO `tk_cities` VALUES('220112','220100','双阳区','吉林省-长春市-双阳区','双阳区','长春市','吉林省','3','130600','0431','','','shuangyangqu','SYQ','0');
INSERT INTO `tk_cities` VALUES('220122','220100','农安县','吉林省-长春市-农安县','农安县','长春市','吉林省','3','130200','0431','','','nonganxian','NAX','0');
INSERT INTO `tk_cities` VALUES('220181','220100','九台市','吉林省-长春市-九台市','九台市','长春市','吉林省','3','130500','0431','','','jiutaishi','JTS','0');
INSERT INTO `tk_cities` VALUES('220182','220100','榆树市','吉林省-长春市-榆树市','榆树市','长春市','吉林省','3','130400','0431','','','yushushi','YSS','0');
INSERT INTO `tk_cities` VALUES('220183','220100','德惠市','吉林省-长春市-德惠市','德惠市','长春市','吉林省','3','130300','0431','','','dehuishi','DHS','0');
INSERT INTO `tk_cities` VALUES('220202','220200','昌邑区','吉林省-吉林市-昌邑区','昌邑区','吉林市','吉林省','3','132000','0432','','','changyiqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('220203','220200','龙潭区','吉林省-吉林市-龙潭区','龙潭区','吉林市','吉林省','3','132000','0432','','','longtanqu','LTQ','0');
INSERT INTO `tk_cities` VALUES('220204','220200','船营区','吉林省-吉林市-船营区','船营区','吉林市','吉林省','3','132000','0432','','','chuanyingqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('220211','220200','丰满区','吉林省-吉林市-丰满区','丰满区','吉林市','吉林省','3','132000','0432','','','fengmanqu','FMQ','0');
INSERT INTO `tk_cities` VALUES('220221','220200','永吉县','吉林省-吉林市-永吉县','永吉县','吉林市','吉林省','3','132100','0432','','','yongjixian','YJX','0');
INSERT INTO `tk_cities` VALUES('220281','220200','蛟河市','吉林省-吉林市-蛟河市','蛟河市','吉林市','吉林省','3','132500','0432','','','heshi','HS','0');
INSERT INTO `tk_cities` VALUES('220282','220200','桦甸市','吉林省-吉林市-桦甸市','桦甸市','吉林市','吉林省','3','132400','0432','','','dianshi','DS','0');
INSERT INTO `tk_cities` VALUES('220283','220200','舒兰市','吉林省-吉林市-舒兰市','舒兰市','吉林市','吉林省','3','132600','0432','','','shulanshi','SLS','0');
INSERT INTO `tk_cities` VALUES('220284','220200','磐石市','吉林省-吉林市-磐石市','磐石市','吉林市','吉林省','3','132300','0432','','','panshishi','PSS','0');
INSERT INTO `tk_cities` VALUES('220302','220300','铁西区','吉林省-四平市-铁西区','铁西区','四平市','吉林省','3','136000','0434','','','tiexiqu','TXQ','0');
INSERT INTO `tk_cities` VALUES('220303','220300','铁东区','吉林省-四平市-铁东区','铁东区','四平市','吉林省','3','136000','0434','','','tiedongqu','TDQ','0');
INSERT INTO `tk_cities` VALUES('220322','220300','梨树县','吉林省-四平市-梨树县','梨树县','四平市','吉林省','3','136500','0434','','','lishuxian','LSX','0');
INSERT INTO `tk_cities` VALUES('220323','220300','伊通满族自治县','吉林省-四平市-伊通满族自治县','伊通满族自治县','四平市','吉林省','3','130700','0434','','','yitongmanzuzizhixian','YTMZZZX','0');
INSERT INTO `tk_cities` VALUES('220381','220300','公主岭市','吉林省-四平市-公主岭市','公主岭市','四平市','吉林省','3','136100','0434','','','gongzhulingshi','GZLS','0');
INSERT INTO `tk_cities` VALUES('220382','220300','双辽市','吉林省-四平市-双辽市','双辽市','四平市','吉林省','3','136400','0434','','','shuangliaoshi','SLS','0');
INSERT INTO `tk_cities` VALUES('220402','220400','龙山区','吉林省-辽源市-龙山区','龙山区','辽源市','吉林省','3','136200','0437','','','longshanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('220403','220400','西安区','吉林省-辽源市-西安区','西安区','辽源市','吉林省','3','136200','0437','','','xianqu','XAQ','0');
INSERT INTO `tk_cities` VALUES('220421','220400','东丰县','吉林省-辽源市-东丰县','东丰县','辽源市','吉林省','3','136300','0437','','','dongfengxian','DFX','0');
INSERT INTO `tk_cities` VALUES('220422','220400','东辽县','吉林省-辽源市-东辽县','东辽县','辽源市','吉林省','3','136600','0437','','','dongliaoxian','DLX','0');
INSERT INTO `tk_cities` VALUES('220502','220500','东昌区','吉林省-通化市-东昌区','东昌区','通化市','吉林省','3','134000','0435','','','dongchangqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('220503','220500','二道江区','吉林省-通化市-二道江区','二道江区','通化市','吉林省','3','134000','0435','','','erdaojiangqu','EDJQ','0');
INSERT INTO `tk_cities` VALUES('220521','220500','通化县','吉林省-通化市-通化县','通化县','通化市','吉林省','3','134100','0435','','','tonghuaxian','THX','0');
INSERT INTO `tk_cities` VALUES('220523','220500','辉南县','吉林省-通化市-辉南县','辉南县','通化市','吉林省','3','135100','0448','','','huinanxian','HNX','0');
INSERT INTO `tk_cities` VALUES('220524','220500','柳河县','吉林省-通化市-柳河县','柳河县','通化市','吉林省','3','135300','0448','','','liuhexian','LHX','0');
INSERT INTO `tk_cities` VALUES('220581','220500','梅河口市','吉林省-通化市-梅河口市','梅河口市','通化市','吉林省','3','135000','0448','','','meihekoushi','MHKS','0');
INSERT INTO `tk_cities` VALUES('220582','220500','集安市','吉林省-通化市-集安市','集安市','通化市','吉林省','3','134200','0435','','','jianshi','JAS','0');
INSERT INTO `tk_cities` VALUES('220602','220600','浑江区','吉林省-白山市-浑江区','浑江区','白山市','吉林省','3','134300','0439','','','hunjiangqu','HJQ','0');
INSERT INTO `tk_cities` VALUES('220605','220600','江源区','吉林省-白山市-江源区','江源区','白山市','吉林省','3','134700 ','0439','','','jiangyuanqu','JYQ','0');
INSERT INTO `tk_cities` VALUES('220621','220600','抚松县','吉林省-白山市-抚松县','抚松县','白山市','吉林省','3','134500','0439','','','fusongxian','FSX','0');
INSERT INTO `tk_cities` VALUES('220622','220600','靖宇县','吉林省-白山市-靖宇县','靖宇县','白山市','吉林省','3','135200','0439','','','jingyuxian','JYX','0');
INSERT INTO `tk_cities` VALUES('220623','220600','长白朝鲜族自治县','吉林省-白山市-长白朝鲜族自治县','长白朝鲜族自治县','白山市','吉林省','3','134400','0439','','','changbaichaoxianzuzizhixian','CBCXZZZX','0');
INSERT INTO `tk_cities` VALUES('220681','220600','临江市','吉林省-白山市-临江市','临江市','白山市','吉林省','3','134600','0439','','','linjiangshi','LJS','0');
INSERT INTO `tk_cities` VALUES('220702','220700','宁江区','吉林省-松原市-宁江区','宁江区','松原市','吉林省','3','138000','0438','','','ningjiangqu','NJQ','0');
INSERT INTO `tk_cities` VALUES('220721','220700','前郭尔罗斯蒙古族自治县','吉林省-松原市-前郭尔罗斯蒙古族自治县','前郭尔罗斯蒙古族自治县','松原市','吉林省','3','131100','0438','','','qianguoerluosimengguzuzizhixian','QGELSMGZZZX','0');
INSERT INTO `tk_cities` VALUES('220722','220700','长岭县','吉林省-松原市-长岭县','长岭县','松原市','吉林省','3','131500','0438','','','changlingxian','CLX','0');
INSERT INTO `tk_cities` VALUES('220723','220700','乾安县','吉林省-松原市-乾安县','乾安县','松原市','吉林省','3','131400','0438','','','qiananxian','QAX','0');
INSERT INTO `tk_cities` VALUES('220724','220700','扶余县','吉林省-松原市-扶余县','扶余县','松原市','吉林省','3','131200','0438','','','fuyuxian','FYX','0');
INSERT INTO `tk_cities` VALUES('220802','220800','洮北区','吉林省-白城市-洮北区','洮北区','白城市','吉林省','3','137000','0436','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('220821','220800','镇赉县','吉林省-白城市-镇赉县','镇赉县','白城市','吉林省','3','137300','0436','','','zhenxian','ZX','0');
INSERT INTO `tk_cities` VALUES('220822','220800','通榆县','吉林省-白城市-通榆县','通榆县','白城市','吉林省','3','137200','0436','','','tongyuxian','TYX','0');
INSERT INTO `tk_cities` VALUES('220881','220800','洮南市','吉林省-白城市-洮南市','洮南市','白城市','吉林省','3','137100','0436','','','nanshi','NS','0');
INSERT INTO `tk_cities` VALUES('220882','220800','大安市','吉林省-白城市-大安市','大安市','白城市','吉林省','3','131300','0436','','','daanshi','DAS','0');
INSERT INTO `tk_cities` VALUES('222401','222400','延吉市','吉林省-延边朝鲜族自治州 -延吉市','延吉市','延边朝鲜族自治州 ','吉林省','3','133000','0043','','','yanjishi','YJS','0');
INSERT INTO `tk_cities` VALUES('222402','222400','图们市','吉林省-延边朝鲜族自治州 -图们市','图们市','延边朝鲜族自治州 ','吉林省','3','133100','0043','','','tumenshi','TMS','0');
INSERT INTO `tk_cities` VALUES('222403','222400','敦化市','吉林省-延边朝鲜族自治州 -敦化市','敦化市','延边朝鲜族自治州 ','吉林省','3','133700','0043','','','dunhuashi','DHS','0');
INSERT INTO `tk_cities` VALUES('222404','222400','珲春市','吉林省-延边朝鲜族自治州 -珲春市','珲春市','延边朝鲜族自治州 ','吉林省','3','133300','0043','','','chunshi','CS','0');
INSERT INTO `tk_cities` VALUES('222405','222400','龙井市','吉林省-延边朝鲜族自治州 -龙井市','龙井市','延边朝鲜族自治州 ','吉林省','3','133400','0043','','','longjingshi','LJS','0');
INSERT INTO `tk_cities` VALUES('222406','222400','和龙市','吉林省-延边朝鲜族自治州 -和龙市','和龙市','延边朝鲜族自治州 ','吉林省','3','133500','0043','','','helongshi','HLS','0');
INSERT INTO `tk_cities` VALUES('222424','222400','汪清县','吉林省-延边朝鲜族自治州 -汪清县','汪清县','延边朝鲜族自治州 ','吉林省','3','133200','0043','','','wangqingxian','WQX','0');
INSERT INTO `tk_cities` VALUES('222426','222400','安图县','吉林省-延边朝鲜族自治州 -安图县','安图县','延边朝鲜族自治州 ','吉林省','3','133600','0043','','','antuxian','ATX','0');
INSERT INTO `tk_cities` VALUES('230000','0','黑龙江省','黑龙江省','','','黑龙江省','1','','','','','heilongjiangsheng','HLJS','0');
INSERT INTO `tk_cities` VALUES('230100','230000','哈尔滨市','黑龙江省-哈尔滨市','','哈尔滨市','黑龙江省','2','150000','0451','','','haerbinshi','HEBS','0');
INSERT INTO `tk_cities` VALUES('230200','230000','齐齐哈尔市','黑龙江省-齐齐哈尔市','','齐齐哈尔市','黑龙江省','2','161000','0452','','','qiqihaershi','QQHES','0');
INSERT INTO `tk_cities` VALUES('230300','230000','鸡西市','黑龙江省-鸡西市','','鸡西市','黑龙江省','2','158100','0467','','','jixishi','JXS','0');
INSERT INTO `tk_cities` VALUES('230400','230000','鹤岗市','黑龙江省-鹤岗市','','鹤岗市','黑龙江省','2','154000','0454','','','hegangshi','HGS','0');
INSERT INTO `tk_cities` VALUES('230500','230000','双鸭山市','黑龙江省-双鸭山市','','双鸭山市','黑龙江省','2','155100','0469','','','shuangyashanshi','SYSS','0');
INSERT INTO `tk_cities` VALUES('230600','230000','大庆市','黑龙江省-大庆市','','大庆市','黑龙江省','2','163000','0459','','','daqingshi','DQS','0');
INSERT INTO `tk_cities` VALUES('230700','230000','伊春市','黑龙江省-伊春市','','伊春市','黑龙江省','2','153000','0458','','','yichunshi','YCS','0');
INSERT INTO `tk_cities` VALUES('230800','230000','佳木斯市','黑龙江省-佳木斯市','','佳木斯市','黑龙江省','2','154000','0454','','','jiamusishi','JMSS','0');
INSERT INTO `tk_cities` VALUES('230900','230000','七台河市','黑龙江省-七台河市','','七台河市','黑龙江省','2','154600','0464','','','qitaiheshi','QTHS','0');
INSERT INTO `tk_cities` VALUES('231000','230000','牡丹江市','黑龙江省-牡丹江市','','牡丹江市','黑龙江省','2','157000','0453','','','mudanjiangshi','MDJS','0');
INSERT INTO `tk_cities` VALUES('231100','230000','黑河市','黑龙江省-黑河市','','黑河市','黑龙江省','2','164300','0456','','','heiheshi','HHS','0');
INSERT INTO `tk_cities` VALUES('231200','230000','绥化市','黑龙江省-绥化市','','绥化市','黑龙江省','2','152000','0455','','','suihuashi','SHS','0');
INSERT INTO `tk_cities` VALUES('232700','230000','大兴安岭地区','黑龙江省-大兴安岭地区','','大兴安岭地区','黑龙江省','2','165000','0456','','','daxinganlingdiqu','DXALDQ','0');
INSERT INTO `tk_cities` VALUES('230102','230100','道里区','黑龙江省-哈尔滨市-道里区','道里区','哈尔滨市','黑龙江省','3','150000','0451','','','daoliqu','DLQ','0');
INSERT INTO `tk_cities` VALUES('230103','230100','南岗区','黑龙江省-哈尔滨市-南岗区','南岗区','哈尔滨市','黑龙江省','3','150000','0451','','','nangangqu','NGQ','0');
INSERT INTO `tk_cities` VALUES('230104','230100','道外区','黑龙江省-哈尔滨市-道外区','道外区','哈尔滨市','黑龙江省','3','150000','0451','','','daowaiqu','DWQ','0');
INSERT INTO `tk_cities` VALUES('230108','230100','平房区','黑龙江省-哈尔滨市-平房区','平房区','哈尔滨市','黑龙江省','3','150000','0451','','','pingfangqu','PFQ','0');
INSERT INTO `tk_cities` VALUES('230109','230100','松北区','黑龙江省-哈尔滨市-松北区','松北区','哈尔滨市','黑龙江省','3','150000','0451','','','songbeiqu','SBQ','0');
INSERT INTO `tk_cities` VALUES('230110','230100','香坊区','黑龙江省-哈尔滨市-香坊区','香坊区','哈尔滨市','黑龙江省','3','150000','0451','','','xiangfangqu','XFQ','0');
INSERT INTO `tk_cities` VALUES('230111','230100','呼兰区','黑龙江省-哈尔滨市-呼兰区','呼兰区','哈尔滨市','黑龙江省','3','150500','0451','','','hulanqu','HLQ','0');
INSERT INTO `tk_cities` VALUES('230112','230100','阿城区','黑龙江省-哈尔滨市-阿城区','阿城区','哈尔滨市','黑龙江省','3','150300','0451','','','achengqu','ACQ','0');
INSERT INTO `tk_cities` VALUES('230123','230100','依兰县','黑龙江省-哈尔滨市-依兰县','依兰县','哈尔滨市','黑龙江省','3','154800','0451','','','yilanxian','YLX','0');
INSERT INTO `tk_cities` VALUES('230124','230100','方正县','黑龙江省-哈尔滨市-方正县','方正县','哈尔滨市','黑龙江省','3','150800','0451','','','fangzhengxian','FZX','0');
INSERT INTO `tk_cities` VALUES('230125','230100','宾县','黑龙江省-哈尔滨市-宾县','宾县','哈尔滨市','黑龙江省','3','150400','0451','','','binxian','BX','0');
INSERT INTO `tk_cities` VALUES('230126','230100','巴彦县','黑龙江省-哈尔滨市-巴彦县','巴彦县','哈尔滨市','黑龙江省','3','151800','0451','','','bayanxian','BYX','0');
INSERT INTO `tk_cities` VALUES('230127','230100','木兰县','黑龙江省-哈尔滨市-木兰县','木兰县','哈尔滨市','黑龙江省','3','151900','0451','','','mulanxian','MLX','0');
INSERT INTO `tk_cities` VALUES('230128','230100','通河县','黑龙江省-哈尔滨市-通河县','通河县','哈尔滨市','黑龙江省','3','150900','0451','','','tonghexian','THX','0');
INSERT INTO `tk_cities` VALUES('230129','230100','延寿县','黑龙江省-哈尔滨市-延寿县','延寿县','哈尔滨市','黑龙江省','3','150700','0451','','','yanshouxian','YSX','0');
INSERT INTO `tk_cities` VALUES('230182','230100','双城市','黑龙江省-哈尔滨市-双城市','双城市','哈尔滨市','黑龙江省','3','150100','0451','','','shuangchengshi','SCS','0');
INSERT INTO `tk_cities` VALUES('230183','230100','尚志市','黑龙江省-哈尔滨市-尚志市','尚志市','哈尔滨市','黑龙江省','3','150600','0451','','','shangzhishi','SZS','0');
INSERT INTO `tk_cities` VALUES('230184','230100','五常市','黑龙江省-哈尔滨市-五常市','五常市','哈尔滨市','黑龙江省','3','150200','0451','','','wuchangshi','WCS','0');
INSERT INTO `tk_cities` VALUES('230202','230200','龙沙区','黑龙江省-齐齐哈尔市-龙沙区','龙沙区','齐齐哈尔市','黑龙江省','3','161000','0452','','','longshaqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('230203','230200','建华区','黑龙江省-齐齐哈尔市-建华区','建华区','齐齐哈尔市','黑龙江省','3','161000','0452','','','jianhuaqu','JHQ','0');
INSERT INTO `tk_cities` VALUES('230204','230200','铁锋区','黑龙江省-齐齐哈尔市-铁锋区','铁锋区','齐齐哈尔市','黑龙江省','3','161000','0452','','','tiefengqu','TFQ','0');
INSERT INTO `tk_cities` VALUES('230205','230200','昂昂溪区','黑龙江省-齐齐哈尔市-昂昂溪区','昂昂溪区','齐齐哈尔市','黑龙江省','3','161000','0452','','','angangxiqu','AAXQ','0');
INSERT INTO `tk_cities` VALUES('230206','230200','富拉尔基区','黑龙江省-齐齐哈尔市-富拉尔基区','富拉尔基区','齐齐哈尔市','黑龙江省','3','161000','0452','','','fulaerjiqu','FLEJQ','0');
INSERT INTO `tk_cities` VALUES('230207','230200','碾子山区','黑龙江省-齐齐哈尔市-碾子山区','碾子山区','齐齐哈尔市','黑龙江省','3','161000','0452','','','nianzishanqu','NZSQ','0');
INSERT INTO `tk_cities` VALUES('230208','230200','梅里斯达斡尔族区','黑龙江省-齐齐哈尔市-梅里斯达斡尔族区','梅里斯达斡尔族区','齐齐哈尔市','黑龙江省','3','161000','0452','','','meilisidawoerzuqu','MLSDWEZQ','0');
INSERT INTO `tk_cities` VALUES('230221','230200','龙江县','黑龙江省-齐齐哈尔市-龙江县','龙江县','齐齐哈尔市','黑龙江省','3','161100','0452','','','longjiangxian','LJX','0');
INSERT INTO `tk_cities` VALUES('230223','230200','依安县','黑龙江省-齐齐哈尔市-依安县','依安县','齐齐哈尔市','黑龙江省','3','161500','0452','','','yianxian','YAX','0');
INSERT INTO `tk_cities` VALUES('230224','230200','泰来县','黑龙江省-齐齐哈尔市-泰来县','泰来县','齐齐哈尔市','黑龙江省','3','162400','0452','','','tailaixian','TLX','0');
INSERT INTO `tk_cities` VALUES('230225','230200','甘南县','黑龙江省-齐齐哈尔市-甘南县','甘南县','齐齐哈尔市','黑龙江省','3','162100','0452','','','gannanxian','GNX','0');
INSERT INTO `tk_cities` VALUES('230227','230200','富裕县','黑龙江省-齐齐哈尔市-富裕县','富裕县','齐齐哈尔市','黑龙江省','3','161200','0452','','','fuyuxian','FYX','0');
INSERT INTO `tk_cities` VALUES('230229','230200','克山县','黑龙江省-齐齐哈尔市-克山县','克山县','齐齐哈尔市','黑龙江省','3','161600','0452','','','keshanxian','KSX','0');
INSERT INTO `tk_cities` VALUES('230230','230200','克东县','黑龙江省-齐齐哈尔市-克东县','克东县','齐齐哈尔市','黑龙江省','3','164800','0452','','','kedongxian','KDX','0');
INSERT INTO `tk_cities` VALUES('230231','230200','拜泉县','黑龙江省-齐齐哈尔市-拜泉县','拜泉县','齐齐哈尔市','黑龙江省','3','164700','0452','','','baiquanxian','BQX','0');
INSERT INTO `tk_cities` VALUES('230281','230200','讷河市','黑龙江省-齐齐哈尔市-讷河市','讷河市','齐齐哈尔市','黑龙江省','3','161300','0452','','','heshi','HS','0');
INSERT INTO `tk_cities` VALUES('230302','230300','鸡冠区','黑龙江省-鸡西市-鸡冠区','鸡冠区','鸡西市','黑龙江省','3','158100','0467','','','jiguanqu','JGQ','0');
INSERT INTO `tk_cities` VALUES('230303','230300','恒山区','黑龙江省-鸡西市-恒山区','恒山区','鸡西市','黑龙江省','3','158100','0467','','','hengshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('230304','230300','滴道区','黑龙江省-鸡西市-滴道区','滴道区','鸡西市','黑龙江省','3','158100','0467','','','didaoqu','DDQ','0');
INSERT INTO `tk_cities` VALUES('230305','230300','梨树区','黑龙江省-鸡西市-梨树区','梨树区','鸡西市','黑龙江省','3','158100','0467','','','lishuqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('230306','230300','城子河区','黑龙江省-鸡西市-城子河区','城子河区','鸡西市','黑龙江省','3','158100','0467','','','chengzihequ','CZHQ','0');
INSERT INTO `tk_cities` VALUES('230307','230300','麻山区','黑龙江省-鸡西市-麻山区','麻山区','鸡西市','黑龙江省','3','158100','0467','','','mashanqu','MSQ','0');
INSERT INTO `tk_cities` VALUES('230321','230300','鸡东县','黑龙江省-鸡西市-鸡东县','鸡东县','鸡西市','黑龙江省','3','158200','0467','','','jidongxian','JDX','0');
INSERT INTO `tk_cities` VALUES('230381','230300','虎林市','黑龙江省-鸡西市-虎林市','虎林市','鸡西市','黑龙江省','3','158400','0467','','','hulinshi','HLS','0');
INSERT INTO `tk_cities` VALUES('230382','230300','密山市','黑龙江省-鸡西市-密山市','密山市','鸡西市','黑龙江省','3','158300','0467','','','mishanshi','MSS','0');
INSERT INTO `tk_cities` VALUES('230402','230400','向阳区','黑龙江省-鹤岗市-向阳区','向阳区','鹤岗市','黑龙江省','3','154000','0468','','','xiangyangqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('230403','230400','工农区','黑龙江省-鹤岗市-工农区','工农区','鹤岗市','黑龙江省','3','154100','0468','','','gongnongqu','GNQ','0');
INSERT INTO `tk_cities` VALUES('230404','230400','南山区','黑龙江省-鹤岗市-南山区','南山区','鹤岗市','黑龙江省','3','154100','0468','','','nanshanqu','NSQ','0');
INSERT INTO `tk_cities` VALUES('230405','230400','兴安区','黑龙江省-鹤岗市-兴安区','兴安区','鹤岗市','黑龙江省','3','154100','0468','','','xinganqu','XAQ','0');
INSERT INTO `tk_cities` VALUES('230406','230400','东山区','黑龙江省-鹤岗市-东山区','东山区','鹤岗市','黑龙江省','3','154100','0468','','','dongshanqu','DSQ','0');
INSERT INTO `tk_cities` VALUES('230407','230400','兴山区','黑龙江省-鹤岗市-兴山区','兴山区','鹤岗市','黑龙江省','3','154100','0468','','','xingshanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('230421','230400','萝北县','黑龙江省-鹤岗市-萝北县','萝北县','鹤岗市','黑龙江省','3','154200','0468','','','luobeixian','LBX','0');
INSERT INTO `tk_cities` VALUES('230422','230400','绥滨县','黑龙江省-鹤岗市-绥滨县','绥滨县','鹤岗市','黑龙江省','3','156200','0468','','','suibinxian','SBX','0');
INSERT INTO `tk_cities` VALUES('230502','230500','尖山区','黑龙江省-双鸭山市-尖山区','尖山区','双鸭山市','黑龙江省','3','155100','0469','','','jianshanqu','JSQ','0');
INSERT INTO `tk_cities` VALUES('230503','230500','岭东区','黑龙江省-双鸭山市-岭东区','岭东区','双鸭山市','黑龙江省','3','155100','0469','','','lingdongqu','LDQ','0');
INSERT INTO `tk_cities` VALUES('230505','230500','四方台区','黑龙江省-双鸭山市-四方台区','四方台区','双鸭山市','黑龙江省','3','155100','0469','','','sifangtaiqu','SFTQ','0');
INSERT INTO `tk_cities` VALUES('230506','230500','宝山区','黑龙江省-双鸭山市-宝山区','宝山区','双鸭山市','黑龙江省','3','155100','0469','','','baoshanqu','BSQ','0');
INSERT INTO `tk_cities` VALUES('230521','230500','集贤县','黑龙江省-双鸭山市-集贤县','集贤县','双鸭山市','黑龙江省','3','155900','0469','','','jixianxian','JXX','0');
INSERT INTO `tk_cities` VALUES('230522','230500','友谊县','黑龙江省-双鸭山市-友谊县','友谊县','双鸭山市','黑龙江省','3','155800','0469','','','youyixian','YYX','0');
INSERT INTO `tk_cities` VALUES('230523','230500','宝清县','黑龙江省-双鸭山市-宝清县','宝清县','双鸭山市','黑龙江省','3','155600','0469','','','baoqingxian','BQX','0');
INSERT INTO `tk_cities` VALUES('230524','230500','饶河县','黑龙江省-双鸭山市-饶河县','饶河县','双鸭山市','黑龙江省','3','155700','0469','','','raohexian','RHX','0');
INSERT INTO `tk_cities` VALUES('230602','230600','萨尔图区','黑龙江省-大庆市-萨尔图区','萨尔图区','大庆市','黑龙江省','3','163000','0459','','','saertuqu','SETQ','0');
INSERT INTO `tk_cities` VALUES('230603','230600','龙凤区','黑龙江省-大庆市-龙凤区','龙凤区','大庆市','黑龙江省','3','163000','0459','','','longfengqu','LFQ','0');
INSERT INTO `tk_cities` VALUES('230604','230600','让胡路区','黑龙江省-大庆市-让胡路区','让胡路区','大庆市','黑龙江省','3','163000','0459','','','ranghuluqu','RHLQ','0');
INSERT INTO `tk_cities` VALUES('230605','230600','红岗区','黑龙江省-大庆市-红岗区','红岗区','大庆市','黑龙江省','3','163000','0459','','','honggangqu','HGQ','0');
INSERT INTO `tk_cities` VALUES('230606','230600','大同区','黑龙江省-大庆市-大同区','大同区','大庆市','黑龙江省','3','163000','0459','','','datongqu','DTQ','0');
INSERT INTO `tk_cities` VALUES('230621','230600','肇州县','黑龙江省-大庆市-肇州县','肇州县','大庆市','黑龙江省','3','166400','0459','','','zhaozhouxian','ZZX','0');
INSERT INTO `tk_cities` VALUES('230622','230600','肇源县','黑龙江省-大庆市-肇源县','肇源县','大庆市','黑龙江省','3','166500','0459','','','zhaoyuanxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('230623','230600','林甸县','黑龙江省-大庆市-林甸县','林甸县','大庆市','黑龙江省','3','166300','0459','','','lindianxian','LDX','0');
INSERT INTO `tk_cities` VALUES('230624','230600','杜尔伯特蒙古族自治县','黑龙江省-大庆市-杜尔伯特蒙古族自治县','杜尔伯特蒙古族自治县','大庆市','黑龙江省','3','166200','0459','','','duerbotemengguzuzizhixian','DEBTMGZZZX','0');
INSERT INTO `tk_cities` VALUES('230702','230700','伊春区','黑龙江省-伊春市-伊春区','伊春区','伊春市','黑龙江省','3','153000','0458','','','yichunqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('230703','230700','南岔区','黑龙江省-伊春市-南岔区','南岔区','伊春市','黑龙江省','3','153000','0458','','','nanchaqu','NCQ','0');
INSERT INTO `tk_cities` VALUES('230704','230700','友好区','黑龙江省-伊春市-友好区','友好区','伊春市','黑龙江省','3','153000','0458','','','youhaoqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('230705','230700','西林区','黑龙江省-伊春市-西林区','西林区','伊春市','黑龙江省','3','153000','0458','','','xilinqu','XLQ','0');
INSERT INTO `tk_cities` VALUES('230706','230700','翠峦区','黑龙江省-伊春市-翠峦区','翠峦区','伊春市','黑龙江省','3','153000','0458','','','cuiluanqu','CLQ','0');
INSERT INTO `tk_cities` VALUES('230707','230700','新青区','黑龙江省-伊春市-新青区','新青区','伊春市','黑龙江省','3','153000','0458','','','xinqingqu','XQQ','0');
INSERT INTO `tk_cities` VALUES('230708','230700','美溪区','黑龙江省-伊春市-美溪区','美溪区','伊春市','黑龙江省','3','153000','0458','','','meixiqu','MXQ','0');
INSERT INTO `tk_cities` VALUES('230709','230700','金山屯区','黑龙江省-伊春市-金山屯区','金山屯区','伊春市','黑龙江省','3','153000','0458','','','jinshantunqu','JSTQ','0');
INSERT INTO `tk_cities` VALUES('230710','230700','五营区','黑龙江省-伊春市-五营区','五营区','伊春市','黑龙江省','3','153000','0458','','','wuyingqu','WYQ','0');
INSERT INTO `tk_cities` VALUES('230711','230700','乌马河区','黑龙江省-伊春市-乌马河区','乌马河区','伊春市','黑龙江省','3','153000','0458','','','wumahequ','WMHQ','0');
INSERT INTO `tk_cities` VALUES('230712','230700','汤旺河区','黑龙江省-伊春市-汤旺河区','汤旺河区','伊春市','黑龙江省','3','153000','0458','','','tangwanghequ','TWHQ','0');
INSERT INTO `tk_cities` VALUES('230713','230700','带岭区','黑龙江省-伊春市-带岭区','带岭区','伊春市','黑龙江省','3','153000','0458','','','dailingqu','DLQ','0');
INSERT INTO `tk_cities` VALUES('230714','230700','乌伊岭区','黑龙江省-伊春市-乌伊岭区','乌伊岭区','伊春市','黑龙江省','3','153000','0458','','','wuyilingqu','WYLQ','0');
INSERT INTO `tk_cities` VALUES('230715','230700','红星区','黑龙江省-伊春市-红星区','红星区','伊春市','黑龙江省','3','153000','0458','','','hongxingqu','HXQ','0');
INSERT INTO `tk_cities` VALUES('230716','230700','上甘岭区','黑龙江省-伊春市-上甘岭区','上甘岭区','伊春市','黑龙江省','3','153000','0458','','','shangganlingqu','SGLQ','0');
INSERT INTO `tk_cities` VALUES('230722','230700','嘉荫县','黑龙江省-伊春市-嘉荫县','嘉荫县','伊春市','黑龙江省','3','153200','0458','','','jiayinxian','JYX','0');
INSERT INTO `tk_cities` VALUES('230781','230700','铁力市','黑龙江省-伊春市-铁力市','铁力市','伊春市','黑龙江省','3','152500','0458','','','tielishi','TLS','0');
INSERT INTO `tk_cities` VALUES('230803','230800','向阳区','黑龙江省-佳木斯市-向阳区','向阳区','佳木斯市','黑龙江省','3','154000','0454','','','xiangyangqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('230804','230800','前进区','黑龙江省-佳木斯市-前进区','前进区','佳木斯市','黑龙江省','3','154000','0454','','','qianjinqu','QJQ','0');
INSERT INTO `tk_cities` VALUES('230805','230800','东风区','黑龙江省-佳木斯市-东风区','东风区','佳木斯市','黑龙江省','3','154000','0454','','','dongfengqu','DFQ','0');
INSERT INTO `tk_cities` VALUES('230811','230800','郊区','黑龙江省-佳木斯市-郊区','郊区','佳木斯市','黑龙江省','3','154000','0454','','','jiaoqu','JQ','0');
INSERT INTO `tk_cities` VALUES('230822','230800','桦南县','黑龙江省-佳木斯市-桦南县','桦南县','佳木斯市','黑龙江省','3','154400','0454','','','nanxian','NX','0');
INSERT INTO `tk_cities` VALUES('230826','230800','桦川县','黑龙江省-佳木斯市-桦川县','桦川县','佳木斯市','黑龙江省','3','154300','0454','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('230828','230800','汤原县','黑龙江省-佳木斯市-汤原县','汤原县','佳木斯市','黑龙江省','3','154700','0454','','','tangyuanxian','TYX','0');
INSERT INTO `tk_cities` VALUES('230833','230800','抚远县','黑龙江省-佳木斯市-抚远县','抚远县','佳木斯市','黑龙江省','3','156500','0454','','','fuyuanxian','FYX','0');
INSERT INTO `tk_cities` VALUES('230881','230800','同江市','黑龙江省-佳木斯市-同江市','同江市','佳木斯市','黑龙江省','3','156400','0454','','','tongjiangshi','TJS','0');
INSERT INTO `tk_cities` VALUES('230882','230800','富锦市','黑龙江省-佳木斯市-富锦市','富锦市','佳木斯市','黑龙江省','3','156100','0454','','','fujinshi','FJS','0');
INSERT INTO `tk_cities` VALUES('230902','230900','新兴区','黑龙江省-七台河市-新兴区','新兴区','七台河市','黑龙江省','3','154600','0464','','','xinxingqu','XXQ','0');
INSERT INTO `tk_cities` VALUES('230903','230900','桃山区','黑龙江省-七台河市-桃山区','桃山区','七台河市','黑龙江省','3','154600','0464','','','taoshanqu','TSQ','0');
INSERT INTO `tk_cities` VALUES('230904','230900','茄子河区','黑龙江省-七台河市-茄子河区','茄子河区','七台河市','黑龙江省','3','154600','0464','','','qiezihequ','QZHQ','0');
INSERT INTO `tk_cities` VALUES('230921','230900','勃利县','黑龙江省-七台河市-勃利县','勃利县','七台河市','黑龙江省','3','154500','0464','','','bolixian','BLX','0');
INSERT INTO `tk_cities` VALUES('231002','231000','东安区','黑龙江省-牡丹江市-东安区','东安区','牡丹江市','黑龙江省','3','157000','0453','','','donganqu','DAQ','0');
INSERT INTO `tk_cities` VALUES('231003','231000','阳明区','黑龙江省-牡丹江市-阳明区','阳明区','牡丹江市','黑龙江省','3','157000','0453','','','yangmingqu','YMQ','0');
INSERT INTO `tk_cities` VALUES('231004','231000','爱民区','黑龙江省-牡丹江市-爱民区','爱民区','牡丹江市','黑龙江省','3','157000','0453','','','aiminqu','AMQ','0');
INSERT INTO `tk_cities` VALUES('231005','231000','西安区','黑龙江省-牡丹江市-西安区','西安区','牡丹江市','黑龙江省','3','157000','0453','','','xianqu','XAQ','0');
INSERT INTO `tk_cities` VALUES('231024','231000','东宁县','黑龙江省-牡丹江市-东宁县','东宁县','牡丹江市','黑龙江省','3','157200','0453','','','dongningxian','DNX','0');
INSERT INTO `tk_cities` VALUES('231025','231000','林口县','黑龙江省-牡丹江市-林口县','林口县','牡丹江市','黑龙江省','3','157600','0453','','','linkouxian','LKX','0');
INSERT INTO `tk_cities` VALUES('231081','231000','绥芬河市','黑龙江省-牡丹江市-绥芬河市','绥芬河市','牡丹江市','黑龙江省','3','157300','0453','','','suifenheshi','SFHS','0');
INSERT INTO `tk_cities` VALUES('231083','231000','海林市','黑龙江省-牡丹江市-海林市','海林市','牡丹江市','黑龙江省','3','157100','0453','','','hailinshi','HLS','0');
INSERT INTO `tk_cities` VALUES('231084','231000','宁安市','黑龙江省-牡丹江市-宁安市','宁安市','牡丹江市','黑龙江省','3','157400','0453','','','ninganshi','NAS','0');
INSERT INTO `tk_cities` VALUES('231085','231000','穆棱市','黑龙江省-牡丹江市-穆棱市','穆棱市','牡丹江市','黑龙江省','3','157500','0453','','','mulengshi','MLS','0');
INSERT INTO `tk_cities` VALUES('231102','231100','爱辉区','黑龙江省-黑河市-爱辉区','爱辉区','黑河市','黑龙江省','3','164300','0456','','','aihuiqu','AHQ','0');
INSERT INTO `tk_cities` VALUES('231121','231100','嫩江县','黑龙江省-黑河市-嫩江县','嫩江县','黑河市','黑龙江省','3','161400','0456','','','nenjiangxian','NJX','0');
INSERT INTO `tk_cities` VALUES('231123','231100','逊克县','黑龙江省-黑河市-逊克县','逊克县','黑河市','黑龙江省','3','164400','0456','','','xunkexian','XKX','0');
INSERT INTO `tk_cities` VALUES('231124','231100','孙吴县','黑龙江省-黑河市-孙吴县','孙吴县','黑河市','黑龙江省','3','164200','0456','','','sunwuxian','SWX','0');
INSERT INTO `tk_cities` VALUES('231181','231100','北安市','黑龙江省-黑河市-北安市','北安市','黑河市','黑龙江省','3','164000','0456','','','beianshi','BAS','0');
INSERT INTO `tk_cities` VALUES('231182','231100','五大连池市','黑龙江省-黑河市-五大连池市','五大连池市','黑河市','黑龙江省','3','164100','0456','','','wudalianchishi','WDLCS','0');
INSERT INTO `tk_cities` VALUES('231202','231200','北林区','黑龙江省-绥化市-北林区','北林区','绥化市','黑龙江省','3','152000','0455','','','beilinqu','BLQ','0');
INSERT INTO `tk_cities` VALUES('231221','231200','望奎县','黑龙江省-绥化市-望奎县','望奎县','绥化市','黑龙江省','3','152100','0455','','','wangkuixian','WKX','0');
INSERT INTO `tk_cities` VALUES('231222','231200','兰西县','黑龙江省-绥化市-兰西县','兰西县','绥化市','黑龙江省','3','151500','0455','','','lanxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('231223','231200','青冈县','黑龙江省-绥化市-青冈县','青冈县','绥化市','黑龙江省','3','151600','0455','','','qinggangxian','QGX','0');
INSERT INTO `tk_cities` VALUES('231224','231200','庆安县','黑龙江省-绥化市-庆安县','庆安县','绥化市','黑龙江省','3','152400','0455','','','qinganxian','QAX','0');
INSERT INTO `tk_cities` VALUES('231225','231200','明水县','黑龙江省-绥化市-明水县','明水县','绥化市','黑龙江省','3','151700','0455','','','mingshuixian','MSX','0');
INSERT INTO `tk_cities` VALUES('231226','231200','绥棱县','黑龙江省-绥化市-绥棱县','绥棱县','绥化市','黑龙江省','3','152200','0455','','','suilengxian','SLX','0');
INSERT INTO `tk_cities` VALUES('231281','231200','安达市','黑龙江省-绥化市-安达市','安达市','绥化市','黑龙江省','3','151400','0455','','','andashi','ADS','0');
INSERT INTO `tk_cities` VALUES('231282','231200','肇东市','黑龙江省-绥化市-肇东市','肇东市','绥化市','黑龙江省','3','151100','0455','','','zhaodongshi','ZDS','0');
INSERT INTO `tk_cities` VALUES('231283','231200','海伦市','黑龙江省-绥化市-海伦市','海伦市','绥化市','黑龙江省','3','152300','0455','','','hailunshi','HLS','0');
INSERT INTO `tk_cities` VALUES('232701','232700','加格达奇区','黑龙江省-大兴安岭地区-加格达奇区','加格达奇区','大兴安岭地区','黑龙江省','3','165000','0457','','','jiagedaqiqu','JGDQQ','0');
INSERT INTO `tk_cities` VALUES('232702','232700','松岭区','黑龙江省-大兴安岭地区-松岭区','松岭区','大兴安岭地区','黑龙江省','3','165012','0457','','','songlingqu','SLQ','0');
INSERT INTO `tk_cities` VALUES('232703','232700','新林区','黑龙江省-大兴安岭地区-新林区','新林区','大兴安岭地区','黑龙江省','3','165022','0457','','','xinlinqu','XLQ','0');
INSERT INTO `tk_cities` VALUES('232704','232700','呼中区','黑龙江省-大兴安岭地区-呼中区','呼中区','大兴安岭地区','黑龙江省','3','165035','0457','','','huzhongqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('232721','232700','呼玛县','黑龙江省-大兴安岭地区-呼玛县','呼玛县','大兴安岭地区','黑龙江省','3','165100','0457','','','humaxian','HMX','0');
INSERT INTO `tk_cities` VALUES('232722','232700','塔河县','黑龙江省-大兴安岭地区-塔河县','塔河县','大兴安岭地区','黑龙江省','3','165200','0457','','','tahexian','THX','0');
INSERT INTO `tk_cities` VALUES('232723','232700','漠河县','黑龙江省-大兴安岭地区-漠河县','漠河县','大兴安岭地区','黑龙江省','3','165300','0457','','','mohexian','MHX','0');
INSERT INTO `tk_cities` VALUES('310000','0','上海市','上海市','','上海市','','1','200000','021','','','','','0');
INSERT INTO `tk_cities` VALUES('310101','310000','黄浦区','上海市-黄浦区','黄浦区','上海市','','3','200000','021','','','huangpuqu','HPQ','0');
INSERT INTO `tk_cities` VALUES('310104','310000','徐汇区','上海市-徐汇区','徐汇区','上海市','','3','200000','021','','','xuhuiqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('310105','310000','长宁区','上海市-长宁区','长宁区','上海市','','3','200000','021','','','changningqu','CNQ','0');
INSERT INTO `tk_cities` VALUES('310106','310000','静安区','上海市-静安区','静安区','上海市','','3','200000','021','','','jinganqu','JAQ','0');
INSERT INTO `tk_cities` VALUES('310107','310000','普陀区','上海市-普陀区','普陀区','上海市','','3','200000','021','','','putuoqu','PTQ','0');
INSERT INTO `tk_cities` VALUES('310108','310000','闸北区','上海市-闸北区','闸北区','上海市','','3','200000','021','','','zhabeiqu','ZBQ','0');
INSERT INTO `tk_cities` VALUES('310109','310000','虹口区','上海市-虹口区','虹口区','上海市','','3','200000','021','','','hongkouqu','HKQ','0');
INSERT INTO `tk_cities` VALUES('310110','310000','杨浦区','上海市-杨浦区','杨浦区','上海市','','3','200000','021','','','yangpuqu','YPQ','0');
INSERT INTO `tk_cities` VALUES('310112','310000','闵行区','上海市-闵行区','闵行区','上海市','','3','201100','021','','','xingqu','XQ','0');
INSERT INTO `tk_cities` VALUES('310113','310000','宝山区','上海市-宝山区','宝山区','上海市','','3','201900','021','','','baoshanqu','BSQ','0');
INSERT INTO `tk_cities` VALUES('310114','310000','嘉定区','上海市-嘉定区','嘉定区','上海市','','3','201800','021','','','jiadingqu','JDQ','0');
INSERT INTO `tk_cities` VALUES('310115','310000','浦东新区','上海市-浦东新区','浦东新区','上海市','','3','200120','021','','','pudongxinqu','PDXQ','0');
INSERT INTO `tk_cities` VALUES('310116','310000','金山区','上海市-金山区','金山区','上海市','','3','201500','021','','','jinshanqu','JSQ','0');
INSERT INTO `tk_cities` VALUES('310117','310000','松江区','上海市-松江区','松江区','上海市','','3','201600','021','','','songjiangqu','SJQ','0');
INSERT INTO `tk_cities` VALUES('310118','310000','青浦区','上海市-青浦区','青浦区','上海市','','3','201700','021','','','qingpuqu','QPQ','0');
INSERT INTO `tk_cities` VALUES('310120','310000','奉贤区','上海市-奉贤区','奉贤区','上海市','','3','201400','021','','','fengxianqu','FXQ','0');
INSERT INTO `tk_cities` VALUES('310230','310000','崇明县','上海市-崇明县','崇明县','上海市','','3','202150','021','','','chongmingxian','CMX','0');
INSERT INTO `tk_cities` VALUES('320000','0','江苏省','江苏省','','','江苏省','1','','','','','jiangsusheng','JSS','0');
INSERT INTO `tk_cities` VALUES('320100','320000','南京市','江苏省-南京市','','南京市','江苏省','2','210000','025','','','nanjingshi','NJS','0');
INSERT INTO `tk_cities` VALUES('320200','320000','无锡市','江苏省-无锡市','','无锡市','江苏省','2','214000','0510','','','wuxishi','WXS','0');
INSERT INTO `tk_cities` VALUES('320300','320000','徐州市','江苏省-徐州市','','徐州市','江苏省','2','221000','0516','','','xuzhoushi','XZS','0');
INSERT INTO `tk_cities` VALUES('320400','320000','常州市','江苏省-常州市','','常州市','江苏省','2','213000','0519','','','changzhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('320500','320000','苏州市','江苏省-苏州市','','苏州市','江苏省','2','215000','0512','','','suzhoushi','SZS','0');
INSERT INTO `tk_cities` VALUES('320600','320000','南通市','江苏省-南通市','','南通市','江苏省','2','226000','0513','','','nantongshi','NTS','0');
INSERT INTO `tk_cities` VALUES('320700','320000','连云港市','江苏省-连云港市','','连云港市','江苏省','2','222000','0518','','','lianyungangshi','LYGS','0');
INSERT INTO `tk_cities` VALUES('320800','320000','淮安市','江苏省-淮安市','','淮安市','江苏省','2','223000','0517','','','huaianshi','HAS','0');
INSERT INTO `tk_cities` VALUES('320900','320000','盐城市','江苏省-盐城市','','盐城市','江苏省','2','224000','0515','','','yanchengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('321000','320000','扬州市','江苏省-扬州市','','扬州市','江苏省','2','225000','0514','','','yangzhoushi','YZS','0');
INSERT INTO `tk_cities` VALUES('321100','320000','镇江市','江苏省-镇江市','','镇江市','江苏省','2','212000','0511','','','zhenjiangshi','ZJS','0');
INSERT INTO `tk_cities` VALUES('321200','320000','泰州市','江苏省-泰州市','','泰州市','江苏省','2','225300','0523','','','taizhoushi','TZS','0');
INSERT INTO `tk_cities` VALUES('321300','320000','宿迁市','江苏省-宿迁市','','宿迁市','江苏省','2','223800','0527','','','suqianshi','SQS','0');
INSERT INTO `tk_cities` VALUES('320102','320100','玄武区','江苏省-南京市-玄武区','玄武区','南京市','江苏省','3','210000','025','','','xuanwuqu','XWQ','0');
INSERT INTO `tk_cities` VALUES('320103','320100','白下区','江苏省-南京市-白下区','白下区','南京市','江苏省','3','210000','025','','','baixiaqu','BXQ','0');
INSERT INTO `tk_cities` VALUES('320104','320100','秦淮区','江苏省-南京市-秦淮区','秦淮区','南京市','江苏省','3','210000','025','','','qinhuaiqu','QHQ','0');
INSERT INTO `tk_cities` VALUES('320105','320100','建邺区','江苏省-南京市-建邺区','建邺区','南京市','江苏省','3','210000','025','','','jianqu','JQ','0');
INSERT INTO `tk_cities` VALUES('320106','320100','鼓楼区','江苏省-南京市-鼓楼区','鼓楼区','南京市','江苏省','3','210000','025','','','gulouqu','GLQ','0');
INSERT INTO `tk_cities` VALUES('320107','320100','下关区','江苏省-南京市-下关区','下关区','南京市','江苏省','3','210000','025','','','xiaguanqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('320111','320100','浦口区','江苏省-南京市-浦口区','浦口区','南京市','江苏省','3','210000','025','','','pukouqu','PKQ','0');
INSERT INTO `tk_cities` VALUES('320113','320100','栖霞区','江苏省-南京市-栖霞区','栖霞区','南京市','江苏省','3','210000','025','','','qixiaqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('320114','320100','雨花台区','江苏省-南京市-雨花台区','雨花台区','南京市','江苏省','3','210000','025','','','yuhuataiqu','YHTQ','0');
INSERT INTO `tk_cities` VALUES('320115','320100','江宁区','江苏省-南京市-江宁区','江宁区','南京市','江苏省','3','211100','025','','','jiangningqu','JNQ','0');
INSERT INTO `tk_cities` VALUES('320116','320100','六合区','江苏省-南京市-六合区','六合区','南京市','江苏省','3','211500','025','','','liuhequ','LHQ','0');
INSERT INTO `tk_cities` VALUES('320124','320100','溧水县','江苏省-南京市-溧水县','溧水县','南京市','江苏省','3','211200','025','','','shuixian','SX','0');
INSERT INTO `tk_cities` VALUES('320125','320100','高淳县','江苏省-南京市-高淳县','高淳县','南京市','江苏省','3','211300','025','','','gaochunxian','GCX','0');
INSERT INTO `tk_cities` VALUES('320202','320200','崇安区','江苏省-无锡市-崇安区','崇安区','无锡市','江苏省','3','214000','0510','','','chonganqu','CAQ','0');
INSERT INTO `tk_cities` VALUES('320203','320200','南长区','江苏省-无锡市-南长区','南长区','无锡市','江苏省','3','214000','0510','','','nanchangqu','NCQ','0');
INSERT INTO `tk_cities` VALUES('320204','320200','北塘区','江苏省-无锡市-北塘区','北塘区','无锡市','江苏省','3','214000','0510','','','beitangqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('320205','320200','锡山区','江苏省-无锡市-锡山区','锡山区','无锡市','江苏省','3','214000','0510','','','xishanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('320206','320200','惠山区','江苏省-无锡市-惠山区','惠山区','无锡市','江苏省','3','214000','0510','','','huishanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('320211','320200','滨湖区','江苏省-无锡市-滨湖区','滨湖区','无锡市','江苏省','3','214000','0510','','','binhuqu','BHQ','0');
INSERT INTO `tk_cities` VALUES('320281','320200','江阴市','江苏省-无锡市-江阴市','江阴市','无锡市','江苏省','3','214400','0510','','','jiangyinshi','JYS','0');
INSERT INTO `tk_cities` VALUES('320282','320200','宜兴市','江苏省-无锡市-宜兴市','宜兴市','无锡市','江苏省','3','214200','0510','','','yixingshi','YXS','0');
INSERT INTO `tk_cities` VALUES('320302','320300','鼓楼区','江苏省-徐州市-鼓楼区','鼓楼区','徐州市','江苏省','3','221000','0516','','','gulouqu','GLQ','0');
INSERT INTO `tk_cities` VALUES('320303','320300','云龙区','江苏省-徐州市-云龙区','云龙区','徐州市','江苏省','3','221000','0516','','','yunlongqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('320305','320300','贾汪区','江苏省-徐州市-贾汪区','贾汪区','徐州市','江苏省','3','221000','0516','','','jiawangqu','JWQ','0');
INSERT INTO `tk_cities` VALUES('320311','320300','泉山区','江苏省-徐州市-泉山区','泉山区','徐州市','江苏省','3','221000','0516','','','quanshanqu','QSQ','0');
INSERT INTO `tk_cities` VALUES('320312','','铜山区','江苏省-徐州市-铜山区','铜山区','徐州市','江苏省','3','','','','','tongshanqu','TSQ','0');
INSERT INTO `tk_cities` VALUES('320321','320300','丰县','江苏省-徐州市-丰县','丰县','徐州市','江苏省','3','221700','0516','','','fengxian','FX','0');
INSERT INTO `tk_cities` VALUES('320322','320300','沛县','江苏省-徐州市-沛县','沛县','徐州市','江苏省','3','221600','0516','','','peixian','PX','0');
INSERT INTO `tk_cities` VALUES('320324','320300','睢宁县','江苏省-徐州市-睢宁县','睢宁县','徐州市','江苏省','3','221200','0516','','','ningxian','NX','0');
INSERT INTO `tk_cities` VALUES('320381','320300','新沂市','江苏省-徐州市-新沂市','新沂市','徐州市','江苏省','3','221400','0516','','','xinyishi','XYS','0');
INSERT INTO `tk_cities` VALUES('320382','320300','邳州市','江苏省-徐州市-邳州市','邳州市','徐州市','江苏省','3','221300','0516','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('320402','320400','天宁区','江苏省-常州市-天宁区','天宁区','常州市','江苏省','3','213000','0519','','','tianningqu','TNQ','0');
INSERT INTO `tk_cities` VALUES('320404','320400','钟楼区','江苏省-常州市-钟楼区','钟楼区','常州市','江苏省','3','213000','0519','','','zhonglouqu','ZLQ','0');
INSERT INTO `tk_cities` VALUES('320405','320400','戚墅堰区','江苏省-常州市-戚墅堰区','戚墅堰区','常州市','江苏省','3','213000','0519','','','qishuyanqu','QSYQ','0');
INSERT INTO `tk_cities` VALUES('320411','320400','新北区','江苏省-常州市-新北区','新北区','常州市','江苏省','3','213000','0519','','','xinbeiqu','XBQ','0');
INSERT INTO `tk_cities` VALUES('320412','320400','武进区','江苏省-常州市-武进区','武进区','常州市','江苏省','3','213100','0519','','','wujinqu','WJQ','0');
INSERT INTO `tk_cities` VALUES('320481','320400','溧阳市','江苏省-常州市-溧阳市','溧阳市','常州市','江苏省','3','213300','0519','','','yangshi','YS','0');
INSERT INTO `tk_cities` VALUES('320482','320400','金坛市','江苏省-常州市-金坛市','金坛市','常州市','江苏省','3','213200','0519','','','jintanshi','JTS','0');
INSERT INTO `tk_cities` VALUES('320503','320500','姑苏区','江苏省-苏州市-姑苏区','姑苏区','苏州市','江苏省','3','215000','0512','','','gusuqu','GSQ','0');
INSERT INTO `tk_cities` VALUES('320505','320500','虎丘区','江苏省-苏州市-虎丘区','虎丘区','苏州市','江苏省','3','215000','0512','','','huqiuqu','HQQ','0');
INSERT INTO `tk_cities` VALUES('320506','320500','吴中区','江苏省-苏州市-吴中区','吴中区','苏州市','江苏省','3','215100','0512','','','wuzhongqu','WZQ','0');
INSERT INTO `tk_cities` VALUES('320507','320500','相城区','江苏省-苏州市-相城区','相城区','苏州市','江苏省','3','215100','0512','','','xiangchengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('320584','320500','吴江区','江苏省-苏州市-吴江区','吴江区','苏州市','江苏省','3','215200','0512','','','wujiangqu','WJQ','0');
INSERT INTO `tk_cities` VALUES('320581','320500','常熟市','江苏省-苏州市-常熟市','常熟市','苏州市','江苏省','3','215500','0512','','','changshushi','CSS','0');
INSERT INTO `tk_cities` VALUES('320582','320500','张家港市','江苏省-苏州市-张家港市','张家港市','苏州市','江苏省','3','215600','0512','','','zhangjiagangshi','ZJGS','0');
INSERT INTO `tk_cities` VALUES('320583','320500','昆山市','江苏省-苏州市-昆山市','昆山市','苏州市','江苏省','3','215300','0512','','','kunshanshi','KSS','0');
INSERT INTO `tk_cities` VALUES('320585','320500','太仓市','江苏省-苏州市-太仓市','太仓市','苏州市','江苏省','3','215400','0512','','','taicangshi','TCS','0');
INSERT INTO `tk_cities` VALUES('320602','320600','崇川区','江苏省-南通市-崇川区','崇川区','南通市','江苏省','3','226000','0513','','','chongchuanqu','CCQ','0');
INSERT INTO `tk_cities` VALUES('320611','320600','港闸区','江苏省-南通市-港闸区','港闸区','南通市','江苏省','3','226000','0513','','','gangzhaqu','GZQ','0');
INSERT INTO `tk_cities` VALUES('320612','','通州区','江苏省-南通市-通州区','通州区','南通市','江苏省','3','','','','','tongzhouqu','TZQ','0');
INSERT INTO `tk_cities` VALUES('320621','320600','海安县','江苏省-南通市-海安县','海安县','南通市','江苏省','3','226600','0513','','','haianxian','HAX','0');
INSERT INTO `tk_cities` VALUES('320623','320600','如东县','江苏省-南通市-如东县','如东县','南通市','江苏省','3','226400','0513','','','rudongxian','RDX','0');
INSERT INTO `tk_cities` VALUES('320681','320600','启东市','江苏省-南通市-启东市','启东市','南通市','江苏省','3','226200','0513','','','qidongshi','QDS','0');
INSERT INTO `tk_cities` VALUES('320682','320600','如皋市','江苏省-南通市-如皋市','如皋市','南通市','江苏省','3','226500','0513','','','rugaoshi','RGS','0');
INSERT INTO `tk_cities` VALUES('320684','320600','海门市','江苏省-南通市-海门市','海门市','南通市','江苏省','3','226100','0513','','','haimenshi','HMS','0');
INSERT INTO `tk_cities` VALUES('320703','320700','连云区','江苏省-连云港市-连云区','连云区','连云港市','江苏省','3','222000','0518','','','lianyunqu','LYQ','0');
INSERT INTO `tk_cities` VALUES('320705','320700','新浦区','江苏省-连云港市-新浦区','新浦区','连云港市','江苏省','3','222000','0518','','','xinpuqu','XPQ','0');
INSERT INTO `tk_cities` VALUES('320706','320700','海州区','江苏省-连云港市-海州区','海州区','连云港市','江苏省','3','222000','0518','','','haizhouqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('320721','320700','赣榆县','江苏省-连云港市-赣榆县','赣榆县','连云港市','江苏省','3','222100','0518','','','ganyuxian','GYX','0');
INSERT INTO `tk_cities` VALUES('320722','320700','东海县','江苏省-连云港市-东海县','东海县','连云港市','江苏省','3','222300','0518','','','donghaixian','DHX','0');
INSERT INTO `tk_cities` VALUES('320723','320700','灌云县','江苏省-连云港市-灌云县','灌云县','连云港市','江苏省','3','222200','0518','','','guanyunxian','GYX','0');
INSERT INTO `tk_cities` VALUES('320724','320700','灌南县','江苏省-连云港市-灌南县','灌南县','连云港市','江苏省','3','223500','0518','','','guannanxian','GNX','0');
INSERT INTO `tk_cities` VALUES('320802','320800','清河区','江苏省-淮安市-清河区','清河区','淮安市','江苏省','3','223001','0517','','','qinghequ','QHQ','0');
INSERT INTO `tk_cities` VALUES('320803','320800','淮安区','江苏省-淮安市-淮安区','淮安区','淮安市','江苏省','3','223200','0517','','','huaianqu','HAQ','0');
INSERT INTO `tk_cities` VALUES('320804','320800','淮阴区','江苏省-淮安市-淮阴区','淮阴区','淮安市','江苏省','3','223300','0517','','','huaiyinqu','HYQ','0');
INSERT INTO `tk_cities` VALUES('320811','320800','青浦区','江苏省-淮安市-青浦区','青浦区','淮安市','江苏省','3','223001','0517','','','qingpuqu','QPQ','0');
INSERT INTO `tk_cities` VALUES('320826','320800','涟水县','江苏省-淮安市-涟水县','涟水县','淮安市','江苏省','3','223400','0517','','','lianshuixian','LSX','0');
INSERT INTO `tk_cities` VALUES('320829','320800','洪泽县','江苏省-淮安市-洪泽县','洪泽县','淮安市','江苏省','3','223100','0517','','','hongzexian','HZX','0');
INSERT INTO `tk_cities` VALUES('320830','320800','盱眙县','江苏省-淮安市-盱眙县','盱眙县','淮安市','江苏省','3','211700','0517','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('320831','320800','金湖县','江苏省-淮安市-金湖县','金湖县','淮安市','江苏省','3','211600','0517','','','jinhuxian','JHX','0');
INSERT INTO `tk_cities` VALUES('320902','320900','亭湖区','江苏省-盐城市-亭湖区','亭湖区','盐城市','江苏省','3','224000','0515','','','tinghuqu','THQ','0');
INSERT INTO `tk_cities` VALUES('320903','320900','盐都区','江苏省-盐城市-盐都区','盐都区','盐城市','江苏省','3','224000','0515','','','yanduqu','YDQ','0');
INSERT INTO `tk_cities` VALUES('320921','320900','响水县','江苏省-盐城市-响水县','响水县','盐城市','江苏省','3','224600','0515','','','xiangshuixian','XSX','0');
INSERT INTO `tk_cities` VALUES('320922','320900','滨海县','江苏省-盐城市-滨海县','滨海县','盐城市','江苏省','3','224000','0515','','','binhaixian','BHX','0');
INSERT INTO `tk_cities` VALUES('320923','320900','阜宁县','江苏省-盐城市-阜宁县','阜宁县','盐城市','江苏省','3','224400','0515','','','funingxian','FNX','0');
INSERT INTO `tk_cities` VALUES('320924','320900','射阳县','江苏省-盐城市-射阳县','射阳县','盐城市','江苏省','3','224300','0515','','','sheyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('320925','320900','建湖县','江苏省-盐城市-建湖县','建湖县','盐城市','江苏省','3','224700','0515','','','jianhuxian','JHX','0');
INSERT INTO `tk_cities` VALUES('320981','320900','东台市','江苏省-盐城市-东台市','东台市','盐城市','江苏省','3','224200','0515','','','dongtaishi','DTS','0');
INSERT INTO `tk_cities` VALUES('320982','320900','大丰市','江苏省-盐城市-大丰市','大丰市','盐城市','江苏省','3','224100','0515','','','dafengshi','DFS','0');
INSERT INTO `tk_cities` VALUES('321002','321000','广陵区','江苏省-扬州市-广陵区','广陵区','扬州市','江苏省','3','225000','0514','','','guanglingqu','GLQ','0');
INSERT INTO `tk_cities` VALUES('321003','321000','邗江区','江苏省-扬州市-邗江区','邗江区','扬州市','江苏省','3','225100','0514','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('321088','321000','江都市','江苏省-扬州市-江都市','江都市','扬州市','江苏省','3','225200','0514','','','jiangdushi','JDS','0');
INSERT INTO `tk_cities` VALUES('321023','321000','宝应县','江苏省-扬州市-宝应县','宝应县','扬州市','江苏省','3','225800','0514','','','baoyingxian','BYX','0');
INSERT INTO `tk_cities` VALUES('321081','321000','仪征市','江苏省-扬州市-仪征市','仪征市','扬州市','江苏省','3','211400','0514','','','yizhengshi','YZS','0');
INSERT INTO `tk_cities` VALUES('321084','321000','高邮市','江苏省-扬州市-高邮市','高邮市','扬州市','江苏省','3','225600','0514','','','gaoyoushi','GYS','0');
INSERT INTO `tk_cities` VALUES('321102','321100','京口区','江苏省-镇江市-京口区','京口区','镇江市','江苏省','3','212000','0511','','','jingkouqu','JKQ','0');
INSERT INTO `tk_cities` VALUES('321111','321100','润州区','江苏省-镇江市-润州区','润州区','镇江市','江苏省','3','212000','0511','','','runzhouqu','RZQ','0');
INSERT INTO `tk_cities` VALUES('321112','321100','丹徒区','江苏省-镇江市-丹徒区','丹徒区','镇江市','江苏省','3','212100','0511','','','dantuqu','DTQ','0');
INSERT INTO `tk_cities` VALUES('321181','321100','丹阳市','江苏省-镇江市-丹阳市','丹阳市','镇江市','江苏省','3','212300','0511','','','danyangshi','DYS','0');
INSERT INTO `tk_cities` VALUES('321182','321100','扬中市','江苏省-镇江市-扬中市','扬中市','镇江市','江苏省','3','212200','0511','','','yangzhongshi','YZS','0');
INSERT INTO `tk_cities` VALUES('321183','321100','句容市','江苏省-镇江市-句容市','句容市','镇江市','江苏省','3','212400','0511','','','jurongshi','JRS','0');
INSERT INTO `tk_cities` VALUES('321202','321200','海陵区','江苏省-泰州市-海陵区','海陵区','泰州市','江苏省','3','225300','0523','','','hailingqu','HLQ','0');
INSERT INTO `tk_cities` VALUES('321203','321200','高港区','江苏省-泰州市-高港区','高港区','泰州市','江苏省','3','225300','0523','','','gaogangqu','GGQ','0');
INSERT INTO `tk_cities` VALUES('321281','321200','兴化市','江苏省-泰州市-兴化市','兴化市','泰州市','江苏省','3','225700','0523','','','xinghuashi','XHS','0');
INSERT INTO `tk_cities` VALUES('321282','321200','靖江市','江苏省-泰州市-靖江市','靖江市','泰州市','江苏省','3','214500','0523','','','jingjiangshi','JJS','0');
INSERT INTO `tk_cities` VALUES('321283','321200','泰兴市','江苏省-泰州市-泰兴市','泰兴市','泰州市','江苏省','3','225400','0523','','','taixingshi','TXS','0');
INSERT INTO `tk_cities` VALUES('321284','321200','姜堰市','江苏省-泰州市-姜堰市','姜堰市','泰州市','江苏省','3','225500','0523','','','jiangyanshi','JYS','0');
INSERT INTO `tk_cities` VALUES('321302','321300','宿城区','江苏省-宿迁市-宿城区','宿城区','宿迁市','江苏省','3','223800','0527','','','suchengqu','SCQ','0');
INSERT INTO `tk_cities` VALUES('321311','321300','宿豫区','江苏省-宿迁市-宿豫区','宿豫区','宿迁市','江苏省','3','223800','0527','','','suyuqu','SYQ','0');
INSERT INTO `tk_cities` VALUES('321322','321300','沭阳县','江苏省-宿迁市-沭阳县','沭阳县','宿迁市','江苏省','3','223600','0527','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('321323','321300','泗阳县','江苏省-宿迁市-泗阳县','泗阳县','宿迁市','江苏省','3','223700','0527','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('321324','321300','泗洪县','江苏省-宿迁市-泗洪县','泗洪县','宿迁市','江苏省','3','223900','0527','','','hongxian','HX','0');
INSERT INTO `tk_cities` VALUES('330000','0','浙江省','浙江省','','','浙江省','1','','','','','zhejiangsheng','ZJS','0');
INSERT INTO `tk_cities` VALUES('330100','330000','杭州市','浙江省-杭州市','','杭州市','浙江省','2','310000','0571','','','hangzhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('330200','330000','宁波市','浙江省-宁波市','','宁波市','浙江省','2','315000','0574','','','ningboshi','NBS','0');
INSERT INTO `tk_cities` VALUES('330300','330000','温州市','浙江省-温州市','','温州市','浙江省','2','325000','0577','','','wenzhoushi','WZS','0');
INSERT INTO `tk_cities` VALUES('330400','330000','嘉兴市','浙江省-嘉兴市','','嘉兴市','浙江省','2','314000','0573','','','jiaxingshi','JXS','0');
INSERT INTO `tk_cities` VALUES('330500','330000','湖州市','浙江省-湖州市','','湖州市','浙江省','2','313000','0572','','','huzhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('330600','330000','绍兴市','浙江省-绍兴市','','绍兴市','浙江省','2','312000','0575','','','shaoxingshi','SXS','0');
INSERT INTO `tk_cities` VALUES('330700','330000','金华市','浙江省-金华市','','金华市','浙江省','2','321000','0579','','','jinhuashi','JHS','0');
INSERT INTO `tk_cities` VALUES('330800','330000','衢州市','浙江省-衢州市','','衢州市','浙江省','2','324000','0570','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('330900','330000','舟山市','浙江省-舟山市','','舟山市','浙江省','2','316000','0580','','','zhoushanshi','ZSS','0');
INSERT INTO `tk_cities` VALUES('331000','330000','台州市','浙江省-台州市','','台州市','浙江省','2','317000','0576','','','taizhoushi','TZS','0');
INSERT INTO `tk_cities` VALUES('331100','330000','丽水市','浙江省-丽水市','','丽水市','浙江省','2','323000','0578','','','lishuishi','LSS','0');
INSERT INTO `tk_cities` VALUES('330102','330100','上城区','浙江省-杭州市-上城区','上城区','杭州市','浙江省','3','310000','0571','','','shangchengqu','SCQ','0');
INSERT INTO `tk_cities` VALUES('330103','330100','下城区','浙江省-杭州市-下城区','下城区','杭州市','浙江省','3','310000','0571','','','xiachengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('330104','330100','江干区','浙江省-杭州市-江干区','江干区','杭州市','浙江省','3','310000','0571','','','jiangganqu','JGQ','0');
INSERT INTO `tk_cities` VALUES('330105','330100','拱墅区','浙江省-杭州市-拱墅区','拱墅区','杭州市','浙江省','3','310000','0571','','','gongshuqu','GSQ','0');
INSERT INTO `tk_cities` VALUES('330106','330100','西湖区','浙江省-杭州市-西湖区','西湖区','杭州市','浙江省','3','310000','0571','','','xihuqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('330108','330100','滨江区','浙江省-杭州市-滨江区','滨江区','杭州市','浙江省','3','310000','0571','','','binjiangqu','BJQ','0');
INSERT INTO `tk_cities` VALUES('330109','330100','萧山区','浙江省-杭州市-萧山区','萧山区','杭州市','浙江省','3','311200','0571','','','xiaoshanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('330110','330100','余杭区','浙江省-杭州市-余杭区','余杭区','杭州市','浙江省','3','311100','0571','','','yuhangqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('330122','330100','桐庐县','浙江省-杭州市-桐庐县','桐庐县','杭州市','浙江省','3','311500','0571','','','tongluxian','TLX','0');
INSERT INTO `tk_cities` VALUES('330127','330100','淳安县','浙江省-杭州市-淳安县','淳安县','杭州市','浙江省','3','311700','0571','','','chunanxian','CAX','0');
INSERT INTO `tk_cities` VALUES('330182','330100','建德市','浙江省-杭州市-建德市','建德市','杭州市','浙江省','3','311600','0571','','','jiandeshi','JDS','0');
INSERT INTO `tk_cities` VALUES('330183','330100','富阳市','浙江省-杭州市-富阳市','富阳市','杭州市','浙江省','3','311400','0571','','','fuyangshi','FYS','0');
INSERT INTO `tk_cities` VALUES('330185','330100','临安市','浙江省-杭州市-临安市','临安市','杭州市','浙江省','3','311300','0571','','','linanshi','LAS','0');
INSERT INTO `tk_cities` VALUES('330203','330200','海曙区','浙江省-宁波市-海曙区','海曙区','宁波市','浙江省','3','315000','0574','','','haishuqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('330204','330200','江东区','浙江省-宁波市-江东区','江东区','宁波市','浙江省','3','315000','0574','','','jiangdongqu','JDQ','0');
INSERT INTO `tk_cities` VALUES('330205','330200','江北区','浙江省-宁波市-江北区','江北区','宁波市','浙江省','3','315000','0574','','','jiangbeiqu','JBQ','0');
INSERT INTO `tk_cities` VALUES('330206','330200','北仑区','浙江省-宁波市-北仑区','北仑区','宁波市','浙江省','3','315800','0574','','','beilunqu','BLQ','0');
INSERT INTO `tk_cities` VALUES('330211','330200','镇海区','浙江省-宁波市-镇海区','镇海区','宁波市','浙江省','3','315200','0574','','','zhenhaiqu','ZHQ','0');
INSERT INTO `tk_cities` VALUES('330212','330200','鄞州区','浙江省-宁波市-鄞州区','鄞州区','宁波市','浙江省','3','315100','0574','','','zhouqu','ZQ','0');
INSERT INTO `tk_cities` VALUES('330225','330200','象山县','浙江省-宁波市-象山县','象山县','宁波市','浙江省','3','315700','0574','','','xiangshanxian','XSX','0');
INSERT INTO `tk_cities` VALUES('330226','330200','宁海县','浙江省-宁波市-宁海县','宁海县','宁波市','浙江省','3','315600','0574','','','ninghaixian','NHX','0');
INSERT INTO `tk_cities` VALUES('330281','330200','余姚市','浙江省-宁波市-余姚市','余姚市','宁波市','浙江省','3','315400','0574','','','yuyaoshi','YYS','0');
INSERT INTO `tk_cities` VALUES('330282','330200','慈溪市','浙江省-宁波市-慈溪市','慈溪市','宁波市','浙江省','3','315300','0574','','','cixishi','CXS','0');
INSERT INTO `tk_cities` VALUES('330283','330200','奉化市','浙江省-宁波市-奉化市','奉化市','宁波市','浙江省','3','315500','0574','','','fenghuashi','FHS','0');
INSERT INTO `tk_cities` VALUES('330302','330300','鹿城区','浙江省-温州市-鹿城区','鹿城区','温州市','浙江省','3','325000','0577','','','luchengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('330303','330300','龙湾区','浙江省-温州市-龙湾区','龙湾区','温州市','浙江省','3','325000','0577','','','longwanqu','LWQ','0');
INSERT INTO `tk_cities` VALUES('330304','330300','瓯海区','浙江省-温州市-瓯海区','瓯海区','温州市','浙江省','3','325000','0577','','','haiqu','HQ','0');
INSERT INTO `tk_cities` VALUES('330322','330300','洞头县','浙江省-温州市-洞头县','洞头县','温州市','浙江省','3','325700','0577','','','dongtouxian','DTX','0');
INSERT INTO `tk_cities` VALUES('330324','330300','永嘉县','浙江省-温州市-永嘉县','永嘉县','温州市','浙江省','3','325100','0577','','','yongjiaxian','YJX','0');
INSERT INTO `tk_cities` VALUES('330326','330300','平阳县','浙江省-温州市-平阳县','平阳县','温州市','浙江省','3','325400','0577','','','pingyangxian','PYX','0');
INSERT INTO `tk_cities` VALUES('330327','330300','苍南县','浙江省-温州市-苍南县','苍南县','温州市','浙江省','3','325800','0577','','','cangnanxian','CNX','0');
INSERT INTO `tk_cities` VALUES('330328','330300','文成县','浙江省-温州市-文成县','文成县','温州市','浙江省','3','325300','0577','','','wenchengxian','WCX','0');
INSERT INTO `tk_cities` VALUES('330329','330300','泰顺县','浙江省-温州市-泰顺县','泰顺县','温州市','浙江省','3','325500','0577','','','taishunxian','TSX','0');
INSERT INTO `tk_cities` VALUES('330381','330300','瑞安市','浙江省-温州市-瑞安市','瑞安市','温州市','浙江省','3','325200','0577','','','ruianshi','RAS','0');
INSERT INTO `tk_cities` VALUES('330382','330300','乐清市','浙江省-温州市-乐清市','乐清市','温州市','浙江省','3','325600','0577','','','leqingshi','LQS','0');
INSERT INTO `tk_cities` VALUES('330402','330400','南湖区','浙江省-嘉兴市-南湖区','南湖区','嘉兴市','浙江省','3','314000','0573','','','nanhuqu','NHQ','0');
INSERT INTO `tk_cities` VALUES('330411','330400','秀洲区','浙江省-嘉兴市-秀洲区','秀洲区','嘉兴市','浙江省','3','314000','0573','','','xiuzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('330421','330400','嘉善县','浙江省-嘉兴市-嘉善县','嘉善县','嘉兴市','浙江省','3','314100','0573','','','jiashanxian','JSX','0');
INSERT INTO `tk_cities` VALUES('330424','330400','海盐县','浙江省-嘉兴市-海盐县','海盐县','嘉兴市','浙江省','3','314300','0573','','','haiyanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('330481','330400','海宁市','浙江省-嘉兴市-海宁市','海宁市','嘉兴市','浙江省','3','314400','0573','','','hainingshi','HNS','0');
INSERT INTO `tk_cities` VALUES('330482','330400','平湖市','浙江省-嘉兴市-平湖市','平湖市','嘉兴市','浙江省','3','314200','0573','','','pinghushi','PHS','0');
INSERT INTO `tk_cities` VALUES('330483','330400','桐乡市','浙江省-嘉兴市-桐乡市','桐乡市','嘉兴市','浙江省','3','314500','0573','','','tongxiangshi','TXS','0');
INSERT INTO `tk_cities` VALUES('330502','330500','吴兴区','浙江省-湖州市-吴兴区','吴兴区','湖州市','浙江省','3','313000','0572','','','wuxingqu','WXQ','0');
INSERT INTO `tk_cities` VALUES('330503','330500','南浔区','浙江省-湖州市-南浔区','南浔区','湖州市','浙江省','3','313000','0572','','','nanqu','NQ','0');
INSERT INTO `tk_cities` VALUES('330521','330500','德清县','浙江省-湖州市-德清县','德清县','湖州市','浙江省','3','313200','0572','','','deqingxian','DQX','0');
INSERT INTO `tk_cities` VALUES('330522','330500','长兴县','浙江省-湖州市-长兴县','长兴县','湖州市','浙江省','3','313100','0572','','','changxingxian','CXX','0');
INSERT INTO `tk_cities` VALUES('330523','330500','安吉县','浙江省-湖州市-安吉县','安吉县','湖州市','浙江省','3','313300','0572','','','anjixian','AJX','0');
INSERT INTO `tk_cities` VALUES('330602','330600','越城区','浙江省-绍兴市-越城区','越城区','绍兴市','浙江省','3','312000','0575','','','yuechengqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('330621','330600','绍兴县','浙江省-绍兴市-绍兴县','绍兴县','绍兴市','浙江省','3','312000','0575','','','shaoxingxian','SXX','0');
INSERT INTO `tk_cities` VALUES('330624','330600','新昌县','浙江省-绍兴市-新昌县','新昌县','绍兴市','浙江省','3','312500','0575','','','xinchangxian','XCX','0');
INSERT INTO `tk_cities` VALUES('330681','330600','诸暨市','浙江省-绍兴市-诸暨市','诸暨市','绍兴市','浙江省','3','311800','0575','','','zhushi','ZS','0');
INSERT INTO `tk_cities` VALUES('330682','330600','上虞市','浙江省-绍兴市-上虞市','上虞市','绍兴市','浙江省','3','312300','0575','','','shangyushi','SYS','0');
INSERT INTO `tk_cities` VALUES('330683','330600','嵊州市','浙江省-绍兴市-嵊州市','嵊州市','绍兴市','浙江省','3','312400','0575','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('330702','330700','婺城区','浙江省-金华市-婺城区','婺城区','金华市','浙江省','3','321000','0579','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('330703','330700','金东区','浙江省-金华市-金东区','金东区','金华市','浙江省','3','321000','0579','','','jindongqu','JDQ','0');
INSERT INTO `tk_cities` VALUES('330723','330700','武义县','浙江省-金华市-武义县','武义县','金华市','浙江省','3','321200','0579','','','wuyixian','WYX','0');
INSERT INTO `tk_cities` VALUES('330726','330700','浦江县','浙江省-金华市-浦江县','浦江县','金华市','浙江省','3','322200','0579','','','pujiangxian','PJX','0');
INSERT INTO `tk_cities` VALUES('330727','330700','磐安县','浙江省-金华市-磐安县','磐安县','金华市','浙江省','3','322300','0579','','','pananxian','PAX','0');
INSERT INTO `tk_cities` VALUES('330781','330700','兰溪市','浙江省-金华市-兰溪市','兰溪市','金华市','浙江省','3','321100','0579','','','lanxishi','LXS','0');
INSERT INTO `tk_cities` VALUES('330782','330700','义乌市','浙江省-金华市-义乌市','义乌市','金华市','浙江省','3','322000','0579','','','yiwushi','YWS','0');
INSERT INTO `tk_cities` VALUES('330783','330700','东阳市','浙江省-金华市-东阳市','东阳市','金华市','浙江省','3','322100','0579','','','dongyangshi','DYS','0');
INSERT INTO `tk_cities` VALUES('330784','330700','永康市','浙江省-金华市-永康市','永康市','金华市','浙江省','3','321300','0579','','','yongkangshi','YKS','0');
INSERT INTO `tk_cities` VALUES('330802','330800','柯城区','浙江省-衢州市-柯城区','柯城区','衢州市','浙江省','3','324000','0570','','','kechengqu','KCQ','0');
INSERT INTO `tk_cities` VALUES('330803','330800','衢江区','浙江省-衢州市-衢江区','衢江区','衢州市','浙江省','3','324000','0570','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('330822','330800','常山县','浙江省-衢州市-常山县','常山县','衢州市','浙江省','3','324200','0570','','','changshanxian','CSX','0');
INSERT INTO `tk_cities` VALUES('330824','330800','开化县','浙江省-衢州市-开化县','开化县','衢州市','浙江省','3','324300','0570','','','kaihuaxian','KHX','0');
INSERT INTO `tk_cities` VALUES('330825','330800','龙游县','浙江省-衢州市-龙游县','龙游县','衢州市','浙江省','3','324400','0570','','','longyouxian','LYX','0');
INSERT INTO `tk_cities` VALUES('330881','330800','江山市','浙江省-衢州市-江山市','江山市','衢州市','浙江省','3','324100','0570','','','jiangshanshi','JSS','0');
INSERT INTO `tk_cities` VALUES('330902','330900','定海区','浙江省-舟山市-定海区','定海区','舟山市','浙江省','3','316000','0580','','','dinghaiqu','DHQ','0');
INSERT INTO `tk_cities` VALUES('330903','330900','普陀区','浙江省-舟山市-普陀区','普陀区','舟山市','浙江省','3','316100','0580','','','putuoqu','PTQ','0');
INSERT INTO `tk_cities` VALUES('330921','330900','岱山县','浙江省-舟山市-岱山县','岱山县','舟山市','浙江省','3','316200','0580','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('330922','330900','嵊泗县','浙江省-舟山市-嵊泗县','嵊泗县','舟山市','浙江省','3','202450','0580','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('331002','331000','椒江区','浙江省-台州市-椒江区','椒江区','台州市','浙江省','3','317700','0576','','','jiaojiangqu','JJQ','0');
INSERT INTO `tk_cities` VALUES('331003','331000','黄岩区','浙江省-台州市-黄岩区','黄岩区','台州市','浙江省','3','318020','0576','','','huangyanqu','HYQ','0');
INSERT INTO `tk_cities` VALUES('331004','331000','路桥区','浙江省-台州市-路桥区','路桥区','台州市','浙江省','3','318000','0576','','','luqiaoqu','LQQ','0');
INSERT INTO `tk_cities` VALUES('331021','331000','玉环县','浙江省-台州市-玉环县','玉环县','台州市','浙江省','3','317600','0576','','','yuhuanxian','YHX','0');
INSERT INTO `tk_cities` VALUES('331022','331000','三门县','浙江省-台州市-三门县','三门县','台州市','浙江省','3','317100','0576','','','sanmenxian','SMX','0');
INSERT INTO `tk_cities` VALUES('331023','331000','天台县','浙江省-台州市-天台县','天台县','台州市','浙江省','3','317200','0576','','','tiantaixian','TTX','0');
INSERT INTO `tk_cities` VALUES('331024','331000','仙居县','浙江省-台州市-仙居县','仙居县','台州市','浙江省','3','317300','0576','','','xianjuxian','XJX','0');
INSERT INTO `tk_cities` VALUES('331081','331000','温岭市','浙江省-台州市-温岭市','温岭市','台州市','浙江省','3','317500','0576','','','wenlingshi','WLS','0');
INSERT INTO `tk_cities` VALUES('331082','331000','临海市','浙江省-台州市-临海市','临海市','台州市','浙江省','3','317000','0576','','','linhaishi','LHS','0');
INSERT INTO `tk_cities` VALUES('331102','331100','莲都区','浙江省-丽水市-莲都区','莲都区','丽水市','浙江省','3','323000','0578','','','lianduqu','LDQ','0');
INSERT INTO `tk_cities` VALUES('331121','331100','青田县','浙江省-丽水市-青田县','青田县','丽水市','浙江省','3','323900','0578','','','qingtianxian','QTX','0');
INSERT INTO `tk_cities` VALUES('331122','331100','缙云县','浙江省-丽水市-缙云县','缙云县','丽水市','浙江省','3','321400','0578','','','yunxian','YX','0');
INSERT INTO `tk_cities` VALUES('331123','331100','遂昌县','浙江省-丽水市-遂昌县','遂昌县','丽水市','浙江省','3','323300','0578','','','suichangxian','SCX','0');
INSERT INTO `tk_cities` VALUES('331124','331100','松阳县','浙江省-丽水市-松阳县','松阳县','丽水市','浙江省','3','323400','0578','','','songyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('331125','331100','云和县','浙江省-丽水市-云和县','云和县','丽水市','浙江省','3','323600','0578','','','yunhexian','YHX','0');
INSERT INTO `tk_cities` VALUES('331126','331100','庆元县','浙江省-丽水市-庆元县','庆元县','丽水市','浙江省','3','323800','0578','','','qingyuanxian','QYX','0');
INSERT INTO `tk_cities` VALUES('331127','331100','景宁畲族自治县','浙江省-丽水市-景宁畲族自治县','景宁畲族自治县','丽水市','浙江省','3','323500','0578','','','jingningzuzizhixian','JNZZZX','0');
INSERT INTO `tk_cities` VALUES('331181','331100','龙泉市','浙江省-丽水市-龙泉市','龙泉市','丽水市','浙江省','3','323700','0578','','','longquanshi','LQS','0');
INSERT INTO `tk_cities` VALUES('340000','0','安徽省','安徽省','','','安徽省','1','','','','','anhuisheng','AHS','0');
INSERT INTO `tk_cities` VALUES('340100','340000','合肥市','安徽省-合肥市','','合肥市','安徽省','2','230000','0551','','','hefeishi','HFS','0');
INSERT INTO `tk_cities` VALUES('340200','340000','芜湖市','安徽省-芜湖市','','芜湖市','安徽省','2','241000','0553','','','wuhushi','WHS','0');
INSERT INTO `tk_cities` VALUES('340300','340000','蚌埠市','安徽省-蚌埠市','','蚌埠市','安徽省','2','233000','0552','','','bangbushi','BBS','0');
INSERT INTO `tk_cities` VALUES('340400','340000','淮南市','安徽省-淮南市','','淮南市','安徽省','2','232000','0554','','','huainanshi','HNS','0');
INSERT INTO `tk_cities` VALUES('340500','340000','马鞍山市','安徽省-马鞍山市','','马鞍山市','安徽省','2','243000','0555','','','maanshanshi','MASS','0');
INSERT INTO `tk_cities` VALUES('340600','340000','淮北市','安徽省-淮北市','','淮北市','安徽省','2','235000','0561','','','huaibeishi','HBS','0');
INSERT INTO `tk_cities` VALUES('340700','340000','铜陵市','安徽省-铜陵市','','铜陵市','安徽省','2','244000','0562','','','tonglingshi','TLS','0');
INSERT INTO `tk_cities` VALUES('340800','340000','安庆市','安徽省-安庆市','','安庆市','安徽省','2','246000','0556','','','anqingshi','AQS','0');
INSERT INTO `tk_cities` VALUES('341000','340000','黄山市','安徽省-黄山市','','黄山市','安徽省','2','245000','0559','','','huangshanshi','HSS','0');
INSERT INTO `tk_cities` VALUES('341100','340000','滁州市','安徽省-滁州市','','滁州市','安徽省','2','239000','0550','','','chuzhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('341200','340000','阜阳市','安徽省-阜阳市','','阜阳市','安徽省','2','236000','0558','','','fuyangshi','FYS','0');
INSERT INTO `tk_cities` VALUES('341300','340000','宿州市','安徽省-宿州市','','宿州市','安徽省','2','234000','0557','','','suzhoushi','SZS','0');
INSERT INTO `tk_cities` VALUES('341500','340000','六安市','安徽省-六安市','','六安市','安徽省','2','237000','0564','','','liuanshi','LAS','0');
INSERT INTO `tk_cities` VALUES('341600','340000','亳州市','安徽省-亳州市','','亳州市','安徽省','2','236000','0558','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('341700','340000','池州市','安徽省-池州市','','池州市','安徽省','2','247100','0566','','','chizhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('341800','340000','宣城市','安徽省-宣城市','','宣城市','安徽省','2','242000','0563','','','xuanchengshi','XCS','0');
INSERT INTO `tk_cities` VALUES('340102','340100','瑶海区','安徽省-合肥市-瑶海区','瑶海区','合肥市','安徽省','3','230000','0551','','','yaohaiqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('340103','340100','庐阳区','安徽省-合肥市-庐阳区','庐阳区','合肥市','安徽省','3','230000','0551','','','luyangqu','LYQ','0');
INSERT INTO `tk_cities` VALUES('340104','340100','蜀山区','安徽省-合肥市-蜀山区','蜀山区','合肥市','安徽省','3','230000','0551','','','shushanqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('340111','340100','包河区','安徽省-合肥市-包河区','包河区','合肥市','安徽省','3','230000','0551','','','baohequ','BHQ','0');
INSERT INTO `tk_cities` VALUES('340121','340100','长丰县','安徽省-合肥市-长丰县','长丰县','合肥市','安徽省','3','231100','0551','','','changfengxian','CFX','0');
INSERT INTO `tk_cities` VALUES('340122','340100','肥东县','安徽省-合肥市-肥东县','肥东县','合肥市','安徽省','3','230000','0551','','','feidongxian','FDX','0');
INSERT INTO `tk_cities` VALUES('340123','340100','肥西县','安徽省-合肥市-肥西县','肥西县','合肥市','安徽省','3','231200','0551','','','feixixian','FXX','0');
INSERT INTO `tk_cities` VALUES('340124','','庐江县','安徽省-合肥市-庐江县','庐江县','合肥市','安徽省','3','','','','','lujiangxian','LJX','0');
INSERT INTO `tk_cities` VALUES('340181','','巢湖市','安徽省-合肥市-巢湖市','巢湖市','合肥市','安徽省','3','','','','','chaohushi','CHS','0');
INSERT INTO `tk_cities` VALUES('340202','340200','镜湖区','安徽省-芜湖市-镜湖区','镜湖区','芜湖市','安徽省','3','241000','0553','','','jinghuqu','JHQ','0');
INSERT INTO `tk_cities` VALUES('340203','340200','弋江区','安徽省-芜湖市-弋江区','弋江区','芜湖市','安徽省','3','241000','0553','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('340207','340200','鸠江区','安徽省-芜湖市-鸠江区','鸠江区','芜湖市','安徽省','3','241000','0553','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('340208','340200','三山区','安徽省-芜湖市-三山区','三山区','芜湖市','安徽省','3','241080','0553','','','sanshanqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('340221','340200','芜湖县','安徽省-芜湖市-芜湖县','芜湖县','芜湖市','安徽省','3','241100','0553','','','wuhuxian','WHX','0');
INSERT INTO `tk_cities` VALUES('340222','340200','繁昌县','安徽省-芜湖市-繁昌县','繁昌县','芜湖市','安徽省','3','241200','0553','','','fanchangxian','FCX','0');
INSERT INTO `tk_cities` VALUES('340223','340200','南陵县','安徽省-芜湖市-南陵县','南陵县','芜湖市','安徽省','3','242400','0553','','','nanlingxian','NLX','0');
INSERT INTO `tk_cities` VALUES('340225','','无为县','安徽省-芜湖市-无为县','无为县','芜湖市','安徽省','3','','','','','wuweixian','WWX','0');
INSERT INTO `tk_cities` VALUES('340302','340300','龙子湖区','安徽省-蚌埠市-龙子湖区','龙子湖区','蚌埠市','安徽省','3','233000','0552','','','longzihuqu','LZHQ','0');
INSERT INTO `tk_cities` VALUES('340303','340300','蚌山区','安徽省-蚌埠市-蚌山区','蚌山区','蚌埠市','安徽省','3','233000','0552','','','bangshanqu','BSQ','0');
INSERT INTO `tk_cities` VALUES('340304','340300','禹会区','安徽省-蚌埠市-禹会区','禹会区','蚌埠市','安徽省','3','233000','0552','','','yuhuiqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('340311','340300','淮上区','安徽省-蚌埠市-淮上区','淮上区','蚌埠市','安徽省','3','233000','0552','','','huaishangqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('340321','340300','怀远县','安徽省-蚌埠市-怀远县','怀远县','蚌埠市','安徽省','3','233400','0552','','','huaiyuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('340322','340300','五河县','安徽省-蚌埠市-五河县','五河县','蚌埠市','安徽省','3','233300','0552','','','wuhexian','WHX','0');
INSERT INTO `tk_cities` VALUES('340323','340300','固镇县','安徽省-蚌埠市-固镇县','固镇县','蚌埠市','安徽省','3','233700','0552','','','guzhenxian','GZX','0');
INSERT INTO `tk_cities` VALUES('340402','340400','大通区','安徽省-淮南市-大通区','大通区','淮南市','安徽省','3','232000','0554','','','datongqu','DTQ','0');
INSERT INTO `tk_cities` VALUES('340403','340400','田家庵区','安徽省-淮南市-田家庵区','田家庵区','淮南市','安徽省','3','232000','0554','','','tianjiaqu','TJQ','0');
INSERT INTO `tk_cities` VALUES('340404','340400','谢家集区','安徽省-淮南市-谢家集区','谢家集区','淮南市','安徽省','3','232000','0554','','','xiejiajiqu','XJJQ','0');
INSERT INTO `tk_cities` VALUES('340405','340400','八公山区','安徽省-淮南市-八公山区','八公山区','淮南市','安徽省','3','232000','0554','','','bagongshanqu','BGSQ','0');
INSERT INTO `tk_cities` VALUES('340406','340400','潘集区','安徽省-淮南市-潘集区','潘集区','淮南市','安徽省','3','232000','0554','','','panjiqu','PJQ','0');
INSERT INTO `tk_cities` VALUES('340421','340400','凤台县','安徽省-淮南市-凤台县','凤台县','淮南市','安徽省','3','232100','0554','','','fengtaixian','FTX','0');
INSERT INTO `tk_cities` VALUES('340503','340500','花山区','安徽省-马鞍山市-花山区','花山区','马鞍山市','安徽省','3','243000','0555','','','huashanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('340504','340500','雨山区','安徽省-马鞍山市-雨山区','雨山区','马鞍山市','安徽省','3','243000','0555','','','yushanqu','YSQ','0');
INSERT INTO `tk_cities` VALUES('340596','','博望区','安徽省-马鞍山市-博望区','博望区','马鞍山市','安徽省','3','','','','','bowangqu','BWQ','0');
INSERT INTO `tk_cities` VALUES('340521','340500','当涂县','安徽省-马鞍山市-当涂县','当涂县','马鞍山市','安徽省','3','243100','0555','','','dangtuxian','DTX','0');
INSERT INTO `tk_cities` VALUES('340522','','含山县','安徽省-马鞍山市-含山县','含山县','马鞍山市','安徽省','3','','','','','hanshanxian','HSX','0');
INSERT INTO `tk_cities` VALUES('340523','','和县','安徽省-马鞍山市-和县','和县','马鞍山市','安徽省','3','','','','','hexian','HX','0');
INSERT INTO `tk_cities` VALUES('340602','340600','杜集区','安徽省-淮北市-杜集区','杜集区','淮北市','安徽省','3','235000','0561','','','dujiqu','DJQ','0');
INSERT INTO `tk_cities` VALUES('340603','340600','相山区','安徽省-淮北市-相山区','相山区','淮北市','安徽省','3','235000','0561','','','xiangshanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('340604','340600','烈山区','安徽省-淮北市-烈山区','烈山区','淮北市','安徽省','3','235000','0561','','','lieshanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('340621','340600','濉溪县','安徽省-淮北市-濉溪县','濉溪县','淮北市','安徽省','3','235100','0561','','','xixian','XX','0');
INSERT INTO `tk_cities` VALUES('340702','340700','铜官山区','安徽省-铜陵市-铜官山区','铜官山区','铜陵市','安徽省','3','244000','0562','','','tongguanshanqu','TGSQ','0');
INSERT INTO `tk_cities` VALUES('340703','340700','狮子山区','安徽省-铜陵市-狮子山区','狮子山区','铜陵市','安徽省','3','244000','0562','','','shizishanqu','SZSQ','0');
INSERT INTO `tk_cities` VALUES('340711','340700','郊区','安徽省-铜陵市-郊区','郊区','铜陵市','安徽省','3','244000','0562','','','jiaoqu','JQ','0');
INSERT INTO `tk_cities` VALUES('340721','340700','铜陵县','安徽省-铜陵市-铜陵县','铜陵县','铜陵市','安徽省','3','244100','0562','','','tonglingxian','TLX','0');
INSERT INTO `tk_cities` VALUES('340802','340800','迎江区','安徽省-安庆市-迎江区','迎江区','安庆市','安徽省','3','246000','0556','','','yingjiangqu','YJQ','0');
INSERT INTO `tk_cities` VALUES('340803','340800','大观区','安徽省-安庆市-大观区','大观区','安庆市','安徽省','3','246000','0556','','','daguanqu','DGQ','0');
INSERT INTO `tk_cities` VALUES('340811','340800','宜秀区','安徽省-安庆市-宜秀区','宜秀区','安庆市','安徽省','3','246000','0556','','','yixiuqu','YXQ','0');
INSERT INTO `tk_cities` VALUES('340822','340800','怀宁县','安徽省-安庆市-怀宁县','怀宁县','安庆市','安徽省','3','246100','0556','','','huainingxian','HNX','0');
INSERT INTO `tk_cities` VALUES('340823','340800','枞阳县','安徽省-安庆市-枞阳县','枞阳县','安庆市','安徽省','3','246700','0556','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('340824','340800','潜山县','安徽省-安庆市-潜山县','潜山县','安庆市','安徽省','3','246300','0556','','','qianshanxian','QSX','0');
INSERT INTO `tk_cities` VALUES('340825','340800','太湖县','安徽省-安庆市-太湖县','太湖县','安庆市','安徽省','3','246400','0556','','','taihuxian','THX','0');
INSERT INTO `tk_cities` VALUES('340826','340800','宿松县','安徽省-安庆市-宿松县','宿松县','安庆市','安徽省','3','246500','0556','','','susongxian','SSX','0');
INSERT INTO `tk_cities` VALUES('340827','340800','望江县','安徽省-安庆市-望江县','望江县','安庆市','安徽省','3','246200','0556','','','wangjiangxian','WJX','0');
INSERT INTO `tk_cities` VALUES('340828','340800','岳西县','安徽省-安庆市-岳西县','岳西县','安庆市','安徽省','3','246600','0556','','','yuexixian','YXX','0');
INSERT INTO `tk_cities` VALUES('340881','340800','桐城市','安徽省-安庆市-桐城市','桐城市','安庆市','安徽省','3','231400','0556','','','tongchengshi','TCS','0');
INSERT INTO `tk_cities` VALUES('341002','341000','屯溪区','安徽省-黄山市-屯溪区','屯溪区','黄山市','安徽省','3','245000','0559','','','tunxiqu','TXQ','0');
INSERT INTO `tk_cities` VALUES('341003','341000','黄山区','安徽省-黄山市-黄山区','黄山区','黄山市','安徽省','3','245000','0559','','','huangshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('341004','341000','徽州区','安徽省-黄山市-徽州区','徽州区','黄山市','安徽省','3','245000','0559','','','huizhouqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('341021','341000','歙县','安徽省-黄山市-歙县','歙县','黄山市','安徽省','3','245200','0559','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('341022','341000','休宁县','安徽省-黄山市-休宁县','休宁县','黄山市','安徽省','3','245400','0559','','','xiuningxian','XNX','0');
INSERT INTO `tk_cities` VALUES('341023','341000','黟县','安徽省-黄山市-黟县','黟县','黄山市','安徽省','3','245500','0559','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('341024','341000','祁门县','安徽省-黄山市-祁门县','祁门县','黄山市','安徽省','3','245600','0559','','','qimenxian','QMX','0');
INSERT INTO `tk_cities` VALUES('341102','341100','琅琊区','安徽省-滁州市-琅琊区','琅琊区','滁州市','安徽省','3','239000','0550','','','langqu','LQ','0');
INSERT INTO `tk_cities` VALUES('341103','341100','南谯区','安徽省-滁州市-南谯区','南谯区','滁州市','安徽省','3','239000','0550','','','nanqu','NQ','0');
INSERT INTO `tk_cities` VALUES('341122','341100','来安县','安徽省-滁州市-来安县','来安县','滁州市','安徽省','3','239200','0550','','','laianxian','LAX','0');
INSERT INTO `tk_cities` VALUES('341124','341100','全椒县','安徽省-滁州市-全椒县','全椒县','滁州市','安徽省','3','239500','0550','','','quanjiaoxian','QJX','0');
INSERT INTO `tk_cities` VALUES('341125','341100','定远县','安徽省-滁州市-定远县','定远县','滁州市','安徽省','3','233200','0550','','','dingyuanxian','DYX','0');
INSERT INTO `tk_cities` VALUES('341126','341100','凤阳县','安徽省-滁州市-凤阳县','凤阳县','滁州市','安徽省','3','233100','0550','','','fengyangxian','FYX','0');
INSERT INTO `tk_cities` VALUES('341181','341100','天长市','安徽省-滁州市-天长市','天长市','滁州市','安徽省','3','239300','0550','','','tianchangshi','TCS','0');
INSERT INTO `tk_cities` VALUES('341182','341100','明光市','安徽省-滁州市-明光市','明光市','滁州市','安徽省','3','239400','0550','','','mingguangshi','MGS','0');
INSERT INTO `tk_cities` VALUES('341202','341200','颍州区','安徽省-阜阳市-颍州区','颍州区','阜阳市','安徽省','3','236000','0558','','','zhouqu','ZQ','0');
INSERT INTO `tk_cities` VALUES('341203','341200','颍东区','安徽省-阜阳市-颍东区','颍东区','阜阳市','安徽省','3','236000','0558','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('341204','341200','颍泉区','安徽省-阜阳市-颍泉区','颍泉区','阜阳市','安徽省','3','236000','0558','','','quanqu','QQ','0');
INSERT INTO `tk_cities` VALUES('341221','341200','临泉县','安徽省-阜阳市-临泉县','临泉县','阜阳市','安徽省','3','236400','0558','','','linquanxian','LQX','0');
INSERT INTO `tk_cities` VALUES('341222','341200','太和县','安徽省-阜阳市-太和县','太和县','阜阳市','安徽省','3','236600','0558','','','taihexian','THX','0');
INSERT INTO `tk_cities` VALUES('341225','341200','阜南县','安徽省-阜阳市-阜南县','阜南县','阜阳市','安徽省','3','236300','0558','','','funanxian','FNX','0');
INSERT INTO `tk_cities` VALUES('341226','341200','颍上县','安徽省-阜阳市-颍上县','颍上县','阜阳市','安徽省','3','236200','0558','','','shangxian','SX','0');
INSERT INTO `tk_cities` VALUES('341282','341200','界首市','安徽省-阜阳市-界首市','界首市','阜阳市','安徽省','3','236500','0558','','','jieshoushi','JSS','0');
INSERT INTO `tk_cities` VALUES('341302','341300','埇桥区','安徽省-宿州市-埇桥区','埇桥区','宿州市','安徽省','3','234000','0557','','','pai','P','0');
INSERT INTO `tk_cities` VALUES('341321','341300','砀山县','安徽省-宿州市-砀山县','砀山县','宿州市','安徽省','3','235300','0557','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('341322','341300','萧县','安徽省-宿州市-萧县','萧县','宿州市','安徽省','3','235200','0557','','','xiaoxian','XX','0');
INSERT INTO `tk_cities` VALUES('341323','341300','灵璧县','安徽省-宿州市-灵璧县','灵璧县','宿州市','安徽省','3','234200','0557','','','lingxian','LX','0');
INSERT INTO `tk_cities` VALUES('341324','341300','泗县','安徽省-宿州市-泗县','泗县','宿州市','安徽省','3','234300','0557','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('341502','341500','金安区','安徽省-六安市-金安区','金安区','六安市','安徽省','3','237000','0564','','','jinanqu','JAQ','0');
INSERT INTO `tk_cities` VALUES('341503','341500','裕安区','安徽省-六安市-裕安区','裕安区','六安市','安徽省','3','237000','0564','','','yuanqu','YAQ','0');
INSERT INTO `tk_cities` VALUES('341521','341500','寿县','安徽省-六安市-寿县','寿县','六安市','安徽省','3','232200','0564','','','shouxian','SX','0');
INSERT INTO `tk_cities` VALUES('341522','341500','霍邱县','安徽省-六安市-霍邱县','霍邱县','六安市','安徽省','3','237400','0564','','','huoqiuxian','HQX','0');
INSERT INTO `tk_cities` VALUES('341523','341500','舒城县','安徽省-六安市-舒城县','舒城县','六安市','安徽省','3','231300','0564','','','shuchengxian','SCX','0');
INSERT INTO `tk_cities` VALUES('341524','341500','金寨县','安徽省-六安市-金寨县','金寨县','六安市','安徽省','3','237300','0564','','','jinzhaixian','JZX','0');
INSERT INTO `tk_cities` VALUES('341525','341500','霍山县','安徽省-六安市-霍山县','霍山县','六安市','安徽省','3','237200','0564','','','huoshanxian','HSX','0');
INSERT INTO `tk_cities` VALUES('341602','341600','谯城区','安徽省-亳州市-谯城区','谯城区','亳州市','安徽省','3','236800','0558','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('341621','341600','涡阳县','安徽省-亳州市-涡阳县','涡阳县','亳州市','安徽省','3','233600','0558','','','woyangxian','WYX','0');
INSERT INTO `tk_cities` VALUES('341622','341600','蒙城县','安徽省-亳州市-蒙城县','蒙城县','亳州市','安徽省','3','233500','0558','','','mengchengxian','MCX','0');
INSERT INTO `tk_cities` VALUES('341623','341600','利辛县','安徽省-亳州市-利辛县','利辛县','亳州市','安徽省','3','236700','0558','','','lixinxian','LXX','0');
INSERT INTO `tk_cities` VALUES('341702','341700','贵池区','安徽省-池州市-贵池区','贵池区','池州市','安徽省','3','247100','0566','','','guichiqu','GCQ','0');
INSERT INTO `tk_cities` VALUES('341721','341700','东至县','安徽省-池州市-东至县','东至县','池州市','安徽省','3','247200','0566','','','dongzhixian','DZX','0');
INSERT INTO `tk_cities` VALUES('341722','341700','石台县','安徽省-池州市-石台县','石台县','池州市','安徽省','3','245100','0566','','','shitaixian','STX','0');
INSERT INTO `tk_cities` VALUES('341723','341700','青阳县','安徽省-池州市-青阳县','青阳县','池州市','安徽省','3','242800','0566','','','qingyangxian','QYX','0');
INSERT INTO `tk_cities` VALUES('341802','341800','宣州区','安徽省-宣城市-宣州区','宣州区','宣城市','安徽省','3','242000','0563','','','xuanzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('341821','341800','郎溪县','安徽省-宣城市-郎溪县','郎溪县','宣城市','安徽省','3','242100','0563','','','langxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('341822','341800','广德县','安徽省-宣城市-广德县','广德县','宣城市','安徽省','3','242200','0563','','','guangdexian','GDX','0');
INSERT INTO `tk_cities` VALUES('341823','341800','泾县','安徽省-宣城市-泾县','泾县','宣城市','安徽省','3','242500','0563','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('341824','341800','绩溪县','安徽省-宣城市-绩溪县','绩溪县','宣城市','安徽省','3','245300','0563','','','jixixian','JXX','0');
INSERT INTO `tk_cities` VALUES('341825','341800','旌德县','安徽省-宣城市-旌德县','旌德县','宣城市','安徽省','3','242600','0563','','','dexian','DX','0');
INSERT INTO `tk_cities` VALUES('341881','341800','宁国市','安徽省-宣城市-宁国市','宁国市','宣城市','安徽省','3','242300','0563','','','ningguoshi','NGS','0');
INSERT INTO `tk_cities` VALUES('350000','0','福建省','福建省','','','福建省','1','','','','','fujiansheng','FJS','0');
INSERT INTO `tk_cities` VALUES('350100','350000','福州市','福建省-福州市','','福州市','福建省','2','350000','0591','','','fuzhoushi','FZS','0');
INSERT INTO `tk_cities` VALUES('350200','350000','厦门市','福建省-厦门市','','厦门市','福建省','2','361000','0592','','','xiamenshi','XMS','0');
INSERT INTO `tk_cities` VALUES('350300','350000','莆田市','福建省-莆田市','','莆田市','福建省','2','351100','0594','','','putianshi','PTS','0');
INSERT INTO `tk_cities` VALUES('350400','350000','三明市','福建省-三明市','','三明市','福建省','2','365000','0598','','','sanmingshi','SMS','0');
INSERT INTO `tk_cities` VALUES('350500','350000','泉州市','福建省-泉州市','','泉州市','福建省','2','362000','0595','','','quanzhoushi','QZS','0');
INSERT INTO `tk_cities` VALUES('350600','350000','漳州市','福建省-漳州市','','漳州市','福建省','2','363000','0596','','','zhangzhoushi','ZZS','0');
INSERT INTO `tk_cities` VALUES('350700','350000','南平市','福建省-南平市','','南平市','福建省','2','353000','0599','','','nanpingshi','NPS','0');
INSERT INTO `tk_cities` VALUES('350800','350000','龙岩市','福建省-龙岩市','','龙岩市','福建省','2','364000','0597','','','longyanshi','LYS','0');
INSERT INTO `tk_cities` VALUES('350900','350000','宁德市','福建省-宁德市','','宁德市','福建省','2','352000','0595','','','ningdeshi','NDS','0');
INSERT INTO `tk_cities` VALUES('350102','350100','鼓楼区','福建省-福州市-鼓楼区','鼓楼区','福州市','福建省','3','350000','0591','','','gulouqu','GLQ','0');
INSERT INTO `tk_cities` VALUES('350103','350100','台江区','福建省-福州市-台江区','台江区','福州市','福建省','3','350000','0591','','','taijiangqu','TJQ','0');
INSERT INTO `tk_cities` VALUES('350104','350100','仓山区','福建省-福州市-仓山区','仓山区','福州市','福建省','3','350000','0591','','','cangshanqu','CSQ','0');
INSERT INTO `tk_cities` VALUES('350105','350100','马尾区','福建省-福州市-马尾区','马尾区','福州市','福建省','3','350000','0591','','','maweiqu','MWQ','0');
INSERT INTO `tk_cities` VALUES('350111','350100','晋安区','福建省-福州市-晋安区','晋安区','福州市','福建省','3','350000','0591','','','jinanqu','JAQ','0');
INSERT INTO `tk_cities` VALUES('350121','350100','闽侯县','福建省-福州市-闽侯县','闽侯县','福州市','福建省','3','350100','0591','','','minhouxian','MHX','0');
INSERT INTO `tk_cities` VALUES('350122','350100','连江县','福建省-福州市-连江县','连江县','福州市','福建省','3','350500','0591','','','lianjiangxian','LJX','0');
INSERT INTO `tk_cities` VALUES('350123','350100','罗源县','福建省-福州市-罗源县','罗源县','福州市','福建省','3','350600','0591','','','luoyuanxian','LYX','0');
INSERT INTO `tk_cities` VALUES('350124','350100','闽清县','福建省-福州市-闽清县','闽清县','福州市','福建省','3','350800','0591','','','minqingxian','MQX','0');
INSERT INTO `tk_cities` VALUES('350125','350100','永泰县','福建省-福州市-永泰县','永泰县','福州市','福建省','3','350700','0591','','','yongtaixian','YTX','0');
INSERT INTO `tk_cities` VALUES('350128','350100','平潭县','福建省-福州市-平潭县','平潭县','福州市','福建省','3','350400','0591','','','pingtanxian','PTX','0');
INSERT INTO `tk_cities` VALUES('350181','350100','福清市','福建省-福州市-福清市','福清市','福州市','福建省','3','350300','0591','','','fuqingshi','FQS','0');
INSERT INTO `tk_cities` VALUES('350182','350100','长乐市','福建省-福州市-长乐市','长乐市','福州市','福建省','3','350200','0591','','','changleshi','CLS','0');
INSERT INTO `tk_cities` VALUES('350203','350200','思明区','福建省-厦门市-思明区','思明区','厦门市','福建省','3','361000','0592','','','simingqu','SMQ','0');
INSERT INTO `tk_cities` VALUES('350205','350200','海沧区','福建省-厦门市-海沧区','海沧区','厦门市','福建省','3','361000','0592','','','haicangqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('350206','350200','湖里区','福建省-厦门市-湖里区','湖里区','厦门市','福建省','3','361000','0592','','','huliqu','HLQ','0');
INSERT INTO `tk_cities` VALUES('350211','350200','集美区','福建省-厦门市-集美区','集美区','厦门市','福建省','3','361000','0592','','','jimeiqu','JMQ','0');
INSERT INTO `tk_cities` VALUES('350212','350200','同安区','福建省-厦门市-同安区','同安区','厦门市','福建省','3','361100','0592','','','tonganqu','TAQ','0');
INSERT INTO `tk_cities` VALUES('350213','350200','翔安区','福建省-厦门市-翔安区','翔安区','厦门市','福建省','3','361100','0592','','','xianganqu','XAQ','0');
INSERT INTO `tk_cities` VALUES('350302','350300','城厢区','福建省-莆田市-城厢区','城厢区','莆田市','福建省','3','351100','0594','','','chengxiangqu','CXQ','0');
INSERT INTO `tk_cities` VALUES('350303','350300','涵江区','福建省-莆田市-涵江区','涵江区','莆田市','福建省','3','351100','0594','','','hanjiangqu','HJQ','0');
INSERT INTO `tk_cities` VALUES('350304','350300','荔城区','福建省-莆田市-荔城区','荔城区','莆田市','福建省','3','351100','0594','','','lichengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('350305','350300','秀屿区','福建省-莆田市-秀屿区','秀屿区','莆田市','福建省','3','351100','0594','','','xiuyuqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('350322','350300','仙游县','福建省-莆田市-仙游县','仙游县','莆田市','福建省','3','351200','0594','','','xianyouxian','XYX','0');
INSERT INTO `tk_cities` VALUES('350402','350400','梅列区','福建省-三明市-梅列区','梅列区','三明市','福建省','3','365000','0598','','','meiliequ','MLQ','0');
INSERT INTO `tk_cities` VALUES('350403','350400','三元区','福建省-三明市-三元区','三元区','三明市','福建省','3','365000','0598','','','sanyuanqu','SYQ','0');
INSERT INTO `tk_cities` VALUES('350421','350400','明溪县','福建省-三明市-明溪县','明溪县','三明市','福建省','3','365300','0598','','','mingxixian','MXX','0');
INSERT INTO `tk_cities` VALUES('350423','350400','清流县','福建省-三明市-清流县','清流县','三明市','福建省','3','365300','0598','','','qingliuxian','QLX','0');
INSERT INTO `tk_cities` VALUES('350424','350400','宁化县','福建省-三明市-宁化县','宁化县','三明市','福建省','3','365400','0598','','','ninghuaxian','NHX','0');
INSERT INTO `tk_cities` VALUES('350425','350400','大田县','福建省-三明市-大田县','大田县','三明市','福建省','3','366100','0598','','','datianxian','DTX','0');
INSERT INTO `tk_cities` VALUES('350426','350400','尤溪县','福建省-三明市-尤溪县','尤溪县','三明市','福建省','3','365100','0598','','','youxixian','YXX','0');
INSERT INTO `tk_cities` VALUES('350427','350400','沙县','福建省-三明市-沙县','沙县','三明市','福建省','3','365500','0598','','','shaxian','SX','0');
INSERT INTO `tk_cities` VALUES('350428','350400','将乐县','福建省-三明市-将乐县','将乐县','三明市','福建省','3','353300','0598','','','jianglexian','JLX','0');
INSERT INTO `tk_cities` VALUES('350429','350400','泰宁县','福建省-三明市-泰宁县','泰宁县','三明市','福建省','3','354400','0598','','','tainingxian','TNX','0');
INSERT INTO `tk_cities` VALUES('350430','350400','建宁县','福建省-三明市-建宁县','建宁县','三明市','福建省','3','354500','0598','','','jianningxian','JNX','0');
INSERT INTO `tk_cities` VALUES('350481','350400','永安市','福建省-三明市-永安市','永安市','三明市','福建省','3','366000','0598','','','yonganshi','YAS','0');
INSERT INTO `tk_cities` VALUES('350502','350500','鲤城区','福建省-泉州市-鲤城区','鲤城区','泉州市','福建省','3','362000','0595','','','lichengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('350503','350500','丰泽区','福建省-泉州市-丰泽区','丰泽区','泉州市','福建省','3','362000','0595','','','fengzequ','FZQ','0');
INSERT INTO `tk_cities` VALUES('350504','350500','洛江区','福建省-泉州市-洛江区','洛江区','泉州市','福建省','3','362000','0595','','','luojiangqu','LJQ','0');
INSERT INTO `tk_cities` VALUES('350505','350500','泉港区','福建省-泉州市-泉港区','泉港区','泉州市','福建省','3','362100','0595','','','quangangqu','QGQ','0');
INSERT INTO `tk_cities` VALUES('350521','350500','惠安县','福建省-泉州市-惠安县','惠安县','泉州市','福建省','3','362100','0595','','','huianxian','HAX','0');
INSERT INTO `tk_cities` VALUES('350524','350500','安溪县','福建省-泉州市-安溪县','安溪县','泉州市','福建省','3','362400','0595','','','anxixian','AXX','0');
INSERT INTO `tk_cities` VALUES('350525','350500','永春县','福建省-泉州市-永春县','永春县','泉州市','福建省','3','362600','0595','','','yongchunxian','YCX','0');
INSERT INTO `tk_cities` VALUES('350526','350500','德化县','福建省-泉州市-德化县','德化县','泉州市','福建省','3','362500','0595','','','dehuaxian','DHX','0');
INSERT INTO `tk_cities` VALUES('350527','350500','金门县','福建省-泉州市-金门县','金门县','泉州市','福建省','3','362000','0595','','','jinmenxian','JMX','0');
INSERT INTO `tk_cities` VALUES('350581','350500','石狮市','福建省-泉州市-石狮市','石狮市','泉州市','福建省','3','362700','0595','','','shishishi','SSS','0');
INSERT INTO `tk_cities` VALUES('350582','350500','晋江市','福建省-泉州市-晋江市','晋江市','泉州市','福建省','3','362200','0595','','','jinjiangshi','JJS','0');
INSERT INTO `tk_cities` VALUES('350583','350500','南安市','福建省-泉州市-南安市','南安市','泉州市','福建省','3','362300','0595','','','nananshi','NAS','0');
INSERT INTO `tk_cities` VALUES('350602','350600','芗城区','福建省-漳州市-芗城区','芗城区','漳州市','福建省','3','363000','0596','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('350603','350600','龙文区','福建省-漳州市-龙文区','龙文区','漳州市','福建省','3','363000','0596','','','longwenqu','LWQ','0');
INSERT INTO `tk_cities` VALUES('350622','350600','云霄县','福建省-漳州市-云霄县','云霄县','漳州市','福建省','3','363300','0596','','','yunxiaoxian','YXX','0');
INSERT INTO `tk_cities` VALUES('350623','350600','漳浦县','福建省-漳州市-漳浦县','漳浦县','漳州市','福建省','3','363200','0596','','','zhangpuxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('350624','350600','诏安县','福建省-漳州市-诏安县','诏安县','漳州市','福建省','3','363500','0596','','','anxian','AX','0');
INSERT INTO `tk_cities` VALUES('350625','350600','长泰县','福建省-漳州市-长泰县','长泰县','漳州市','福建省','3','363900','0596','','','changtaixian','CTX','0');
INSERT INTO `tk_cities` VALUES('350626','350600','东山县','福建省-漳州市-东山县','东山县','漳州市','福建省','3','363400','0596','','','dongshanxian','DSX','0');
INSERT INTO `tk_cities` VALUES('350627','350600','南靖县','福建省-漳州市-南靖县','南靖县','漳州市','福建省','3','363600','0596','','','nanjingxian','NJX','0');
INSERT INTO `tk_cities` VALUES('350628','350600','平和县','福建省-漳州市-平和县','平和县','漳州市','福建省','3','363700','0596','','','pinghexian','PHX','0');
INSERT INTO `tk_cities` VALUES('350629','350600','华安县','福建省-漳州市-华安县','华安县','漳州市','福建省','3','363800','0596','','','huaanxian','HAX','0');
INSERT INTO `tk_cities` VALUES('350681','350600','龙海市','福建省-漳州市-龙海市','龙海市','漳州市','福建省','3','363100','0596','','','longhaishi','LHS','0');
INSERT INTO `tk_cities` VALUES('350702','350700','延平区','福建省-南平市-延平区','延平区','南平市','福建省','3','353000','0599','','','yanpingqu','YPQ','0');
INSERT INTO `tk_cities` VALUES('350721','350700','顺昌县','福建省-南平市-顺昌县','顺昌县','南平市','福建省','3','353200','0599','','','shunchangxian','SCX','0');
INSERT INTO `tk_cities` VALUES('350722','350700','浦城县','福建省-南平市-浦城县','浦城县','南平市','福建省','3','353400','0599','','','puchengxian','PCX','0');
INSERT INTO `tk_cities` VALUES('350723','350700','光泽县','福建省-南平市-光泽县','光泽县','南平市','福建省','3','354100','0599','','','guangzexian','GZX','0');
INSERT INTO `tk_cities` VALUES('350724','350700','松溪县','福建省-南平市-松溪县','松溪县','南平市','福建省','3','353500','0599','','','songxixian','SXX','0');
INSERT INTO `tk_cities` VALUES('350725','350700','政和县','福建省-南平市-政和县','政和县','南平市','福建省','3','353600','0599','','','zhenghexian','ZHX','0');
INSERT INTO `tk_cities` VALUES('350781','350700','邵武市','福建省-南平市-邵武市','邵武市','南平市','福建省','3','354000','0599','','','shaowushi','SWS','0');
INSERT INTO `tk_cities` VALUES('350782','350700','武夷山市','福建省-南平市-武夷山市','武夷山市','南平市','福建省','3','354300','0599','','','wuyishanshi','WYSS','0');
INSERT INTO `tk_cities` VALUES('350783','350700','建瓯市','福建省-南平市-建瓯市','建瓯市','南平市','福建省','3','353100','0599','','','jianshi','JS','0');
INSERT INTO `tk_cities` VALUES('350784','350700','建阳市','福建省-南平市-建阳市','建阳市','南平市','福建省','3','354200','0599','','','jianyangshi','JYS','0');
INSERT INTO `tk_cities` VALUES('350802','350800','新罗区','福建省-龙岩市-新罗区','新罗区','龙岩市','福建省','3','364000','0597','','','xinluoqu','XLQ','0');
INSERT INTO `tk_cities` VALUES('350821','350800','长汀县','福建省-龙岩市-长汀县','长汀县','龙岩市','福建省','3','366300','0597','','','changtingxian','CTX','0');
INSERT INTO `tk_cities` VALUES('350822','350800','永定县','福建省-龙岩市-永定县','永定县','龙岩市','福建省','3','364100','0597','','','yongdingxian','YDX','0');
INSERT INTO `tk_cities` VALUES('350823','350800','上杭县','福建省-龙岩市-上杭县','上杭县','龙岩市','福建省','3','364200','0597','','','shanghangxian','SHX','0');
INSERT INTO `tk_cities` VALUES('350824','350800','武平县','福建省-龙岩市-武平县','武平县','龙岩市','福建省','3','364300','0597','','','wupingxian','WPX','0');
INSERT INTO `tk_cities` VALUES('350825','350800','连城县','福建省-龙岩市-连城县','连城县','龙岩市','福建省','3','366200','0597','','','lianchengxian','LCX','0');
INSERT INTO `tk_cities` VALUES('350881','350800','漳平市','福建省-龙岩市-漳平市','漳平市','龙岩市','福建省','3','364400','0597','','','zhangpingshi','ZPS','0');
INSERT INTO `tk_cities` VALUES('350902','350900','蕉城区','福建省-宁德市-蕉城区','蕉城区','宁德市','福建省','3','352000','0593','','','jiaochengqu','JCQ','0');
INSERT INTO `tk_cities` VALUES('350921','350900','霞浦县','福建省-宁德市-霞浦县','霞浦县','宁德市','福建省','3','355100','0593','','','xiapuxian','XPX','0');
INSERT INTO `tk_cities` VALUES('350922','350900','古田县','福建省-宁德市-古田县','古田县','宁德市','福建省','3','352200','0593','','','gutianxian','GTX','0');
INSERT INTO `tk_cities` VALUES('350923','350900','屏南县','福建省-宁德市-屏南县','屏南县','宁德市','福建省','3','352300','0593','','','pingnanxian','PNX','0');
INSERT INTO `tk_cities` VALUES('350924','350900','寿宁县','福建省-宁德市-寿宁县','寿宁县','宁德市','福建省','3','355500','0593','','','shouningxian','SNX','0');
INSERT INTO `tk_cities` VALUES('350925','350900','周宁县','福建省-宁德市-周宁县','周宁县','宁德市','福建省','3','355400','0593','','','zhouningxian','ZNX','0');
INSERT INTO `tk_cities` VALUES('350926','350900','柘荣县','福建省-宁德市-柘荣县','柘荣县','宁德市','福建省','3','355300','0593','','','rongxian','RX','0');
INSERT INTO `tk_cities` VALUES('350981','350900','福安市','福建省-宁德市-福安市','福安市','宁德市','福建省','3','355000','0593','','','fuanshi','FAS','0');
INSERT INTO `tk_cities` VALUES('350982','350900','福鼎市','福建省-宁德市-福鼎市','福鼎市','宁德市','福建省','3','355200','0593','','','fudingshi','FDS','0');
INSERT INTO `tk_cities` VALUES('360000','0','江西省','江西省','','','江西省','1','','','','','jiangxisheng','JXS','0');
INSERT INTO `tk_cities` VALUES('360100','360000','南昌市','江西省-南昌市','','南昌市','江西省','2','330000','0791','','','nanchangshi','NCS','0');
INSERT INTO `tk_cities` VALUES('360200','360000','景德镇市','江西省-景德镇市','','景德镇市','江西省','2','333000','0798','','','jingdezhenshi','JDZS','0');
INSERT INTO `tk_cities` VALUES('360300','360000','萍乡市','江西省-萍乡市','','萍乡市','江西省','2','337000','0799','','','pingxiangshi','PXS','0');
INSERT INTO `tk_cities` VALUES('360400','360000','九江市','江西省-九江市','','九江市','江西省','2','332000','0792','','','jiujiangshi','JJS','0');
INSERT INTO `tk_cities` VALUES('360500','360000','新余市','江西省-新余市','','新余市','江西省','2','336500','0790','','','xinyushi','XYS','0');
INSERT INTO `tk_cities` VALUES('360600','360000','鹰潭市','江西省-鹰潭市','','鹰潭市','江西省','2','335000','0701','','','yingtanshi','YTS','0');
INSERT INTO `tk_cities` VALUES('360700','360000','赣州市','江西省-赣州市','','赣州市','江西省','2','341000','0797','','','ganzhoushi','GZS','0');
INSERT INTO `tk_cities` VALUES('360800','360000','吉安市','江西省-吉安市','','吉安市','江西省','2','343000','0796','','','jianshi','JAS','0');
INSERT INTO `tk_cities` VALUES('360900','360000','宜春市','江西省-宜春市','','宜春市','江西省','2','336000','0795','','','yichunshi','YCS','0');
INSERT INTO `tk_cities` VALUES('361000','360000','抚州市','江西省-抚州市','','抚州市','江西省','2','344000','0794','','','fuzhoushi','FZS','0');
INSERT INTO `tk_cities` VALUES('361100','360000','上饶市','江西省-上饶市','','上饶市','江西省','2','334000','0793','','','shangraoshi','SRS','0');
INSERT INTO `tk_cities` VALUES('360102','360100','东湖区','江西省-南昌市-东湖区','东湖区','南昌市','江西省','3','330000','0791','','','donghuqu','DHQ','0');
INSERT INTO `tk_cities` VALUES('360103','360100','西湖区','江西省-南昌市-西湖区','西湖区','南昌市','江西省','3','330000','0791','','','xihuqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('360104','360100','青云谱区','江西省-南昌市-青云谱区','青云谱区','南昌市','江西省','3','330000','0791','','','qingyunpuqu','QYPQ','0');
INSERT INTO `tk_cities` VALUES('360105','360100','湾里区','江西省-南昌市-湾里区','湾里区','南昌市','江西省','3','330000','0791','','','wanliqu','WLQ','0');
INSERT INTO `tk_cities` VALUES('360111','360100','青山湖区','江西省-南昌市-青山湖区','青山湖区','南昌市','江西省','3','330000','0791','','','qingshanhuqu','QSHQ','0');
INSERT INTO `tk_cities` VALUES('360121','360100','南昌县','江西省-南昌市-南昌县','南昌县','南昌市','江西省','3','330200','0791','','','nanchangxian','NCX','0');
INSERT INTO `tk_cities` VALUES('360122','360100','新建县','江西省-南昌市-新建县','新建县','南昌市','江西省','3','330100','0791','','','xinjianxian','XJX','0');
INSERT INTO `tk_cities` VALUES('360123','360100','安义县','江西省-南昌市-安义县','安义县','南昌市','江西省','3','330500','0791','','','anyixian','AYX','0');
INSERT INTO `tk_cities` VALUES('360124','360100','进贤县','江西省-南昌市-进贤县','进贤县','南昌市','江西省','3','331700','0791','','','jinxianxian','JXX','0');
INSERT INTO `tk_cities` VALUES('360202','360200','昌江区','江西省-景德镇市-昌江区','昌江区','景德镇市','江西省','3','333000','0798','','','changjiangqu','CJQ','0');
INSERT INTO `tk_cities` VALUES('360203','360200','珠山区','江西省-景德镇市-珠山区','珠山区','景德镇市','江西省','3','333000','0798','','','zhushanqu','ZSQ','0');
INSERT INTO `tk_cities` VALUES('360222','360200','浮梁县','江西省-景德镇市-浮梁县','浮梁县','景德镇市','江西省','3','333400','0798','','','fuliangxian','FLX','0');
INSERT INTO `tk_cities` VALUES('360281','360200','乐平市','江西省-景德镇市-乐平市','乐平市','景德镇市','江西省','3','333300','0798','','','lepingshi','LPS','0');
INSERT INTO `tk_cities` VALUES('360302','360300','安源区','江西省-萍乡市-安源区','安源区','萍乡市','江西省','3','337000','0799','','','anyuanqu','AYQ','0');
INSERT INTO `tk_cities` VALUES('360313','360300','湘东区','江西省-萍乡市-湘东区','湘东区','萍乡市','江西省','3','337000','0799','','','xiangdongqu','XDQ','0');
INSERT INTO `tk_cities` VALUES('360321','360300','莲花县','江西省-萍乡市-莲花县','莲花县','萍乡市','江西省','3','337100','0799','','','lianhuaxian','LHX','0');
INSERT INTO `tk_cities` VALUES('360322','360300','上栗县','江西省-萍乡市-上栗县','上栗县','萍乡市','江西省','3','337000','0799','','','shanglixian','SLX','0');
INSERT INTO `tk_cities` VALUES('360323','360300','芦溪县','江西省-萍乡市-芦溪县','芦溪县','萍乡市','江西省','3','337000','0799','','','luxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('360402','360400','庐山区','江西省-九江市-庐山区','庐山区','九江市','江西省','3','332900','0792','','','lushanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('360403','360400','浔阳区','江西省-九江市-浔阳区','浔阳区','九江市','江西省','3','332000','0792','','','yangqu','YQ','0');
INSERT INTO `tk_cities` VALUES('360421','360400','九江县','江西省-九江市-九江县','九江县','九江市','江西省','3','332100','0792','','','jiujiangxian','JJX','0');
INSERT INTO `tk_cities` VALUES('360423','360400','武宁县','江西省-九江市-武宁县','武宁县','九江市','江西省','3','332300','0792','','','wuningxian','WNX','0');
INSERT INTO `tk_cities` VALUES('360424','360400','修水县','江西省-九江市-修水县','修水县','九江市','江西省','3','332400','0792','','','xiushuixian','XSX','0');
INSERT INTO `tk_cities` VALUES('360425','360400','永修县','江西省-九江市-永修县','永修县','九江市','江西省','3','330300','0792','','','yongxiuxian','YXX','0');
INSERT INTO `tk_cities` VALUES('360426','360400','德安县','江西省-九江市-德安县','德安县','九江市','江西省','3','330400','0792','','','deanxian','DAX','0');
INSERT INTO `tk_cities` VALUES('360427','360400','星子县','江西省-九江市-星子县','星子县','九江市','江西省','3','332800','0792','','','xingzixian','XZX','0');
INSERT INTO `tk_cities` VALUES('360428','360400','都昌县','江西省-九江市-都昌县','都昌县','九江市','江西省','3','332600','0792','','','duchangxian','DCX','0');
INSERT INTO `tk_cities` VALUES('360429','360400','湖口县','江西省-九江市-湖口县','湖口县','九江市','江西省','3','332500','0792','','','hukouxian','HKX','0');
INSERT INTO `tk_cities` VALUES('360430','360400','彭泽县','江西省-九江市-彭泽县','彭泽县','九江市','江西省','3','332700','0792','','','pengzexian','PZX','0');
INSERT INTO `tk_cities` VALUES('360481','360400','瑞昌市','江西省-九江市-瑞昌市','瑞昌市','九江市','江西省','3','332200','0792','','','ruichangshi','RCS','0');
INSERT INTO `tk_cities` VALUES('360482','','共青城市','江西省-九江市-共青城市','共青城市','九江市','江西省','3','','','','','gongqingchengshi','GQCS','0');
INSERT INTO `tk_cities` VALUES('360502','360500','渝水区','江西省-新余市-渝水区','渝水区','新余市','江西省','3','336500','0790','','','yushuiqu','YSQ','0');
INSERT INTO `tk_cities` VALUES('360521','360500','分宜县','江西省-新余市-分宜县','分宜县','新余市','江西省','3','336600','0790','','','fenyixian','FYX','0');
INSERT INTO `tk_cities` VALUES('360602','360600','月湖区','江西省-鹰潭市-月湖区','月湖区','鹰潭市','江西省','3','335000','0701','','','yuehuqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('360622','360600','余江县','江西省-鹰潭市-余江县','余江县','鹰潭市','江西省','3','335200','0701','','','yujiangxian','YJX','0');
INSERT INTO `tk_cities` VALUES('360681','360600','贵溪市','江西省-鹰潭市-贵溪市','贵溪市','鹰潭市','江西省','3','335400','0701','','','guixishi','GXS','0');
INSERT INTO `tk_cities` VALUES('360702','360700','章贡区','江西省-赣州市-章贡区','章贡区','赣州市','江西省','3','341000','0797','','','zhanggongqu','ZGQ','0');
INSERT INTO `tk_cities` VALUES('360721','360700','赣县','江西省-赣州市-赣县','赣县','赣州市','江西省','3','341100','0797','','','ganxian','GX','0');
INSERT INTO `tk_cities` VALUES('360722','360700','信丰县','江西省-赣州市-信丰县','信丰县','赣州市','江西省','3','341600','0797','','','xinfengxian','XFX','0');
INSERT INTO `tk_cities` VALUES('360723','360700','大余县','江西省-赣州市-大余县','大余县','赣州市','江西省','3','341500','0797','','','dayuxian','DYX','0');
INSERT INTO `tk_cities` VALUES('360724','360700','上犹县','江西省-赣州市-上犹县','上犹县','赣州市','江西省','3','341200','0797','','','shangyouxian','SYX','0');
INSERT INTO `tk_cities` VALUES('360725','360700','崇义县','江西省-赣州市-崇义县','崇义县','赣州市','江西省','3','341300','0797','','','chongyixian','CYX','0');
INSERT INTO `tk_cities` VALUES('360726','360700','安远县','江西省-赣州市-安远县','安远县','赣州市','江西省','3','342100','0797','','','anyuanxian','AYX','0');
INSERT INTO `tk_cities` VALUES('360727','360700','龙南县','江西省-赣州市-龙南县','龙南县','赣州市','江西省','3','341700','0797','','','longnanxian','LNX','0');
INSERT INTO `tk_cities` VALUES('360728','360700','定南县','江西省-赣州市-定南县','定南县','赣州市','江西省','3','341900','0797','','','dingnanxian','DNX','0');
INSERT INTO `tk_cities` VALUES('360729','360700','全南县','江西省-赣州市-全南县','全南县','赣州市','江西省','3','341800','0797','','','quannanxian','QNX','0');
INSERT INTO `tk_cities` VALUES('360730','360700','宁都县','江西省-赣州市-宁都县','宁都县','赣州市','江西省','3','342800','0797','','','ningduxian','NDX','0');
INSERT INTO `tk_cities` VALUES('360731','360700','于都县','江西省-赣州市-于都县','于都县','赣州市','江西省','3','342300','0797','','','yuduxian','YDX','0');
INSERT INTO `tk_cities` VALUES('360732','360700','兴国县','江西省-赣州市-兴国县','兴国县','赣州市','江西省','3','342400','0797','','','xingguoxian','XGX','0');
INSERT INTO `tk_cities` VALUES('360733','360700','会昌县','江西省-赣州市-会昌县','会昌县','赣州市','江西省','3','342600','0797','','','huichangxian','HCX','0');
INSERT INTO `tk_cities` VALUES('360734','360700','寻乌县','江西省-赣州市-寻乌县','寻乌县','赣州市','江西省','3','342200','0797','','','xunwuxian','XWX','0');
INSERT INTO `tk_cities` VALUES('360735','360700','石城县','江西省-赣州市-石城县','石城县','赣州市','江西省','3','342700','0797','','','shichengxian','SCX','0');
INSERT INTO `tk_cities` VALUES('360781','360700','瑞金市','江西省-赣州市-瑞金市','瑞金市','赣州市','江西省','3','342500','0797','','','ruijinshi','RJS','0');
INSERT INTO `tk_cities` VALUES('360782','360700','南康市','江西省-赣州市-南康市','南康市','赣州市','江西省','3','341400','0797','','','nankangshi','NKS','0');
INSERT INTO `tk_cities` VALUES('360802','360800','吉州区','江西省-吉安市-吉州区','吉州区','吉安市','江西省','3','343000','0796','','','jizhouqu','JZQ','0');
INSERT INTO `tk_cities` VALUES('360803','360800','青原区','江西省-吉安市-青原区','青原区','吉安市','江西省','3','343000','0796','','','qingyuanqu','QYQ','0');
INSERT INTO `tk_cities` VALUES('360821','360800','吉安县','江西省-吉安市-吉安县','吉安县','吉安市','江西省','3','343100','0796','','','jianxian','JAX','0');
INSERT INTO `tk_cities` VALUES('360822','360800','吉水县','江西省-吉安市-吉水县','吉水县','吉安市','江西省','3','331600','0796','','','jishuixian','JSX','0');
INSERT INTO `tk_cities` VALUES('360823','360800','峡江县','江西省-吉安市-峡江县','峡江县','吉安市','江西省','3','331400','0796','','','xiajiangxian','XJX','0');
INSERT INTO `tk_cities` VALUES('360824','360800','新干县','江西省-吉安市-新干县','新干县','吉安市','江西省','3','331300','0796','','','xinganxian','XGX','0');
INSERT INTO `tk_cities` VALUES('360825','360800','永丰县','江西省-吉安市-永丰县','永丰县','吉安市','江西省','3','331500','0796','','','yongfengxian','YFX','0');
INSERT INTO `tk_cities` VALUES('360826','360800','泰和县','江西省-吉安市-泰和县','泰和县','吉安市','江西省','3','343700','0796','','','taihexian','THX','0');
INSERT INTO `tk_cities` VALUES('360827','360800','遂川县','江西省-吉安市-遂川县','遂川县','吉安市','江西省','3','343900','0796','','','suichuanxian','SCX','0');
INSERT INTO `tk_cities` VALUES('360828','360800','万安县','江西省-吉安市-万安县','万安县','吉安市','江西省','3','343800','0796','','','wananxian','WAX','0');
INSERT INTO `tk_cities` VALUES('360829','360800','安福县','江西省-吉安市-安福县','安福县','吉安市','江西省','3','343200','0796','','','anfuxian','AFX','0');
INSERT INTO `tk_cities` VALUES('360830','360800','永新县','江西省-吉安市-永新县','永新县','吉安市','江西省','3','343400','0796','','','yongxinxian','YXX','0');
INSERT INTO `tk_cities` VALUES('360881','360800','井冈山市','江西省-吉安市-井冈山市','井冈山市','吉安市','江西省','3','343600','0796','','','jinggangshanshi','JGSS','0');
INSERT INTO `tk_cities` VALUES('360902','360900','袁州区','江西省-宜春市-袁州区','袁州区','宜春市','江西省','3','336000','0795','','','yuanzhouqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('360921','360900','奉新县','江西省-宜春市-奉新县','奉新县','宜春市','江西省','3','330700','0795','','','fengxinxian','FXX','0');
INSERT INTO `tk_cities` VALUES('360922','360900','万载县','江西省-宜春市-万载县','万载县','宜春市','江西省','3','336100','0795','','','wanzaixian','WZX','0');
INSERT INTO `tk_cities` VALUES('360923','360900','上高县','江西省-宜春市-上高县','上高县','宜春市','江西省','3','336400','0795','','','shanggaoxian','SGX','0');
INSERT INTO `tk_cities` VALUES('360924','360900','宜丰县','江西省-宜春市-宜丰县','宜丰县','宜春市','江西省','3','336300','0795','','','yifengxian','YFX','0');
INSERT INTO `tk_cities` VALUES('360925','360900','靖安县','江西省-宜春市-靖安县','靖安县','宜春市','江西省','3','330600','0795','','','jinganxian','JAX','0');
INSERT INTO `tk_cities` VALUES('360926','360900','铜鼓县','江西省-宜春市-铜鼓县','铜鼓县','宜春市','江西省','3','336200','0795','','','tongguxian','TGX','0');
INSERT INTO `tk_cities` VALUES('360981','360900','丰城市','江西省-宜春市-丰城市','丰城市','宜春市','江西省','3','331100','0795','','','fengchengshi','FCS','0');
INSERT INTO `tk_cities` VALUES('360982','360900','樟树市','江西省-宜春市-樟树市','樟树市','宜春市','江西省','3','331200','0795','','','zhangshushi','ZSS','0');
INSERT INTO `tk_cities` VALUES('360983','360900','高安市','江西省-宜春市-高安市','高安市','宜春市','江西省','3','330800','0795','','','gaoanshi','GAS','0');
INSERT INTO `tk_cities` VALUES('361002','361000','临川区','江西省-抚州市-临川区','临川区','抚州市','江西省','3','344100','0794','','','linchuanqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('361021','361000','南城县','江西省-抚州市-南城县','南城县','抚州市','江西省','3','344700','0794','','','nanchengxian','NCX','0');
INSERT INTO `tk_cities` VALUES('361022','361000','黎川县','江西省-抚州市-黎川县','黎川县','抚州市','江西省','3','344600','0794','','','lichuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('361023','361000','南丰县','江西省-抚州市-南丰县','南丰县','抚州市','江西省','3','344500','0794','','','nanfengxian','NFX','0');
INSERT INTO `tk_cities` VALUES('361024','361000','崇仁县','江西省-抚州市-崇仁县','崇仁县','抚州市','江西省','3','344200','0794','','','chongrenxian','CRX','0');
INSERT INTO `tk_cities` VALUES('361025','361000','乐安县','江西省-抚州市-乐安县','乐安县','抚州市','江西省','3','344300','0794','','','leanxian','LAX','0');
INSERT INTO `tk_cities` VALUES('361026','361000','宜黄县','江西省-抚州市-宜黄县','宜黄县','抚州市','江西省','3','344400','0794','','','yihuangxian','YHX','0');
INSERT INTO `tk_cities` VALUES('361027','361000','金溪县','江西省-抚州市-金溪县','金溪县','抚州市','江西省','3','344800','0794','','','jinxixian','JXX','0');
INSERT INTO `tk_cities` VALUES('361028','361000','资溪县','江西省-抚州市-资溪县','资溪县','抚州市','江西省','3','335300','0794','','','zixixian','ZXX','0');
INSERT INTO `tk_cities` VALUES('361029','361000','东乡县','江西省-抚州市-东乡县','东乡县','抚州市','江西省','3','331800','0794','','','dongxiangxian','DXX','0');
INSERT INTO `tk_cities` VALUES('361030','361000','广昌县','江西省-抚州市-广昌县','广昌县','抚州市','江西省','3','344900','0794','','','guangchangxian','GCX','0');
INSERT INTO `tk_cities` VALUES('361102','361100','信州区','江西省-上饶市-信州区','信州区','上饶市','江西省','3','334000','0793','','','xinzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('361121','361100','上饶县','江西省-上饶市-上饶县','上饶县','上饶市','江西省','3','334100','0793','','','shangraoxian','SRX','0');
INSERT INTO `tk_cities` VALUES('361122','361100','广丰县','江西省-上饶市-广丰县','广丰县','上饶市','江西省','3','334600','0793','','','guangfengxian','GFX','0');
INSERT INTO `tk_cities` VALUES('361123','361100','玉山县','江西省-上饶市-玉山县','玉山县','上饶市','江西省','3','334700','0793','','','yushanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('361124','361100','铅山县','江西省-上饶市-铅山县','铅山县','上饶市','江西省','3','334500','0793','','','qianshanxian','QSX','0');
INSERT INTO `tk_cities` VALUES('361125','361100','横峰县','江西省-上饶市-横峰县','横峰县','上饶市','江西省','3','334300','0793','','','hengfengxian','HFX','0');
INSERT INTO `tk_cities` VALUES('361126','361100','弋阳县','江西省-上饶市-弋阳县','弋阳县','上饶市','江西省','3','334400','0793','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('361127','361100','余干县','江西省-上饶市-余干县','余干县','上饶市','江西省','3','335100','0793','','','yuganxian','YGX','0');
INSERT INTO `tk_cities` VALUES('361128','361100','鄱阳县','江西省-上饶市-鄱阳县','鄱阳县','上饶市','江西省','3','333100','0793','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('361129','361100','万年县','江西省-上饶市-万年县','万年县','上饶市','江西省','3','335500','0793','','','wannianxian','WNX','0');
INSERT INTO `tk_cities` VALUES('361130','361100','婺源县','江西省-上饶市-婺源县','婺源县','上饶市','江西省','3','333200','0793','','','yuanxian','YX','0');
INSERT INTO `tk_cities` VALUES('361181','361100','德兴市','江西省-上饶市-德兴市','德兴市','上饶市','江西省','3','334200','0793','','','dexingshi','DXS','0');
INSERT INTO `tk_cities` VALUES('370000','0','山东省','山东省','','','山东省','1','','','','','shandongsheng','SDS','0');
INSERT INTO `tk_cities` VALUES('370100','370000','济南市','山东省-济南市','','济南市','山东省','2','250000','0531','','','jinanshi','JNS','0');
INSERT INTO `tk_cities` VALUES('370200','370000','青岛市','山东省-青岛市','','青岛市','山东省','2','266000','0532','','','qingdaoshi','QDS','0');
INSERT INTO `tk_cities` VALUES('370300','370000','淄博市','山东省-淄博市','','淄博市','山东省','2','255100','0533','','','ziboshi','ZBS','0');
INSERT INTO `tk_cities` VALUES('370400','370000','枣庄市','山东省-枣庄市','','枣庄市','山东省','2','277000','0632','','','zaozhuangshi','ZZS','0');
INSERT INTO `tk_cities` VALUES('370500','370000','东营市','山东省-东营市','','东营市','山东省','2','257000','0546','','','dongyingshi','DYS','0');
INSERT INTO `tk_cities` VALUES('370600','370000','烟台市','山东省-烟台市','','烟台市','山东省','2','264000','0535','','','yantaishi','YTS','0');
INSERT INTO `tk_cities` VALUES('370700','370000','潍坊市','山东省-潍坊市','','潍坊市','山东省','2','261000','0536','','','weifangshi','WFS','0');
INSERT INTO `tk_cities` VALUES('370800','370000','济宁市','山东省-济宁市','','济宁市','山东省','2','272000','0537','','','jiningshi','JNS','0');
INSERT INTO `tk_cities` VALUES('370900','370000','泰安市','山东省-泰安市','','泰安市','山东省','2','271000','0538','','','taianshi','TAS','0');
INSERT INTO `tk_cities` VALUES('371000','370000','威海市','山东省-威海市','','威海市','山东省','2','264000','0631','','','weihaishi','WHS','0');
INSERT INTO `tk_cities` VALUES('371100','370000','日照市','山东省-日照市','','日照市','山东省','2','276800','0633','','','rizhaoshi','RZS','0');
INSERT INTO `tk_cities` VALUES('371200','370000','莱芜市','山东省-莱芜市','','莱芜市','山东省','2','271100','0634','','','laiwushi','LWS','0');
INSERT INTO `tk_cities` VALUES('371300','370000','临沂市','山东省-临沂市','','临沂市','山东省','2','276000','0539','','','linyishi','LYS','0');
INSERT INTO `tk_cities` VALUES('371400','370000','德州市','山东省-德州市','','德州市','山东省','2','253000','0534','','','dezhoushi','DZS','0');
INSERT INTO `tk_cities` VALUES('371500','370000','聊城市','山东省-聊城市','','聊城市','山东省','2','252000','0635','','','liaochengshi','LCS','0');
INSERT INTO `tk_cities` VALUES('371600','370000','滨州市','山东省-滨州市','','滨州市','山东省','2','256600','0543','','','binzhoushi','BZS','0');
INSERT INTO `tk_cities` VALUES('371700','370000','菏泽市','山东省-菏泽市','','菏泽市','山东省','2','274000','0530','','','hezeshi','HZS','0');
INSERT INTO `tk_cities` VALUES('370102','370100','历下区','山东省-济南市-历下区','历下区','济南市','山东省','3','250000','0531','','','lixiaqu','LXQ','0');
INSERT INTO `tk_cities` VALUES('370103','370100','市中区','山东省-济南市-市中区','市中区','济南市','山东省','3','250000','0531','','','shizhongqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('370104','370100','槐荫区','山东省-济南市-槐荫区','槐荫区','济南市','山东省','3','250000','0531','','','huaiyinqu','HYQ','0');
INSERT INTO `tk_cities` VALUES('370105','370100','天桥区','山东省-济南市-天桥区','天桥区','济南市','山东省','3','250000','0531','','','tianqiaoqu','TQQ','0');
INSERT INTO `tk_cities` VALUES('370112','370100','历城区','山东省-济南市-历城区','历城区','济南市','山东省','3','250100','0531','','','lichengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('370113','370100','长清区','山东省-济南市-长清区','长清区','济南市','山东省','3','250300','0531','','','changqingqu','CQQ','0');
INSERT INTO `tk_cities` VALUES('370124','370100','平阴县','山东省-济南市-平阴县','平阴县','济南市','山东省','3','250400','0531','','','pingyinxian','PYX','0');
INSERT INTO `tk_cities` VALUES('370125','370100','济阳县','山东省-济南市-济阳县','济阳县','济南市','山东省','3','251400','0531','','','jiyangxian','JYX','0');
INSERT INTO `tk_cities` VALUES('370126','370100','商河县','山东省-济南市-商河县','商河县','济南市','山东省','3','251600','0531','','','shanghexian','SHX','0');
INSERT INTO `tk_cities` VALUES('370181','370100','章丘市','山东省-济南市-章丘市','章丘市','济南市','山东省','3','250200','0531','','','zhangqiushi','ZQS','0');
INSERT INTO `tk_cities` VALUES('370202','370200','市南区','山东省-青岛市-市南区','市南区','青岛市','山东省','3','266000','0532','','','shinanqu','SNQ','0');
INSERT INTO `tk_cities` VALUES('370203','370200','市北区','山东省-青岛市-市北区','市北区','青岛市','山东省','3','266000','0532','','','shibeiqu','SBQ','0');
INSERT INTO `tk_cities` VALUES('370205','370200','四方区','山东省-青岛市-四方区','四方区','青岛市','山东省','3','266000','0532','','','sifangqu','SFQ','0');
INSERT INTO `tk_cities` VALUES('370211','370200','黄岛区','山东省-青岛市-黄岛区','黄岛区','青岛市','山东省','3','266000','0532','','','huangdaoqu','HDQ','0');
INSERT INTO `tk_cities` VALUES('370212','370200','崂山区','山东省-青岛市-崂山区','崂山区','青岛市','山东省','3','266100','0532','','','shanqu','SQ','0');
INSERT INTO `tk_cities` VALUES('370213','370200','李沧区','山东省-青岛市-李沧区','李沧区','青岛市','山东省','3','266000','0532','','','licangqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('370214','370200','城阳区','山东省-青岛市-城阳区','城阳区','青岛市','山东省','3','266000','0532','','','chengyangqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('370281','370200','胶州市','山东省-青岛市-胶州市','胶州市','青岛市','山东省','3','266300','0532','','','jiaozhoushi','JZS','0');
INSERT INTO `tk_cities` VALUES('370282','370200','即墨市','山东省-青岛市-即墨市','即墨市','青岛市','山东省','3','266200','0532','','','jimoshi','JMS','0');
INSERT INTO `tk_cities` VALUES('370283','370200','平度市','山东省-青岛市-平度市','平度市','青岛市','山东省','3','266700','0532','','','pingdushi','PDS','0');
INSERT INTO `tk_cities` VALUES('370284','370200','胶南市','山东省-青岛市-胶南市','胶南市','青岛市','山东省','3','266400','0532','','','jiaonanshi','JNS','0');
INSERT INTO `tk_cities` VALUES('370285','370200','莱西市','山东省-青岛市-莱西市','莱西市','青岛市','山东省','3','266600','0532','','','laixishi','LXS','0');
INSERT INTO `tk_cities` VALUES('370302','370300','淄川区','山东省-淄博市-淄川区','淄川区','淄博市','山东省','3','255100','0533','','','zichuanqu','ZCQ','0');
INSERT INTO `tk_cities` VALUES('370303','370300','张店区','山东省-淄博市-张店区','张店区','淄博市','山东省','3','255000','0533','','','zhangdianqu','ZDQ','0');
INSERT INTO `tk_cities` VALUES('370304','370300','博山区','山东省-淄博市-博山区','博山区','淄博市','山东省','3','255200','0533','','','boshanqu','BSQ','0');
INSERT INTO `tk_cities` VALUES('370305','370300','临淄区','山东省-淄博市-临淄区','临淄区','淄博市','山东省','3','255400','0533','','','linziqu','LZQ','0');
INSERT INTO `tk_cities` VALUES('370306','370300','周村区','山东省-淄博市-周村区','周村区','淄博市','山东省','3','255300','0533','','','zhoucunqu','ZCQ','0');
INSERT INTO `tk_cities` VALUES('370321','370300','桓台县','山东省-淄博市-桓台县','桓台县','淄博市','山东省','3','256400','0533','','','huantaixian','HTX','0');
INSERT INTO `tk_cities` VALUES('370322','370300','高青县','山东省-淄博市-高青县','高青县','淄博市','山东省','3','256300','0533','','','gaoqingxian','GQX','0');
INSERT INTO `tk_cities` VALUES('370323','370300','沂源县','山东省-淄博市-沂源县','沂源县','淄博市','山东省','3','256100','0533','','','yiyuanxian','YYX','0');
INSERT INTO `tk_cities` VALUES('370402','370400','市中区','山东省-枣庄市-市中区','市中区','枣庄市','山东省','3','277000','0632','','','shizhongqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('370403','370400','薛城区','山东省-枣庄市-薛城区','薛城区','枣庄市','山东省','3','277000','0632','','','xuechengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('370404','370400','峄城区','山东省-枣庄市-峄城区','峄城区','枣庄市','山东省','3','277300','0632','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('370405','370400','台儿庄区','山东省-枣庄市-台儿庄区','台儿庄区','枣庄市','山东省','3','277400','0632','','','taierzhuangqu','TEZQ','0');
INSERT INTO `tk_cities` VALUES('370406','370400','山亭区','山东省-枣庄市-山亭区','山亭区','枣庄市','山东省','3','277200','0632','','','shantingqu','STQ','0');
INSERT INTO `tk_cities` VALUES('370481','370400','滕州市','山东省-枣庄市-滕州市','滕州市','枣庄市','山东省','3','277500','0632','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('370502','370500','东营区','山东省-东营市-东营区','东营区','东营市','山东省','3','257100','0546','','','dongyingqu','DYQ','0');
INSERT INTO `tk_cities` VALUES('370503','370500','河口区','山东省-东营市-河口区','河口区','东营市','山东省','3','257200','0546','','','hekouqu','HKQ','0');
INSERT INTO `tk_cities` VALUES('370521','370500','垦利县','山东省-东营市-垦利县','垦利县','东营市','山东省','3','257500','0546','','','kenlixian','KLX','0');
INSERT INTO `tk_cities` VALUES('370522','370500','利津县','山东省-东营市-利津县','利津县','东营市','山东省','3','257400','0546','','','lijinxian','LJX','0');
INSERT INTO `tk_cities` VALUES('370523','370500','广饶县','山东省-东营市-广饶县','广饶县','东营市','山东省','3','257300','0546','','','guangraoxian','GRX','0');
INSERT INTO `tk_cities` VALUES('370602','370600','芝罘区','山东省-烟台市-芝罘区','芝罘区','烟台市','山东省','3','264000','0535','','','zhiqu','ZQ','0');
INSERT INTO `tk_cities` VALUES('370611','370600','福山区','山东省-烟台市-福山区','福山区','烟台市','山东省','3','265500','0535','','','fushanqu','FSQ','0');
INSERT INTO `tk_cities` VALUES('370612','370600','牟平区','山东省-烟台市-牟平区','牟平区','烟台市','山东省','3','264100','0535','','','moupingqu','MPQ','0');
INSERT INTO `tk_cities` VALUES('370613','370600','莱山区','山东省-烟台市-莱山区','莱山区','烟台市','山东省','3','264000','0535','','','laishanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('370634','370600','长岛县','山东省-烟台市-长岛县','长岛县','烟台市','山东省','3','265800','0535','','','changdaoxian','CDX','0');
INSERT INTO `tk_cities` VALUES('370681','370600','龙口市','山东省-烟台市-龙口市','龙口市','烟台市','山东省','3','265700','0535','','','longkoushi','LKS','0');
INSERT INTO `tk_cities` VALUES('370682','370600','莱阳市','山东省-烟台市-莱阳市','莱阳市','烟台市','山东省','3','265200','0535','','','laiyangshi','LYS','0');
INSERT INTO `tk_cities` VALUES('370683','370600','莱州市','山东省-烟台市-莱州市','莱州市','烟台市','山东省','3','261400','0535','','','laizhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('370684','370600','蓬莱市','山东省-烟台市-蓬莱市','蓬莱市','烟台市','山东省','3','265600','0535','','','penglaishi','PLS','0');
INSERT INTO `tk_cities` VALUES('370685','370600','招远市','山东省-烟台市-招远市','招远市','烟台市','山东省','3','265400','0535','','','zhaoyuanshi','ZYS','0');
INSERT INTO `tk_cities` VALUES('370686','370600','栖霞市','山东省-烟台市-栖霞市','栖霞市','烟台市','山东省','3','265300','0535','','','qixiashi','QXS','0');
INSERT INTO `tk_cities` VALUES('370687','370600','海阳市','山东省-烟台市-海阳市','海阳市','烟台市','山东省','3','265100','0535','','','haiyangshi','HYS','0');
INSERT INTO `tk_cities` VALUES('370702','370700','潍城区','山东省-潍坊市-潍城区','潍城区','潍坊市','山东省','3','261000','0536','','','weichengqu','WCQ','0');
INSERT INTO `tk_cities` VALUES('370703','370700','寒亭区','山东省-潍坊市-寒亭区','寒亭区','潍坊市','山东省','3','261100','0536','','','hantingqu','HTQ','0');
INSERT INTO `tk_cities` VALUES('370704','370700','坊子区','山东省-潍坊市-坊子区','坊子区','潍坊市','山东省','3','261200','0536','','','fangziqu','FZQ','0');
INSERT INTO `tk_cities` VALUES('370705','370700','奎文区','山东省-潍坊市-奎文区','奎文区','潍坊市','山东省','3','261000','0536','','','kuiwenqu','KWQ','0');
INSERT INTO `tk_cities` VALUES('370724','370700','临朐县','山东省-潍坊市-临朐县','临朐县','潍坊市','山东省','3','262600','0536','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('370725','370700','昌乐县','山东省-潍坊市-昌乐县','昌乐县','潍坊市','山东省','3','262400','0536','','','changlexian','CLX','0');
INSERT INTO `tk_cities` VALUES('370781','370700','青州市','山东省-潍坊市-青州市','青州市','潍坊市','山东省','3','262500','0536','','','qingzhoushi','QZS','0');
INSERT INTO `tk_cities` VALUES('370782','370700','诸城市','山东省-潍坊市-诸城市','诸城市','潍坊市','山东省','3','262200','0536','','','zhuchengshi','ZCS','0');
INSERT INTO `tk_cities` VALUES('370783','370700','寿光市','山东省-潍坊市-寿光市','寿光市','潍坊市','山东省','3','262700','0536','','','shouguangshi','SGS','0');
INSERT INTO `tk_cities` VALUES('370784','370700','安丘市','山东省-潍坊市-安丘市','安丘市','潍坊市','山东省','3','262100','0536','','','anqiushi','AQS','0');
INSERT INTO `tk_cities` VALUES('370785','370700','高密市','山东省-潍坊市-高密市','高密市','潍坊市','山东省','3','261500','0536','','','gaomishi','GMS','0');
INSERT INTO `tk_cities` VALUES('370786','370700','昌邑市','山东省-潍坊市-昌邑市','昌邑市','潍坊市','山东省','3','261300','0536','','','changyishi','CYS','0');
INSERT INTO `tk_cities` VALUES('370802','370800','市中区','山东省-济宁市-市中区','市中区','济宁市','山东省','3','272000','0537','','','shizhongqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('370811','370800','任城区','山东省-济宁市-任城区','任城区','济宁市','山东省','3','272000','0537','','','renchengqu','RCQ','0');
INSERT INTO `tk_cities` VALUES('370826','370800','微山县','山东省-济宁市-微山县','微山县','济宁市','山东省','3','277600','0537','','','weishanxian','WSX','0');
INSERT INTO `tk_cities` VALUES('370827','370800','鱼台县','山东省-济宁市-鱼台县','鱼台县','济宁市','山东省','3','272300','0537','','','yutaixian','YTX','0');
INSERT INTO `tk_cities` VALUES('370828','370800','金乡县','山东省-济宁市-金乡县','金乡县','济宁市','山东省','3','272200','0537','','','jinxiangxian','JXX','0');
INSERT INTO `tk_cities` VALUES('370829','370800','嘉祥县','山东省-济宁市-嘉祥县','嘉祥县','济宁市','山东省','3','272400','0537','','','jiaxiangxian','JXX','0');
INSERT INTO `tk_cities` VALUES('370830','370800','汶上县','山东省-济宁市-汶上县','汶上县','济宁市','山东省','3','272500','0537','','','shangxian','SX','0');
INSERT INTO `tk_cities` VALUES('370831','370800','泗水县','山东省-济宁市-泗水县','泗水县','济宁市','山东省','3','273200','0537','','','shuixian','SX','0');
INSERT INTO `tk_cities` VALUES('370832','370800','梁山县','山东省-济宁市-梁山县','梁山县','济宁市','山东省','3','272600','0537','','','liangshanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('370881','370800','曲阜市','山东省-济宁市-曲阜市','曲阜市','济宁市','山东省','3','273100','0537','','','qufushi','QFS','0');
INSERT INTO `tk_cities` VALUES('370882','370800','兖州市','山东省-济宁市-兖州市','兖州市','济宁市','山东省','3','272000','0537','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('370883','370800','邹城市','山东省-济宁市-邹城市','邹城市','济宁市','山东省','3','273500','0537','','','zouchengshi','ZCS','0');
INSERT INTO `tk_cities` VALUES('370902','370900','泰山区','山东省-泰安市-泰山区','泰山区','泰安市','山东省','3','271000','0538','','','taishanqu','TSQ','0');
INSERT INTO `tk_cities` VALUES('370911','370900','岱岳区','山东省-泰安市-岱岳区','岱岳区','泰安市','山东省','3','271000','0538','','','yuequ','YQ','0');
INSERT INTO `tk_cities` VALUES('370921','370900','宁阳县','山东省-泰安市-宁阳县','宁阳县','泰安市','山东省','3','271400','0538','','','ningyangxian','NYX','0');
INSERT INTO `tk_cities` VALUES('370923','370900','东平县','山东省-泰安市-东平县','东平县','泰安市','山东省','3','271500','0538','','','dongpingxian','DPX','0');
INSERT INTO `tk_cities` VALUES('370982','370900','新泰市','山东省-泰安市-新泰市','新泰市','泰安市','山东省','3','271200','0538','','','xintaishi','XTS','0');
INSERT INTO `tk_cities` VALUES('370983','370900','肥城市','山东省-泰安市-肥城市','肥城市','泰安市','山东省','3','271600','0538','','','feichengshi','FCS','0');
INSERT INTO `tk_cities` VALUES('371002','371000','环翠区','山东省-威海市-环翠区','环翠区','威海市','山东省','3','264200','0631','','','huancuiqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('371081','371000','文登市','山东省-威海市-文登市','文登市','威海市','山东省','3','264400','0631','','','wendengshi','WDS','0');
INSERT INTO `tk_cities` VALUES('371082','371000','荣成市','山东省-威海市-荣成市','荣成市','威海市','山东省','3','264300','0631','','','rongchengshi','RCS','0');
INSERT INTO `tk_cities` VALUES('371083','371000','乳山市','山东省-威海市-乳山市','乳山市','威海市','山东省','3','264500','0631','','','rushanshi','RSS','0');
INSERT INTO `tk_cities` VALUES('371102','371100','东港区','山东省-日照市-东港区','东港区','日照市','山东省','3','276800','0633','','','donggangqu','DGQ','0');
INSERT INTO `tk_cities` VALUES('371103','371100','岚山区','山东省-日照市-岚山区','岚山区','日照市','山东省','3','276800','0633','','','shanqu','SQ','0');
INSERT INTO `tk_cities` VALUES('371121','371100','五莲县','山东省-日照市-五莲县','五莲县','日照市','山东省','3','262300','0633','','','wulianxian','WLX','0');
INSERT INTO `tk_cities` VALUES('371122','371100','莒县','山东省-日照市-莒县','莒县','日照市','山东省','3','276500','0633','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('371202','371200','莱城区','山东省-莱芜市-莱城区','莱城区','莱芜市','山东省','3','271100','0634','','','laichengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('371203','371200','钢城区','山东省-莱芜市-钢城区','钢城区','莱芜市','山东省','3','271100','0634','','','gangchengqu','GCQ','0');
INSERT INTO `tk_cities` VALUES('371302','371300','兰山区','山东省-临沂市-兰山区','兰山区','临沂市','山东省','3','276000','0539','','','lanshanqu','LSQ','0');
INSERT INTO `tk_cities` VALUES('371311','371300','罗庄区','山东省-临沂市-罗庄区','罗庄区','临沂市','山东省','3','276000','0539','','','luozhuangqu','LZQ','0');
INSERT INTO `tk_cities` VALUES('371312','371300','河东区','山东省-临沂市-河东区','河东区','临沂市','山东省','3','276000','0539','','','hedongqu','HDQ','0');
INSERT INTO `tk_cities` VALUES('371321','371300','沂南县','山东省-临沂市-沂南县','沂南县','临沂市','山东省','3','276300','0539','','','yinanxian','YNX','0');
INSERT INTO `tk_cities` VALUES('371322','371300','郯城县','山东省-临沂市-郯城县','郯城县','临沂市','山东省','3','276100','0539','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('371323','371300','沂水县','山东省-临沂市-沂水县','沂水县','临沂市','山东省','3','276400','0539','','','yishuixian','YSX','0');
INSERT INTO `tk_cities` VALUES('371324','371300','苍山县','山东省-临沂市-苍山县','苍山县','临沂市','山东省','3','277700','0539','','','cangshanxian','CSX','0');
INSERT INTO `tk_cities` VALUES('371325','371300','费县','山东省-临沂市-费县','费县','临沂市','山东省','3','273400','0539','','','feixian','FX','0');
INSERT INTO `tk_cities` VALUES('371326','371300','平邑县','山东省-临沂市-平邑县','平邑县','临沂市','山东省','3','273300','0539','','','pingyixian','PYX','0');
INSERT INTO `tk_cities` VALUES('371327','371300','莒南县','山东省-临沂市-莒南县','莒南县','临沂市','山东省','3','276600','0539','','','nanxian','NX','0');
INSERT INTO `tk_cities` VALUES('371328','371300','蒙阴县','山东省-临沂市-蒙阴县','蒙阴县','临沂市','山东省','3','276200','0539','','','mengyinxian','MYX','0');
INSERT INTO `tk_cities` VALUES('371329','371300','临沭县','山东省-临沂市-临沭县','临沭县','临沂市','山东省','3','276700','0539','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('371402','371400','德城区','山东省-德州市-德城区','德城区','德州市','山东省','3','253000','0534','','','dechengqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('371421','371400','陵县','山东省-德州市-陵县','陵县','德州市','山东省','3','253500','0534','','','lingxian','LX','0');
INSERT INTO `tk_cities` VALUES('371422','371400','宁津县','山东省-德州市-宁津县','宁津县','德州市','山东省','3','253400','0534','','','ningjinxian','NJX','0');
INSERT INTO `tk_cities` VALUES('371423','371400','庆云县','山东省-德州市-庆云县','庆云县','德州市','山东省','3','253700','0534','','','qingyunxian','QYX','0');
INSERT INTO `tk_cities` VALUES('371424','371400','临邑县','山东省-德州市-临邑县','临邑县','德州市','山东省','3','251500','0534','','','linyixian','LYX','0');
INSERT INTO `tk_cities` VALUES('371425','371400','齐河县','山东省-德州市-齐河县','齐河县','德州市','山东省','3','251100','0534','','','qihexian','QHX','0');
INSERT INTO `tk_cities` VALUES('371426','371400','平原县','山东省-德州市-平原县','平原县','德州市','山东省','3','253100','0534','','','pingyuanxian','PYX','0');
INSERT INTO `tk_cities` VALUES('371427','371400','夏津县','山东省-德州市-夏津县','夏津县','德州市','山东省','3','253200','0534','','','xiajinxian','XJX','0');
INSERT INTO `tk_cities` VALUES('371428','371400','武城县','山东省-德州市-武城县','武城县','德州市','山东省','3','253300','0534','','','wuchengxian','WCX','0');
INSERT INTO `tk_cities` VALUES('371481','371400','乐陵市','山东省-德州市-乐陵市','乐陵市','德州市','山东省','3','253600','0534','','','lelingshi','LLS','0');
INSERT INTO `tk_cities` VALUES('371482','371400','禹城市','山东省-德州市-禹城市','禹城市','德州市','山东省','3','251200','0534','','','yuchengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('371502','371500','东昌府区','山东省-聊城市-东昌府区','东昌府区','聊城市','山东省','3','252000','0635','','','dongchangfuqu','DCFQ','0');
INSERT INTO `tk_cities` VALUES('371521','371500','阳谷县','山东省-聊城市-阳谷县','阳谷县','聊城市','山东省','3','252300','0635','','','yangguxian','YGX','0');
INSERT INTO `tk_cities` VALUES('371522','371500','莘县','山东省-聊城市-莘县','莘县','聊城市','山东省','3','252400','0635','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('371523','371500','茌平县','山东省-聊城市-茌平县','茌平县','聊城市','山东省','3','252100','0635','','','pingxian','PX','0');
INSERT INTO `tk_cities` VALUES('371524','371500','东阿县','山东省-聊城市-东阿县','东阿县','聊城市','山东省','3','252200','0635','','','dongaxian','DAX','0');
INSERT INTO `tk_cities` VALUES('371525','371500','冠县','山东省-聊城市-冠县','冠县','聊城市','山东省','3','252500','0635','','','guanxian','GX','0');
INSERT INTO `tk_cities` VALUES('371526','371500','高唐县','山东省-聊城市-高唐县','高唐县','聊城市','山东省','3','252800','0635','','','gaotangxian','GTX','0');
INSERT INTO `tk_cities` VALUES('371581','371500','临清市','山东省-聊城市-临清市','临清市','聊城市','山东省','3','252600','0635','','','linqingshi','LQS','0');
INSERT INTO `tk_cities` VALUES('371602','371600','滨城区','山东省-滨州市-滨城区','滨城区','滨州市','山东省','3','256600','0543','','','binchengqu','BCQ','0');
INSERT INTO `tk_cities` VALUES('371621','371600','惠民县','山东省-滨州市-惠民县','惠民县','滨州市','山东省','3','251700','0543','','','huiminxian','HMX','0');
INSERT INTO `tk_cities` VALUES('371622','371600','阳信县','山东省-滨州市-阳信县','阳信县','滨州市','山东省','3','251800','0543','','','yangxinxian','YXX','0');
INSERT INTO `tk_cities` VALUES('371623','371600','无棣县','山东省-滨州市-无棣县','无棣县','滨州市','山东省','3','251900','0543','','','wuxian','WX','0');
INSERT INTO `tk_cities` VALUES('371624','371600','沾化县','山东省-滨州市-沾化县','沾化县','滨州市','山东省','3','256800','0543','','','zhanhuaxian','ZHX','0');
INSERT INTO `tk_cities` VALUES('371625','371600','博兴县','山东省-滨州市-博兴县','博兴县','滨州市','山东省','3','256500','0543','','','boxingxian','BXX','0');
INSERT INTO `tk_cities` VALUES('371626','371600','邹平县','山东省-滨州市-邹平县','邹平县','滨州市','山东省','3','256200','0543','','','zoupingxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('371702','371700','牡丹区','山东省-菏泽市-牡丹区','牡丹区','菏泽市','山东省','3','274000','0530','','','mudanqu','MDQ','0');
INSERT INTO `tk_cities` VALUES('371721','371700','曹县','山东省-菏泽市-曹县','曹县','菏泽市','山东省','3','274400','0530','','','caoxian','CX','0');
INSERT INTO `tk_cities` VALUES('371722','371700','单县','山东省-菏泽市-单县','单县','菏泽市','山东省','3','274300','0530','','','danxian','DX','0');
INSERT INTO `tk_cities` VALUES('371723','371700','成武县','山东省-菏泽市-成武县','成武县','菏泽市','山东省','3','274200','0530','','','chengwuxian','CWX','0');
INSERT INTO `tk_cities` VALUES('371724','371700','巨野县','山东省-菏泽市-巨野县','巨野县','菏泽市','山东省','3','274900','0530','','','juyexian','JYX','0');
INSERT INTO `tk_cities` VALUES('371725','371700','郓城县','山东省-菏泽市-郓城县','郓城县','菏泽市','山东省','3','274700','0530','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('371726','371700','鄄城县','山东省-菏泽市-鄄城县','鄄城县','菏泽市','山东省','3','274600','0530','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('371727','371700','定陶县','山东省-菏泽市-定陶县','定陶县','菏泽市','山东省','3','274100','0530','','','dingtaoxian','DTX','0');
INSERT INTO `tk_cities` VALUES('371728','371700','东明县','山东省-菏泽市-东明县','东明县','菏泽市','山东省','3','274500','0530','','','dongmingxian','DMX','0');
INSERT INTO `tk_cities` VALUES('410000','0','河南省','河南省','','','河南省','1','','','','','henansheng','HNS','0');
INSERT INTO `tk_cities` VALUES('410100','410000','郑州市','河南省-郑州市','','郑州市','河南省','2','450000','0371','','','zhengzhoushi','ZZS','0');
INSERT INTO `tk_cities` VALUES('410200','410000','开封市','河南省-开封市','','开封市','河南省','2','475000','0378','','','kaifengshi','KFS','1');
INSERT INTO `tk_cities` VALUES('410300','410000','洛阳市','河南省-洛阳市','','洛阳市','河南省','2','471000','0379','','','luoyangshi','LYS','0');
INSERT INTO `tk_cities` VALUES('410400','410000','平顶山市','河南省-平顶山市','','平顶山市','河南省','2','467000','0375','','','pingdingshanshi','PDSS','1');
INSERT INTO `tk_cities` VALUES('410500','410000','安阳市','河南省-安阳市','','安阳市','河南省','2','455000','0372','','','anyangshi','AYS','0');
INSERT INTO `tk_cities` VALUES('410600','410000','鹤壁市','河南省-鹤壁市','','鹤壁市','河南省','2','458000','0392','','','hebishi','HBS','0');
INSERT INTO `tk_cities` VALUES('410700','410000','新乡市','河南省-新乡市','','新乡市','河南省','2','453000','0373','','','xinxiangshi','XXS','0');
INSERT INTO `tk_cities` VALUES('410800','410000','焦作市','河南省-焦作市','','焦作市','河南省','2','454150','0391','','','jiaozuoshi','JZS','0');
INSERT INTO `tk_cities` VALUES('410900','410000','濮阳市','河南省-濮阳市','','濮阳市','河南省','2','457000','0393','','','yangshi','YS','0');
INSERT INTO `tk_cities` VALUES('411000','410000','许昌市','河南省-许昌市','','许昌市','河南省','2','461000','0373','','','xuchangshi','XCS','0');
INSERT INTO `tk_cities` VALUES('411100','410000','漯河市','河南省-漯河市','','漯河市','河南省','2','462000','0395','','','heshi','HS','0');
INSERT INTO `tk_cities` VALUES('411200','410000','三门峡市','河南省-三门峡市','','三门峡市','河南省','2','472000','0398','','','sanmenxiashi','SMXS','0');
INSERT INTO `tk_cities` VALUES('411300','410000','南阳市','河南省-南阳市','','南阳市','河南省','2','473000','0377','','','nanyangshi','NYS','1');
INSERT INTO `tk_cities` VALUES('411400','410000','商丘市','河南省-商丘市','','商丘市','河南省','2','476000','0370','','','shangqiushi','SQS','0');
INSERT INTO `tk_cities` VALUES('411500','410000','信阳市','河南省-信阳市','','信阳市','河南省','2','464000','0376','','','xinyangshi','XYS','1');
INSERT INTO `tk_cities` VALUES('411600','410000','周口市','河南省-周口市','','周口市','河南省','2','466000','0394','','','zhoukoushi','ZKS','0');
INSERT INTO `tk_cities` VALUES('411700','410000','驻马店市','河南省-驻马店市','','驻马店市','河南省','2','463000','0396','','','zhumadianshi','ZMDS','1');
INSERT INTO `tk_cities` VALUES('419000','','省直辖','河南省-省直辖','','省直辖','河南省','2','','','','','shengzhixia','SZX','0');
INSERT INTO `tk_cities` VALUES('410102','410100','中原区','河南省-郑州市-中原区','中原区','郑州市','河南省','3','450000','0371','','','zhongyuanqu','ZYQ','0');
INSERT INTO `tk_cities` VALUES('410103','410100','二七区','河南省-郑州市-二七区','二七区','郑州市','河南省','3','450000','0371','','','erqiqu','EQQ','0');
INSERT INTO `tk_cities` VALUES('410104','410100','管城回族区','河南省-郑州市-管城回族区','管城回族区','郑州市','河南省','3','450000','0371','','','guanchenghuizuqu','GCHZQ','0');
INSERT INTO `tk_cities` VALUES('410105','410100','金水区','河南省-郑州市-金水区','金水区','郑州市','河南省','3','450000','0371','','','jinshuiqu','JSQ','0');
INSERT INTO `tk_cities` VALUES('410106','410100','上街区','河南省-郑州市-上街区','上街区','郑州市','河南省','3','450041','0371','','','shangjiequ','SJQ','0');
INSERT INTO `tk_cities` VALUES('410108','410100','惠济区','河南省-郑州市-惠济区','惠济区','郑州市','河南省','3','450000','0371','','','huijiqu','HJQ','0');
INSERT INTO `tk_cities` VALUES('410122','410100','中牟县','河南省-郑州市-中牟县','中牟县','郑州市','河南省','3','451450','0371','','','zhongmouxian','ZMX','0');
INSERT INTO `tk_cities` VALUES('410181','410100','巩义市','河南省-郑州市-巩义市','巩义市','郑州市','河南省','3','452100','0371','','','gongyishi','GYS','0');
INSERT INTO `tk_cities` VALUES('410182','410100','荥阳市','河南省-郑州市-荥阳市','荥阳市','郑州市','河南省','3','450100','0371','','','yangshi','YS','0');
INSERT INTO `tk_cities` VALUES('410183','410100','新密市','河南省-郑州市-新密市','新密市','郑州市','河南省','3','452370','0371','','','xinmishi','XMS','0');
INSERT INTO `tk_cities` VALUES('410184','410100','新郑市','河南省-郑州市-新郑市','新郑市','郑州市','河南省','3','451100','0371','','','xinzhengshi','XZS','0');
INSERT INTO `tk_cities` VALUES('410185','410100','登封市','河南省-郑州市-登封市','登封市','郑州市','河南省','3','452470','0371','','','dengfengshi','DFS','0');
INSERT INTO `tk_cities` VALUES('410202','410200','龙亭区','河南省-开封市-龙亭区','龙亭区','开封市','河南省','3','475000','0378','','','longtingqu','LTQ','0');
INSERT INTO `tk_cities` VALUES('410203','410200','顺河回族区','河南省-开封市-顺河回族区','顺河回族区','开封市','河南省','3','475000','0378','','','shunhehuizuqu','SHHZQ','0');
INSERT INTO `tk_cities` VALUES('410204','410200','鼓楼区','河南省-开封市-鼓楼区','鼓楼区','开封市','河南省','3','475000','0378','','','gulouqu','GLQ','0');
INSERT INTO `tk_cities` VALUES('410205','410200','禹王台区','河南省-开封市-禹王台区','禹王台区','开封市','河南省','3','475000','0378','','','yuwangtaiqu','YWTQ','0');
INSERT INTO `tk_cities` VALUES('410211','410200','金明区','河南省-开封市-金明区','金明区','开封市','河南省','3','475000','0378','','','jinmingqu','JMQ','0');
INSERT INTO `tk_cities` VALUES('410221','410200','杞县','河南省-开封市-杞县','杞县','开封市','河南省','3','475200','0378','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('410222','410200','通许县','河南省-开封市-通许县','通许县','开封市','河南省','3','452200','0378','','','tongxuxian','TXX','0');
INSERT INTO `tk_cities` VALUES('410223','410200','尉氏县','河南省-开封市-尉氏县','尉氏县','开封市','河南省','3','452100','0378','','','weishixian','WSX','0');
INSERT INTO `tk_cities` VALUES('410224','410200','开封县','河南省-开封市-开封县','开封县','开封市','河南省','3','475100','0378','','','kaifengxian','KFX','0');
INSERT INTO `tk_cities` VALUES('410225','410200','兰考县','河南省-开封市-兰考县','兰考县','开封市','河南省','3','475300','0378','','','lankaoxian','LKX','0');
INSERT INTO `tk_cities` VALUES('410302','410300','老城区','河南省-洛阳市-老城区','老城区','洛阳市','河南省','3','471000','0379','','','laochengqu','LCQ','0');
INSERT INTO `tk_cities` VALUES('410303','410300','西工区','河南省-洛阳市-西工区','西工区','洛阳市','河南省','3','471000','0379','','','xigongqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('410304','410300','瀍河回族区','河南省-洛阳市-瀍河回族区','瀍河回族区','洛阳市','河南省','3','471000','0379','','','ehehuizuqu','HHZQ','0');
INSERT INTO `tk_cities` VALUES('410305','410300','涧西区','河南省-洛阳市-涧西区','涧西区','洛阳市','河南省','3','471000','0379','','','jianxiqu','JXQ','0');
INSERT INTO `tk_cities` VALUES('410306','410300','吉利区','河南省-洛阳市-吉利区','吉利区','洛阳市','河南省','3','471000','0379','','','jiliqu','JLQ','0');
INSERT INTO `tk_cities` VALUES('410311','410300','洛龙区','河南省-洛阳市-洛龙区','洛龙区','洛阳市','河南省','3','471000','0379','','','luolongqu','LLQ','0');
INSERT INTO `tk_cities` VALUES('410322','410300','孟津县','河南省-洛阳市-孟津县','孟津县','洛阳市','河南省','3','471100','0379','','','mengjinxian','MJX','0');
INSERT INTO `tk_cities` VALUES('410323','410300','新安县','河南省-洛阳市-新安县','新安县','洛阳市','河南省','3','471800','0379','','','xinanxian','XAX','0');
INSERT INTO `tk_cities` VALUES('410324','410300','栾川县','河南省-洛阳市-栾川县','栾川县','洛阳市','河南省','3','471500','0379','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('410325','410300','嵩县','河南省-洛阳市-嵩县','嵩县','洛阳市','河南省','3','471400','0379','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('410326','410300','汝阳县','河南省-洛阳市-汝阳县','汝阳县','洛阳市','河南省','3','471200','0379','','','ruyangxian','RYX','0');
INSERT INTO `tk_cities` VALUES('410327','410300','宜阳县','河南省-洛阳市-宜阳县','宜阳县','洛阳市','河南省','3','471600','0379','','','yiyangxian','YYX','0');
INSERT INTO `tk_cities` VALUES('410328','410300','洛宁县','河南省-洛阳市-洛宁县','洛宁县','洛阳市','河南省','3','471700','0379','','','luoningxian','LNX','0');
INSERT INTO `tk_cities` VALUES('410329','410300','伊川县','河南省-洛阳市-伊川县','伊川县','洛阳市','河南省','3','471300','0379','','','yichuanxian','YCX','0');
INSERT INTO `tk_cities` VALUES('410381','410300','偃师市','河南省-洛阳市-偃师市','偃师市','洛阳市','河南省','3','471900','0379','','','shishi','SS','0');
INSERT INTO `tk_cities` VALUES('410402','410400','新华区','河南省-平顶山市-新华区','新华区','平顶山市','河南省','3','467000','0375','','','xinhuaqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('410403','410400','卫东区','河南省-平顶山市-卫东区','卫东区','平顶山市','河南省','3','467000','0375','','','weidongqu','WDQ','0');
INSERT INTO `tk_cities` VALUES('410404','410400','石龙区','河南省-平顶山市-石龙区','石龙区','平顶山市','河南省','3','467000','0375','','','shilongqu','SLQ','0');
INSERT INTO `tk_cities` VALUES('410411','410400','湛河区','河南省-平顶山市-湛河区','湛河区','平顶山市','河南省','3','467000','0375','','','zhanhequ','ZHQ','0');
INSERT INTO `tk_cities` VALUES('410421','410400','宝丰县','河南省-平顶山市-宝丰县','宝丰县','平顶山市','河南省','3','467400','0375','','','baofengxian','BFX','0');
INSERT INTO `tk_cities` VALUES('410422','410400','叶县','河南省-平顶山市-叶县','叶县','平顶山市','河南省','3','467200','0375','','','yexian','YX','0');
INSERT INTO `tk_cities` VALUES('410423','410400','鲁山县','河南省-平顶山市-鲁山县','鲁山县','平顶山市','河南省','3','467300','0375','','','lushanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('410425','410400','郏县','河南省-平顶山市-郏县','郏县','平顶山市','河南省','3','467100','0375','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('410481','410400','舞钢市','河南省-平顶山市-舞钢市','舞钢市','平顶山市','河南省','3','462500','0375','','','wugangshi','WGS','0');
INSERT INTO `tk_cities` VALUES('410482','410400','汝州市','河南省-平顶山市-汝州市','汝州市','平顶山市','河南省','3','467500','0375','','','ruzhoushi','RZS','0');
INSERT INTO `tk_cities` VALUES('410502','410500','文峰区','河南省-安阳市-文峰区','文峰区','安阳市','河南省','3','455000','0372','','','wenfengqu','WFQ','0');
INSERT INTO `tk_cities` VALUES('410503','410500','北关区','河南省-安阳市-北关区','北关区','安阳市','河南省','3','455000','0372','','','beiguanqu','BGQ','0');
INSERT INTO `tk_cities` VALUES('410505','410500','殷都区','河南省-安阳市-殷都区','殷都区','安阳市','河南省','3','455000','0372','','','yinduqu','YDQ','0');
INSERT INTO `tk_cities` VALUES('410506','410500','龙安区','河南省-安阳市-龙安区','龙安区','安阳市','河南省','3','455000','0372','','','longanqu','LAQ','0');
INSERT INTO `tk_cities` VALUES('410522','410500','安阳县','河南省-安阳市-安阳县','安阳县','安阳市','河南省','3','455100','0372','','','anyangxian','AYX','0');
INSERT INTO `tk_cities` VALUES('410523','410500','汤阴县','河南省-安阳市-汤阴县','汤阴县','安阳市','河南省','3','456150','0372','','','tangyinxian','TYX','0');
INSERT INTO `tk_cities` VALUES('410526','410500','滑县','河南省-安阳市-滑县','滑县','安阳市','河南省','3','456400','0372','','','huaxian','HX','0');
INSERT INTO `tk_cities` VALUES('410527','410500','内黄县','河南省-安阳市-内黄县','内黄县','安阳市','河南省','3','456300','0372','','','neihuangxian','NHX','0');
INSERT INTO `tk_cities` VALUES('410581','410500','林州市','河南省-安阳市-林州市','林州市','安阳市','河南省','3','456500','0372','','','linzhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('410602','410600','鹤山区','河南省-鹤壁市-鹤山区','鹤山区','鹤壁市','河南省','3','458000','0392','','','heshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('410603','410600','山城区','河南省-鹤壁市-山城区','山城区','鹤壁市','河南省','3','458000','0392','','','shanchengqu','SCQ','0');
INSERT INTO `tk_cities` VALUES('410611','410600','淇滨区','河南省-鹤壁市-淇滨区','淇滨区','鹤壁市','河南省','3','458000','0392','','','binqu','BQ','0');
INSERT INTO `tk_cities` VALUES('410621','410600','浚县','河南省-鹤壁市-浚县','浚县','鹤壁市','河南省','3','456250','0392','','','junxian','JX','0');
INSERT INTO `tk_cities` VALUES('410622','410600','淇县','河南省-鹤壁市-淇县','淇县','鹤壁市','河南省','3','456750','0392','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('410702','410700','红旗区','河南省-新乡市-红旗区','红旗区','新乡市','河南省','3','453000','0373','','','hongqiqu','HQQ','0');
INSERT INTO `tk_cities` VALUES('410703','410700','卫滨区','河南省-新乡市-卫滨区','卫滨区','新乡市','河南省','3','453000','0373','','','weibinqu','WBQ','0');
INSERT INTO `tk_cities` VALUES('410704','410700','凤泉区','河南省-新乡市-凤泉区','凤泉区','新乡市','河南省','3','453000','0373','','','fengquanqu','FQQ','0');
INSERT INTO `tk_cities` VALUES('410711','410700','牧野区','河南省-新乡市-牧野区','牧野区','新乡市','河南省','3','453000','0373','','','muyequ','MYQ','0');
INSERT INTO `tk_cities` VALUES('410721','410700','新乡县','河南省-新乡市-新乡县','新乡县','新乡市','河南省','3','453700','0373','','','xinxiangxian','XXX','0');
INSERT INTO `tk_cities` VALUES('410724','410700','获嘉县','河南省-新乡市-获嘉县','获嘉县','新乡市','河南省','3','453800','0373','','','huojiaxian','HJX','0');
INSERT INTO `tk_cities` VALUES('410725','410700','原阳县','河南省-新乡市-原阳县','原阳县','新乡市','河南省','3','453500','0373','','','yuanyangxian','YYX','0');
INSERT INTO `tk_cities` VALUES('410726','410700','延津县','河南省-新乡市-延津县','延津县','新乡市','河南省','3','453200','0373','','','yanjinxian','YJX','0');
INSERT INTO `tk_cities` VALUES('410727','410700','封丘县','河南省-新乡市-封丘县','封丘县','新乡市','河南省','3','453300','0373','','','fengqiuxian','FQX','0');
INSERT INTO `tk_cities` VALUES('410728','410700','长垣县','河南省-新乡市-长垣县','长垣县','新乡市','河南省','3','453400','0373','','','changyuanxian','CYX','0');
INSERT INTO `tk_cities` VALUES('410781','410700','卫辉市','河南省-新乡市-卫辉市','卫辉市','新乡市','河南省','3','453100','0373','','','weihuishi','WHS','0');
INSERT INTO `tk_cities` VALUES('410782','410700','辉县市','河南省-新乡市-辉县市','辉县市','新乡市','河南省','3','453600','0373','','','huixianshi','HXS','0');
INSERT INTO `tk_cities` VALUES('410802','410800','解放区','河南省-焦作市-解放区','解放区','焦作市','河南省','3','454150','0391','','','jiefangqu','JFQ','0');
INSERT INTO `tk_cities` VALUES('410803','410800','中站区','河南省-焦作市-中站区','中站区','焦作市','河南省','3','454150','0391','','','zhongzhanqu','ZZQ','0');
INSERT INTO `tk_cities` VALUES('410804','410800','马村区','河南省-焦作市-马村区','马村区','焦作市','河南省','3','454150','0391','','','macunqu','MCQ','0');
INSERT INTO `tk_cities` VALUES('410811','410800','山阳区','河南省-焦作市-山阳区','山阳区','焦作市','河南省','3','454150','0391','','','shanyangqu','SYQ','0');
INSERT INTO `tk_cities` VALUES('410821','410800','修武县','河南省-焦作市-修武县','修武县','焦作市','河南省','3','454350','0391','','','xiuwuxian','XWX','0');
INSERT INTO `tk_cities` VALUES('410822','410800','博爱县','河南省-焦作市-博爱县','博爱县','焦作市','河南省','3','454450','0391','','','boaixian','BAX','0');
INSERT INTO `tk_cities` VALUES('410823','410800','武陟县','河南省-焦作市-武陟县','武陟县','焦作市','河南省','3','454950','0391','','','wuxian','WX','0');
INSERT INTO `tk_cities` VALUES('410825','410800','温县','河南省-焦作市-温县','温县','焦作市','河南省','3','454850','0391','','','wenxian','WX','0');
INSERT INTO `tk_cities` VALUES('410882','410800','沁阳市','河南省-焦作市-沁阳市','沁阳市','焦作市','河南省','3','454550','0391','','','qinyangshi','QYS','0');
INSERT INTO `tk_cities` VALUES('410883','410800','孟州市','河南省-焦作市-孟州市','孟州市','焦作市','河南省','3','454750','0391','','','mengzhoushi','MZS','0');
INSERT INTO `tk_cities` VALUES('410902','410900','华龙区','河南省-濮阳市-华龙区','华龙区','濮阳市','河南省','3','457000','0393','','','hualongqu','HLQ','0');
INSERT INTO `tk_cities` VALUES('410922','410900','清丰县','河南省-濮阳市-清丰县','清丰县','濮阳市','河南省','3','457300','0393','','','qingfengxian','QFX','0');
INSERT INTO `tk_cities` VALUES('410923','410900','南乐县','河南省-濮阳市-南乐县','南乐县','濮阳市','河南省','3','457400','0393','','','nanlexian','NLX','0');
INSERT INTO `tk_cities` VALUES('410926','410900','范县','河南省-濮阳市-范县','范县','濮阳市','河南省','3','457500','0393','','','fanxian','FX','0');
INSERT INTO `tk_cities` VALUES('410927','410900','台前县','河南省-濮阳市-台前县','台前县','濮阳市','河南省','3','457600','0393','','','taiqianxian','TQX','0');
INSERT INTO `tk_cities` VALUES('410928','410900','濮阳县','河南省-濮阳市-濮阳县','濮阳县','濮阳市','河南省','3','457100','0393','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('411002','411000','魏都区','河南省-许昌市-魏都区','魏都区','许昌市','河南省','3','461000','0374','','','weiduqu','WDQ','0');
INSERT INTO `tk_cities` VALUES('411023','411000','许昌县','河南省-许昌市-许昌县','许昌县','许昌市','河南省','3','461100','0374','','','xuchangxian','XCX','0');
INSERT INTO `tk_cities` VALUES('411024','411000','鄢陵县','河南省-许昌市-鄢陵县','鄢陵县','许昌市','河南省','3','461200','0374','','','lingxian','LX','0');
INSERT INTO `tk_cities` VALUES('411025','411000','襄城县','河南省-许昌市-襄城县','襄城县','许昌市','河南省','3','452670','0374','','','xiangchengxian','XCX','0');
INSERT INTO `tk_cities` VALUES('411081','411000','禹州市','河南省-许昌市-禹州市','禹州市','许昌市','河南省','3','452570','0374','','','yuzhoushi','YZS','0');
INSERT INTO `tk_cities` VALUES('411082','411000','长葛市','河南省-许昌市-长葛市','长葛市','许昌市','河南省','3','461500','0374','','','changgeshi','CGS','0');
INSERT INTO `tk_cities` VALUES('411102','411100','源汇区','河南省-漯河市-源汇区','源汇区','漯河市','河南省','3','462000','0395','','','yuanhuiqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('411103','411100','郾城区','河南省-漯河市-郾城区','郾城区','漯河市','河南省','3','462300','0395','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('411104','411100','召陵区','河南省-漯河市-召陵区','召陵区','漯河市','河南省','3','462300','0395','','','zhaolingqu','ZLQ','0');
INSERT INTO `tk_cities` VALUES('411121','411100','舞阳县','河南省-漯河市-舞阳县','舞阳县','漯河市','河南省','3','462400','0395','','','wuyangxian','WYX','0');
INSERT INTO `tk_cities` VALUES('411122','411100','临颍县','河南省-漯河市-临颍县','临颍县','漯河市','河南省','3','462600','0395','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('411202','411200','湖滨区','河南省-三门峡市-湖滨区','湖滨区','三门峡市','河南省','3','472000','0398','','','hubinqu','HBQ','0');
INSERT INTO `tk_cities` VALUES('411221','411200','渑池县','河南省-三门峡市-渑池县','渑池县','三门峡市','河南省','3','472400','0398','','','chixian','CX','0');
INSERT INTO `tk_cities` VALUES('411222','411200','陕县','河南省-三门峡市-陕县','陕县','三门峡市','河南省','3','472100','0398','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('411224','411200','卢氏县','河南省-三门峡市-卢氏县','卢氏县','三门峡市','河南省','3','472200','0398','','','lushixian','LSX','0');
INSERT INTO `tk_cities` VALUES('411281','411200','义马市','河南省-三门峡市-义马市','义马市','三门峡市','河南省','3','472300','0398','','','yimashi','YMS','0');
INSERT INTO `tk_cities` VALUES('411282','411200','灵宝市','河南省-三门峡市-灵宝市','灵宝市','三门峡市','河南省','3','472500','0398','','','lingbaoshi','LBS','0');
INSERT INTO `tk_cities` VALUES('411302','411300','宛城区','河南省-南阳市-宛城区','宛城区','南阳市','河南省','3','473000','0377','','','wanchengqu','WCQ','0');
INSERT INTO `tk_cities` VALUES('411303','411300','卧龙区','河南省-南阳市-卧龙区','卧龙区','南阳市','河南省','3','473000','0377','','','wolongqu','WLQ','0');
INSERT INTO `tk_cities` VALUES('411321','411300','南召县','河南省-南阳市-南召县','南召县','南阳市','河南省','3','474650','0377','','','nanzhaoxian','NZX','0');
INSERT INTO `tk_cities` VALUES('411322','411300','方城县','河南省-南阳市-方城县','方城县','南阳市','河南省','3','473200','0377','','','fangchengxian','FCX','0');
INSERT INTO `tk_cities` VALUES('411323','411300','西峡县','河南省-南阳市-西峡县','西峡县','南阳市','河南省','3','474550','0377','','','xixiaxian','XXX','0');
INSERT INTO `tk_cities` VALUES('411324','411300','镇平县','河南省-南阳市-镇平县','镇平县','南阳市','河南省','3','474250','0377','','','zhenpingxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('411325','411300','内乡县','河南省-南阳市-内乡县','内乡县','南阳市','河南省','3','474350','0377','','','neixiangxian','NXX','0');
INSERT INTO `tk_cities` VALUES('411326','411300','淅川县','河南省-南阳市-淅川县','淅川县','南阳市','河南省','3','474450','0377','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('411327','411300','社旗县','河南省-南阳市-社旗县','社旗县','南阳市','河南省','3','473300','0377','','','sheqixian','SQX','0');
INSERT INTO `tk_cities` VALUES('411328','411300','唐河县','河南省-南阳市-唐河县','唐河县','南阳市','河南省','3','473400','0377','','','tanghexian','THX','0');
INSERT INTO `tk_cities` VALUES('411329','411300','新野县','河南省-南阳市-新野县','新野县','南阳市','河南省','3','473500','0377','','','xinyexian','XYX','0');
INSERT INTO `tk_cities` VALUES('411330','411300','桐柏县','河南省-南阳市-桐柏县','桐柏县','南阳市','河南省','3','474750','0377','','','tongbaixian','TBX','0');
INSERT INTO `tk_cities` VALUES('411381','411300','邓州市','河南省-南阳市-邓州市','邓州市','南阳市','河南省','3','474150','0377','','','dengzhoushi','DZS','0');
INSERT INTO `tk_cities` VALUES('411402','411400','梁园区','河南省-商丘市-梁园区','梁园区','商丘市','河南省','3','476000','0370','','','liangyuanqu','LYQ','0');
INSERT INTO `tk_cities` VALUES('411403','411400','睢阳区','河南省-商丘市-睢阳区','睢阳区','商丘市','河南省','3','476000','0370','','','yangqu','YQ','0');
INSERT INTO `tk_cities` VALUES('411421','411400','民权县','河南省-商丘市-民权县','民权县','商丘市','河南省','3','476800','0370','','','minquanxian','MQX','0');
INSERT INTO `tk_cities` VALUES('411422','411400','睢县','河南省-商丘市-睢县','睢县','商丘市','河南省','3','476900','0370','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('411423','411400','宁陵县','河南省-商丘市-宁陵县','宁陵县','商丘市','河南省','3','476700','0370','','','ninglingxian','NLX','0');
INSERT INTO `tk_cities` VALUES('411424','411400','柘城县','河南省-商丘市-柘城县','柘城县','商丘市','河南省','3','476200','0370','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('411425','411400','虞城县','河南省-商丘市-虞城县','虞城县','商丘市','河南省','3','476300','0370','','','yuchengxian','YCX','0');
INSERT INTO `tk_cities` VALUES('411426','411400','夏邑县','河南省-商丘市-夏邑县','夏邑县','商丘市','河南省','3','476400','0370','','','xiayixian','XYX','0');
INSERT INTO `tk_cities` VALUES('411481','411400','永城市','河南省-商丘市-永城市','永城市','商丘市','河南省','3','476600','0370','','','yongchengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('411502','411500','浉河区','河南省-信阳市-浉河区','浉河区','信阳市','河南省','3','464000','0376','','','fuyou','FY','0');
INSERT INTO `tk_cities` VALUES('411503','411500','平桥区','河南省-信阳市-平桥区','平桥区','信阳市','河南省','3','464000','0376','','','pingqiaoqu','PQQ','0');
INSERT INTO `tk_cities` VALUES('411521','411500','罗山县','河南省-信阳市-罗山县','罗山县','信阳市','河南省','3','464200','0376','','','luoshanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('411522','411500','光山县','河南省-信阳市-光山县','光山县','信阳市','河南省','3','465450','0397','','','guangshanxian','GSX','0');
INSERT INTO `tk_cities` VALUES('411523','411500','新县','河南省-信阳市-新县','新县','信阳市','河南省','3','465500','0397','','','xinxian','XX','0');
INSERT INTO `tk_cities` VALUES('411524','411500','商城县','河南省-信阳市-商城县','商城县','信阳市','河南省','3','465350','0397','','','shangchengxian','SCX','0');
INSERT INTO `tk_cities` VALUES('411525','411500','固始县','河南省-信阳市-固始县','固始县','信阳市','河南省','3','465200','0397','','','gushixian','GSX','0');
INSERT INTO `tk_cities` VALUES('411526','411500','潢川县','河南省-信阳市-潢川县','潢川县','信阳市','河南省','3','465150','0397','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('411527','411500','淮滨县','河南省-信阳市-淮滨县','淮滨县','信阳市','河南省','3','464400','0397','','','huaibinxian','HBX','0');
INSERT INTO `tk_cities` VALUES('411528','411500','息县','河南省-信阳市-息县','息县','信阳市','河南省','3','464300','0397','','','xixian','XX','0');
INSERT INTO `tk_cities` VALUES('411602','411600','川汇区','河南省-周口市-川汇区','川汇区','周口市','河南省','3','466000','0394','','','chuanhuiqu','CHQ','0');
INSERT INTO `tk_cities` VALUES('411621','411600','扶沟县','河南省-周口市-扶沟县','扶沟县','周口市','河南省','3','461300','0394','','','fugouxian','FGX','0');
INSERT INTO `tk_cities` VALUES('411622','411600','西华县','河南省-周口市-西华县','西华县','周口市','河南省','3','466600','0394','','','xihuaxian','XHX','0');
INSERT INTO `tk_cities` VALUES('411623','411600','商水县','河南省-周口市-商水县','商水县','周口市','河南省','3','466100','0394','','','shangshuixian','SSX','0');
INSERT INTO `tk_cities` VALUES('411624','411600','沈丘县','河南省-周口市-沈丘县','沈丘县','周口市','河南省','3','466300','0394','','','shenqiuxian','SQX','0');
INSERT INTO `tk_cities` VALUES('411625','411600','郸城县','河南省-周口市-郸城县','郸城县','周口市','河南省','3','477150','0394','','','danchengxian','DCX','0');
INSERT INTO `tk_cities` VALUES('411626','411600','淮阳县','河南省-周口市-淮阳县','淮阳县','周口市','河南省','3','466700','0394','','','huaiyangxian','HYX','0');
INSERT INTO `tk_cities` VALUES('411627','411600','太康县','河南省-周口市-太康县','太康县','周口市','河南省','3','475400','0394','','','taikangxian','TKX','0');
INSERT INTO `tk_cities` VALUES('411628','411600','鹿邑县','河南省-周口市-鹿邑县','鹿邑县','周口市','河南省','3','477200','0394','','','luyixian','LYX','0');
INSERT INTO `tk_cities` VALUES('411681','411600','项城市','河南省-周口市-项城市','项城市','周口市','河南省','3','466200','0394','','','xiangchengshi','XCS','0');
INSERT INTO `tk_cities` VALUES('411702','411700','驿城区','河南省-驻马店市-驿城区','驿城区','驻马店市','河南省','3','463000','0396','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('411721','411700','西平县','河南省-驻马店市-西平县','西平县','驻马店市','河南省','3','463900','0396','','','xipingxian','XPX','0');
INSERT INTO `tk_cities` VALUES('411722','411700','上蔡县','河南省-驻马店市-上蔡县','上蔡县','驻马店市','河南省','3','463800','0396','','','shangcaixian','SCX','0');
INSERT INTO `tk_cities` VALUES('411723','411700','平舆县','河南省-驻马店市-平舆县','平舆县','驻马店市','河南省','3','463400','0396','','','pingyuxian','PYX','0');
INSERT INTO `tk_cities` VALUES('411724','411700','正阳县','河南省-驻马店市-正阳县','正阳县','驻马店市','河南省','3','463600','0396','','','zhengyangxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('411725','411700','确山县','河南省-驻马店市-确山县','确山县','驻马店市','河南省','3','463200','0396','','','queshanxian','QSX','0');
INSERT INTO `tk_cities` VALUES('411726','411700','泌阳县','河南省-驻马店市-泌阳县','泌阳县','驻马店市','河南省','3','463700','0396','','','miyangxian','MYX','0');
INSERT INTO `tk_cities` VALUES('411727','411700','汝南县','河南省-驻马店市-汝南县','汝南县','驻马店市','河南省','3','463300','0396','','','runanxian','RNX','0');
INSERT INTO `tk_cities` VALUES('411728','411700','遂平县','河南省-驻马店市-遂平县','遂平县','驻马店市','河南省','3','463100','0396','','','suipingxian','SPX','0');
INSERT INTO `tk_cities` VALUES('411729','411700','新蔡县','河南省-驻马店市-新蔡县','新蔡县','驻马店市','河南省','3','463500','0396','','','xincaixian','XCX','0');
INSERT INTO `tk_cities` VALUES('419001','','济源市','河南省-省直辖-济源市','济源市','省直辖','河南省','3','','','','','jiyuanshi','JYS','0');
INSERT INTO `tk_cities` VALUES('420000','0','湖北省','湖北省','','','湖北省','1','','','','','hubeisheng','HBS','0');
INSERT INTO `tk_cities` VALUES('420100','420000','武汉市','湖北省-武汉市','','武汉市','湖北省','2','430000','027','','','wuhanshi','WHS','0');
INSERT INTO `tk_cities` VALUES('420200','420000','黄石市','湖北省-黄石市','','黄石市','湖北省','2','435000','0714','','','huangshishi','HSS','1');
INSERT INTO `tk_cities` VALUES('420300','420000','十堰市','湖北省-十堰市','','十堰市','湖北省','2','442000','0719','','','shiyanshi','SYS','1');
INSERT INTO `tk_cities` VALUES('420500','420000','宜昌市','湖北省-宜昌市','','宜昌市','湖北省','2','443000','0717','','','yichangshi','YCS','1');
INSERT INTO `tk_cities` VALUES('420600','420000','襄阳市','湖北省-襄阳市','','襄阳市','湖北省','2','441000','0710','','','xiangyangshi','XYS','1');
INSERT INTO `tk_cities` VALUES('420700','420000','鄂州市','湖北省-鄂州市','','鄂州市','湖北省','2','436000','0711','','','ezhoushi','EZS','1');
INSERT INTO `tk_cities` VALUES('420800','420000','荆门市','湖北省-荆门市','','荆门市','湖北省','2','448000','0724','','','jingmenshi','JMS','1');
INSERT INTO `tk_cities` VALUES('420900','420000','孝感市','湖北省-孝感市','','孝感市','湖北省','2','432000','0712','','','xiaoganshi','XGS','1');
INSERT INTO `tk_cities` VALUES('421000','420000','荆州市','湖北省-荆州市','','荆州市','湖北省','2','434000','0716','','','jingzhoushi','JZS','1');
INSERT INTO `tk_cities` VALUES('421100','420000','黄冈市','湖北省-黄冈市','','黄冈市','湖北省','2','438000','0713','','','huanggangshi','HGS','1');
INSERT INTO `tk_cities` VALUES('421200','420000','咸宁市','湖北省-咸宁市','','咸宁市','湖北省','2','437000','0715','','','xianningshi','XNS','1');
INSERT INTO `tk_cities` VALUES('421300','420000','随州市','湖北省-随州市','','随州市','湖北省','2','441300','0722','','','suizhoushi','SZS','1');
INSERT INTO `tk_cities` VALUES('422800','420000','恩施土家族苗族自治州 ','湖北省-恩施土家族苗族自治州 ','','恩施土家族苗族自治州 ','湖北省','2','445000','0718','','','enshitujiazumiaozuzizhizhou','ESTJZMZZZZ','1');
INSERT INTO `tk_cities` VALUES('429000','420000','省直辖','湖北省-省直辖','','省直辖','湖北省','2','433000','0728','','','shengzhixia','SZX','0');
INSERT INTO `tk_cities` VALUES('420102','420100','江岸区','湖北省-武汉市-江岸区','江岸区','武汉市','湖北省','3','430014','027','','','jianganqu','JAQ','0');
INSERT INTO `tk_cities` VALUES('420103','420100','江汉区','湖北省-武汉市-江汉区','江汉区','武汉市','湖北省','3','430000','027','','','jianghanqu','JHQ','0');
INSERT INTO `tk_cities` VALUES('420104','420100','硚口区','湖北省-武汉市-硚口区','硚口区','武汉市','湖北省','3','430000','027','','','changkouqu','CKQ','0');
INSERT INTO `tk_cities` VALUES('420105','420100','汉阳区','湖北省-武汉市-汉阳区','汉阳区','武汉市','湖北省','3','430050','027','','','hanyangqu','HYQ','0');
INSERT INTO `tk_cities` VALUES('420106','420100','武昌区','湖北省-武汉市-武昌区','武昌区','武汉市','湖北省','3','430000','027','','','wuchangqu','WCQ','0');
INSERT INTO `tk_cities` VALUES('420107','420100','青山区','湖北省-武汉市-青山区','青山区','武汉市','湖北省','3','430080','027','','','qingshanqu','QSQ','0');
INSERT INTO `tk_cities` VALUES('420111','420100','洪山区','湖北省-武汉市-洪山区','洪山区','武汉市','湖北省','3','430070','027','','','hongshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('420112','420100','东西湖区','湖北省-武汉市-东西湖区','东西湖区','武汉市','湖北省','3','430040','027','','','dongxihuqu','DXHQ','0');
INSERT INTO `tk_cities` VALUES('420113','420100','汉南区','湖北省-武汉市-汉南区','汉南区','武汉市','湖北省','3','430090','027','','','hannanqu','HNQ','0');
INSERT INTO `tk_cities` VALUES('420114','420100','蔡甸区','湖北省-武汉市-蔡甸区','蔡甸区','武汉市','湖北省','3','430100','027','','','caidianqu','CDQ','0');
INSERT INTO `tk_cities` VALUES('420115','420100','江夏区','湖北省-武汉市-江夏区','江夏区','武汉市','湖北省','3','430200','027','','','jiangxiaqu','JXQ','0');
INSERT INTO `tk_cities` VALUES('420116','420100','黄陂区','湖北省-武汉市-黄陂区','黄陂区','武汉市','湖北省','3','432200','027','','','huangqu','HQ','0');
INSERT INTO `tk_cities` VALUES('420117','420100','新洲区','湖北省-武汉市-新洲区','新洲区','武汉市','湖北省','3','431400','027','','','xinzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('420202','420200','黄石港区','湖北省-黄石市-黄石港区','黄石港区','黄石市','湖北省','3','435000','0714','','','huangshigangqu','HSGQ','0');
INSERT INTO `tk_cities` VALUES('420203','420200','西塞山区','湖北省-黄石市-西塞山区','西塞山区','黄石市','湖北省','3','435000','0714','','','xisaishanqu','XSSQ','0');
INSERT INTO `tk_cities` VALUES('420204','420200','下陆区','湖北省-黄石市-下陆区','下陆区','黄石市','湖北省','3','435000','0714','','','xialuqu','XLQ','0');
INSERT INTO `tk_cities` VALUES('420205','420200','铁山区','湖北省-黄石市-铁山区','铁山区','黄石市','湖北省','3','435000','0714','','','tieshanqu','TSQ','0');
INSERT INTO `tk_cities` VALUES('420222','420200','阳新县','湖北省-黄石市-阳新县','阳新县','黄石市','湖北省','3','435200','0714','','','yangxinxian','YXX','0');
INSERT INTO `tk_cities` VALUES('420281','420200','大冶市','湖北省-黄石市-大冶市','大冶市','黄石市','湖北省','3','435100','0714','','','dayeshi','DYS','0');
INSERT INTO `tk_cities` VALUES('420302','420300','茅箭区','湖北省-十堰市-茅箭区','茅箭区','十堰市','湖北省','3','442000','0719','','','maojianqu','MJQ','0');
INSERT INTO `tk_cities` VALUES('420303','420300','张湾区','湖北省-十堰市-张湾区','张湾区','十堰市','湖北省','3','442000','0719','','','zhangwanqu','ZWQ','0');
INSERT INTO `tk_cities` VALUES('420321','420300','郧县','湖北省-十堰市-郧县','郧县','十堰市','湖北省','3','442500','0719','','','yunxian','YX','0');
INSERT INTO `tk_cities` VALUES('420322','420300','郧西县','湖北省-十堰市-郧西县','郧西县','十堰市','湖北省','3','442600','0719','','','yunxixian','YXX','0');
INSERT INTO `tk_cities` VALUES('420323','420300','竹山县','湖北省-十堰市-竹山县','竹山县','十堰市','湖北省','3','442200','0719','','','zhushanxian','ZSX','0');
INSERT INTO `tk_cities` VALUES('420324','420300','竹溪县','湖北省-十堰市-竹溪县','竹溪县','十堰市','湖北省','3','442300','0719','','','zhuxixian','ZXX','0');
INSERT INTO `tk_cities` VALUES('420325','420300','房县','湖北省-十堰市-房县','房县','十堰市','湖北省','3','442100','0719','','','fangxian','FX','0');
INSERT INTO `tk_cities` VALUES('420381','420300','丹江口市','湖北省-十堰市-丹江口市','丹江口市','十堰市','湖北省','3','442700','0719','','','danjiangkoushi','DJKS','0');
INSERT INTO `tk_cities` VALUES('420502','420500','西陵区','湖北省-宜昌市-西陵区','西陵区','宜昌市','湖北省','3','443000','0717','','','xilingqu','XLQ','0');
INSERT INTO `tk_cities` VALUES('420503','420500','伍家岗区','湖北省-宜昌市-伍家岗区','伍家岗区','宜昌市','湖北省','3','443000','0717','','','wujiagangqu','WJGQ','0');
INSERT INTO `tk_cities` VALUES('420504','420500','点军区','湖北省-宜昌市-点军区','点军区','宜昌市','湖北省','3','443000','0717','','','dianjunqu','DJQ','0');
INSERT INTO `tk_cities` VALUES('420505','420500','猇亭区','湖北省-宜昌市-猇亭区','猇亭区','宜昌市','湖北省','3','443000','0717','','','tingqu','TQ','0');
INSERT INTO `tk_cities` VALUES('420506','420500','夷陵区','湖北省-宜昌市-夷陵区','夷陵区','宜昌市','湖北省','3','443100','0717','','','yilingqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('420525','420500','远安县','湖北省-宜昌市-远安县','远安县','宜昌市','湖北省','3','444200','0717','','','yuananxian','YAX','0');
INSERT INTO `tk_cities` VALUES('420526','420500','兴山县','湖北省-宜昌市-兴山县','兴山县','宜昌市','湖北省','3','443700','0717','','','xingshanxian','XSX','0');
INSERT INTO `tk_cities` VALUES('420527','420500','秭归县','湖北省-宜昌市-秭归县','秭归县','宜昌市','湖北省','3','443600','0717','','','guixian','GX','0');
INSERT INTO `tk_cities` VALUES('420528','420500','长阳土家族自治县','湖北省-宜昌市-长阳土家族自治县','长阳土家族自治县','宜昌市','湖北省','3','443500','0717','','','changyangtujiazuzizhixian','CYTJZZZX','0');
INSERT INTO `tk_cities` VALUES('420529','420500','五峰土家族自治县','湖北省-宜昌市-五峰土家族自治县','五峰土家族自治县','宜昌市','湖北省','3','443400','0717','','','wufengtujiazuzizhixian','WFTJZZZX','0');
INSERT INTO `tk_cities` VALUES('420581','420500','宜都市','湖北省-宜昌市-宜都市','宜都市','宜昌市','湖北省','3','443000','0717','','','yidushi','YDS','0');
INSERT INTO `tk_cities` VALUES('420582','420500','当阳市','湖北省-宜昌市-当阳市','当阳市','宜昌市','湖北省','3','444100','0717','','','dangyangshi','DYS','0');
INSERT INTO `tk_cities` VALUES('420583','420500','枝江市','湖北省-宜昌市-枝江市','枝江市','宜昌市','湖北省','3','443200','0717','','','zhijiangshi','ZJS','0');
INSERT INTO `tk_cities` VALUES('420602','420600','襄城区','湖北省-襄阳市-襄城区','襄城区','襄阳市','湖北省','3','441000','0710','','','xiangchengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('420606','420600','樊城区','湖北省-襄阳市-樊城区','樊城区','襄阳市','湖北省','3','441000','0710','','','fanchengqu','FCQ','0');
INSERT INTO `tk_cities` VALUES('420607','420600','襄州区','湖北省-襄阳市-襄州区','襄州区','襄阳市','湖北省','3','441100','0710','','','xiangzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('420624','420600','南漳县','湖北省-襄阳市-南漳县','南漳县','襄阳市','湖北省','3','441500','0710','','','nanzhangxian','NZX','0');
INSERT INTO `tk_cities` VALUES('420625','420600','谷城县','湖北省-襄阳市-谷城县','谷城县','襄阳市','湖北省','3','441700','0710','','','guchengxian','GCX','0');
INSERT INTO `tk_cities` VALUES('420626','420600','保康县','湖北省-襄阳市-保康县','保康县','襄阳市','湖北省','3','441600','0710','','','baokangxian','BKX','0');
INSERT INTO `tk_cities` VALUES('420682','420600','老河口市','湖北省-襄阳市-老河口市','老河口市','襄阳市','湖北省','3','441800','0710','','','laohekoushi','LHKS','0');
INSERT INTO `tk_cities` VALUES('420683','420600','枣阳市','湖北省-襄阳市-枣阳市','枣阳市','襄阳市','湖北省','3','441200','0710','','','zaoyangshi','ZYS','0');
INSERT INTO `tk_cities` VALUES('420684','420600','宜城市','湖北省-襄阳市-宜城市','宜城市','襄阳市','湖北省','3','441400','0710','','','yichengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('420702','420700','梁子湖区','湖北省-鄂州市-梁子湖区','梁子湖区','鄂州市','湖北省','3','436000','0711','','','liangzihuqu','LZHQ','0');
INSERT INTO `tk_cities` VALUES('420703','420700','华容区','湖北省-鄂州市-华容区','华容区','鄂州市','湖北省','3','436000','0711','','','huarongqu','HRQ','0');
INSERT INTO `tk_cities` VALUES('420704','420700','鄂城区','湖北省-鄂州市-鄂城区','鄂城区','鄂州市','湖北省','3','436000','0711','','','echengqu','ECQ','0');
INSERT INTO `tk_cities` VALUES('420802','420800','东宝区','湖北省-荆门市-东宝区','东宝区','荆门市','湖北省','3','448000','0724','','','dongbaoqu','DBQ','0');
INSERT INTO `tk_cities` VALUES('420804','420800','掇刀区','湖北省-荆门市-掇刀区','掇刀区','荆门市','湖北省','3','448000','0724','','','duodaoqu','DDQ','0');
INSERT INTO `tk_cities` VALUES('420821','420800','京山县','湖北省-荆门市-京山县','京山县','荆门市','湖北省','3','431800','0724','','','jingshanxian','JSX','0');
INSERT INTO `tk_cities` VALUES('420822','420800','沙洋县','湖北省-荆门市-沙洋县','沙洋县','荆门市','湖北省','3','448200','0724','','','shayangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('420881','420800','钟祥市','湖北省-荆门市-钟祥市','钟祥市','荆门市','湖北省','3','431900','0724','','','zhongxiangshi','ZXS','0');
INSERT INTO `tk_cities` VALUES('420902','420900','孝南区','湖北省-孝感市-孝南区','孝南区','孝感市','湖北省','3','432100','0712','','','xiaonanqu','XNQ','0');
INSERT INTO `tk_cities` VALUES('420921','420900','孝昌县','湖北省-孝感市-孝昌县','孝昌县','孝感市','湖北省','3','432900','0712','','','xiaochangxian','XCX','0');
INSERT INTO `tk_cities` VALUES('420922','420900','大悟县','湖北省-孝感市-大悟县','大悟县','孝感市','湖北省','3','432800','0712','','','dawuxian','DWX','0');
INSERT INTO `tk_cities` VALUES('420923','420900','云梦县','湖北省-孝感市-云梦县','云梦县','孝感市','湖北省','3','432500','0712','','','yunmengxian','YMX','0');
INSERT INTO `tk_cities` VALUES('420981','420900','应城市','湖北省-孝感市-应城市','应城市','孝感市','湖北省','3','432400','0712','','','yingchengshi','YCS','0');
INSERT INTO `tk_cities` VALUES('420982','420900','安陆市','湖北省-孝感市-安陆市','安陆市','孝感市','湖北省','3','432600','0712','','','anlushi','ALS','0');
INSERT INTO `tk_cities` VALUES('420984','420900','汉川市','湖北省-孝感市-汉川市','汉川市','孝感市','湖北省','3','432300','0712','','','hanchuanshi','HCS','0');
INSERT INTO `tk_cities` VALUES('421002','421000','沙市区','湖北省-荆州市-沙市区','沙市区','荆州市','湖北省','3','434000','0716','','','shashiqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('421003','421000','荆州区','湖北省-荆州市-荆州区','荆州区','荆州市','湖北省','3','434020','0716','','','jingzhouqu','JZQ','0');
INSERT INTO `tk_cities` VALUES('421022','421000','公安县','湖北省-荆州市-公安县','公安县','荆州市','湖北省','3','434300','0716','','','gonganxian','GAX','0');
INSERT INTO `tk_cities` VALUES('421023','421000','监利县','湖北省-荆州市-监利县','监利县','荆州市','湖北省','3','433300','0716','','','jianlixian','JLX','0');
INSERT INTO `tk_cities` VALUES('421024','421000','江陵县','湖北省-荆州市-江陵县','江陵县','荆州市','湖北省','3','434100','0716','','','jianglingxian','JLX','0');
INSERT INTO `tk_cities` VALUES('421081','421000','石首市','湖北省-荆州市-石首市','石首市','荆州市','湖北省','3','434400','0716','','','shishoushi','SSS','0');
INSERT INTO `tk_cities` VALUES('421083','421000','洪湖市','湖北省-荆州市-洪湖市','洪湖市','荆州市','湖北省','3','433200','0716','','','honghushi','HHS','0');
INSERT INTO `tk_cities` VALUES('421087','421000','松滋市','湖北省-荆州市-松滋市','松滋市','荆州市','湖北省','3','434200','0716','','','songzishi','SZS','0');
INSERT INTO `tk_cities` VALUES('421102','421100','黄州区','湖北省-黄冈市-黄州区','黄州区','黄冈市','湖北省','3','438000','0713','','','huangzhouqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('421121','421100','团风县','湖北省-黄冈市-团风县','团风县','黄冈市','湖北省','3','438000','0713','','','tuanfengxian','TFX','0');
INSERT INTO `tk_cities` VALUES('421122','421100','红安县','湖北省-黄冈市-红安县','红安县','黄冈市','湖北省','3','438400','0713','','','honganxian','HAX','0');
INSERT INTO `tk_cities` VALUES('421123','421100','罗田县','湖北省-黄冈市-罗田县','罗田县','黄冈市','湖北省','3','438600','0713','','','luotianxian','LTX','0');
INSERT INTO `tk_cities` VALUES('421124','421100','英山县','湖北省-黄冈市-英山县','英山县','黄冈市','湖北省','3','438700','0713','','','yingshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('421125','421100','浠水县','湖北省-黄冈市-浠水县','浠水县','黄冈市','湖北省','3','438200','0713','','','shuixian','SX','0');
INSERT INTO `tk_cities` VALUES('421126','421100','蕲春县','湖北省-黄冈市-蕲春县','蕲春县','黄冈市','湖北省','3','435300','0713','','','chunxian','CX','0');
INSERT INTO `tk_cities` VALUES('421127','421100','黄梅县','湖北省-黄冈市-黄梅县','黄梅县','黄冈市','湖北省','3','435500','0713','','','huangmeixian','HMX','0');
INSERT INTO `tk_cities` VALUES('421181','421100','麻城市','湖北省-黄冈市-麻城市','麻城市','黄冈市','湖北省','3','438300','0713','','','machengshi','MCS','0');
INSERT INTO `tk_cities` VALUES('421182','421100','武穴市','湖北省-黄冈市-武穴市','武穴市','黄冈市','湖北省','3','435400','0713','','','wuxueshi','WXS','0');
INSERT INTO `tk_cities` VALUES('421202','421200','咸安区','湖北省-咸宁市-咸安区','咸安区','咸宁市','湖北省','3','437000','0715','','','xiananqu','XAQ','0');
INSERT INTO `tk_cities` VALUES('421221','421200','嘉鱼县','湖北省-咸宁市-嘉鱼县','嘉鱼县','咸宁市','湖北省','3','437200','0715','','','jiayuxian','JYX','0');
INSERT INTO `tk_cities` VALUES('421222','421200','通城县','湖北省-咸宁市-通城县','通城县','咸宁市','湖北省','3','437400','0715','','','tongchengxian','TCX','0');
INSERT INTO `tk_cities` VALUES('421223','421200','崇阳县','湖北省-咸宁市-崇阳县','崇阳县','咸宁市','湖北省','3','437500','0715','','','chongyangxian','CYX','0');
INSERT INTO `tk_cities` VALUES('421224','421200','通山县','湖北省-咸宁市-通山县','通山县','咸宁市','湖北省','3','437600','0715','','','tongshanxian','TSX','0');
INSERT INTO `tk_cities` VALUES('421281','421200','赤壁市','湖北省-咸宁市-赤壁市','赤壁市','咸宁市','湖北省','3','437300','0715','','','chibishi','CBS','0');
INSERT INTO `tk_cities` VALUES('421303','','曾都区','湖北省-随州市-曾都区','曾都区','随州市','湖北省','3','','','','','zengduqu','ZDQ','0');
INSERT INTO `tk_cities` VALUES('421321','','随县','湖北省-随州市-随县','随县','随州市','湖北省','3','','','','','suixian','SX','0');
INSERT INTO `tk_cities` VALUES('421381','421300','广水市','湖北省-随州市-广水市','广水市','随州市','湖北省','3','432700','0722','','','guangshuishi','GSS','0');
INSERT INTO `tk_cities` VALUES('422801','422800','恩施市','湖北省-恩施土家族苗族自治州 -恩施市','恩施市','恩施土家族苗族自治州 ','湖北省','3','445000','0718','','','enshishi','ESS','0');
INSERT INTO `tk_cities` VALUES('422802','422800','利川市','湖北省-恩施土家族苗族自治州 -利川市','利川市','恩施土家族苗族自治州 ','湖北省','3','445400','0718','','','lichuanshi','LCS','0');
INSERT INTO `tk_cities` VALUES('422822','422800','建始县','湖北省-恩施土家族苗族自治州 -建始县','建始县','恩施土家族苗族自治州 ','湖北省','3','445300','0718','','','jianshixian','JSX','0');
INSERT INTO `tk_cities` VALUES('422823','422800','巴东县','湖北省-恩施土家族苗族自治州 -巴东县','巴东县','恩施土家族苗族自治州 ','湖北省','3','444300','0718','','','badongxian','BDX','0');
INSERT INTO `tk_cities` VALUES('422825','422800','宣恩县','湖北省-恩施土家族苗族自治州 -宣恩县','宣恩县','恩施土家族苗族自治州 ','湖北省','3','445500','0718','','','xuanenxian','XEX','0');
INSERT INTO `tk_cities` VALUES('422826','422800','咸丰县','湖北省-恩施土家族苗族自治州 -咸丰县','咸丰县','恩施土家族苗族自治州 ','湖北省','3','445600','0718','','','xianfengxian','XFX','0');
INSERT INTO `tk_cities` VALUES('422827','422800','来凤县','湖北省-恩施土家族苗族自治州 -来凤县','来凤县','恩施土家族苗族自治州 ','湖北省','3','445700','0718','','','laifengxian','LFX','0');
INSERT INTO `tk_cities` VALUES('422828','422800','鹤峰县','湖北省-恩施土家族苗族自治州 -鹤峰县','鹤峰县','恩施土家族苗族自治州 ','湖北省','3','445800','0718','','','hefengxian','HFX','0');
INSERT INTO `tk_cities` VALUES('429004','429000','仙桃市','湖北省-省直辖-仙桃市','仙桃市','省直辖','湖北省','3','433000','0728','','','xiantaoshi','XTS','0');
INSERT INTO `tk_cities` VALUES('429005','429000','潜江市','湖北省-省直辖-潜江市','潜江市','省直辖','湖北省','3','433100','0728','','','qianjiangshi','QJS','0');
INSERT INTO `tk_cities` VALUES('429006','429000','天门市','湖北省-省直辖-天门市','天门市','省直辖','湖北省','3','431700','0728','','','tianmenshi','TMS','0');
INSERT INTO `tk_cities` VALUES('429021','429000','神农架林区','湖北省-省直辖-神农架林区','神农架林区','省直辖','湖北省','3','442400','0719','','','shennongjialinqu','SNJLQ','0');
INSERT INTO `tk_cities` VALUES('430000','0','湖南省','湖南省','','','湖南省','1','','','','','hunansheng','HNS','0');
INSERT INTO `tk_cities` VALUES('430100','430000','长沙市','湖南省-长沙市','','长沙市','湖南省','2','410000','0731','','','changshashi','CSS','1');
INSERT INTO `tk_cities` VALUES('430200','430000','株洲市','湖南省-株洲市','','株洲市','湖南省','2','412000','0733','','','zhuzhoushi','ZZS','1');
INSERT INTO `tk_cities` VALUES('430300','430000','湘潭市','湖南省-湘潭市','','湘潭市','湖南省','2','411100','0732','','','xiangtanshi','XTS','1');
INSERT INTO `tk_cities` VALUES('430400','430000','衡阳市','湖南省-衡阳市','','衡阳市','湖南省','2','421000','0734','','','hengyangshi','HYS','1');
INSERT INTO `tk_cities` VALUES('430500','430000','邵阳市','湖南省-邵阳市','','邵阳市','湖南省','2','422000','0739','','','shaoyangshi','SYS','0');
INSERT INTO `tk_cities` VALUES('430600','430000','岳阳市','湖南省-岳阳市','','岳阳市','湖南省','2','414000','0730','','','yueyangshi','YYS','0');
INSERT INTO `tk_cities` VALUES('430700','430000','常德市','湖南省-常德市','','常德市','湖南省','2','415000','0736','','','changdeshi','CDS','0');
INSERT INTO `tk_cities` VALUES('430800','430000','张家界市','湖南省-张家界市','','张家界市','湖南省','2','427000','0744','','','zhangjiajieshi','ZJJS','0');
INSERT INTO `tk_cities` VALUES('430900','430000','益阳市','湖南省-益阳市','','益阳市','湖南省','2','413000','0737','','','yiyangshi','YYS','0');
INSERT INTO `tk_cities` VALUES('431000','430000','郴州市','湖南省-郴州市','','郴州市','湖南省','2','423000','0735','','','chenzhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('431100','430000','永州市','湖南省-永州市','','永州市','湖南省','2','425000','0746','','','yongzhoushi','YZS','0');
INSERT INTO `tk_cities` VALUES('431200','430000','怀化市','湖南省-怀化市','','怀化市','湖南省','2','418000','0745','','','huaihuashi','HHS','0');
INSERT INTO `tk_cities` VALUES('431300','430000','娄底市','湖南省-娄底市','','娄底市','湖南省','2','417000','0738','','','loudishi','LDS','0');
INSERT INTO `tk_cities` VALUES('433100','430000','湘西土家族苗族自治州 ','湖南省-湘西土家族苗族自治州 ','','湘西土家族苗族自治州 ','湖南省','2','416000','0743','','','xiangxitujiazumiaozuzizhizhou','XXTJZMZZZZ','0');
INSERT INTO `tk_cities` VALUES('430102','430100','芙蓉区','湖南省-长沙市-芙蓉区','芙蓉区','长沙市','湖南省','3','410000','0731','','','rongqu','RQ','0');
INSERT INTO `tk_cities` VALUES('430103','430100','天心区','湖南省-长沙市-天心区','天心区','长沙市','湖南省','3','410000','0731','','','tianxinqu','TXQ','0');
INSERT INTO `tk_cities` VALUES('430104','430100','岳麓区','湖南省-长沙市-岳麓区','岳麓区','长沙市','湖南省','3','410000','0731','','','yueluqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('430105','430100','开福区','湖南省-长沙市-开福区','开福区','长沙市','湖南省','3','410000','0731','','','kaifuqu','KFQ','0');
INSERT INTO `tk_cities` VALUES('430111','430100','雨花区','湖南省-长沙市-雨花区','雨花区','长沙市','湖南省','3','410000','0731','','','yuhuaqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('430112','','望城区','湖南省-长沙市-望城区','望城区','长沙市','湖南省','3','','','','','wangchengqu','WCQ','0');
INSERT INTO `tk_cities` VALUES('430121','430100','长沙县','湖南省-长沙市-长沙县','长沙县','长沙市','湖南省','3','410100','0731','','','changshaxian','CSX','0');
INSERT INTO `tk_cities` VALUES('430124','430100','宁乡县','湖南省-长沙市-宁乡县','宁乡县','长沙市','湖南省','3','410600','0731','','','ningxiangxian','NXX','0');
INSERT INTO `tk_cities` VALUES('430181','430100','浏阳市','湖南省-长沙市-浏阳市','浏阳市','长沙市','湖南省','3','410300','0731','','','yangshi','YS','0');
INSERT INTO `tk_cities` VALUES('430202','430200','荷塘区','湖南省-株洲市-荷塘区','荷塘区','株洲市','湖南省','3','412000','0733','','','hetangqu','HTQ','0');
INSERT INTO `tk_cities` VALUES('430203','430200','芦淞区','湖南省-株洲市-芦淞区','芦淞区','株洲市','湖南省','3','412000','0733','','','luqu','LQ','0');
INSERT INTO `tk_cities` VALUES('430204','430200','石峰区','湖南省-株洲市-石峰区','石峰区','株洲市','湖南省','3','412000','0733','','','shifengqu','SFQ','0');
INSERT INTO `tk_cities` VALUES('430211','430200','天元区','湖南省-株洲市-天元区','天元区','株洲市','湖南省','3','412000','0733','','','tianyuanqu','TYQ','0');
INSERT INTO `tk_cities` VALUES('430221','430200','株洲县','湖南省-株洲市-株洲县','株洲县','株洲市','湖南省','3','412000','0733','','','zhuzhouxian','ZZX','0');
INSERT INTO `tk_cities` VALUES('430223','430200','攸县','湖南省-株洲市-攸县','攸县','株洲市','湖南省','3','412300','0733','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('430224','430200','茶陵县','湖南省-株洲市-茶陵县','茶陵县','株洲市','湖南省','3','412400','0733','','','chalingxian','CLX','0');
INSERT INTO `tk_cities` VALUES('430225','430200','炎陵县','湖南省-株洲市-炎陵县','炎陵县','株洲市','湖南省','3','412500','0733','','','yanlingxian','YLX','0');
INSERT INTO `tk_cities` VALUES('430281','430200','醴陵市','湖南省-株洲市-醴陵市','醴陵市','株洲市','湖南省','3','412200','0733','','','lingshi','LS','0');
INSERT INTO `tk_cities` VALUES('430302','430300','雨湖区','湖南省-湘潭市-雨湖区','雨湖区','湘潭市','湖南省','3','411100','0732','','','yuhuqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('430304','430300','岳塘区','湖南省-湘潭市-岳塘区','岳塘区','湘潭市','湖南省','3','411100','0732','','','yuetangqu','YTQ','0');
INSERT INTO `tk_cities` VALUES('430321','430300','湘潭县','湖南省-湘潭市-湘潭县','湘潭县','湘潭市','湖南省','3','411200','0732','','','xiangtanxian','XTX','0');
INSERT INTO `tk_cities` VALUES('430381','430300','湘乡市','湖南省-湘潭市-湘乡市','湘乡市','湘潭市','湖南省','3','411400','0732','','','xiangxiangshi','XXS','0');
INSERT INTO `tk_cities` VALUES('430382','430300','韶山市','湖南省-湘潭市-韶山市','韶山市','湘潭市','湖南省','3','411300','0732','','','shaoshanshi','SSS','0');
INSERT INTO `tk_cities` VALUES('430405','430400','珠晖区','湖南省-衡阳市-珠晖区','珠晖区','衡阳市','湖南省','3','421000','0734','','','zhuqu','ZQ','0');
INSERT INTO `tk_cities` VALUES('430406','430400','雁峰区','湖南省-衡阳市-雁峰区','雁峰区','衡阳市','湖南省','3','421000','0734','','','yanfengqu','YFQ','0');
INSERT INTO `tk_cities` VALUES('430407','430400','石鼓区','湖南省-衡阳市-石鼓区','石鼓区','衡阳市','湖南省','3','421000','0734','','','shiguqu','SGQ','0');
INSERT INTO `tk_cities` VALUES('430408','430400','蒸湘区','湖南省-衡阳市-蒸湘区','蒸湘区','衡阳市','湖南省','3','421000','0734','','','zhengxiangqu','ZXQ','0');
INSERT INTO `tk_cities` VALUES('430412','430400','南岳区','湖南省-衡阳市-南岳区','南岳区','衡阳市','湖南省','3','421000','0734','','','nanyuequ','NYQ','0');
INSERT INTO `tk_cities` VALUES('430421','430400','衡阳县','湖南省-衡阳市-衡阳县','衡阳县','衡阳市','湖南省','3','421200','0734','','','hengyangxian','HYX','0');
INSERT INTO `tk_cities` VALUES('430422','430400','衡南县','湖南省-衡阳市-衡南县','衡南县','衡阳市','湖南省','3','421100','0734','','','hengnanxian','HNX','0');
INSERT INTO `tk_cities` VALUES('430423','430400','衡山县','湖南省-衡阳市-衡山县','衡山县','衡阳市','湖南省','3','421300','0734','','','hengshanxian','HSX','0');
INSERT INTO `tk_cities` VALUES('430424','430400','衡东县','湖南省-衡阳市-衡东县','衡东县','衡阳市','湖南省','3','421400','0734','','','hengdongxian','HDX','0');
INSERT INTO `tk_cities` VALUES('430426','430400','祁东县','湖南省-衡阳市-祁东县','祁东县','衡阳市','湖南省','3','421600','0734','','','qidongxian','QDX','0');
INSERT INTO `tk_cities` VALUES('430481','430400','耒阳市','湖南省-衡阳市-耒阳市','耒阳市','衡阳市','湖南省','3','421800','0734','','','yangshi','YS','0');
INSERT INTO `tk_cities` VALUES('430482','430400','常宁市','湖南省-衡阳市-常宁市','常宁市','衡阳市','湖南省','3','421500','0734','','','changningshi','CNS','0');
INSERT INTO `tk_cities` VALUES('430502','430500','双清区','湖南省-邵阳市-双清区','双清区','邵阳市','湖南省','3','422000','0739','','','shuangqingqu','SQQ','0');
INSERT INTO `tk_cities` VALUES('430503','430500','大祥区','湖南省-邵阳市-大祥区','大祥区','邵阳市','湖南省','3','422000','0739','','','daxiangqu','DXQ','0');
INSERT INTO `tk_cities` VALUES('430511','430500','北塔区','湖南省-邵阳市-北塔区','北塔区','邵阳市','湖南省','3','422000','0739','','','beitaqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('430521','430500','邵东县','湖南省-邵阳市-邵东县','邵东县','邵阳市','湖南省','3','422800','0739','','','shaodongxian','SDX','0');
INSERT INTO `tk_cities` VALUES('430522','430500','新邵县','湖南省-邵阳市-新邵县','新邵县','邵阳市','湖南省','3','422900','0739','','','xinshaoxian','XSX','0');
INSERT INTO `tk_cities` VALUES('430523','430500','邵阳县','湖南省-邵阳市-邵阳县','邵阳县','邵阳市','湖南省','3','422100','0739','','','shaoyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('430524','430500','隆回县','湖南省-邵阳市-隆回县','隆回县','邵阳市','湖南省','3','422200','0739','','','longhuixian','LHX','0');
INSERT INTO `tk_cities` VALUES('430525','430500','洞口县','湖南省-邵阳市-洞口县','洞口县','邵阳市','湖南省','3','422300','0739','','','dongkouxian','DKX','0');
INSERT INTO `tk_cities` VALUES('430527','430500','绥宁县','湖南省-邵阳市-绥宁县','绥宁县','邵阳市','湖南省','3','422600','0739','','','suiningxian','SNX','0');
INSERT INTO `tk_cities` VALUES('430528','430500','新宁县','湖南省-邵阳市-新宁县','新宁县','邵阳市','湖南省','3','422700','0739','','','xinningxian','XNX','0');
INSERT INTO `tk_cities` VALUES('430529','430500','城步苗族自治县','湖南省-邵阳市-城步苗族自治县','城步苗族自治县','邵阳市','湖南省','3','422500','0739','','','chengbumiaozuzizhixian','CBMZZZX','0');
INSERT INTO `tk_cities` VALUES('430581','430500','武冈市','湖南省-邵阳市-武冈市','武冈市','邵阳市','湖南省','3','422400','0739','','','wugangshi','WGS','0');
INSERT INTO `tk_cities` VALUES('430602','430600','岳阳楼区','湖南省-岳阳市-岳阳楼区','岳阳楼区','岳阳市','湖南省','3','414000','0730','','','yueyanglouqu','YYLQ','0');
INSERT INTO `tk_cities` VALUES('430603','430600','云溪区','湖南省-岳阳市-云溪区','云溪区','岳阳市','湖南省','3','414000','0730','','','yunxiqu','YXQ','0');
INSERT INTO `tk_cities` VALUES('430611','430600','君山区','湖南省-岳阳市-君山区','君山区','岳阳市','湖南省','3','414000','0730','','','junshanqu','JSQ','0');
INSERT INTO `tk_cities` VALUES('430621','430600','岳阳县','湖南省-岳阳市-岳阳县','岳阳县','岳阳市','湖南省','3','414100','0730','','','yueyangxian','YYX','0');
INSERT INTO `tk_cities` VALUES('430623','430600','华容县','湖南省-岳阳市-华容县','华容县','岳阳市','湖南省','3','414200','0730','','','huarongxian','HRX','0');
INSERT INTO `tk_cities` VALUES('430624','430600','湘阴县','湖南省-岳阳市-湘阴县','湘阴县','岳阳市','湖南省','3','410500','0730','','','xiangyinxian','XYX','0');
INSERT INTO `tk_cities` VALUES('430626','430600','平江县','湖南省-岳阳市-平江县','平江县','岳阳市','湖南省','3','410400','0730','','','pingjiangxian','PJX','0');
INSERT INTO `tk_cities` VALUES('430681','430600','汨罗市','湖南省-岳阳市-汨罗市','汨罗市','岳阳市','湖南省','3','414400','0730','','','luoshi','LS','0');
INSERT INTO `tk_cities` VALUES('430682','430600','临湘市','湖南省-岳阳市-临湘市','临湘市','岳阳市','湖南省','3','414300','0730','','','linxiangshi','LXS','0');
INSERT INTO `tk_cities` VALUES('430702','430700','武陵区','湖南省-常德市-武陵区','武陵区','常德市','湖南省','3','415000','0736','','','wulingqu','WLQ','0');
INSERT INTO `tk_cities` VALUES('430703','430700','鼎城区','湖南省-常德市-鼎城区','鼎城区','常德市','湖南省','3','415100','0736','','','dingchengqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('430721','430700','安乡县','湖南省-常德市-安乡县','安乡县','常德市','湖南省','3','415600','0736','','','anxiangxian','AXX','0');
INSERT INTO `tk_cities` VALUES('430722','430700','汉寿县','湖南省-常德市-汉寿县','汉寿县','常德市','湖南省','3','415900','0736','','','hanshouxian','HSX','0');
INSERT INTO `tk_cities` VALUES('430723','430700','澧县','湖南省-常德市-澧县','澧县','常德市','湖南省','3','415500','0736','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('430724','430700','临澧县','湖南省-常德市-临澧县','临澧县','常德市','湖南省','3','415200','0736','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('430725','430700','桃源县','湖南省-常德市-桃源县','桃源县','常德市','湖南省','3','415700','0736','','','taoyuanxian','TYX','0');
INSERT INTO `tk_cities` VALUES('430726','430700','石门县','湖南省-常德市-石门县','石门县','常德市','湖南省','3','415300','0736','','','shimenxian','SMX','0');
INSERT INTO `tk_cities` VALUES('430781','430700','津市市','湖南省-常德市-津市市','津市市','常德市','湖南省','3','415400','0736','','','jinshishi','JSS','0');
INSERT INTO `tk_cities` VALUES('430802','430800','永定区','湖南省-张家界市-永定区','永定区','张家界市','湖南省','3','427000','0744','','','yongdingqu','YDQ','0');
INSERT INTO `tk_cities` VALUES('430811','430800','武陵源区','湖南省-张家界市-武陵源区','武陵源区','张家界市','湖南省','3','427400','0744','','','wulingyuanqu','WLYQ','0');
INSERT INTO `tk_cities` VALUES('430821','430800','慈利县','湖南省-张家界市-慈利县','慈利县','张家界市','湖南省','3','427200','0744','','','cilixian','CLX','0');
INSERT INTO `tk_cities` VALUES('430822','430800','桑植县','湖南省-张家界市-桑植县','桑植县','张家界市','湖南省','3','427100','0744','','','sangzhixian','SZX','0');
INSERT INTO `tk_cities` VALUES('430902','430900','资阳区','湖南省-益阳市-资阳区','资阳区','益阳市','湖南省','3','413000','0737','','','ziyangqu','ZYQ','0');
INSERT INTO `tk_cities` VALUES('430903','430900','赫山区','湖南省-益阳市-赫山区','赫山区','益阳市','湖南省','3','413000','0737','','','heshanqu','HSQ','0');
INSERT INTO `tk_cities` VALUES('430921','430900','南县','湖南省-益阳市-南县','南县','益阳市','湖南省','3','413200','0737','','','nanxian','NX','0');
INSERT INTO `tk_cities` VALUES('430922','430900','桃江县','湖南省-益阳市-桃江县','桃江县','益阳市','湖南省','3','413400','0737','','','taojiangxian','TJX','0');
INSERT INTO `tk_cities` VALUES('430923','430900','安化县','湖南省-益阳市-安化县','安化县','益阳市','湖南省','3','413500','0737','','','anhuaxian','AHX','0');
INSERT INTO `tk_cities` VALUES('430981','430900','沅江市','湖南省-益阳市-沅江市','沅江市','益阳市','湖南省','3','413100','0737','','','jiangshi','JS','0');
INSERT INTO `tk_cities` VALUES('431002','431000','北湖区','湖南省-郴州市-北湖区','北湖区','郴州市','湖南省','3','423000','0735','','','beihuqu','BHQ','0');
INSERT INTO `tk_cities` VALUES('431003','431000','苏仙区','湖南省-郴州市-苏仙区','苏仙区','郴州市','湖南省','3','423000','0735','','','suxianqu','SXQ','0');
INSERT INTO `tk_cities` VALUES('431021','431000','桂阳县','湖南省-郴州市-桂阳县','桂阳县','郴州市','湖南省','3','424400','0735','','','guiyangxian','GYX','0');
INSERT INTO `tk_cities` VALUES('431022','431000','宜章县','湖南省-郴州市-宜章县','宜章县','郴州市','湖南省','3','424200','0735','','','yizhangxian','YZX','0');
INSERT INTO `tk_cities` VALUES('431023','431000','永兴县','湖南省-郴州市-永兴县','永兴县','郴州市','湖南省','3','423300','0735','','','yongxingxian','YXX','0');
INSERT INTO `tk_cities` VALUES('431024','431000','嘉禾县','湖南省-郴州市-嘉禾县','嘉禾县','郴州市','湖南省','3','424500','0735','','','jiahexian','JHX','0');
INSERT INTO `tk_cities` VALUES('431025','431000','临武县','湖南省-郴州市-临武县','临武县','郴州市','湖南省','3','424300','0735','','','linwuxian','LWX','0');
INSERT INTO `tk_cities` VALUES('431026','431000','汝城县','湖南省-郴州市-汝城县','汝城县','郴州市','湖南省','3','424100','0735','','','ruchengxian','RCX','0');
INSERT INTO `tk_cities` VALUES('431027','431000','桂东县','湖南省-郴州市-桂东县','桂东县','郴州市','湖南省','3','423500','0735','','','guidongxian','GDX','0');
INSERT INTO `tk_cities` VALUES('431028','431000','安仁县','湖南省-郴州市-安仁县','安仁县','郴州市','湖南省','3','423600','0735','','','anrenxian','ARX','0');
INSERT INTO `tk_cities` VALUES('431081','431000','资兴市','湖南省-郴州市-资兴市','资兴市','郴州市','湖南省','3','423400','0735','','','zixingshi','ZXS','0');
INSERT INTO `tk_cities` VALUES('431102','431100','零陵区','湖南省-永州市-零陵区','零陵区','永州市','湖南省','3','425000','0746','','','linglingqu','LLQ','0');
INSERT INTO `tk_cities` VALUES('431103','431100','冷水滩区','湖南省-永州市-冷水滩区','冷水滩区','永州市','湖南省','3','425000','0746','','','lengshuitanqu','LSTQ','0');
INSERT INTO `tk_cities` VALUES('431121','431100','祁阳县','湖南省-永州市-祁阳县','祁阳县','永州市','湖南省','3','421700','0746','','','qiyangxian','QYX','0');
INSERT INTO `tk_cities` VALUES('431122','431100','东安县','湖南省-永州市-东安县','东安县','永州市','湖南省','3','425900','0746','','','donganxian','DAX','0');
INSERT INTO `tk_cities` VALUES('431123','431100','双牌县','湖南省-永州市-双牌县','双牌县','永州市','湖南省','3','425200','0746','','','shuangpaixian','SPX','0');
INSERT INTO `tk_cities` VALUES('431124','431100','道县','湖南省-永州市-道县','道县','永州市','湖南省','3','425300','0746','','','daoxian','DX','0');
INSERT INTO `tk_cities` VALUES('431125','431100','江永县','湖南省-永州市-江永县','江永县','永州市','湖南省','3','425400','0746','','','jiangyongxian','JYX','0');
INSERT INTO `tk_cities` VALUES('431126','431100','宁远县','湖南省-永州市-宁远县','宁远县','永州市','湖南省','3','425600','0746','','','ningyuanxian','NYX','0');
INSERT INTO `tk_cities` VALUES('431127','431100','蓝山县','湖南省-永州市-蓝山县','蓝山县','永州市','湖南省','3','425800','0746','','','lanshanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('431128','431100','新田县','湖南省-永州市-新田县','新田县','永州市','湖南省','3','425700','0746','','','xintianxian','XTX','0');
INSERT INTO `tk_cities` VALUES('431129','431100','江华瑶族自治县','湖南省-永州市-江华瑶族自治县','江华瑶族自治县','永州市','湖南省','3','425500','0746','','','jianghuayaozuzizhixian','JHYZZZX','0');
INSERT INTO `tk_cities` VALUES('431202','431200','鹤城区','湖南省-怀化市-鹤城区','鹤城区','怀化市','湖南省','3','418000','0745','','','hechengqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('431221','431200','中方县','湖南省-怀化市-中方县','中方县','怀化市','湖南省','3','418000','0745','','','zhongfangxian','ZFX','0');
INSERT INTO `tk_cities` VALUES('431222','431200','沅陵县','湖南省-怀化市-沅陵县','沅陵县','怀化市','湖南省','3','419600','0745','','','lingxian','LX','0');
INSERT INTO `tk_cities` VALUES('431223','431200','辰溪县','湖南省-怀化市-辰溪县','辰溪县','怀化市','湖南省','3','419500','0745','','','chenxixian','CXX','0');
INSERT INTO `tk_cities` VALUES('431224','431200','溆浦县','湖南省-怀化市-溆浦县','溆浦县','怀化市','湖南省','3','419300','0745','','','puxian','PX','0');
INSERT INTO `tk_cities` VALUES('431225','431200','会同县','湖南省-怀化市-会同县','会同县','怀化市','湖南省','3','418300','0745','','','huitongxian','HTX','0');
INSERT INTO `tk_cities` VALUES('431226','431200','麻阳苗族自治县','湖南省-怀化市-麻阳苗族自治县','麻阳苗族自治县','怀化市','湖南省','3','419400','0745','','','mayangmiaozuzizhixian','MYMZZZX','0');
INSERT INTO `tk_cities` VALUES('431227','431200','新晃侗族自治县','湖南省-怀化市-新晃侗族自治县','新晃侗族自治县','怀化市','湖南省','3','419200','0745','','','xinhuangdongzuzizhixian','XHDZZZX','0');
INSERT INTO `tk_cities` VALUES('431228','431200','芷江侗族自治县','湖南省-怀化市-芷江侗族自治县','芷江侗族自治县','怀化市','湖南省','3','419100','0745','','','jiangdongzuzizhixian','JDZZZX','0');
INSERT INTO `tk_cities` VALUES('431229','431200','靖州苗族侗族自治县','湖南省-怀化市-靖州苗族侗族自治县','靖州苗族侗族自治县','怀化市','湖南省','3','418400','0745','','','jingzhoumiaozudongzuzizhixian','JZMZDZZZX','0');
INSERT INTO `tk_cities` VALUES('431230','431200','通道侗族自治县','湖南省-怀化市-通道侗族自治县','通道侗族自治县','怀化市','湖南省','3','418500','0745','','','tongdaodongzuzizhixian','TDDZZZX','0');
INSERT INTO `tk_cities` VALUES('431281','431200','洪江市','湖南省-怀化市-洪江市','洪江市','怀化市','湖南省','3','418200','0745','','','hongjiangshi','HJS','0');
INSERT INTO `tk_cities` VALUES('431302','431300','娄星区','湖南省-娄底市-娄星区','娄星区','娄底市','湖南省','3','417000','0738','','','louxingqu','LXQ','0');
INSERT INTO `tk_cities` VALUES('431321','431300','双峰县','湖南省-娄底市-双峰县','双峰县','娄底市','湖南省','3','417700','0738','','','shuangfengxian','SFX','0');
INSERT INTO `tk_cities` VALUES('431322','431300','新化县','湖南省-娄底市-新化县','新化县','娄底市','湖南省','3','417600','0738','','','xinhuaxian','XHX','0');
INSERT INTO `tk_cities` VALUES('431381','431300','冷水江市','湖南省-娄底市-冷水江市','冷水江市','娄底市','湖南省','3','417500','0738','','','lengshuijiangshi','LSJS','0');
INSERT INTO `tk_cities` VALUES('431382','431300','涟源市','湖南省-娄底市-涟源市','涟源市','娄底市','湖南省','3','417100','0738','','','lianyuanshi','LYS','0');
INSERT INTO `tk_cities` VALUES('433101','433100','吉首市','湖南省-湘西土家族苗族自治州 -吉首市','吉首市','湘西土家族苗族自治州 ','湖南省','3','416000','0743','','','jishoushi','JSS','0');
INSERT INTO `tk_cities` VALUES('433122','433100','泸溪县','湖南省-湘西土家族苗族自治州 -泸溪县','泸溪县','湘西土家族苗族自治州 ','湖南省','3','416100','0743','','','xixian','XX','0');
INSERT INTO `tk_cities` VALUES('433123','433100','凤凰县','湖南省-湘西土家族苗族自治州 -凤凰县','凤凰县','湘西土家族苗族自治州 ','湖南省','3','416200','0743','','','fenghuangxian','FHX','0');
INSERT INTO `tk_cities` VALUES('433124','433100','花垣县','湖南省-湘西土家族苗族自治州 -花垣县','花垣县','湘西土家族苗族自治州 ','湖南省','3','416400','0743','','','huayuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('433125','433100','保靖县','湖南省-湘西土家族苗族自治州 -保靖县','保靖县','湘西土家族苗族自治州 ','湖南省','3','416500','0743','','','baojingxian','BJX','0');
INSERT INTO `tk_cities` VALUES('433126','433100','古丈县','湖南省-湘西土家族苗族自治州 -古丈县','古丈县','湘西土家族苗族自治州 ','湖南省','3','416300','0743','','','guzhangxian','GZX','0');
INSERT INTO `tk_cities` VALUES('433127','433100','永顺县','湖南省-湘西土家族苗族自治州 -永顺县','永顺县','湘西土家族苗族自治州 ','湖南省','3','416700','0743','','','yongshunxian','YSX','0');
INSERT INTO `tk_cities` VALUES('433130','433100','龙山县','湖南省-湘西土家族苗族自治州 -龙山县','龙山县','湘西土家族苗族自治州 ','湖南省','3','416800','0743','','','longshanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('440000','0','广东省','广东省','','','广东省','1','','','','','guangdongsheng','GDS','0');
INSERT INTO `tk_cities` VALUES('440100','440000','广州市','广东省-广州市','','广州市','广东省','2','510000','020','','','guangzhoushi','GZS','1');
INSERT INTO `tk_cities` VALUES('440200','440000','韶关市','广东省-韶关市','','韶关市','广东省','2','512000','0751','','','shaoguanshi','SGS','1');
INSERT INTO `tk_cities` VALUES('440300','440000','深圳市','广东省-深圳市','','深圳市','广东省','2','518000','0755','','','shenshi','SS','1');
INSERT INTO `tk_cities` VALUES('440400','440000','珠海市','广东省-珠海市','','珠海市','广东省','2','519000','0756','','','zhuhaishi','ZHS','1');
INSERT INTO `tk_cities` VALUES('440500','440000','汕头市','广东省-汕头市','','汕头市','广东省','2','515000','0754','','','shantoushi','STS','0');
INSERT INTO `tk_cities` VALUES('440600','440000','佛山市','广东省-佛山市','','佛山市','广东省','2','528000','0757','','','foshanshi','FSS','0');
INSERT INTO `tk_cities` VALUES('440700','440000','江门市','广东省-江门市','','江门市','广东省','2','529000','0750','','','jiangmenshi','JMS','0');
INSERT INTO `tk_cities` VALUES('440800','440000','湛江市','广东省-湛江市','','湛江市','广东省','2','524000','0759','','','zhanjiangshi','ZJS','0');
INSERT INTO `tk_cities` VALUES('440900','440000','茂名市','广东省-茂名市','','茂名市','广东省','2','525000','0688','','','maomingshi','MMS','0');
INSERT INTO `tk_cities` VALUES('441200','440000','肇庆市','广东省-肇庆市','','肇庆市','广东省','2','526000','0758','','','zhaoqingshi','ZQS','0');
INSERT INTO `tk_cities` VALUES('441300','440000','惠州市','广东省-惠州市','','惠州市','广东省','2','516000','0752','','','huizhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('441400','440000','梅州市','广东省-梅州市','','梅州市','广东省','2','514000','0753','','','meizhoushi','MZS','0');
INSERT INTO `tk_cities` VALUES('441500','440000','汕尾市','广东省-汕尾市','','汕尾市','广东省','2','516600','0660','','','shanweishi','SWS','0');
INSERT INTO `tk_cities` VALUES('441600','440000','河源市','广东省-河源市','','河源市','广东省','2','517000','0762','','','heyuanshi','HYS','0');
INSERT INTO `tk_cities` VALUES('441700','440000','阳江市','广东省-阳江市','','阳江市','广东省','2','529500','0662','','','yangjiangshi','YJS','0');
INSERT INTO `tk_cities` VALUES('441800','440000','清远市','广东省-清远市','','清远市','广东省','2','511500','0763','','','qingyuanshi','QYS','0');
INSERT INTO `tk_cities` VALUES('441900','440000','东莞市','广东省-东莞市','','东莞市','广东省','2','523000','0769','','','dongshi','DS','0');
INSERT INTO `tk_cities` VALUES('442000','440000','中山市','广东省-中山市','','中山市','广东省','2','528400','0760','','','zhongshanshi','ZSS','0');
INSERT INTO `tk_cities` VALUES('445100','440000','潮州市','广东省-潮州市','','潮州市','广东省','2','521000','0768','','','chaozhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('445200','440000','揭阳市','广东省-揭阳市','','揭阳市','广东省','2','522000','0663','','','jieyangshi','JYS','0');
INSERT INTO `tk_cities` VALUES('445300','440000','云浮市','广东省-云浮市','','云浮市','广东省','2','527300','0766','','','yunfushi','YFS','0');
INSERT INTO `tk_cities` VALUES('440103','440100','荔湾区','广东省-广州市-荔湾区','荔湾区','广州市','广东省','3','510000','020','','','liwanqu','LWQ','0');
INSERT INTO `tk_cities` VALUES('440104','440100','越秀区','广东省-广州市-越秀区','越秀区','广州市','广东省','3','510000','020','','','yuexiuqu','YXQ','0');
INSERT INTO `tk_cities` VALUES('440105','440100','海珠区','广东省-广州市-海珠区','海珠区','广州市','广东省','3','510000','020','','','haizhuqu','HZQ','0');
INSERT INTO `tk_cities` VALUES('440106','440100','天河区','广东省-广州市-天河区','天河区','广州市','广东省','3','510000','020','','','tianhequ','THQ','0');
INSERT INTO `tk_cities` VALUES('440111','440100','白云区','广东省-广州市-白云区','白云区','广州市','广东省','3','510000','020','','','baiyunqu','BYQ','0');
INSERT INTO `tk_cities` VALUES('440112','440100','黄埔区','广东省-广州市-黄埔区','黄埔区','广州市','广东省','3','510700','020','','','huangpuqu','HPQ','0');
INSERT INTO `tk_cities` VALUES('440113','440100','番禺区','广东省-广州市-番禺区','番禺区','广州市','广东省','3','511400','020','','','fanqu','FQ','0');
INSERT INTO `tk_cities` VALUES('440114','440100','花都区','广东省-广州市-花都区','花都区','广州市','广东省','3','510800','020','','','huaduqu','HDQ','0');
INSERT INTO `tk_cities` VALUES('440115','440100','南沙区','广东省-广州市-南沙区','南沙区','广州市','广东省','3','511400','020','','','nanshaqu','NSQ','0');
INSERT INTO `tk_cities` VALUES('440116','440100','萝岗区','广东省-广州市-萝岗区','萝岗区','广州市','广东省','3','510000','020','','','luogangqu','LGQ','0');
INSERT INTO `tk_cities` VALUES('440183','440100','增城市','广东省-广州市-增城市','增城市','广州市','广东省','3','511300','020','','','zengchengshi','ZCS','0');
INSERT INTO `tk_cities` VALUES('440184','440100','从化市','广东省-广州市-从化市','从化市','广州市','广东省','3','510900','020','','','conghuashi','CHS','0');
INSERT INTO `tk_cities` VALUES('440203','440200','武江区','广东省-韶关市-武江区','武江区','韶关市','广东省','3','512000','0751','','','wujiangqu','WJQ','0');
INSERT INTO `tk_cities` VALUES('440204','440200','浈江区','广东省-韶关市-浈江区','浈江区','韶关市','广东省','3','512000','0751','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('440205','440200','曲江区','广东省-韶关市-曲江区','曲江区','韶关市','广东省','3','512100','0751','','','qujiangqu','QJQ','0');
INSERT INTO `tk_cities` VALUES('440222','440200','始兴县','广东省-韶关市-始兴县','始兴县','韶关市','广东省','3','512500','0751','','','shixingxian','SXX','0');
INSERT INTO `tk_cities` VALUES('440224','440200','仁化县','广东省-韶关市-仁化县','仁化县','韶关市','广东省','3','512300','0751','','','renhuaxian','RHX','0');
INSERT INTO `tk_cities` VALUES('440229','440200','翁源县','广东省-韶关市-翁源县','翁源县','韶关市','广东省','3','512600','0751','','','wengyuanxian','WYX','0');
INSERT INTO `tk_cities` VALUES('440232','440200','乳源瑶族自治县','广东省-韶关市-乳源瑶族自治县','乳源瑶族自治县','韶关市','广东省','3','512600','0751','','','ruyuanyaozuzizhixian','RYYZZZX','0');
INSERT INTO `tk_cities` VALUES('440233','440200','新丰县','广东省-韶关市-新丰县','新丰县','韶关市','广东省','3','511100','0751','','','xinfengxian','XFX','0');
INSERT INTO `tk_cities` VALUES('440281','440200','乐昌市','广东省-韶关市-乐昌市','乐昌市','韶关市','广东省','3','512200','0751','','','lechangshi','LCS','0');
INSERT INTO `tk_cities` VALUES('440282','440200','南雄市','广东省-韶关市-南雄市','南雄市','韶关市','广东省','3','512400','0751','','','nanxiongshi','NXS','0');
INSERT INTO `tk_cities` VALUES('440303','440300','罗湖区','广东省-深圳市-罗湖区','罗湖区','深圳市','广东省','3','518000','0755','','','luohuqu','LHQ','0');
INSERT INTO `tk_cities` VALUES('440304','440300','福田区','广东省-深圳市-福田区','福田区','深圳市','广东省','3','518000','0755','','','futianqu','FTQ','0');
INSERT INTO `tk_cities` VALUES('440305','440300','南山区','广东省-深圳市-南山区','南山区','深圳市','广东省','3','518000','0755','','','nanshanqu','NSQ','0');
INSERT INTO `tk_cities` VALUES('440306','440300','宝安区','广东省-深圳市-宝安区','宝安区','深圳市','广东省','3','518100','0755','','','baoanqu','BAQ','0');
INSERT INTO `tk_cities` VALUES('440307','440300','龙岗区','广东省-深圳市-龙岗区','龙岗区','深圳市','广东省','3','518100','0755','','','longgangqu','LGQ','0');
INSERT INTO `tk_cities` VALUES('440308','440300','盐田区','广东省-深圳市-盐田区','盐田区','深圳市','广东省','3','518000','0755','','','yantianqu','YTQ','0');
INSERT INTO `tk_cities` VALUES('440402','440400','香洲区','广东省-珠海市-香洲区','香洲区','珠海市','广东省','3','519000','0756','','','xiangzhouqu','XZQ','0');
INSERT INTO `tk_cities` VALUES('440403','440400','斗门区','广东省-珠海市-斗门区','斗门区','珠海市','广东省','3','519100','0756','','','doumenqu','DMQ','0');
INSERT INTO `tk_cities` VALUES('440404','440400','金湾区','广东省-珠海市-金湾区','金湾区','珠海市','广东省','3','519090','0756','','','jinwanqu','JWQ','0');
INSERT INTO `tk_cities` VALUES('440507','440500','龙湖区','广东省-汕头市-龙湖区','龙湖区','汕头市','广东省','3','515000','0754','','','longhuqu','LHQ','0');
INSERT INTO `tk_cities` VALUES('440511','440500','金平区','广东省-汕头市-金平区','金平区','汕头市','广东省','3','515000','0754','','','jinpingqu','JPQ','0');
INSERT INTO `tk_cities` VALUES('440512','440500','濠江区','广东省-汕头市-濠江区','濠江区','汕头市','广东省','3','515000','0754','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('440513','440500','潮阳区','广东省-汕头市-潮阳区','潮阳区','汕头市','广东省','3','515100','0661','','','chaoyangqu','CYQ','0');
INSERT INTO `tk_cities` VALUES('440514','440500','潮南区','广东省-汕头市-潮南区','潮南区','汕头市','广东省','3','515100','0661','','','chaonanqu','CNQ','0');
INSERT INTO `tk_cities` VALUES('440515','440500','澄海区','广东省-汕头市-澄海区','澄海区','汕头市','广东省','3','515800','0754','','','chenghaiqu','CHQ','0');
INSERT INTO `tk_cities` VALUES('440523','440500','南澳县','广东省-汕头市-南澳县','南澳县','汕头市','广东省','3','515900','0754','','','nanaoxian','NAX','0');
INSERT INTO `tk_cities` VALUES('440604','440600','禅城区','广东省-佛山市-禅城区','禅城区','佛山市','广东省','3','528000','0757','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('440605','440600','南海区','广东省-佛山市-南海区','南海区','佛山市','广东省','3','528200','0757','','','nanhaiqu','NHQ','0');
INSERT INTO `tk_cities` VALUES('440606','440600','顺德区','广东省-佛山市-顺德区','顺德区','佛山市','广东省','3','528000','0757','','','shundequ','SDQ','0');
INSERT INTO `tk_cities` VALUES('440607','440600','三水区','广东省-佛山市-三水区','三水区','佛山市','广东省','3','528100','0757','','','sanshuiqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('440608','440600','高明区','广东省-佛山市-高明区','高明区','佛山市','广东省','3','528500','0757','','','gaomingqu','GMQ','0');
INSERT INTO `tk_cities` VALUES('440703','440700','蓬江区','广东省-江门市-蓬江区','蓬江区','江门市','广东省','3','529000','0750','','','pengjiangqu','PJQ','0');
INSERT INTO `tk_cities` VALUES('440704','440700','江海区','广东省-江门市-江海区','江海区','江门市','广东省','3','529000','0750','','','jianghaiqu','JHQ','0');
INSERT INTO `tk_cities` VALUES('440705','440700','新会区','广东省-江门市-新会区','新会区','江门市','广东省','3','529100','0750','','','xinhuiqu','XHQ','0');
INSERT INTO `tk_cities` VALUES('440781','440700','台山市','广东省-江门市-台山市','台山市','江门市','广东省','3','529200','0750','','','taishanshi','TSS','0');
INSERT INTO `tk_cities` VALUES('440783','440700','开平市','广东省-江门市-开平市','开平市','江门市','广东省','3','529300','0750','','','kaipingshi','KPS','0');
INSERT INTO `tk_cities` VALUES('440784','440700','鹤山市','广东省-江门市-鹤山市','鹤山市','江门市','广东省','3','529700','0750','','','heshanshi','HSS','0');
INSERT INTO `tk_cities` VALUES('440785','440700','恩平市','广东省-江门市-恩平市','恩平市','江门市','广东省','3','529400','0750','','','enpingshi','EPS','0');
INSERT INTO `tk_cities` VALUES('440802','440800','赤坎区','广东省-湛江市-赤坎区','赤坎区','湛江市','广东省','3','524000','0759','','','chikanqu','CKQ','0');
INSERT INTO `tk_cities` VALUES('440803','440800','霞山区','广东省-湛江市-霞山区','霞山区','湛江市','广东省','3','524000','0759','','','xiashanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('440804','440800','坡头区','广东省-湛江市-坡头区','坡头区','湛江市','广东省','3','524000','0759','','','potouqu','PTQ','0');
INSERT INTO `tk_cities` VALUES('440811','440800','麻章区','广东省-湛江市-麻章区','麻章区','湛江市','广东省','3','524000','0759','','','mazhangqu','MZQ','0');
INSERT INTO `tk_cities` VALUES('440823','440800','遂溪县','广东省-湛江市-遂溪县','遂溪县','湛江市','广东省','3','524300','0759','','','suixixian','SXX','0');
INSERT INTO `tk_cities` VALUES('440825','440800','徐闻县','广东省-湛江市-徐闻县','徐闻县','湛江市','广东省','3','524100','0759','','','xuwenxian','XWX','0');
INSERT INTO `tk_cities` VALUES('440881','440800','廉江市','广东省-湛江市-廉江市','廉江市','湛江市','广东省','3','524400','0759','','','lianjiangshi','LJS','0');
INSERT INTO `tk_cities` VALUES('440882','440800','雷州市','广东省-湛江市-雷州市','雷州市','湛江市','广东省','3','524200','0759','','','leizhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('440883','440800','吴川市','广东省-湛江市-吴川市','吴川市','湛江市','广东省','3','524500','0759','','','wuchuanshi','WCS','0');
INSERT INTO `tk_cities` VALUES('440902','440900','茂南区','广东省-茂名市-茂南区','茂南区','茂名市','广东省','3','525000','0668','','','maonanqu','MNQ','0');
INSERT INTO `tk_cities` VALUES('440903','440900','茂港区','广东省-茂名市-茂港区','茂港区','茂名市','广东省','3','525000','0668','','','maogangqu','MGQ','0');
INSERT INTO `tk_cities` VALUES('440923','440900','电白县','广东省-茂名市-电白县','电白县','茂名市','广东省','3','525400','0668','','','dianbaixian','DBX','0');
INSERT INTO `tk_cities` VALUES('440981','440900','高州市','广东省-茂名市-高州市','高州市','茂名市','广东省','3','525200','0668','','','gaozhoushi','GZS','0');
INSERT INTO `tk_cities` VALUES('440982','440900','化州市','广东省-茂名市-化州市','化州市','茂名市','广东省','3','525100','0668','','','huazhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('440983','440900','信宜市','广东省-茂名市-信宜市','信宜市','茂名市','广东省','3','525300','0668','','','xinyishi','XYS','0');
INSERT INTO `tk_cities` VALUES('441202','441200','端州区','广东省-肇庆市-端州区','端州区','肇庆市','广东省','3','526000','0758','','','duanzhouqu','DZQ','0');
INSERT INTO `tk_cities` VALUES('441203','441200','鼎湖区','广东省-肇庆市-鼎湖区','鼎湖区','肇庆市','广东省','3','526000','0758','','','dinghuqu','DHQ','0');
INSERT INTO `tk_cities` VALUES('441223','441200','广宁县','广东省-肇庆市-广宁县','广宁县','肇庆市','广东省','3','526300','0758','','','guangningxian','GNX','0');
INSERT INTO `tk_cities` VALUES('441224','441200','怀集县','广东省-肇庆市-怀集县','怀集县','肇庆市','广东省','3','526400','0758','','','huaijixian','HJX','0');
INSERT INTO `tk_cities` VALUES('441225','441200','封开县','广东省-肇庆市-封开县','封开县','肇庆市','广东省','3','526500','0758','','','fengkaixian','FKX','0');
INSERT INTO `tk_cities` VALUES('441226','441200','德庆县','广东省-肇庆市-德庆县','德庆县','肇庆市','广东省','3','526600','0758','','','deqingxian','DQX','0');
INSERT INTO `tk_cities` VALUES('441283','441200','高要市','广东省-肇庆市-高要市','高要市','肇庆市','广东省','3','526100','0758','','','gaoyaoshi','GYS','0');
INSERT INTO `tk_cities` VALUES('441284','441200','四会市','广东省-肇庆市-四会市','四会市','肇庆市','广东省','3','526200','0758','','','sihuishi','SHS','0');
INSERT INTO `tk_cities` VALUES('441302','441300','惠城区','广东省-惠州市-惠城区','惠城区','惠州市','广东省','3','516000','0752','','','huichengqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('441303','441300','惠阳区','广东省-惠州市-惠阳区','惠阳区','惠州市','广东省','3','516200','0752','','','huiyangqu','HYQ','0');
INSERT INTO `tk_cities` VALUES('441322','441300','博罗县','广东省-惠州市-博罗县','博罗县','惠州市','广东省','3','516100','0752','','','boluoxian','BLX','0');
INSERT INTO `tk_cities` VALUES('441323','441300','惠东县','广东省-惠州市-惠东县','惠东县','惠州市','广东省','3','516300','0752','','','huidongxian','HDX','0');
INSERT INTO `tk_cities` VALUES('441324','441300','龙门县','广东省-惠州市-龙门县','龙门县','惠州市','广东省','3','516800','0752','','','longmenxian','LMX','0');
INSERT INTO `tk_cities` VALUES('441402','441400','梅江区','广东省-梅州市-梅江区','梅江区','梅州市','广东省','3','514000','0753','','','meijiangqu','MJQ','0');
INSERT INTO `tk_cities` VALUES('441421','441400','梅县','广东省-梅州市-梅县','梅县','梅州市','广东省','3','514700','0753','','','meixian','MX','0');
INSERT INTO `tk_cities` VALUES('441422','441400','大埔县','广东省-梅州市-大埔县','大埔县','梅州市','广东省','3','514200','0753','','','dapuxian','DPX','0');
INSERT INTO `tk_cities` VALUES('441423','441400','丰顺县','广东省-梅州市-丰顺县','丰顺县','梅州市','广东省','3','514300','0753','','','fengshunxian','FSX','0');
INSERT INTO `tk_cities` VALUES('441424','441400','五华县','广东省-梅州市-五华县','五华县','梅州市','广东省','3','514400','0753','','','wuhuaxian','WHX','0');
INSERT INTO `tk_cities` VALUES('441426','441400','平远县','广东省-梅州市-平远县','平远县','梅州市','广东省','3','514600','0753','','','pingyuanxian','PYX','0');
INSERT INTO `tk_cities` VALUES('441427','441400','蕉岭县','广东省-梅州市-蕉岭县','蕉岭县','梅州市','广东省','3','514100','0753','','','jiaolingxian','JLX','0');
INSERT INTO `tk_cities` VALUES('441481','441400','兴宁市','广东省-梅州市-兴宁市','兴宁市','梅州市','广东省','3','514500','0753','','','xingningshi','XNS','0');
INSERT INTO `tk_cities` VALUES('441502','441500','城区','广东省-汕尾市-城区','城区','汕尾市','广东省','3','516600','0660','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('441521','441500','海丰县','广东省-汕尾市-海丰县','海丰县','汕尾市','广东省','3','516400','0660','','','haifengxian','HFX','0');
INSERT INTO `tk_cities` VALUES('441523','441500','陆河县','广东省-汕尾市-陆河县','陆河县','汕尾市','广东省','3','516700','0660','','','luhexian','LHX','0');
INSERT INTO `tk_cities` VALUES('441581','441500','陆丰市','广东省-汕尾市-陆丰市','陆丰市','汕尾市','广东省','3','516500','0660','','','lufengshi','LFS','0');
INSERT INTO `tk_cities` VALUES('441602','441600','源城区','广东省-河源市-源城区','源城区','河源市','广东省','3','517000','0762','','','yuanchengqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('441621','441600','紫金县','广东省-河源市-紫金县','紫金县','河源市','广东省','3','517400','0762','','','zijinxian','ZJX','0');
INSERT INTO `tk_cities` VALUES('441622','441600','龙川县','广东省-河源市-龙川县','龙川县','河源市','广东省','3','517300','0762','','','longchuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('441623','441600','连平县','广东省-河源市-连平县','连平县','河源市','广东省','3','517100','0762','','','lianpingxian','LPX','0');
INSERT INTO `tk_cities` VALUES('441624','441600','和平县','广东省-河源市-和平县','和平县','河源市','广东省','3','517200','0762','','','hepingxian','HPX','0');
INSERT INTO `tk_cities` VALUES('441625','441600','东源县','广东省-河源市-东源县','东源县','河源市','广东省','3','517500','0762','','','dongyuanxian','DYX','0');
INSERT INTO `tk_cities` VALUES('441702','441700','江城区','广东省-阳江市-江城区','江城区','阳江市','广东省','3','529500','0662','','','jiangchengqu','JCQ','0');
INSERT INTO `tk_cities` VALUES('441721','441700','阳西县','广东省-阳江市-阳西县','阳西县','阳江市','广东省','3','529800','0662','','','yangxixian','YXX','0');
INSERT INTO `tk_cities` VALUES('441723','441700','阳东县','广东省-阳江市-阳东县','阳东县','阳江市','广东省','3','529900','0662','','','yangdongxian','YDX','0');
INSERT INTO `tk_cities` VALUES('441781','441700','阳春市','广东省-阳江市-阳春市','阳春市','阳江市','广东省','3','529600','0662','','','yangchunshi','YCS','0');
INSERT INTO `tk_cities` VALUES('441802','441800','清城区','广东省-清远市-清城区','清城区','清远市','广东省','3','511500','0763','','','qingchengqu','QCQ','0');
INSERT INTO `tk_cities` VALUES('441821','441800','佛冈县','广东省-清远市-佛冈县','佛冈县','清远市','广东省','3','511600','0763','','','fogangxian','FGX','0');
INSERT INTO `tk_cities` VALUES('441823','441800','阳山县','广东省-清远市-阳山县','阳山县','清远市','广东省','3','513100','0763','','','yangshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('441825','441800','连山壮族瑶族自治县','广东省-清远市-连山壮族瑶族自治县','连山壮族瑶族自治县','清远市','广东省','3','513200','0763','','','lianshanzhuangzuyaozuzizhixian','LSZZYZZZX','0');
INSERT INTO `tk_cities` VALUES('441826','441800','连南瑶族自治县','广东省-清远市-连南瑶族自治县','连南瑶族自治县','清远市','广东省','3','513300','0763','','','liannanyaozuzizhixian','LNYZZZX','0');
INSERT INTO `tk_cities` VALUES('441827','441800','清新县','广东省-清远市-清新县','清新县','清远市','广东省','3','511800','0763','','','qingxinxian','QXX','0');
INSERT INTO `tk_cities` VALUES('441881','441800','英德市','广东省-清远市-英德市','英德市','清远市','广东省','3','513000','0763','','','yingdeshi','YDS','0');
INSERT INTO `tk_cities` VALUES('441882','441800','连州市','广东省-清远市-连州市','连州市','清远市','广东省','3','513400','0763','','','lianzhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('441901','','东莞市','广东省-东莞市-东莞市','东莞市','东莞市','广东省','3','','','','','dongshi','DS','0');
INSERT INTO `tk_cities` VALUES('442001','','中山市','广东省-中山市-中山市','中山市','中山市','广东省','3','','','','','zhongshanshi','ZSS','0');
INSERT INTO `tk_cities` VALUES('445102','445100','湘桥区','广东省-潮州市-湘桥区','湘桥区','潮州市','广东省','3','521000','0768','','','xiangqiaoqu','XQQ','0');
INSERT INTO `tk_cities` VALUES('445121','445100','潮安县','广东省-潮州市-潮安县','潮安县','潮州市','广东省','3','515600','0768','','','chaoanxian','CAX','0');
INSERT INTO `tk_cities` VALUES('445122','445100','饶平县','广东省-潮州市-饶平县','饶平县','潮州市','广东省','3','515700','0768','','','raopingxian','RPX','0');
INSERT INTO `tk_cities` VALUES('445202','445200','榕城区','广东省-揭阳市-榕城区','榕城区','揭阳市','广东省','3','522000','0663','','','chengqu','CQ','0');
INSERT INTO `tk_cities` VALUES('445221','445200','揭东县','广东省-揭阳市-揭东县','揭东县','揭阳市','广东省','3','515500','0663','','','jiedongxian','JDX','0');
INSERT INTO `tk_cities` VALUES('445222','445200','揭西县','广东省-揭阳市-揭西县','揭西县','揭阳市','广东省','3','515400','0663','','','jiexixian','JXX','0');
INSERT INTO `tk_cities` VALUES('445224','445200','惠来县','广东省-揭阳市-惠来县','惠来县','揭阳市','广东省','3','515200','0663','','','huilaixian','HLX','0');
INSERT INTO `tk_cities` VALUES('445281','445200','普宁市','广东省-揭阳市-普宁市','普宁市','揭阳市','广东省','3','515300','0663','','','puningshi','PNS','0');
INSERT INTO `tk_cities` VALUES('445302','445300','云城区','广东省-云浮市-云城区','云城区','云浮市','广东省','3','527300','0766','','','yunchengqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('445321','445300','新兴县','广东省-云浮市-新兴县','新兴县','云浮市','广东省','3','527400','0766','','','xinxingxian','XXX','0');
INSERT INTO `tk_cities` VALUES('445322','445300','郁南县','广东省-云浮市-郁南县','郁南县','云浮市','广东省','3','527100','0766','','','yunanxian','YNX','0');
INSERT INTO `tk_cities` VALUES('445323','445300','云安县','广东省-云浮市-云安县','云安县','云浮市','广东省','3','527500','0766','','','yunanxian','YAX','0');
INSERT INTO `tk_cities` VALUES('445381','445300','罗定市','广东省-云浮市-罗定市','罗定市','云浮市','广东省','3','527200','0766','','','luodingshi','LDS','0');
INSERT INTO `tk_cities` VALUES('450000','0','广西壮族自治区','广西壮族自治区','','','广西壮族自治区','1','','','','','guangxizhuangzuzizhiqu','GXZZZZQ','0');
INSERT INTO `tk_cities` VALUES('450100','450000','南宁市','广西壮族自治区-南宁市','','南宁市','广西壮族自治区','2','530000','0771','','','nanningshi','NNS','1');
INSERT INTO `tk_cities` VALUES('450200','450000','柳州市','广西壮族自治区-柳州市','','柳州市','广西壮族自治区','2','545000','0772','','','liuzhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('450300','450000','桂林市','广西壮族自治区-桂林市','','桂林市','广西壮族自治区','2','541000','0773','','','guilinshi','GLS','0');
INSERT INTO `tk_cities` VALUES('450400','450000','梧州市','广西壮族自治区-梧州市','','梧州市','广西壮族自治区','2','543000','0774','','','wuzhoushi','WZS','0');
INSERT INTO `tk_cities` VALUES('450500','450000','北海市','广西壮族自治区-北海市','','北海市','广西壮族自治区','2','536000','0779','','','beihaishi','BHS','0');
INSERT INTO `tk_cities` VALUES('450600','450000','防城港市','广西壮族自治区-防城港市','','防城港市','广西壮族自治区','2','538000','0770','','','fangchenggangshi','FCGS','0');
INSERT INTO `tk_cities` VALUES('450700','450000','钦州市','广西壮族自治区-钦州市','','钦州市','广西壮族自治区','2','535000','0777','','','qinzhoushi','QZS','0');
INSERT INTO `tk_cities` VALUES('450800','450000','贵港市','广西壮族自治区-贵港市','','贵港市','广西壮族自治区','2','537100','0775','','','guigangshi','GGS','0');
INSERT INTO `tk_cities` VALUES('450900','450000','玉林市','广西壮族自治区-玉林市','','玉林市','广西壮族自治区','2','537000','0775','','','yulinshi','YLS','0');
INSERT INTO `tk_cities` VALUES('451000','450000','百色市','广西壮族自治区-百色市','','百色市','广西壮族自治区','2','533000','0776','','','baiseshi','BSS','0');
INSERT INTO `tk_cities` VALUES('451100','450000','贺州市','广西壮族自治区-贺州市','','贺州市','广西壮族自治区','2','542800','0774','','','hezhoushi','HZS','0');
INSERT INTO `tk_cities` VALUES('451200','450000','河池市','广西壮族自治区-河池市','','河池市','广西壮族自治区','2','547000','0778','','','hechishi','HCS','0');
INSERT INTO `tk_cities` VALUES('451300','450000','来宾市','广西壮族自治区-来宾市','','来宾市','广西壮族自治区','2','546100','0772','','','laibinshi','LBS','0');
INSERT INTO `tk_cities` VALUES('451400','450000','崇左市','广西壮族自治区-崇左市','','崇左市','广西壮族自治区','2','532200','0771','','','chongzuoshi','CZS','0');
INSERT INTO `tk_cities` VALUES('450102','450100','兴宁区','广西壮族自治区-南宁市-兴宁区','兴宁区','南宁市','广西壮族自治区','3','530000','0771','','','xingningqu','XNQ','0');
INSERT INTO `tk_cities` VALUES('450103','450100','青秀区','广西壮族自治区-南宁市-青秀区','青秀区','南宁市','广西壮族自治区','3','530000','0771','','','qingxiuqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('450105','450100','江南区','广西壮族自治区-南宁市-江南区','江南区','南宁市','广西壮族自治区','3','530000','0771','','','jiangnanqu','JNQ','0');
INSERT INTO `tk_cities` VALUES('450107','450100','西乡塘区','广西壮族自治区-南宁市-西乡塘区','西乡塘区','南宁市','广西壮族自治区','3','530000','0771','','','xixiangtangqu','XXTQ','0');
INSERT INTO `tk_cities` VALUES('450108','450100','良庆区','广西壮族自治区-南宁市-良庆区','良庆区','南宁市','广西壮族自治区','3','530200','0771','','','liangqingqu','LQQ','0');
INSERT INTO `tk_cities` VALUES('450109','450100','邕宁区','广西壮族自治区-南宁市-邕宁区','邕宁区','南宁市','广西壮族自治区','3','530200','0771','','','ningqu','NQ','0');
INSERT INTO `tk_cities` VALUES('450122','450100','武鸣县','广西壮族自治区-南宁市-武鸣县','武鸣县','南宁市','广西壮族自治区','3','530100','0771','','','wumingxian','WMX','0');
INSERT INTO `tk_cities` VALUES('450123','450100','隆安县','广西壮族自治区-南宁市-隆安县','隆安县','南宁市','广西壮族自治区','3','532700','0771','','','longanxian','LAX','0');
INSERT INTO `tk_cities` VALUES('450124','450100','马山县','广西壮族自治区-南宁市-马山县','马山县','南宁市','广西壮族自治区','3','530600','0771','','','mashanxian','MSX','0');
INSERT INTO `tk_cities` VALUES('450125','450100','上林县','广西壮族自治区-南宁市-上林县','上林县','南宁市','广西壮族自治区','3','530500','0771','','','shanglinxian','SLX','0');
INSERT INTO `tk_cities` VALUES('450126','450100','宾阳县','广西壮族自治区-南宁市-宾阳县','宾阳县','南宁市','广西壮族自治区','3','530400','0771','','','binyangxian','BYX','0');
INSERT INTO `tk_cities` VALUES('450127','450100','横县','广西壮族自治区-南宁市-横县','横县','南宁市','广西壮族自治区','3','530300','0771','','','hengxian','HX','0');
INSERT INTO `tk_cities` VALUES('450202','450200','城中区','广西壮族自治区-柳州市-城中区','城中区','柳州市','广西壮族自治区','3','545000','0772','','','chengzhongqu','CZQ','0');
INSERT INTO `tk_cities` VALUES('450203','450200','鱼峰区','广西壮族自治区-柳州市-鱼峰区','鱼峰区','柳州市','广西壮族自治区','3','545000','0772','','','yufengqu','YFQ','0');
INSERT INTO `tk_cities` VALUES('450204','450200','柳南区','广西壮族自治区-柳州市-柳南区','柳南区','柳州市','广西壮族自治区','3','545000','0772','','','liunanqu','LNQ','0');
INSERT INTO `tk_cities` VALUES('450205','450200','柳北区','广西壮族自治区-柳州市-柳北区','柳北区','柳州市','广西壮族自治区','3','545000','0772','','','liubeiqu','LBQ','0');
INSERT INTO `tk_cities` VALUES('450221','450200','柳江县','广西壮族自治区-柳州市-柳江县','柳江县','柳州市','广西壮族自治区','3','545100','0772','','','liujiangxian','LJX','0');
INSERT INTO `tk_cities` VALUES('450222','450200','柳城县','广西壮族自治区-柳州市-柳城县','柳城县','柳州市','广西壮族自治区','3','545200','0772','','','liuchengxian','LCX','0');
INSERT INTO `tk_cities` VALUES('450223','450200','鹿寨县','广西壮族自治区-柳州市-鹿寨县','鹿寨县','柳州市','广西壮族自治区','3','545600','0772','','','luzhaixian','LZX','0');
INSERT INTO `tk_cities` VALUES('450224','450200','融安县','广西壮族自治区-柳州市-融安县','融安县','柳州市','广西壮族自治区','3','545400','0772','','','ronganxian','RAX','0');
INSERT INTO `tk_cities` VALUES('450225','450200','融水苗族自治县','广西壮族自治区-柳州市-融水苗族自治县','融水苗族自治县','柳州市','广西壮族自治区','3','545300','0772','','','rongshuimiaozuzizhixian','RSMZZZX','0');
INSERT INTO `tk_cities` VALUES('450226','450200','三江侗族自治县','广西壮族自治区-柳州市-三江侗族自治县','三江侗族自治县','柳州市','广西壮族自治区','3','545500','0772','','','sanjiangdongzuzizhixian','SJDZZZX','0');
INSERT INTO `tk_cities` VALUES('450302','450300','秀峰区','广西壮族自治区-桂林市-秀峰区','秀峰区','桂林市','广西壮族自治区','3','541000','0773','','','xiufengqu','XFQ','0');
INSERT INTO `tk_cities` VALUES('450303','450300','叠彩区','广西壮族自治区-桂林市-叠彩区','叠彩区','桂林市','广西壮族自治区','3','541000','0773','','','diecaiqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('450304','450300','象山区','广西壮族自治区-桂林市-象山区','象山区','桂林市','广西壮族自治区','3','541000','0773','','','xiangshanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('450305','450300','七星区','广西壮族自治区-桂林市-七星区','七星区','桂林市','广西壮族自治区','3','541000','0773','','','qixingqu','QXQ','0');
INSERT INTO `tk_cities` VALUES('450311','450300','雁山区','广西壮族自治区-桂林市-雁山区','雁山区','桂林市','广西壮族自治区','3','541000','0773','','','yanshanqu','YSQ','0');
INSERT INTO `tk_cities` VALUES('450321','450300','阳朔县','广西壮族自治区-桂林市-阳朔县','阳朔县','桂林市','广西壮族自治区','3','541900','0773','','','yangshuoxian','YSX','0');
INSERT INTO `tk_cities` VALUES('450322','450300','临桂县','广西壮族自治区-桂林市-临桂县','临桂县','桂林市','广西壮族自治区','3','541100','0773','','','linguixian','LGX','0');
INSERT INTO `tk_cities` VALUES('450323','450300','灵川县','广西壮族自治区-桂林市-灵川县','灵川县','桂林市','广西壮族自治区','3','541200','0773','','','lingchuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('450324','450300','全州县','广西壮族自治区-桂林市-全州县','全州县','桂林市','广西壮族自治区','3','541500','0773','','','quanzhouxian','QZX','0');
INSERT INTO `tk_cities` VALUES('450325','450300','兴安县','广西壮族自治区-桂林市-兴安县','兴安县','桂林市','广西壮族自治区','3','541300','0773','','','xinganxian','XAX','0');
INSERT INTO `tk_cities` VALUES('450326','450300','永福县','广西壮族自治区-桂林市-永福县','永福县','桂林市','广西壮族自治区','3','541800','0773','','','yongfuxian','YFX','0');
INSERT INTO `tk_cities` VALUES('450327','450300','灌阳县','广西壮族自治区-桂林市-灌阳县','灌阳县','桂林市','广西壮族自治区','3','541600','0773','','','guanyangxian','GYX','0');
INSERT INTO `tk_cities` VALUES('450328','450300','龙胜各族自治县','广西壮族自治区-桂林市-龙胜各族自治县','龙胜各族自治县','桂林市','广西壮族自治区','3','541700','0773','','','longshenggezuzizhixian','LSGZZZX','0');
INSERT INTO `tk_cities` VALUES('450329','450300','资源县','广西壮族自治区-桂林市-资源县','资源县','桂林市','广西壮族自治区','3','541400','0773','','','ziyuanxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('450330','450300','平乐县','广西壮族自治区-桂林市-平乐县','平乐县','桂林市','广西壮族自治区','3','542400','0773','','','pinglexian','PLX','0');
INSERT INTO `tk_cities` VALUES('450331','450300','荔蒲县','广西壮族自治区-桂林市-荔蒲县','荔蒲县','桂林市','广西壮族自治区','3','546600','0773','','','lipuxian','LPX','0');
INSERT INTO `tk_cities` VALUES('450332','450300','恭城瑶族自治县','广西壮族自治区-桂林市-恭城瑶族自治县','恭城瑶族自治县','桂林市','广西壮族自治区','3','542500','0773','','','gongchengyaozuzizhixian','GCYZZZX','0');
INSERT INTO `tk_cities` VALUES('450403','450400','万秀区','广西壮族自治区-梧州市-万秀区','万秀区','梧州市','广西壮族自治区','3','543000','0774','','','wanxiuqu','WXQ','0');
INSERT INTO `tk_cities` VALUES('450404','450400','蝶山区','广西壮族自治区-梧州市-蝶山区','蝶山区','梧州市','广西壮族自治区','3','543000','0774','','','dieshanqu','DSQ','0');
INSERT INTO `tk_cities` VALUES('450405','450400','长洲区','广西壮族自治区-梧州市-长洲区','长洲区','梧州市','广西壮族自治区','3','543000','0774','','','changzhouqu','CZQ','0');
INSERT INTO `tk_cities` VALUES('450421','450400','苍梧县','广西壮族自治区-梧州市-苍梧县','苍梧县','梧州市','广西壮族自治区','3','543100','0774','','','cangwuxian','CWX','0');
INSERT INTO `tk_cities` VALUES('450422','450400','藤县','广西壮族自治区-梧州市-藤县','藤县','梧州市','广西壮族自治区','3','543300','0774','','','tengxian','TX','0');
INSERT INTO `tk_cities` VALUES('450423','450400','蒙山县','广西壮族自治区-梧州市-蒙山县','蒙山县','梧州市','广西壮族自治区','3','546700','0774','','','mengshanxian','MSX','0');
INSERT INTO `tk_cities` VALUES('450481','450400','岑溪市','广西壮族自治区-梧州市-岑溪市','岑溪市','梧州市','广西壮族自治区','3','543200','0774','','','xishi','XS','0');
INSERT INTO `tk_cities` VALUES('450502','450500','海城区','广西壮族自治区-北海市-海城区','海城区','北海市','广西壮族自治区','3','536000','0779','','','haichengqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('450503','450500','银海区','广西壮族自治区-北海市-银海区','银海区','北海市','广西壮族自治区','3','536000','0779','','','yinhaiqu','YHQ','0');
INSERT INTO `tk_cities` VALUES('450512','450500','铁山港区','广西壮族自治区-北海市-铁山港区','铁山港区','北海市','广西壮族自治区','3','536000','0779','','','tieshangangqu','TSGQ','0');
INSERT INTO `tk_cities` VALUES('450521','450500','合浦县','广西壮族自治区-北海市-合浦县','合浦县','北海市','广西壮族自治区','3','536100','0779','','','hepuxian','HPX','0');
INSERT INTO `tk_cities` VALUES('450602','450600','港口区','广西壮族自治区-防城港市-港口区','港口区','防城港市','广西壮族自治区','3','538000','0770','','','gangkouqu','GKQ','0');
INSERT INTO `tk_cities` VALUES('450603','450600','防城区','广西壮族自治区-防城港市-防城区','防城区','防城港市','广西壮族自治区','3','538000','0770','','','fangchengqu','FCQ','0');
INSERT INTO `tk_cities` VALUES('450621','450600','上思县','广西壮族自治区-防城港市-上思县','上思县','防城港市','广西壮族自治区','3','535500','0770','','','shangsixian','SSX','0');
INSERT INTO `tk_cities` VALUES('450681','450600','东兴市','广西壮族自治区-防城港市-东兴市','东兴市','防城港市','广西壮族自治区','3','538100','0770','','','dongxingshi','DXS','0');
INSERT INTO `tk_cities` VALUES('450702','450700','钦南区','广西壮族自治区-钦州市-钦南区','钦南区','钦州市','广西壮族自治区','3','535000','0777','','','qinnanqu','QNQ','0');
INSERT INTO `tk_cities` VALUES('450703','450700','钦北区','广西壮族自治区-钦州市-钦北区','钦北区','钦州市','广西壮族自治区','3','535000','0777','','','qinbeiqu','QBQ','0');
INSERT INTO `tk_cities` VALUES('450721','450700','灵山县','广西壮族自治区-钦州市-灵山县','灵山县','钦州市','广西壮族自治区','3','535400','0777','','','lingshanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('450722','450700','浦北县','广西壮族自治区-钦州市-浦北县','浦北县','钦州市','广西壮族自治区','3','535300','0777','','','pubeixian','PBX','0');
INSERT INTO `tk_cities` VALUES('450802','450800','港北区','广西壮族自治区-贵港市-港北区','港北区','贵港市','广西壮族自治区','3','537100','0775','','','gangbeiqu','GBQ','0');
INSERT INTO `tk_cities` VALUES('450803','450800','港南区','广西壮族自治区-贵港市-港南区','港南区','贵港市','广西壮族自治区','3','537100','0775','','','gangnanqu','GNQ','0');
INSERT INTO `tk_cities` VALUES('450804','450800','覃塘区','广西壮族自治区-贵港市-覃塘区','覃塘区','贵港市','广西壮族自治区','3','537100','0775','','','tangqu','TQ','0');
INSERT INTO `tk_cities` VALUES('450821','450800','平南县','广西壮族自治区-贵港市-平南县','平南县','贵港市','广西壮族自治区','3','537300','0775','','','pingnanxian','PNX','0');
INSERT INTO `tk_cities` VALUES('450881','450800','桂平市','广西壮族自治区-贵港市-桂平市','桂平市','贵港市','广西壮族自治区','3','537200','0775','','','guipingshi','GPS','0');
INSERT INTO `tk_cities` VALUES('450902','450900','玉州区','广西壮族自治区-玉林市-玉州区','玉州区','玉林市','广西壮族自治区','3','537000','0775','','','yuzhouqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('450921','450900','容县','广西壮族自治区-玉林市-容县','容县','玉林市','广西壮族自治区','3','537500','0775','','','rongxian','RX','0');
INSERT INTO `tk_cities` VALUES('450922','450900','陆川县','广西壮族自治区-玉林市-陆川县','陆川县','玉林市','广西壮族自治区','3','537700','0775','','','luchuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('450923','450900','博白县','广西壮族自治区-玉林市-博白县','博白县','玉林市','广西壮族自治区','3','537600','0775','','','bobaixian','BBX','0');
INSERT INTO `tk_cities` VALUES('450924','450900','兴业县','广西壮族自治区-玉林市-兴业县','兴业县','玉林市','广西壮族自治区','3','537800','0775','','','xingyexian','XYX','0');
INSERT INTO `tk_cities` VALUES('450981','450900','北流市','广西壮族自治区-玉林市-北流市','北流市','玉林市','广西壮族自治区','3','537400','0775','','','beiliushi','BLS','0');
INSERT INTO `tk_cities` VALUES('451002','451000','右江区','广西壮族自治区-百色市-右江区','右江区','百色市','广西壮族自治区','3','533000','0776','','','youjiangqu','YJQ','0');
INSERT INTO `tk_cities` VALUES('451021','451000','田阳县','广西壮族自治区-百色市-田阳县','田阳县','百色市','广西壮族自治区','3','533600','0776','','','tianyangxian','TYX','0');
INSERT INTO `tk_cities` VALUES('451022','451000','田东县','广西壮族自治区-百色市-田东县','田东县','百色市','广西壮族自治区','3','531500','0776','','','tiandongxian','TDX','0');
INSERT INTO `tk_cities` VALUES('451023','451000','平果县','广西壮族自治区-百色市-平果县','平果县','百色市','广西壮族自治区','3','531400','0776','','','pingguoxian','PGX','0');
INSERT INTO `tk_cities` VALUES('451024','451000','德保县','广西壮族自治区-百色市-德保县','德保县','百色市','广西壮族自治区','3','533700','0776','','','debaoxian','DBX','0');
INSERT INTO `tk_cities` VALUES('451025','451000','靖西县','广西壮族自治区-百色市-靖西县','靖西县','百色市','广西壮族自治区','3','533800','0776','','','jingxixian','JXX','0');
INSERT INTO `tk_cities` VALUES('451026','451000','那坡县','广西壮族自治区-百色市-那坡县','那坡县','百色市','广西壮族自治区','3','533900','0776','','','napoxian','NPX','0');
INSERT INTO `tk_cities` VALUES('451027','451000','凌云县','广西壮族自治区-百色市-凌云县','凌云县','百色市','广西壮族自治区','3','533100','0776','','','lingyunxian','LYX','0');
INSERT INTO `tk_cities` VALUES('451028','451000','乐业县','广西壮族自治区-百色市-乐业县','乐业县','百色市','广西壮族自治区','3','533200','0776','','','leyexian','LYX','0');
INSERT INTO `tk_cities` VALUES('451029','451000','田林县','广西壮族自治区-百色市-田林县','田林县','百色市','广西壮族自治区','3','533300','0776','','','tianlinxian','TLX','0');
INSERT INTO `tk_cities` VALUES('451030','451000','西林县','广西壮族自治区-百色市-西林县','西林县','百色市','广西壮族自治区','3','533500','0776','','','xilinxian','XLX','0');
INSERT INTO `tk_cities` VALUES('451031','451000','隆林各族自治县','广西壮族自治区-百色市-隆林各族自治县','隆林各族自治县','百色市','广西壮族自治区','3','533500','0776','','','longlingezuzizhixian','LLGZZZX','0');
INSERT INTO `tk_cities` VALUES('451102','451100','八步区','广西壮族自治区-贺州市-八步区','八步区','贺州市','广西壮族自治区','3','552106','0774','','','babuqu','BBQ','0');
INSERT INTO `tk_cities` VALUES('451119','','平桂管理区','广西壮族自治区-贺州市-平桂管理区','平桂管理区','贺州市','广西壮族自治区','3','','','','','pingguiguanliqu','PGGLQ','0');
INSERT INTO `tk_cities` VALUES('451121','451100','昭平县','广西壮族自治区-贺州市-昭平县','昭平县','贺州市','广西壮族自治区','3','546800','0774','','','zhaopingxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('451122','451100','钟山县','广西壮族自治区-贺州市-钟山县','钟山县','贺州市','广西壮族自治区','3','542600','0774','','','zhongshanxian','ZSX','0');
INSERT INTO `tk_cities` VALUES('451123','451100','富川瑶族自治县','广西壮族自治区-贺州市-富川瑶族自治县','富川瑶族自治县','贺州市','广西壮族自治区','3','542700','0774','','','fuchuanyaozuzizhixian','FCYZZZX','0');
INSERT INTO `tk_cities` VALUES('451202','451200','金城江区','广西壮族自治区-河池市-金城江区','金城江区','河池市','广西壮族自治区','3','547000','0778','','','jinchengjiangqu','JCJQ','0');
INSERT INTO `tk_cities` VALUES('451221','451200','南丹县','广西壮族自治区-河池市-南丹县','南丹县','河池市','广西壮族自治区','3','547200','0778','','','nandanxian','NDX','0');
INSERT INTO `tk_cities` VALUES('451222','451200','天峨县','广西壮族自治区-河池市-天峨县','天峨县','河池市','广西壮族自治区','3','547300','0778','','','tianexian','TEX','0');
INSERT INTO `tk_cities` VALUES('451223','451200','凤山县','广西壮族自治区-河池市-凤山县','凤山县','河池市','广西壮族自治区','3','547600','0778','','','fengshanxian','FSX','0');
INSERT INTO `tk_cities` VALUES('451224','451200','东兰县','广西壮族自治区-河池市-东兰县','东兰县','河池市','广西壮族自治区','3','547400','0778','','','donglanxian','DLX','0');
INSERT INTO `tk_cities` VALUES('451225','451200','罗城仫佬族自治县','广西壮族自治区-河池市-罗城仫佬族自治县','罗城仫佬族自治县','河池市','广西壮族自治区','3','546400','0778','','','luochenglaozuzizhixian','LCLZZZX','0');
INSERT INTO `tk_cities` VALUES('451226','451200','环江毛南族自治县','广西壮族自治区-河池市-环江毛南族自治县','环江毛南族自治县','河池市','广西壮族自治区','3','547100','0778','','','huanjiangmaonanzuzizhixian','HJMNZZZX','0');
INSERT INTO `tk_cities` VALUES('451227','451200','巴马瑶族自治县','广西壮族自治区-河池市-巴马瑶族自治县','巴马瑶族自治县','河池市','广西壮族自治区','3','547500','0778','','','bamayaozuzizhixian','BMYZZZX','0');
INSERT INTO `tk_cities` VALUES('451228','451200','都安瑶族自治县','广西壮族自治区-河池市-都安瑶族自治县','都安瑶族自治县','河池市','广西壮族自治区','3','530700','0778','','','duanyaozuzizhixian','DAYZZZX','0');
INSERT INTO `tk_cities` VALUES('451229','451200','大化瑶族自治县','广西壮族自治区-河池市-大化瑶族自治县','大化瑶族自治县','河池市','广西壮族自治区','3','530800','0778','','','dahuayaozuzizhixian','DHYZZZX','0');
INSERT INTO `tk_cities` VALUES('451281','451200','宜州市','广西壮族自治区-河池市-宜州市','宜州市','河池市','广西壮族自治区','3','546300','0778','','','yizhoushi','YZS','0');
INSERT INTO `tk_cities` VALUES('451302','451300','兴宾区','广西壮族自治区-来宾市-兴宾区','兴宾区','来宾市','广西壮族自治区','3','546100','0772','','','xingbinqu','XBQ','0');
INSERT INTO `tk_cities` VALUES('451321','451300','忻城县','广西壮族自治区-来宾市-忻城县','忻城县','来宾市','广西壮族自治区','3','546200','0772','','','xinchengxian','XCX','0');
INSERT INTO `tk_cities` VALUES('451322','451300','象州县','广西壮族自治区-来宾市-象州县','象州县','来宾市','广西壮族自治区','3','545800','0772','','','xiangzhouxian','XZX','0');
INSERT INTO `tk_cities` VALUES('451323','451300','武宣县','广西壮族自治区-来宾市-武宣县','武宣县','来宾市','广西壮族自治区','3','545900','0772','','','wuxuanxian','WXX','0');
INSERT INTO `tk_cities` VALUES('451324','451300','金秀瑶族自治县','广西壮族自治区-来宾市-金秀瑶族自治县','金秀瑶族自治县','来宾市','广西壮族自治区','3','545700','0772','','','jinxiuyaozuzizhixian','JXYZZZX','0');
INSERT INTO `tk_cities` VALUES('451381','451300','合山市','广西壮族自治区-来宾市-合山市','合山市','来宾市','广西壮族自治区','3','546500','0772','','','heshanshi','HSS','0');
INSERT INTO `tk_cities` VALUES('451402','451400','江洲区','广西壮族自治区-崇左市-江洲区','江洲区','崇左市','广西壮族自治区','3','532200','0771','','','jiangzhouqu','JZQ','0');
INSERT INTO `tk_cities` VALUES('451421','451400','扶绥县','广西壮族自治区-崇左市-扶绥县','扶绥县','崇左市','广西壮族自治区','3','532100','0771','','','fusuixian','FSX','0');
INSERT INTO `tk_cities` VALUES('451422','451400','宁明县','广西壮族自治区-崇左市-宁明县','宁明县','崇左市','广西壮族自治区','3','532500','0771','','','ningmingxian','NMX','0');
INSERT INTO `tk_cities` VALUES('451423','451400','龙州县','广西壮族自治区-崇左市-龙州县','龙州县','崇左市','广西壮族自治区','3','532400','0771','','','longzhouxian','LZX','0');
INSERT INTO `tk_cities` VALUES('451424','451400','大新县','广西壮族自治区-崇左市-大新县','大新县','崇左市','广西壮族自治区','3','532300','0771','','','daxinxian','DXX','0');
INSERT INTO `tk_cities` VALUES('451425','451400','天等县','广西壮族自治区-崇左市-天等县','天等县','崇左市','广西壮族自治区','3','532800','0771','','','tiandengxian','TDX','0');
INSERT INTO `tk_cities` VALUES('451481','451400','凭祥市','广西壮族自治区-崇左市-凭祥市','凭祥市','崇左市','广西壮族自治区','3','532600','0771','','','pingxiangshi','PXS','0');
INSERT INTO `tk_cities` VALUES('460000','0','海南省','海南省','','','海南省','1','','','','','hainansheng','HNS','0');
INSERT INTO `tk_cities` VALUES('460100','460000','海口市','海南省-海口市','','海口市','海南省','2','570100','0898','','','haikoushi','HKS','0');
INSERT INTO `tk_cities` VALUES('460200','460000','三亚市','海南省-三亚市','','三亚市','海南省','2','572000','0898','','','sanyashi','SYS','0');
INSERT INTO `tk_cities` VALUES('460300','','三沙市','海南省-三沙市','','三沙市','海南省','2','','','','','sanshashi','SSS','0');
INSERT INTO `tk_cities` VALUES('469000','460000','省直辖','海南省-省直辖','','省直辖','海南省','2','572200','0898','','','shengzhixia','SZX','0');
INSERT INTO `tk_cities` VALUES('460105','460100','秀英区','海南省--秀英区','秀英区','','海南省','3','570100','0898','','','xiuyingqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('460106','460100','龙华区','海南省--龙华区','龙华区','','海南省','3','570100','0898','','','longhuaqu','LHQ','0');
INSERT INTO `tk_cities` VALUES('460107','460100','琼山区','海南省--琼山区','琼山区','','海南省','3','571100','0898','','','qiongshanqu','QSQ','0');
INSERT INTO `tk_cities` VALUES('460108','460100','美兰区','海南省--美兰区','美兰区','','海南省','3','570100','0898','','','meilanqu','MLQ','0');
INSERT INTO `tk_cities` VALUES('460201','460200','三亚市','海南省-三亚市','','三亚市','海南省','2','572000','0898','','','sanyashi','SYS','0');
INSERT INTO `tk_cities` VALUES('460901','','西沙群岛','海南省-三沙市-西沙群岛','西沙群岛','三沙市','海南省','3','','','','','xishaqundao','XSQD','0');
INSERT INTO `tk_cities` VALUES('460902','','南沙群岛','海南省-三沙市-南沙群岛','南沙群岛','三沙市','海南省','3','','','','','nanshaqundao','NSQD','0');
INSERT INTO `tk_cities` VALUES('460903','','中沙群岛','海南省-三沙市-中沙群岛','中沙群岛','三沙市','海南省','3','','','','','zhongshaqundao','ZSQD','0');
INSERT INTO `tk_cities` VALUES('469001','469000','五指山市','海南省-省直辖-五指山市','五指山市','省直辖','海南省','3','572200','0898','','','wuzhishanshi','WZSS','0');
INSERT INTO `tk_cities` VALUES('469002','469000','琼海市','海南省-省直辖-琼海市','琼海市','省直辖','海南省','3','571400','0898','','','qionghaishi','QHS','0');
INSERT INTO `tk_cities` VALUES('469003','469000','儋州市','海南省-省直辖-儋州市','儋州市','省直辖','海南省','3','571700','0898','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('469005','469000','文昌市','海南省-省直辖-文昌市','文昌市','省直辖','海南省','3','571300','0898','','','wenchangshi','WCS','0');
INSERT INTO `tk_cities` VALUES('469006','469000','万宁市','海南省-省直辖-万宁市','万宁市','省直辖','海南省','3','571500','0898','','','wanningshi','WNS','0');
INSERT INTO `tk_cities` VALUES('469007','469000','东方市','海南省-省直辖-东方市','东方市','省直辖','海南省','3','572600','0898','','','dongfangshi','DFS','0');
INSERT INTO `tk_cities` VALUES('469021','469000','定安县','海南省-省直辖-定安县','定安县','省直辖','海南省','3','571200 ','0898','','','dinganxian','DAX','0');
INSERT INTO `tk_cities` VALUES('469022','469000','屯昌县','海南省-省直辖-屯昌县','屯昌县','省直辖','海南省','3','571600','0898','','','tunchangxian','TCX','0');
INSERT INTO `tk_cities` VALUES('469023','469000','澄迈县','海南省-省直辖-澄迈县','澄迈县','省直辖','海南省','3','571900','0898','','','chengmaixian','CMX','0');
INSERT INTO `tk_cities` VALUES('469024','469000','临高县','海南省-省直辖-临高县','临高县','省直辖','海南省','3','571800','0898','','','lingaoxian','LGX','0');
INSERT INTO `tk_cities` VALUES('469025','469000','白沙黎族自治县','海南省-省直辖-白沙黎族自治县','白沙黎族自治县','省直辖','海南省','3','571200','0898','','','baishalizuzizhixian','BSLZZZX','0');
INSERT INTO `tk_cities` VALUES('469026','469000','昌江黎族自治县','海南省-省直辖-昌江黎族自治县','昌江黎族自治县','省直辖','海南省','3','571600','0898','','','changjianglizuzizhixian','CJLZZZX','0');
INSERT INTO `tk_cities` VALUES('469027','469000','乐东黎族自治县','海南省-省直辖-乐东黎族自治县','乐东黎族自治县','省直辖','海南省','3','571900','0898','','','ledonglizuzizhixian','LDLZZZX','0');
INSERT INTO `tk_cities` VALUES('469028','469000','陵水黎族自治县','海南省-省直辖-陵水黎族自治县','陵水黎族自治县','省直辖','海南省','3','571800','0898','','','lingshuilizuzizhixian','LSLZZZX','0');
INSERT INTO `tk_cities` VALUES('469029','469000','保亭黎族苗族自治县','海南省-省直辖-保亭黎族苗族自治县','保亭黎族苗族自治县','省直辖','海南省','3','572300','0898','','','baotinglizumiaozuzizhixian','BTLZMZZZX','0');
INSERT INTO `tk_cities` VALUES('469030','469000','琼中黎族苗族自治县','海南省-省直辖-琼中黎族苗族自治县','琼中黎族苗族自治县','省直辖','海南省','3','572800','0898','','','qiongzhonglizumiaozuzizhixian','QZLZMZZZX','0');
INSERT INTO `tk_cities` VALUES('500000','0','重庆市','重庆市','','重庆市','','1','404100','023','','','','','1');
INSERT INTO `tk_cities` VALUES('500101','500000','万州区','重庆市-万州区','万州区','重庆市','','3','404100','023','','','wanzhouqu','WZQ','0');
INSERT INTO `tk_cities` VALUES('500102','500000','涪陵区','重庆市-涪陵区','涪陵区','重庆市','','3','408000','023','','','fulingqu','FLQ','0');
INSERT INTO `tk_cities` VALUES('500103','500000','渝中区','重庆市-渝中区','渝中区','重庆市','','3','400000','023','','','yuzhongqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('500104','500000','大渡口区','重庆市-大渡口区','大渡口区','重庆市','','3','400000','023','','','dadukouqu','DDKQ','0');
INSERT INTO `tk_cities` VALUES('500105','500000','江北区','重庆市-江北区','江北区','重庆市','','3','400000','023','','','jiangbeiqu','JBQ','0');
INSERT INTO `tk_cities` VALUES('500106','500000','沙坪坝区','重庆市-沙坪坝区','沙坪坝区','重庆市','','3','400000','023','','','shapingbaqu','SPBQ','0');
INSERT INTO `tk_cities` VALUES('500107','500000','九龙坡区','重庆市-九龙坡区','九龙坡区','重庆市','','3','400000','023','','','jiulongpoqu','JLPQ','0');
INSERT INTO `tk_cities` VALUES('500108','500000','南岸区','重庆市-南岸区','南岸区','重庆市','','3','400000','023','','','nananqu','NAQ','0');
INSERT INTO `tk_cities` VALUES('500109','500000','北碚区','重庆市-北碚区','北碚区','重庆市','','3','400700','023','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('500110','500000','綦江区','重庆市-綦江区','綦江区','重庆市','','3','400800','023','','','jiangqu','JQ','0');
INSERT INTO `tk_cities` VALUES('500111','500000','大足区','重庆市-大足区','大足区','重庆市','','3','400900','023','','','dazuqu','DZQ','0');
INSERT INTO `tk_cities` VALUES('500112','500000','渝北区','重庆市-渝北区','渝北区','重庆市','','3','401120','023','','','yubeiqu','YBQ','0');
INSERT INTO `tk_cities` VALUES('500113','500000','巴南区','重庆市-巴南区','巴南区','重庆市','','3','401320','023','','','bananqu','BNQ','0');
INSERT INTO `tk_cities` VALUES('500114','500000','黔江区','重庆市-黔江区','黔江区','重庆市','','3','409000','023','','','qianjiangqu','QJQ','0');
INSERT INTO `tk_cities` VALUES('500115','500000','长寿区','重庆市-长寿区','长寿区','重庆市','','3','401220','023','','','changshouqu','CSQ','0');
INSERT INTO `tk_cities` VALUES('500116','500000','江津区','重庆市-江津区','江津区','重庆市','','3','402260','023','','','jiangjinqu','JJQ','0');
INSERT INTO `tk_cities` VALUES('500117','500000','合川区','重庆市-合川区','合川区','重庆市','','3','401520','023','','','hechuanqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('500118','500000','永川区','重庆市-永川区','永川区','重庆市','','3','402160','023','','','yongchuanqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('500119','500000','南川区','重庆市-南川区','南川区','重庆市','','3','408400','023','','','nanchuanqu','NCQ','0');
INSERT INTO `tk_cities` VALUES('500223','500000','潼南县','重庆市-潼南县','潼南县','重庆市','','3','402660','023','','','nanxian','NX','0');
INSERT INTO `tk_cities` VALUES('500224','500000','铜梁县','重庆市-铜梁县','铜梁县','重庆市','','3','402560','023','','','tongliangxian','TLX','0');
INSERT INTO `tk_cities` VALUES('500226','500000','荣昌县','重庆市-荣昌县','荣昌县','重庆市','','3','402460','023','','','rongchangxian','RCX','0');
INSERT INTO `tk_cities` VALUES('500227','500000','璧山县','重庆市-璧山县','璧山县','重庆市','','3','402760','023','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('500228','500000','梁平县','重庆市-梁平县','梁平县','重庆市','','3','405200','023','','','liangpingxian','LPX','0');
INSERT INTO `tk_cities` VALUES('500229','500000','城口县','重庆市-城口县','城口县','重庆市','','3','405900','023','','','chengkouxian','CKX','0');
INSERT INTO `tk_cities` VALUES('500230','500000','丰都县','重庆市-丰都县','丰都县','重庆市','','3','408200','023','','','fengduxian','FDX','0');
INSERT INTO `tk_cities` VALUES('500231','500000','垫江县','重庆市-垫江县','垫江县','重庆市','','3','408300','023','','','dianjiangxian','DJX','0');
INSERT INTO `tk_cities` VALUES('500232','500000','武隆县','重庆市-武隆县','武隆县','重庆市','','3','408500','023','','','wulongxian','WLX','0');
INSERT INTO `tk_cities` VALUES('500233','500000','忠县','重庆市-忠县','忠县','重庆市','','3','404300','023','','','zhongxian','ZX','0');
INSERT INTO `tk_cities` VALUES('500234','500000','开县','重庆市-开县','开县','重庆市','','3','405400','023','','','kaixian','KX','0');
INSERT INTO `tk_cities` VALUES('500235','500000','云阳县','重庆市-云阳县','云阳县','重庆市','','3','404500','023','','','yunyangxian','YYX','0');
INSERT INTO `tk_cities` VALUES('500236','500000','奉节县','重庆市-奉节县','奉节县','重庆市','','3','404600','023','','','fengjiexian','FJX','0');
INSERT INTO `tk_cities` VALUES('500237','500000','巫山县','重庆市-巫山县','巫山县','重庆市','','3','404700','023','','','wushanxian','WSX','0');
INSERT INTO `tk_cities` VALUES('500238','500000','巫溪县','重庆市-巫溪县','巫溪县','重庆市','','3','405800','023','','','wuxixian','WXX','0');
INSERT INTO `tk_cities` VALUES('500240','500000','石柱土家族自治县','重庆市-石柱土家族自治县','石柱土家族自治县','重庆市','','3','409100','023','','','shizhutujiazuzizhixian','SZTJZZZX','0');
INSERT INTO `tk_cities` VALUES('500241','500000','秀山土家族苗族自治县','重庆市-秀山土家族苗族自治县','秀山土家族苗族自治县','重庆市','','3','409900','023','','','xiushantujiazumiaozuzizhixian','XSTJZMZZZX','0');
INSERT INTO `tk_cities` VALUES('500242','500000','酉阳土家族苗族自治县','重庆市-酉阳土家族苗族自治县','酉阳土家族苗族自治县','重庆市','','3','409800','023','','','youyangtujiazumiaozuzizhixian','YYTJZMZZZX','0');
INSERT INTO `tk_cities` VALUES('500243','500000','彭水苗族土家族自治县','重庆市-彭水苗族土家族自治县','彭水苗族土家族自治县','重庆市','','3','409600','023','','','pengshuimiaozutujiazuzizhixian','PSMZTJZZZX','0');
INSERT INTO `tk_cities` VALUES('510000','0','四川省','四川省','','','四川省','1','','','','','sichuansheng','SCS','0');
INSERT INTO `tk_cities` VALUES('510100','510000','成都市','四川省-成都市','','成都市','四川省','2','610000','028','','','chengdushi','CDS','0');
INSERT INTO `tk_cities` VALUES('510300','510000','自贡市','四川省-自贡市','','自贡市','四川省','2','643000','0813','','','zigongshi','ZGS','0');
INSERT INTO `tk_cities` VALUES('510400','510000','攀枝花市','四川省-攀枝花市','','攀枝花市','四川省','2','617000','0812','','','panzhihuashi','PZHS','0');
INSERT INTO `tk_cities` VALUES('510500','510000','泸州市','四川省-泸州市','','泸州市','四川省','2','646000','0830','','','zhoushi','ZS','0');
INSERT INTO `tk_cities` VALUES('510600','510000','德阳市','四川省-德阳市','','德阳市','四川省','2','618000','0838','','','deyangshi','DYS','0');
INSERT INTO `tk_cities` VALUES('510700','510000','绵阳市','四川省-绵阳市','','绵阳市','四川省','2','621000','0816','','','mianyangshi','MYS','0');
INSERT INTO `tk_cities` VALUES('510800','510000','广元市','四川省-广元市','','广元市','四川省','2','628000','0839','','','guangyuanshi','GYS','0');
INSERT INTO `tk_cities` VALUES('510900','510000','遂宁市','四川省-遂宁市','','遂宁市','四川省','2','629000','0825','','','suiningshi','SNS','0');
INSERT INTO `tk_cities` VALUES('511000','510000','内江市','四川省-内江市','','内江市','四川省','2','628000','0839','','','neijiangshi','NJS','0');
INSERT INTO `tk_cities` VALUES('511100','510000','乐山市','四川省-乐山市','','乐山市','四川省','2','614000','0833','','','leshanshi','LSS','0');
INSERT INTO `tk_cities` VALUES('511300','510000','南充市','四川省-南充市','','南充市','四川省','2','637000','0817','','','nanchongshi','NCS','0');
INSERT INTO `tk_cities` VALUES('511400','510000','眉山市','四川省-眉山市','','眉山市','四川省','2','620000','0833','','','meishanshi','MSS','0');
INSERT INTO `tk_cities` VALUES('511500','510000','宜宾市','四川省-宜宾市','','宜宾市','四川省','2','644000','0831','','','yibinshi','YBS','0');
INSERT INTO `tk_cities` VALUES('511600','510000','广安市','四川省-广安市','','广安市','四川省','2','638550','0826','','','guanganshi','GAS','0');
INSERT INTO `tk_cities` VALUES('511700','510000','达州市','四川省-达州市','','达州市','四川省','2','635000','0818','','','dazhoushi','DZS','0');
INSERT INTO `tk_cities` VALUES('511800','510000','雅安市','四川省-雅安市','','雅安市','四川省','2','625000','0835','','','yaanshi','YAS','0');
INSERT INTO `tk_cities` VALUES('511900','510000','巴中市','四川省-巴中市','','巴中市','四川省','2','636600','0827','','','bazhongshi','BZS','0');
INSERT INTO `tk_cities` VALUES('512000','510000','资阳市','四川省-资阳市','','资阳市','四川省','2','641300','0832','','','ziyangshi','ZYS','0');
INSERT INTO `tk_cities` VALUES('513200','510000','阿坝藏族羌族自治州 ','四川省-阿坝藏族羌族自治州 ','','阿坝藏族羌族自治州 ','四川省','2','623000','0837','','','abacangzuqiangzuzizhizhou','ABCZQZZZZ','0');
INSERT INTO `tk_cities` VALUES('513300','510000','甘孜藏族自治州 ','四川省-甘孜藏族自治州 ','','甘孜藏族自治州 ','四川省','2','626000','0836','','','ganzicangzuzizhizhou','GZCZZZZ','0');
INSERT INTO `tk_cities` VALUES('513400','510000','凉山彝族自治州 ','四川省-凉山彝族自治州 ','','凉山彝族自治州 ','四川省','2','615000','0834','','','liangshanyizuzizhizhou','LSYZZZZ','0');
INSERT INTO `tk_cities` VALUES('510104','510100','锦江区','四川省-成都市-锦江区','锦江区','成都市','四川省','3','610000','028','','','jinjiangqu','JJQ','0');
INSERT INTO `tk_cities` VALUES('510105','510100','青羊区','四川省-成都市-青羊区','青羊区','成都市','四川省','3','610000','028','','','qingyangqu','QYQ','0');
INSERT INTO `tk_cities` VALUES('510106','510100','金牛区','四川省-成都市-金牛区','金牛区','成都市','四川省','3','610000','028','','','jinniuqu','JNQ','0');
INSERT INTO `tk_cities` VALUES('510107','510100','武侯区','四川省-成都市-武侯区','武侯区','成都市','四川省','3','610000','028','','','wuhouqu','WHQ','0');
INSERT INTO `tk_cities` VALUES('510108','510100','成华区','四川省-成都市-成华区','成华区','成都市','四川省','3','610000','028','','','chenghuaqu','CHQ','0');
INSERT INTO `tk_cities` VALUES('510112','510100','龙泉驿区','四川省-成都市-龙泉驿区','龙泉驿区','成都市','四川省','3','610100','028','','','longquanqu','LQQ','0');
INSERT INTO `tk_cities` VALUES('510113','510100','青白江区','四川省-成都市-青白江区','青白江区','成都市','四川省','3','610300','028','','','qingbaijiangqu','QBJQ','0');
INSERT INTO `tk_cities` VALUES('510114','510100','新都区','四川省-成都市-新都区','新都区','成都市','四川省','3','610500','028','','','xinduqu','XDQ','0');
INSERT INTO `tk_cities` VALUES('510115','510100','温江区','四川省-成都市-温江区','温江区','成都市','四川省','3','611100','028','','','wenjiangqu','WJQ','0');
INSERT INTO `tk_cities` VALUES('510121','510100','金堂县','四川省-成都市-金堂县','金堂县','成都市','四川省','3','610400','028','','','jintangxian','JTX','0');
INSERT INTO `tk_cities` VALUES('510122','510100','双流县','四川省-成都市-双流县','双流县','成都市','四川省','3','610200','028','','','shuangliuxian','SLX','0');
INSERT INTO `tk_cities` VALUES('510124','510100','郫县','四川省-成都市-郫县','郫县','成都市','四川省','3','611700','028','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('510129','510100','大邑县','四川省-成都市-大邑县','大邑县','成都市','四川省','3','611300','028','','','dayixian','DYX','0');
INSERT INTO `tk_cities` VALUES('510131','510100','蒲江县','四川省-成都市-蒲江县','蒲江县','成都市','四川省','3','611600','028','','','pujiangxian','PJX','0');
INSERT INTO `tk_cities` VALUES('510132','510100','新津县','四川省-成都市-新津县','新津县','成都市','四川省','3','611400','028','','','xinjinxian','XJX','0');
INSERT INTO `tk_cities` VALUES('510181','510100','都江堰市','四川省-成都市-都江堰市','都江堰市','成都市','四川省','3','611800','028','','','dujiangyanshi','DJYS','0');
INSERT INTO `tk_cities` VALUES('510182','510100','彭州市','四川省-成都市-彭州市','彭州市','成都市','四川省','3','610000','028','','','pengzhoushi','PZS','0');
INSERT INTO `tk_cities` VALUES('510183','510100','邛崃市','四川省-成都市-邛崃市','邛崃市','成都市','四川省','3','611500','028','','','shi','S','0');
INSERT INTO `tk_cities` VALUES('510184','510100','崇州市','四川省-成都市-崇州市','崇州市','成都市','四川省','3','611200','028','','','chongzhoushi','CZS','0');
INSERT INTO `tk_cities` VALUES('510302','510300','自流井区','四川省-自贡市-自流井区','自流井区','自贡市','四川省','3','643000','0813','','','ziliujingqu','ZLJQ','0');
INSERT INTO `tk_cities` VALUES('510303','510300','贡井区','四川省-自贡市-贡井区','贡井区','自贡市','四川省','3','643020','0813','','','gongjingqu','GJQ','0');
INSERT INTO `tk_cities` VALUES('510304','510300','大安区','四川省-自贡市-大安区','大安区','自贡市','四川省','3','643010','0813','','','daanqu','DAQ','0');
INSERT INTO `tk_cities` VALUES('510311','510300','沿滩区','四川省-自贡市-沿滩区','沿滩区','自贡市','四川省','3','643030','0813','','','yantanqu','YTQ','0');
INSERT INTO `tk_cities` VALUES('510321','510300','荣县','四川省-自贡市-荣县','荣县','自贡市','四川省','3','643100','0813','','','rongxian','RX','0');
INSERT INTO `tk_cities` VALUES('510322','510300','富顺县','四川省-自贡市-富顺县','富顺县','自贡市','四川省','3','643200','0813','','','fushunxian','FSX','0');
INSERT INTO `tk_cities` VALUES('510402','510400','东区','四川省-攀枝花市-东区','东区','攀枝花市','四川省','3','617000','0812','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('510403','510400','西区','四川省-攀枝花市-西区','西区','攀枝花市','四川省','3','617000','0812','','','xiqu','XQ','0');
INSERT INTO `tk_cities` VALUES('510411','510400','仁和区','四川省-攀枝花市-仁和区','仁和区','攀枝花市','四川省','3','617000','0812','','','renhequ','RHQ','0');
INSERT INTO `tk_cities` VALUES('510421','510400','米易县','四川省-攀枝花市-米易县','米易县','攀枝花市','四川省','3','617200','0812','','','miyixian','MYX','0');
INSERT INTO `tk_cities` VALUES('510422','510400','盐边县','四川省-攀枝花市-盐边县','盐边县','攀枝花市','四川省','3','617100','0812','','','yanbianxian','YBX','0');
INSERT INTO `tk_cities` VALUES('510502','510500','江阳区','四川省-泸州市-江阳区','江阳区','泸州市','四川省','3','646000','0830','','','jiangyangqu','JYQ','0');
INSERT INTO `tk_cities` VALUES('510503','510500','纳溪区','四川省-泸州市-纳溪区','纳溪区','泸州市','四川省','3','646300','0830','','','naxiqu','NXQ','0');
INSERT INTO `tk_cities` VALUES('510504','510500','龙马潭区','四川省-泸州市-龙马潭区','龙马潭区','泸州市','四川省','3','646000','0830','','','longmatanqu','LMTQ','0');
INSERT INTO `tk_cities` VALUES('510521','510500','泸县','四川省-泸州市-泸县','泸县','泸州市','四川省','3','646100','0830','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('510522','510500','合江县','四川省-泸州市-合江县','合江县','泸州市','四川省','3','646200','0830','','','hejiangxian','HJX','0');
INSERT INTO `tk_cities` VALUES('510524','510500','叙永县','四川省-泸州市-叙永县','叙永县','泸州市','四川省','3','646400','0830','','','xuyongxian','XYX','0');
INSERT INTO `tk_cities` VALUES('510525','510500','古蔺县','四川省-泸州市-古蔺县','古蔺县','泸州市','四川省','3','646500','0830','','','guxian','GX','0');
INSERT INTO `tk_cities` VALUES('510603','510600','旌阳区','四川省-德阳市-旌阳区','旌阳区','德阳市','四川省','3','618000','0838','','','yangqu','YQ','0');
INSERT INTO `tk_cities` VALUES('510623','510600','中江县','四川省-德阳市-中江县','中江县','德阳市','四川省','3','618300','0838','','','zhongjiangxian','ZJX','0');
INSERT INTO `tk_cities` VALUES('510626','510600','罗江县','四川省-德阳市-罗江县','罗江县','德阳市','四川省','3','618500','0838','','','luojiangxian','LJX','0');
INSERT INTO `tk_cities` VALUES('510681','510600','广汉市','四川省-德阳市-广汉市','广汉市','德阳市','四川省','3','618300','0838','','','guanghanshi','GHS','0');
INSERT INTO `tk_cities` VALUES('510682','510600','什邡市','四川省-德阳市-什邡市','什邡市','德阳市','四川省','3','618400','0838','','','shishi','SS','0');
INSERT INTO `tk_cities` VALUES('510683','510600','绵竹市','四川省-德阳市-绵竹市','绵竹市','德阳市','四川省','3','618200','0838','','','mianzhushi','MZS','0');
INSERT INTO `tk_cities` VALUES('510703','510700','涪城区','四川省-绵阳市-涪城区','涪城区','绵阳市','四川省','3','621000','0816','','','fuchengqu','FCQ','0');
INSERT INTO `tk_cities` VALUES('510704','510700','游仙区','四川省-绵阳市-游仙区','游仙区','绵阳市','四川省','3','621000','0816','','','youxianqu','YXQ','0');
INSERT INTO `tk_cities` VALUES('510722','510700','三台县','四川省-绵阳市-三台县','三台县','绵阳市','四川省','3','621100','0816','','','santaixian','STX','0');
INSERT INTO `tk_cities` VALUES('510723','510700','盐亭县','四川省-绵阳市-盐亭县','盐亭县','绵阳市','四川省','3','621600','0816','','','yantingxian','YTX','0');
INSERT INTO `tk_cities` VALUES('510724','510700','安县','四川省-绵阳市-安县','安县','绵阳市','四川省','3','622650','0816','','','anxian','AX','0');
INSERT INTO `tk_cities` VALUES('510725','510700','梓潼县','四川省-绵阳市-梓潼县','梓潼县','绵阳市','四川省','3','622150','0816','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('510726','510700','北川羌族自治县','四川省-绵阳市-北川羌族自治县','北川羌族自治县','绵阳市','四川省','3','622550','0816','','','beichuanqiangzuzizhixian','BCQZZZX','0');
INSERT INTO `tk_cities` VALUES('510727','510700','平武县','四川省-绵阳市-平武县','平武县','绵阳市','四川省','3','622550','0816','','','pingwuxian','PWX','0');
INSERT INTO `tk_cities` VALUES('510781','510700','江油市','四川省-绵阳市-江油市','江油市','绵阳市','四川省','3','621700','0816','','','jiangyoushi','JYS','0');
INSERT INTO `tk_cities` VALUES('510802','510800','利州区','四川省-广元市-利州区','利州区','广元市','四川省','3','628000','0839','','','lizhouqu','LZQ','0');
INSERT INTO `tk_cities` VALUES('510811','510800','元坝区','四川省-广元市-元坝区','元坝区','广元市','四川省','3','628000','0839','','','yuanbaqu','YBQ','0');
INSERT INTO `tk_cities` VALUES('510812','510800','朝天区','四川省-广元市-朝天区','朝天区','广元市','四川省','3','628000','0839','','','chaotianqu','CTQ','0');
INSERT INTO `tk_cities` VALUES('510821','510800','旺苍县','四川省-广元市-旺苍县','旺苍县','广元市','四川省','3','628200','0839','','','wangcangxian','WCX','0');
INSERT INTO `tk_cities` VALUES('510822','510800','青川县','四川省-广元市-青川县','青川县','广元市','四川省','3','628100','0839','','','qingchuanxian','QCX','0');
INSERT INTO `tk_cities` VALUES('510823','510800','剑阁县','四川省-广元市-剑阁县','剑阁县','广元市','四川省','3','628300','0839','','','jiangexian','JGX','0');
INSERT INTO `tk_cities` VALUES('510824','510800','苍溪县','四川省-广元市-苍溪县','苍溪县','广元市','四川省','3','628400','0839','','','cangxixian','CXX','0');
INSERT INTO `tk_cities` VALUES('510903','510900','船山区','四川省-遂宁市-船山区','船山区','遂宁市','四川省','3','629000','0825','','','chuanshanqu','CSQ','0');
INSERT INTO `tk_cities` VALUES('510904','510900','安居区','四川省-遂宁市-安居区','安居区','遂宁市','四川省','3','629000','0825','','','anjuqu','AJQ','0');
INSERT INTO `tk_cities` VALUES('510921','510900','蓬溪县','四川省-遂宁市-蓬溪县','蓬溪县','遂宁市','四川省','3','629100','0825','','','pengxixian','PXX','0');
INSERT INTO `tk_cities` VALUES('510922','510900','射洪县','四川省-遂宁市-射洪县','射洪县','遂宁市','四川省','3','629200','0825','','','shehongxian','SHX','0');
INSERT INTO `tk_cities` VALUES('510923','510900','大英县','四川省-遂宁市-大英县','大英县','遂宁市','四川省','3','629300','0825','','','dayingxian','DYX','0');
INSERT INTO `tk_cities` VALUES('511002','511000','市中区','四川省-内江市-市中区','市中区','内江市','四川省','3','641000','0832','','','shizhongqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('511011','511000','东兴区','四川省-内江市-东兴区','东兴区','内江市','四川省','3','641100','0832','','','dongxingqu','DXQ','0');
INSERT INTO `tk_cities` VALUES('511024','511000','威远县','四川省-内江市-威远县','威远县','内江市','四川省','3','642450','0832','','','weiyuanxian','WYX','0');
INSERT INTO `tk_cities` VALUES('511025','511000','资中县','四川省-内江市-资中县','资中县','内江市','四川省','3','641200','0832','','','zizhongxian','ZZX','0');
INSERT INTO `tk_cities` VALUES('511028','511000','隆昌县','四川省-内江市-隆昌县','隆昌县','内江市','四川省','3','642150','0832','','','longchangxian','LCX','0');
INSERT INTO `tk_cities` VALUES('511102','511100','市中区','四川省-乐山市-市中区','市中区','乐山市','四川省','3','614000','0833','','','shizhongqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('511111','511100','沙湾区','四川省-乐山市-沙湾区','沙湾区','乐山市','四川省','3','614900','0833','','','shawanqu','SWQ','0');
INSERT INTO `tk_cities` VALUES('511112','511100','五通桥区','四川省-乐山市-五通桥区','五通桥区','乐山市','四川省','3','614800','0833','','','wutongqiaoqu','WTQQ','0');
INSERT INTO `tk_cities` VALUES('511113','511100','金口河区','四川省-乐山市-金口河区','金口河区','乐山市','四川省','3','614700','0833','','','jinkouhequ','JKHQ','0');
INSERT INTO `tk_cities` VALUES('511123','511100','犍为县','四川省-乐山市-犍为县','犍为县','乐山市','四川省','3','614400','0833','','','weixian','WX','0');
INSERT INTO `tk_cities` VALUES('511124','511100','井研县','四川省-乐山市-井研县','井研县','乐山市','四川省','3','613100','0833','','','jingyanxian','JYX','0');
INSERT INTO `tk_cities` VALUES('511126','511100','夹江县','四川省-乐山市-夹江县','夹江县','乐山市','四川省','3','614100','0833','','','jiajiangxian','JJX','0');
INSERT INTO `tk_cities` VALUES('511129','511100','沐川县','四川省-乐山市-沐川县','沐川县','乐山市','四川省','3','614500','0833','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('511132','511100','峨边彝族自治县','四川省-乐山市-峨边彝族自治县','峨边彝族自治县','乐山市','四川省','3','614300','0833','','','ebianyizuzizhixian','EBYZZZX','0');
INSERT INTO `tk_cities` VALUES('511133','511100','马边彝族自治县','四川省-乐山市-马边彝族自治县','马边彝族自治县','乐山市','四川省','3','614600','0833','','','mabianyizuzizhixian','MBYZZZX','0');
INSERT INTO `tk_cities` VALUES('511181','511100','峨眉山市','四川省-乐山市-峨眉山市','峨眉山市','乐山市','四川省','3','614200','0833','','','emeishanshi','EMSS','0');
INSERT INTO `tk_cities` VALUES('511302','511300','顺庆区','四川省-南充市-顺庆区','顺庆区','南充市','四川省','3','637000','0817','','','shunqingqu','SQQ','0');
INSERT INTO `tk_cities` VALUES('511303','511300','高坪区','四川省-南充市-高坪区','高坪区','南充市','四川省','3','637100','0817','','','gaopingqu','GPQ','0');
INSERT INTO `tk_cities` VALUES('511304','511300','嘉陵区','四川省-南充市-嘉陵区','嘉陵区','南充市','四川省','3','637500','0817','','','jialingqu','JLQ','0');
INSERT INTO `tk_cities` VALUES('511321','511300','南部县','四川省-南充市-南部县','南部县','南充市','四川省','3','637300','0817','','','nanbuxian','NBX','0');
INSERT INTO `tk_cities` VALUES('511322','511300','营山县','四川省-南充市-营山县','营山县','南充市','四川省','3','637700','0817','','','yingshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('511323','511300','蓬安县','四川省-南充市-蓬安县','蓬安县','南充市','四川省','3','637800','0817','','','penganxian','PAX','0');
INSERT INTO `tk_cities` VALUES('511324','511300','仪陇县','四川省-南充市-仪陇县','仪陇县','南充市','四川省','3','637600','0817','','','yilongxian','YLX','0');
INSERT INTO `tk_cities` VALUES('511325','511300','西充县','四川省-南充市-西充县','西充县','南充市','四川省','3','637200','0817','','','xichongxian','XCX','0');
INSERT INTO `tk_cities` VALUES('511381','511300','阆中市','四川省-南充市-阆中市','阆中市','南充市','四川省','3','637400','0817','','','zhongshi','ZS','0');
INSERT INTO `tk_cities` VALUES('511402','511400','东坡区','四川省-眉山市-东坡区','东坡区','眉山市','四川省','3','620000','0833','','','dongpoqu','DPQ','0');
INSERT INTO `tk_cities` VALUES('511421','511400','仁寿县','四川省-眉山市-仁寿县','仁寿县','眉山市','四川省','3','620500','0833','','','renshouxian','RSX','0');
INSERT INTO `tk_cities` VALUES('511422','511400','彭山县','四川省-眉山市-彭山县','彭山县','眉山市','四川省','3','620800','0833','','','pengshanxian','PSX','0');
INSERT INTO `tk_cities` VALUES('511423','511400','洪雅县','四川省-眉山市-洪雅县','洪雅县','眉山市','四川省','3','620300','0833','','','hongyaxian','HYX','0');
INSERT INTO `tk_cities` VALUES('511424','511400','丹棱县','四川省-眉山市-丹棱县','丹棱县','眉山市','四川省','3','620200','0833','','','danlengxian','DLX','0');
INSERT INTO `tk_cities` VALUES('511425','511400','青神县','四川省-眉山市-青神县','青神县','眉山市','四川省','3','620400','0833','','','qingshenxian','QSX','0');
INSERT INTO `tk_cities` VALUES('511502','511500','翠屏区','四川省-宜宾市-翠屏区','翠屏区','宜宾市','四川省','3','644000','0831','','','cuipingqu','CPQ','0');
INSERT INTO `tk_cities` VALUES('511522','511500','南溪区','四川省-宜宾市-南溪区','南溪区','宜宾市','四川省','3','644100','0831','','','nanxiqu','NXQ','0');
INSERT INTO `tk_cities` VALUES('511521','511500','宜宾县','四川省-宜宾市-宜宾县','宜宾县','宜宾市','四川省','3','644600','0831','','','yibinxian','YBX','0');
INSERT INTO `tk_cities` VALUES('511523','511500','江安县','四川省-宜宾市-江安县','江安县','宜宾市','四川省','3','644200','0831','','','jianganxian','JAX','0');
INSERT INTO `tk_cities` VALUES('511524','511500','长宁县','四川省-宜宾市-长宁县','长宁县','宜宾市','四川省','3','644300','0831','','','changningxian','CNX','0');
INSERT INTO `tk_cities` VALUES('511525','511500','高县','四川省-宜宾市-高县','高县','宜宾市','四川省','3','645150','0831','','','gaoxian','GX','0');
INSERT INTO `tk_cities` VALUES('511526','511500','珙县','四川省-宜宾市-珙县','珙县','宜宾市','四川省','3','644500','0831','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('511527','511500','筠连县','四川省-宜宾市-筠连县','筠连县','宜宾市','四川省','3','645250','0831','','','lianxian','LX','0');
INSERT INTO `tk_cities` VALUES('511528','511500','兴文县','四川省-宜宾市-兴文县','兴文县','宜宾市','四川省','3','644400','0831','','','xingwenxian','XWX','0');
INSERT INTO `tk_cities` VALUES('511529','511500','屏山县','四川省-宜宾市-屏山县','屏山县','宜宾市','四川省','3','645350','0831','','','pingshanxian','PSX','0');
INSERT INTO `tk_cities` VALUES('511602','511600','广安区','四川省-广安市-广安区','广安区','广安市','四川省','3','638550','0826','','','guanganqu','GAQ','0');
INSERT INTO `tk_cities` VALUES('511621','511600','岳池县','四川省-广安市-岳池县','岳池县','广安市','四川省','3','638300','0826','','','yuechixian','YCX','0');
INSERT INTO `tk_cities` VALUES('511622','511600','武胜县','四川省-广安市-武胜县','武胜县','广安市','四川省','3','638400','0826','','','wushengxian','WSX','0');
INSERT INTO `tk_cities` VALUES('511623','511600','邻水县','四川省-广安市-邻水县','邻水县','广安市','四川省','3','638500','0826','','','linshuixian','LSX','0');
INSERT INTO `tk_cities` VALUES('511681','511600','华蓥市','四川省-广安市-华蓥市','华蓥市','广安市','四川省','3','638600','0826','','','huashi','HS','0');
INSERT INTO `tk_cities` VALUES('511702','511700','通川区','四川省-达州市-通川区','通川区','达州市','四川省','3','635000','0818','','','tongchuanqu','TCQ','0');
INSERT INTO `tk_cities` VALUES('511721','511700','达县','四川省-达州市-达县','达县','达州市','四川省','3','635000','0818','','','daxian','DX','0');
INSERT INTO `tk_cities` VALUES('511722','511700','宣汉县','四川省-达州市-宣汉县','宣汉县','达州市','四川省','3','636150','0818','','','xuanhanxian','XHX','0');
INSERT INTO `tk_cities` VALUES('511723','511700','开江县','四川省-达州市-开江县','开江县','达州市','四川省','3','636250','0818','','','kaijiangxian','KJX','0');
INSERT INTO `tk_cities` VALUES('511724','511700','大竹县','四川省-达州市-大竹县','大竹县','达州市','四川省','3','635100','0818','','','dazhuxian','DZX','0');
INSERT INTO `tk_cities` VALUES('511725','511700','渠县','四川省-达州市-渠县','渠县','达州市','四川省','3','635200','0818','','','quxian','QX','0');
INSERT INTO `tk_cities` VALUES('511781','511700','万源市','四川省-达州市-万源市','万源市','达州市','四川省','3','636350','0818','','','wanyuanshi','WYS','0');
INSERT INTO `tk_cities` VALUES('511802','511800','雨城区','四川省-雅安市-雨城区','雨城区','雅安市','四川省','3','625000','0835','','','yuchengqu','YCQ','0');
INSERT INTO `tk_cities` VALUES('511821','511800','名山县','四川省-雅安市-名山县','名山县','雅安市','四川省','3','625100','0835','','','mingshanxian','MSX','0');
INSERT INTO `tk_cities` VALUES('511822','511800','荥经县','四川省-雅安市-荥经县','荥经县','雅安市','四川省','3','625200','0835','','','jingxian','JX','0');
INSERT INTO `tk_cities` VALUES('511823','511800','汉源县','四川省-雅安市-汉源县','汉源县','雅安市','四川省','3','625300','0835','','','hanyuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('511824','511800','石棉县','四川省-雅安市-石棉县','石棉县','雅安市','四川省','3','625400','0835','','','shimianxian','SMX','0');
INSERT INTO `tk_cities` VALUES('511825','511800','天全县','四川省-雅安市-天全县','天全县','雅安市','四川省','3','625500','0835','','','tianquanxian','TQX','0');
INSERT INTO `tk_cities` VALUES('511826','511800','芦山县','四川省-雅安市-芦山县','芦山县','雅安市','四川省','3','625600','0835','','','lushanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('511827','511800','宝兴县','四川省-雅安市-宝兴县','宝兴县','雅安市','四川省','3','625700','0835','','','baoxingxian','BXX','0');
INSERT INTO `tk_cities` VALUES('511902','511900','巴州区','四川省-巴中市-巴州区','巴州区','巴中市','四川省','3','636600','0827','','','bazhouqu','BZQ','0');
INSERT INTO `tk_cities` VALUES('511921','511900','通江县','四川省-巴中市-通江县','通江县','巴中市','四川省','3','636700','0827','','','tongjiangxian','TJX','0');
INSERT INTO `tk_cities` VALUES('511922','511900','南江县','四川省-巴中市-南江县','南江县','巴中市','四川省','3','635600','0827','','','nanjiangxian','NJX','0');
INSERT INTO `tk_cities` VALUES('511923','511900','平昌县','四川省-巴中市-平昌县','平昌县','巴中市','四川省','3','636400','0827','','','pingchangxian','PCX','0');
INSERT INTO `tk_cities` VALUES('512002','512000','雁江区','四川省-资阳市-雁江区','雁江区','资阳市','四川省','3','641300','0832','','','yanjiangqu','YJQ','0');
INSERT INTO `tk_cities` VALUES('512021','512000','安岳县','四川省-资阳市-安岳县','安岳县','资阳市','四川省','3','642350','0832','','','anyuexian','AYX','0');
INSERT INTO `tk_cities` VALUES('512022','512000','乐至县','四川省-资阳市-乐至县','乐至县','资阳市','四川省','3','641500','0832','','','lezhixian','LZX','0');
INSERT INTO `tk_cities` VALUES('512081','512000','简阳市','四川省-资阳市-简阳市','简阳市','资阳市','四川省','3','641400','0832','','','jianyangshi','JYS','0');
INSERT INTO `tk_cities` VALUES('513221','513200','汶川县','四川省-阿坝藏族羌族自治州 -汶川县','汶川县','阿坝藏族羌族自治州 ','四川省','3','623000','0837','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('513222','513200','理县','四川省-阿坝藏族羌族自治州 -理县','理县','阿坝藏族羌族自治州 ','四川省','3','623100','0837','','','lixian','LX','0');
INSERT INTO `tk_cities` VALUES('513223','513200','茂县','四川省-阿坝藏族羌族自治州 -茂县','茂县','阿坝藏族羌族自治州 ','四川省','3','623200','0837','','','maoxian','MX','0');
INSERT INTO `tk_cities` VALUES('513224','513200','松潘县','四川省-阿坝藏族羌族自治州 -松潘县','松潘县','阿坝藏族羌族自治州 ','四川省','3','623300','0837','','','songpanxian','SPX','0');
INSERT INTO `tk_cities` VALUES('513225','513200','九寨沟县','四川省-阿坝藏族羌族自治州 -九寨沟县','九寨沟县','阿坝藏族羌族自治州 ','四川省','3','623400','0837','','','jiuzhaigouxian','JZGX','0');
INSERT INTO `tk_cities` VALUES('513226','513200','金川县','四川省-阿坝藏族羌族自治州 -金川县','金川县','阿坝藏族羌族自治州 ','四川省','3','624100','0837','','','jinchuanxian','JCX','0');
INSERT INTO `tk_cities` VALUES('513227','513200','小金县','四川省-阿坝藏族羌族自治州 -小金县','小金县','阿坝藏族羌族自治州 ','四川省','3','624200','0837','','','xiaojinxian','XJX','0');
INSERT INTO `tk_cities` VALUES('513228','513200','黑水县','四川省-阿坝藏族羌族自治州 -黑水县','黑水县','阿坝藏族羌族自治州 ','四川省','3','623500','0837','','','heishuixian','HSX','0');
INSERT INTO `tk_cities` VALUES('513229','513200','马尔康县','四川省-阿坝藏族羌族自治州 -马尔康县','马尔康县','阿坝藏族羌族自治州 ','四川省','3','624000','0837','','','maerkangxian','MEKX','0');
INSERT INTO `tk_cities` VALUES('513230','513200','壤塘县','四川省-阿坝藏族羌族自治州 -壤塘县','壤塘县','阿坝藏族羌族自治州 ','四川省','3','624300','0837','','','rangtangxian','RTX','0');
INSERT INTO `tk_cities` VALUES('513231','513200','阿坝县','四川省-阿坝藏族羌族自治州 -阿坝县','阿坝县','阿坝藏族羌族自治州 ','四川省','3','624600','0837','','','abaxian','ABX','0');
INSERT INTO `tk_cities` VALUES('513232','513200','若尔盖县','四川省-阿坝藏族羌族自治州 -若尔盖县','若尔盖县','阿坝藏族羌族自治州 ','四川省','3','624500','0837','','','ruoergaixian','REGX','0');
INSERT INTO `tk_cities` VALUES('513233','513200','红原县','四川省-阿坝藏族羌族自治州 -红原县','红原县','阿坝藏族羌族自治州 ','四川省','3','624400','0837','','','hongyuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('513321','513300','康定县','四川省-甘孜藏族自治州 -康定县','康定县','甘孜藏族自治州 ','四川省','3','626000','0836','','','kangdingxian','KDX','0');
INSERT INTO `tk_cities` VALUES('513322','513300','泸定县','四川省-甘孜藏族自治州 -泸定县','泸定县','甘孜藏族自治州 ','四川省','3','626100','0836','','','dingxian','DX','0');
INSERT INTO `tk_cities` VALUES('513323','513300','丹巴县','四川省-甘孜藏族自治州 -丹巴县','丹巴县','甘孜藏族自治州 ','四川省','3','626300','0836','','','danbaxian','DBX','0');
INSERT INTO `tk_cities` VALUES('513324','513300','九龙县','四川省-甘孜藏族自治州 -九龙县','九龙县','甘孜藏族自治州 ','四川省','3','616200','0836','','','jiulongxian','JLX','0');
INSERT INTO `tk_cities` VALUES('513325','513300','雅江县','四川省-甘孜藏族自治州 -雅江县','雅江县','甘孜藏族自治州 ','四川省','3','627450','0836','','','yajiangxian','YJX','0');
INSERT INTO `tk_cities` VALUES('513326','513300','道孚县','四川省-甘孜藏族自治州 -道孚县','道孚县','甘孜藏族自治州 ','四川省','3','626400','0836','','','daoxian','DX','0');
INSERT INTO `tk_cities` VALUES('513327','513300','炉霍县','四川省-甘孜藏族自治州 -炉霍县','炉霍县','甘孜藏族自治州 ','四川省','3','626500','0836','','','luhuoxian','LHX','0');
INSERT INTO `tk_cities` VALUES('513328','513300','甘孜县','四川省-甘孜藏族自治州 -甘孜县','甘孜县','甘孜藏族自治州 ','四川省','3','626700','0836','','','ganzixian','GZX','0');
INSERT INTO `tk_cities` VALUES('513329','513300','新龙县','四川省-甘孜藏族自治州 -新龙县','新龙县','甘孜藏族自治州 ','四川省','3','626800','0836','','','xinlongxian','XLX','0');
INSERT INTO `tk_cities` VALUES('513330','513300','德格县','四川省-甘孜藏族自治州 -德格县','德格县','甘孜藏族自治州 ','四川省','3','627250','0836','','','degexian','DGX','0');
INSERT INTO `tk_cities` VALUES('513331','513300','白玉县','四川省-甘孜藏族自治州 -白玉县','白玉县','甘孜藏族自治州 ','四川省','3','627150','0836','','','baiyuxian','BYX','0');
INSERT INTO `tk_cities` VALUES('513332','513300','石渠县','四川省-甘孜藏族自治州 -石渠县','石渠县','甘孜藏族自治州 ','四川省','3','627350','0836','','','shiquxian','SQX','0');
INSERT INTO `tk_cities` VALUES('513333','513300','色达县','四川省-甘孜藏族自治州 -色达县','色达县','甘孜藏族自治州 ','四川省','3','626600','0836','','','sedaxian','SDX','0');
INSERT INTO `tk_cities` VALUES('513334','513300','理塘县','四川省-甘孜藏族自治州 -理塘县','理塘县','甘孜藏族自治州 ','四川省','3','624300','0836','','','litangxian','LTX','0');
INSERT INTO `tk_cities` VALUES('513335','513300','巴塘县','四川省-甘孜藏族自治州 -巴塘县','巴塘县','甘孜藏族自治州 ','四川省','3','627650','0836','','','batangxian','BTX','0');
INSERT INTO `tk_cities` VALUES('513336','513300','乡城县','四川省-甘孜藏族自治州 -乡城县','乡城县','甘孜藏族自治州 ','四川省','3','627850','0836','','','xiangchengxian','XCX','0');
INSERT INTO `tk_cities` VALUES('513337','513300','稻城县','四川省-甘孜藏族自治州 -稻城县','稻城县','甘孜藏族自治州 ','四川省','3','627750','0836','','','daochengxian','DCX','0');
INSERT INTO `tk_cities` VALUES('513338','513300','得荣县','四川省-甘孜藏族自治州 -得荣县','得荣县','甘孜藏族自治州 ','四川省','3','627950','0836','','','derongxian','DRX','0');
INSERT INTO `tk_cities` VALUES('513401','513400','西昌市','四川省-凉山彝族自治州 -西昌市','西昌市','凉山彝族自治州 ','四川省','3','615000','0834','','','xichangshi','XCS','0');
INSERT INTO `tk_cities` VALUES('513422','513400','木里藏族自治县','四川省-凉山彝族自治州 -木里藏族自治县','木里藏族自治县','凉山彝族自治州 ','四川省','3','615800','0834','','','mulicangzuzizhixian','MLCZZZX','0');
INSERT INTO `tk_cities` VALUES('513423','513400','盐源县','四川省-凉山彝族自治州 -盐源县','盐源县','凉山彝族自治州 ','四川省','3','615700','0834','','','yanyuanxian','YYX','0');
INSERT INTO `tk_cities` VALUES('513424','513400','德昌县','四川省-凉山彝族自治州 -德昌县','德昌县','凉山彝族自治州 ','四川省','3','615500','0834','','','dechangxian','DCX','0');
INSERT INTO `tk_cities` VALUES('513425','513400','会理县','四川省-凉山彝族自治州 -会理县','会理县','凉山彝族自治州 ','四川省','3','615100','0834','','','huilixian','HLX','0');
INSERT INTO `tk_cities` VALUES('513426','513400','会东县','四川省-凉山彝族自治州 -会东县','会东县','凉山彝族自治州 ','四川省','3','615200','0834','','','huidongxian','HDX','0');
INSERT INTO `tk_cities` VALUES('513427','513400','宁南县','四川省-凉山彝族自治州 -宁南县','宁南县','凉山彝族自治州 ','四川省','3','615400','0834','','','ningnanxian','NNX','0');
INSERT INTO `tk_cities` VALUES('513428','513400','普格县','四川省-凉山彝族自治州 -普格县','普格县','凉山彝族自治州 ','四川省','3','615300','0834','','','pugexian','PGX','0');
INSERT INTO `tk_cities` VALUES('513429','513400','布拖县','四川省-凉山彝族自治州 -布拖县','布拖县','凉山彝族自治州 ','四川省','3','615350','0834','','','butuoxian','BTX','0');
INSERT INTO `tk_cities` VALUES('513430','513400','金阳县','四川省-凉山彝族自治州 -金阳县','金阳县','凉山彝族自治州 ','四川省','3','616250','0834','','','jinyangxian','JYX','0');
INSERT INTO `tk_cities` VALUES('513431','513400','昭觉县','四川省-凉山彝族自治州 -昭觉县','昭觉县','凉山彝族自治州 ','四川省','3','616150','0834','','','zhaojuexian','ZJX','0');
INSERT INTO `tk_cities` VALUES('513432','513400','喜德县','四川省-凉山彝族自治州 -喜德县','喜德县','凉山彝族自治州 ','四川省','3','616750','0834','','','xidexian','XDX','0');
INSERT INTO `tk_cities` VALUES('513433','513400','冕宁县','四川省-凉山彝族自治州 -冕宁县','冕宁县','凉山彝族自治州 ','四川省','3','615600','0834','','','mianningxian','MNX','0');
INSERT INTO `tk_cities` VALUES('513434','513400','越西县','四川省-凉山彝族自治州 -越西县','越西县','凉山彝族自治州 ','四川省','3','616650','0834','','','yuexixian','YXX','0');
INSERT INTO `tk_cities` VALUES('513435','513400','甘洛县','四川省-凉山彝族自治州 -甘洛县','甘洛县','凉山彝族自治州 ','四川省','3','616850','0834','','','ganluoxian','GLX','0');
INSERT INTO `tk_cities` VALUES('513436','513400','美姑县','四川省-凉山彝族自治州 -美姑县','美姑县','凉山彝族自治州 ','四川省','3','616450','0834','','','meiguxian','MGX','0');
INSERT INTO `tk_cities` VALUES('513437','513400','雷波县','四川省-凉山彝族自治州 -雷波县','雷波县','凉山彝族自治州 ','四川省','3','616550','0834','','','leiboxian','LBX','0');
INSERT INTO `tk_cities` VALUES('520000','0','贵州省','贵州省','','','贵州省','1','','','','','guizhousheng','GZS','0');
INSERT INTO `tk_cities` VALUES('520100','520000','贵阳市','贵州省-贵阳市','','贵阳市','贵州省','2','550000','0851','','','guiyangshi','GYS','0');
INSERT INTO `tk_cities` VALUES('520200','520000','六盘水市','贵州省-六盘水市','','六盘水市','贵州省','2','553000','0858','','','liupanshuishi','LPSS','0');
INSERT INTO `tk_cities` VALUES('520300','520000','遵义市','贵州省-遵义市','','遵义市','贵州省','2','563000','0852','','','zunyishi','ZYS','0');
INSERT INTO `tk_cities` VALUES('520400','520000','安顺市','贵州省-安顺市','','安顺市','贵州省','2','561000','0853','','','anshunshi','ASS','0');
INSERT INTO `tk_cities` VALUES('522200','520000','铜仁市','贵州省-铜仁市','','铜仁市','贵州省','2','554300','0856','','','tongrenshi','TRS','0');
INSERT INTO `tk_cities` VALUES('522300','520000','黔西南布依族苗族自治州 ','贵州省-黔西南布依族苗族自治州 ','','黔西南布依族苗族自治州 ','贵州省','2','562400','0859','','','qianxinanbuyizumiaozuzizhizhou','QXNBYZMZZZZ','0');
INSERT INTO `tk_cities` VALUES('522400','520000','毕节市','贵州省-毕节市','','毕节市','贵州省','2','551700','0857','','','bijieshi','BJS','0');
INSERT INTO `tk_cities` VALUES('522600','520000','黔东南苗族侗族自治州 ','贵州省-黔东南苗族侗族自治州 ','','黔东南苗族侗族自治州 ','贵州省','2','556000','0855','','','qiandongnanmiaozudongzuzizhizhou','QDNMZDZZZZ','0');
INSERT INTO `tk_cities` VALUES('522700','520000','黔南布依族苗族自治州 ','贵州省-黔南布依族苗族自治州 ','','黔南布依族苗族自治州 ','贵州省','2','558000','0854','','','qiannanbuyizumiaozuzizhizhou','QNBYZMZZZZ','0');
INSERT INTO `tk_cities` VALUES('520102','520100','南明区','贵州省-贵阳市-南明区','南明区','贵阳市','贵州省','3','550000','0851','','','nanmingqu','NMQ','0');
INSERT INTO `tk_cities` VALUES('520103','520100','云岩区','贵州省-贵阳市-云岩区','云岩区','贵阳市','贵州省','3','550000','0851','','','yunyanqu','YYQ','0');
INSERT INTO `tk_cities` VALUES('520111','520100','花溪区','贵州省-贵阳市-花溪区','花溪区','贵阳市','贵州省','3','550000','0851','','','huaxiqu','HXQ','0');
INSERT INTO `tk_cities` VALUES('520112','520100','乌当区','贵州省-贵阳市-乌当区','乌当区','贵阳市','贵州省','3','550000','0851','','','wudangqu','WDQ','0');
INSERT INTO `tk_cities` VALUES('520113','520100','白云区','贵州省-贵阳市-白云区','白云区','贵阳市','贵州省','3','550000','0851','','','baiyunqu','BYQ','0');
INSERT INTO `tk_cities` VALUES('520114','520100','小河区','贵州省-贵阳市-小河区','小河区','贵阳市','贵州省','3','550000','0851','','','xiaohequ','XHQ','0');
INSERT INTO `tk_cities` VALUES('520121','520100','开阳县','贵州省-贵阳市-开阳县','开阳县','贵阳市','贵州省','3','550300','0851','','','kaiyangxian','KYX','0');
INSERT INTO `tk_cities` VALUES('520122','520100','息烽县','贵州省-贵阳市-息烽县','息烽县','贵阳市','贵州省','3','551100','0851','','','xifengxian','XFX','0');
INSERT INTO `tk_cities` VALUES('520123','520100','修文县','贵州省-贵阳市-修文县','修文县','贵阳市','贵州省','3','550200','0851','','','xiuwenxian','XWX','0');
INSERT INTO `tk_cities` VALUES('520181','520100','清镇市','贵州省-贵阳市-清镇市','清镇市','贵阳市','贵州省','3','551400','0851','','','qingzhenshi','QZS','0');
INSERT INTO `tk_cities` VALUES('520201','520200','钟山区','贵州省-六盘水市-钟山区','钟山区','六盘水市','贵州省','3','553000','0858','','','zhongshanqu','ZSQ','0');
INSERT INTO `tk_cities` VALUES('520203','520200','六枝特区','贵州省-六盘水市-六枝特区','六枝特区','六盘水市','贵州省','3','553400','0858','','','liuzhitequ','LZTQ','0');
INSERT INTO `tk_cities` VALUES('520221','520200','水城县','贵州省-六盘水市-水城县','水城县','六盘水市','贵州省','3','553000','0858','','','shuichengxian','SCX','0');
INSERT INTO `tk_cities` VALUES('520222','520200','盘县','贵州省-六盘水市-盘县','盘县','六盘水市','贵州省','3','561600','0858','','','panxian','PX','0');
INSERT INTO `tk_cities` VALUES('520302','520300','红花岗区','贵州省-遵义市-红花岗区','红花岗区','遵义市','贵州省','3','563000','0852','','','honghuagangqu','HHGQ','0');
INSERT INTO `tk_cities` VALUES('520303','520300','汇川区','贵州省-遵义市-汇川区','汇川区','遵义市','贵州省','3','563000','0852','','','huichuanqu','HCQ','0');
INSERT INTO `tk_cities` VALUES('520321','520300','遵义县','贵州省-遵义市-遵义县','遵义县','遵义市','贵州省','3','563100','0852','','','zunyixian','ZYX','0');
INSERT INTO `tk_cities` VALUES('520322','520300','桐梓县','贵州省-遵义市-桐梓县','桐梓县','遵义市','贵州省','3','563200','0852','','','tongxian','TX','0');
INSERT INTO `tk_cities` VALUES('520323','520300','绥阳县','贵州省-遵义市-绥阳县','绥阳县','遵义市','贵州省','3','563300','0852','','','suiyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('520324','520300','正安县','贵州省-遵义市-正安县','正安县','遵义市','贵州省','3','563400','0852','','','zhenganxian','ZAX','0');
INSERT INTO `tk_cities` VALUES('520325','520300','道真仡佬族苗族自治县','贵州省-遵义市-道真仡佬族苗族自治县','道真仡佬族苗族自治县','遵义市','贵州省','3','563500','0852','','','daozhenlaozumiaozuzizhixian','DZLZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520326','520300','务川仡佬族苗族自治县','贵州省-遵义市-务川仡佬族苗族自治县','务川仡佬族苗族自治县','遵义市','贵州省','3','564300','0852','','','wuchuanlaozumiaozuzizhixian','WCLZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520327','520300','凤冈县','贵州省-遵义市-凤冈县','凤冈县','遵义市','贵州省','3','564200','0852','','','fenggangxian','FGX','0');
INSERT INTO `tk_cities` VALUES('520328','520300','湄潭县','贵州省-遵义市-湄潭县','湄潭县','遵义市','贵州省','3','564100','0852','','','tanxian','TX','0');
INSERT INTO `tk_cities` VALUES('520329','520300','余庆县','贵州省-遵义市-余庆县','余庆县','遵义市','贵州省','3','564400','0852','','','yuqingxian','YQX','0');
INSERT INTO `tk_cities` VALUES('520330','520300','习水县','贵州省-遵义市-习水县','习水县','遵义市','贵州省','3','564600','0852','','','xishuixian','XSX','0');
INSERT INTO `tk_cities` VALUES('520381','520300','赤水市','贵州省-遵义市-赤水市','赤水市','遵义市','贵州省','3','564700','0852','','','chishuishi','CSS','0');
INSERT INTO `tk_cities` VALUES('520382','520300','仁怀市','贵州省-遵义市-仁怀市','仁怀市','遵义市','贵州省','3','564500','0852','','','renhuaishi','RHS','0');
INSERT INTO `tk_cities` VALUES('520402','520400','西秀区','贵州省-安顺市-西秀区','西秀区','安顺市','贵州省','3','561000','0853','','','xixiuqu','XXQ','0');
INSERT INTO `tk_cities` VALUES('520421','520400','平坝县','贵州省-安顺市-平坝县','平坝县','安顺市','贵州省','3','561100','0853','','','pingbaxian','PBX','0');
INSERT INTO `tk_cities` VALUES('520422','520400','普定县','贵州省-安顺市-普定县','普定县','安顺市','贵州省','3','562100','0853','','','pudingxian','PDX','0');
INSERT INTO `tk_cities` VALUES('520423','520400','镇宁布依族苗族自治县','贵州省-安顺市-镇宁布依族苗族自治县','镇宁布依族苗族自治县','安顺市','贵州省','3','561200','0853','','','zhenningbuyizumiaozuzizhixian','ZNBYZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520424','520400','关岭布依族苗族自治县','贵州省-安顺市-关岭布依族苗族自治县','关岭布依族苗族自治县','安顺市','贵州省','3','561300','0853','','','guanlingbuyizumiaozuzizhixian','GLBYZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520425','520400','紫云苗族布依族自治县','贵州省-安顺市-紫云苗族布依族自治县','紫云苗族布依族自治县','安顺市','贵州省','3','550800','0853','','','ziyunmiaozubuyizuzizhixian','ZYMZBYZZZX','0');
INSERT INTO `tk_cities` VALUES('520501','','七星关区','贵州省-毕节市-七星关区','七星关区','毕节市','贵州省','3','','','','','qixingguanqu','QXGQ','0');
INSERT INTO `tk_cities` VALUES('520522','','大方县','贵州省-毕节市-大方县','大方县','毕节市','贵州省','3','','','','','dafangxian','DFX','0');
INSERT INTO `tk_cities` VALUES('520523','','黔西县','贵州省-毕节市-黔西县','黔西县','毕节市','贵州省','3','','','','','qianxixian','QXX','0');
INSERT INTO `tk_cities` VALUES('520524','','金沙县','贵州省-毕节市-金沙县','金沙县','毕节市','贵州省','3','','','','','jinshaxian','JSX','0');
INSERT INTO `tk_cities` VALUES('520525','','织金县','贵州省-毕节市-织金县','织金县','毕节市','贵州省','3','','','','','zhijinxian','ZJX','0');
INSERT INTO `tk_cities` VALUES('520526','','纳雍县','贵州省-毕节市-纳雍县','纳雍县','毕节市','贵州省','3','','','','','nayongxian','NYX','0');
INSERT INTO `tk_cities` VALUES('520527','','威宁彝族回族苗族自治县','贵州省-毕节市-威宁彝族回族苗族自治县','威宁彝族回族苗族自治县','毕节市','贵州省','3','','','','','weiningyizuhuizumiaozuzizhixian','WNYZHZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520528','','赫章县','贵州省-毕节市-赫章县','赫章县','毕节市','贵州省','3','','','','','hezhangxian','HZX','0');
INSERT INTO `tk_cities` VALUES('520601','','碧江区','贵州省-铜仁市-碧江区','碧江区','铜仁市','贵州省','3','','','','','bijiangqu','BJQ','0');
INSERT INTO `tk_cities` VALUES('520602','','万山区','贵州省-铜仁市-万山区','万山区','铜仁市','贵州省','3','','','','','wanshanqu','WSQ','0');
INSERT INTO `tk_cities` VALUES('520622','','江口县','贵州省-铜仁市-江口县','江口县','铜仁市','贵州省','3','','','','','jiangkouxian','JKX','0');
INSERT INTO `tk_cities` VALUES('520623','','玉屏侗族自治县','贵州省-铜仁市-玉屏侗族自治县','玉屏侗族自治县','铜仁市','贵州省','3','','','','','yupingdongzuzizhixian','YPDZZZX','0');
INSERT INTO `tk_cities` VALUES('520624','','石阡县','贵州省-铜仁市-石阡县','石阡县','铜仁市','贵州省','3','','','','','shixian','SX','0');
INSERT INTO `tk_cities` VALUES('520625','','思南县','贵州省-铜仁市-思南县','思南县','铜仁市','贵州省','3','','','','','sinanxian','SNX','0');
INSERT INTO `tk_cities` VALUES('520626','','印江土家族苗族自治县','贵州省-铜仁市-印江土家族苗族自治县','印江土家族苗族自治县','铜仁市','贵州省','3','','','','','yinjiangtujiazumiaozuzizhixian','YJTJZMZZZX','0');
INSERT INTO `tk_cities` VALUES('520627','','德江县','贵州省-铜仁市-德江县','德江县','铜仁市','贵州省','3','','','','','dejiangxian','DJX','0');
INSERT INTO `tk_cities` VALUES('520628','','沿河土家族自治县','贵州省-铜仁市-沿河土家族自治县','沿河土家族自治县','铜仁市','贵州省','3','','','','','yanhetujiazuzizhixian','YHTJZZZX','0');
INSERT INTO `tk_cities` VALUES('520629','','松桃苗族自治县','贵州省-铜仁市-松桃苗族自治县','松桃苗族自治县','铜仁市','贵州省','3','','','','','songtaomiaozuzizhixian','STMZZZX','0');
INSERT INTO `tk_cities` VALUES('522301','522300','兴义市','贵州省-黔西南布依族苗族自治州 -兴义市','兴义市','黔西南布依族苗族自治州 ','贵州省','3','562400','0859','','','xingyishi','XYS','0');
INSERT INTO `tk_cities` VALUES('522322','522300','兴仁县','贵州省-黔西南布依族苗族自治州 -兴仁县','兴仁县','黔西南布依族苗族自治州 ','贵州省','3','562300','0859','','','xingrenxian','XRX','0');
INSERT INTO `tk_cities` VALUES('522323','522300','普安县','贵州省-黔西南布依族苗族自治州 -普安县','普安县','黔西南布依族苗族自治州 ','贵州省','3','561500','0859','','','puanxian','PAX','0');
INSERT INTO `tk_cities` VALUES('522324','522300','晴隆县','贵州省-黔西南布依族苗族自治州 -晴隆县','晴隆县','黔西南布依族苗族自治州 ','贵州省','3','561400','0859','','','qinglongxian','QLX','0');
INSERT INTO `tk_cities` VALUES('522325','522300','贞丰县','贵州省-黔西南布依族苗族自治州 -贞丰县','贞丰县','黔西南布依族苗族自治州 ','贵州省','3','562200','0859','','','zhenfengxian','ZFX','0');
INSERT INTO `tk_cities` VALUES('522326','522300','望谟县','贵州省-黔西南布依族苗族自治州 -望谟县','望谟县','黔西南布依族苗族自治州 ','贵州省','3','552300','0859','','','wangxian','WX','0');
INSERT INTO `tk_cities` VALUES('522327','522300','册亨县','贵州省-黔西南布依族苗族自治州 -册亨县','册亨县','黔西南布依族苗族自治州 ','贵州省','3','552200','0859','','','cehengxian','CHX','0');
INSERT INTO `tk_cities` VALUES('522328','522300','安龙县','贵州省-黔西南布依族苗族自治州 -安龙县','安龙县','黔西南布依族苗族自治州 ','贵州省','3','552400','0859','','','anlongxian','ALX','0');
INSERT INTO `tk_cities` VALUES('522601','522600','凯里市','贵州省-黔东南苗族侗族自治州 -凯里市','凯里市','黔东南苗族侗族自治州 ','贵州省','3','556000','0855','','','kailishi','KLS','0');
INSERT INTO `tk_cities` VALUES('522622','522600','黄平县','贵州省-黔东南苗族侗族自治州 -黄平县','黄平县','黔东南苗族侗族自治州 ','贵州省','3','556100','0855','','','huangpingxian','HPX','0');
INSERT INTO `tk_cities` VALUES('522623','522600','施秉县','贵州省-黔东南苗族侗族自治州 -施秉县','施秉县','黔东南苗族侗族自治州 ','贵州省','3','556200','0855','','','shibingxian','SBX','0');
INSERT INTO `tk_cities` VALUES('522624','522600','三穗县','贵州省-黔东南苗族侗族自治州 -三穗县','三穗县','黔东南苗族侗族自治州 ','贵州省','3','556500','0855','','','sansuixian','SSX','0');
INSERT INTO `tk_cities` VALUES('522625','522600','镇远县','贵州省-黔东南苗族侗族自治州 -镇远县','镇远县','黔东南苗族侗族自治州 ','贵州省','3','557700','0855','','','zhenyuanxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('522626','522600','岑巩县','贵州省-黔东南苗族侗族自治州 -岑巩县','岑巩县','黔东南苗族侗族自治州 ','贵州省','3','557800','0855','','','gongxian','GX','0');
INSERT INTO `tk_cities` VALUES('522627','522600','天柱县','贵州省-黔东南苗族侗族自治州 -天柱县','天柱县','黔东南苗族侗族自治州 ','贵州省','3','556600','0855','','','tianzhuxian','TZX','0');
INSERT INTO `tk_cities` VALUES('522628','522600','锦屏县','贵州省-黔东南苗族侗族自治州 -锦屏县','锦屏县','黔东南苗族侗族自治州 ','贵州省','3','556700','0855','','','jinpingxian','JPX','0');
INSERT INTO `tk_cities` VALUES('522629','522600','剑河县','贵州省-黔东南苗族侗族自治州 -剑河县','剑河县','黔东南苗族侗族自治州 ','贵州省','3','556400','0855','','','jianhexian','JHX','0');
INSERT INTO `tk_cities` VALUES('522630','522600','台江县','贵州省-黔东南苗族侗族自治州 -台江县','台江县','黔东南苗族侗族自治州 ','贵州省','3','556300','0855','','','taijiangxian','TJX','0');
INSERT INTO `tk_cities` VALUES('522631','522600','黎平县','贵州省-黔东南苗族侗族自治州 -黎平县','黎平县','黔东南苗族侗族自治州 ','贵州省','3','557300','0855','','','lipingxian','LPX','0');
INSERT INTO `tk_cities` VALUES('522632','522600','榕江县','贵州省-黔东南苗族侗族自治州 -榕江县','榕江县','黔东南苗族侗族自治州 ','贵州省','3','557200','0855','','','jiangxian','JX','0');
INSERT INTO `tk_cities` VALUES('522633','522600','从江县','贵州省-黔东南苗族侗族自治州 -从江县','从江县','黔东南苗族侗族自治州 ','贵州省','3','557400','0855','','','congjiangxian','CJX','0');
INSERT INTO `tk_cities` VALUES('522634','522600','雷山县','贵州省-黔东南苗族侗族自治州 -雷山县','雷山县','黔东南苗族侗族自治州 ','贵州省','3','557100','0855','','','leishanxian','LSX','0');
INSERT INTO `tk_cities` VALUES('522635','522600','麻江县','贵州省-黔东南苗族侗族自治州 -麻江县','麻江县','黔东南苗族侗族自治州 ','贵州省','3','557600','0855','','','majiangxian','MJX','0');
INSERT INTO `tk_cities` VALUES('522636','522600','丹寨县','贵州省-黔东南苗族侗族自治州 -丹寨县','丹寨县','黔东南苗族侗族自治州 ','贵州省','3','557500','0855','','','danzhaixian','DZX','0');
INSERT INTO `tk_cities` VALUES('522701','522700','都匀市','贵州省-黔南布依族苗族自治州 -都匀市','都匀市','黔南布依族苗族自治州 ','贵州省','3','558000','0854','','','duyunshi','DYS','0');
INSERT INTO `tk_cities` VALUES('522702','522700','福泉市','贵州省-黔南布依族苗族自治州 -福泉市','福泉市','黔南布依族苗族自治州 ','贵州省','3','550500','0854','','','fuquanshi','FQS','0');
INSERT INTO `tk_cities` VALUES('522722','522700','荔波县','贵州省-黔南布依族苗族自治州 -荔波县','荔波县','黔南布依族苗族自治州 ','贵州省','3','558400','0854','','','liboxian','LBX','0');
INSERT INTO `tk_cities` VALUES('522723','522700','贵定县','贵州省-黔南布依族苗族自治州 -贵定县','贵定县','黔南布依族苗族自治州 ','贵州省','3','551300','0854','','','guidingxian','GDX','0');
INSERT INTO `tk_cities` VALUES('522725','522700','瓮安县','贵州省-黔南布依族苗族自治州 -瓮安县','瓮安县','黔南布依族苗族自治州 ','贵州省','3','550400','0854','','','wenganxian','WAX','0');
INSERT INTO `tk_cities` VALUES('522726','522700','独山县','贵州省-黔南布依族苗族自治州 -独山县','独山县','黔南布依族苗族自治州 ','贵州省','3','558200','0854','','','dushanxian','DSX','0');
INSERT INTO `tk_cities` VALUES('522727','522700','平塘县','贵州省-黔南布依族苗族自治州 -平塘县','平塘县','黔南布依族苗族自治州 ','贵州省','3','558300','0854','','','pingtangxian','PTX','0');
INSERT INTO `tk_cities` VALUES('522728','522700','罗甸县','贵州省-黔南布依族苗族自治州 -罗甸县','罗甸县','黔南布依族苗族自治州 ','贵州省','3','550100','0854','','','luodianxian','LDX','0');
INSERT INTO `tk_cities` VALUES('522729','522700','长顺县','贵州省-黔南布依族苗族自治州 -长顺县','长顺县','黔南布依族苗族自治州 ','贵州省','3','550700','0854','','','changshunxian','CSX','0');
INSERT INTO `tk_cities` VALUES('522730','522700','龙里县','贵州省-黔南布依族苗族自治州 -龙里县','龙里县','黔南布依族苗族自治州 ','贵州省','3','551200','0854','','','longlixian','LLX','0');
INSERT INTO `tk_cities` VALUES('522731','522700','惠水县','贵州省-黔南布依族苗族自治州 -惠水县','惠水县','黔南布依族苗族自治州 ','贵州省','3','550600','0854','','','huishuixian','HSX','0');
INSERT INTO `tk_cities` VALUES('522732','522700','三都水族自治县','贵州省-黔南布依族苗族自治州 -三都水族自治县','三都水族自治县','黔南布依族苗族自治州 ','贵州省','3','558100','0854','','','sandushuizuzizhixian','SDSZZZX','0');
INSERT INTO `tk_cities` VALUES('530000','0','云南省','云南省','','','云南省','1','','','','','yunnansheng','YNS','0');
INSERT INTO `tk_cities` VALUES('530100','530000','昆明市','云南省-昆明市','','昆明市','云南省','2','650000','0871','','','kunmingshi','KMS','0');
INSERT INTO `tk_cities` VALUES('530300','530000','曲靖市','云南省-曲靖市','','曲靖市','云南省','2','655000','0874','','','qujingshi','QJS','0');
INSERT INTO `tk_cities` VALUES('530400','530000','玉溪市','云南省-玉溪市','','玉溪市','云南省','2','653100','0877','','','yuxishi','YXS','0');
INSERT INTO `tk_cities` VALUES('530500','530000','保山市','云南省-保山市','','保山市','云南省','2','678000','0875','','','baoshanshi','BSS','0');
INSERT INTO `tk_cities` VALUES('530600','530000','昭通市','云南省-昭通市','','昭通市','云南省','2','657000','0870','','','zhaotongshi','ZTS','0');
INSERT INTO `tk_cities` VALUES('530700','530000','丽江市','云南省-丽江市','','丽江市','云南省','2','674100','0888','','','lijiangshi','LJS','0');
INSERT INTO `tk_cities` VALUES('530800','530000','普洱市','云南省-普洱市','','普洱市','云南省','2','665000','0879','','','puershi','PES','0');
INSERT INTO `tk_cities` VALUES('530900','530000','临沧市','云南省-临沧市','','临沧市','云南省','2','677000','0883','','','lincangshi','LCS','0');
INSERT INTO `tk_cities` VALUES('532300','530000','楚雄彝族自治州 ','云南省-楚雄彝族自治州 ','','楚雄彝族自治州 ','云南省','2','675000','0878','','','chuxiongyizuzizhizhou','CXYZZZZ','0');
INSERT INTO `tk_cities` VALUES('532500','530000','红河哈尼族彝族自治州 ','云南省-红河哈尼族彝族自治州 ','','红河哈尼族彝族自治州 ','云南省','2','661000','0873','','','honghehanizuyizuzizhizhou','HHHNZYZZZZ','0');
INSERT INTO `tk_cities` VALUES('532600','530000','文山壮族苗族自治州 ','云南省-文山壮族苗族自治州 ','','文山壮族苗族自治州 ','云南省','2','663000','0876','','','wenshanzhuangzumiaozuzizhizhou','WSZZMZZZZ','0');
INSERT INTO `tk_cities` VALUES('532800','530000','西双版纳傣族自治州 ','云南省-西双版纳傣族自治州 ','','西双版纳傣族自治州 ','云南省','2','666100','0691','','','xishuangbannadaizuzizhizhou','XSBNDZZZZ','0');
INSERT INTO `tk_cities` VALUES('532900','530000','大理白族自治州 ','云南省-大理白族自治州 ','','大理白族自治州 ','云南省','2','671000','0872','','','dalibaizuzizhizhou','DLBZZZZ','0');
INSERT INTO `tk_cities` VALUES('533100','530000','德宏傣族景颇族自治州 ','云南省-德宏傣族景颇族自治州 ','','德宏傣族景颇族自治州 ','云南省','2','678600','0692','','','dehongdaizujingpozuzizhizhou','DHDZJPZZZZ','0');
INSERT INTO `tk_cities` VALUES('533300','530000','怒江傈僳族自治州 ','云南省-怒江傈僳族自治州 ','','怒江傈僳族自治州 ','云南省','2','673200','0886','','','nujianglisuzuzizhizhou','NJLSZZZZ','0');
INSERT INTO `tk_cities` VALUES('533400','530000','迪庆藏族自治州 ','云南省-迪庆藏族自治州 ','','迪庆藏族自治州 ','云南省','2','674400','0887','','','diqingcangzuzizhizhou','DQCZZZZ','0');
INSERT INTO `tk_cities` VALUES('530102','530100','五华区','云南省-昆明市-五华区','五华区','昆明市','云南省','3','650000','0871','','','wuhuaqu','WHQ','0');
INSERT INTO `tk_cities` VALUES('530103','530100','盘龙区','云南省-昆明市-盘龙区','盘龙区','昆明市','云南省','3','650000','0871','','','panlongqu','PLQ','0');
INSERT INTO `tk_cities` VALUES('530111','530100','官渡区','云南省-昆明市-官渡区','官渡区','昆明市','云南省','3','650200','0871','','','guanduqu','GDQ','0');
INSERT INTO `tk_cities` VALUES('530112','530100','西山区','云南省-昆明市-西山区','西山区','昆明市','云南省','3','650100','0871','','','xishanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('530113','530100','东川区','云南省-昆明市-东川区','东川区','昆明市','云南省','3','654100','0871','','','dongchuanqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('530121','530100','呈贡区','云南省-昆明市-呈贡区','呈贡区','昆明市','云南省','3','650500','0871','','','chenggongqu','CGQ','0');
INSERT INTO `tk_cities` VALUES('530122','530100','晋宁县','云南省-昆明市-晋宁县','晋宁县','昆明市','云南省','3','650600','0871','','','jinningxian','JNX','0');
INSERT INTO `tk_cities` VALUES('530124','530100','富民县','云南省-昆明市-富民县','富民县','昆明市','云南省','3','650400','0871','','','fuminxian','FMX','0');
INSERT INTO `tk_cities` VALUES('530125','530100','宜良县','云南省-昆明市-宜良县','宜良县','昆明市','云南省','3','652100','0871','','','yiliangxian','YLX','0');
INSERT INTO `tk_cities` VALUES('530126','530100','石林彝族自治县','云南省-昆明市-石林彝族自治县','石林彝族自治县','昆明市','云南省','3','652200','0871','','','shilinyizuzizhixian','SLYZZZX','0');
INSERT INTO `tk_cities` VALUES('530127','530100','嵩明县','云南省-昆明市-嵩明县','嵩明县','昆明市','云南省','3','651700','0871','','','mingxian','MX','0');
INSERT INTO `tk_cities` VALUES('530128','530100','禄劝彝族苗族自治县','云南省-昆明市-禄劝彝族苗族自治县','禄劝彝族苗族自治县','昆明市','云南省','3','651500','0871','','','luquanyizumiaozuzizhixian','LQYZMZZZX','0');
INSERT INTO `tk_cities` VALUES('530129','530100','寻甸回族彝族自治县','云南省-昆明市-寻甸回族彝族自治县','寻甸回族彝族自治县','昆明市','云南省','3','655200','0871','','','xundianhuizuyizuzizhixian','XDHZYZZZX','0');
INSERT INTO `tk_cities` VALUES('530181','530100','安宁市','云南省-昆明市-安宁市','安宁市','昆明市','云南省','3','650300','0871','','','anningshi','ANS','0');
INSERT INTO `tk_cities` VALUES('530302','530300','麒麟区','云南省-曲靖市-麒麟区','麒麟区','曲靖市','云南省','3','655000','0874','','','qu','Q','0');
INSERT INTO `tk_cities` VALUES('530321','530300','马龙县','云南省-曲靖市-马龙县','马龙县','曲靖市','云南省','3','655100','0874','','','malongxian','MLX','0');
INSERT INTO `tk_cities` VALUES('530322','530300','陆良县','云南省-曲靖市-陆良县','陆良县','曲靖市','云南省','3','655600','0874','','','luliangxian','LLX','0');
INSERT INTO `tk_cities` VALUES('530323','530300','师宗县','云南省-曲靖市-师宗县','师宗县','曲靖市','云南省','3','655700','0874','','','shizongxian','SZX','0');
INSERT INTO `tk_cities` VALUES('530324','530300','罗平县','云南省-曲靖市-罗平县','罗平县','曲靖市','云南省','3','655800','0874','','','luopingxian','LPX','0');
INSERT INTO `tk_cities` VALUES('530325','530300','富源县','云南省-曲靖市-富源县','富源县','曲靖市','云南省','3','655500','0874','','','fuyuanxian','FYX','0');
INSERT INTO `tk_cities` VALUES('530326','530300','会泽县','云南省-曲靖市-会泽县','会泽县','曲靖市','云南省','3','654200','0874','','','huizexian','HZX','0');
INSERT INTO `tk_cities` VALUES('530328','530300','沾益县','云南省-曲靖市-沾益县','沾益县','曲靖市','云南省','3','655500','0874','','','zhanyixian','ZYX','0');
INSERT INTO `tk_cities` VALUES('530381','530300','宣威市','云南省-曲靖市-宣威市','宣威市','曲靖市','云南省','3','655400','0874','','','xuanweishi','XWS','0');
INSERT INTO `tk_cities` VALUES('530402','530400','红塔区','云南省-玉溪市-红塔区','红塔区','玉溪市','云南省','3','653100','0877','','','hongtaqu','HTQ','0');
INSERT INTO `tk_cities` VALUES('530421','530400','江川县','云南省-玉溪市-江川县','江川县','玉溪市','云南省','3','652600','0877','','','jiangchuanxian','JCX','0');
INSERT INTO `tk_cities` VALUES('530422','530400','澄江县','云南省-玉溪市-澄江县','澄江县','玉溪市','云南省','3','652500','0877','','','chengjiangxian','CJX','0');
INSERT INTO `tk_cities` VALUES('530423','530400','通海县','云南省-玉溪市-通海县','通海县','玉溪市','云南省','3','652700','0877','','','tonghaixian','THX','0');
INSERT INTO `tk_cities` VALUES('530424','530400','华宁县','云南省-玉溪市-华宁县','华宁县','玉溪市','云南省','3','652800','0877','','','huaningxian','HNX','0');
INSERT INTO `tk_cities` VALUES('530425','530400','易门县','云南省-玉溪市-易门县','易门县','玉溪市','云南省','3','651100','0877','','','yimenxian','YMX','0');
INSERT INTO `tk_cities` VALUES('530426','530400','峨山彝族自治县','云南省-玉溪市-峨山彝族自治县','峨山彝族自治县','玉溪市','云南省','3','653200','0877','','','eshanyizuzizhixian','ESYZZZX','0');
INSERT INTO `tk_cities` VALUES('530427','530400','新平彝族傣族自治县','云南省-玉溪市-新平彝族傣族自治县','新平彝族傣族自治县','玉溪市','云南省','3','653400','0877','','','xinpingyizudaizuzizhixian','XPYZDZZZX','0');
INSERT INTO `tk_cities` VALUES('530428','530400','元江哈尼族彝族傣族自治县','云南省-玉溪市-元江哈尼族彝族傣族自治县','元江哈尼族彝族傣族自治县','玉溪市','云南省','3','653300','0877','','','yuanjianghanizuyizudaizuzizhixian','YJHNZYZDZZZX','0');
INSERT INTO `tk_cities` VALUES('530502','530500','隆阳区','云南省-保山市-隆阳区','隆阳区','保山市','云南省','3','678000','0875','','','longyangqu','LYQ','0');
INSERT INTO `tk_cities` VALUES('530521','530500','施甸县','云南省-保山市-施甸县','施甸县','保山市','云南省','3','678200','0875','','','shidianxian','SDX','0');
INSERT INTO `tk_cities` VALUES('530522','530500','腾冲县','云南省-保山市-腾冲县','腾冲县','保山市','云南省','3','679100','0875','','','tengchongxian','TCX','0');
INSERT INTO `tk_cities` VALUES('530523','530500','龙陵县','云南省-保山市-龙陵县','龙陵县','保山市','云南省','3','678300','0875','','','longlingxian','LLX','0');
INSERT INTO `tk_cities` VALUES('530524','530500','昌宁县','云南省-保山市-昌宁县','昌宁县','保山市','云南省','3','678100','0875','','','changningxian','CNX','0');
INSERT INTO `tk_cities` VALUES('530602','530600','昭阳区','云南省-昭通市-昭阳区','昭阳区','昭通市','云南省','3','657000','0870','','','zhaoyangqu','ZYQ','0');
INSERT INTO `tk_cities` VALUES('530621','530600','鲁甸县','云南省-昭通市-鲁甸县','鲁甸县','昭通市','云南省','3','657100','0870','','','ludianxian','LDX','0');
INSERT INTO `tk_cities` VALUES('530622','530600','巧家县','云南省-昭通市-巧家县','巧家县','昭通市','云南省','3','654600','0870','','','qiaojiaxian','QJX','0');
INSERT INTO `tk_cities` VALUES('530623','530600','盐津县','云南省-昭通市-盐津县','盐津县','昭通市','云南省','3','657500','0870','','','yanjinxian','YJX','0');
INSERT INTO `tk_cities` VALUES('530624','530600','大关县','云南省-昭通市-大关县','大关县','昭通市','云南省','3','657400','0870','','','daguanxian','DGX','0');
INSERT INTO `tk_cities` VALUES('530625','530600','永善县','云南省-昭通市-永善县','永善县','昭通市','云南省','3','657300','0870','','','yongshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('530626','530600','绥江县','云南省-昭通市-绥江县','绥江县','昭通市','云南省','3','657700','0870','','','suijiangxian','SJX','0');
INSERT INTO `tk_cities` VALUES('530627','530600','镇雄县','云南省-昭通市-镇雄县','镇雄县','昭通市','云南省','3','657200','0870','','','zhenxiongxian','ZXX','0');
INSERT INTO `tk_cities` VALUES('530628','530600','彝良县','云南省-昭通市-彝良县','彝良县','昭通市','云南省','3','657600','0870','','','yiliangxian','YLX','0');
INSERT INTO `tk_cities` VALUES('530629','530600','威信县','云南省-昭通市-威信县','威信县','昭通市','云南省','3','657900','0870','','','weixinxian','WXX','0');
INSERT INTO `tk_cities` VALUES('530630','530600','水富县','云南省-昭通市-水富县','水富县','昭通市','云南省','3','657800','0870','','','shuifuxian','SFX','0');
INSERT INTO `tk_cities` VALUES('530702','530700','古城区','云南省-丽江市-古城区','古城区','丽江市','云南省','3','674100','0888','','','guchengqu','GCQ','0');
INSERT INTO `tk_cities` VALUES('530721','530700','玉龙纳西族自治县','云南省-丽江市-玉龙纳西族自治县','玉龙纳西族自治县','丽江市','云南省','3','674100','0888','','','yulongnaxizuzizhixian','YLNXZZZX','0');
INSERT INTO `tk_cities` VALUES('530722','530700','永胜县','云南省-丽江市-永胜县','永胜县','丽江市','云南省','3','674200','0888','','','yongshengxian','YSX','0');
INSERT INTO `tk_cities` VALUES('530723','530700','华坪县','云南省-丽江市-华坪县','华坪县','丽江市','云南省','3','674800','0888','','','huapingxian','HPX','0');
INSERT INTO `tk_cities` VALUES('530724','530700','宁蒗彝族自治县','云南省-丽江市-宁蒗彝族自治县','宁蒗彝族自治县','丽江市','云南省','3','674300','0888','','','ningyizuzizhixian','NYZZZX','0');
INSERT INTO `tk_cities` VALUES('530802','530800','思茅区','云南省-普洱市-思茅区','思茅区','普洱市','云南省','3','665000','0879','','','simaoqu','SMQ','0');
INSERT INTO `tk_cities` VALUES('530821','530800','宁洱哈尼族彝族自治县','云南省-普洱市-宁洱哈尼族彝族自治县','宁洱哈尼族彝族自治县','普洱市','云南省','3','665100','0879','','','ningerhanizuyizuzizhixian','NEHNZYZZZX','0');
INSERT INTO `tk_cities` VALUES('530822','530800','墨江哈尼族自治县','云南省-普洱市-墨江哈尼族自治县','墨江哈尼族自治县','普洱市','云南省','3','654800','0879','','','mojianghanizuzizhixian','MJHNZZZX','0');
INSERT INTO `tk_cities` VALUES('530823','530800','景东彝族自治县','云南省-普洱市-景东彝族自治县','景东彝族自治县','普洱市','云南省','3','676200','0879','','','jingdongyizuzizhixian','JDYZZZX','0');
INSERT INTO `tk_cities` VALUES('530824','530800','景谷傣族彝族自治县','云南省-普洱市-景谷傣族彝族自治县','景谷傣族彝族自治县','普洱市','云南省','3','666400','0879','','','jinggudaizuyizuzizhixian','JGDZYZZZX','0');
INSERT INTO `tk_cities` VALUES('530825','530800','镇沅彝族哈尼族拉祜族自治县','云南省-普洱市-镇沅彝族哈尼族拉祜族自治县','镇沅彝族哈尼族拉祜族自治县','普洱市','云南省','3','666500','0879','','','zhenyizuhanizulazuzizhixian','ZYZHNZLZZZX','0');
INSERT INTO `tk_cities` VALUES('530826','530800','江城哈尼族彝族自治县','云南省-普洱市-江城哈尼族彝族自治县','江城哈尼族彝族自治县','普洱市','云南省','3','665900','0879','','','jiangchenghanizuyizuzizhixian','JCHNZYZZZX','0');
INSERT INTO `tk_cities` VALUES('530827','530800','孟连傣族拉祜族佤族自治县','云南省-普洱市-孟连傣族拉祜族佤族自治县','孟连傣族拉祜族佤族自治县','普洱市','云南省','3','665800','0879','','','mengliandaizulazuzuzizhixian','MLDZLZZZZX','0');
INSERT INTO `tk_cities` VALUES('530828','530800','澜沧拉祜族自治县','云南省-普洱市-澜沧拉祜族自治县','澜沧拉祜族自治县','普洱市','云南省','3','665600','0879','','','lancanglazuzizhixian','LCLZZZX','0');
INSERT INTO `tk_cities` VALUES('530829','530800','西盟佤族自治县','云南省-普洱市-西盟佤族自治县','西盟佤族自治县','普洱市','云南省','3','665700','0879','','','ximengzuzizhixian','XMZZZX','0');
INSERT INTO `tk_cities` VALUES('530902','530900','临翔区','云南省-临沧市-临翔区','临翔区','临沧市','云南省','3','677000','0883','','','linxiangqu','LXQ','0');
INSERT INTO `tk_cities` VALUES('530921','530900','凤庆县','云南省-临沧市-凤庆县','凤庆县','临沧市','云南省','3','675900','0883','','','fengqingxian','FQX','0');
INSERT INTO `tk_cities` VALUES('530922','530900','云县','云南省-临沧市-云县','云县','临沧市','云南省','3','675800','0883','','','yunxian','YX','0');
INSERT INTO `tk_cities` VALUES('530923','530900','永德县','云南省-临沧市-永德县','永德县','临沧市','云南省','3','677600','0883','','','yongdexian','YDX','0');
INSERT INTO `tk_cities` VALUES('530924','530900','镇康县','云南省-临沧市-镇康县','镇康县','临沧市','云南省','3','677700','0883','','','zhenkangxian','ZKX','0');
INSERT INTO `tk_cities` VALUES('530925','530900','双江拉祜族佤族布朗族傣族自治县','云南省-临沧市-双江拉祜族佤族布朗族傣族自治县','双江拉祜族佤族布朗族傣族自治县','临沧市','云南省','3','677300','0883','','','shuangjianglazuzubulangzudaizuzizhixian','SJLZZBLZDZZZX','0');
INSERT INTO `tk_cities` VALUES('530926','530900','耿马傣族佤族自治县','云南省-临沧市-耿马傣族佤族自治县','耿马傣族佤族自治县','临沧市','云南省','3','677500','0883','','','gengmadaizuzuzizhixian','GMDZZZZX','0');
INSERT INTO `tk_cities` VALUES('530927','530900','沧源佤族自治县','云南省-临沧市-沧源佤族自治县','沧源佤族自治县','临沧市','云南省','3','677400','0883','','','cangyuanzuzizhixian','CYZZZX','0');
INSERT INTO `tk_cities` VALUES('532301','532300','楚雄市','云南省-楚雄彝族自治州 -楚雄市','楚雄市','楚雄彝族自治州 ','云南省','3','675000','0878','','','chuxiongshi','CXS','0');
INSERT INTO `tk_cities` VALUES('532322','532300','双柏县','云南省-楚雄彝族自治州 -双柏县','双柏县','楚雄彝族自治州 ','云南省','3','675100','0878','','','shuangbaixian','SBX','0');
INSERT INTO `tk_cities` VALUES('532323','532300','牟定县','云南省-楚雄彝族自治州 -牟定县','牟定县','楚雄彝族自治州 ','云南省','3','675500','0878','','','moudingxian','MDX','0');
INSERT INTO `tk_cities` VALUES('532324','532300','南华县','云南省-楚雄彝族自治州 -南华县','南华县','楚雄彝族自治州 ','云南省','3','675200','0878','','','nanhuaxian','NHX','0');
INSERT INTO `tk_cities` VALUES('532325','532300','姚安县','云南省-楚雄彝族自治州 -姚安县','姚安县','楚雄彝族自治州 ','云南省','3','675300','0878','','','yaoanxian','YAX','0');
INSERT INTO `tk_cities` VALUES('532326','532300','大姚县','云南省-楚雄彝族自治州 -大姚县','大姚县','楚雄彝族自治州 ','云南省','3','675400','0878','','','dayaoxian','DYX','0');
INSERT INTO `tk_cities` VALUES('532327','532300','永仁县','云南省-楚雄彝族自治州 -永仁县','永仁县','楚雄彝族自治州 ','云南省','3','651400','0878','','','yongrenxian','YRX','0');
INSERT INTO `tk_cities` VALUES('532328','532300','元谋县','云南省-楚雄彝族自治州 -元谋县','元谋县','楚雄彝族自治州 ','云南省','3','651300','0878','','','yuanmouxian','YMX','0');
INSERT INTO `tk_cities` VALUES('532329','532300','武定县','云南省-楚雄彝族自治州 -武定县','武定县','楚雄彝族自治州 ','云南省','3','651600','0878','','','wudingxian','WDX','0');
INSERT INTO `tk_cities` VALUES('532331','532300','禄丰县','云南省-楚雄彝族自治州 -禄丰县','禄丰县','楚雄彝族自治州 ','云南省','3','651200','0878','','','lufengxian','LFX','0');
INSERT INTO `tk_cities` VALUES('532501','532500','个旧市','云南省-红河哈尼族彝族自治州 -个旧市','个旧市','红河哈尼族彝族自治州 ','云南省','3','661000','0873','','','gejiushi','GJS','0');
INSERT INTO `tk_cities` VALUES('532502','532500','开远市','云南省-红河哈尼族彝族自治州 -开远市','开远市','红河哈尼族彝族自治州 ','云南省','3','661600','0873','','','kaiyuanshi','KYS','0');
INSERT INTO `tk_cities` VALUES('532503','','蒙自市','云南省-红河哈尼族彝族自治州 -蒙自市','蒙自市','红河哈尼族彝族自治州 ','云南省','3','','','','','mengzishi','MZS','0');
INSERT INTO `tk_cities` VALUES('532523','532500','屏边苗族自治县','云南省-红河哈尼族彝族自治州 -屏边苗族自治县','屏边苗族自治县','红河哈尼族彝族自治州 ','云南省','3','661200','0873','','','pingbianmiaozuzizhixian','PBMZZZX','0');
INSERT INTO `tk_cities` VALUES('532524','532500','建水县','云南省-红河哈尼族彝族自治州 -建水县','建水县','红河哈尼族彝族自治州 ','云南省','3','654300','0873','','','jianshuixian','JSX','0');
INSERT INTO `tk_cities` VALUES('532525','532500','石屏县','云南省-红河哈尼族彝族自治州 -石屏县','石屏县','红河哈尼族彝族自治州 ','云南省','3','662200','0873','','','shipingxian','SPX','0');
INSERT INTO `tk_cities` VALUES('532526','532500','弥勒县','云南省-红河哈尼族彝族自治州 -弥勒县','弥勒县','红河哈尼族彝族自治州 ','云南省','3','652300','0873','','','milexian','MLX','0');
INSERT INTO `tk_cities` VALUES('532527','532500','泸西县','云南省-红河哈尼族彝族自治州 -泸西县','泸西县','红河哈尼族彝族自治州 ','云南省','3','652400','0873','','','xixian','XX','0');
INSERT INTO `tk_cities` VALUES('532528','532500','元阳县','云南省-红河哈尼族彝族自治州 -元阳县','元阳县','红河哈尼族彝族自治州 ','云南省','3','662400','0873','','','yuanyangxian','YYX','0');
INSERT INTO `tk_cities` VALUES('532529','532500','红河县','云南省-红河哈尼族彝族自治州 -红河县','红河县','红河哈尼族彝族自治州 ','云南省','3','654400','0873','','','honghexian','HHX','0');
INSERT INTO `tk_cities` VALUES('532530','532500','金平苗族瑶族傣族自治县','云南省-红河哈尼族彝族自治州 -金平苗族瑶族傣族自治县','金平苗族瑶族傣族自治县','红河哈尼族彝族自治州 ','云南省','3','661500','0873','','','jinpingmiaozuyaozudaizuzizhixian','JPMZYZDZZZX','0');
INSERT INTO `tk_cities` VALUES('532531','532500','绿春县','云南省-红河哈尼族彝族自治州 -绿春县','绿春县','红河哈尼族彝族自治州 ','云南省','3','662500','0873','','','lvchunxian','LCX','0');
INSERT INTO `tk_cities` VALUES('532532','532500','河口瑶族自治县','云南省-红河哈尼族彝族自治州 -河口瑶族自治县','河口瑶族自治县','红河哈尼族彝族自治州 ','云南省','3','661300','0873','','','hekouyaozuzizhixian','HKYZZZX','0');
INSERT INTO `tk_cities` VALUES('532621','532600','文山市','云南省-文山壮族苗族自治州 -文山市','文山市','文山壮族苗族自治州 ','云南省','3','663000','0876','','','wenshanshi','WSS','0');
INSERT INTO `tk_cities` VALUES('532622','532600','砚山县','云南省-文山壮族苗族自治州 -砚山县','砚山县','文山壮族苗族自治州 ','云南省','3','663100','0876','','','yanshanxian','YSX','0');
INSERT INTO `tk_cities` VALUES('532623','532600','西畴县','云南省-文山壮族苗族自治州 -西畴县','西畴县','文山壮族苗族自治州 ','云南省','3','663500','0876','','','xichouxian','XCX','0');
INSERT INTO `tk_cities` VALUES('532624','532600','麻栗坡县','云南省-文山壮族苗族自治州 -麻栗坡县','麻栗坡县','文山壮族苗族自治州 ','云南省','3','663600','0876','','','malipoxian','MLPX','0');
INSERT INTO `tk_cities` VALUES('532625','532600','马关县','云南省-文山壮族苗族自治州 -马关县','马关县','文山壮族苗族自治州 ','云南省','3','663700','0876','','','maguanxian','MGX','0');
INSERT INTO `tk_cities` VALUES('532626','532600','丘北县','云南省-文山壮族苗族自治州 -丘北县','丘北县','文山壮族苗族自治州 ','云南省','3','663200','0876','','','qiubeixian','QBX','0');
INSERT INTO `tk_cities` VALUES('532627','532600','广南县','云南省-文山壮族苗族自治州 -广南县','广南县','文山壮族苗族自治州 ','云南省','3','663300','0876','','','guangnanxian','GNX','0');
INSERT INTO `tk_cities` VALUES('532628','532600','富宁县','云南省-文山壮族苗族自治州 -富宁县','富宁县','文山壮族苗族自治州 ','云南省','3','663400','0876','','','funingxian','FNX','0');
INSERT INTO `tk_cities` VALUES('532801','532800','景洪市','云南省-西双版纳傣族自治州 -景洪市','景洪市','西双版纳傣族自治州 ','云南省','3','666100','0691','','','jinghongshi','JHS','0');
INSERT INTO `tk_cities` VALUES('532822','532800','勐海县','云南省-西双版纳傣族自治州 -勐海县','勐海县','西双版纳傣族自治州 ','云南省','3','666200','0691','','','haixian','HX','0');
INSERT INTO `tk_cities` VALUES('532823','532800','勐腊县','云南省-西双版纳傣族自治州 -勐腊县','勐腊县','西双版纳傣族自治州 ','云南省','3','666300','0691','','','laxian','LX','0');
INSERT INTO `tk_cities` VALUES('532901','532900','大理市','云南省-大理白族自治州 -大理市','大理市','大理白族自治州 ','云南省','3','671000','0872','','','dalishi','DLS','0');
INSERT INTO `tk_cities` VALUES('532922','532900','漾濞彝族自治县','云南省-大理白族自治州 -漾濞彝族自治县','漾濞彝族自治县','大理白族自治州 ','云南省','3','672500','0872','','','yangyizuzizhixian','YYZZZX','0');
INSERT INTO `tk_cities` VALUES('532923','532900','祥云县','云南省-大理白族自治州 -祥云县','祥云县','大理白族自治州 ','云南省','3','672100','0872','','','xiangyunxian','XYX','0');
INSERT INTO `tk_cities` VALUES('532924','532900','宾川县','云南省-大理白族自治州 -宾川县','宾川县','大理白族自治州 ','云南省','3','671600','0872','','','binchuanxian','BCX','0');
INSERT INTO `tk_cities` VALUES('532925','532900','弥渡县','云南省-大理白族自治州 -弥渡县','弥渡县','大理白族自治州 ','云南省','3','675600','0872','','','miduxian','MDX','0');
INSERT INTO `tk_cities` VALUES('532926','532900','南涧彝族自治县','云南省-大理白族自治州 -南涧彝族自治县','南涧彝族自治县','大理白族自治州 ','云南省','3','675700','0872','','','nanjianyizuzizhixian','NJYZZZX','0');
INSERT INTO `tk_cities` VALUES('532927','532900','巍山彝族回族自治县','云南省-大理白族自治州 -巍山彝族回族自治县','巍山彝族回族自治县','大理白族自治州 ','云南省','3','672400','0872','','','weishanyizuhuizuzizhixian','WSYZHZZZX','0');
INSERT INTO `tk_cities` VALUES('532928','532900','永平县','云南省-大理白族自治州 -永平县','永平县','大理白族自治州 ','云南省','3','672600','0872','','','yongpingxian','YPX','0');
INSERT INTO `tk_cities` VALUES('532929','532900','云龙县','云南省-大理白族自治州 -云龙县','云龙县','大理白族自治州 ','云南省','3','672700','0872','','','yunlongxian','YLX','0');
INSERT INTO `tk_cities` VALUES('532930','532900','洱源县','云南省-大理白族自治州 -洱源县','洱源县','大理白族自治州 ','云南省','3','671200','0872','','','eryuanxian','EYX','0');
INSERT INTO `tk_cities` VALUES('532931','532900','剑川县','云南省-大理白族自治州 -剑川县','剑川县','大理白族自治州 ','云南省','3','671300','0872','','','jianchuanxian','JCX','0');
INSERT INTO `tk_cities` VALUES('532932','532900','鹤庆县','云南省-大理白族自治州 -鹤庆县','鹤庆县','大理白族自治州 ','云南省','3','671500','0872','','','heqingxian','HQX','0');
INSERT INTO `tk_cities` VALUES('533102','533100','瑞丽市','云南省-德宏傣族景颇族自治州 -瑞丽市','瑞丽市','德宏傣族景颇族自治州 ','云南省','3','678600','0692','','','ruilishi','RLS','0');
INSERT INTO `tk_cities` VALUES('533103','533100','芒市','云南省-德宏傣族景颇族自治州 -芒市','芒市','德宏傣族景颇族自治州 ','云南省','3','678400','0692','','','mangshi','MS','0');
INSERT INTO `tk_cities` VALUES('533122','533100','梁河县','云南省-德宏傣族景颇族自治州 -梁河县','梁河县','德宏傣族景颇族自治州 ','云南省','3','679200','0692','','','lianghexian','LHX','0');
INSERT INTO `tk_cities` VALUES('533123','533100','盈江县','云南省-德宏傣族景颇族自治州 -盈江县','盈江县','德宏傣族景颇族自治州 ','云南省','3','679300','0692','','','yingjiangxian','YJX','0');
INSERT INTO `tk_cities` VALUES('533124','533100','陇川县','云南省-德宏傣族景颇族自治州 -陇川县','陇川县','德宏傣族景颇族自治州 ','云南省','3','678700','0692','','','longchuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('533321','533300','泸水县','云南省-怒江傈僳族自治州 -泸水县','泸水县','怒江傈僳族自治州 ','云南省','3','673200','0886','','','shuixian','SX','0');
INSERT INTO `tk_cities` VALUES('533323','533300','福贡县','云南省-怒江傈僳族自治州 -福贡县','福贡县','怒江傈僳族自治州 ','云南省','3','673400','0886','','','fugongxian','FGX','0');
INSERT INTO `tk_cities` VALUES('533324','533300','贡山独龙族怒族自治县','云南省-怒江傈僳族自治州 -贡山独龙族怒族自治县','贡山独龙族怒族自治县','怒江傈僳族自治州 ','云南省','3','673500','0886','','','gongshandulongzunuzuzizhixian','GSDLZNZZZX','0');
INSERT INTO `tk_cities` VALUES('533325','533300','兰坪白族普米族自治县','云南省-怒江傈僳族自治州 -兰坪白族普米族自治县','兰坪白族普米族自治县','怒江傈僳族自治州 ','云南省','3','671400','0886','','','lanpingbaizupumizuzizhixian','LPBZPMZZZX','0');
INSERT INTO `tk_cities` VALUES('533421','533400','香格里拉县','云南省-迪庆藏族自治州 -香格里拉县','香格里拉县','迪庆藏族自治州 ','云南省','3','674400','0887','','','xianggelilaxian','XGLLX','0');
INSERT INTO `tk_cities` VALUES('533422','533400','德钦县','云南省-迪庆藏族自治州 -德钦县','德钦县','迪庆藏族自治州 ','云南省','3','674500','0887','','','deqinxian','DQX','0');
INSERT INTO `tk_cities` VALUES('533423','533400','维西傈僳族自治县','云南省-迪庆藏族自治州 -维西傈僳族自治县','维西傈僳族自治县','迪庆藏族自治州 ','云南省','3','674600','0887','','','weixilisuzuzizhixian','WXLSZZZX','0');
INSERT INTO `tk_cities` VALUES('540000','0','西藏自治区','西藏自治区','','','西藏自治区','1','','','','','xicangzizhiqu','XCZZQ','0');
INSERT INTO `tk_cities` VALUES('540100','540000','拉萨市','西藏自治区-拉萨市','','拉萨市','西藏自治区','2','850000','0891','','','lasashi','LSS','0');
INSERT INTO `tk_cities` VALUES('542100','540000','昌都地区','西藏自治区-昌都地区','','昌都地区','西藏自治区','2','854000','0895','','','changdudiqu','CDDQ','0');
INSERT INTO `tk_cities` VALUES('542200','540000','山南地区','西藏自治区-山南地区','','山南地区','西藏自治区','2','856100','0893','','','shannandiqu','SNDQ','0');
INSERT INTO `tk_cities` VALUES('542300','540000','日喀则地区','西藏自治区-日喀则地区','','日喀则地区','西藏自治区','2','857000','0892','','','rikazediqu','RKZDQ','0');
INSERT INTO `tk_cities` VALUES('542400','540000','那曲地区','西藏自治区-那曲地区','','那曲地区','西藏自治区','2','852000','0896','','','naqudiqu','NQDQ','0');
INSERT INTO `tk_cities` VALUES('542500','540000','阿里地区','西藏自治区-阿里地区','','阿里地区','西藏自治区','2','859500','0806','','','alidiqu','ALDQ','0');
INSERT INTO `tk_cities` VALUES('542600','540000','林芝地区','西藏自治区-林芝地区','','林芝地区','西藏自治区','2','860100','0894','','','linzhidiqu','LZDQ','0');
INSERT INTO `tk_cities` VALUES('540102','540100','城关区','西藏自治区-拉萨市-城关区','城关区','拉萨市','西藏自治区','3','850000','0891','','','chengguanqu','CGQ','0');
INSERT INTO `tk_cities` VALUES('540121','540100','林周县','西藏自治区-拉萨市-林周县','林周县','拉萨市','西藏自治区','3','851600','0891','','','linzhouxian','LZX','0');
INSERT INTO `tk_cities` VALUES('540122','540100','当雄县','西藏自治区-拉萨市-当雄县','当雄县','拉萨市','西藏自治区','3','851500','0891','','','dangxiongxian','DXX','0');
INSERT INTO `tk_cities` VALUES('540123','540100','尼木县','西藏自治区-拉萨市-尼木县','尼木县','拉萨市','西藏自治区','3','851600','0891','','','nimuxian','NMX','0');
INSERT INTO `tk_cities` VALUES('540124','540100','曲水县','西藏自治区-拉萨市-曲水县','曲水县','拉萨市','西藏自治区','3','850600','0891','','','qushuixian','QSX','0');
INSERT INTO `tk_cities` VALUES('540125','540100','堆龙德庆县','西藏自治区-拉萨市-堆龙德庆县','堆龙德庆县','拉萨市','西藏自治区','3','851400','0891','','','duilongdeqingxian','DLDQX','0');
INSERT INTO `tk_cities` VALUES('540126','540100','达孜县','西藏自治区-拉萨市-达孜县','达孜县','拉萨市','西藏自治区','3','850100','0891','','','dazixian','DZX','0');
INSERT INTO `tk_cities` VALUES('540127','540100','墨竹工卡县','西藏自治区-拉萨市-墨竹工卡县','墨竹工卡县','拉萨市','西藏自治区','3','850200','0891','','','mozhugongkaxian','MZGKX','0');
INSERT INTO `tk_cities` VALUES('542121','542100','昌都县','西藏自治区-昌都地区-昌都县','昌都县','昌都地区','西藏自治区','3','854000','0895','','','changduxian','CDX','0');
INSERT INTO `tk_cities` VALUES('542122','542100','江达县','西藏自治区-昌都地区-江达县','江达县','昌都地区','西藏自治区','3','854100','0895','','','jiangdaxian','JDX','0');
INSERT INTO `tk_cities` VALUES('542123','542100','贡觉县','西藏自治区-昌都地区-贡觉县','贡觉县','昌都地区','西藏自治区','3','854200','0805','','','gongjuexian','GJX','0');
INSERT INTO `tk_cities` VALUES('542124','542100','类乌齐县','西藏自治区-昌都地区-类乌齐县','类乌齐县','昌都地区','西藏自治区','3','855600','0850','','','leiwuqixian','LWQX','0');
INSERT INTO `tk_cities` VALUES('542125','542100','丁青县','西藏自治区-昌都地区-丁青县','丁青县','昌都地区','西藏自治区','3','855700','0805','','','dingqingxian','DQX','0');
INSERT INTO `tk_cities` VALUES('542126','542100','察雅县','西藏自治区-昌都地区-察雅县','察雅县','昌都地区','西藏自治区','3','854300','0895','','','chayaxian','CYX','0');
INSERT INTO `tk_cities` VALUES('542127','542100','八宿县','西藏自治区-昌都地区-八宿县','八宿县','昌都地区','西藏自治区','3','854600','0805','','','basuxian','BSX','0');
INSERT INTO `tk_cities` VALUES('542128','542100','左贡县','西藏自治区-昌都地区-左贡县','左贡县','昌都地区','西藏自治区','3','854400','0805','','','zuogongxian','ZGX','0');
INSERT INTO `tk_cities` VALUES('542129','542100','芒康县','西藏自治区-昌都地区-芒康县','芒康县','昌都地区','西藏自治区','3','854500','0805','','','mangkangxian','MKX','0');
INSERT INTO `tk_cities` VALUES('542132','542100','洛隆县','西藏自治区-昌都地区-洛隆县','洛隆县','昌都地区','西藏自治区','3','855400','0805','','','luolongxian','LLX','0');
INSERT INTO `tk_cities` VALUES('542133','542100','边坝县','西藏自治区-昌都地区-边坝县','边坝县','昌都地区','西藏自治区','3','855500','0805','','','bianbaxian','BBX','0');
INSERT INTO `tk_cities` VALUES('542221','542200','乃东县','西藏自治区- 山南地区-乃东县','乃东县',' 山南地区','西藏自治区','3','856100','0893','','','naidongxian','NDX','0');
INSERT INTO `tk_cities` VALUES('542222','542200','扎囊县','西藏自治区- 山南地区-扎囊县','扎囊县',' 山南地区','西藏自治区','3','850800','0804','','','zhanangxian','ZNX','0');
INSERT INTO `tk_cities` VALUES('542223','542200','贡嘎县','西藏自治区- 山南地区-贡嘎县','贡嘎县',' 山南地区','西藏自治区','3','850700','0893','','','gonggaxian','GGX','0');
INSERT INTO `tk_cities` VALUES('542224','542200','桑日县','西藏自治区- 山南地区-桑日县','桑日县',' 山南地区','西藏自治区','3','856200','0893','','','sangrixian','SRX','0');
INSERT INTO `tk_cities` VALUES('542225','542200','琼结县','西藏自治区- 山南地区-琼结县','琼结县',' 山南地区','西藏自治区','3','856800','0803','','','qiongjiexian','QJX','0');
INSERT INTO `tk_cities` VALUES('542226','542200','曲松县','西藏自治区- 山南地区-曲松县','曲松县',' 山南地区','西藏自治区','3','856300','0803','','','qusongxian','QSX','0');
INSERT INTO `tk_cities` VALUES('542227','542200','措美县','西藏自治区- 山南地区-措美县','措美县',' 山南地区','西藏自治区','3','856900','0807','','','cuomeixian','CMX','0');
INSERT INTO `tk_cities` VALUES('542228','542200','洛扎县','西藏自治区- 山南地区-洛扎县','洛扎县',' 山南地区','西藏自治区','3','851200','0804','','','luozhaxian','LZX','0');
INSERT INTO `tk_cities` VALUES('542229','542200','加查县','西藏自治区- 山南地区-加查县','加查县',' 山南地区','西藏自治区','3','856400','0803','','','jiachaxian','JCX','0');
INSERT INTO `tk_cities` VALUES('542231','542200','隆子县','西藏自治区- 山南地区-隆子县','隆子县',' 山南地区','西藏自治区','3','856600','0803','','','longzixian','LZX','0');
INSERT INTO `tk_cities` VALUES('542232','542200','错那县','西藏自治区- 山南地区-错那县','错那县',' 山南地区','西藏自治区','3','856700','0803','','','cuonaxian','CNX','0');
INSERT INTO `tk_cities` VALUES('542233','542200','浪卡子县','西藏自治区- 山南地区-浪卡子县','浪卡子县',' 山南地区','西藏自治区','3','851100','0804','','','langkazixian','LKZX','0');
INSERT INTO `tk_cities` VALUES('542301','542300','日喀则市','西藏自治区-日喀则地区-日喀则市','日喀则市','日喀则地区','西藏自治区','3','857000','0892','','','rikazeshi','RKZS','0');
INSERT INTO `tk_cities` VALUES('542322','542300','南木林县','西藏自治区-日喀则地区-南木林县','南木林县','日喀则地区','西藏自治区','3','857100','0803','','','nanmulinxian','NMLX','0');
INSERT INTO `tk_cities` VALUES('542323','542300','江孜县','西藏自治区-日喀则地区-江孜县','江孜县','日喀则地区','西藏自治区','3','857400','0892','','','jiangzixian','JZX','0');
INSERT INTO `tk_cities` VALUES('542324','542300','定日县','西藏自治区-日喀则地区-定日县','定日县','日喀则地区','西藏自治区','3','858200','0802','','','dingrixian','DRX','0');
INSERT INTO `tk_cities` VALUES('542325','542300','萨迦县','西藏自治区-日喀则地区-萨迦县','萨迦县','日喀则地区','西藏自治区','3','857800','0802','','','saxian','SX','0');
INSERT INTO `tk_cities` VALUES('542326','542300','拉孜县','西藏自治区-日喀则地区-拉孜县','拉孜县','日喀则地区','西藏自治区','3','858100','0803','','','lazixian','LZX','0');
INSERT INTO `tk_cities` VALUES('542327','542300','昂仁县','西藏自治区-日喀则地区-昂仁县','昂仁县','日喀则地区','西藏自治区','3','858500','0803','','','angrenxian','ARX','0');
INSERT INTO `tk_cities` VALUES('542328','542300','谢通门县','西藏自治区-日喀则地区-谢通门县','谢通门县','日喀则地区','西藏自治区','3','858900','0803','','','xietongmenxian','XTMX','0');
INSERT INTO `tk_cities` VALUES('542329','542300','白朗县','西藏自治区-日喀则地区-白朗县','白朗县','日喀则地区','西藏自治区','3','857300','0892','','','bailangxian','BLX','0');
INSERT INTO `tk_cities` VALUES('542330','542300','仁布县','西藏自治区-日喀则地区-仁布县','仁布县','日喀则地区','西藏自治区','3','857200','0892','','','renbuxian','RBX','0');
INSERT INTO `tk_cities` VALUES('542331','542300','康马县','西藏自治区-日喀则地区-康马县','康马县','日喀则地区','西藏自治区','3','857500','0802','','','kangmaxian','KMX','0');
INSERT INTO `tk_cities` VALUES('542332','542300','定结县','西藏自治区-日喀则地区-定结县','定结县','日喀则地区','西藏自治区','3','857900','0802','','','dingjiexian','DJX','0');
INSERT INTO `tk_cities` VALUES('542333','542300','仲巴县','西藏自治区-日喀则地区-仲巴县','仲巴县','日喀则地区','西藏自治区','3','858800','0802','','','zhongbaxian','ZBX','0');
INSERT INTO `tk_cities` VALUES('542334','542300','亚东县','西藏自治区-日喀则地区-亚东县','亚东县','日喀则地区','西藏自治区','3','857600','0802','','','yadongxian','YDX','0');
INSERT INTO `tk_cities` VALUES('542335','542300','吉隆县','西藏自治区-日喀则地区-吉隆县','吉隆县','日喀则地区','西藏自治区','3','858700','0802','','','jilongxian','JLX','0');
INSERT INTO `tk_cities` VALUES('542336','542300','聂拉木县','西藏自治区-日喀则地区-聂拉木县','聂拉木县','日喀则地区','西藏自治区','3','858300','0802','','','nielamuxian','NLMX','0');
INSERT INTO `tk_cities` VALUES('542337','542300','萨嘎县','西藏自治区-日喀则地区-萨嘎县','萨嘎县','日喀则地区','西藏自治区','3','858600','0802','','','sagaxian','SGX','0');
INSERT INTO `tk_cities` VALUES('542338','542300','岗巴县','西藏自治区-日喀则地区-岗巴县','岗巴县','日喀则地区','西藏自治区','3','857700','0802','','','gangbaxian','GBX','0');
INSERT INTO `tk_cities` VALUES('542421','542400','那曲县','西藏自治区-那曲地区-那曲县','那曲县','那曲地区','西藏自治区','3','852000','0896','','','naquxian','NQX','0');
INSERT INTO `tk_cities` VALUES('542422','542400','嘉黎县','西藏自治区-那曲地区-嘉黎县','嘉黎县','那曲地区','西藏自治区','3','852400','0806','','','jialixian','JLX','0');
INSERT INTO `tk_cities` VALUES('542423','542400','比如县','西藏自治区-那曲地区-比如县','比如县','那曲地区','西藏自治区','3','852300','0806','','','biruxian','BRX','0');
INSERT INTO `tk_cities` VALUES('542424','542400','聂荣县','西藏自治区-那曲地区-聂荣县','聂荣县','那曲地区','西藏自治区','3','853500','0806','','','nierongxian','NRX','0');
INSERT INTO `tk_cities` VALUES('542425','542400','安多县','西藏自治区-那曲地区-安多县','安多县','那曲地区','西藏自治区','3','853400','0896','','','anduoxian','ADX','0');
INSERT INTO `tk_cities` VALUES('542426','542400','申扎县','西藏自治区-那曲地区-申扎县','申扎县','那曲地区','西藏自治区','3','853100','0806','','','shenzhaxian','SZX','0');
INSERT INTO `tk_cities` VALUES('542427','542400','索县','西藏自治区-那曲地区-索县','索县','那曲地区','西藏自治区','3','852200','0807','','','suoxian','SX','0');
INSERT INTO `tk_cities` VALUES('542428','542400','班戈县','西藏自治区-那曲地区-班戈县','班戈县','那曲地区','西藏自治区','3','852500','0806','','','bangexian','BGX','0');
INSERT INTO `tk_cities` VALUES('542429','542400','巴青县','西藏自治区-那曲地区-巴青县','巴青县','那曲地区','西藏自治区','3','852100','0806','','','baqingxian','BQX','0');
INSERT INTO `tk_cities` VALUES('542430','542400','尼玛县','西藏自治区-那曲地区-尼玛县','尼玛县','那曲地区','西藏自治区','3','853200','0808','','','nimaxian','NMX','0');
INSERT INTO `tk_cities` VALUES('542521','542500','普兰县','西藏自治区-阿里地区-普兰县','普兰县','阿里地区','西藏自治区','3','859500','0806','','','pulanxian','PLX','0');
INSERT INTO `tk_cities` VALUES('542522','542500','札达县','西藏自治区-阿里地区-札达县','札达县','阿里地区','西藏自治区','3','859600','0807','','','zhadaxian','ZDX','0');
INSERT INTO `tk_cities` VALUES('542523','542500','噶尔县','西藏自治区-阿里地区-噶尔县','噶尔县','阿里地区','西藏自治区','3','859000','0897','','','gaerxian','GEX','0');
INSERT INTO `tk_cities` VALUES('542524','542500','日土县','西藏自治区-阿里地区-日土县','日土县','阿里地区','西藏自治区','3','859700','0807','','','rituxian','RTX','0');
INSERT INTO `tk_cities` VALUES('542525','542500','革吉县','西藏自治区-阿里地区-革吉县','革吉县','阿里地区','西藏自治区','3','859100','0807','','','gejixian','GJX','0');
INSERT INTO `tk_cities` VALUES('542526','542500','改则县','西藏自治区-阿里地区-改则县','改则县','阿里地区','西藏自治区','3','859200','0807','','','gaizexian','GZX','0');
INSERT INTO `tk_cities` VALUES('542527','542500','措勤县','西藏自治区-阿里地区-措勤县','措勤县','阿里地区','西藏自治区','3','859300','0806','','','cuoqinxian','CQX','0');
INSERT INTO `tk_cities` VALUES('542621','542600','林芝县','西藏自治区-林芝地区-林芝县','林芝县','林芝地区','西藏自治区','3','860100','0894','','','linzhixian','LZX','0');
INSERT INTO `tk_cities` VALUES('542622','542600','工布江达县','西藏自治区-林芝地区-工布江达县','工布江达县','林芝地区','西藏自治区','3','860200','0894','','','gongbujiangdaxian','GBJDX','0');
INSERT INTO `tk_cities` VALUES('542623','542600','米林县','西藏自治区-林芝地区-米林县','米林县','林芝地区','西藏自治区','3','860500','0894','','','milinxian','MLX','0');
INSERT INTO `tk_cities` VALUES('542624','542600','墨脱县','西藏自治区-林芝地区-墨脱县','墨脱县','林芝地区','西藏自治区','3','860700','0894','','','motuoxian','MTX','0');
INSERT INTO `tk_cities` VALUES('542625','542600','波密县','西藏自治区-林芝地区-波密县','波密县','林芝地区','西藏自治区','3','860300','0894','','','bomixian','BMX','0');
INSERT INTO `tk_cities` VALUES('542626','542600','察隅县','西藏自治区-林芝地区-察隅县','察隅县','林芝地区','西藏自治区','3','860600','0894','','','chayuxian','CYX','0');
INSERT INTO `tk_cities` VALUES('542627','542600','朗县','西藏自治区-林芝地区-朗县','朗县','林芝地区','西藏自治区','3','860400','0894','','','langxian','LX','0');
INSERT INTO `tk_cities` VALUES('610000','0','陕西省','陕西省','','','陕西省','1','','','','','shanxisheng','SXS','0');
INSERT INTO `tk_cities` VALUES('610100','610000','西安市','陕西省-西安市','','西安市','陕西省','2','710000','029','','','xianshi','XAS','0');
INSERT INTO `tk_cities` VALUES('610200','610000','铜川市','陕西省-铜川市','','铜川市','陕西省','2','727000','0919','','','tongchuanshi','TCS','0');
INSERT INTO `tk_cities` VALUES('610300','610000','宝鸡市','陕西省-宝鸡市','','宝鸡市','陕西省','2','721000','0917','','','baojishi','BJS','0');
INSERT INTO `tk_cities` VALUES('610400','610000','咸阳市','陕西省-咸阳市','','咸阳市','陕西省','2','712000','0910','','','xianyangshi','XYS','0');
INSERT INTO `tk_cities` VALUES('610500','610000','渭南市','陕西省-渭南市','','渭南市','陕西省','2','714000','0913','','','weinanshi','WNS','0');
INSERT INTO `tk_cities` VALUES('610600','610000','延安市','陕西省-延安市','','延安市','陕西省','2','716000','0911','','','yananshi','YAS','0');
INSERT INTO `tk_cities` VALUES('610700','610000','汉中市','陕西省-汉中市','','汉中市','陕西省','2','723000','0916','','','hanzhongshi','HZS','0');
INSERT INTO `tk_cities` VALUES('610800','610000','榆林市','陕西省-榆林市','','榆林市','陕西省','2','719000','0912','','','yulinshi','YLS','0');
INSERT INTO `tk_cities` VALUES('610900','610000','安康市','陕西省-安康市','','安康市','陕西省','2','725000','0915','','','ankangshi','AKS','0');
INSERT INTO `tk_cities` VALUES('611000','610000','商洛市','陕西省-商洛市','','商洛市','陕西省','2','726000','0914','','','shangluoshi','SLS','0');
INSERT INTO `tk_cities` VALUES('610102','610100','新城区','陕西省-西安市-新城区','新城区','西安市','陕西省','3','710000','029','','','xinchengqu','XCQ','0');
INSERT INTO `tk_cities` VALUES('610103','610100','碑林区','陕西省-西安市-碑林区','碑林区','西安市','陕西省','3','710000','029','','','beilinqu','BLQ','0');
INSERT INTO `tk_cities` VALUES('610104','610100','莲湖区','陕西省-西安市-莲湖区','莲湖区','西安市','陕西省','3','710000','029','','','lianhuqu','LHQ','0');
INSERT INTO `tk_cities` VALUES('610111','610100','灞桥区','陕西省-西安市-灞桥区','灞桥区','西安市','陕西省','3','710000','029','','','qiaoqu','QQ','0');
INSERT INTO `tk_cities` VALUES('610112','610100','未央区','陕西省-西安市-未央区','未央区','西安市','陕西省','3','710000','029','','','weiyangqu','WYQ','0');
INSERT INTO `tk_cities` VALUES('610113','610100','雁塔区','陕西省-西安市-雁塔区','雁塔区','西安市','陕西省','3','710000','029','','','yantaqu','YTQ','0');
INSERT INTO `tk_cities` VALUES('610114','610100','阎良区','陕西省-西安市-阎良区','阎良区','西安市','陕西省','3','710000','029','','','yanliangqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('610115','610100','临潼区','陕西省-西安市-临潼区','临潼区','西安市','陕西省','3','710600','029','','','linqu','LQ','0');
INSERT INTO `tk_cities` VALUES('610116','610100','长安区','陕西省-西安市-长安区','长安区','西安市','陕西省','3','710100','029','','','changanqu','CAQ','0');
INSERT INTO `tk_cities` VALUES('610122','610100','蓝田县','陕西省-西安市-蓝田县','蓝田县','西安市','陕西省','3','710500','029','','','lantianxian','LTX','0');
INSERT INTO `tk_cities` VALUES('610124','610100','周至县','陕西省-西安市-周至县','周至县','西安市','陕西省','3','710400','029','','','zhouzhixian','ZZX','0');
INSERT INTO `tk_cities` VALUES('610125','610100','户县','陕西省-西安市-户县','户县','西安市','陕西省','3','710300','029','','','huxian','HX','0');
INSERT INTO `tk_cities` VALUES('610126','610100','高陵县','陕西省-西安市-高陵县','高陵县','西安市','陕西省','3','710200','029','','','gaolingxian','GLX','0');
INSERT INTO `tk_cities` VALUES('610202','610200','王益区','陕西省-铜川市-王益区','王益区','铜川市','陕西省','3','727000','0919','','','wangyiqu','WYQ','0');
INSERT INTO `tk_cities` VALUES('610203','610200','印台区','陕西省-铜川市-印台区','印台区','铜川市','陕西省','3','727000','0919','','','yintaiqu','YTQ','0');
INSERT INTO `tk_cities` VALUES('610204','610200','耀州区','陕西省-铜川市-耀州区','耀州区','铜川市','陕西省','3','727100','0919','','','yaozhouqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('610222','610200','宜君县','陕西省-铜川市-宜君县','宜君县','铜川市','陕西省','3','727200','0919','','','yijunxian','YJX','0');
INSERT INTO `tk_cities` VALUES('610302','610300','渭滨区','陕西省-宝鸡市-渭滨区','渭滨区','宝鸡市','陕西省','3','721000','0917','','','weibinqu','WBQ','0');
INSERT INTO `tk_cities` VALUES('610303','610300','金台区','陕西省-宝鸡市-金台区','金台区','宝鸡市','陕西省','3','721000','0917','','','jintaiqu','JTQ','0');
INSERT INTO `tk_cities` VALUES('610304','610300','陈仓区','陕西省-宝鸡市-陈仓区','陈仓区','宝鸡市','陕西省','3','721300','0917','','','chencangqu','CCQ','0');
INSERT INTO `tk_cities` VALUES('610322','610300','凤翔县','陕西省-宝鸡市-凤翔县','凤翔县','宝鸡市','陕西省','3','721400','0917','','','fengxiangxian','FXX','0');
INSERT INTO `tk_cities` VALUES('610323','610300','岐山县','陕西省-宝鸡市-岐山县','岐山县','宝鸡市','陕西省','3','722400','0917','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('610324','610300','扶风县','陕西省-宝鸡市-扶风县','扶风县','宝鸡市','陕西省','3','722200','0917','','','fufengxian','FFX','0');
INSERT INTO `tk_cities` VALUES('610326','610300','眉县','陕西省-宝鸡市-眉县','眉县','宝鸡市','陕西省','3','722300','0917','','','meixian','MX','0');
INSERT INTO `tk_cities` VALUES('610327','610300','陇县','陕西省-宝鸡市-陇县','陇县','宝鸡市','陕西省','3','721200','0917','','','longxian','LX','0');
INSERT INTO `tk_cities` VALUES('610328','610300','千阳县','陕西省-宝鸡市-千阳县','千阳县','宝鸡市','陕西省','3','721100','0917','','','qianyangxian','QYX','0');
INSERT INTO `tk_cities` VALUES('610329','610300','麟游县','陕西省-宝鸡市-麟游县','麟游县','宝鸡市','陕西省','3','721500','0917','','','youxian','YX','0');
INSERT INTO `tk_cities` VALUES('610330','610300','凤县','陕西省-宝鸡市-凤县','凤县','宝鸡市','陕西省','3','721700','0917','','','fengxian','FX','0');
INSERT INTO `tk_cities` VALUES('610331','610300','太白县','陕西省-宝鸡市-太白县','太白县','宝鸡市','陕西省','3','721600','0917','','','taibaixian','TBX','0');
INSERT INTO `tk_cities` VALUES('610402','610400','秦都区','陕西省-咸阳市-秦都区','秦都区','咸阳市','陕西省','3','712000','0910','','','qinduqu','QDQ','0');
INSERT INTO `tk_cities` VALUES('610403','610400','杨陵区','陕西省-咸阳市-杨陵区','杨陵区','咸阳市','陕西省','3','712000','0910','','','yanglingqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('610404','610400','渭城区','陕西省-咸阳市-渭城区','渭城区','咸阳市','陕西省','3','712000','0910','','','weichengqu','WCQ','0');
INSERT INTO `tk_cities` VALUES('610422','610400','三原县','陕西省-咸阳市-三原县','三原县','咸阳市','陕西省','3','713800','0910','','','sanyuanxian','SYX','0');
INSERT INTO `tk_cities` VALUES('610423','610400','泾阳县','陕西省-咸阳市-泾阳县','泾阳县','咸阳市','陕西省','3','713700','0910','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('610424','610400','乾县','陕西省-咸阳市-乾县','乾县','咸阳市','陕西省','3','713300','0910','','','qianxian','QX','0');
INSERT INTO `tk_cities` VALUES('610425','610400','礼泉县','陕西省-咸阳市-礼泉县','礼泉县','咸阳市','陕西省','3','713200','0910','','','liquanxian','LQX','0');
INSERT INTO `tk_cities` VALUES('610426','610400','永寿县','陕西省-咸阳市-永寿县','永寿县','咸阳市','陕西省','3','713400','0910','','','yongshouxian','YSX','0');
INSERT INTO `tk_cities` VALUES('610427','610400','彬县','陕西省-咸阳市-彬县','彬县','咸阳市','陕西省','3','713500','0910','','','binxian','BX','0');
INSERT INTO `tk_cities` VALUES('610428','610400','长武县','陕西省-咸阳市-长武县','长武县','咸阳市','陕西省','3','713600','0910','','','changwuxian','CWX','0');
INSERT INTO `tk_cities` VALUES('610429','610400','旬邑县','陕西省-咸阳市-旬邑县','旬邑县','咸阳市','陕西省','3','711300','0910','','','xunyixian','XYX','0');
INSERT INTO `tk_cities` VALUES('610430','610400','淳化县','陕西省-咸阳市-淳化县','淳化县','咸阳市','陕西省','3','711200','0910','','','chunhuaxian','CHX','0');
INSERT INTO `tk_cities` VALUES('610431','610400','武功县','陕西省-咸阳市-武功县','武功县','咸阳市','陕西省','3','712200','0910','','','wugongxian','WGX','0');
INSERT INTO `tk_cities` VALUES('610481','610400','兴平市','陕西省-咸阳市-兴平市','兴平市','咸阳市','陕西省','3','713100','0910','','','xingpingshi','XPS','0');
INSERT INTO `tk_cities` VALUES('610502','610500','临渭区','陕西省-渭南市-临渭区','临渭区','渭南市','陕西省','3','714000','0913','','','linweiqu','LWQ','0');
INSERT INTO `tk_cities` VALUES('610521','610500','华县','陕西省-渭南市-华县','华县','渭南市','陕西省','3','714100','0913','','','huaxian','HX','0');
INSERT INTO `tk_cities` VALUES('610522','610500','潼关县','陕西省-渭南市-潼关县','潼关县','渭南市','陕西省','3','714300','0913','','','guanxian','GX','0');
INSERT INTO `tk_cities` VALUES('610523','610500','大荔县','陕西省-渭南市-大荔县','大荔县','渭南市','陕西省','3','715100','0913','','','dalixian','DLX','0');
INSERT INTO `tk_cities` VALUES('610524','610500','合阳县','陕西省-渭南市-合阳县','合阳县','渭南市','陕西省','3','715300','0913','','','heyangxian','HYX','0');
INSERT INTO `tk_cities` VALUES('610525','610500','澄城县','陕西省-渭南市-澄城县','澄城县','渭南市','陕西省','3','715200','0913','','','chengchengxian','CCX','0');
INSERT INTO `tk_cities` VALUES('610526','610500','蒲城县','陕西省-渭南市-蒲城县','蒲城县','渭南市','陕西省','3','715500','0913','','','puchengxian','PCX','0');
INSERT INTO `tk_cities` VALUES('610527','610500','白水县','陕西省-渭南市-白水县','白水县','渭南市','陕西省','3','715600','0913','','','baishuixian','BSX','0');
INSERT INTO `tk_cities` VALUES('610528','610500','富平县','陕西省-渭南市-富平县','富平县','渭南市','陕西省','3','711700','0913','','','fupingxian','FPX','0');
INSERT INTO `tk_cities` VALUES('610581','610500','韩城市','陕西省-渭南市-韩城市','韩城市','渭南市','陕西省','3','715400','0913','','','hanchengshi','HCS','0');
INSERT INTO `tk_cities` VALUES('610582','610500','华阴市','陕西省-渭南市-华阴市','华阴市','渭南市','陕西省','3','714200','0913','','','huayinshi','HYS','0');
INSERT INTO `tk_cities` VALUES('610602','610600','宝塔区','陕西省-延安市-宝塔区','宝塔区','延安市','陕西省','3','716000','0911','','','baotaqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('610621','610600','延长县','陕西省-延安市-延长县','延长县','延安市','陕西省','3','717100','0911','','','yanchangxian','YCX','0');
INSERT INTO `tk_cities` VALUES('610622','610600','延川县','陕西省-延安市-延川县','延川县','延安市','陕西省','3','717200','0911','','','yanchuanxian','YCX','0');
INSERT INTO `tk_cities` VALUES('610623','610600','子长县','陕西省-延安市-子长县','子长县','延安市','陕西省','3','717300','0911','','','zichangxian','ZCX','0');
INSERT INTO `tk_cities` VALUES('610624','610600','安塞县','陕西省-延安市-安塞县','安塞县','延安市','陕西省','3','717400','0911','','','ansaixian','ASX','0');
INSERT INTO `tk_cities` VALUES('610625','610600','志丹县','陕西省-延安市-志丹县','志丹县','延安市','陕西省','3','717500','0911','','','zhidanxian','ZDX','0');
INSERT INTO `tk_cities` VALUES('610626','610600','吴起县','陕西省-延安市-吴起县','吴起县','延安市','陕西省','3','717600','0911','','','wuqixian','WQX','0');
INSERT INTO `tk_cities` VALUES('610627','610600','甘泉县','陕西省-延安市-甘泉县','甘泉县','延安市','陕西省','3','716100','0911','','','ganquanxian','GQX','0');
INSERT INTO `tk_cities` VALUES('610628','610600','富县','陕西省-延安市-富县','富县','延安市','陕西省','3','727500','0911','','','fuxian','FX','0');
INSERT INTO `tk_cities` VALUES('610629','610600','洛川县','陕西省-延安市-洛川县','洛川县','延安市','陕西省','3','727400','0911','','','luochuanxian','LCX','0');
INSERT INTO `tk_cities` VALUES('610630','610600','宜川县','陕西省-延安市-宜川县','宜川县','延安市','陕西省','3','716200','0911','','','yichuanxian','YCX','0');
INSERT INTO `tk_cities` VALUES('610631','610600','黄龙县','陕西省-延安市-黄龙县','黄龙县','延安市','陕西省','3','715700','0911','','','huanglongxian','HLX','0');
INSERT INTO `tk_cities` VALUES('610632','610600','黄陵县','陕西省-延安市-黄陵县','黄陵县','延安市','陕西省','3','727300','0911','','','huanglingxian','HLX','0');
INSERT INTO `tk_cities` VALUES('610702','610700','汉台区','陕西省-汉中市-汉台区','汉台区','汉中市','陕西省','3','723000','0916','','','hantaiqu','HTQ','0');
INSERT INTO `tk_cities` VALUES('610721','610700','南郑县','陕西省-汉中市-南郑县','南郑县','汉中市','陕西省','3','723100','0916','','','nanzhengxian','NZX','0');
INSERT INTO `tk_cities` VALUES('610722','610700','城固县','陕西省-汉中市-城固县','城固县','汉中市','陕西省','3','723200','0916','','','chengguxian','CGX','0');
INSERT INTO `tk_cities` VALUES('610723','610700','洋县','陕西省-汉中市-洋县','洋县','汉中市','陕西省','3','723300','0916','','','yangxian','YX','0');
INSERT INTO `tk_cities` VALUES('610724','610700','西乡县','陕西省-汉中市-西乡县','西乡县','汉中市','陕西省','3','723500','0916','','','xixiangxian','XXX','0');
INSERT INTO `tk_cities` VALUES('610725','610700','勉县','陕西省-汉中市-勉县','勉县','汉中市','陕西省','3','724200','0916','','','mianxian','MX','0');
INSERT INTO `tk_cities` VALUES('610726','610700','宁强县','陕西省-汉中市-宁强县','宁强县','汉中市','陕西省','3','724400','0916','','','ningqiangxian','NQX','0');
INSERT INTO `tk_cities` VALUES('610727','610700','略阳县','陕西省-汉中市-略阳县','略阳县','汉中市','陕西省','3','724300','0916','','','lueyangxian','LYX','0');
INSERT INTO `tk_cities` VALUES('610728','610700','镇巴县','陕西省-汉中市-镇巴县','镇巴县','汉中市','陕西省','3','723600','0916','','','zhenbaxian','ZBX','0');
INSERT INTO `tk_cities` VALUES('610729','610700','留坝县','陕西省-汉中市-留坝县','留坝县','汉中市','陕西省','3','724100','0916','','','liubaxian','LBX','0');
INSERT INTO `tk_cities` VALUES('610730','610700','佛坪县','陕西省-汉中市-佛坪县','佛坪县','汉中市','陕西省','3','723400','0916','','','fopingxian','FPX','0');
INSERT INTO `tk_cities` VALUES('610802','610800','榆阳区','陕西省-榆林市-榆阳区','榆阳区','榆林市','陕西省','3','719000','0912','','','yuyangqu','YYQ','0');
INSERT INTO `tk_cities` VALUES('610821','610800','神木县','陕西省-榆林市-神木县','神木县','榆林市','陕西省','3','719300','0912','','','shenmuxian','SMX','0');
INSERT INTO `tk_cities` VALUES('610822','610800','府谷县','陕西省-榆林市-府谷县','府谷县','榆林市','陕西省','3','719400','0912','','','fuguxian','FGX','0');
INSERT INTO `tk_cities` VALUES('610823','610800','横山县','陕西省-榆林市-横山县','横山县','榆林市','陕西省','3','719200','0912','','','hengshanxian','HSX','0');
INSERT INTO `tk_cities` VALUES('610824','610800','靖边县','陕西省-榆林市-靖边县','靖边县','榆林市','陕西省','3','718500','0912','','','jingbianxian','JBX','0');
INSERT INTO `tk_cities` VALUES('610825','610800','定边县','陕西省-榆林市-定边县','定边县','榆林市','陕西省','3','718600','0912','','','dingbianxian','DBX','0');
INSERT INTO `tk_cities` VALUES('610826','610800','绥德县','陕西省-榆林市-绥德县','绥德县','榆林市','陕西省','3','718000','0912','','','suidexian','SDX','0');
INSERT INTO `tk_cities` VALUES('610827','610800','米脂县','陕西省-榆林市-米脂县','米脂县','榆林市','陕西省','3','718100','0912','','','mizhixian','MZX','0');
INSERT INTO `tk_cities` VALUES('610828','610800','佳县','陕西省-榆林市-佳县','佳县','榆林市','陕西省','3','719200','0912','','','jiaxian','JX','0');
INSERT INTO `tk_cities` VALUES('610829','610800','吴堡县','陕西省-榆林市-吴堡县','吴堡县','榆林市','陕西省','3','718200','0912','','','wubaoxian','WBX','0');
INSERT INTO `tk_cities` VALUES('610830','610800','清涧县','陕西省-榆林市-清涧县','清涧县','榆林市','陕西省','3','718300','0912','','','qingjianxian','QJX','0');
INSERT INTO `tk_cities` VALUES('610831','610800','子洲县','陕西省-榆林市-子洲县','子洲县','榆林市','陕西省','3','718400','0912','','','zizhouxian','ZZX','0');
INSERT INTO `tk_cities` VALUES('610902','610900','汉滨区','陕西省-安康市-汉滨区','汉滨区','安康市','陕西省','3','725000','0915','','','hanbinqu','HBQ','0');
INSERT INTO `tk_cities` VALUES('610921','610900','汉阴县','陕西省-安康市-汉阴县','汉阴县','安康市','陕西省','3','725100','0915','','','hanyinxian','HYX','0');
INSERT INTO `tk_cities` VALUES('610922','610900','石泉县','陕西省-安康市-石泉县','石泉县','安康市','陕西省','3','725200','0915','','','shiquanxian','SQX','0');
INSERT INTO `tk_cities` VALUES('610923','610900','宁陕县','陕西省-安康市-宁陕县','宁陕县','安康市','陕西省','3','711600','0915','','','ningshanxian','NSX','0');
INSERT INTO `tk_cities` VALUES('610924','610900','紫阳县','陕西省-安康市-紫阳县','紫阳县','安康市','陕西省','3','725300','0915','','','ziyangxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('610925','610900','岚皋县','陕西省-安康市-岚皋县','岚皋县','安康市','陕西省','3','725400','0915','','','gaoxian','GX','0');
INSERT INTO `tk_cities` VALUES('610926','610900','平利县','陕西省-安康市-平利县','平利县','安康市','陕西省','3','725500','0915','','','pinglixian','PLX','0');
INSERT INTO `tk_cities` VALUES('610927','610900','镇坪县','陕西省-安康市-镇坪县','镇坪县','安康市','陕西省','3','725600','0915','','','zhenpingxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('610928','610900','旬阳县','陕西省-安康市-旬阳县','旬阳县','安康市','陕西省','3','725700','0915','','','xunyangxian','XYX','0');
INSERT INTO `tk_cities` VALUES('610929','610900','白河县','陕西省-安康市-白河县','白河县','安康市','陕西省','3','725800','0915','','','baihexian','BHX','0');
INSERT INTO `tk_cities` VALUES('611002','611000','商州区','陕西省-商洛市-商州区','商州区','商洛市','陕西省','3','726000','0914','','','shangzhouqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('611021','611000','洛南县','陕西省-商洛市-洛南县','洛南县','商洛市','陕西省','3','726100','0914','','','luonanxian','LNX','0');
INSERT INTO `tk_cities` VALUES('611022','611000','丹凤县','陕西省-商洛市-丹凤县','丹凤县','商洛市','陕西省','3','726200','0914','','','danfengxian','DFX','0');
INSERT INTO `tk_cities` VALUES('611023','611000','商南县','陕西省-商洛市-商南县','商南县','商洛市','陕西省','3','726300','0914','','','shangnanxian','SNX','0');
INSERT INTO `tk_cities` VALUES('611024','611000','山阳县','陕西省-商洛市-山阳县','山阳县','商洛市','陕西省','3','726400','0914','','','shanyangxian','SYX','0');
INSERT INTO `tk_cities` VALUES('611025','611000','镇安县','陕西省-商洛市-镇安县','镇安县','商洛市','陕西省','3','711500','0914','','','zhenanxian','ZAX','0');
INSERT INTO `tk_cities` VALUES('611026','611000','柞水县','陕西省-商洛市-柞水县','柞水县','商洛市','陕西省','3','711400','0914','','','zuoshuixian','ZSX','0');
INSERT INTO `tk_cities` VALUES('620000','0','甘肃省','甘肃省','','','甘肃省','1','','','','','gansusheng','GSS','0');
INSERT INTO `tk_cities` VALUES('620100','620000','兰州市','甘肃省-兰州市','','兰州市','甘肃省','2','730000','0931','','','lanzhoushi','LZS','0');
INSERT INTO `tk_cities` VALUES('620200','620000','嘉峪关市','甘肃省-嘉峪关市','','嘉峪关市','甘肃省','2','737100','0935','','','jiayuguanshi','JYGS','0');
INSERT INTO `tk_cities` VALUES('620300','620000','金昌市','甘肃省-金昌市','','金昌市','甘肃省','2','737100','0935','','','jinchangshi','JCS','0');
INSERT INTO `tk_cities` VALUES('620400','620000','白银市','甘肃省-白银市','','白银市','甘肃省','2','730900','0943','','','baiyinshi','BYS','0');
INSERT INTO `tk_cities` VALUES('620500','620000','天水市','甘肃省-天水市','','天水市','甘肃省','2','741000','0938','','','tianshuishi','TSS','0');
INSERT INTO `tk_cities` VALUES('620600','620000','武威市','甘肃省-武威市','','武威市','甘肃省','2','733000','0935','','','wuweishi','WWS','0');
INSERT INTO `tk_cities` VALUES('620700','620000','张掖市','甘肃省-张掖市','','张掖市','甘肃省','2','734000','0936','','','zhangyeshi','ZYS','0');
INSERT INTO `tk_cities` VALUES('620800','620000','平凉市','甘肃省-平凉市','','平凉市','甘肃省','2','744000','0933','','','pingliangshi','PLS','0');
INSERT INTO `tk_cities` VALUES('620900','620000','酒泉市','甘肃省-酒泉市','','酒泉市','甘肃省','2','735000','0937','','','jiuquanshi','JQS','0');
INSERT INTO `tk_cities` VALUES('621000','620000','庆阳市','甘肃省-庆阳市','','庆阳市','甘肃省','2','745000','0934','','','qingyangshi','QYS','0');
INSERT INTO `tk_cities` VALUES('621100','620000','定西市','甘肃省-定西市','','定西市','甘肃省','2','743000','0932','','','dingxishi','DXS','0');
INSERT INTO `tk_cities` VALUES('621200','620000','陇南市','甘肃省-陇南市','','陇南市','甘肃省','2','746000','0935','','','longnanshi','LNS','0');
INSERT INTO `tk_cities` VALUES('622900','620000','临夏回族自治州 ','甘肃省-临夏回族自治州 ','','临夏回族自治州 ','甘肃省','2','731100','0930','','','linxiahuizuzizhizhou','LXHZZZZ','0');
INSERT INTO `tk_cities` VALUES('623000','620000','甘南藏族自治州 ','甘肃省-甘南藏族自治州 ','','甘南藏族自治州 ','甘肃省','2','747000','0941','','','gannancangzuzizhizhou','GNCZZZZ','0');
INSERT INTO `tk_cities` VALUES('620102','620100','城关区','甘肃省-兰州市-城关区','城关区','兰州市','甘肃省','3','730030','0931','','','chengguanqu','CGQ','0');
INSERT INTO `tk_cities` VALUES('620103','620100','七里河区','甘肃省-兰州市-七里河区','七里河区','兰州市','甘肃省','3','730050','0931','','','qilihequ','QLHQ','0');
INSERT INTO `tk_cities` VALUES('620104','620100','西固区','甘肃省-兰州市-西固区','西固区','兰州市','甘肃省','3','730060','0931','','','xiguqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('620105','620100','安宁区','甘肃省-兰州市-安宁区','安宁区','兰州市','甘肃省','3','730070','0931','','','anningqu','ANQ','0');
INSERT INTO `tk_cities` VALUES('620111','620100','红古区','甘肃省-兰州市-红古区','红古区','兰州市','甘肃省','3','730080','0931','','','hongguqu','HGQ','0');
INSERT INTO `tk_cities` VALUES('620121','620100','永登县','甘肃省-兰州市-永登县','永登县','兰州市','甘肃省','3','730300','0931','','','yongdengxian','YDX','0');
INSERT INTO `tk_cities` VALUES('620122','620100','皋兰县','甘肃省-兰州市-皋兰县','皋兰县','兰州市','甘肃省','3','730200','0931','','','gaolanxian','GLX','0');
INSERT INTO `tk_cities` VALUES('620123','620100','榆中县','甘肃省-兰州市-榆中县','榆中县','兰州市','甘肃省','3','730100','0931','','','yuzhongxian','YZX','0');
INSERT INTO `tk_cities` VALUES('620201','620200','嘉峪关市','甘肃省-嘉峪关市-嘉峪关市','嘉峪关市','嘉峪关市','甘肃省','3','737100','0935','','','jiayuguanshi','JYGS','0');
INSERT INTO `tk_cities` VALUES('620302','620300','金川区','甘肃省-金昌市-金川区','金川区','金昌市','甘肃省','3','737100','0935','','','jinchuanqu','JCQ','0');
INSERT INTO `tk_cities` VALUES('620321','620300','永昌县','甘肃省-金昌市-永昌县','永昌县','金昌市','甘肃省','3','737200','0935','','','yongchangxian','YCX','0');
INSERT INTO `tk_cities` VALUES('620402','620400','白银区','甘肃省-白银市-白银区','白银区','白银市','甘肃省','3','730900','0943','','','baiyinqu','BYQ','0');
INSERT INTO `tk_cities` VALUES('620403','620400','平川区','甘肃省-白银市-平川区','平川区','白银市','甘肃省','3','730900','0943','','','pingchuanqu','PCQ','0');
INSERT INTO `tk_cities` VALUES('620421','620400','靖远县','甘肃省-白银市-靖远县','靖远县','白银市','甘肃省','3','730600','0943','','','jingyuanxian','JYX','0');
INSERT INTO `tk_cities` VALUES('620422','620400','会宁县','甘肃省-白银市-会宁县','会宁县','白银市','甘肃省','3','730700','0943','','','huiningxian','HNX','0');
INSERT INTO `tk_cities` VALUES('620423','620400','景泰县','甘肃省-白银市-景泰县','景泰县','白银市','甘肃省','3','730400','0943','','','jingtaixian','JTX','0');
INSERT INTO `tk_cities` VALUES('620502','620500','秦州区','甘肃省-天水市-秦州区','秦州区','天水市','甘肃省','3','741000','0938','','','qinzhouqu','QZQ','0');
INSERT INTO `tk_cities` VALUES('620503','620500','麦积区','甘肃省-天水市-麦积区','麦积区','天水市','甘肃省','3','741000','0938','','','maijiqu','MJQ','0');
INSERT INTO `tk_cities` VALUES('620521','620500','清水县','甘肃省-天水市-清水县','清水县','天水市','甘肃省','3','741400','0938','','','qingshuixian','QSX','0');
INSERT INTO `tk_cities` VALUES('620522','620500','秦安县','甘肃省-天水市-秦安县','秦安县','天水市','甘肃省','3','741600','0938','','','qinanxian','QAX','0');
INSERT INTO `tk_cities` VALUES('620523','620500','甘谷县','甘肃省-天水市-甘谷县','甘谷县','天水市','甘肃省','3','741200','0938','','','ganguxian','GGX','0');
INSERT INTO `tk_cities` VALUES('620524','620500','武山县','甘肃省-天水市-武山县','武山县','天水市','甘肃省','3','741300','0938','','','wushanxian','WSX','0');
INSERT INTO `tk_cities` VALUES('620525','620500','张家川回族自治县','甘肃省-天水市-张家川回族自治县','张家川回族自治县','天水市','甘肃省','3','733000','0935','','','zhangjiachuanhuizuzizhixian','ZJCHZZZX','0');
INSERT INTO `tk_cities` VALUES('620602','620600','凉州区','甘肃省-武威市-凉州区','凉州区','武威市','甘肃省','3','733000','0935','','','liangzhouqu','LZQ','0');
INSERT INTO `tk_cities` VALUES('620621','620600','民勤县','甘肃省-武威市-民勤县','民勤县','武威市','甘肃省','3','733300','0935','','','minqinxian','MQX','0');
INSERT INTO `tk_cities` VALUES('620622','620600','古浪县','甘肃省-武威市-古浪县','古浪县','武威市','甘肃省','3','733100','0935','','','gulangxian','GLX','0');
INSERT INTO `tk_cities` VALUES('620623','620600','天祝藏族自治县','甘肃省-武威市-天祝藏族自治县','天祝藏族自治县','武威市','甘肃省','3','733200','0935','','','tianzhucangzuzizhixian','TZCZZZX','0');
INSERT INTO `tk_cities` VALUES('620702','620700','甘州区','甘肃省-张掖市-甘州区','甘州区','张掖市','甘肃省','3','734000','0936','','','ganzhouqu','GZQ','0');
INSERT INTO `tk_cities` VALUES('620721','620700','肃南裕固族自治县','甘肃省-张掖市-肃南裕固族自治县','肃南裕固族自治县','张掖市','甘肃省','3','734400','0936','','','sunanyuguzuzizhixian','SNYGZZZX','0');
INSERT INTO `tk_cities` VALUES('620722','620700','民乐县','甘肃省-张掖市-民乐县','民乐县','张掖市','甘肃省','3','734500','0936','','','minlexian','MLX','0');
INSERT INTO `tk_cities` VALUES('620723','620700','临泽县','甘肃省-张掖市-临泽县','临泽县','张掖市','甘肃省','3','734200','0936','','','linzexian','LZX','0');
INSERT INTO `tk_cities` VALUES('620724','620700','高台县','甘肃省-张掖市-高台县','高台县','张掖市','甘肃省','3','734300','0936','','','gaotaixian','GTX','0');
INSERT INTO `tk_cities` VALUES('620725','620700','山丹县','甘肃省-张掖市-山丹县','山丹县','张掖市','甘肃省','3','734100','0936','','','shandanxian','SDX','0');
INSERT INTO `tk_cities` VALUES('620802','620800','崆峒区','甘肃省-平凉市-崆峒区','崆峒区','平凉市','甘肃省','3','744000','0933','','','qu','Q','0');
INSERT INTO `tk_cities` VALUES('620821','620800','泾川县','甘肃省-平凉市-泾川县','泾川县','平凉市','甘肃省','3','744300','0933','','','chuanxian','CX','0');
INSERT INTO `tk_cities` VALUES('620822','620800','灵台县','甘肃省-平凉市-灵台县','灵台县','平凉市','甘肃省','3','744400','0933','','','lingtaixian','LTX','0');
INSERT INTO `tk_cities` VALUES('620823','620800','崇信县','甘肃省-平凉市-崇信县','崇信县','平凉市','甘肃省','3','744200','0933','','','chongxinxian','CXX','0');
INSERT INTO `tk_cities` VALUES('620824','620800','华亭县','甘肃省-平凉市-华亭县','华亭县','平凉市','甘肃省','3','744100','0933','','','huatingxian','HTX','0');
INSERT INTO `tk_cities` VALUES('620825','620800','庄浪县','甘肃省-平凉市-庄浪县','庄浪县','平凉市','甘肃省','3','744600','0933','','','zhuanglangxian','ZLX','0');
INSERT INTO `tk_cities` VALUES('620826','620800','静宁县','甘肃省-平凉市-静宁县','静宁县','平凉市','甘肃省','3','743400','0933','','','jingningxian','JNX','0');
INSERT INTO `tk_cities` VALUES('620902','620900','肃州区','甘肃省-酒泉市-肃州区','肃州区','酒泉市','甘肃省','3','735000','0937','','','suzhouqu','SZQ','0');
INSERT INTO `tk_cities` VALUES('620921','620900','金塔县','甘肃省-酒泉市-金塔县','金塔县','酒泉市','甘肃省','3','735300','0937','','','jintaxian','JTX','0');
INSERT INTO `tk_cities` VALUES('620922','620900','瓜州县','甘肃省-酒泉市-瓜州县','瓜州县','酒泉市','甘肃省','3','736100','0937','','','guazhouxian','GZX','0');
INSERT INTO `tk_cities` VALUES('620923','620900','肃北蒙古族自治县','甘肃省-酒泉市-肃北蒙古族自治县','肃北蒙古族自治县','酒泉市','甘肃省','3','736300','0937','','','subeimengguzuzizhixian','SBMGZZZX','0');
INSERT INTO `tk_cities` VALUES('620924','620900','阿克塞哈萨克族自治县','甘肃省-酒泉市-阿克塞哈萨克族自治县','阿克塞哈萨克族自治县','酒泉市','甘肃省','3','736400','0937','','','akesaihasakezuzizhixian','AKSHSKZZZX','0');
INSERT INTO `tk_cities` VALUES('620981','620900','玉门市','甘肃省-酒泉市-玉门市','玉门市','酒泉市','甘肃省','3','735200','0937','','','yumenshi','YMS','0');
INSERT INTO `tk_cities` VALUES('620982','620900','敦煌市','甘肃省-酒泉市-敦煌市','敦煌市','酒泉市','甘肃省','3','736200','0937','','','dunhuangshi','DHS','0');
INSERT INTO `tk_cities` VALUES('621002','621000','西峰区','甘肃省-庆阳市-西峰区','西峰区','庆阳市','甘肃省','3','745000','0934','','','xifengqu','XFQ','0');
INSERT INTO `tk_cities` VALUES('621021','621000','庆城县','甘肃省-庆阳市-庆城县','庆城县','庆阳市','甘肃省','3','745000','0934','','','qingchengxian','QCX','0');
INSERT INTO `tk_cities` VALUES('621022','621000','环县','甘肃省-庆阳市-环县','环县','庆阳市','甘肃省','3','745700','0934','','','huanxian','HX','0');
INSERT INTO `tk_cities` VALUES('621023','621000','华池县','甘肃省-庆阳市-华池县','华池县','庆阳市','甘肃省','3','745600','0934','','','huachixian','HCX','0');
INSERT INTO `tk_cities` VALUES('621024','621000','合水县','甘肃省-庆阳市-合水县','合水县','庆阳市','甘肃省','3','745400','0934','','','heshuixian','HSX','0');
INSERT INTO `tk_cities` VALUES('621025','621000','正宁县','甘肃省-庆阳市-正宁县','正宁县','庆阳市','甘肃省','3','745300','0934','','','zhengningxian','ZNX','0');
INSERT INTO `tk_cities` VALUES('621026','621000','宁县','甘肃省-庆阳市-宁县','宁县','庆阳市','甘肃省','3','745200','0934','','','ningxian','NX','0');
INSERT INTO `tk_cities` VALUES('621027','621000','镇原县','甘肃省-庆阳市-镇原县','镇原县','庆阳市','甘肃省','3','744500','0934','','','zhenyuanxian','ZYX','0');
INSERT INTO `tk_cities` VALUES('621102','621100','安定区','甘肃省-定西市-安定区','安定区','定西市','甘肃省','3','743000','0932','','','andingqu','ADQ','0');
INSERT INTO `tk_cities` VALUES('621121','621100','通渭县','甘肃省-定西市-通渭县','通渭县','定西市','甘肃省','3','743300','0932','','','tongweixian','TWX','0');
INSERT INTO `tk_cities` VALUES('621122','621100','陇西县','甘肃省-定西市-陇西县','陇西县','定西市','甘肃省','3','748100','0932','','','longxixian','LXX','0');
INSERT INTO `tk_cities` VALUES('621123','621100','渭源县','甘肃省-定西市-渭源县','渭源县','定西市','甘肃省','3','748200','0932','','','weiyuanxian','WYX','0');
INSERT INTO `tk_cities` VALUES('621124','621100','临洮县','甘肃省-定西市-临洮县','临洮县','定西市','甘肃省','3','730500','0932','','','linxian','LX','0');
INSERT INTO `tk_cities` VALUES('621125','621100','漳县','甘肃省-定西市-漳县','漳县','定西市','甘肃省','3','748300','0932','','','zhangxian','ZX','0');
INSERT INTO `tk_cities` VALUES('621126','621100','岷县','甘肃省-定西市-岷县','岷县','定西市','甘肃省','3','748400','0932','','','xian','X','0');
INSERT INTO `tk_cities` VALUES('621202','621200','武都区','甘肃省-陇南市-武都区','武都区','陇南市','甘肃省','3','746000','0935','','','wuduqu','WDQ','0');
INSERT INTO `tk_cities` VALUES('621221','621200','成县','甘肃省-陇南市-成县','成县','陇南市','甘肃省','3','742500','0935','','','chengxian','CX','0');
INSERT INTO `tk_cities` VALUES('621222','621200','文县','甘肃省-陇南市-文县','文县','陇南市','甘肃省','3','746400','0935','','','wenxian','WX','0');
INSERT INTO `tk_cities` VALUES('621223','621200','宕昌县','甘肃省-陇南市-宕昌县','宕昌县','陇南市','甘肃省','3','748500','0935','','','changxian','CX','0');
INSERT INTO `tk_cities` VALUES('621224','621200','康县','甘肃省-陇南市-康县','康县','陇南市','甘肃省','3','746500','0935','','','kangxian','KX','0');
INSERT INTO `tk_cities` VALUES('621225','621200','西和县','甘肃省-陇南市-西和县','西和县','陇南市','甘肃省','3','742100','0935','','','xihexian','XHX','0');
INSERT INTO `tk_cities` VALUES('621226','621200','礼县','甘肃省-陇南市-礼县','礼县','陇南市','甘肃省','3','742200','0935','','','lixian','LX','0');
INSERT INTO `tk_cities` VALUES('621227','621200','徽县','甘肃省-陇南市-徽县','徽县','陇南市','甘肃省','3','742300','0935','','','huixian','HX','0');
INSERT INTO `tk_cities` VALUES('621228','621200','两当县','甘肃省-陇南市-两当县','两当县','陇南市','甘肃省','3','742400','0935','','','liangdangxian','LDX','0');
INSERT INTO `tk_cities` VALUES('622901','622900','临夏市','甘肃省-临夏回族自治州 -临夏市','临夏市','临夏回族自治州 ','甘肃省','3','731100','0930','','','linxiashi','LXS','0');
INSERT INTO `tk_cities` VALUES('622921','622900','临夏县','甘肃省-临夏回族自治州 -临夏县','临夏县','临夏回族自治州 ','甘肃省','3','731800','0930','','','linxiaxian','LXX','0');
INSERT INTO `tk_cities` VALUES('622922','622900','康乐县','甘肃省-临夏回族自治州 -康乐县','康乐县','临夏回族自治州 ','甘肃省','3','731500','0930','','','kanglexian','KLX','0');
INSERT INTO `tk_cities` VALUES('622923','622900','永靖县','甘肃省-临夏回族自治州 -永靖县','永靖县','临夏回族自治州 ','甘肃省','3','731600','0930','','','yongjingxian','YJX','0');
INSERT INTO `tk_cities` VALUES('622924','622900','广河县','甘肃省-临夏回族自治州 -广河县','广河县','临夏回族自治州 ','甘肃省','3','731300','0930','','','guanghexian','GHX','0');
INSERT INTO `tk_cities` VALUES('622925','622900','和政县','甘肃省-临夏回族自治州 -和政县','和政县','临夏回族自治州 ','甘肃省','3','731200','0930','','','hezhengxian','HZX','0');
INSERT INTO `tk_cities` VALUES('622926','622900','东乡族自治县','甘肃省-临夏回族自治州 -东乡族自治县','东乡族自治县','临夏回族自治州 ','甘肃省','3','731400','0930','','','dongxiangzuzizhixian','DXZZZX','0');
INSERT INTO `tk_cities` VALUES('622927','622900','积石山保安族东乡族撒拉族自治县','甘肃省-临夏回族自治州 -积石山保安族东乡族撒拉族自治县','积石山保安族东乡族撒拉族自治县','临夏回族自治州 ','甘肃省','3','731700','0930','','','jishishanbaoanzudongxiangzusalazuzizhixian','JSSBAZDXZSLZZZX','0');
INSERT INTO `tk_cities` VALUES('623001','623000','合作市','甘肃省-甘南藏族自治州 -合作市','合作市','甘南藏族自治州 ','甘肃省','3','747000','0941','','','hezuoshi','HZS','0');
INSERT INTO `tk_cities` VALUES('623021','623000','临潭县','甘肃省-甘南藏族自治州 -临潭县','临潭县','甘南藏族自治州 ','甘肃省','3','747500','0941','','','lintanxian','LTX','0');
INSERT INTO `tk_cities` VALUES('623022','623000','卓尼县','甘肃省-甘南藏族自治州 -卓尼县','卓尼县','甘南藏族自治州 ','甘肃省','3','747600','0941','','','zhuonixian','ZNX','0');
INSERT INTO `tk_cities` VALUES('623023','623000','舟曲县','甘肃省-甘南藏族自治州 -舟曲县','舟曲县','甘南藏族自治州 ','甘肃省','3','746300','0941','','','zhouquxian','ZQX','0');
INSERT INTO `tk_cities` VALUES('623024','623000','迭部县','甘肃省-甘南藏族自治州 -迭部县','迭部县','甘南藏族自治州 ','甘肃省','3','747400','0941','','','diebuxian','DBX','0');
INSERT INTO `tk_cities` VALUES('623025','623000','玛曲县','甘肃省-甘南藏族自治州 -玛曲县','玛曲县','甘南藏族自治州 ','甘肃省','3','747300','0941','','','maquxian','MQX','0');
INSERT INTO `tk_cities` VALUES('623026','623000','碌曲县','甘肃省-甘南藏族自治州 -碌曲县','碌曲县','甘南藏族自治州 ','甘肃省','3','747200','0941','','','luquxian','LQX','0');
INSERT INTO `tk_cities` VALUES('623027','623000','夏河县','甘肃省-甘南藏族自治州 -夏河县','夏河县','甘南藏族自治州 ','甘肃省','3','747100','0941','','','xiahexian','XHX','0');
INSERT INTO `tk_cities` VALUES('630000','0','青海省','青海省','','','青海省','1','','','','','qinghaisheng','QHS','0');
INSERT INTO `tk_cities` VALUES('630100','630000','西宁市','青海省-西宁市','','西宁市','青海省','2','810000','0971','','','xiningshi','XNS','0');
INSERT INTO `tk_cities` VALUES('632100','630000','海东地区','青海省-海东地区','','海东地区','青海省','2','810600','0972','','','haidongdiqu','HDDQ','0');
INSERT INTO `tk_cities` VALUES('632200','630000','海北藏族自治州 ','青海省-海北藏族自治州 ','','海北藏族自治州 ','青海省','2','810300','0978','','','haibeicangzuzizhizhou','HBCZZZZ','0');
INSERT INTO `tk_cities` VALUES('632300','630000','黄南藏族自治州 ','青海省-黄南藏族自治州 ','','黄南藏族自治州 ','青海省','2','811300','0973','','','huangnancangzuzizhizhou','HNCZZZZ','0');
INSERT INTO `tk_cities` VALUES('632500','630000','海南藏族自治州 ','青海省-海南藏族自治州 ','','海南藏族自治州 ','青海省','2','813000','0974','','','hainancangzuzizhizhou','HNCZZZZ','0');
INSERT INTO `tk_cities` VALUES('632600','630000','果洛藏族自治州 ','青海省-果洛藏族自治州 ','','果洛藏族自治州 ','青海省','2','814000','0975','','','guoluocangzuzizhizhou','GLCZZZZ','0');
INSERT INTO `tk_cities` VALUES('632700','630000','玉树藏族自治州 ','青海省-玉树藏族自治州 ','','玉树藏族自治州 ','青海省','2','815000','0976','','','yushucangzuzizhizhou','YSCZZZZ','0');
INSERT INTO `tk_cities` VALUES('632800','630000','海西蒙古族藏族自治州 ','青海省-海西蒙古族藏族自治州 ','','海西蒙古族藏族自治州 ','青海省','2','816000','0977','','','haiximengguzucangzuzizhizhou','HXMGZCZZZZ','0');
INSERT INTO `tk_cities` VALUES('630102','630100','城东区','青海省-西宁市-城东区','城东区','西宁市','青海省','3','810000','0971','','','chengdongqu','CDQ','0');
INSERT INTO `tk_cities` VALUES('630103','630100','城中区','青海省-西宁市-城中区','城中区','西宁市','青海省','3','810000','0971','','','chengzhongqu','CZQ','0');
INSERT INTO `tk_cities` VALUES('630104','630100','城西区','青海省-西宁市-城西区','城西区','西宁市','青海省','3','810000','0971','','','chengxiqu','CXQ','0');
INSERT INTO `tk_cities` VALUES('630105','630100','城北区','青海省-西宁市-城北区','城北区','西宁市','青海省','3','810000','0971','','','chengbeiqu','CBQ','0');
INSERT INTO `tk_cities` VALUES('630121','630100','大通回族土族自治县','青海省-西宁市-大通回族土族自治县','大通回族土族自治县','西宁市','青海省','3','810100','0971','','','datonghuizutuzuzizhixian','DTHZTZZZX','0');
INSERT INTO `tk_cities` VALUES('630122','630100','湟中县','青海省-西宁市-湟中县','湟中县','西宁市','青海省','3','811600','0972','','','zhongxian','ZX','0');
INSERT INTO `tk_cities` VALUES('630123','630100','湟源县','青海省-西宁市-湟源县','湟源县','西宁市','青海省','3','812100','0972','','','yuanxian','YX','0');
INSERT INTO `tk_cities` VALUES('632121','632100','平安县','青海省-海东地区-平安县','平安县','海东地区','青海省','3','810600','0972','','','pinganxian','PAX','0');
INSERT INTO `tk_cities` VALUES('632122','632100','民和回族土族自治县','青海省-海东地区-民和回族土族自治县','民和回族土族自治县','海东地区','青海省','3','810800','0972','','','minhehuizutuzuzizhixian','MHHZTZZZX','0');
INSERT INTO `tk_cities` VALUES('632123','632100','乐都县','青海省-海东地区-乐都县','乐都县','海东地区','青海省','3','810700','0972','','','leduxian','LDX','0');
INSERT INTO `tk_cities` VALUES('632126','632100','互助土族自治县','青海省-海东地区-互助土族自治县','互助土族自治县','海东地区','青海省','3','810500','0972','','','huzhutuzuzizhixian','HZTZZZX','0');
INSERT INTO `tk_cities` VALUES('632127','632100','化隆回族自治县','青海省-海东地区-化隆回族自治县','化隆回族自治县','海东地区','青海省','3','810900','0972','','','hualonghuizuzizhixian','HLHZZZX','0');
INSERT INTO `tk_cities` VALUES('632128','632100','循化撒拉族自治县','青海省-海东地区-循化撒拉族自治县','循化撒拉族自治县','海东地区','青海省','3','811100','0972','','','xunhuasalazuzizhixian','XHSLZZZX','0');
INSERT INTO `tk_cities` VALUES('632221','632200','门源回族自治县','青海省-海北藏族自治州 -门源回族自治县','门源回族自治县','海北藏族自治州 ','青海省','3','810300','0978','','','menyuanhuizuzizhixian','MYHZZZX','0');
INSERT INTO `tk_cities` VALUES('632222','632200','祁连县','青海省-海北藏族自治州 -祁连县','祁连县','海北藏族自治州 ','青海省','3','810400','0970','','','qilianxian','QLX','0');
INSERT INTO `tk_cities` VALUES('632223','632200','海晏县','青海省-海北藏族自治州 -海晏县','海晏县','海北藏族自治州 ','青海省','3','812200','0970','','','haixian','HX','0');
INSERT INTO `tk_cities` VALUES('632224','632200','刚察县','青海省-海北藏族自治州 -刚察县','刚察县','海北藏族自治州 ','青海省','3','812300','0970','','','gangchaxian','GCX','0');
INSERT INTO `tk_cities` VALUES('632321','632300','同仁县','青海省-黄南藏族自治州 -同仁县','同仁县','黄南藏族自治州 ','青海省','3','811300','0973','','','tongrenxian','TRX','0');
INSERT INTO `tk_cities` VALUES('632322','632300','尖扎县','青海省-黄南藏族自治州 -尖扎县','尖扎县','黄南藏族自治州 ','青海省','3','811200','0973','','','jianzhaxian','JZX','0');
INSERT INTO `tk_cities` VALUES('632323','632300','泽库县','青海省-黄南藏族自治州 -泽库县','泽库县','黄南藏族自治州 ','青海省','3','811400','0973','','','zekuxian','ZKX','0');
INSERT INTO `tk_cities` VALUES('632324','632300','河南蒙古族自治县','青海省-黄南藏族自治州 -河南蒙古族自治县','河南蒙古族自治县','黄南藏族自治州 ','青海省','3','811500','0973','','','henanmengguzuzizhixian','HNMGZZZX','0');
INSERT INTO `tk_cities` VALUES('632521','632500','共和县','青海省-海南藏族自治州 -共和县','共和县','海南藏族自治州 ','青海省','3','813000','0974','','','gonghexian','GHX','0');
INSERT INTO `tk_cities` VALUES('632522','632500','同德县','青海省-海南藏族自治州 -同德县','同德县','海南藏族自治州 ','青海省','3','813200','0974','','','tongdexian','TDX','0');
INSERT INTO `tk_cities` VALUES('632523','632500','贵德县','青海省-海南藏族自治州 -贵德县','贵德县','海南藏族自治州 ','青海省','3','811700','0974','','','guidexian','GDX','0');
INSERT INTO `tk_cities` VALUES('632524','632500','兴海县','青海省-海南藏族自治州 -兴海县','兴海县','海南藏族自治州 ','青海省','3','813300','0974','','','xinghaixian','XHX','0');
INSERT INTO `tk_cities` VALUES('632525','632500','贵南县','青海省-海南藏族自治州 -贵南县','贵南县','海南藏族自治州 ','青海省','3','813100','0974','','','guinanxian','GNX','0');
INSERT INTO `tk_cities` VALUES('632621','632600','玛沁县','青海省-果洛藏族自治州 -玛沁县','玛沁县','果洛藏族自治州 ','青海省','3','814000','0975','','','maqinxian','MQX','0');
INSERT INTO `tk_cities` VALUES('632622','632600','班玛县','青海省-果洛藏族自治州 -班玛县','班玛县','果洛藏族自治州 ','青海省','3','814300','0975','','','banmaxian','BMX','0');
INSERT INTO `tk_cities` VALUES('632623','632600','甘德县','青海省-果洛藏族自治州 -甘德县','甘德县','果洛藏族自治州 ','青海省','3','814100','0975','','','gandexian','GDX','0');
INSERT INTO `tk_cities` VALUES('632624','632600','达日县','青海省-果洛藏族自治州 -达日县','达日县','果洛藏族自治州 ','青海省','3','814200','0975','','','darixian','DRX','0');
INSERT INTO `tk_cities` VALUES('632625','632600','久治县','青海省-果洛藏族自治州 -久治县','久治县','果洛藏族自治州 ','青海省','3','624700','0975','','','jiuzhixian','JZX','0');
INSERT INTO `tk_cities` VALUES('632626','632600','玛多县','青海省-果洛藏族自治州 -玛多县','玛多县','果洛藏族自治州 ','青海省','3','813500','0975','','','maduoxian','MDX','0');
INSERT INTO `tk_cities` VALUES('632721','632700','玉树县','青海省-玉树藏族自治州 -玉树县','玉树县','玉树藏族自治州 ','青海省','3','815000','0976','','','yushuxian','YSX','0');
INSERT INTO `tk_cities` VALUES('632722','632700','杂多县','青海省-玉树藏族自治州 -杂多县','杂多县','玉树藏族自治州 ','青海省','3','815300','0976','','','zaduoxian','ZDX','0');
INSERT INTO `tk_cities` VALUES('632723','632700','称多县','青海省-玉树藏族自治州 -称多县','称多县','玉树藏族自治州 ','青海省','3','815100','0976','','','chengduoxian','CDX','0');
INSERT INTO `tk_cities` VALUES('632724','632700','治多县','青海省-玉树藏族自治州 -治多县','治多县','玉树藏族自治州 ','青海省','3','815400','0976','','','zhiduoxian','ZDX','0');
INSERT INTO `tk_cities` VALUES('632725','632700','囊谦县','青海省-玉树藏族自治州 -囊谦县','囊谦县','玉树藏族自治州 ','青海省','3','815200','0976','','','nangqianxian','NQX','0');
INSERT INTO `tk_cities` VALUES('632726','632700','曲麻莱县','青海省-玉树藏族自治州 -曲麻莱县','曲麻莱县','玉树藏族自治州 ','青海省','3','815500','0976','','','qumalaixian','QMLX','0');
INSERT INTO `tk_cities` VALUES('632801','632800','格尔木市','青海省-海西蒙古族藏族自治州 -格尔木市','格尔木市','海西蒙古族藏族自治州 ','青海省','3','816000','0977','','','geermushi','GEMS','0');
INSERT INTO `tk_cities` VALUES('632802','632800','德令哈市','青海省-海西蒙古族藏族自治州 -德令哈市','德令哈市','海西蒙古族藏族自治州 ','青海省','3','817000','0977','','','delinghashi','DLHS','0');
INSERT INTO `tk_cities` VALUES('632821','632800','乌兰县','青海省-海西蒙古族藏族自治州 -乌兰县','乌兰县','海西蒙古族藏族自治州 ','青海省','3','817100','0977','','','wulanxian','WLX','0');
INSERT INTO `tk_cities` VALUES('632822','632800','都兰县','青海省-海西蒙古族藏族自治州 -都兰县','都兰县','海西蒙古族藏族自治州 ','青海省','3','816100','0977','','','dulanxian','DLX','0');
INSERT INTO `tk_cities` VALUES('632823','632800','天峻县','青海省-海西蒙古族藏族自治州 -天峻县','天峻县','海西蒙古族藏族自治州 ','青海省','3','817200','0977','','','tianjunxian','TJX','0');
INSERT INTO `tk_cities` VALUES('640000','0','宁夏回族自治区','宁夏回族自治区','','','宁夏回族自治区','1','','','','','ningxiahuizuzizhiqu','NXHZZZQ','0');
INSERT INTO `tk_cities` VALUES('640100','640100','银川市','宁夏回族自治区-银川市','','银川市','宁夏回族自治区','2','750000','0951','','','yinchuanshi','YCS','0');
INSERT INTO `tk_cities` VALUES('640200','640200','石嘴山市','宁夏回族自治区-石嘴山市','','石嘴山市','宁夏回族自治区','2','753000','0952','','','shizuishanshi','SZSS','0');
INSERT INTO `tk_cities` VALUES('640300','640300','吴忠市','宁夏回族自治区-吴忠市','','吴忠市','宁夏回族自治区','2','751100','0953','','','wuzhongshi','WZS','0');
INSERT INTO `tk_cities` VALUES('640400','640400','固原市','宁夏回族自治区-固原市','','固原市','宁夏回族自治区','2','756000','0954','','','guyuanshi','GYS','0');
INSERT INTO `tk_cities` VALUES('640500','640500','中卫市','宁夏回族自治区-中卫市','','中卫市','宁夏回族自治区','2','755000','0955','','','zhongweishi','ZWS','0');
INSERT INTO `tk_cities` VALUES('640104','640100','兴庆区','宁夏回族自治区-银川市-兴庆区','兴庆区','银川市','宁夏回族自治区','3','750000','0951','','','xingqingqu','XQQ','0');
INSERT INTO `tk_cities` VALUES('640105','640100','西夏区','宁夏回族自治区-银川市-西夏区','西夏区','银川市','宁夏回族自治区','3','750000','0951','','','xixiaqu','XXQ','0');
INSERT INTO `tk_cities` VALUES('640106','640100','金凤区','宁夏回族自治区-银川市-金凤区','金凤区','银川市','宁夏回族自治区','3','750000','0951','','','jinfengqu','JFQ','0');
INSERT INTO `tk_cities` VALUES('640121','640100','永宁县','宁夏回族自治区-银川市-永宁县','永宁县','银川市','宁夏回族自治区','3','750100','0951','','','yongningxian','YNX','0');
INSERT INTO `tk_cities` VALUES('640122','640100','贺兰县','宁夏回族自治区-银川市-贺兰县','贺兰县','银川市','宁夏回族自治区','3','750200','0951','','','helanxian','HLX','0');
INSERT INTO `tk_cities` VALUES('640181','640000','灵武市','宁夏回族自治区-银川市-灵武市','灵武市','银川市','宁夏回族自治区','3','751400','0951','','','lingwushi','LWS','0');
INSERT INTO `tk_cities` VALUES('640202','640200','大武口区','宁夏回族自治区-石嘴山市-大武口区','大武口区','石嘴山市','宁夏回族自治区','3','753000','0952','','','dawukouqu','DWKQ','0');
INSERT INTO `tk_cities` VALUES('640205','640200','惠农区','宁夏回族自治区-石嘴山市-惠农区','惠农区','石嘴山市','宁夏回族自治区','3','753600','0952','','','huinongqu','HNQ','0');
INSERT INTO `tk_cities` VALUES('640221','640000','平罗县','宁夏回族自治区-石嘴山市-平罗县','平罗县','石嘴山市','宁夏回族自治区','3','753400','0952','','','pingluoxian','PLX','0');
INSERT INTO `tk_cities` VALUES('640302','640300','利通区','宁夏回族自治区-吴忠市-利通区','利通区','吴忠市','宁夏回族自治区','3','751100','0953','','','litongqu','LTQ','0');
INSERT INTO `tk_cities` VALUES('640303','','红寺堡区','宁夏回族自治区-吴忠市-红寺堡区','红寺堡区','吴忠市','宁夏回族自治区','3','','','','','hongsibaoqu','HSBQ','0');
INSERT INTO `tk_cities` VALUES('640323','640300','盐池县','宁夏回族自治区-吴忠市-盐池县','盐池县','吴忠市','宁夏回族自治区','3','751500','0953','','','yanchixian','YCX','0');
INSERT INTO `tk_cities` VALUES('640324','640300','同心县','宁夏回族自治区-吴忠市-同心县','同心县','吴忠市','宁夏回族自治区','3','751300','0953','','','tongxinxian','TXX','0');
INSERT INTO `tk_cities` VALUES('640381','640000','青铜峡市','宁夏回族自治区-吴忠市-青铜峡市','青铜峡市','吴忠市','宁夏回族自治区','3','751600','0953','','','qingtongxiashi','QTXS','0');
INSERT INTO `tk_cities` VALUES('640402','640400','原州区','宁夏回族自治区-固原市-原州区','原州区','固原市','宁夏回族自治区','3','756000','0954','','','yuanzhouqu','YZQ','0');
INSERT INTO `tk_cities` VALUES('640422','640400','西吉县','宁夏回族自治区-固原市-西吉县','西吉县','固原市','宁夏回族自治区','3','756200','0954','','','xijixian','XJX','0');
INSERT INTO `tk_cities` VALUES('640423','640400','隆德县','宁夏回族自治区-固原市-隆德县','隆德县','固原市','宁夏回族自治区','3','756300','0954','','','longdexian','LDX','0');
INSERT INTO `tk_cities` VALUES('640424','640400','泾源县','宁夏回族自治区-固原市-泾源县','泾源县','固原市','宁夏回族自治区','3','756400','0954','','','yuanxian','YX','0');
INSERT INTO `tk_cities` VALUES('640425','640000','彭阳县','宁夏回族自治区-固原市-彭阳县','彭阳县','固原市','宁夏回族自治区','3','756500','0954','','','pengyangxian','PYX','0');
INSERT INTO `tk_cities` VALUES('640502','640500','沙坡头区','宁夏回族自治区-中卫市-沙坡头区','沙坡头区','中卫市','宁夏回族自治区','3','751700','0953','','','shapotouqu','SPTQ','0');
INSERT INTO `tk_cities` VALUES('640521','640500','中宁县','宁夏回族自治区-中卫市-中宁县','中宁县','中卫市','宁夏回族自治区','3','751200','0953','','','zhongningxian','ZNX','0');
INSERT INTO `tk_cities` VALUES('640522','640500','海原县','宁夏回族自治区-中卫市-海原县','海原县','中卫市','宁夏回族自治区','3','751800','0954','','','haiyuanxian','HYX','0');
INSERT INTO `tk_cities` VALUES('650000','0','新疆维吾尔自治区','新疆维吾尔自治区','','','新疆维吾尔自治区','1','','','','','xinjiangweiwuerzizhiqu','XJWWEZZQ','0');
INSERT INTO `tk_cities` VALUES('650100','650000','乌鲁木齐市','新疆维吾尔自治区-乌鲁木齐市','','乌鲁木齐市','新疆维吾尔自治区','2','830000','0991','','','wulumuqishi','WLMQS','0');
INSERT INTO `tk_cities` VALUES('650200','650000','克拉玛依市','新疆维吾尔自治区-克拉玛依市','','克拉玛依市','新疆维吾尔自治区','2','834000','0990','','','kelamayishi','KLMYS','0');
INSERT INTO `tk_cities` VALUES('652100','650000','吐鲁番地区','新疆维吾尔自治区-吐鲁番地区','','吐鲁番地区','新疆维吾尔自治区','2','838000','0995','','','tulufandiqu','TLFDQ','0');
INSERT INTO `tk_cities` VALUES('652200','650000','哈密地区','新疆维吾尔自治区-哈密地区','','哈密地区','新疆维吾尔自治区','2','839000','0902','','','hamidiqu','HMDQ','0');
INSERT INTO `tk_cities` VALUES('652300','650000','昌吉回族自治州 ','新疆维吾尔自治区-昌吉回族自治州 ','','昌吉回族自治州 ','新疆维吾尔自治区','2','831100','0994','','','changjihuizuzizhizhou','CJHZZZZ','0');
INSERT INTO `tk_cities` VALUES('652700','650000','博尔塔拉蒙古自治州 ','新疆维吾尔自治区-博尔塔拉蒙古自治州 ','','博尔塔拉蒙古自治州 ','新疆维吾尔自治区','2','833400','0909','','','boertalamengguzizhizhou','BETLMGZZZ','0');
INSERT INTO `tk_cities` VALUES('652800','650000','巴音郭楞蒙古自治州 ','新疆维吾尔自治区-巴音郭楞蒙古自治州 ','','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','2','841000','0996','','','bayinguolengmengguzizhizhou','BYGLMGZZZ','0');
INSERT INTO `tk_cities` VALUES('652900','650000','阿克苏地区','新疆维吾尔自治区-阿克苏地区','','阿克苏地区','新疆维吾尔自治区','2','843000','0997','','','akesudiqu','AKSDQ','0');
INSERT INTO `tk_cities` VALUES('653000','650000','克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区-克孜勒苏柯尔克孜自治州 ','','克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区','2','845350','0908','','','kezilesukeerkezizizhizhou','KZLSKEKZZZZ','0');
INSERT INTO `tk_cities` VALUES('653100','650000','喀什地区','新疆维吾尔自治区-喀什地区','','喀什地区','新疆维吾尔自治区','2','844000','0998','','','kashidiqu','KSDQ','0');
INSERT INTO `tk_cities` VALUES('653200','650000','和田地区','新疆维吾尔自治区-和田地区','','和田地区','新疆维吾尔自治区','2','848000','0903','','','hetiandiqu','HTDQ','0');
INSERT INTO `tk_cities` VALUES('654000','650000','伊犁哈萨克自治州 ','新疆维吾尔自治区-伊犁哈萨克自治州 ','','伊犁哈萨克自治州 ','新疆维吾尔自治区','2','835000','0999','','','yilihasakezizhizhou','YLHSKZZZ','0');
INSERT INTO `tk_cities` VALUES('654200','650000','塔城地区','新疆维吾尔自治区-塔城地区','','塔城地区','新疆维吾尔自治区','2','834300','0901','','','tachengdiqu','TCDQ','0');
INSERT INTO `tk_cities` VALUES('654300','650000','阿勒泰地区','新疆维吾尔自治区-阿勒泰地区','','阿勒泰地区','新疆维吾尔自治区','2','836500','0906','','','aletaidiqu','ALTDQ','0');
INSERT INTO `tk_cities` VALUES('659000','650000','自治区直辖','新疆维吾尔自治区-自治区直辖','','自治区直辖','新疆维吾尔自治区','2','832000','0993','','','zizhiquzhixia','ZZQZX','0');
INSERT INTO `tk_cities` VALUES('650102','650100','天山区','新疆维吾尔自治区-乌鲁木齐市-天山区','天山区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','tianshanqu','TSQ','0');
INSERT INTO `tk_cities` VALUES('650103','650100','沙依巴克区','新疆维吾尔自治区-乌鲁木齐市-沙依巴克区','沙依巴克区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','shayibakequ','SYBKQ','0');
INSERT INTO `tk_cities` VALUES('650104','650100','新市区','新疆维吾尔自治区-乌鲁木齐市-新市区','新市区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','xinshiqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('650105','650100','水磨沟区','新疆维吾尔自治区-乌鲁木齐市-水磨沟区','水磨沟区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','shuimogouqu','SMGQ','0');
INSERT INTO `tk_cities` VALUES('650106','650100','头屯河区','新疆维吾尔自治区-乌鲁木齐市-头屯河区','头屯河区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','toutunhequ','TTHQ','0');
INSERT INTO `tk_cities` VALUES('650107','650100','达坂城区','新疆维吾尔自治区-乌鲁木齐市-达坂城区','达坂城区','乌鲁木齐市','新疆维吾尔自治区','3','830000','0992','','','dachengqu','DCQ','0');
INSERT INTO `tk_cities` VALUES('650109','650100','米东区','新疆维吾尔自治区-乌鲁木齐市-米东区','米东区','乌鲁木齐市','新疆维吾尔自治区','3','831400','0991','','','midongqu','MDQ','0');
INSERT INTO `tk_cities` VALUES('650121','650100','乌鲁木齐县','新疆维吾尔自治区-乌鲁木齐市-乌鲁木齐县','乌鲁木齐县','乌鲁木齐市','新疆维吾尔自治区','3','830000','0991','','','wulumuqixian','WLMQX','0');
INSERT INTO `tk_cities` VALUES('650202','650200','独山子区','新疆维吾尔自治区-克拉玛依市-独山子区','独山子区','克拉玛依市','新疆维吾尔自治区','3','838600','0990','','','dushanziqu','DSZQ','0');
INSERT INTO `tk_cities` VALUES('650203','650200','克拉玛依区','新疆维吾尔自治区-克拉玛依市-克拉玛依区','克拉玛依区','克拉玛依市','新疆维吾尔自治区','3','834000','0990','','','kelamayiqu','KLMYQ','0');
INSERT INTO `tk_cities` VALUES('650204','650200','白碱滩区','新疆维吾尔自治区-克拉玛依市-白碱滩区','白碱滩区','克拉玛依市','新疆维吾尔自治区','3','834000','0990','','','baijiantanqu','BJTQ','0');
INSERT INTO `tk_cities` VALUES('650205','650200','乌尔禾区','新疆维吾尔自治区-克拉玛依市-乌尔禾区','乌尔禾区','克拉玛依市','新疆维吾尔自治区','3','834000','0990','','','wuerhequ','WEHQ','0');
INSERT INTO `tk_cities` VALUES('652101','652100','吐鲁番市','新疆维吾尔自治区-吐鲁番地区-吐鲁番市','吐鲁番市','吐鲁番地区','新疆维吾尔自治区','3','838000','0995','','','tulufanshi','TLFS','0');
INSERT INTO `tk_cities` VALUES('652122','652100','鄯善县','新疆维吾尔自治区-吐鲁番地区-鄯善县','鄯善县','吐鲁番地区','新疆维吾尔自治区','3','838200','0995','','','shanxian','SX','0');
INSERT INTO `tk_cities` VALUES('652123','652100','托克逊县','新疆维吾尔自治区-吐鲁番地区-托克逊县','托克逊县','吐鲁番地区','新疆维吾尔自治区','3','838100','0995','','','tuokexunxian','TKXX','0');
INSERT INTO `tk_cities` VALUES('652201','652200','哈密市','新疆维吾尔自治区-哈密地区-哈密市','哈密市','哈密地区','新疆维吾尔自治区','3','839000','0902','','','hamishi','HMS','0');
INSERT INTO `tk_cities` VALUES('652222','652200','巴里坤哈萨克自治县','新疆维吾尔自治区-哈密地区-巴里坤哈萨克自治县','巴里坤哈萨克自治县','哈密地区','新疆维吾尔自治区','3','839200','0902','','','balikunhasakezizhixian','BLKHSKZZX','0');
INSERT INTO `tk_cities` VALUES('652223','652200','伊吾县','新疆维吾尔自治区-哈密地区-伊吾县','伊吾县','哈密地区','新疆维吾尔自治区','3','839300','0902','','','yiwuxian','YWX','0');
INSERT INTO `tk_cities` VALUES('652301','652300','昌吉市','新疆维吾尔自治区-昌吉回族自治州 -昌吉市','昌吉市','昌吉回族自治州 ','新疆维吾尔自治区','3','831100','0994','','','changjishi','CJS','0');
INSERT INTO `tk_cities` VALUES('652302','652300','阜康市','新疆维吾尔自治区-昌吉回族自治州 -阜康市','阜康市','昌吉回族自治州 ','新疆维吾尔自治区','3','831500','0994','','','fukangshi','FKS','0');
INSERT INTO `tk_cities` VALUES('652323','652300','呼图壁县','新疆维吾尔自治区-昌吉回族自治州 -呼图壁县','呼图壁县','昌吉回族自治州 ','新疆维吾尔自治区','3','831200','0994','','','hutubixian','HTBX','0');
INSERT INTO `tk_cities` VALUES('652324','652300','玛纳斯县','新疆维吾尔自治区-昌吉回族自治州 -玛纳斯县','玛纳斯县','昌吉回族自治州 ','新疆维吾尔自治区','3','832200','0994','','','manasixian','MNSX','0');
INSERT INTO `tk_cities` VALUES('652325','652300','奇台县','新疆维吾尔自治区-昌吉回族自治州 -奇台县','奇台县','昌吉回族自治州 ','新疆维吾尔自治区','3','831800','0994','','','qitaixian','QTX','0');
INSERT INTO `tk_cities` VALUES('652327','652300','吉木萨尔县','新疆维吾尔自治区-昌吉回族自治州 -吉木萨尔县','吉木萨尔县','昌吉回族自治州 ','新疆维吾尔自治区','3','831700','0994','','','jimusaerxian','JMSEX','0');
INSERT INTO `tk_cities` VALUES('652328','652300','木垒哈萨克自治县','新疆维吾尔自治区-昌吉回族自治州 -木垒哈萨克自治县','木垒哈萨克自治县','昌吉回族自治州 ','新疆维吾尔自治区','3','831900','0994','','','muleihasakezizhixian','MLHSKZZX','0');
INSERT INTO `tk_cities` VALUES('652701','652700','博乐市','新疆维吾尔自治区-博尔塔拉蒙古自治州 -博乐市','博乐市','博尔塔拉蒙古自治州 ','新疆维吾尔自治区','3','833400','0909','','','boleshi','BLS','0');
INSERT INTO `tk_cities` VALUES('652722','652700','精河县','新疆维吾尔自治区-博尔塔拉蒙古自治州 -精河县','精河县','博尔塔拉蒙古自治州 ','新疆维吾尔自治区','3','833300','0909','','','jinghexian','JHX','0');
INSERT INTO `tk_cities` VALUES('652723','652700','温泉县','新疆维吾尔自治区-博尔塔拉蒙古自治州 -温泉县','温泉县','博尔塔拉蒙古自治州 ','新疆维吾尔自治区','3','833500','0909','','','wenquanxian','WQX','0');
INSERT INTO `tk_cities` VALUES('652801','652800','库尔勒市','新疆维吾尔自治区-巴音郭楞蒙古自治州 -库尔勒市','库尔勒市','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841000','0996','','','kuerleshi','KELS','0');
INSERT INTO `tk_cities` VALUES('652822','652800','轮台县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -轮台县','轮台县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841600','0996','','','luntaixian','LTX','0');
INSERT INTO `tk_cities` VALUES('652823','652800','尉犁县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -尉犁县','尉犁县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841500','0996','','','weilixian','WLX','0');
INSERT INTO `tk_cities` VALUES('652824','652800','若羌县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -若羌县','若羌县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841800','0996','','','ruoqiangxian','RQX','0');
INSERT INTO `tk_cities` VALUES('652825','652800','且末县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -且末县','且末县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841900','0996','','','qiemoxian','QMX','0');
INSERT INTO `tk_cities` VALUES('652826','652800','焉耆回族自治县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -焉耆回族自治县','焉耆回族自治县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841100','0996','','','yanhuizuzizhixian','YHZZZX','0');
INSERT INTO `tk_cities` VALUES('652827','652800','和静县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -和静县','和静县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841300','0996','','','hejingxian','HJX','0');
INSERT INTO `tk_cities` VALUES('652828','652800','和硕县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -和硕县','和硕县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841200','0996','','','heshuoxian','HSX','0');
INSERT INTO `tk_cities` VALUES('652829','652800','博湖县','新疆维吾尔自治区-巴音郭楞蒙古自治州 -博湖县','博湖县','巴音郭楞蒙古自治州 ','新疆维吾尔自治区','3','841400','0996','','','bohuxian','BHX','0');
INSERT INTO `tk_cities` VALUES('652901','652900','阿克苏市','新疆维吾尔自治区-阿克苏地区-阿克苏市','阿克苏市','阿克苏地区','新疆维吾尔自治区','3','843000','0997','','','akesushi','AKSS','0');
INSERT INTO `tk_cities` VALUES('652922','652900','温宿县','新疆维吾尔自治区-阿克苏地区-温宿县','温宿县','阿克苏地区','新疆维吾尔自治区','3','843100','0997','','','wensuxian','WSX','0');
INSERT INTO `tk_cities` VALUES('652923','652900','库车县','新疆维吾尔自治区-阿克苏地区-库车县','库车县','阿克苏地区','新疆维吾尔自治区','3','842000','0997','','','kuchexian','KCX','0');
INSERT INTO `tk_cities` VALUES('652924','652900','沙雅县','新疆维吾尔自治区-阿克苏地区-沙雅县','沙雅县','阿克苏地区','新疆维吾尔自治区','3','842200','0997','','','shayaxian','SYX','0');
INSERT INTO `tk_cities` VALUES('652925','652900','新和县','新疆维吾尔自治区-阿克苏地区-新和县','新和县','阿克苏地区','新疆维吾尔自治区','3','842100','0997','','','xinhexian','XHX','0');
INSERT INTO `tk_cities` VALUES('652926','652900','拜城县','新疆维吾尔自治区-阿克苏地区-拜城县','拜城县','阿克苏地区','新疆维吾尔自治区','3','842300','0997','','','baichengxian','BCX','0');
INSERT INTO `tk_cities` VALUES('652927','652900','乌什县','新疆维吾尔自治区-阿克苏地区-乌什县','乌什县','阿克苏地区','新疆维吾尔自治区','3','843400','0997','','','wushixian','WSX','0');
INSERT INTO `tk_cities` VALUES('652928','652900','阿瓦提县','新疆维吾尔自治区-阿克苏地区-阿瓦提县','阿瓦提县','阿克苏地区','新疆维吾尔自治区','3','843200','0997','','','awatixian','AWTX','0');
INSERT INTO `tk_cities` VALUES('652929','652900','柯坪县','新疆维吾尔自治区-阿克苏地区-柯坪县','柯坪县','阿克苏地区','新疆维吾尔自治区','3','845350','0908','','','kepingxian','KPX','0');
INSERT INTO `tk_cities` VALUES('653001','653000','阿图什市','新疆维吾尔自治区-连克孜勒苏柯尔克孜自治州 -阿图什市','阿图什市','连克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区','3','845350','0908','','','atushishi','ATSS','0');
INSERT INTO `tk_cities` VALUES('653022','653000','阿克陶县','新疆维吾尔自治区-连克孜勒苏柯尔克孜自治州 -阿克陶县','阿克陶县','连克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区','3','845550','0908','','','aketaoxian','AKTX','0');
INSERT INTO `tk_cities` VALUES('653023','653000','阿合奇县','新疆维吾尔自治区-连克孜勒苏柯尔克孜自治州 -阿合奇县','阿合奇县','连克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区','3','843500','0997','','','aheqixian','AHQX','0');
INSERT INTO `tk_cities` VALUES('653024','653000','乌恰县','新疆维吾尔自治区-连克孜勒苏柯尔克孜自治州 -乌恰县','乌恰县','连克孜勒苏柯尔克孜自治州 ','新疆维吾尔自治区','3','845450','0908','','','wuqiaxian','WQX','0');
INSERT INTO `tk_cities` VALUES('653101','653100','喀什市','新疆维吾尔自治区-喀什地区-喀什市','喀什市','喀什地区','新疆维吾尔自治区','3','844000','0998','','','kashishi','KSS','0');
INSERT INTO `tk_cities` VALUES('653121','653100','疏附县','新疆维吾尔自治区-喀什地区-疏附县','疏附县','喀什地区','新疆维吾尔自治区','3','844100','0998','','','shufuxian','SFX','0');
INSERT INTO `tk_cities` VALUES('653122','653100','疏勒县','新疆维吾尔自治区-喀什地区-疏勒县','疏勒县','喀什地区','新疆维吾尔自治区','3','844200','0998','','','shulexian','SLX','0');
INSERT INTO `tk_cities` VALUES('653123','653100','英吉沙县','新疆维吾尔自治区-喀什地区-英吉沙县','英吉沙县','喀什地区','新疆维吾尔自治区','3','844500','0998','','','yingjishaxian','YJSX','0');
INSERT INTO `tk_cities` VALUES('653124','653100','泽普县','新疆维吾尔自治区-喀什地区-泽普县','泽普县','喀什地区','新疆维吾尔自治区','3','844800','0998','','','zepuxian','ZPX','0');
INSERT INTO `tk_cities` VALUES('653125','653100','莎车县','新疆维吾尔自治区-喀什地区-莎车县','莎车县','喀什地区','新疆维吾尔自治区','3','844700','0998','','','shachexian','SCX','0');
INSERT INTO `tk_cities` VALUES('653126','653100','叶城县','新疆维吾尔自治区-喀什地区-叶城县','叶城县','喀什地区','新疆维吾尔自治区','3','844900','0998','','','yechengxian','YCX','0');
INSERT INTO `tk_cities` VALUES('653127','653100','麦盖提县','新疆维吾尔自治区-喀什地区-麦盖提县','麦盖提县','喀什地区','新疆维吾尔自治区','3','844600','0998','','','maigaitixian','MGTX','0');
INSERT INTO `tk_cities` VALUES('653128','653100','岳普湖县','新疆维吾尔自治区-喀什地区-岳普湖县','岳普湖县','喀什地区','新疆维吾尔自治区','3','844400','0998','','','yuepuhuxian','YPHX','0');
INSERT INTO `tk_cities` VALUES('653127','653100','麦盖提县','新疆维吾尔自治区-喀什地区-麦盖提县','麦盖提县','喀什地区','新疆维吾尔自治区','3','844600','0998','','','maigaitixian','MGTX','0');
INSERT INTO `tk_cities` VALUES('653129','653100','伽师县','新疆维吾尔自治区-喀什地区-伽师县','伽师县','喀什地区','新疆维吾尔自治区','3','844300','0998','','','shixian','SX','0');
INSERT INTO `tk_cities` VALUES('653130','653100','巴楚县','新疆维吾尔自治区-喀什地区-巴楚县','巴楚县','喀什地区','新疆维吾尔自治区','3','843800','0998','','','bachuxian','BCX','0');
INSERT INTO `tk_cities` VALUES('653131','653100','塔什库尔干塔吉克自治县','新疆维吾尔自治区-喀什地区-塔什库尔干塔吉克自治县','塔什库尔干塔吉克自治县','喀什地区','新疆维吾尔自治区','3','845250','0998','','','tashikuergantajikezizhixian','TSKEGTJKZZX','0');
INSERT INTO `tk_cities` VALUES('653201','653200','和田市','新疆维吾尔自治区-和田地区-和田市','和田市','和田地区','新疆维吾尔自治区','3','848000','0903','','','hetianshi','HTS','0');
INSERT INTO `tk_cities` VALUES('653221','653200','和田县','新疆维吾尔自治区-和田地区-和田县','和田县','和田地区','新疆维吾尔自治区','3','848000','0903','','','hetianxian','HTX','0');
INSERT INTO `tk_cities` VALUES('653222','653200','墨玉县','新疆维吾尔自治区-和田地区-墨玉县','墨玉县','和田地区','新疆维吾尔自治区','3','848100','0903','','','moyuxian','MYX','0');
INSERT INTO `tk_cities` VALUES('653223','653200','皮山县','新疆维吾尔自治区-和田地区-皮山县','皮山县','和田地区','新疆维吾尔自治区','3','845150','0903','','','pishanxian','PSX','0');
INSERT INTO `tk_cities` VALUES('653224','653200','洛浦县','新疆维吾尔自治区-和田地区-洛浦县','洛浦县','和田地区','新疆维吾尔自治区','3','848200','0903','','','luopuxian','LPX','0');
INSERT INTO `tk_cities` VALUES('653225','653200','策勒县','新疆维吾尔自治区-和田地区-策勒县','策勒县','和田地区','新疆维吾尔自治区','3','848300','0903','','','celexian','CLX','0');
INSERT INTO `tk_cities` VALUES('653226','653200','于田县','新疆维吾尔自治区-和田地区-于田县','于田县','和田地区','新疆维吾尔自治区','3','848400','0903','','','yutianxian','YTX','0');
INSERT INTO `tk_cities` VALUES('653227','653200','民丰县','新疆维吾尔自治区-和田地区-民丰县','民丰县','和田地区','新疆维吾尔自治区','3','848500','0903','','','minfengxian','MFX','0');
INSERT INTO `tk_cities` VALUES('654002','654000','伊宁市','新疆维吾尔自治区-伊犁哈萨克自治州 -伊宁市','伊宁市','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835000','0999','','','yiningshi','YNS','0');
INSERT INTO `tk_cities` VALUES('654003','654000','奎屯市','新疆维吾尔自治区-伊犁哈萨克自治州 -奎屯市','奎屯市','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','833200','0992','','','kuitunshi','KTS','0');
INSERT INTO `tk_cities` VALUES('654021','654000','伊宁县','新疆维吾尔自治区-伊犁哈萨克自治州 -伊宁县','伊宁县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835100','0999','','','yiningxian','YNX','0');
INSERT INTO `tk_cities` VALUES('654022','654000','察布查尔锡伯自治县','新疆维吾尔自治区-伊犁哈萨克自治州 -察布查尔锡伯自治县','察布查尔锡伯自治县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835300','0999','','','chabuchaerxibozizhixian','CBCEXBZZX','0');
INSERT INTO `tk_cities` VALUES('654023','654000','霍城县','新疆维吾尔自治区-伊犁哈萨克自治州 -霍城县','霍城县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835200','0999','','','huochengxian','HCX','0');
INSERT INTO `tk_cities` VALUES('654024','654000','巩留县','新疆维吾尔自治区-伊犁哈萨克自治州 -巩留县','巩留县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835400','0999','','','gongliuxian','GLX','0');
INSERT INTO `tk_cities` VALUES('654025','654000','新源县','新疆维吾尔自治区-伊犁哈萨克自治州 -新源县','新源县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835800','0999','','','xinyuanxian','XYX','0');
INSERT INTO `tk_cities` VALUES('654026','654000','昭苏县','新疆维吾尔自治区-伊犁哈萨克自治州 -昭苏县','昭苏县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835600','0999','','','zhaosuxian','ZSX','0');
INSERT INTO `tk_cities` VALUES('654027','654000','特克斯县','新疆维吾尔自治区-伊犁哈萨克自治州 -特克斯县','特克斯县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835500','0999','','','tekesixian','TKSX','0');
INSERT INTO `tk_cities` VALUES('654028','654000','尼勒克县','新疆维吾尔自治区-伊犁哈萨克自治州 -尼勒克县','尼勒克县','伊犁哈萨克自治州 ','新疆维吾尔自治区','3','835700','0999','','','nilekexian','NLKX','0');
INSERT INTO `tk_cities` VALUES('654201','654200','塔城市','新疆维吾尔自治区-塔城地区-塔城市','塔城市','塔城地区','新疆维吾尔自治区','3','834300','0901','','','tachengshi','TCS','0');
INSERT INTO `tk_cities` VALUES('654202','654200','乌苏市','新疆维吾尔自治区-塔城地区-乌苏市','乌苏市','塔城地区','新疆维吾尔自治区','3','833300','0992','','','wusushi','WSS','0');
INSERT INTO `tk_cities` VALUES('654221','654200','额敏县','新疆维吾尔自治区-塔城地区-额敏县','额敏县','塔城地区','新疆维吾尔自治区','3','834600','0901','','','eminxian','EMX','0');
INSERT INTO `tk_cities` VALUES('654223','654200','沙湾县','新疆维吾尔自治区-塔城地区-沙湾县','沙湾县','塔城地区','新疆维吾尔自治区','3','832100','0993','','','shawanxian','SWX','0');
INSERT INTO `tk_cities` VALUES('654224','654200','托里县','新疆维吾尔自治区-塔城地区-托里县','托里县','塔城地区','新疆维吾尔自治区','3','834500','0901','','','tuolixian','TLX','0');
INSERT INTO `tk_cities` VALUES('654225','654200','裕民县','新疆维吾尔自治区-塔城地区-裕民县','裕民县','塔城地区','新疆维吾尔自治区','3','834800','0901','','','yuminxian','YMX','0');
INSERT INTO `tk_cities` VALUES('654226','654200','和布克赛尔蒙古自治县','新疆维吾尔自治区-塔城地区-和布克赛尔蒙古自治县','和布克赛尔蒙古自治县','塔城地区','新疆维吾尔自治区','3','834400','0990','','','hebukesaiermengguzizhixian','HBKSEMGZZX','0');
INSERT INTO `tk_cities` VALUES('654301','654300','阿勒泰市','新疆维吾尔自治区-阿勒泰地区-阿勒泰市','阿勒泰市','阿勒泰地区','新疆维吾尔自治区','3','836500','0906','','','aletaishi','ALTS','0');
INSERT INTO `tk_cities` VALUES('654321','654300','布尔津县','新疆维吾尔自治区-阿勒泰地区-布尔津县','布尔津县','阿勒泰地区','新疆维吾尔自治区','3','836600','0906','','','buerjinxian','BEJX','0');
INSERT INTO `tk_cities` VALUES('654322','654300','富蕴县','新疆维吾尔自治区-阿勒泰地区-富蕴县','富蕴县','阿勒泰地区','新疆维吾尔自治区','3','836100','0906','','','fuyunxian','FYX','0');
INSERT INTO `tk_cities` VALUES('654323','654300','福海县','新疆维吾尔自治区-阿勒泰地区-福海县','福海县','阿勒泰地区','新疆维吾尔自治区','3','836400','0906','','','fuhaixian','FHX','0');
INSERT INTO `tk_cities` VALUES('654324','654300','哈巴河县','新疆维吾尔自治区-阿勒泰地区-哈巴河县','哈巴河县','阿勒泰地区','新疆维吾尔自治区','3','836700','0906','','','habahexian','HBHX','0');
INSERT INTO `tk_cities` VALUES('654325','654300','青河县','新疆维吾尔自治区-阿勒泰地区-青河县','青河县','阿勒泰地区','新疆维吾尔自治区','3','836200','0906','','','qinghexian','QHX','0');
INSERT INTO `tk_cities` VALUES('654326','654300','吉木乃县','新疆维吾尔自治区-阿勒泰地区-吉木乃县','吉木乃县','阿勒泰地区','新疆维吾尔自治区','3','836800','0906','','','jimunaixian','JMNX','0');
INSERT INTO `tk_cities` VALUES('659001?','','石河子市','新疆维吾尔自治区-自治区直辖-石河子市','石河子市','自治区直辖','新疆维吾尔自治区','3','','','','','shihezishi','SHZS','0');
INSERT INTO `tk_cities` VALUES('659002?','','阿拉尔市','新疆维吾尔自治区-自治区直辖-阿拉尔市','阿拉尔市','自治区直辖','新疆维吾尔自治区','3','','','','','alaershi','ALES','0');
INSERT INTO `tk_cities` VALUES('659003?','','图木舒克市','新疆维吾尔自治区-自治区直辖-图木舒克市','图木舒克市','自治区直辖','新疆维吾尔自治区','3','','','','','tumushukeshi','TMSKS','0');
INSERT INTO `tk_cities` VALUES('659004?','','五家渠市','新疆维吾尔自治区-自治区直辖-五家渠市','五家渠市','自治区直辖','新疆维吾尔自治区','3','','','','','wujiaqushi','WJQS','0');
INSERT INTO `tk_cities` VALUES('710000','0','台湾省','台湾省','','','台湾省','1','','00886','','','taiwansheng','TWS','0');
INSERT INTO `tk_cities` VALUES('710100','','台北市','台湾省-台北市','','台北市','台湾省','2','','','','','taibeishi','TBS','0');
INSERT INTO `tk_cities` VALUES('710200','','高雄市','台湾省-高雄市','','高雄市','台湾省','2','','','','','gaoxiongshi','GXS','0');
INSERT INTO `tk_cities` VALUES('710300','','基隆市','台湾省-基隆市','','基隆市','台湾省','2','','','','','jilongshi','JLS','0');
INSERT INTO `tk_cities` VALUES('710400','','台中市','台湾省-台中市','','台中市','台湾省','2','','','','','taizhongshi','TZS','0');
INSERT INTO `tk_cities` VALUES('710500','','台南市','台湾省-台南市','','台南市','台湾省','2','','','','','tainanshi','TNS','0');
INSERT INTO `tk_cities` VALUES('710600','','新竹市','台湾省-新竹市','','新竹市','台湾省','2','','','','','xinzhushi','XZS','0');
INSERT INTO `tk_cities` VALUES('710700','','嘉义市','台湾省-嘉义市','','嘉义市','台湾省','2','','','','','jiayishi','JYS','0');
INSERT INTO `tk_cities` VALUES('719000','','省直辖','台湾省-省直辖','','省直辖','台湾省','2','','','','','shengzhixia','SZX','0');
INSERT INTO `tk_cities` VALUES('710101','','中正区','台湾省-台北市-中正区','中正区','台北市','台湾省','3','','','','','zhongzhengqu','ZZQ','0');
INSERT INTO `tk_cities` VALUES('710102','','大同区','台湾省-台北市-大同区','大同区','台北市','台湾省','3','','','','','datongqu','DTQ','0');
INSERT INTO `tk_cities` VALUES('710103','','中山区','台湾省-台北市-中山区','中山区','台北市','台湾省','3','','','','','zhongshanqu','ZSQ','0');
INSERT INTO `tk_cities` VALUES('710104','','松山区','台湾省-台北市-松山区','松山区','台北市','台湾省','3','','','','','songshanqu','SSQ','0');
INSERT INTO `tk_cities` VALUES('710105','','大安区','台湾省-台北市-大安区','大安区','台北市','台湾省','3','','','','','daanqu','DAQ','0');
INSERT INTO `tk_cities` VALUES('710106','','万华区','台湾省-台北市-万华区','万华区','台北市','台湾省','3','','','','','wanhuaqu','WHQ','0');
INSERT INTO `tk_cities` VALUES('710107','','信义区','台湾省-台北市-信义区','信义区','台北市','台湾省','3','','','','','xinyiqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('710108','','士林区','台湾省-台北市-士林区','士林区','台北市','台湾省','3','','','','','shilinqu','SLQ','0');
INSERT INTO `tk_cities` VALUES('710109','','北投区','台湾省-台北市-北投区','北投区','台北市','台湾省','3','','','','','beitouqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('710110','','内湖区','台湾省-台北市-内湖区','内湖区','台北市','台湾省','3','','','','','neihuqu','NHQ','0');
INSERT INTO `tk_cities` VALUES('710111','','南港区','台湾省-台北市-南港区','南港区','台北市','台湾省','3','','','','','nangangqu','NGQ','0');
INSERT INTO `tk_cities` VALUES('710112','','文山区','台湾省-台北市-文山区','文山区','台北市','台湾省','3','','','','','wenshanqu','WSQ','0');
INSERT INTO `tk_cities` VALUES('710201','','新兴区','台湾省-高雄市-新兴区','新兴区','高雄市','台湾省','3','','','','','xinxingqu','XXQ','0');
INSERT INTO `tk_cities` VALUES('710202','','前金区','台湾省-高雄市-前金区','前金区','高雄市','台湾省','3','','','','','qianjinqu','QJQ','0');
INSERT INTO `tk_cities` VALUES('710203','','芩雅区','台湾省-高雄市-芩雅区','芩雅区','高雄市','台湾省','3','','','','','yaqu','YQ','0');
INSERT INTO `tk_cities` VALUES('710204','','盐埕区','台湾省-高雄市-盐埕区','盐埕区','高雄市','台湾省','3','','','','','yanqu','YQ','0');
INSERT INTO `tk_cities` VALUES('710205','','鼓山区','台湾省-高雄市-鼓山区','鼓山区','高雄市','台湾省','3','','','','','gushanqu','GSQ','0');
INSERT INTO `tk_cities` VALUES('710206','','旗津区','台湾省-高雄市-旗津区','旗津区','高雄市','台湾省','3','','','','','qijinqu','QJQ','0');
INSERT INTO `tk_cities` VALUES('710207','','前镇区','台湾省-高雄市-前镇区','前镇区','高雄市','台湾省','3','','','','','qianzhenqu','QZQ','0');
INSERT INTO `tk_cities` VALUES('710208','','三民区','台湾省-高雄市-三民区','三民区','高雄市','台湾省','3','','','','','sanminqu','SMQ','0');
INSERT INTO `tk_cities` VALUES('710209','','左营区','台湾省-高雄市-左营区','左营区','高雄市','台湾省','3','','','','','zuoyingqu','ZYQ','0');
INSERT INTO `tk_cities` VALUES('710210','','楠梓区','台湾省-高雄市-楠梓区','楠梓区','高雄市','台湾省','3','','','','','qu','Q','0');
INSERT INTO `tk_cities` VALUES('710211','','小港区','台湾省-高雄市-小港区','小港区','高雄市','台湾省','3','','','','','xiaogangqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('710301','','仁爱区','台湾省-基隆市-仁爱区','仁爱区','基隆市','台湾省','3','','','','','renaiqu','RAQ','0');
INSERT INTO `tk_cities` VALUES('710302','','信义区','台湾省-基隆市-信义区','信义区','基隆市','台湾省','3','','','','','xinyiqu','XYQ','0');
INSERT INTO `tk_cities` VALUES('710303','','中正区','台湾省-基隆市-中正区','中正区','基隆市','台湾省','3','','','','','zhongzhengqu','ZZQ','0');
INSERT INTO `tk_cities` VALUES('710304','','中山区','台湾省-基隆市-中山区','中山区','基隆市','台湾省','3','','','','','zhongshanqu','ZSQ','0');
INSERT INTO `tk_cities` VALUES('710305','','安乐区','台湾省-基隆市-安乐区','安乐区','基隆市','台湾省','3','','','','','anlequ','ALQ','0');
INSERT INTO `tk_cities` VALUES('710306','','暖暖区','台湾省-基隆市-暖暖区','暖暖区','基隆市','台湾省','3','','','','','nuannuanqu','NNQ','0');
INSERT INTO `tk_cities` VALUES('710307','','七堵区','台湾省-基隆市-七堵区','七堵区','基隆市','台湾省','3','','','','','qiduqu','QDQ','0');
INSERT INTO `tk_cities` VALUES('710401','','中区','台湾省-台中市-中区','中区','台中市','台湾省','3','','','','','zhongqu','ZQ','0');
INSERT INTO `tk_cities` VALUES('710402','','东区','台湾省-台中市-东区','东区','台中市','台湾省','3','','','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('710403','','南区','台湾省-台中市-南区','南区','台中市','台湾省','3','','','','','nanqu','NQ','0');
INSERT INTO `tk_cities` VALUES('710404','','西区','台湾省-台中市-西区','西区','台中市','台湾省','3','','','','','xiqu','XQ','0');
INSERT INTO `tk_cities` VALUES('710405','','北区','台湾省-台中市-北区','北区','台中市','台湾省','3','','','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('710406','','北屯区','台湾省-台中市-北屯区','北屯区','台中市','台湾省','3','','','','','beitunqu','BTQ','0');
INSERT INTO `tk_cities` VALUES('710407','','西屯区','台湾省-台中市-西屯区','西屯区','台中市','台湾省','3','','','','','xitunqu','XTQ','0');
INSERT INTO `tk_cities` VALUES('710408','','南屯区','台湾省-台中市-南屯区','南屯区','台中市','台湾省','3','','','','','nantunqu','NTQ','0');
INSERT INTO `tk_cities` VALUES('710501','','中西区','台湾省-台南市-中西区','中西区','台南市','台湾省','3','','','','','zhongxiqu','ZXQ','0');
INSERT INTO `tk_cities` VALUES('710502','','东区','台湾省-台南市-东区','东区','台南市','台湾省','3','','','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('710503','','南区','台湾省-台南市-南区','南区','台南市','台湾省','3','','','','','nanqu','NQ','0');
INSERT INTO `tk_cities` VALUES('710504','','北区','台湾省-台南市-北区','北区','台南市','台湾省','3','','','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('710505','','安平区','台湾省-台南市-安平区','安平区','台南市','台湾省','3','','','','','anpingqu','APQ','0');
INSERT INTO `tk_cities` VALUES('710506','','安南区','台湾省-台南市-安南区','安南区','台南市','台湾省','3','','','','','annanqu','ANQ','0');
INSERT INTO `tk_cities` VALUES('710601','','东区','台湾省-新竹市-东区','东区','新竹市','台湾省','3','','','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('710602','','北区','台湾省-新竹市-北区','北区','新竹市','台湾省','3','','','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('710603','','香山区','台湾省-新竹市-香山区','香山区','新竹市','台湾省','3','','','','','xiangshanqu','XSQ','0');
INSERT INTO `tk_cities` VALUES('710701','','东区','台湾省-嘉义市-东区','东区','嘉义市','台湾省','3','','','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('710702','','西区','台湾省-嘉义市-西区','西区','嘉义市','台湾省','3','','','','','xiqu','XQ','0');
INSERT INTO `tk_cities` VALUES('719001','','台北县','台湾省-省直辖-台北县','台北县','省直辖','台湾省','3','','','','','taibeixian','TBX','0');
INSERT INTO `tk_cities` VALUES('719002','','宜兰县','台湾省-省直辖-宜兰县','宜兰县','省直辖','台湾省','3','','','','','yilanxian','YLX','0');
INSERT INTO `tk_cities` VALUES('719003','','新竹县','台湾省-省直辖-新竹县','新竹县','省直辖','台湾省','3','','','','','xinzhuxian','XZX','0');
INSERT INTO `tk_cities` VALUES('719004','','桃园县','台湾省-省直辖-桃园县','桃园县','省直辖','台湾省','3','','','','','taoyuanxian','TYX','0');
INSERT INTO `tk_cities` VALUES('719005','','苗栗县','台湾省-省直辖-苗栗县','苗栗县','省直辖','台湾省','3','','','','','miaolixian','MLX','0');
INSERT INTO `tk_cities` VALUES('719006','','台中县','台湾省-省直辖-台中县','台中县','省直辖','台湾省','3','','','','','taizhongxian','TZX','0');
INSERT INTO `tk_cities` VALUES('719007','','彰化县','台湾省-省直辖-彰化县','彰化县','省直辖','台湾省','3','','','','','zhanghuaxian','ZHX','0');
INSERT INTO `tk_cities` VALUES('719008','','南投县','台湾省-省直辖-南投县','南投县','省直辖','台湾省','3','','','','','nantouxian','NTX','0');
INSERT INTO `tk_cities` VALUES('719009','','嘉义县','台湾省-省直辖-嘉义县','嘉义县','省直辖','台湾省','3','','','','','jiayixian','JYX','0');
INSERT INTO `tk_cities` VALUES('719010','','云林县','台湾省-省直辖-云林县','云林县','省直辖','台湾省','3','','','','','yunlinxian','YLX','0');
INSERT INTO `tk_cities` VALUES('719011','','台南县','台湾省-省直辖-台南县','台南县','省直辖','台湾省','3','','','','','tainanxian','TNX','0');
INSERT INTO `tk_cities` VALUES('719012','','高雄县','台湾省-省直辖-高雄县','高雄县','省直辖','台湾省','3','','','','','gaoxiongxian','GXX','0');
INSERT INTO `tk_cities` VALUES('719013','','屏东县','台湾省-省直辖-屏东县','屏东县','省直辖','台湾省','3','','','','','pingdongxian','PDX','0');
INSERT INTO `tk_cities` VALUES('719014','','台东县','台湾省-省直辖-台东县','台东县','省直辖','台湾省','3','','','','','taidongxian','TDX','0');
INSERT INTO `tk_cities` VALUES('719015','','花莲县','台湾省-省直辖-花莲县','花莲县','省直辖','台湾省','3','','','','','hualianxian','HLX','0');
INSERT INTO `tk_cities` VALUES('719016','','澎湖县','台湾省-省直辖-澎湖县','澎湖县','省直辖','台湾省','3','','','','','penghuxian','PHX','0');
INSERT INTO `tk_cities` VALUES('810000','0','香港特别行政区','香港特别行政区','','','香港特别行政区','1','','00852','','','xianggangtebiexingzhengqu','XGTBXZQ','1');
INSERT INTO `tk_cities` VALUES('810100','','香港岛','香港特别行政区-香港岛','','香港岛','香港特别行政区','2','','','','','xianggangdao','XGD','0');
INSERT INTO `tk_cities` VALUES('810200','','九龙','香港特别行政区-九龙','','九龙','香港特别行政区','2','','','','','jiulong','JL','0');
INSERT INTO `tk_cities` VALUES('810300','','新界','香港特别行政区-新界','','新界','香港特别行政区','2','','','','','xinjie','XJ','0');
INSERT INTO `tk_cities` VALUES('810101','','中西区','香港特别行政区-香港岛-中西区','中西区','香港岛','香港特别行政区','3','','','','','zhongxiqu','ZXQ','0');
INSERT INTO `tk_cities` VALUES('810102','','湾仔区 ','香港特别行政区-香港岛-湾仔区 ','湾仔区 ','香港岛','香港特别行政区','3','','','','','wanziqu','WZQ','0');
INSERT INTO `tk_cities` VALUES('810103','','东区 ','香港特别行政区-香港岛-东区 ','东区 ','香港岛','香港特别行政区','3','','','','','dongqu','DQ','0');
INSERT INTO `tk_cities` VALUES('810104','','南区','香港特别行政区-香港岛-南区','南区','香港岛','香港特别行政区','3','','','','','nanqu','NQ','0');
INSERT INTO `tk_cities` VALUES('810201','','油尖旺区 ','香港特别行政区-九龙-油尖旺区 ','油尖旺区 ','九龙','香港特别行政区','3','','','','','youjianwangqu','YJWQ','0');
INSERT INTO `tk_cities` VALUES('810202','','深水埗区','香港特别行政区-九龙-深水埗区','深水埗区','九龙','香港特别行政区','3','','','','','shenshuidu','SSD','0');
INSERT INTO `tk_cities` VALUES('810203','','九龙城区','香港特别行政区-九龙-九龙城区','九龙城区','九龙','香港特别行政区','3','','','','','jiulongchengqu','JLCQ','0');
INSERT INTO `tk_cities` VALUES('810204','','黄大仙区','香港特别行政区-九龙-黄大仙区','黄大仙区','九龙','香港特别行政区','3','','','','','huangdaxianqu','HDXQ','0');
INSERT INTO `tk_cities` VALUES('810205','','观塘区','香港特别行政区-九龙-观塘区','观塘区','九龙','香港特别行政区','3','','','','','guantangqu','GTQ','0');
INSERT INTO `tk_cities` VALUES('810301','','北区 ','香港特别行政区-新界-北区 ','北区 ','新界','香港特别行政区','3','','','','','beiqu','BQ','0');
INSERT INTO `tk_cities` VALUES('810302','','大埔区','香港特别行政区-新界-大埔区','大埔区','新界','香港特别行政区','3','','','','','dapuqu','DPQ','0');
INSERT INTO `tk_cities` VALUES('810303','','沙田区 ','香港特别行政区-新界-沙田区 ','沙田区 ','新界','香港特别行政区','3','','','','','shatianqu','STQ','0');
INSERT INTO `tk_cities` VALUES('810304','','西贡区','香港特别行政区-新界-西贡区','西贡区','新界','香港特别行政区','3','','','','','xigongqu','XGQ','0');
INSERT INTO `tk_cities` VALUES('810305','','荃湾区','香港特别行政区-新界-荃湾区','荃湾区','新界','香港特别行政区','3','','','','','wanqu','WQ','0');
INSERT INTO `tk_cities` VALUES('810306','','屯门区 ','香港特别行政区-新界-屯门区 ','屯门区 ','新界','香港特别行政区','3','','','','','tunmenqu','TMQ','0');
INSERT INTO `tk_cities` VALUES('810307','','元朗区 ','香港特别行政区-新界-元朗区 ','元朗区 ','新界','香港特别行政区','3','','','','','yuanlangqu','YLQ','0');
INSERT INTO `tk_cities` VALUES('810308','','葵青区','香港特别行政区-新界-葵青区','葵青区','新界','香港特别行政区','3','','','','','kuiqingqu','KQQ','0');
INSERT INTO `tk_cities` VALUES('810309','','离岛区 ','香港特别行政区-新界-离岛区 ','离岛区 ','新界','香港特别行政区','3','','','','','lidaoqu','LDQ','0');
INSERT INTO `tk_cities` VALUES('820000','0','澳门特别行政区 ','澳门特别行政区 ','','','澳门特别行政区 ','1','','00853','','','aomentebiexingzhengqu','AMTBXZQ','0');
INSERT INTO `tk_cities` VALUES('820100','','澳门半岛','澳门特别行政区-澳门半岛','','澳门半岛','澳门特别行政区','2','','','','','aomenbandao','AMBD','0');
INSERT INTO `tk_cities` VALUES('820200','','澳门离岛','澳门特别行政区-澳门离岛','','澳门离岛','澳门特别行政区','2','','','','','aomenlidao','AMLD','0');
INSERT INTO `tk_cities` VALUES('820300','','无堂区划分区域','澳门特别行政区-无堂区划分区域','','无堂区划分区域','澳门特别行政区','2','','','','','wutangquhuafenquyu','WTQHFQY','0');
INSERT INTO `tk_cities` VALUES('820101','','花地玛堂区 ','澳门特别行政区-澳门半岛-花地玛堂区 ','花地玛堂区 ','澳门半岛','澳门特别行政区','3','','','','','huadimatangqu','HDMTQ','0');
INSERT INTO `tk_cities` VALUES('820102','','圣安多尼堂区 ','澳门特别行政区-澳门半岛-圣安多尼堂区 ','圣安多尼堂区 ','澳门半岛','澳门特别行政区','3','','','','','shenganduonitangqu','SADNTQ','0');
INSERT INTO `tk_cities` VALUES('820103','','大堂区 ','澳门特别行政区-澳门半岛-大堂区 ','大堂区 ','澳门半岛','澳门特别行政区','3','','','','','datangqu','DTQ','0');
INSERT INTO `tk_cities` VALUES('820104','','望德堂区 ','澳门特别行政区-澳门半岛-望德堂区 ','望德堂区 ','澳门半岛','澳门特别行政区','3','','','','','wangdetangqu','WDTQ','0');
INSERT INTO `tk_cities` VALUES('820105','','风顺堂区 ','澳门特别行政区-澳门半岛-风顺堂区 ','风顺堂区 ','澳门半岛','澳门特别行政区','3','','','','','fengshuntangqu','FSTQ','0');
INSERT INTO `tk_cities` VALUES('820201','','嘉模堂区 ','澳门特别行政区-澳门离岛-嘉模堂区 ','嘉模堂区 ','澳门离岛','澳门特别行政区','3','','','','','jiamotangqu','JMTQ','0');
INSERT INTO `tk_cities` VALUES('820202','','圣方济各堂区 ','澳门特别行政区-澳门离岛-圣方济各堂区 ','圣方济各堂区 ','澳门离岛','澳门特别行政区','3','','','','','shengfangjigetangqu','SFJGTQ','0');
INSERT INTO `tk_cities` VALUES('820301','','路氹城 ','澳门特别行政区-无堂区划分区域-路氹城 ','路氹城 ','无堂区划分区域','澳门特别行政区','3','','','','','luqia','LQ','0');

