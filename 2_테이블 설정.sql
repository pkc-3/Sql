#날짜:2021/05/17
#이름:고현석
#내용:2.테이블 설정

#실습하기2-1
CREATE TABLE `USER2` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13),
	`age` TINYINT);
	
INSERT INTO `USER2` VALUES ('A104','김유신','010-1234-1111',25); 
INSERT INTO `USER2` VALUES ('A105','김춘추','010-1234-2222',23); 
INSERT INTO `USER2` VALUES ('A106','장보고','010-1234-3333',32);
INSERT INTO `USER2` (`age`, `name`, `uid`, `hp`) VALUES(45,'강감찬','A104','010-1234-4444');
INSERT INTO `USER2` SET `name`='이순신', `age`=51,`hp`='010-1234-5555', `uid`='A105';

#실습하기 2-2 고유키 삽입
CREATE TABLE `USER3` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`age` TINYINT);
	
INSERT INTO `USER3` VALUES ('A101','김유신','010-1234-4444',25); 
INSERT INTO `USER3` VALUES ('A102','김춘추','010-1234-5555',23); 
INSERT INTO `USER3` VALUES ('A103','장보고','010-1234-6666',32);
INSERT INTO `USER3` (`uid`,`age`) VALUES ('A107',21);
INSERT INTO `USER3` (`uid`,`age`) VALUES ('A108',31);

#실습하기 2-3
CREATE TABLE `USER4` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`hp` CHAR(13) UNIQUE NOT NULL,
	`age` TINYINT DEFAULT 10);

INSERT INTO `USER4` VALUES ('A101','김유신','010-1234-4444',25); 
INSERT INTO `USER4` VALUES ('A102','김춘추','010-1234-5555',23); 
INSERT INTO `USER4` VALUES ('A103','장보고','010-1234-6666',32);

#실습하기 2-4
CREATE TABLE `USER5` (
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`gender` TINYINT,
	`age` INT,
	`addr` VARCHAR(255)
	);
INSERT INTO `USER5` (`name`,`gender`,`age`,`addr`) VALUES ('김유신',1,25,'김해시');
INSERT INTO `USER5` (`name`,`gender`,`age`,`addr`) VALUES ('김춘추',1,21,'경주시');
INSERT INTO `USER5` (`name`,`gender`,`age`,`addr`) VALUES ('장보고',1,35,'완도군');
INSERT INTO `USER5` (`name`,`gender`,`age`,`addr`) VALUES ('신사임당',2,27,'강릉시');
INSERT INTO `USER5` (`name`,`gender`,`age`,`addr`) VALUES ('이순신',1,51,'서울시');

#실습하기 2-5
CREATE TABLE `USER6` SELECT * FROM `USER5`; #pk,unique,auto_increment 같은 속성은 복사 안됨
SELECT * FROM `USER6`

CREATE TABLE `USER7` LIKE `USER5`; # 속성은 복사되지만 값은 복사안된다.

INSERT INTO `USER7` SELECT * FROM `USER5`; # 값 전부 복사하기
INSERT INTO `USER7` (`name`,`gender`,`age`,`addr`) SELECT `name`,`gender`,`age`,`addr` FROM `USER5`; #지정값을 복사한다.

SELECT * FROM `USER7`;