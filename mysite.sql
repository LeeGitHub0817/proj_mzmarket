SET NAMES UTF8;
DROP DATABASE IF EXISTS mz;
CREATE DATABASE mz CHARSET=UTF8;
USE mz;

CREATE TABLE mz_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32) DEFAULT NULL,
	upwd VARCHAR(32) DEFAULT NULL,
	phone VARCHAR(32) DEFAULT NULL,
	email VARCHAR(64) DEFAULT NULL,
	avator VARCHAR(128) DEFAULT NULL,
	user_name VARCHAR(32) DEFAULT NULL,
	gender INT DEFAULT NULL
);

CREATE TABLE mz_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(64),
	href VARCHAR(128)
);

CREATE TABLE mz_index_product(
	ipid INT(11) PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	ipname VARCHAR(32),
	description VARCHAR(128),
	price DECIMAL(10,2),
	href VARCHAR(128),
	floortype INT(11)
);

CREATE TABLE mz_product_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(32)
);

CREATE TABLE mz_product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,
	pname VARCHAR(32),
	subtitle VARCHAR(128),
	price DECIMAL(10, 2),
	coupon VARCHAR(512),
	spec VARCHAR(128),
	specimg VARCHAR(128),
	details VARCHAR(2048),
	parameters VARCHAR(8192),
	qaq VARCHAR(8192),
	shelf_time BIGINT,
	sold_count INT,
	is_onsale BOOLEAN,
	type INT
);

CREATE TABLE mz_product_pic(
	iid INT PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
	sm VARCHAR(128),
	md VARCHAR(128),
	lg VARCHAR(128)
);

CREATE TABLE mz_shoppingcart_item(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	product_id INT,
	count INT,
	is_checked INT
);

#插入购物车表数据
INSERT INTO mz_shoppingcart_item VALUES(
	null, 1, 1, 1, 1
);

#插入用户表的内容
INSERT INTO mz_user VALUES(
	null,'mzadmin',md5('123456'),'13525647895','1546565656@qq.com','img/header/avator/admin.jpg','魅族','0'
);
INSERT INTO mz_user VALUES(
	null,'flyme',md5('123456'),'13525647832','1546567458@qq.com','img/header/avator/flyme.jpg','flyme','0'
);
INSERT INTO mz_user VALUES(
	null,'yaya',md5('123456'),'13525645698','1546568245@qq.com','img/header/avator/yaya.jpg','唐雅','1'
);
INSERT INTO mz_user VALUES(
	null,'dingding',md5('123456'),'13525649985','15465643545@qq.com','img/header/avator/dingding.jpg','丁当','0'
);

#插入轮播图标数据
INSERT INTO mz_index_carousel (cid, img, title, href) VALUES
(1, 'img/index/banner/1.jpg', '轮播图广告1', 'product_detail.html?pid=21'),
(2, 'img/index/banner/2.jpg', '轮播图广告2', 'product_detail.html?pid=1'),
(3, 'img/index/banner/3.jpg', '轮播图广告3', '#'),
(4, 'img/index/banner/4.jpg', '轮播图广告4', 'product_detail.html?pid=15'),
(5, 'img/index/banner/5.jpg', '轮播图广告5', 'product_detail.html?pid=9'),
(6, 'img/index/banner/6.jpg', '轮播图广告6', 'product_detail.html?pid=60'),
(7, 'img/index/banner/7.jpg', '轮播图广告7', 'product_detail.html?pid=61');

#插入主页页面数据
INSERT INTO mz_index_product (ipid, img, ipname, description, price, href, floortype) VALUES
(1, 'img/index/hot/hot1.png', '魅族 PRO 7', '领券最高立减500元', '1999.00', 'product_detail.html?pid=1', 1),
(2, 'img/index/hot/hot2.png', '魅蓝 6', '领券最高减100元 享3期免息', '599.00', 'product_detail.html?pid=9', 1),
(3, 'img/index/hot/hot3.png', '魅蓝 Note 6', '领券最高减150元', '799.00', 'product_detail.html?pid=15', 1),
(4, 'img/index/hot/hot4.png', '魅族 EP2X耳机', '契合声音的流动之美', '69.00', 'product_detail.html?pid=58', 1),
(5, 'img/index/phone/phone1.jpg', NULL, NULL, NULL, 'product_detail.html?pid=35', 2),
(6, 'img/index/phone/phone2.jpg', NULL, NULL, NULL, 'product_detail.html?pid=15', 2),
(7, 'img/index/phone/phone3.jpg', NULL, NULL, NULL, 'product_detail.html?pid=9', 2),
(8, 'img/index/phone/phone4.jpg', NULL, NULL, NULL, 'product_detail.html?pid=38', 2),
(9, 'img/index/phone/sale1.png', '魅族 15', '2000万暗光双摄 智能美颜', '2499.00', 'product_detail.html?pid=21', 2),
(10, 'img/index/phone/sale2.png', '魅族 15 Plus', '定制全面屏 人机交互新体验', '2999.00', 'product_detail.html?pid=29', 2),
(11, 'img/index/phone/sale3.png', '魅族 M15', '支持人脸识别 抬腕即解锁', '1699.00', 'product_detail.html?pid=35', 2),
(12, 'img/index/phone/sale4.png', '魅族 PRO 7系列', '最高优惠1200元', '1299.00', 'product_detail.html?pid=1', 2),
(13, 'img/index/phone/sale5.png', '魅蓝 Note6', '领券最高减200元', '799.00', 'product_detail.html?pid=15', 2),
(14, 'img/index/phone/sale6.png', '魅蓝 6', '限时领券最高减150元', '599.00', 'product_detail.html?pid=9', 2),
(15, 'img/index/phone/sale7.png', '魅蓝 E3', '玩得畅快 拍得清晰', '1799.00', 'product_detail.html?pid=38', 2),
(16, 'img/index/phone/sale8.png', '魅蓝 E2', '领券立减80元', '899.00', 'product_detail.html?pid=42', 2),
(17, 'img/index/smart/smart1.jpg', NULL, NULL, NULL, 'product_detail.html?pid=60', 3),
(18, 'img/index/smart/smart2.jpg', NULL, NULL, NULL, 'product_detail.html?pid=61', 3),
(19, 'img/index/smart/smart3.jpg', NULL, NULL, NULL, 'product_detail.html?pid=63', 3),
(20, 'img/index/smart/smart4.jpg', NULL, NULL, NULL, 'product_detail.html?pid=77', 3),
(21, 'img/index/smart/sb1.png', '魅蓝双向移动电源', '新品上市 火热抢购', '169.00', 'product_detail.html?pid=72', 3),
(22, 'img/index/smart/sb2.png', '魅蓝20寸 酷MA萌 旅行箱', '静音双排万向轮设计', '349.00', 'product_detail.html?pid=73', 3),
(23, 'img/index/smart/sb3.png', '魅族 Flow 三单元耳机', '用的惬意 听得尽兴', '599.00', 'product_detail.html?pid=64', 3),
(24, 'img/index/smart/sb4.png', '魅族 EP51蓝牙运动耳机', '丛林绿/云雾蓝新品开售', '229.00', 'product_detail.html?pid=66', 3),
(25, 'img/index/smart/sb5.png', '魅族 EP2X耳机', '契合声音的流动之美', '89.00', 'product_detail.html?pid=58', 3),
(26, 'img/index/smart/sb6.png', '魅族智能体脂秤', '精准的数字 才是真实的你', '99.00', 'product_detail.html?pid=75', 3),
(27, 'img/index/smart/sb7.png', '魅蓝EP52蓝牙耳机', '新品到货 限量抢购', '299.00', 'product_detail.html?pid=68', 3),
(28, 'img/index/smart/sb8.png', '魅族HD50 头戴式耳机', '清新简洁，有音质更有颜值', '399.00', 'product_detail.html?pid=70', 3),
(29, 'img/index/smart/sb9.png', '魅族手环', '腕间流动的心率专家 智能美颜', '169.00', 'product_detail.html?pid=76', 3),
(30, 'img/index/smart/sb10.png', '魅族蓝牙小音箱', '好音感 直达心灵', '99.00', 'product_detail.html?pid=77', 3),
(31, 'img/index/smart/sb11.png', '魅蓝旅行包', '青春正好，即刻出发', '269.00', 'product_detail.html?pid=81', 3),
(32, 'img/index/smart/sb12.png', '魅蓝 休闲旅行双肩包', '曲面一体式 多功能隔层', '199.00', 'product_detail.html?pid=79', 3);

#插入产品系列数据
INSERT INTO mz_product_family VALUES(
	1,"魅族 PRO 7系列"
);
INSERT INTO mz_product_family VALUES(
	2,"魅蓝 6系列"
);
INSERT INTO mz_product_family VALUES(
	3,"魅蓝 Note 6系列"
);
INSERT INTO mz_product_family VALUES(
	4,"魅族 15系列"
);
INSERT INTO mz_product_family VALUES(
	5,"魅族 15 Plus系列"
);
INSERT INTO mz_product_family VALUES(
	6,"魅族 M15 系列"
);
INSERT INTO mz_product_family VALUES(
	7,"魅蓝E3 系列"
);
INSERT INTO mz_product_family VALUES(
	8,"魅蓝E2 系列"
);
INSERT INTO mz_product_family VALUES(
	9,"华为P10 系列"
);
INSERT INTO mz_product_family VALUES(
	10,"三星S8 系列"
);
INSERT INTO mz_product_family VALUES(
	11,"魅族EP2X"
);
INSERT INTO mz_product_family VALUES(
	12,"魅族POP 真无线蓝牙耳机"
);
INSERT INTO mz_product_family VALUES(
	13,"魅族 HALO 激光蓝牙耳机"
);
INSERT INTO mz_product_family VALUES(
	14,"魅族 LIVE四单元动铁耳机"
);
INSERT INTO mz_product_family VALUES(
	15,"魅族 Flow 三单元耳机"
);
INSERT INTO mz_product_family VALUES(
	16,"魅族 EP51蓝牙运动耳机"
);
INSERT INTO mz_product_family VALUES(
	17,"魅族 EP52蓝牙运动耳机"
);
INSERT INTO mz_product_family VALUES(
	18,"魅族 HD50 头戴式耳机"
);
INSERT INTO mz_product_family VALUES(
	19,"魅蓝双向闪充移动电源"
);
INSERT INTO mz_product_family VALUES(
	20,"魅蓝20寸旅行箱 酷MA萌定制版"
);
INSERT INTO mz_product_family VALUES(
	21,"乐心智能体脂秤A3-F"
);
INSERT INTO mz_product_family VALUES(
	22,"魅族手环"
);
INSERT INTO mz_product_family VALUES(
	23,"魅族蓝牙小音箱"
);
INSERT INTO mz_product_family VALUES(
	24,"魅蓝 休闲旅行双肩包"
);
INSERT INTO mz_product_family VALUES(
	25,"魅蓝旅行包"
);

#插入产品图片数据
#PRO 7
INSERT INTO mz_product_pic VALUES(
	null,1,"img/product_detail/pro7/sm/mzpro7sm1.jpg","img/product_detail/pro7/md/mzpro7md1.jpg","img/product_detail/pro7/lg/mzpro7lg1.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,1,"img/product_detail/pro7/sm/mzpro7sm2.jpg","img/product_detail/pro7/md/mzpro7md2.jpg","img/product_detail/pro7/lg/mzpro7lg2.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,1,"img/product_detail/pro7/sm/mzpro7sm3.jpg","img/product_detail/pro7/md/mzpro7md3.jpg","img/product_detail/pro7/lg/mzpro7lg3.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,1,"img/product_detail/pro7/sm/mzpro7sm4.jpg","img/product_detail/pro7/md/mzpro7md4.jpg","img/product_detail/pro7/lg/mzpro7lg4.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,2,"img/product_detail/pro7/sm/mzpro7sm1.jpg","img/product_detail/pro7/md/mzpro7md1.jpg","img/product_detail/pro7/lg/mzpro7lg1.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,2,"img/product_detail/pro7/sm/mzpro7sm2.jpg","img/product_detail/pro7/md/mzpro7md2.jpg","img/product_detail/pro7/lg/mzpro7lg2.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,2,"img/product_detail/pro7/sm/mzpro7sm3.jpg","img/product_detail/pro7/md/mzpro7md3.jpg","img/product_detail/pro7/lg/mzpro7lg3.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,2,"img/product_detail/pro7/sm/mzpro7sm4.jpg","img/product_detail/pro7/md/mzpro7md4.jpg","img/product_detail/pro7/lg/mzpro7lg4.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,3,"img/product_detail/pro7/sm/mzpro7sm1g.jpg","img/product_detail/pro7/md/mzpro7md1g.jpg","img/product_detail/pro7/lg/mzpro7lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,3,"img/product_detail/pro7/sm/mzpro7sm2g.jpg","img/product_detail/pro7/md/mzpro7md2g.jpg","img/product_detail/pro7/lg/mzpro7lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,3,"img/product_detail/pro7/sm/mzpro7sm3g.jpg","img/product_detail/pro7/md/mzpro7md3g.jpg","img/product_detail/pro7/lg/mzpro7lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,3,"img/product_detail/pro7/sm/mzpro7sm4g.jpg","img/product_detail/pro7/md/mzpro7md4g.jpg","img/product_detail/pro7/lg/mzpro7lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,4,"img/product_detail/pro7/sm/mzpro7sm1g.jpg","img/product_detail/pro7/md/mzpro7md1g.jpg","img/product_detail/pro7/lg/mzpro7lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,4,"img/product_detail/pro7/sm/mzpro7sm2g.jpg","img/product_detail/pro7/md/mzpro7md2g.jpg","img/product_detail/pro7/lg/mzpro7lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,4,"img/product_detail/pro7/sm/mzpro7sm3g.jpg","img/product_detail/pro7/md/mzpro7md3g.jpg","img/product_detail/pro7/lg/mzpro7lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,4,"img/product_detail/pro7/sm/mzpro7sm4g.jpg","img/product_detail/pro7/md/mzpro7md4g.jpg","img/product_detail/pro7/lg/mzpro7lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,5,"img/product_detail/pro7/sm/mzpro7sm1y.jpg","img/product_detail/pro7/md/mzpro7md1y.jpg","img/product_detail/pro7/lg/mzpro7lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,5,"img/product_detail/pro7/sm/mzpro7sm2y.jpg","img/product_detail/pro7/md/mzpro7md2y.jpg","img/product_detail/pro7/lg/mzpro7lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,5,"img/product_detail/pro7/sm/mzpro7sm3y.jpg","img/product_detail/pro7/md/mzpro7md3y.jpg","img/product_detail/pro7/lg/mzpro7lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,5,"img/product_detail/pro7/sm/mzpro7sm4y.jpg","img/product_detail/pro7/md/mzpro7md4y.jpg","img/product_detail/pro7/lg/mzpro7lg4y.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,6,"img/product_detail/pro7/sm/mzpro7sm1y.jpg","img/product_detail/pro7/md/mzpro7md1y.jpg","img/product_detail/pro7/lg/mzpro7lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,6,"img/product_detail/pro7/sm/mzpro7sm2y.jpg","img/product_detail/pro7/md/mzpro7md2y.jpg","img/product_detail/pro7/lg/mzpro7lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,6,"img/product_detail/pro7/sm/mzpro7sm3y.jpg","img/product_detail/pro7/md/mzpro7md3y.jpg","img/product_detail/pro7/lg/mzpro7lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,6,"img/product_detail/pro7/sm/mzpro7sm4y.jpg","img/product_detail/pro7/md/mzpro7md4y.jpg","img/product_detail/pro7/lg/mzpro7lg4y.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,7,"img/product_detail/pro7/sm/mzpro7sm1h.jpg","img/product_detail/pro7/md/mzpro7md1h.jpg","img/product_detail/pro7/lg/mzpro7lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,7,"img/product_detail/pro7/sm/mzpro7sm2h.jpg","img/product_detail/pro7/md/mzpro7md2h.jpg","img/product_detail/pro7/lg/mzpro7lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,7,"img/product_detail/pro7/sm/mzpro7sm3h.jpg","img/product_detail/pro7/md/mzpro7md3h.jpg","img/product_detail/pro7/lg/mzpro7lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,7,"img/product_detail/pro7/sm/mzpro7sm4h.jpg","img/product_detail/pro7/md/mzpro7md4h.jpg","img/product_detail/pro7/lg/mzpro7lg4h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,8,"img/product_detail/pro7/sm/mzpro7sm1h.jpg","img/product_detail/pro7/md/mzpro7md1h.jpg","img/product_detail/pro7/lg/mzpro7lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,8,"img/product_detail/pro7/sm/mzpro7sm2h.jpg","img/product_detail/pro7/md/mzpro7md2h.jpg","img/product_detail/pro7/lg/mzpro7lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,8,"img/product_detail/pro7/sm/mzpro7sm3h.jpg","img/product_detail/pro7/md/mzpro7md3h.jpg","img/product_detail/pro7/lg/mzpro7lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,8,"img/product_detail/pro7/sm/mzpro7sm4h.jpg","img/product_detail/pro7/md/mzpro7md4h.jpg","img/product_detail/pro7/lg/mzpro7lg4h.jpg"
);

#魅蓝6
INSERT INTO mz_product_pic VALUES(
	null,9,"img/product_detail/meilan6/sm/mzmeilan6sm1g.jpg","img/product_detail/meilan6/md/mzmeilan6md1g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,9,"img/product_detail/meilan6/sm/mzmeilan6sm2g.jpg","img/product_detail/meilan6/md/mzmeilan6md2g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,9,"img/product_detail/meilan6/sm/mzmeilan6sm3g.jpg","img/product_detail/meilan6/md/mzmeilan6md3g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,9,"img/product_detail/meilan6/sm/mzmeilan6sm4g.jpg","img/product_detail/meilan6/md/mzmeilan6md4g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,10,"img/product_detail/meilan6/sm/mzmeilan6sm1g.jpg","img/product_detail/meilan6/md/mzmeilan6md1g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,10,"img/product_detail/meilan6/sm/mzmeilan6sm2g.jpg","img/product_detail/meilan6/md/mzmeilan6md2g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,10,"img/product_detail/meilan6/sm/mzmeilan6sm3g.jpg","img/product_detail/meilan6/md/mzmeilan6md3g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,10,"img/product_detail/meilan6/sm/mzmeilan6sm4g.jpg","img/product_detail/meilan6/md/mzmeilan6md4g.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,11,"img/product_detail/meilan6/sm/mzmeilan6sm1h.jpg","img/product_detail/meilan6/md/mzmeilan6md1h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,11,"img/product_detail/meilan6/sm/mzmeilan6sm2h.jpg","img/product_detail/meilan6/md/mzmeilan6md2h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,11,"img/product_detail/meilan6/sm/mzmeilan6sm3h.jpg","img/product_detail/meilan6/md/mzmeilan6md3h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,11,"img/product_detail/meilan6/sm/mzmeilan6sm4h.jpg","img/product_detail/meilan6/md/mzmeilan6md4h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,12,"img/product_detail/meilan6/sm/mzmeilan6sm1h.jpg","img/product_detail/meilan6/md/mzmeilan6md1h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,12,"img/product_detail/meilan6/sm/mzmeilan6sm2h.jpg","img/product_detail/meilan6/md/mzmeilan6md2h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,12,"img/product_detail/meilan6/sm/mzmeilan6sm3h.jpg","img/product_detail/meilan6/md/mzmeilan6md3h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,12,"img/product_detail/meilan6/sm/mzmeilan6sm4h.jpg","img/product_detail/meilan6/md/mzmeilan6md4h.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,13,"img/product_detail/meilan6/sm/mzmeilan6sm1y.jpg","img/product_detail/meilan6/md/mzmeilan6md1y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,13,"img/product_detail/meilan6/sm/mzmeilan6sm2y.jpg","img/product_detail/meilan6/md/mzmeilan6md2y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,13,"img/product_detail/meilan6/sm/mzmeilan6sm3y.jpg","img/product_detail/meilan6/md/mzmeilan6md3y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,13,"img/product_detail/meilan6/sm/mzmeilan6sm4y.jpg","img/product_detail/meilan6/md/mzmeilan6md4y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4y.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,14,"img/product_detail/meilan6/sm/mzmeilan6sm1y.jpg","img/product_detail/meilan6/md/mzmeilan6md1y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,14,"img/product_detail/meilan6/sm/mzmeilan6sm2y.jpg","img/product_detail/meilan6/md/mzmeilan6md2y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,14,"img/product_detail/meilan6/sm/mzmeilan6sm3y.jpg","img/product_detail/meilan6/md/mzmeilan6md3y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,14,"img/product_detail/meilan6/sm/mzmeilan6sm4y.jpg","img/product_detail/meilan6/md/mzmeilan6md4y.jpg","img/product_detail/meilan6/lg/mzmeilan6lg4y.jpg"
);

#魅蓝note6
INSERT INTO mz_product_pic VALUES(
	null,15,"img/product_detail/note6/sm/mznote6sm1g.jpg","img/product_detail/note6/md/mznote6md1g.jpg","img/product_detail/note6/lg/mznote6lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,15,"img/product_detail/note6/sm/mznote6sm2g.jpg","img/product_detail/note6/md/mznote6md2g.jpg","img/product_detail/note6/lg/mznote6lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,15,"img/product_detail/note6/sm/mznote6sm3g.jpg","img/product_detail/note6/md/mznote6md3g.jpg","img/product_detail/note6/lg/mznote6lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,15,"img/product_detail/note6/sm/mznote6sm4g.jpg","img/product_detail/note6/md/mznote6md4g.jpg","img/product_detail/note6/lg/mznote6lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,16,"img/product_detail/note6/sm/mznote6sm1g.jpg","img/product_detail/note6/md/mznote6md1g.jpg","img/product_detail/note6/lg/mznote6lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,16,"img/product_detail/note6/sm/mznote6sm2g.jpg","img/product_detail/note6/md/mznote6md2g.jpg","img/product_detail/note6/lg/mznote6lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,16,"img/product_detail/note6/sm/mznote6sm3g.jpg","img/product_detail/note6/md/mznote6md3g.jpg","img/product_detail/note6/lg/mznote6lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,16,"img/product_detail/note6/sm/mznote6sm4g.jpg","img/product_detail/note6/md/mznote6md4g.jpg","img/product_detail/note6/lg/mznote6lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,17,"img/product_detail/note6/sm/mznote6sm1q.jpg","img/product_detail/note6/md/mznote6md1q.jpg","img/product_detail/note6/lg/mznote6lg1q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,17,"img/product_detail/note6/sm/mznote6sm2q.jpg","img/product_detail/note6/md/mznote6md2q.jpg","img/product_detail/note6/lg/mznote6lg2q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,17,"img/product_detail/note6/sm/mznote6sm3q.jpg","img/product_detail/note6/md/mznote6md3q.jpg","img/product_detail/note6/lg/mznote6lg3q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,17,"img/product_detail/note6/sm/mznote6sm4q.jpg","img/product_detail/note6/md/mznote6md4q.jpg","img/product_detail/note6/lg/mznote6lg4q.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,18,"img/product_detail/note6/sm/mznote6sm1q.jpg","img/product_detail/note6/md/mznote6md1q.jpg","img/product_detail/note6/lg/mznote6lg1q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,18,"img/product_detail/note6/sm/mznote6sm2q.jpg","img/product_detail/note6/md/mznote6md2q.jpg","img/product_detail/note6/lg/mznote6lg2q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,18,"img/product_detail/note6/sm/mznote6sm3q.jpg","img/product_detail/note6/md/mznote6md3q.jpg","img/product_detail/note6/lg/mznote6lg3q.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,18,"img/product_detail/note6/sm/mznote6sm4q.jpg","img/product_detail/note6/md/mznote6md4q.jpg","img/product_detail/note6/lg/mznote6lg4q.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,19,"img/product_detail/note6/sm/mznote6sm1y.jpg","img/product_detail/note6/md/mznote6md1y.jpg","img/product_detail/note6/lg/mznote6lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,19,"img/product_detail/note6/sm/mznote6sm2y.jpg","img/product_detail/note6/md/mznote6md2y.jpg","img/product_detail/note6/lg/mznote6lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,19,"img/product_detail/note6/sm/mznote6sm3y.jpg","img/product_detail/note6/md/mznote6md3y.jpg","img/product_detail/note6/lg/mznote6lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,19,"img/product_detail/note6/sm/mznote6sm4y.jpg","img/product_detail/note6/md/mznote6md4y.jpg","img/product_detail/note6/lg/mznote6lg4y.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,20,"img/product_detail/note6/sm/mznote6sm1y.jpg","img/product_detail/note6/md/mznote6md1y.jpg","img/product_detail/note6/lg/mznote6lg1y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,20,"img/product_detail/note6/sm/mznote6sm2y.jpg","img/product_detail/note6/md/mznote6md2y.jpg","img/product_detail/note6/lg/mznote6lg2y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,20,"img/product_detail/note6/sm/mznote6sm3y.jpg","img/product_detail/note6/md/mznote6md3y.jpg","img/product_detail/note6/lg/mznote6lg3y.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,20,"img/product_detail/note6/sm/mznote6sm4y.jpg","img/product_detail/note6/md/mznote6md4y.jpg","img/product_detail/note6/lg/mznote6lg4y.jpg"
);

#魅族15
INSERT INTO mz_product_pic VALUES(
	null,21,"img/product_detail/meizu15/sm/mz15sm1g.jpg","img/product_detail/meizu15/md/mz15md1g.jpg","img/product_detail/meizu15/lg/mz15lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,21,"img/product_detail/meizu15/sm/mz15sm2g.jpg","img/product_detail/meizu15/md/mz15md2g.jpg","img/product_detail/meizu15/lg/mz15lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,21,"img/product_detail/meizu15/sm/mz15sm3g.jpg","img/product_detail/meizu15/md/mz15md3g.jpg","img/product_detail/meizu15/lg/mz15lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,21,"img/product_detail/meizu15/sm/mz15sm4g.jpg","img/product_detail/meizu15/md/mz15md4g.jpg","img/product_detail/meizu15/lg/mz15lg4g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,22,"img/product_detail/meizu15/sm/mz15sm1g.jpg","img/product_detail/meizu15/md/mz15md1g.jpg","img/product_detail/meizu15/lg/mz15lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,22,"img/product_detail/meizu15/sm/mz15sm2g.jpg","img/product_detail/meizu15/md/mz15md2g.jpg","img/product_detail/meizu15/lg/mz15lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,22,"img/product_detail/meizu15/sm/mz15sm3g.jpg","img/product_detail/meizu15/md/mz15md3g.jpg","img/product_detail/meizu15/lg/mz15lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,22,"img/product_detail/meizu15/sm/mz15sm4g.jpg","img/product_detail/meizu15/md/mz15md4g.jpg","img/product_detail/meizu15/lg/mz15lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,23,"img/product_detail/meizu15/sm/mz15sm1m.jpg","img/product_detail/meizu15/md/mz15md1m.jpg","img/product_detail/meizu15/lg/mz15lg1m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,23,"img/product_detail/meizu15/sm/mz15sm2m.jpg","img/product_detail/meizu15/md/mz15md2m.jpg","img/product_detail/meizu15/lg/mz15lg2m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,23,"img/product_detail/meizu15/sm/mz15sm3m.jpg","img/product_detail/meizu15/md/mz15md3m.jpg","img/product_detail/meizu15/lg/mz15lg3m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,23,"img/product_detail/meizu15/sm/mz15sm4m.jpg","img/product_detail/meizu15/md/mz15md4m.jpg","img/product_detail/meizu15/lg/mz15lg4m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,24,"img/product_detail/meizu15/sm/mz15sm1m.jpg","img/product_detail/meizu15/md/mz15md1m.jpg","img/product_detail/meizu15/lg/mz15lg1m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,24,"img/product_detail/meizu15/sm/mz15sm2m.jpg","img/product_detail/meizu15/md/mz15md2m.jpg","img/product_detail/meizu15/lg/mz15lg2m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,24,"img/product_detail/meizu15/sm/mz15sm3m.jpg","img/product_detail/meizu15/md/mz15md3m.jpg","img/product_detail/meizu15/lg/mz15lg3m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,24,"img/product_detail/meizu15/sm/mz15sm4m.jpg","img/product_detail/meizu15/md/mz15md4m.jpg","img/product_detail/meizu15/lg/mz15lg4m.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,25,"img/product_detail/meizu15/sm/mz15sm1l.jpg","img/product_detail/meizu15/md/mz15md1l.jpg","img/product_detail/meizu15/lg/mz15lg1l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,25,"img/product_detail/meizu15/sm/mz15sm2l.jpg","img/product_detail/meizu15/md/mz15md2l.jpg","img/product_detail/meizu15/lg/mz15lg2l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,25,"img/product_detail/meizu15/sm/mz15sm3l.jpg","img/product_detail/meizu15/md/mz15md3l.jpg","img/product_detail/meizu15/lg/mz15lg3l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,25,"img/product_detail/meizu15/sm/mz15sm4l.jpg","img/product_detail/meizu15/md/mz15md4l.jpg","img/product_detail/meizu15/lg/mz15lg4l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,26,"img/product_detail/meizu15/sm/mz15sm1l.jpg","img/product_detail/meizu15/md/mz15md1l.jpg","img/product_detail/meizu15/lg/mz15lg1l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,26,"img/product_detail/meizu15/sm/mz15sm2l.jpg","img/product_detail/meizu15/md/mz15md2l.jpg","img/product_detail/meizu15/lg/mz15lg2l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,26,"img/product_detail/meizu15/sm/mz15sm3l.jpg","img/product_detail/meizu15/md/mz15md3l.jpg","img/product_detail/meizu15/lg/mz15lg3l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,26,"img/product_detail/meizu15/sm/mz15sm4l.jpg","img/product_detail/meizu15/md/mz15md4l.jpg","img/product_detail/meizu15/lg/mz15lg4l.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,27,"img/product_detail/meizu15/sm/mz15sm1l.jpg","img/product_detail/meizu15/md/mz15md1l.jpg","img/product_detail/meizu15/lg/mz15lg1l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,27,"img/product_detail/meizu15/sm/mz15sm2l.jpg","img/product_detail/meizu15/md/mz15md2l.jpg","img/product_detail/meizu15/lg/mz15lg2l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,27,"img/product_detail/meizu15/sm/mz15sm3l.jpg","img/product_detail/meizu15/md/mz15md3l.jpg","img/product_detail/meizu15/lg/mz15lg3l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,27,"img/product_detail/meizu15/sm/mz15sm4l.jpg","img/product_detail/meizu15/md/mz15md4l.jpg","img/product_detail/meizu15/lg/mz15lg4l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,28,"img/product_detail/meizu15/sm/mz15sm1l.jpg","img/product_detail/meizu15/md/mz15md1l.jpg","img/product_detail/meizu15/lg/mz15lg1l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,28,"img/product_detail/meizu15/sm/mz15sm2l.jpg","img/product_detail/meizu15/md/mz15md2l.jpg","img/product_detail/meizu15/lg/mz15lg2l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,28,"img/product_detail/meizu15/sm/mz15sm3l.jpg","img/product_detail/meizu15/md/mz15md3l.jpg","img/product_detail/meizu15/lg/mz15lg3l.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,28,"img/product_detail/meizu15/sm/mz15sm4l.jpg","img/product_detail/meizu15/md/mz15md4l.jpg","img/product_detail/meizu15/lg/mz15lg4l.jpg"
);

#魅族15plus
INSERT INTO mz_product_pic VALUES(
	null,29,"img/product_detail/meizu15plus/sm/mz15plussm1g.jpg","img/product_detail/meizu15plus/md/mz15plusmd1g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,29,"img/product_detail/meizu15plus/sm/mz15plussm2g.jpg","img/product_detail/meizu15plus/md/mz15plusmd2g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,29,"img/product_detail/meizu15plus/sm/mz15plussm3g.jpg","img/product_detail/meizu15plus/md/mz15plusmd3g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,29,"img/product_detail/meizu15plus/sm/mz15plussm4g.jpg","img/product_detail/meizu15plus/md/mz15plusmd4g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,30,"img/product_detail/meizu15plus/sm/mz15plussm1g.jpg","img/product_detail/meizu15plus/md/mz15plusmd1g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,30,"img/product_detail/meizu15plus/sm/mz15plussm2g.jpg","img/product_detail/meizu15plus/md/mz15plusmd2g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,30,"img/product_detail/meizu15plus/sm/mz15plussm3g.jpg","img/product_detail/meizu15plus/md/mz15plusmd3g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,30,"img/product_detail/meizu15plus/sm/mz15plussm4g.jpg","img/product_detail/meizu15plus/md/mz15plusmd4g.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,31,"img/product_detail/meizu15plus/sm/mz15plussm1m.jpg","img/product_detail/meizu15plus/md/mz15plusmd1m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,31,"img/product_detail/meizu15plus/sm/mz15plussm2m.jpg","img/product_detail/meizu15plus/md/mz15plusmd2m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,31,"img/product_detail/meizu15plus/sm/mz15plussm3m.jpg","img/product_detail/meizu15plus/md/mz15plusmd3m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,31,"img/product_detail/meizu15plus/sm/mz15plussm4m.jpg","img/product_detail/meizu15plus/md/mz15plusmd4m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,32,"img/product_detail/meizu15plus/sm/mz15plussm1m.jpg","img/product_detail/meizu15plus/md/mz15plusmd1m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,32,"img/product_detail/meizu15plus/sm/mz15plussm2m.jpg","img/product_detail/meizu15plus/md/mz15plusmd2m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,32,"img/product_detail/meizu15plus/sm/mz15plussm3m.jpg","img/product_detail/meizu15plus/md/mz15plusmd3m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3m.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,32,"img/product_detail/meizu15plus/sm/mz15plussm4m.jpg","img/product_detail/meizu15plus/md/mz15plusmd4m.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4m.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,33,"img/product_detail/meizu15plus/sm/mz15plussm1h.jpg","img/product_detail/meizu15plus/md/mz15plusmd1h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,33,"img/product_detail/meizu15plus/sm/mz15plussm2h.jpg","img/product_detail/meizu15plus/md/mz15plusmd2h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,33,"img/product_detail/meizu15plus/sm/mz15plussm3h.jpg","img/product_detail/meizu15plus/md/mz15plusmd3h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,33,"img/product_detail/meizu15plus/sm/mz15plussm4h.jpg","img/product_detail/meizu15plus/md/mz15plusmd4h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,34,"img/product_detail/meizu15plus/sm/mz15plussm1h.jpg","img/product_detail/meizu15plus/md/mz15plusmd1h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,34,"img/product_detail/meizu15plus/sm/mz15plussm2h.jpg","img/product_detail/meizu15plus/md/mz15plusmd2h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,34,"img/product_detail/meizu15plus/sm/mz15plussm3h.jpg","img/product_detail/meizu15plus/md/mz15plusmd3h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,34,"img/product_detail/meizu15plus/sm/mz15plussm4h.jpg","img/product_detail/meizu15plus/md/mz15plusmd4h.jpg","img/product_detail/meizu15plus/lg/mz15pluslg4h.jpg"
);

#魅族M15
INSERT INTO mz_product_pic VALUES(
	null,35,"img/product_detail/meizum15/sm/mzm15sm1h.jpg","img/product_detail/meizum15/md/mzm15md1h.jpg","img/product_detail/meizum15/lg/mzm15lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,35,"img/product_detail/meizum15/sm/mzm15sm2h.jpg","img/product_detail/meizum15/md/mzm15md2h.jpg","img/product_detail/meizum15/lg/mzm15lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,35,"img/product_detail/meizum15/sm/mzm15sm3h.jpg","img/product_detail/meizum15/md/mzm15md3h.jpg","img/product_detail/meizum15/lg/mzm15lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,35,"img/product_detail/meizum15/sm/mzm15sm4h.jpg","img/product_detail/meizum15/md/mzm15md4h.jpg","img/product_detail/meizum15/lg/mzm15lg4h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,36,"img/product_detail/meizum15/sm/mzm15sm1g.jpg","img/product_detail/meizum15/md/mzm15md1g.jpg","img/product_detail/meizum15/lg/mzm15lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,36,"img/product_detail/meizum15/sm/mzm15sm2g.jpg","img/product_detail/meizum15/md/mzm15md2g.jpg","img/product_detail/meizum15/lg/mzm15lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,36,"img/product_detail/meizum15/sm/mzm15sm3g.jpg","img/product_detail/meizum15/md/mzm15md3g.jpg","img/product_detail/meizum15/lg/mzm15lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,36,"img/product_detail/meizum15/sm/mzm15sm4g.jpg","img/product_detail/meizum15/md/mzm15md4g.jpg","img/product_detail/meizum15/lg/mzm15lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,37,"img/product_detail/meizum15/sm/mzm15sm1r.jpg","img/product_detail/meizum15/md/mzm15md1r.jpg","img/product_detail/meizum15/lg/mzm15lg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,37,"img/product_detail/meizum15/sm/mzm15sm2r.jpg","img/product_detail/meizum15/md/mzm15md2r.jpg","img/product_detail/meizum15/lg/mzm15lg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,37,"img/product_detail/meizum15/sm/mzm15sm3r.jpg","img/product_detail/meizum15/md/mzm15md3r.jpg","img/product_detail/meizum15/lg/mzm15lg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,37,"img/product_detail/meizum15/sm/mzm15sm4r.jpg","img/product_detail/meizum15/md/mzm15md4r.jpg","img/product_detail/meizum15/lg/mzm15lg4r.jpg"
);

#魅蓝e3
INSERT INTO mz_product_pic VALUES(
	null,38,"img/product_detail/meilane3/sm/mzmeilane3sm1g.jpg","img/product_detail/meilane3/md/mzmeilane3md1g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,38,"img/product_detail/meilane3/sm/mzmeilane3sm2g.jpg","img/product_detail/meilane3/md/mzmeilane3md2g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,38,"img/product_detail/meilane3/sm/mzmeilane3sm3g.jpg","img/product_detail/meilane3/md/mzmeilane3md3g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,38,"img/product_detail/meilane3/sm/mzmeilane3sm4g.jpg","img/product_detail/meilane3/md/mzmeilane3md4g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg4g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,39,"img/product_detail/meilane3/sm/mzmeilane3sm1g.jpg","img/product_detail/meilane3/md/mzmeilane3md1g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,39,"img/product_detail/meilane3/sm/mzmeilane3sm2g.jpg","img/product_detail/meilane3/md/mzmeilane3md2g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,39,"img/product_detail/meilane3/sm/mzmeilane3sm3g.jpg","img/product_detail/meilane3/md/mzmeilane3md3g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,39,"img/product_detail/meilane3/sm/mzmeilane3sm4g.jpg","img/product_detail/meilane3/md/mzmeilane3md4g.jpg","img/product_detail/meilane3/lg/mzmeilane3lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,40,"img/product_detail/meilane3/sm/mzmeilane3sm1b.jpg","img/product_detail/meilane3/md/mzmeilane3md1b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,40,"img/product_detail/meilane3/sm/mzmeilane3sm2b.jpg","img/product_detail/meilane3/md/mzmeilane3md2b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,40,"img/product_detail/meilane3/sm/mzmeilane3sm3b.jpg","img/product_detail/meilane3/md/mzmeilane3md3b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,40,"img/product_detail/meilane3/sm/mzmeilane3sm4b.jpg","img/product_detail/meilane3/md/mzmeilane3md4b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg4b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,41,"img/product_detail/meilane3/sm/mzmeilane3sm1b.jpg","img/product_detail/meilane3/md/mzmeilane3md1b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,41,"img/product_detail/meilane3/sm/mzmeilane3sm2b.jpg","img/product_detail/meilane3/md/mzmeilane3md2b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,41,"img/product_detail/meilane3/sm/mzmeilane3sm3b.jpg","img/product_detail/meilane3/md/mzmeilane3md3b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,41,"img/product_detail/meilane3/sm/mzmeilane3sm4b.jpg","img/product_detail/meilane3/md/mzmeilane3md4b.jpg","img/product_detail/meilane3/lg/mzmeilane3lg4b.jpg"
);

#魅蓝e2
INSERT INTO mz_product_pic VALUES(
	null,42,"img/product_detail/meilane2/sm/mzmeilane2sm1g.jpg","img/product_detail/meilane2/md/mzmeilane2md1g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,42,"img/product_detail/meilane2/sm/mzmeilane2sm2g.jpg","img/product_detail/meilane2/md/mzmeilane2md2g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,42,"img/product_detail/meilane2/sm/mzmeilane2sm3g.jpg","img/product_detail/meilane2/md/mzmeilane2md3g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,42,"img/product_detail/meilane2/sm/mzmeilane2sm4g.jpg","img/product_detail/meilane2/md/mzmeilane2md4g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,43,"img/product_detail/meilane2/sm/mzmeilane2sm1g.jpg","img/product_detail/meilane2/md/mzmeilane2md1g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,43,"img/product_detail/meilane2/sm/mzmeilane2sm2g.jpg","img/product_detail/meilane2/md/mzmeilane2md2g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,43,"img/product_detail/meilane2/sm/mzmeilane2sm3g.jpg","img/product_detail/meilane2/md/mzmeilane2md3g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,43,"img/product_detail/meilane2/sm/mzmeilane2sm4g.jpg","img/product_detail/meilane2/md/mzmeilane2md4g.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,44,"img/product_detail/meilane2/sm/mzmeilane2sm1s.jpg","img/product_detail/meilane2/md/mzmeilane2md1s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,44,"img/product_detail/meilane2/sm/mzmeilane2sm2s.jpg","img/product_detail/meilane2/md/mzmeilane2md2s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,44,"img/product_detail/meilane2/sm/mzmeilane2sm3s.jpg","img/product_detail/meilane2/md/mzmeilane2md3s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,44,"img/product_detail/meilane2/sm/mzmeilane2sm4s.jpg","img/product_detail/meilane2/md/mzmeilane2md4s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,45,"img/product_detail/meilane2/sm/mzmeilane2sm1s.jpg","img/product_detail/meilane2/md/mzmeilane2md1s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,45,"img/product_detail/meilane2/sm/mzmeilane2sm2s.jpg","img/product_detail/meilane2/md/mzmeilane2md2s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,45,"img/product_detail/meilane2/sm/mzmeilane2sm3s.jpg","img/product_detail/meilane2/md/mzmeilane2md3s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,45,"img/product_detail/meilane2/sm/mzmeilane2sm4s.jpg","img/product_detail/meilane2/md/mzmeilane2md4s.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4s.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,46,"img/product_detail/meilane2/sm/mzmeilane2sm1b.jpg","img/product_detail/meilane2/md/mzmeilane2md1b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,46,"img/product_detail/meilane2/sm/mzmeilane2sm2b.jpg","img/product_detail/meilane2/md/mzmeilane2md2b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,46,"img/product_detail/meilane2/sm/mzmeilane2sm3b.jpg","img/product_detail/meilane2/md/mzmeilane2md3b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,46,"img/product_detail/meilane2/sm/mzmeilane2sm4b.jpg","img/product_detail/meilane2/md/mzmeilane2md4b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,47,"img/product_detail/meilane2/sm/mzmeilane2sm1b.jpg","img/product_detail/meilane2/md/mzmeilane2md1b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,47,"img/product_detail/meilane2/sm/mzmeilane2sm2b.jpg","img/product_detail/meilane2/md/mzmeilane2md2b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,47,"img/product_detail/meilane2/sm/mzmeilane2sm3b.jpg","img/product_detail/meilane2/md/mzmeilane2md3b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,47,"img/product_detail/meilane2/sm/mzmeilane2sm4b.jpg","img/product_detail/meilane2/md/mzmeilane2md4b.jpg","img/product_detail/meilane2/lg/mzmeilane2lg4b.jpg"
);

#华为P10
INSERT INTO mz_product_pic VALUES(
	null,48,"img/product_detail/huaweip10/sm/huaweip10sm1b.jpg","img/product_detail/huaweip10/md/huaweip10md1b.jpg","img/product_detail/huaweip10/lg/huaweip10lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,48,"img/product_detail/huaweip10/sm/huaweip10sm2b.jpg","img/product_detail/huaweip10/md/huaweip10md2b.jpg","img/product_detail/huaweip10/lg/huaweip10lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,48,"img/product_detail/huaweip10/sm/huaweip10sm3b.jpg","img/product_detail/huaweip10/md/huaweip10md3b.jpg","img/product_detail/huaweip10/lg/huaweip10lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,48,"img/product_detail/huaweip10/sm/huaweip10sm4b.jpg","img/product_detail/huaweip10/md/huaweip10md4b.jpg","img/product_detail/huaweip10/lg/huaweip10lg4b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,49,"img/product_detail/huaweip10/sm/huaweip10sm1b.jpg","img/product_detail/huaweip10/md/huaweip10md1b.jpg","img/product_detail/huaweip10/lg/huaweip10lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,49,"img/product_detail/huaweip10/sm/huaweip10sm2b.jpg","img/product_detail/huaweip10/md/huaweip10md2b.jpg","img/product_detail/huaweip10/lg/huaweip10lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,49,"img/product_detail/huaweip10/sm/huaweip10sm3b.jpg","img/product_detail/huaweip10/md/huaweip10md3b.jpg","img/product_detail/huaweip10/lg/huaweip10lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,49,"img/product_detail/huaweip10/sm/huaweip10sm4b.jpg","img/product_detail/huaweip10/md/huaweip10md4b.jpg","img/product_detail/huaweip10/lg/huaweip10lg4b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,50,"img/product_detail/huaweip10/sm/huaweip10sm1g.jpg","img/product_detail/huaweip10/md/huaweip10md1g.jpg","img/product_detail/huaweip10/lg/huaweip10lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,50,"img/product_detail/huaweip10/sm/huaweip10sm2g.jpg","img/product_detail/huaweip10/md/huaweip10md2g.jpg","img/product_detail/huaweip10/lg/huaweip10lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,50,"img/product_detail/huaweip10/sm/huaweip10sm3g.jpg","img/product_detail/huaweip10/md/huaweip10md3g.jpg","img/product_detail/huaweip10/lg/huaweip10lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,50,"img/product_detail/huaweip10/sm/huaweip10sm4g.jpg","img/product_detail/huaweip10/md/huaweip10md4g.jpg","img/product_detail/huaweip10/lg/huaweip10lg4g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,51,"img/product_detail/huaweip10/sm/huaweip10sm1g.jpg","img/product_detail/huaweip10/md/huaweip10md1g.jpg","img/product_detail/huaweip10/lg/huaweip10lg1g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,51,"img/product_detail/huaweip10/sm/huaweip10sm2g.jpg","img/product_detail/huaweip10/md/huaweip10md2g.jpg","img/product_detail/huaweip10/lg/huaweip10lg2g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,51,"img/product_detail/huaweip10/sm/huaweip10sm3g.jpg","img/product_detail/huaweip10/md/huaweip10md3g.jpg","img/product_detail/huaweip10/lg/huaweip10lg3g.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,51,"img/product_detail/huaweip10/sm/huaweip10sm4g.jpg","img/product_detail/huaweip10/md/huaweip10md4g.jpg","img/product_detail/huaweip10/lg/huaweip10lg4g.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,52,"img/product_detail/huaweip10/sm/huaweip10sm1w.jpg","img/product_detail/huaweip10/md/huaweip10md1w.jpg","img/product_detail/huaweip10/lg/huaweip10lg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,52,"img/product_detail/huaweip10/sm/huaweip10sm2w.jpg","img/product_detail/huaweip10/md/huaweip10md2w.jpg","img/product_detail/huaweip10/lg/huaweip10lg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,52,"img/product_detail/huaweip10/sm/huaweip10sm3w.jpg","img/product_detail/huaweip10/md/huaweip10md3w.jpg","img/product_detail/huaweip10/lg/huaweip10lg3w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,52,"img/product_detail/huaweip10/sm/huaweip10sm4w.jpg","img/product_detail/huaweip10/md/huaweip10md4w.jpg","img/product_detail/huaweip10/lg/huaweip10lg4w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,53,"img/product_detail/huaweip10/sm/huaweip10sm1w.jpg","img/product_detail/huaweip10/md/huaweip10md1w.jpg","img/product_detail/huaweip10/lg/huaweip10lg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,53,"img/product_detail/huaweip10/sm/huaweip10sm2w.jpg","img/product_detail/huaweip10/md/huaweip10md2w.jpg","img/product_detail/huaweip10/lg/huaweip10lg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,53,"img/product_detail/huaweip10/sm/huaweip10sm3w.jpg","img/product_detail/huaweip10/md/huaweip10md3w.jpg","img/product_detail/huaweip10/lg/huaweip10lg3w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,53,"img/product_detail/huaweip10/sm/huaweip10sm4w.jpg","img/product_detail/huaweip10/md/huaweip10md4w.jpg","img/product_detail/huaweip10/lg/huaweip10lg4w.jpg"
);

#三星S8
INSERT INTO mz_product_pic VALUES(
	null,54,"img/product_detail/samsungs8/sm/samsungs8sm1b.jpg","img/product_detail/samsungs8/md/samsungs8md1b.jpg","img/product_detail/samsungs8/lg/samsungs8lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,54,"img/product_detail/samsungs8/sm/samsungs8sm2b.jpg","img/product_detail/samsungs8/md/samsungs8md2b.jpg","img/product_detail/samsungs8/lg/samsungs8lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,54,"img/product_detail/samsungs8/sm/samsungs8sm3b.jpg","img/product_detail/samsungs8/md/samsungs8md3b.jpg","img/product_detail/samsungs8/lg/samsungs8lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,54,"img/product_detail/samsungs8/sm/samsungs8sm4b.jpg","img/product_detail/samsungs8/md/samsungs8md4b.jpg","img/product_detail/samsungs8/lg/samsungs8lg4b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,55,"img/product_detail/samsungs8/sm/samsungs8sm1b.jpg","img/product_detail/samsungs8/md/samsungs8md1b.jpg","img/product_detail/samsungs8/lg/samsungs8lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,55,"img/product_detail/samsungs8/sm/samsungs8sm2b.jpg","img/product_detail/samsungs8/md/samsungs8md2b.jpg","img/product_detail/samsungs8/lg/samsungs8lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,55,"img/product_detail/samsungs8/sm/samsungs8sm3b.jpg","img/product_detail/samsungs8/md/samsungs8md3b.jpg","img/product_detail/samsungs8/lg/samsungs8lg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,55,"img/product_detail/samsungs8/sm/samsungs8sm4b.jpg","img/product_detail/samsungs8/md/samsungs8md4b.jpg","img/product_detail/samsungs8/lg/samsungs8lg4b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,56,"img/product_detail/samsungs8/sm/samsungs8sm1r.jpg","img/product_detail/samsungs8/md/samsungs8md1r.jpg","img/product_detail/samsungs8/lg/samsungs8lg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,56,"img/product_detail/samsungs8/sm/samsungs8sm2r.jpg","img/product_detail/samsungs8/md/samsungs8md2r.jpg","img/product_detail/samsungs8/lg/samsungs8lg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,56,"img/product_detail/samsungs8/sm/samsungs8sm3r.jpg","img/product_detail/samsungs8/md/samsungs8md3r.jpg","img/product_detail/samsungs8/lg/samsungs8lg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,56,"img/product_detail/samsungs8/sm/samsungs8sm4r.jpg","img/product_detail/samsungs8/md/samsungs8md4r.jpg","img/product_detail/samsungs8/lg/samsungs8lg4r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,57,"img/product_detail/samsungs8/sm/samsungs8sm1r.jpg","img/product_detail/samsungs8/md/samsungs8md1r.jpg","img/product_detail/samsungs8/lg/samsungs8lg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,57,"img/product_detail/samsungs8/sm/samsungs8sm2r.jpg","img/product_detail/samsungs8/md/samsungs8md2r.jpg","img/product_detail/samsungs8/lg/samsungs8lg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,57,"img/product_detail/samsungs8/sm/samsungs8sm3r.jpg","img/product_detail/samsungs8/md/samsungs8md3r.jpg","img/product_detail/samsungs8/lg/samsungs8lg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,57,"img/product_detail/samsungs8/sm/samsungs8sm4r.jpg","img/product_detail/samsungs8/md/samsungs8md4r.jpg","img/product_detail/samsungs8/lg/samsungs8lg4r.jpg"
);

#魅族EP2X
INSERT INTO mz_product_pic VALUES(
	null,58,"img/product_detail/mzep2x/sm/mzep2xsm1w.jpg","img/product_detail/mzep2x/md/mzep2xmd1w.jpg","img/product_detail/mzep2x/lg/mzep2xlg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,58,"img/product_detail/mzep2x/sm/mzep2xsm2w.jpg","img/product_detail/mzep2x/md/mzep2xmd2w.jpg","img/product_detail/mzep2x/lg/mzep2xlg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,58,"img/product_detail/mzep2x/sm/mzep2xsm3w.jpg","img/product_detail/mzep2x/md/mzep2xmd3w.jpg","img/product_detail/mzep2x/lg/mzep2xlg3w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,58,"img/product_detail/mzep2x/sm/mzep2xsm4w.jpg","img/product_detail/mzep2x/md/mzep2xmd4w.jpg","img/product_detail/mzep2x/lg/mzep2xlg4w.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,59,"img/product_detail/mzep2x/sm/mzep2xsm1b.jpg","img/product_detail/mzep2x/md/mzep2xmd1b.jpg","img/product_detail/mzep2x/lg/mzep2xlg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,59,"img/product_detail/mzep2x/sm/mzep2xsm2b.jpg","img/product_detail/mzep2x/md/mzep2xmd2b.jpg","img/product_detail/mzep2x/lg/mzep2xlg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,59,"img/product_detail/mzep2x/sm/mzep2xsm3b.jpg","img/product_detail/mzep2x/md/mzep2xmd3b.jpg","img/product_detail/mzep2x/lg/mzep2xlg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,59,"img/product_detail/mzep2x/sm/mzep2xsm4b.jpg","img/product_detail/mzep2x/md/mzep2xmd4b.jpg","img/product_detail/mzep2x/lg/mzep2xlg4b.jpg"
);

#魅族POP 真无线蓝牙耳机
INSERT INTO mz_product_pic VALUES(
	null,60,"img/product_detail/mzblueear/sm/mzblueearsm1.jpg","img/product_detail/mzblueear/md/mzblueearmd1.jpg","img/product_detail/mzblueear/lg/mzblueearlg1.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,60,"img/product_detail/mzblueear/sm/mzblueearsm2.jpg","img/product_detail/mzblueear/md/mzblueearmd2.jpg","img/product_detail/mzblueear/lg/mzblueearlg2.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,60,"img/product_detail/mzblueear/sm/mzblueearsm3.jpg","img/product_detail/mzblueear/md/mzblueearmd3.jpg","img/product_detail/mzblueear/lg/mzblueearlg3.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,60,"img/product_detail/mzblueear/sm/mzblueearsm4.jpg","img/product_detail/mzblueear/md/mzblueearmd4.jpg","img/product_detail/mzblueear/lg/mzblueearlg4.jpg"
);

#魅族 HALO 激光蓝牙耳机
INSERT INTO mz_product_pic VALUES(
	null,61,"img/product_detail/mzhaloear/sm/mzhaloearsm1b.jpg","img/product_detail/mzhaloear/md/mzhaloearmd1b.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,61,"img/product_detail/mzhaloear/sm/mzhaloearsm2b.jpg","img/product_detail/mzhaloear/md/mzhaloearmd2b.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,61,"img/product_detail/mzhaloear/sm/mzhaloearsm3b.jpg","img/product_detail/mzhaloear/md/mzhaloearmd3b.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,61,"img/product_detail/mzhaloear/sm/mzhaloearsm4b.jpg","img/product_detail/mzhaloear/md/mzhaloearmd4b.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg4b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,62,"img/product_detail/mzhaloear/sm/mzhaloearsm1r.jpg","img/product_detail/mzhaloear/md/mzhaloearmd1r.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,62,"img/product_detail/mzhaloear/sm/mzhaloearsm2r.jpg","img/product_detail/mzhaloear/md/mzhaloearmd2r.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,62,"img/product_detail/mzhaloear/sm/mzhaloearsm3r.jpg","img/product_detail/mzhaloear/md/mzhaloearmd3r.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,62,"img/product_detail/mzhaloear/sm/mzhaloearsm4r.jpg","img/product_detail/mzhaloear/md/mzhaloearmd4r.jpg","img/product_detail/mzhaloear/lg/mzhaloearlg4r.jpg"
);

#魅族 LIVE四单元动铁耳机
INSERT INTO mz_product_pic VALUES(
	null,63,"img/product_detail/mzliveear/sm/mzliveearsm1.jpg","img/product_detail/mzliveear/md/mzliveearmd1.jpg","img/product_detail/mzliveear/lg/mzliveearlg1.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,63,"img/product_detail/mzliveear/sm/mzliveearsm2.jpg","img/product_detail/mzliveear/md/mzliveearmd2.jpg","img/product_detail/mzliveear/lg/mzliveearlg2.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,63,"img/product_detail/mzliveear/sm/mzliveearsm3.jpg","img/product_detail/mzliveear/md/mzliveearmd3.jpg","img/product_detail/mzliveear/lg/mzliveearlg3.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,63,"img/product_detail/mzliveear/sm/mzliveearsm4.jpg","img/product_detail/mzliveear/md/mzliveearmd4.jpg","img/product_detail/mzliveear/lg/mzliveearlg4.jpg"
);

#魅族 Flow 三单元耳机
INSERT INTO mz_product_pic VALUES(
	null,64,"img/product_detail/mzflowear/sm/mzflowsm1b.jpg","img/product_detail/mzflowear/md/mzflowmd1b.jpg","img/product_detail/mzflowear/lg/mzflowlg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,64,"img/product_detail/mzflowear/sm/mzflowsm2b.jpg","img/product_detail/mzflowear/md/mzflowmd2b.jpg","img/product_detail/mzflowear/lg/mzflowlg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,64,"img/product_detail/mzflowear/sm/mzflowsm3b.jpg","img/product_detail/mzflowear/md/mzflowmd3b.jpg","img/product_detail/mzflowear/lg/mzflowlg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,64,"img/product_detail/mzflowear/sm/mzflowsm4b.jpg","img/product_detail/mzflowear/md/mzflowmd4b.jpg","img/product_detail/mzflowear/lg/mzflowlg4b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,65,"img/product_detail/mzflowear/sm/mzflowsm1s.jpg","img/product_detail/mzflowear/md/mzflowmd1s.jpg","img/product_detail/mzflowear/lg/mzflowlg1s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,65,"img/product_detail/mzflowear/sm/mzflowsm2s.jpg","img/product_detail/mzflowear/md/mzflowmd2s.jpg","img/product_detail/mzflowear/lg/mzflowlg2s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,65,"img/product_detail/mzflowear/sm/mzflowsm3s.jpg","img/product_detail/mzflowear/md/mzflowmd3s.jpg","img/product_detail/mzflowear/lg/mzflowlg3s.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,65,"img/product_detail/mzflowear/sm/mzflowsm4s.jpg","img/product_detail/mzflowear/md/mzflowmd4s.jpg","img/product_detail/mzflowear/lg/mzflowlg4s.jpg"
);

#魅族 EP51蓝牙运动耳机
INSERT INTO mz_product_pic VALUES(
	null,66,"img/product_detail/mzep51ear/sm/mzep51sm1w.jpg","img/product_detail/mzep51ear/md/mzep51md1w.jpg","img/product_detail/mzep51ear/lg/mzep51lg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,66,"img/product_detail/mzep51ear/sm/mzep51sm2w.jpg","img/product_detail/mzep51ear/md/mzep51md2w.jpg","img/product_detail/mzep51ear/lg/mzep51lg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,66,"img/product_detail/mzep51ear/sm/mzep51sm3w.jpg","img/product_detail/mzep51ear/md/mzep51md3w.jpg","img/product_detail/mzep51ear/lg/mzep51lg3w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,66,"img/product_detail/mzep51ear/sm/mzep51sm4w.jpg","img/product_detail/mzep51ear/md/mzep51md4w.jpg","img/product_detail/mzep51ear/lg/mzep51lg4w.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,67,"img/product_detail/mzep51ear/sm/mzep51sm1r.jpg","img/product_detail/mzep51ear/md/mzep51md1r.jpg","img/product_detail/mzep51ear/lg/mzep51lg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,67,"img/product_detail/mzep51ear/sm/mzep51sm2r.jpg","img/product_detail/mzep51ear/md/mzep51md2r.jpg","img/product_detail/mzep51ear/lg/mzep51lg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,67,"img/product_detail/mzep51ear/sm/mzep51sm3r.jpg","img/product_detail/mzep51ear/md/mzep51md3r.jpg","img/product_detail/mzep51ear/lg/mzep51lg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,67,"img/product_detail/mzep51ear/sm/mzep51sm4r.jpg","img/product_detail/mzep51ear/md/mzep51md4r.jpg","img/product_detail/mzep51ear/lg/mzep51lg4r.jpg"
);

#魅蓝EP52蓝牙耳机
INSERT INTO mz_product_pic VALUES(
	null,68,"img/product_detail/mzep52ear/sm/mzep52sm1r.jpg","img/product_detail/mzep52ear/md/mzep52md1r.jpg","img/product_detail/mzep52ear/lg/mzep52lg1r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,68,"img/product_detail/mzep52ear/sm/mzep52sm2r.jpg","img/product_detail/mzep52ear/md/mzep52md2r.jpg","img/product_detail/mzep52ear/lg/mzep52lg2r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,68,"img/product_detail/mzep52ear/sm/mzep52sm3r.jpg","img/product_detail/mzep52ear/md/mzep52md3r.jpg","img/product_detail/mzep52ear/lg/mzep52lg3r.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,68,"img/product_detail/mzep52ear/sm/mzep52sm4r.jpg","img/product_detail/mzep52ear/md/mzep52md4r.jpg","img/product_detail/mzep52ear/lg/mzep52lg4r.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,69,"img/product_detail/mzep52ear/sm/mzep52sm1h.jpg","img/product_detail/mzep52ear/md/mzep52md1h.jpg","img/product_detail/mzep52ear/lg/mzep52lg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,69,"img/product_detail/mzep52ear/sm/mzep52sm2h.jpg","img/product_detail/mzep52ear/md/mzep52md2h.jpg","img/product_detail/mzep52ear/lg/mzep52lg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,69,"img/product_detail/mzep52ear/sm/mzep52sm3h.jpg","img/product_detail/mzep52ear/md/mzep52md3h.jpg","img/product_detail/mzep52ear/lg/mzep52lg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,69,"img/product_detail/mzep52ear/sm/mzep52sm4h.jpg","img/product_detail/mzep52ear/md/mzep52md4h.jpg","img/product_detail/mzep52ear/lg/mzep52lg4h.jpg"
);

#魅族HD50 头戴式耳机
INSERT INTO mz_product_pic VALUES(
	null,70,"img/product_detail/mzhd50ear/sm/mzhd50sm1b.jpg","img/product_detail/mzhd50ear/md/mzhd50md1b.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,70,"img/product_detail/mzhd50ear/sm/mzhd50sm2b.jpg","img/product_detail/mzhd50ear/md/mzhd50md2b.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,70,"img/product_detail/mzhd50ear/sm/mzhd50sm3b.jpg","img/product_detail/mzhd50ear/md/mzhd50md3b.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg3b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,71,"img/product_detail/mzhd50ear/sm/mzhd50sm1w.jpg","img/product_detail/mzhd50ear/md/mzhd50md1w.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,71,"img/product_detail/mzhd50ear/sm/mzhd50sm2w.jpg","img/product_detail/mzhd50ear/md/mzhd50md2w.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,71,"img/product_detail/mzhd50ear/sm/mzhd50sm3w.jpg","img/product_detail/mzhd50ear/md/mzhd50md3w.jpg","img/product_detail/mzhd50ear/lg/mzhd50lg3w.jpg"
);

#魅蓝双向闪充移动电源
INSERT INTO mz_product_pic VALUES(
	null,72,"img/product_detail/mzyidong/sm/mzyidongsm1h.jpg","img/product_detail/mzyidong/md/mzyidongmd1h.jpg","img/product_detail/mzyidong/lg/mzyidonglg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,72,"img/product_detail/mzyidong/sm/mzyidongsm2h.jpg","img/product_detail/mzyidong/md/mzyidongmd2h.jpg","img/product_detail/mzyidong/lg/mzyidonglg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,72,"img/product_detail/mzyidong/sm/mzyidongsm3h.jpg","img/product_detail/mzyidong/md/mzyidongmd3h.jpg","img/product_detail/mzyidong/lg/mzyidonglg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,72,"img/product_detail/mzyidong/sm/mzyidongsm4h.jpg","img/product_detail/mzyidong/md/mzyidongmd4h.jpg","img/product_detail/mzyidong/lg/mzyidonglg4h.jpg"
);

#魅蓝20寸旅行箱 酷MA萌定制版
INSERT INTO mz_product_pic VALUES(
	null,73,"img/product_detail/mzbox/sm/mzboxsm1b.jpg","img/product_detail/mzbox/md/mzboxmd1b.jpg","img/product_detail/mzbox/lg/mzboxlg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,73,"img/product_detail/mzbox/sm/mzboxsm2b.jpg","img/product_detail/mzbox/md/mzboxmd2b.jpg","img/product_detail/mzbox/lg/mzboxlg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,73,"img/product_detail/mzbox/sm/mzboxsm3b.jpg","img/product_detail/mzbox/md/mzboxmd3b.jpg","img/product_detail/mzbox/lg/mzboxlg3b.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,74,"img/product_detail/mzbox/sm/mzboxsm1r.jpg","img/product_detail/mzbox/md/mzboxmd1r.jpg","img/product_detail/mzbox/lg/mzboxlg1r.jpg"
);

#乐心智能体脂秤A3-F
INSERT INTO mz_product_pic VALUES(
	null,75,"img/product_detail/lexintizhicheng/sm/lexintizhichengsm1w.jpg","img/product_detail/lexintizhicheng/md/lexintizhichengmd1w.jpg","img/product_detail/lexintizhicheng/lg/lexintizhichenglg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,75,"img/product_detail/lexintizhicheng/sm/lexintizhichengsm2w.jpg","img/product_detail/lexintizhicheng/md/lexintizhichengmd2w.jpg","img/product_detail/lexintizhicheng/lg/lexintizhichenglg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,75,"img/product_detail/lexintizhicheng/sm/lexintizhichengsm3w.jpg","img/product_detail/lexintizhicheng/md/lexintizhichengmd3w.jpg","img/product_detail/lexintizhicheng/lg/lexintizhichenglg3w.jpg"
);

#魅族手环
INSERT INTO mz_product_pic VALUES(
	null,76,"img/product_detail/mzshouhuan/sm/mzshouhuansm1b.jpg","img/product_detail/mzshouhuan/md/mzshouhuanmd1b.jpg","img/product_detail/mzshouhuan/lg/mzshouhuanlg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,76,"img/product_detail/mzshouhuan/sm/mzshouhuansm2b.jpg","img/product_detail/mzshouhuan/md/mzshouhuanmd2b.jpg","img/product_detail/mzshouhuan/lg/mzshouhuanlg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,76,"img/product_detail/mzshouhuan/sm/mzshouhuansm3b.jpg","img/product_detail/mzshouhuan/md/mzshouhuanmd3b.jpg","img/product_detail/mzshouhuan/lg/mzshouhuanlg3b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,76,"img/product_detail/mzshouhuan/sm/mzshouhuansm4b.jpg","img/product_detail/mzshouhuan/md/mzshouhuanmd4b.jpg","img/product_detail/mzshouhuan/lg/mzshouhuanlg4b.jpg"
);


#魅族蓝牙小音箱
INSERT INTO mz_product_pic VALUES(
	null,77,"img/product_detail/mzxyx/sm/mzxyxsm1h.jpg","img/product_detail/mzxyx/md/mzxyxmd1h.jpg","img/product_detail/mzxyx/lg/mzxyxlg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,77,"img/product_detail/mzxyx/sm/mzxyxsm2h.jpg","img/product_detail/mzxyx/md/mzxyxmd2h.jpg","img/product_detail/mzxyx/lg/mzxyxlg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,77,"img/product_detail/mzxyx/sm/mzxyxsm3h.jpg","img/product_detail/mzxyx/md/mzxyxmd3h.jpg","img/product_detail/mzxyx/lg/mzxyxlg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,77,"img/product_detail/mzxyx/sm/mzxyxsm4h.jpg","img/product_detail/mzxyx/md/mzxyxmd4h.jpg","img/product_detail/mzxyx/lg/mzxyxlg4h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,78,"img/product_detail/mzxyx/sm/mzxyxsm1w.jpg","img/product_detail/mzxyx/md/mzxyxmd1w.jpg","img/product_detail/mzxyx/lg/mzxyxlg1w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,78,"img/product_detail/mzxyx/sm/mzxyxsm2w.jpg","img/product_detail/mzxyx/md/mzxyxmd2w.jpg","img/product_detail/mzxyx/lg/mzxyxlg2w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,78,"img/product_detail/mzxyx/sm/mzxyxsm3w.jpg","img/product_detail/mzxyx/md/mzxyxmd3w.jpg","img/product_detail/mzxyx/lg/mzxyxlg3w.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,78,"img/product_detail/mzxyx/sm/mzxyxsm4w.jpg","img/product_detail/mzxyx/md/mzxyxmd4w.jpg","img/product_detail/mzxyx/lg/mzxyxlg4w.jpg"
);

#魅蓝 休闲旅行双肩包
INSERT INTO mz_product_pic VALUES(
	null,79,"img/product_detail/mzxxbb/sm/mzxxbbsm1h.jpg","img/product_detail/mzxxbb/md/mzxxbbmd1h.jpg","img/product_detail/mzxxbb/lg/mzxxbblg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,79,"img/product_detail/mzxxbb/sm/mzxxbbsm2h.jpg","img/product_detail/mzxxbb/md/mzxxbbmd2h.jpg","img/product_detail/mzxxbb/lg/mzxxbblg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,79,"img/product_detail/mzxxbb/sm/mzxxbbsm3h.jpg","img/product_detail/mzxxbb/md/mzxxbbmd3h.jpg","img/product_detail/mzxxbb/lg/mzxxbblg3h.jpg"
);

INSERT INTO mz_product_pic VALUES(
	null,80,"img/product_detail/mzxxbb/sm/mzxxbbsm1b.jpg","img/product_detail/mzxxbb/md/mzxxbbmd1b.jpg","img/product_detail/mzxxbb/lg/mzxxbblg1b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,80,"img/product_detail/mzxxbb/sm/mzxxbbsm2b.jpg","img/product_detail/mzxxbb/md/mzxxbbmd2b.jpg","img/product_detail/mzxxbb/lg/mzxxbblg2b.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,80,"img/product_detail/mzxxbb/sm/mzxxbbsm3b.jpg","img/product_detail/mzxxbb/md/mzxxbbmd3b.jpg","img/product_detail/mzxxbb/lg/mzxxbblg3b.jpg"
);

#魅蓝旅行包
INSERT INTO mz_product_pic VALUES(
	null,81,"img/product_detail/mzlxb/sm/mzlxbsm1h.jpg","img/product_detail/mzlxb/md/mzlxbmd1h.jpg","img/product_detail/mzlxb/lg/mzlxblg1h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,81,"img/product_detail/mzlxb/sm/mzlxbsm2h.jpg","img/product_detail/mzlxb/md/mzlxbmd2h.jpg","img/product_detail/mzlxb/lg/mzlxblg2h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,81,"img/product_detail/mzlxb/sm/mzlxbsm3h.jpg","img/product_detail/mzlxb/md/mzlxbmd3h.jpg","img/product_detail/mzlxb/lg/mzlxblg3h.jpg"
);
INSERT INTO mz_product_pic VALUES(
	null,81,"img/product_detail/mzlxb/sm/mzlxbsm4h.jpg","img/product_detail/mzlxb/md/mzlxbmd4h.jpg","img/product_detail/mzlxb/lg/mzlxblg4h.jpg"
);

#插入产品表的内容
#魅族pro7
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1299.00,
	null,
	"静谧黑 4GB+64GB",
	"img/product_detail/pro7/black.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1599.00,
	null,
	"静谧黑 4GB+128GB",
	"img/product_detail/pro7/black.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1299.00,
	null,
	"香槟金 4GB+64GB",
	"img/product_detail/pro7/gold.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1599.00,
	null,
	"香槟金 4GB+128GB",
	"img/product_detail/pro7/gold.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1299.00,
	null,
	"曜影黑 4GB+64GB",
	"img/product_detail/pro7/black-y.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1599.00,
	null,
	"曜影黑 4GB+128GB",
	"img/product_detail/pro7/black-y.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1299.00,
	null,
	"提香红 4GB+64GB",
	"img/product_detail/pro7/red.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	1,
	"魅族 PRO 7",
	"年中大促 PRO 7系列最高优惠1200元",
	1599.00,
	null,
	"提香红 4GB+128GB",
	"img/product_detail/pro7/red.png",
	'<img src="img/product_detail/pro7/details/info1.jpg" alt="" /><img src="img/product_detail/pro7/details/info2.jpg" alt="" /><img src="img/product_detail/pro7/details/info3.jpg" alt="" /><img src="img/product_detail/pro7/details/info4.jpg" alt="" /><img src="img/product_detail/pro7/details/info5.jpg" alt="" /><img src="img/product_detail/pro7/details/info6.jpg" alt="" /><img src="img/product_detail/pro7/details/info7.jpg" alt="" /><img src="img/product_detail/pro7/details/info8.jpg" alt="" /><img src="img/product_detail/pro7/details/info9.jpg" alt="" /><img src="img/product_detail/pro7/details/info10.jpg" alt="" /><img src="img/product_detail/pro7/details/info11.jpg" alt="" /><img src="img/product_detail/pro7/details/info12.jpg" alt="" /><img src="img/product_detail/pro7/details/info13.jpg" alt="" /><img src="img/product_detail/pro7/details/info14.jpg" alt="" /><img src="img/product_detail/pro7/details/info15.jpg" alt="" /><img src="img/product_detail/pro7/details/info16.jpg" alt="" /><img src="img/product_detail/pro7/details/info17.jpg" alt="" /><img src="img/product_detail/pro7/details/info18.jpg" alt="" /><img src="img/product_detail/pro7/details/info19.jpg" alt="" /><img src="img/product_detail/pro7/details/info20.jpg" alt="" /><img src="img/product_detail/pro7/details/info21.jpg" alt="" /><img src="img/product_detail/pro7/details/info22.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>PRO 7</td></tr><tr class="desc"><td>尺寸</td><td>147.62*70.72*7.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>163g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>350cd/m²（典型值）</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><tr class="desc"><td>画屏</td><td>尺寸：1.9英寸<br>分辨率：240x536<br>对比度：10000:1<br>PPI：307<br>亮度：350cd/m²（典型值）<br>显示技术：AMOLED<br>制造工艺：On-cell<br></td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB（eMMC5.1）<br>128GB（UFS2.1）</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>标准版：Helio P25处理器(8核)高配版：Helio X30处理器(10核10纳米，最高主频2.6GHz)</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器（标准版）、IMG PowerVR 7XTP图形处理器（高配版）</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX386 1200万像素黑白摄像头+1200万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持三大运营商网络使用双卡NANO SIM</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络（标准版）<br>802.11 a/b/g/n/ac无线网络（高配版）</td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br>手机保护壳x 1</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>标准版（4G+64G）：静谧黑、香槟金、提香红高配版（4G+128G）：静谧黑、香槟金、提香红、曜影黑（亮面拉丝工艺）金属化一体机身，细密优雅的拉丝纹理，更为贴边的天线处理。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别，并将指纹识别速度提升了25%，除了支付宝和微信外，还覆盖了更多的支付场景。更快更便捷的指纹支付，PRO 7为您呈现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏尺寸是多大？分辨率是多少？屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：5.2英寸，1920 X 1080，显示技术：Super AMOLED，制造工艺：On-cell。画屏：1.9英寸，显示技术：AMOLED，制造工艺：On-cell。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7主屏幕、画屏的PPI和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>主屏幕：423 PPI，亮度：350cd/m²（典型值）画屏：307 PPI，亮度：350cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7是否使用独立音频处理芯片?</p><p><img src="img/product_detail/a.png"alt=""/>我们为PRO 7带来了一颗独立音频处理芯片CS 43130。高动态、低失真、大推力，使得声音的每一处细节都纯净自然、悠扬悦耳，为您带来「声」临其境的听觉享受。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，移动定制版仅在未插入移动卡时可以启用联通或电信4G网络。支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>标准版：搭载高性能低功耗的Helio P25处理器。高配版：搭载更先进的10纳米制程工艺的Helio X30处理器。PRO 7标准版及高配版均采用4G大内存，给您更加流畅的使用体验。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7闪存是否采用UFS 2.1方案？</p><p><img src="img/product_detail/a.png"alt=""/>64G标准版：采用eMMC 5.1闪存方案，128G高配版：采用UFS 2.1闪存方案。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1200万像素黑白摄像头+1200万彩色摄像头，ƒ/2.0大光圈，双色温双闪光灯，人像背景虚化模式。前置摄像头：1600万像素，ƒ/2.0大光圈，ArcSoft®美颜算法，暗光环境下，自动开启像素四合一算法，感光性能提升近一倍。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>PRO 7的电池规格？是否支持mCharge安全快充？是否配备Type-C接口？</p><p><img src="img/product_detail/a.png"alt=""/>3000mAh（典型值），支持mCharge安全快充，配备Type-C接口。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

#魅蓝6
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 2GB+16GB",
	"img/product_detail/meilan6/gold.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	799.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 3GB+32GB",
	"img/product_detail/meilan6/gold.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"磨砂黑 2GB+16GB",
	"img/product_detail/meilan6/black.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	799.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"磨砂黑 3GB+32GB",
	"img/product_detail/meilan6/black.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"月光银 2GB+16GB",
	"img/product_detail/meilan6/sliver.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	2,
	"魅蓝 6",
	"6月年中大促 限时优惠领券最高立减150元",
	799.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满599减50</span><span class="desc">满799减150</span><a href="javascript:">更多&gt;</a></div>',
	"月光银 3GB+32GB",
	"img/product_detail/meilan6/sliver.png",
	'<img src="img/product_detail/meilan6/details/info1.jpg"alt=""/><img src="img/product_detail/meilan6/details/info2.jpg"alt=""/><img src="img/product_detail/meilan6/details/info3.jpg"alt=""/><img src="img/product_detail/meilan6/details/info4.jpg"alt=""/><img src="img/product_detail/meilan6/details/info5.jpg"alt=""/><img src="img/product_detail/meilan6/details/info6.jpg"alt=""/><img src="img/product_detail/meilan6/details/info7.jpg"alt=""/><img src="img/product_detail/meilan6/details/info8.jpg"alt=""/><img src="img/product_detail/meilan6/details/info9.jpg"alt=""/><img src="img/product_detail/meilan6/details/info10.jpg"alt=""/><img src="img/product_detail/meilan6/details/info11.jpg"alt=""/><img src="img/product_detail/meilan6/details/info12.jpg"alt=""/><img src="img/product_detail/meilan6/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝6</td></tr><tr class="desc"><td>尺寸</td><td>148.2*72.8*8.3mm</td></tr><tr class="desc"><td>电池容量</td><td>3070mAh</td></tr><tr class="desc"><td>重量</td><td>143g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.2英寸</td></tr><tr class="desc"><td>分辨率</td><td>1280 x 720</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>2GB（仅限16G版本）、3GB（仅限32G版本）</td></tr><tr class="desc"><td>机身内存</td><td>16GB<br>32GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>MT6750处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T860图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™1.5 GHz x4+<br>ARM®Cortex®-A53™1.0GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈4片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万/2.0光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.1</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>磨砂黑、月光银、电光蓝、香槟金，聚碳酸酯一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支付宝和微信的指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.2英寸，1280 X 720，制造工艺：GFF全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>282 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>MT6750八核心处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB。最高支持128G存储卡。2GB/3GB LPDDR3高速省电大内存。。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：1300万像摄像头，ƒ/2.2大光圈，双色温双闪光灯。前置摄像头：800万像素，ƒ/2.0大光圈，配合虹软美颜算法。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝6的电池规格？</p><p><img src="img/product_detail/a.png"alt=""/>3070mAh（典型值）。</p></div>',
	1529308541632,
	3000,
	true,
	1
);

#魅蓝note6
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1299减200</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 3GB+32GB",
	"img/product_detail/note6/gold.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	1099.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1099减150</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 4GB+32GB",
	"img/product_detail/note6/gold.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1099减150</span><a href="javascript:">更多&gt;</a></div>',
	"孔雀青 3GB+32GB",
	"img/product_detail/note6/cyan.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	1099.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1099减150</span><a href="javascript:">更多&gt;</a></div>',
	"孔雀青 4GB+32GB",
	"img/product_detail/note6/cyan.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1099减150</span><a href="javascript:">更多&gt;</a></div>',
	"皓月银 3GB+32GB",
	"img/product_detail/note6/sliver.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	3,
	"魅蓝 Note6",
	"6月年中大促 限时领券最高减200元 享6期免息",
	1099.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减100</span><span class="desc">满1099减150</span><a href="javascript:">更多&gt;</a></div>',
	"皓月银 4GB+32GB",
	"img/product_detail/note6/sliver.png",
	'<img src="img/product_detail/note6/details/info1.jpg"alt=""/><img src="img/product_detail/note6/details/info2.jpg"alt=""/><img src="img/product_detail/note6/details/info3.jpg"alt=""/><img src="img/product_detail/note6/details/info4.jpg"alt=""/><img src="img/product_detail/note6/details/info5.jpg"alt=""/><img src="img/product_detail/note6/details/info6.jpg"alt=""/><img src="img/product_detail/note6/details/info7.jpg"alt=""/><img src="img/product_detail/note6/details/info8.jpg"alt=""/><img src="img/product_detail/note6/details/info9.jpg"alt=""/><img src="img/product_detail/note6/details/info10.jpg"alt=""/><img src="img/product_detail/note6/details/info11.jpg"alt=""/><img src="img/product_detail/note6/details/info12.jpg"alt=""/><img src="img/product_detail/note6/details/info13.jpg"alt=""/><img src="img/product_detail/note6/details/info14.jpg"alt=""/><img src="img/product_detail/note6/details/info15.jpg"alt=""/><img src="img/product_detail/note6/details/info16.jpg"alt=""/><img src="img/product_detail/note6/details/info17.jpg"alt=""/><img src="img/product_detail/note6/details/info18.jpg"alt=""/><img src="img/product_detail/note6/details/info19.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝Note6</td></tr><tr class="desc"><td>尺寸</td><td>154.6*75.2*8.35mm</td></tr><tr class="desc"><td>电池容量</td><td>4000mAh</td></tr><tr class="desc"><td>重量</td><td>173g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><tr class="desc"><td>制造工艺</td><td>GFF方案（全贴合）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB/4GB</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙625高性能处理器</td></tr><tr class="desc"><td>GPU</td><td>Adreno™506图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.0GHz x 8</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>1600万像素ƒ/2.0光圈5片式镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素黑白摄像头+500万像素彩色摄像头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6套餐内容有哪些？</p><p><img src="img/product_detail/a.png"alt=""/>优惠套餐一：手机+三星存储卡32G+高透保护膜+EP21耳机；<br>优惠套餐二：手机+三星存储卡32G+EP2X耳机；<br>优惠套餐三：手机+ME20入耳式耳机+高透保护膜；<br>优惠套餐四：手机+三星存储卡64G+高透保护膜+亲肤保护壳<br>优惠套餐五：手机+三星存储卡32G+Skullcandy Merge入耳式耳机<br>优惠套餐六：手机+Skullcandy Merge入耳式耳机+全贴合防爆保护膜；<br>优惠套餐七：手机+三星存储卡32G+全贴合防爆保护膜<br>优惠套餐八：手机+JBL T120A立体声入耳式耳机</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>曜石黑、孔雀青、皓月银、香槟金，金属一体化机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置摄像头：<br>1200万像摄像头，ƒ/1.9超大光圈+500万摄像头，ƒ/2.0大光圈，双摄人像背景虚化，双色温4-LED流水式闪光灯。<br>前置摄像头：<br>1600万像素，ƒ/2.0大光圈，配合虹软美颜算法，更显肤色的质感与自然。<br></p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的CPU是什么型号？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝Note6采用来自高通骁龙625八核心处理器，它具备高达2.0GHz的主频。超低功耗的14nm LPP先进制程，让魅蓝Note6带来了舒心的续航表现。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>4000mAh（典型值），提供18W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6存储容量分别为多少？是否支持存储卡拓展？内存分别为多少？</p><p><img src="img/product_detail/a.png"alt=""/>16GB/32GB/64GB。最高支持128G存储卡。3GB/4GB LPDDR3高速省电大内存。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕PPI和亮度为多少？</p><p><img src="img/product_detail/a.png"alt=""/>6403 PPI，亮度：450cd/m²（典型值）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s的指纹识别解锁，支持支付宝和微信的指纹支付，更有助于手机隐私的安全保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝Note6屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，1920 X 1080，制造工艺：GFF全贴合。</p></div>',
	1529308541632,
	3000,
	true,
	1
);

#魅族15
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2499.00,
	null,
	"雅金 4GB+64GB",
	"img/product_detail/meizu15/gold.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2799.00,
	null,
	"雅金 4GB+128GB",
	"img/product_detail/meizu15/gold.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2499.00,
	null,
	"砚墨 4GB+64GB",
	"img/product_detail/meizu15/ink.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2799.00,
	null,
	"砚墨 4GB+128GB",
	"img/product_detail/meizu15/ink.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2499.00,
	null,
	"黛蓝 4GB+64GB",
	"img/product_detail/meizu15/blue.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2799.00,
	null,
	"黛蓝 4GB+128GB",
	"img/product_detail/meizu15/blue.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2499.00,
	null,
	"汝窑白 4GB+64GB",
	"img/product_detail/meizu15/white.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	4,
	"魅族 15",
	"2000万暗光双摄， AI智能美颜",
	2799.00,
	null,
	"汝窑白 4GB+128GB",
	"img/product_detail/meizu15/white.png",
	'<img src="img/product_detail/meizu15/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15</td></tr><tr class="desc"><td>尺寸</td><td>143*72*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>152g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙660</td></tr><tr class="desc"><td>GPU</td><td>Adreno 512</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);

#魅族15 Plus
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	2999.00,
	null,
	"雅金 6GB+64GB",
	"img/product_detail/meizu15plus/gold.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	3299.00,
	null,
	"雅金 6GB+128GB",
	"img/product_detail/meizu15plus/gold.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	2999.00,
	null,
	"砚墨 6GB+64GB",
	"img/product_detail/meizu15plus/ink.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	3299.00,
	null,
	"砚墨 6GB+128GB",
	"img/product_detail/meizu15plus/ink.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	2999.00,
	null,
	"玄武灰 6GB+64GB",
	"img/product_detail/meizu15plus/gray.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	5,
	"魅族 15 Plus",
	"定制全面屏，人机交互新体验",
	3299.00,
	null,
	"玄武灰 6GB+128GB",
	"img/product_detail/meizu15plus/gray.png",
	'<img src="img/product_detail/meizu15plus/details/info1.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info2.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info3.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info4.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info5.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info6.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info7.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info8.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info9.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info10.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info11.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info12.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info13.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info14.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info15.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info16.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info17.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info18.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info19.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info20.jpg"alt=""/><img src="img/product_detail/meizu15plus/details/info21.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族15 Plus</td></tr><tr class="desc"><td>尺寸</td><td>153.8*78.25*7.25mm</td></tr><tr class="desc"><td>电池容量</td><td>3500mAh</td></tr><tr class="desc"><td>重量</td><td>172g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.95英寸</td></tr><tr class="desc"><td>分辨率</td><td>2560×1440</td></tr><tr class="desc"><td>PPI</td><td>494</td></tr><tr class="desc"><td>显示技术</td><td>Super AMOLED</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>三星Exynos 8895</td></tr><tr class="desc"><td>GPU</td><td>Mali-G71</td></tr><tr class="desc"><td>CPU频率</td><td>2.3GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 380+索尼IMX 350 1200万像素+2000万像素双摄</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	4500,
	true,
	1
);

#魅族M15
INSERT INTO mz_product VALUES(
	null,
	6,
	"魅族 M15",
	"魅族 15 青春版，支持人脸识别，抬腕即解锁",
	1699.00,
	null,
	"曜岩黑 4GB+64GB",
	"img/product_detail/meizum15/black.png",
	'<img src="img/product_detail/meizum15/details/info1.jpg"alt=""/><img src="img/product_detail/meizum15/details/info2.jpg"alt=""/><img src="img/product_detail/meizum15/details/info3.jpg"alt=""/><img src="img/product_detail/meizum15/details/info4.jpg"alt=""/><img src="img/product_detail/meizum15/details/info5.jpg"alt=""/><img src="img/product_detail/meizum15/details/info6.jpg"alt=""/><img src="img/product_detail/meizum15/details/info7.jpg"alt=""/><img src="img/product_detail/meizum15/details/info8.jpg"alt=""/><img src="img/product_detail/meizum15/details/info9.jpg"alt=""/><img src="img/product_detail/meizum15/details/info10.jpg"alt=""/><img src="img/product_detail/meizum15/details/info11.jpg"alt=""/><img src="img/product_detail/meizum15/details/info12.jpg"alt=""/><img src="img/product_detail/meizum15/details/info13.jpg"alt=""/><img src="img/product_detail/meizum15/details/info14.jpg"alt=""/><img src="img/product_detail/meizum15/details/info15.jpg"alt=""/><img src="img/product_detail/meizum15/details/info16.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族M15</td></tr><tr class="desc"><td>尺寸</td><td>143.62*72.38*7.45mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>500cd/㎡（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙626</td></tr><tr class="desc"><td>GPU</td><td>Adreno 506</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 362 1200万像素ƒ/1.9大光圈</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	5000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	6,
	"魅族 M15",
	"魅族 15 青春版，支持人脸识别，抬腕即解锁",
	1699.00,
	null,
	"砂砾金 4GB+64GB",
	"img/product_detail/meizum15/gold.png",
	'<img src="img/product_detail/meizum15/details/info1.jpg"alt=""/><img src="img/product_detail/meizum15/details/info2.jpg"alt=""/><img src="img/product_detail/meizum15/details/info3.jpg"alt=""/><img src="img/product_detail/meizum15/details/info4.jpg"alt=""/><img src="img/product_detail/meizum15/details/info5.jpg"alt=""/><img src="img/product_detail/meizum15/details/info6.jpg"alt=""/><img src="img/product_detail/meizum15/details/info7.jpg"alt=""/><img src="img/product_detail/meizum15/details/info8.jpg"alt=""/><img src="img/product_detail/meizum15/details/info9.jpg"alt=""/><img src="img/product_detail/meizum15/details/info10.jpg"alt=""/><img src="img/product_detail/meizum15/details/info11.jpg"alt=""/><img src="img/product_detail/meizum15/details/info12.jpg"alt=""/><img src="img/product_detail/meizum15/details/info13.jpg"alt=""/><img src="img/product_detail/meizum15/details/info14.jpg"alt=""/><img src="img/product_detail/meizum15/details/info15.jpg"alt=""/><img src="img/product_detail/meizum15/details/info16.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族M15</td></tr><tr class="desc"><td>尺寸</td><td>143.62*72.38*7.45mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>500cd/㎡（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙626</td></tr><tr class="desc"><td>GPU</td><td>Adreno 506</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 362 1200万像素ƒ/1.9大光圈</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	5000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	6,
	"魅族 M15",
	"魅族 15 青春版，支持人脸识别，抬腕即解锁",
	1699.00,
	null,
	"朱雀红 4GB+64GB",
	"img/product_detail/meizum15/red.png",
	'<img src="img/product_detail/meizum15/details/info1.jpg"alt=""/><img src="img/product_detail/meizum15/details/info2.jpg"alt=""/><img src="img/product_detail/meizum15/details/info3.jpg"alt=""/><img src="img/product_detail/meizum15/details/info4.jpg"alt=""/><img src="img/product_detail/meizum15/details/info5.jpg"alt=""/><img src="img/product_detail/meizum15/details/info6.jpg"alt=""/><img src="img/product_detail/meizum15/details/info7.jpg"alt=""/><img src="img/product_detail/meizum15/details/info8.jpg"alt=""/><img src="img/product_detail/meizum15/details/info9.jpg"alt=""/><img src="img/product_detail/meizum15/details/info10.jpg"alt=""/><img src="img/product_detail/meizum15/details/info11.jpg"alt=""/><img src="img/product_detail/meizum15/details/info12.jpg"alt=""/><img src="img/product_detail/meizum15/details/info13.jpg"alt=""/><img src="img/product_detail/meizum15/details/info14.jpg"alt=""/><img src="img/product_detail/meizum15/details/info15.jpg"alt=""/><img src="img/product_detail/meizum15/details/info16.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族M15</td></tr><tr class="desc"><td>尺寸</td><td>143.62*72.38*7.45mm</td></tr><tr class="desc"><td>电池容量</td><td>3000mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.46英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>500cd/㎡（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>高通骁龙626</td></tr><tr class="desc"><td>GPU</td><td>Adreno 506</td></tr><tr class="desc"><td>CPU频率</td><td>2.2GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>2000万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>索尼IMX 362 1200万像素ƒ/1.9大光圈</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列产品共有几款手机？型号分别是什么？</p><p><img src="img/product_detail/a.png"alt=""/>共有三款产品，分别为M15/15/15Plus。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M15曜岩黑/砂砾金/朱雀红15汝窑白/砚墨/黛蓝/雅金15 Plus砚墨/玄武灰/雅金采用全金属纳米注塑机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列解锁方式是怎样的？</p><p><img src="img/product_detail/a.png"alt=""/>支持指纹识别解锁以及面部识别解锁；指纹解锁键位于手机屏幕下方。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否保留mBack实体按键？形状？</p><p><img src="img/product_detail/a.png"alt=""/>非物理按键，可识别轻触及按压，操作逻辑和mBack相同。7mm直径圆圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否是全面屏？屏幕比例是多少？</p><p><img src="img/product_detail/a.png"alt=""/>独家定制全面屏；16:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列屏幕多大？分辨率是多少？</p><p><img src="img/product_detail/a.png"alt=""/>M15 5.46英寸1920X1080 15 5.46英寸1920X1080 15Plus 5.95英寸2560X1440</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列听筒及呼吸灯位置？</p><p><img src="img/product_detail/a.png"alt=""/>听筒位于手机顶部居中，呼吸灯隐藏于听筒中。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>M15高通骁龙626 15高通骁龙660 15Plus三星Exynos 8895</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>M15 4GB+64GB支持15 4GB+64GB 4GB+128GB不支持15Plus 6GB+64GB 6GB+128GB不支持</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>M15后置1200万像素；前置2000万像素。15后置1200万像素+2000万像素双摄；前置2000万像素。15Plus后置1200万像素+2000万像素双摄；前置2000万像素。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>支持。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅族15系列采用的系统是什么？</p><p><img src="img/product_detail/a.png"alt=""/>搭载全新的Flyme7系统。</p></div>',
	1529308541632,
	5000,
	true,
	1
);

#魅蓝e3
INSERT INTO mz_product VALUES(
	null,
	7,
	"魅蓝 E3",
	"限量现货开售",
	1898.00,
	null,
	"香槟金 6GB+64GB",
	"img/product_detail/meilane3/gold.png",
	'<img src="img/product_detail/meilane3/details/info1.jpg"alt=""/><img src="img/product_detail/meilane3/details/info2.jpg"alt=""/><img src="img/product_detail/meilane3/details/info3.jpg"alt=""/><img src="img/product_detail/meilane3/details/info4.jpg"alt=""/><img src="img/product_detail/meilane3/details/info5.jpg"alt=""/><img src="img/product_detail/meilane3/details/info6.jpg"alt=""/><img src="img/product_detail/meilane3/details/info7.jpg"alt=""/><img src="img/product_detail/meilane3/details/info8.jpg"alt=""/><img src="img/product_detail/meilane3/details/info9.jpg"alt=""/><img src="img/product_detail/meilane3/details/info10.jpg"alt=""/><img src="img/product_detail/meilane3/details/info11.jpg"alt=""/><img src="img/product_detail/meilane3/details/info12.jpg"alt=""/><img src="img/product_detail/meilane3/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E3</td></tr><tr class="desc"><td>尺寸</td><td>156.8mm（长）x 75mm（宽）x 7.6mm（厚）</td></tr><tr class="desc"><td>电池容量</td><td>3360mAh</td></tr><tr class="desc"><td>重量</td><td>160g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.99英寸</td></tr><tr class="desc"><td>分辨率</td><td>2160x1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙636高性能移动平台</td></tr><tr class="desc"><td>GPU</td><td>Adreno™509图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>Kryo™260 1.8GHz x 4+Kryo™260 1.6GHz x 4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素2000万像素+Dual PD全像素双核对焦PDAF相位对焦</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M香槟金、曜石黑、丹青，全金属纳米注塑。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否支持指纹识别？指纹位置？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s指纹识别解锁，机身右侧。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否保留mBack实体按键？</p><p><img src="img/product_detail/a.png"alt=""/>无实体Home键，采用更人性化的Super mBack交互。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>Super mBack的使用方式是否和mBack一致？</p><p><img src="img/product_detail/a.png"alt=""/>操作逻辑一致：轻按Back，重按Home，长按锁屏。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否是全面屏？屏幕长宽比是多少？</p><p><img src="img/product_detail/a.png"alt=""/>全面屏，18:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.99英寸，2160 X 1080，制造工艺：In-Cell全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E3采用高通骁龙636处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>6GB LPDDR4X大内存，64GB/128GB存储容量，最高支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置双摄像头：1200万像素，ƒ/1.9超大光圈；2000万像素，f/2.6大光圈。蓝宝石玻璃保护镜片。前置摄像头：800万像素，ƒ/2.0光圈，ArcSoft®美颜算法，自适应美肤技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3360mAh（典型值），提供20W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>关于魅蓝E3的限购的说明。</p><p><img src="img/product_detail/a.png"alt=""/>每位用户（包括但不限于联系人、联系方式、地址雷同，均视为同一用户）仅限购买一件魅蓝E3，如遇多拍订单只选取一笔订单发货，多拍订单不发货。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	7,
	"魅蓝 E3",
	"限量现货开售",
	1999.00,
	null,
	"香槟金 6GB+128GB",
	"img/product_detail/meilane3/gold.png",
	'<img src="img/product_detail/meilane3/details/info1.jpg"alt=""/><img src="img/product_detail/meilane3/details/info2.jpg"alt=""/><img src="img/product_detail/meilane3/details/info3.jpg"alt=""/><img src="img/product_detail/meilane3/details/info4.jpg"alt=""/><img src="img/product_detail/meilane3/details/info5.jpg"alt=""/><img src="img/product_detail/meilane3/details/info6.jpg"alt=""/><img src="img/product_detail/meilane3/details/info7.jpg"alt=""/><img src="img/product_detail/meilane3/details/info8.jpg"alt=""/><img src="img/product_detail/meilane3/details/info9.jpg"alt=""/><img src="img/product_detail/meilane3/details/info10.jpg"alt=""/><img src="img/product_detail/meilane3/details/info11.jpg"alt=""/><img src="img/product_detail/meilane3/details/info12.jpg"alt=""/><img src="img/product_detail/meilane3/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E3</td></tr><tr class="desc"><td>尺寸</td><td>156.8mm（长）x 75mm（宽）x 7.6mm（厚）</td></tr><tr class="desc"><td>电池容量</td><td>3360mAh</td></tr><tr class="desc"><td>重量</td><td>160g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.99英寸</td></tr><tr class="desc"><td>分辨率</td><td>2160x1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙636高性能移动平台</td></tr><tr class="desc"><td>GPU</td><td>Adreno™509图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>Kryo™260 1.8GHz x 4+Kryo™260 1.6GHz x 4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素2000万像素+Dual PD全像素双核对焦PDAF相位对焦</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M香槟金、曜石黑、丹青，全金属纳米注塑。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否支持指纹识别？指纹位置？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s指纹识别解锁，机身右侧。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否保留mBack实体按键？</p><p><img src="img/product_detail/a.png"alt=""/>无实体Home键，采用更人性化的Super mBack交互。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>Super mBack的使用方式是否和mBack一致？</p><p><img src="img/product_detail/a.png"alt=""/>操作逻辑一致：轻按Back，重按Home，长按锁屏。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否是全面屏？屏幕长宽比是多少？</p><p><img src="img/product_detail/a.png"alt=""/>全面屏，18:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.99英寸，2160 X 1080，制造工艺：In-Cell全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E3采用高通骁龙636处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>6GB LPDDR4X大内存，64GB/128GB存储容量，最高支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置双摄像头：1200万像素，ƒ/1.9超大光圈；2000万像素，f/2.6大光圈。蓝宝石玻璃保护镜片。前置摄像头：800万像素，ƒ/2.0光圈，ArcSoft®美颜算法，自适应美肤技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3360mAh（典型值），提供20W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>关于魅蓝E3的限购的说明。</p><p><img src="img/product_detail/a.png"alt=""/>每位用户（包括但不限于联系人、联系方式、地址雷同，均视为同一用户）仅限购买一件魅蓝E3，如遇多拍订单只选取一笔订单发货，多拍订单不发货。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

INSERT INTO mz_product VALUES(
	null,
	7,
	"魅蓝 E3",
	"限量现货开售",
	1898.00,
	null,
	"曜石黑 6GB+64GB",
	"img/product_detail/meilane3/black.png",
	'<img src="img/product_detail/meilane3/details/info1.jpg"alt=""/><img src="img/product_detail/meilane3/details/info2.jpg"alt=""/><img src="img/product_detail/meilane3/details/info3.jpg"alt=""/><img src="img/product_detail/meilane3/details/info4.jpg"alt=""/><img src="img/product_detail/meilane3/details/info5.jpg"alt=""/><img src="img/product_detail/meilane3/details/info6.jpg"alt=""/><img src="img/product_detail/meilane3/details/info7.jpg"alt=""/><img src="img/product_detail/meilane3/details/info8.jpg"alt=""/><img src="img/product_detail/meilane3/details/info9.jpg"alt=""/><img src="img/product_detail/meilane3/details/info10.jpg"alt=""/><img src="img/product_detail/meilane3/details/info11.jpg"alt=""/><img src="img/product_detail/meilane3/details/info12.jpg"alt=""/><img src="img/product_detail/meilane3/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E3</td></tr><tr class="desc"><td>尺寸</td><td>156.8mm（长）x 75mm（宽）x 7.6mm（厚）</td></tr><tr class="desc"><td>电池容量</td><td>3360mAh</td></tr><tr class="desc"><td>重量</td><td>160g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.99英寸</td></tr><tr class="desc"><td>分辨率</td><td>2160x1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙636高性能移动平台</td></tr><tr class="desc"><td>GPU</td><td>Adreno™509图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>Kryo™260 1.8GHz x 4+Kryo™260 1.6GHz x 4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素2000万像素+Dual PD全像素双核对焦PDAF相位对焦</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M香槟金、曜石黑、丹青，全金属纳米注塑。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否支持指纹识别？指纹位置？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s指纹识别解锁，机身右侧。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否保留mBack实体按键？</p><p><img src="img/product_detail/a.png"alt=""/>无实体Home键，采用更人性化的Super mBack交互。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>Super mBack的使用方式是否和mBack一致？</p><p><img src="img/product_detail/a.png"alt=""/>操作逻辑一致：轻按Back，重按Home，长按锁屏。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否是全面屏？屏幕长宽比是多少？</p><p><img src="img/product_detail/a.png"alt=""/>全面屏，18:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.99英寸，2160 X 1080，制造工艺：In-Cell全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E3采用高通骁龙636处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>6GB LPDDR4X大内存，64GB/128GB存储容量，最高支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置双摄像头：1200万像素，ƒ/1.9超大光圈；2000万像素，f/2.6大光圈。蓝宝石玻璃保护镜片。前置摄像头：800万像素，ƒ/2.0光圈，ArcSoft®美颜算法，自适应美肤技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3360mAh（典型值），提供20W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>关于魅蓝E3的限购的说明。</p><p><img src="img/product_detail/a.png"alt=""/>每位用户（包括但不限于联系人、联系方式、地址雷同，均视为同一用户）仅限购买一件魅蓝E3，如遇多拍订单只选取一笔订单发货，多拍订单不发货。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	7,
	"魅蓝 E3",
	"限量现货开售",
	1999.00,
	null,
	"曜石黑 6GB+128GB",
	"img/product_detail/meilane3/black.png",
	'<img src="img/product_detail/meilane3/details/info1.jpg"alt=""/><img src="img/product_detail/meilane3/details/info2.jpg"alt=""/><img src="img/product_detail/meilane3/details/info3.jpg"alt=""/><img src="img/product_detail/meilane3/details/info4.jpg"alt=""/><img src="img/product_detail/meilane3/details/info5.jpg"alt=""/><img src="img/product_detail/meilane3/details/info6.jpg"alt=""/><img src="img/product_detail/meilane3/details/info7.jpg"alt=""/><img src="img/product_detail/meilane3/details/info8.jpg"alt=""/><img src="img/product_detail/meilane3/details/info9.jpg"alt=""/><img src="img/product_detail/meilane3/details/info10.jpg"alt=""/><img src="img/product_detail/meilane3/details/info11.jpg"alt=""/><img src="img/product_detail/meilane3/details/info12.jpg"alt=""/><img src="img/product_detail/meilane3/details/info13.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E3</td></tr><tr class="desc"><td>尺寸</td><td>156.8mm（长）x 75mm（宽）x 7.6mm（厚）</td></tr><tr class="desc"><td>电池容量</td><td>3360mAh</td></tr><tr class="desc"><td>重量</td><td>160g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.99英寸</td></tr><tr class="desc"><td>分辨率</td><td>2160x1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>6GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>骁龙636高性能移动平台</td></tr><tr class="desc"><td>GPU</td><td>Adreno™509图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>Kryo™260 1.8GHz x 4+Kryo™260 1.6GHz x 4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素ƒ/2.0光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>1200万像素2000万像素+Dual PD全像素双核对焦PDAF相位对焦</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>M香槟金、曜石黑、丹青，全金属纳米注塑。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否支持指纹识别？指纹位置？</p><p><img src="img/product_detail/a.png"alt=""/>支持0.2s指纹识别解锁，机身右侧。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否保留mBack实体按键？</p><p><img src="img/product_detail/a.png"alt=""/>无实体Home键，采用更人性化的Super mBack交互。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>Super mBack的使用方式是否和mBack一致？</p><p><img src="img/product_detail/a.png"alt=""/>操作逻辑一致：轻按Back，重按Home，长按锁屏。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3是否是全面屏？屏幕长宽比是多少？</p><p><img src="img/product_detail/a.png"alt=""/>全面屏，18:9。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3屏幕多大？分辨率是多少？屏幕采用什么制造工艺？</p><p><img src="img/product_detail/a.png"alt=""/>5.99英寸，2160 X 1080，制造工艺：In-Cell全贴合。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>支持中国移动、中国联通、中国电信三大运营商网络，支持VoLTE语音通话技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的CPU是什么型号？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E3采用高通骁龙636处理器。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3存储容量分别为多少？是否支持存储卡拓展？</p><p><img src="img/product_detail/a.png"alt=""/>6GB LPDDR4X大内存，64GB/128GB存储容量，最高支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3后置摄像头是多少像素？前置摄像头是多少像素？</p><p><img src="img/product_detail/a.png"alt=""/>后置双摄像头：1200万像素，ƒ/1.9超大光圈；2000万像素，f/2.6大光圈。蓝宝石玻璃保护镜片。前置摄像头：800万像素，ƒ/2.0光圈，ArcSoft®美颜算法，自适应美肤技术。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E3的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3360mAh（典型值），提供20W高功率mCharge快充。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>关于魅蓝E3的限购的说明。</p><p><img src="img/product_detail/a.png"alt=""/>每位用户（包括但不限于联系人、联系方式、地址雷同，均视为同一用户）仅限购买一件魅蓝E3，如遇多拍订单只选取一笔订单发货，多拍订单不发货。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

#魅族e2
INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 3GB+32GB",
	"img/product_detail/meilane2/gold.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	1599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"香槟金 4GB+64GB",
	"img/product_detail/meilane2/gold.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"月光银 3GB+32GB",
	"img/product_detail/meilane2/sliver.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	1599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"月光银 4GB+64GB",
	"img/product_detail/meilane2/sliver.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	899.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"曜石黑 3GB+32GB",
	"img/product_detail/meilane2/black.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	8,
	"魅蓝 E2",
	"5.5英寸大屏幕 18w高功率快充",
	1599.00,
	'<div class="ticket"><span>领</span><span>券：</span><span class="desc">满899减80</span><a href="javascript:">更多&gt;</a></div>',
	"曜石黑 4GB+64GB",
	"img/product_detail/meilane2/black.png",
	'<img src="img/product_detail/meilane2/details/info1.jpg"alt=""/><img src="img/product_detail/meilane2/details/info2.jpg"alt=""/><img src="img/product_detail/meilane2/details/info3.jpg"alt=""/><img src="img/product_detail/meilane2/details/info4.jpg"alt=""/><img src="img/product_detail/meilane2/details/info5.jpg"alt=""/><img src="img/product_detail/meilane2/details/info6.jpg"alt=""/><img src="img/product_detail/meilane2/details/info7.jpg"alt=""/><img src="img/product_detail/meilane2/details/info8.jpg"alt=""/><img src="img/product_detail/meilane2/details/info9.jpg"alt=""/><img src="img/product_detail/meilane2/details/info10.jpg"alt=""/><img src="img/product_detail/meilane2/details/info11.jpg"alt=""/><img src="img/product_detail/meilane2/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅蓝E2</td></tr><tr class="desc"><td>尺寸</td><td>153.7*75.7*7.5mm</td></tr><tr class="desc"><td>电池容量</td><td>3400mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.5英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>403</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>3GB(仅限32G版本)、4GB(仅限64G版本)</td></tr><tr class="desc"><td>机身内存</td><td>32GB<br>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Helio P20 16nm制程低功耗处理器</td></tr><tr class="desc"><td>GPU</td><td>ARM Mali-T880图形处理器</td></tr><tr class="desc"><td>CPU频率</td><td>ARM®Cortex®-A53™2.3GHz x4+ARM®Cortex®-A53™1.6GHz x4</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素自拍更透亮光滑ƒ/2.0光圈1.4μm单像素尺寸</td></tr><tr class="desc"><td>后置摄像头</td><td>1300万像素ƒ/2.2光圈5片式镜头</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>新疆地区可以正常派送吗？</p><p><img src="img/product_detail/a.png"alt=""/>亲爱的魅友您好，受安全管控影响，新疆省部分区域将派件延迟或无法派件，下单前请先咨询客服沟通。谢谢！</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的屏幕尺寸是多大？有哪几种颜色？机身材质？</p><p><img src="img/product_detail/a.png"alt=""/>5.5英寸，曜石黑、月光银、香槟金，金属一体机身。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持指纹识别？</p><p><img src="img/product_detail/a.png"alt=""/>支持mTouch指纹识别，响应速度达0.2s，支持移动指纹支付。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>GFF全贴合技术，403 PPI像素密度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2屏幕对比度和亮度多高？</p><p><img src="img/product_detail/a.png"alt=""/>1000:1对比度丨450cd/m²典型值亮度。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2是否支持存储卡扩展？</p><p><img src="img/product_detail/a.png"alt=""/>支持，最大支持128GB存储卡。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2支持的网络有哪些？是否具备VoLTE语音通话技术？</p><p><img src="img/product_detail/a.png"alt=""/>魅蓝E2全网通版可支持中国移动、中国联通、中国电信三大运营商网络。不可同时支持两张电信卡。支持VoLTE高清通话。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的CPU是什么？</p><p><img src="img/product_detail/a.png"alt=""/>全新升级P20八核处理器，最高主频达到2.3GHz。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2存储容量是多少？运行内存是多少？</p><p><img src="img/product_detail/a.png"alt=""/>存储容量为32GB/64GB两个版本。运行内存为3GB/4GB两个版本。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2后置摄像头是多少像素？采用什么技术？</p><p><img src="img/product_detail/a.png"alt=""/>1300万像素，搭载PDAF高速相位对焦，ƒ/2.2大光圈。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>魅蓝E2的电池规格？是否支持mCharge安全快充？</p><p><img src="img/product_detail/a.png"alt=""/>3400 mAh典型值，支持mCharge安全快充技术，标配18W高功率快充，30分钟即可充满40%电量。</p></div>',
	1529308541632,
	2000,
	true,
	1
);

#华为P10
INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3488.00,
	null,
	"曜石黑 4GB+64GB",
	"img/product_detail/huaweip10/black.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3988.00,
	null,
	"曜石黑 4GB+128GB",
	"img/product_detail/huaweip10/black.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);

INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3488.00,
	null,
	"玫瑰金 4GB+64GB",
	"img/product_detail/huaweip10/gold.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3988.00,
	null,
	"玫瑰金 4GB+128GB",
	"img/product_detail/huaweip10/gold.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);

INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3488.00,
	null,
	"陶瓷白 4GB+64GB",
	"img/product_detail/huaweip10/white.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	9,
	"华为 P10",
	"新一代徕卡双镜头，多彩外观设计，时尚简约。",
	3988.00,
	null,
	"陶瓷白 4GB+128GB",
	"img/product_detail/huaweip10/white.jpg",
	'<img src="img/product_detail/huaweip10/details/info1.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info2.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info3.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info4.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info5.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info6.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info7.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info8.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info9.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info10.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info11.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info12.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info13.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info14.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info15.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info16.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info17.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info18.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info19.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info20.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info21.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info22.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info23.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info24.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info25.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info26.jpg"alt=""/><img src="img/product_detail/huaweip10/details/info27.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>华为</td></tr><tr class="desc"><td>型号</td><td>华为P10</td></tr><tr class="desc"><td>尺寸</td><td>145.3×69.3×6.98mm</td></tr><tr class="desc"><td>电池容量</td><td>3200mAh</td></tr><tr class="desc"><td>重量</td><td>145g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.1英寸</td></tr><tr class="desc"><td>分辨率</td><td>1920×1080</td></tr><tr class="desc"><td>PPI</td><td>432</td></tr><tr class="desc"><td>亮度</td><td>450cd/m²（典型值）</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB<br>128GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>麒麟960</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>4×Cortex A73 2.4GHz+4×Cortex A53 1.8GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>8800万像素，F1.9光圈，徕卡镜头</td></tr><tr class="desc"><td>后置摄像头</td><td>2000万像素（黑白）+1200万像素（彩色），F2.2光圈，徕卡镜头，支持OIS光学防抖</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 4.2</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);

#三星S8
INSERT INTO mz_product VALUES(
	null,
	10,
	"三星 S8",
	"全视曲面屏、IP68级防尘防水、疾速对焦摄像头 捕捉每一精彩瞬间",
	4999.00,
	null,
	"雾屿蓝 4GB+64GB",
	"img/product_detail/samsungs8/blue.jpg",
	'<img src="img/product_detail/samsungs8/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>三星</td></tr><tr class="desc"><td>型号</td><td>三星S8</td></tr><tr class="desc"><td>尺寸</td><td>148.9 x 68.1 x 8mm</td></tr><tr class="desc"><td>电池容量</td><td>3,000mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.8英寸</td></tr><tr class="desc"><td>分辨率</td><td>2960 x 1440</td></tr><tr class="desc"><td>屏幕类型</td><td>双曲面Super AMOLED</td></tr><tr class="desc"><td>色彩</td><td>1600万色</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Excynos 8890</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>2.35GHz,1.9GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素，F1.7光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>全双核1200万像素/支持OIS光学防抖技术</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	10,
	"三星 S8",
	"全视曲面屏、IP68级防尘防水、疾速对焦摄像头 捕捉每一精彩瞬间",
	5699.00,
	null,
	"雾屿蓝 4GB+128GB",
	"img/product_detail/samsungs8/blue.jpg",
	'<img src="img/product_detail/samsungs8/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>三星</td></tr><tr class="desc"><td>型号</td><td>三星S8</td></tr><tr class="desc"><td>尺寸</td><td>148.9 x 68.1 x 8mm</td></tr><tr class="desc"><td>电池容量</td><td>3,000mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.8英寸</td></tr><tr class="desc"><td>分辨率</td><td>2960 x 1440</td></tr><tr class="desc"><td>屏幕类型</td><td>双曲面Super AMOLED</td></tr><tr class="desc"><td>色彩</td><td>1600万色</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Excynos 8890</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>2.35GHz,1.9GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素，F1.7光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>全双核1200万像素/支持OIS光学防抖技术</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	10,
	"三星 S8",
	"全视曲面屏、IP68级防尘防水、疾速对焦摄像头 捕捉每一精彩瞬间",
	4999.00,
	null,
	"勃艮第红 4GB+64GB",
	"img/product_detail/samsungs8/red.jpg",
	'<img src="img/product_detail/samsungs8/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>三星</td></tr><tr class="desc"><td>型号</td><td>三星S8</td></tr><tr class="desc"><td>尺寸</td><td>148.9 x 68.1 x 8mm</td></tr><tr class="desc"><td>电池容量</td><td>3,000mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.8英寸</td></tr><tr class="desc"><td>分辨率</td><td>2960 x 1440</td></tr><tr class="desc"><td>屏幕类型</td><td>双曲面Super AMOLED</td></tr><tr class="desc"><td>色彩</td><td>1600万色</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Excynos 8890</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>2.35GHz,1.9GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素，F1.7光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>全双核1200万像素/支持OIS光学防抖技术</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);
INSERT INTO mz_product VALUES(
	null,
	10,
	"三星 S8",
	"全视曲面屏、IP68级防尘防水、疾速对焦摄像头 捕捉每一精彩瞬间",
	5699.00,
	null,
	"勃艮第红 4GB+128GB",
	"img/product_detail/samsungs8/red.jpg",
	'<img src="img/product_detail/samsungs8/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>三星</td></tr><tr class="desc"><td>型号</td><td>三星S8</td></tr><tr class="desc"><td>尺寸</td><td>148.9 x 68.1 x 8mm</td></tr><tr class="desc"><td>电池容量</td><td>3,000mAh</td></tr><tr class="desc"><td>重量</td><td>155g</td></tr><!--2--><tr class="head-title"><th colspan="2">屏幕</th></tr><tr class="desc"><td>屏幕尺寸</td><td>5.8英寸</td></tr><tr class="desc"><td>分辨率</td><td>2960 x 1440</td></tr><tr class="desc"><td>屏幕类型</td><td>双曲面Super AMOLED</td></tr><tr class="desc"><td>色彩</td><td>1600万色</td></tr><!--3--><tr class="head-title"><th colspan="2">容量</th></tr><tr class="desc"><td>运行内存（RAM）</td><td>4GB</td></tr><tr class="desc"><td>机身内存</td><td>64GB</td></tr><!--4--><tr class="head-title"><th colspan="2">处理器</th></tr><tr class="desc"><td>CPU</td><td>Excynos 8890</td></tr><tr class="desc"><td>GPU</td><td>Mali G71 MP8</td></tr><tr class="desc"><td>CPU频率</td><td>2.35GHz,1.9GHz</td></tr><!--5--><tr class="head-title"><th colspan="2">摄像</th></tr><tr class="desc"><td>前置摄像头</td><td>800万像素，F1.7光圈</td></tr><tr class="desc"><td>后置摄像头</td><td>全双核1200万像素/支持OIS光学防抖技术</td></tr><!--6--><tr class="head-title"><th colspan="2">运营商与制式</th></tr><tr class="desc"><td>全网通</td><td>支持中国移动、联通、电信三大运营商网络</td></tr><!--7--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>WLAN功能</td><td>支持5GHz和2.4GHz频段<br>802.11 ac/a/b/g/n无线网络<br></td></tr><tr class="desc"><td>蓝牙</td><td>Bluetooth 5.0</td></tr><!--8--><tr class="head-title"><th colspan="2">操作环境</th></tr><tr class="desc"><td>操作环境</td><td>工作环境温度0至35°C<br>存储温度-20至45°C</td></tr><!--9--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>电源适配器x 1<br>保修证书x 1<br>SIM卡顶针x 1<br>数据线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	1
);

#魅族EP2X
INSERT INTO mz_product VALUES(
	null,
	11,
	"魅族 EP2X耳机",
	"契合声音的流动之美",
	89.00,
	null,
	"皓月白",
	"img/product_detail/mzep2x/white.png",
	'<img src="img/product_detail/mzep2x/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP2X</td></tr><tr class="desc"><td>佩戴方式</td><td>半入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>手机线控耳机，有线耳机</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>有／无线</td><td>有线</td></tr><tr class="desc"><td>是否单双耳</td><td>双边立体声</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	2
);
INSERT INTO mz_product VALUES(
	null,
	11,
	"魅族 EP2X耳机",
	"契合声音的流动之美",
	89.00,
	null,
	"珍珠黑",
	"img/product_detail/mzep2x/black.png",
	'<img src="img/product_detail/mzep2x/details/info1.jpg" alt="" />',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP2X</td></tr><tr class="desc"><td>佩戴方式</td><td>半入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>手机线控耳机，有线耳机</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>有／无线</td><td>有线</td></tr><tr class="desc"><td>是否单双耳</td><td>双边立体声</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	2000,
	true,
	2
);

#魅族POP 真无线蓝牙耳机
INSERT INTO mz_product VALUES(
	null,
	12,
	"魅族POP 真无线蓝牙耳机",
	"双无线 零设限",
	499.00,
	null,
	"皓月白",
	"img/product_detail/mzblueear/white.png",
	'<img src="img/product_detail/mzblueear/details/info1.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info2.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info3.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info4.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info5.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info6.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info7.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info8.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info9.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info10.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info11.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info12.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info13.jpg"alt=""/><img src="img/product_detail/mzblueear/details/info14.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>POP真无线蓝牙耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙耳机</td></tr><tr class="desc"><td>有无麦克风</td><td>耳机单边5.8g</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>蓝牙版本</td><td>4.2版本</td></tr><tr class="desc"><td>阻抗</td><td>16Ω</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>POP魅族真无线蓝牙运动耳机x 1<br>充电盒x 1<br>组合耳套套装（S,M,L三对硅胶耳套，M号在耳机上；S,L两对硅胶耳撑）<br>Type-C充电线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	500,
	true,
	2
);

#魅族 HALO 激光蓝牙耳机
INSERT INTO mz_product VALUES(
	null,
	13,
	"魅族 HALO 激光蓝牙耳机",
	"六期免息 流光相随 状若霓虹",
	999.00,
	null,
	"蓝色",
	"img/product_detail/mzhaloear/blue.png",
	'<img src="img/product_detail/mzhaloear/details/info1.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info2.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info3.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info4.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info5.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info6.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info7.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info8.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info9.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info10.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info11.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>HALO魅族激光蓝牙耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙耳机</td></tr><tr class="desc"><td>缆线长度</td><td>1.5米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr><tr class="head-title"><th colspan="2">功能参数</th></tr><tr class="desc"><td>充电时间</td><td>1.5H</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>蓝牙版本</td><td>4.1版本</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br/>便携包x 1<br/>USB充电线x<br/>Halo激光蓝牙耳机x<br/>S,M,L三对硅胶耳套（M号在耳机上）</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	500,
	true,
	2
);
INSERT INTO mz_product VALUES(
	null,
	13,
	"魅族 HALO 激光蓝牙耳机",
	"六期免息 流光相随 状若霓虹",
	999.00,
	null,
	"红色",
	"img/product_detail/mzhaloear/red.png",
	'<img src="img/product_detail/mzhaloear/details/info1.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info2.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info3.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info4.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info5.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info6.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info7.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info8.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info9.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info10.jpg"alt=""/><img src="img/product_detail/mzhaloear/details/info11.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>HALO魅族激光蓝牙耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙耳机</td></tr><tr class="desc"><td>缆线长度</td><td>1.5米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr><tr class="head-title"><th colspan="2">功能参数</th></tr><tr class="desc"><td>充电时间</td><td>1.5H</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>蓝牙版本</td><td>4.1版本</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br/>便携包x 1<br/>USB充电线x<br/>Halo激光蓝牙耳机x<br/>S,M,L三对硅胶耳套（M号在耳机上）</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	500,
	true,
	2
);

#魅族 LIVE四单元动铁耳机
INSERT INTO mz_product VALUES(
	null,
	14,
	"魅族 LIVE四单元动铁耳机",
	"享12期免息",
	1299.00,
	null,
	"银色",
	"img/product_detail/mzliveear/sliver.png",
	'<img src="img/product_detail/mzliveear/details/info1.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info2.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info3.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info4.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info5.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info6.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info7.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info8.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info9.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info10.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info11.jpg"alt=""/><img src="img/product_detail/mzliveear/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族LIVE四单元动铁耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>有线耳机</td></tr><tr class="desc"><td>净重</td><td>27g</td></tr><tr class="desc"><td>插头类型</td><td>弯插型</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20Hz~20KHz</td></tr><tr class="desc"><td>灵敏度</td><td>97dB@1kHz</td></tr><tr class="head-title"><th colspan="2">电压电流</th></tr><tr class="desc"><td>输出功率</td><td>3mW</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>阻抗</td><td>183mW</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>耳机×1<br>惰性耳套x4（S，M，L，XL，M号在耳机上）<br>硅胶耳套x4（S，M，L，XL）<br>不锈钢前嘴收纳管x1（含两对可更换耳机前嘴；前嘴拆卸工具）<br>IPX7级防水便携盒x1</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅族 Flow 三单元耳机
INSERT INTO mz_product VALUES(
	null,
	15,
	"魅族 Flow 三单元耳机",
	"用得惬意 听得尽兴",
	599.00,
	null,
	"星空黑",
	"img/product_detail/mzflowear/black.png",
	'<img src="img/product_detail/mzflowear/details/info1.jpg"alt=""/><img src="img/product_detail/mzflowear/details/info2.jpg"alt=""/><img src="img/product_detail/mzflowear/details/info3.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>Flow魅族三单元耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>手机线控耳机<br>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>有线耳机</td></tr><tr class="desc"><td>净重</td><td>22.7g</td></tr><tr class="desc"><td>插头类型</td><td>直插式</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>10Hz~30KHz</td></tr><tr class="desc"><td>灵敏度</td><td>105dB At 1KHz</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>阻抗</td><td>32Ω</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>耳机×1<br>S、M、L号硅胶耳套x 1;M号在耳机上<br>S、M号双层耳套x 1<br>惰性棉耳套x 1<br>硅胶便携包x 1<br>金属航空插头x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);
INSERT INTO mz_product VALUES(
	null,
	15,
	"魅族 Flow 三单元耳机",
	"用得惬意 听得尽兴",
	599.00,
	null,
	"月光银",
	"img/product_detail/mzflowear/sliver.png",
	'<img src="img/product_detail/mzflowear/details/info1.jpg"alt=""/><img src="img/product_detail/mzflowear/details/info2.jpg"alt=""/><img src="img/product_detail/mzflowear/details/info3.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>Flow魅族三单元耳机</td></tr><tr class="desc"><td>佩戴方式</td><td>手机线控耳机<br>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>有线耳机</td></tr><tr class="desc"><td>净重</td><td>22.7g</td></tr><tr class="desc"><td>插头类型</td><td>直插式</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><!--2--><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>10Hz~30KHz</td></tr><tr class="desc"><td>灵敏度</td><td>105dB At 1KHz</td></tr><!--3--><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>阻抗</td><td>32Ω</td></tr><!--4--><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>耳机×1<br>S、M、L号硅胶耳套x 1;M号在耳机上<br>S、M号双层耳套x 1<br>惰性棉耳套x 1<br>硅胶便携包x 1<br>金属航空插头x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅族 EP51
INSERT INTO mz_product VALUES(
	null,
	16,
	"魅族 EP51蓝牙运动耳机",
	"臻享音质 自在运动",
	179.00,
	null,
	"白色",
	"img/product_detail/mzep51ear/white.png",
	'<img src="img/product_detail/mzep51ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzep51ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzep51ear/details/info3.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP-51</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙运动耳机<br>无线耳机</td></tr><tr class="desc"><td>有／无线</td><td>无线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android<br>ios</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>充电线x 1<br>耳机x 1<br>S、L、XL硅胶套x 1<br>耳机收纳包x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);
INSERT INTO mz_product VALUES(
	null,
	16,
	"魅族 EP51蓝牙运动耳机",
	"臻享音质 自在运动",
	179.00,
	null,
	"红色",
	"img/product_detail/mzep51ear/red.png",
	'<img src="img/product_detail/mzep51ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzep51ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzep51ear/details/info3.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP-51</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙运动耳机<br>无线耳机</td></tr><tr class="desc"><td>有／无线</td><td>无线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android<br>ios</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>充电线x 1<br>耳机x 1<br>S、L、XL硅胶套x 1<br>耳机收纳包x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅族 EP52
INSERT INTO mz_product VALUES(
	null,
	17,
	"魅蓝EP52蓝牙耳机",
	"轻盈悦耳 动无拘束",
	299.00,
	null,
	"红黑色",
	"img/product_detail/mzep52ear/red.png",
	'<img src="img/product_detail/mzep52ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info3.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info4.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info5.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP52</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙运动耳机<br>无线耳机</td></tr><tr class="desc"><td>有／无线</td><td>无线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android<br>ios</td></tr><tr class="desc"><td>传输距离</td><td>10米</td></tr><tr class="desc"><td>是否线控</td><td>是</td></tr><tr class="desc"><td>净重</td><td>22g</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>充电线x 1<br>耳机x 1<br>S、L、XL硅胶套x 1<br>耳机收纳包x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

INSERT INTO mz_product VALUES(
	null,
	17,
	"魅蓝EP52蓝牙耳机",
	"轻盈悦耳 动无拘束",
	299.00,
	null,
	"原力灰(悦动定制版)",
	"img/product_detail/mzep52ear/gray.png",
	'<img src="img/product_detail/mzep52ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info3.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info4.jpg"alt=""/><img src="img/product_detail/mzep52ear/details/info5.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>EP52</td></tr><tr class="desc"><td>佩戴方式</td><td>入耳式</td></tr><tr class="desc"><td>耳机类别</td><td>蓝牙运动耳机<br>无线耳机</td></tr><tr class="desc"><td>有／无线</td><td>无线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android<br>ios</td></tr><tr class="desc"><td>传输距离</td><td>10米</td></tr><tr class="desc"><td>是否线控</td><td>是</td></tr><tr class="desc"><td>净重</td><td>22g</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>充电线x 1<br>耳机x 1<br>S、L、XL硅胶套x 1<br>耳机收纳包x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅族HD50 头戴式耳机
INSERT INTO mz_product VALUES(
	null,
	18,
	"魅族HD50 头戴式耳机",
	"清新简洁，有音质更有颜值",
	399.00,
	null,
	"银黑",
	"img/product_detail/mzhd50ear/black.png",
	'<img src="img/product_detail/mzhd50ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info3.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info4.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>HD50</td></tr><tr class="desc"><td>佩戴方式</td><td>头戴式</td></tr><tr class="desc"><td>耳机类别</td><td>HIFI耳机<br>手机线控耳机<br>有线耳机</td></tr><tr class="desc"><td>有／无线</td><td>有线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20-20,000Hz</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>耳机包x 1<br>功放转接头x 1<br>航空转接头x 1<br>耳机线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

INSERT INTO mz_product VALUES(
	null,
	18,
	"魅族HD50 头戴式耳机",
	"清新简洁，有音质更有颜值",
	399.00,
	null,
	"银白",
	"img/product_detail/mzhd50ear/white.png",
	'<img src="img/product_detail/mzhd50ear/details/info1.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info2.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info3.jpg"alt=""/><img src="img/product_detail/mzhd50ear/details/info4.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>HD50</td></tr><tr class="desc"><td>佩戴方式</td><td>头戴式</td></tr><tr class="desc"><td>耳机类别</td><td>HIFI耳机<br>手机线控耳机<br>有线耳机</td></tr><tr class="desc"><td>有／无线</td><td>有线</td></tr><tr class="desc"><td>有无麦克风</td><td>带麦</td></tr><tr class="desc"><td>兼容平台</td><td>Android</td></tr><tr class="desc"><td>缆线长度</td><td>1.2米</td></tr><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>20-20,000Hz</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>耳机包x 1<br>功放转接头x 1<br>航空转接头x 1<br>耳机线x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅蓝双向闪充移动电源
INSERT INTO mz_product VALUES(
	null,
	19,
	"魅蓝双向闪充移动电源",
	"潮流新色 闪充升级",
	169.00,
	null,
	"中灰",
	"img/product_detail/mzyidong/gray.png",
	'<img src="img/product_detail/mzyidong/details/info1.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info2.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info3.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info4.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info5.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info6.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info7.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info8.jpg"alt=""/><img src="img/product_detail/mzyidong/details/info9.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>型号</td><td>魅蓝双向闪充移动电源</td></tr><tr class="desc"><td>电池容量</td><td>10000mAh</td></tr><tr class="desc"><td>尺寸</td><td>148.5*75.7*17.5MM</td></tr><tr class="desc"><td>电芯</td><td>锂离子聚合物电池</td></tr><tr class="head-title"><th colspan="2">电压电流</th></tr><tr class="desc"><td>输入电压</td><td>5-9V/2A 9-12V/1.5A</td></tr><tr class="desc"><td>输出电压</td><td>5-6V/3A 6-9V/2.6A 9-12V2A</td></tr><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>额定能量</td><td>5-6V/29Wh 6-9V/27Wh 9-12V/24.6Wh</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>充电线x 1<br>移动电源x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	3
);

#魅蓝20寸旅行箱 酷MA萌定制版
INSERT INTO mz_product VALUES(
	null,
	20,
	"魅蓝20寸旅行箱 酷MA萌定制版",
	"静音双排万向轮设计，具备安全TSA海关锁",
	349.00,
	null,
	"黑色",
	"img/product_detail/mzbox/black.png",
	'<img src="img/product_detail/mzbox/details/info1.jpg"alt=""/><img src="img/product_detail/mzbox/details/info2.jpg"alt=""/><img src="img/product_detail/mzbox/details/info3.jpg"alt=""/><img src="img/product_detail/mzbox/details/info4.jpg"alt=""/><img src="img/product_detail/mzbox/details/info5.jpg"alt=""/><img src="img/product_detail/mzbox/details/info6.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>品名</td><td>魅蓝20寸旅行箱（酷MA萌定制版）</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>这个行李箱有钥匙吗？</p><p><img src="img/product_detail/a.png"alt=""/>TSA海关锁虽然有钥匙孔，但是用户只能使用密码锁。钥匙孔的用途是海关或航空公司在检查箱子的时候，用专用钥匙打开，避免了暴力撬锁。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>如何修改密码锁（海关锁）的密码？</p><p><img src="img/product_detail/a.png"alt=""/>拨动到现有解锁密码数字（初始为000），用针戳下密码右边的小圆孔，圆孔内复位键下陷，设置新密码后，拨动开关，复位键回弹，密码设置成功。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>这个拉杆箱可以登机放行李架上吗？</p><p><img src="img/product_detail/a.png"alt=""/>民航通用规则，一般20寸拉杆箱的三边的和加起不超过115CM，可以随身带上飞机。不超重仅从体积上看，本产品可自理带上飞机。（少数航空公司特列外）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>拉杆箱存放保养注意事项</p><p><img src="img/product_detail/a.png"alt=""/>不要存放在潮湿不通风易发霉的地方，不要摆放在敞开的阳台上，避免雨淋或日晒。建议存放在干燥阴凉的柜里或置物架。日常清洁保养注意用湿布擦拭，通风处晾干。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>有送防尘袋吗？</p><p><img src="img/product_detail/a.png"alt=""/>本产品附赠防尘袋。为了避免箱体磕碰划伤，运输托运过程请套上防尘袋保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>托运要注意什么事项？</p><p><img src="img/product_detail/a.png"alt=""/>托运过程为了防盗请拨乱海关锁密码。请套上防尘袋避免碰撞刮伤划伤箱体外壳。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>酷MA萌图案的工艺？</p><p><img src="img/product_detail/a.png"alt=""/>UV油墨彩色打印工艺。日常清洁保养注意用湿布擦拭，通风处晾干，避免磕碰或利器刮伤。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>这个产品是酷MA萌正版授权吗？</p><p><img src="img/product_detail/a.png"alt=""/>是正版授权，拉杆箱对应的授权码是#28451，拉杆箱单独售卖版的吊牌上会贴有防伪标签。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>有隔层吗？</p><p><img src="img/product_detail/a.png"alt=""/>有的。内部结构设计，多个拉链收纳层，能分门别类更好的归纳随身物品，拉链夹袋统一存放各类证件卡片，取用更方便。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>本产品支持7天无理由退货吗？</p><p><img src="img/product_detail/a.png"alt=""/>客户购买商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下（配件、外包装和防伪标签完整），可无理由退货。（部分商品除外，详情请见各商品细则）</p></div>',
	1529308541632,
	150,
	true,
	4
);
INSERT INTO mz_product VALUES(
	null,
	20,
	"魅蓝20寸旅行箱 酷MA萌定制版",
	"静音双排万向轮设计，具备安全TSA海关锁",
	349.00,
	null,
	"红色",
	"img/product_detail/mzbox/red.png",
	'<img src="img/product_detail/mzbox/details/info1.jpg"alt=""/><img src="img/product_detail/mzbox/details/info2.jpg"alt=""/><img src="img/product_detail/mzbox/details/info3.jpg"alt=""/><img src="img/product_detail/mzbox/details/info4.jpg"alt=""/><img src="img/product_detail/mzbox/details/info5.jpg"alt=""/><img src="img/product_detail/mzbox/details/info6.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>品名</td><td>魅蓝20寸旅行箱（酷MA萌定制版）</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>这个行李箱有钥匙吗？</p><p><img src="img/product_detail/a.png"alt=""/>TSA海关锁虽然有钥匙孔，但是用户只能使用密码锁。钥匙孔的用途是海关或航空公司在检查箱子的时候，用专用钥匙打开，避免了暴力撬锁。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>如何修改密码锁（海关锁）的密码？</p><p><img src="img/product_detail/a.png"alt=""/>拨动到现有解锁密码数字（初始为000），用针戳下密码右边的小圆孔，圆孔内复位键下陷，设置新密码后，拨动开关，复位键回弹，密码设置成功。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>这个拉杆箱可以登机放行李架上吗？</p><p><img src="img/product_detail/a.png"alt=""/>民航通用规则，一般20寸拉杆箱的三边的和加起不超过115CM，可以随身带上飞机。不超重仅从体积上看，本产品可自理带上飞机。（少数航空公司特列外）</p></div><div><p><img src="img/product_detail/q.png"alt=""/>拉杆箱存放保养注意事项</p><p><img src="img/product_detail/a.png"alt=""/>不要存放在潮湿不通风易发霉的地方，不要摆放在敞开的阳台上，避免雨淋或日晒。建议存放在干燥阴凉的柜里或置物架。日常清洁保养注意用湿布擦拭，通风处晾干。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>有送防尘袋吗？</p><p><img src="img/product_detail/a.png"alt=""/>本产品附赠防尘袋。为了避免箱体磕碰划伤，运输托运过程请套上防尘袋保护。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>托运要注意什么事项？</p><p><img src="img/product_detail/a.png"alt=""/>托运过程为了防盗请拨乱海关锁密码。请套上防尘袋避免碰撞刮伤划伤箱体外壳。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>酷MA萌图案的工艺？</p><p><img src="img/product_detail/a.png"alt=""/>UV油墨彩色打印工艺。日常清洁保养注意用湿布擦拭，通风处晾干，避免磕碰或利器刮伤。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>这个产品是酷MA萌正版授权吗？</p><p><img src="img/product_detail/a.png"alt=""/>是正版授权，拉杆箱对应的授权码是#28451，拉杆箱单独售卖版的吊牌上会贴有防伪标签。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>有隔层吗？</p><p><img src="img/product_detail/a.png"alt=""/>有的。内部结构设计，多个拉链收纳层，能分门别类更好的归纳随身物品，拉链夹袋统一存放各类证件卡片，取用更方便。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>本产品支持7天无理由退货吗？</p><p><img src="img/product_detail/a.png"alt=""/>客户购买商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下（配件、外包装和防伪标签完整），可无理由退货。（部分商品除外，详情请见各商品细则）</p></div>',
	1529308541632,
	150,
	true,
	4
);

#乐心智能体脂秤A3-F
INSERT INTO mz_product VALUES(
	null,
	21,
	"乐心智能体脂秤A3-F",
	"静音双排万向轮设计，具备安全TSA海关锁",
	69.00,
	null,
	"白色",
	"img/product_detail/lexintizhicheng/white.png",
	'<img src="img/product_detail/lexintizhicheng/details/info1.jpg"alt=""/><img src="img/product_detail/lexintizhicheng/details/info2.jpg"alt=""/><img src="img/product_detail/lexintizhicheng/details/info3.jpg"alt=""/><img src="img/product_detail/lexintizhicheng/details/info4.jpg"alt=""/><img src="img/product_detail/lexintizhicheng/details/info5.jpg"alt=""/><img src="img/product_detail/lexintizhicheng/details/info6.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>乐心</td></tr><tr class="desc"><td>品名</td><td>乐心体脂称A3-F</td></tr><tr class="desc"><td>尺寸</td><td>10000mAh</td></tr><tr class="desc"><td>尺寸</td><td>280*245*23mm</td></tr><tr class="desc"><td>重量</td><td>1400g</td></tr><tr class="desc"><td>面板材质</td><td>玻璃面板</td></tr><tr class="desc"><td>显示屏幕</td><td>LED显示</td></tr><tr class="desc"><td>功能</td><td>专业测量BMI支持微信扫一扫蓝牙获取数据多用户自动识别，同步手机端</td></tr><tr class="head-title"><th colspan="2">测量参数</th></tr><tr class="desc"><td>称量范围</td><td>5kg-150kg</td></tr><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>连接方式</td><td>蓝牙连接</td></tr><tr class="desc"><td>是否有APP</td><td>有</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>主机x 1<br>说明书x 1<br>保修卡x 1<br>7号电池×3</td></tr></tbody></table>',
	'<h3 class="title">热门回答</h3><div><p><img src="img/product_detail/q.png"alt=""/>什么是BIA测量？</p><p><img src="img/product_detail/a.png"alt=""/>乐心体脂秤Q1/P1采用BIA生物阻抗测量原理，医院中使用的人体成分分析仪也是运用这种测量原理。测量时设备电极片发出安全微弱电流流经人体，测量人体的生物阻抗，从而计算人体脂肪含量。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>BMI含义</p><p><img src="img/product_detail/a.png"alt=""/>BMI含义,回答：BMI是目前国际上判定肥胖最通用的标准，即体重除以身高的平方值。乐心的BMI判定标准，是采用中国国家卫生与计划生育委员会颁布的标准。相比国际WHO标准和亚洲标准，乐心采用的中国标准才最适合中国人的体型。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>18项数据是什么</p><p><img src="img/product_detail/a.png"alt=""/>通过脂肪秤监测用户的体重数据与生物电阻抗后，经过领先算法及人体大数据模型分析后，在乐心运动App共可展示12项身体成分数据，分别是：体重、体型、BMI、骨量、去脂体重、身高得分、脂肪率、肌肉量、基础代谢、脂肪量、身体年龄、内脏脂肪等级、水分率、蛋白质、肌肉率、骨髓肌、肌肉控制、脂肪控制，提供更全面的身体数据与健康指引。</p></div><div><p><img src="img/product_detail/q.png"alt=""/>水分率含义</p><p><img src="img/product_detail/a.png"alt=""/>乐心体脂秤使用安全微弱电流，流经人体时可以穿透细胞膜，测量细胞的内液和外液，从而测量人体内的总水分。水是生命的基础，适当的水分对于细胞活动和代谢都非常重要。</p></div>',
	1529308541632,
	150,
	true,
	4
);

#魅族手环
INSERT INTO mz_product VALUES(
	null,
	22,
	"魅族手环",
	"腕间流动的心率专家",
	169.00,
	null,
	"白色",
	"img/product_detail/mzshouhuan/black.png",
	'<img src="img/product_detail/mzshouhuan/details/info1.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info2.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info3.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info4.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info5.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info6.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info7.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info8.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info9.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info10.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info11.jpg"alt=""/><img src="img/product_detail/mzshouhuan/details/info12.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>魅族手环H1</td></tr><tr class="desc"><td>重量</td><td>20g</td></tr><tr class="desc"><td>兼容平台</td><td>iOS 8.0及以上版本<br>Android 4.4及以上版本</td></tr><tr class="desc"><td>防水等级</td><td>IP67</td></tr><tr class="desc"><td>手环主体尺寸</td><td>16.2x11.8x58mm</td></tr><tr class="desc"><td>手腕尺寸</td><td>150~195mm</td></tr><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>连接方式</td><td>蓝牙连接</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>说明书x 1<br>充电线X1<br>三包凭证x 1<br>手环x 1</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	5
);

#魅族蓝牙小音箱
INSERT INTO mz_product VALUES(
	null,
	23,
	"魅族蓝牙小音箱",
	"好音感 直达心灵",
	99.00,
	null,
	"深空灰",
	"img/product_detail/mzxyx/gray.png",
	'<img src="img/product_detail/mzxyx/details/info1.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info2.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info3.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info4.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info5.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info6.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info7.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info8.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info9.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info10.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info11.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info12.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info13.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info14.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info15.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>蓝牙小音箱</td></tr><tr class="desc"><td>尺寸</td><td>108*55mm</td></tr><tr class="desc"><td>重量</td><td>170g</td></tr><tr class="desc"><td>是否支持蓝牙</td><td>支持</td></tr><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>100~20KHz</td></tr><tr class="desc"><td>频率范围</td><td>2.402MHz-2.480MHz</td></tr><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>蓝牙版本</td><td>4.2版本</td></tr><tr class="desc"><td>连接方式</td><td>3.5mm音频接口/蓝牙连接</td></tr><tr class="desc"><td>播放时长</td><td>8小时（最大音量）15小时（50%音量）</td></tr><tr class="desc"><td>供电方式</td><td>内置电池</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>挂绳x 1<br>蓝牙音箱x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

INSERT INTO mz_product VALUES(
	null,
	23,
	"魅族蓝牙小音箱",
	"好音感 直达心灵",
	99.00,
	null,
	"皓月白",
	"img/product_detail/mzxyx/white.png",
	'<img src="img/product_detail/mzxyx/details/info1.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info2.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info3.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info4.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info5.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info6.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info7.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info8.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info9.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info10.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info11.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info12.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info13.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info14.jpg"alt=""/><img src="img/product_detail/mzxyx/details/info15.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅族</td></tr><tr class="desc"><td>型号</td><td>蓝牙小音箱</td></tr><tr class="desc"><td>尺寸</td><td>108*55mm</td></tr><tr class="desc"><td>重量</td><td>170g</td></tr><tr class="desc"><td>是否支持蓝牙</td><td>支持</td></tr><tr class="head-title"><th colspan="2">音质参数</th></tr><tr class="desc"><td>频响范围</td><td>100~20KHz</td></tr><tr class="desc"><td>频率范围</td><td>2.402MHz-2.480MHz</td></tr><tr class="head-title"><th colspan="2">其他参数</th></tr><tr class="desc"><td>蓝牙版本</td><td>4.2版本</td></tr><tr class="desc"><td>连接方式</td><td>3.5mm音频接口/蓝牙连接</td></tr><tr class="desc"><td>播放时长</td><td>8小时（最大音量）15小时（50%音量）</td></tr><tr class="desc"><td>供电方式</td><td>内置电池</td></tr><tr class="head-title"><th colspan="2">包装清单</th></tr><tr class="desc"><td>包装清单</td><td>挂绳x 1<br>蓝牙音箱x 1<br></td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	2
);

#魅蓝 休闲旅行双肩包
INSERT INTO mz_product VALUES(
	null,
	24,
	"魅蓝 休闲旅行双肩包",
	"曲面一体式 多功能隔层 极简与线条之美",
	199.00,
	null,
	"灰色",
	"img/product_detail/mzxxbb/gray.png",
	'<img src="img/product_detail/mzxxbb/details/info1.jpg"alt=""/><img src="img/product_detail/mzxxbb/details/info2.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>品名</td><td>魅蓝休闲旅行双肩包</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	4
);
INSERT INTO mz_product VALUES(
	null,
	24,
	"魅蓝 休闲旅行双肩包",
	"曲面一体式 多功能隔层 极简与线条之美",
	199.00,
	null,
	"黑色",
	"img/product_detail/mzxxbb/black.png",
	'<img src="img/product_detail/mzxxbb/details/info1.jpg"alt=""/><img src="img/product_detail/mzxxbb/details/info2.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>品名</td><td>魅蓝休闲旅行双肩包</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	4
);

#魅蓝旅行包
INSERT INTO mz_product VALUES(
	null,
	25,
	"魅蓝旅行包",
	"轻盈负重 细节开花",
	269.00,
	null,
	"灰色",
	"img/product_detail/mzlxb/gray.png",
	'<img src="img/product_detail/mzlxb/details/info1.jpg"alt=""/><img src="img/product_detail/mzlxb/details/info2.jpg"alt=""/>',
	'<table class="specification-info"><tbody><!--1--><tr class="head-title"><th colspan="2">基础信息</th></tr><tr class="desc"><td>品牌</td><td>魅蓝</td></tr><tr class="desc"><td>品名</td><td>魅蓝旅行包</td></tr></tbody></table>',
	'<div style="text-align: center;"><img style="margin-top: 80px;" src="img/nope.png"/></div>',
	1529308541632,
	150,
	true,
	4
);