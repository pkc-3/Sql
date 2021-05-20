#날짜:2021/05/20
#이름:고현석 
#내용:5. SQL 연습문제 

#문제1
CREATE TABLE `book`(`bookid` INT PRIMARY KEY AUTO_INCREMENT, `bookname` VARCHAR(20), `publisher` VARCHAR(10), `price` INT);
#문제2
CREATE TABLE `Customer`(`custid` INT PRIMARY KEY AUTO_INCREMENT, `name` VARCHAR(10) NOT NULL , `address` VARCHAR(20) NOT NULL, `phone` VARCHAR(13));
#문제3
CREATE TABLE `Orders`(`orderid` INT PRIMARY KEY AUTO_INCREMENT, `custid` INT, `bookid` INT, `saleprice` INT,`orderdate` DATE);
#문제4
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('축구의 역사','굿스포츠','7000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('축구 아는 여자','나무수','13000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('축구의 이해','대한미디어','22000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('골프 바이블','대한미디어','35000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('피겨 교본','굿스포츠','8000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('역도 단계별기술','굿스포츠','6000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('야구의 추억','이상미디어','20000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('야구를 부탁해','이상미디어','13000');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('올림픽 이야기','삼성당','7500');
INSERT INTO `book` (`bookname`,`publisher`,`price`) VALUES('Olympic Champions','Pearson','13000');

INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer` (`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer` (`name`,`address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,1,6000,'2014-07-01');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,3,21000,'2014-07-03');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2,5,8000,'2014-07-03');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,6,6000,'2014-07-04');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4,7,20000,'2014-07-05');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (1,2,12000,'2014-07-07');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (4,8,13000,'2014-07-07');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Orders`(`custid`,`bookid`,`saleprice`,`orderdate`) VALUES (3,8,13000,'2014-07-10');

#문제5
SELECT * FROM `book`;
#문제6
SELECT DISTINCT `publisher` FROM `book`; #DISTINCT 중복 안나오게
#문제7
SELECT * FROM `book` WHERE price<=20000;
#문제8
SELECT * FROM `book` WHERE price BETWEEN 10000 AND 20000;
#문제9
SELECT * FROM `book` WHERE publisher = '굿스포츠' || publisher = '대한미디어';
SELECT * FROM `book` WHERE publisher IN ('굿스포츠','대한미디어');
#문제10
SELECT publisher FROM `book` WHERE bookname = '축구의 역사';
#문제11
SELECT publisher FROM `book` WHERE bookname LIKE '%축구%'; 
#문제12
SELECT * FROM `book` WHERE bookname LIKE '_구%';
#문제13
SELECT * FROM `book` WHERE price>=20000 && bookname LIKE '%축구%' ;
#문제14
SELECT * FROM `book` ORDER BY bookname ASC; 
#문제15
SELECT * FROM `book` ORDER BY price ASC, bookname ASC;
#문제16
SELECT * FROM `book` ORDER BY price DESC, publisher ASC;
#문제17
SELECT SUM(`saleprice`) AS `총판매액` FROM `Orders`;
#문제18
SELECT SUM(`saleprice`) AS `총매출` FROM `Orders` WHERE custid = 2;
#문제19
SELECT SUM(`saleprice`) AS `총 판매액` , AVG(`saleprice`) AS `평균값`, MIN(`saleprice`) AS `최저가`, MAX(`saleprice`) AS `최고가`  FROM `Orders`;
#문제20
SELECT COUNT(*) AS `판매건수` FROM `Orders`;
#문제21
SELECT custid,COUNT(*) AS `수량` FROM `Orders` WHERE `saleprice` >= 8000 GROUP BY `custid` HAVING `수량` >= 2;
#문제22
SELECT * FROM `Customer` AS a JOIN `Orders`AS b ON a.custid = b.custid;
SELECT * FROM `Customer` AS a, `Orders` AS b WHERE a.custid = b.custid; # 두가지 방법
#문제23
SELECT * FROM `Customer` AS a JOIN `Orders`AS b ON a.custid = b.custid ORDER BY a.custid ASC;
#문제24
SELECT `name`,`saleprice` FROM `Customer` AS a JOIN `Orders`AS b ON a.custid = b.custid;
#문제25
SELECT `name`,SUM(`saleprice`) FROM `Customer` AS a JOIN `Orders`AS b ON a.custid = b.custid GROUP BY `name` ORDER BY `name` ASC;
#문제26
SELECT `name`,`bookname` FROM `Customer` AS a 
JOIN `Orders` AS b ON a.custid=b.custid 
JOIN `book` AS c ON b.bookid = c.bookid; #여러개 테이블 조인하기
#문제27
SELECT `name`,`bookname` FROM `Customer` AS a 
JOIN `Orders` AS b ON a.custid=b.custid 
JOIN `book` AS c ON b.bookid = c.bookid WHERE saleprice = 20000;
#문제28
SELECT `bookname` FROM `book` WHERE price = (SELECT MAX(`price`) FROM `book`);  
#문제29
INSERT INTO `book` (bookname,publisher,price) VALUES('스포츠의학','한솔의학서적',90000);
#문제30
INSERT INTO `book` (bookname,publisher) VALUES('스포츠의학','한솔의학서적');
#문제31
UPDATE `Customer` SET address = '대한민국 부산' WHERE `custid` = '5';
#문제32
DELETE FROM `Customer` WHERE `custid` = '5';