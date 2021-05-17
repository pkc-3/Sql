#날짜:2021/05/17
#이름:고현석
#내용:3. SQL 확인문제

#실습하기 3-1

CREATE TABLE `tbl_member`(`memberID` CHAR(8) PRIMARY KEY NOT NULL, `memberName` CHAR(10) NOT NULL,`memberAddress` CHAR(40));

CREATE TABLE `tbl_product`(`productName` CHAR(8) PRIMARY KEY NOT NULL, `cost` INT NOT NULL,`makeDate` DATE,`company` CHAR(10),`amount` INT NOT NULL);


#실습하기 3-2
INSERT INTO `tbl_member` VALUES ('jang','장보고','완도군');
INSERT INTO `tbl_member` VALUES ('kang','강감찬','서울시');
INSERT INTO `tbl_member` (`memberID`,`memberName`) VALUES ('kim','김유신');
INSERT INTO `tbl_member` VALUES ('lee','이순신','서울시');


INSERT INTO `tbl_product` VALUES ('냉장고',800,'2021-05-17','LG',1);
INSERT INTO `tbl_product` VALUES ('노트북',1500,'2021-05-17','삼성',5);
INSERT INTO `tbl_product` VALUES ('컴퓨터',1000,'2021-05-17','LG',10);

#실습하기 3-3
SELECT * FROM `tbl_member` WHERE `memberAddress` = '서울시'