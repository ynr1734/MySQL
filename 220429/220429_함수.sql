SELECT * FROM buytbl;

-- 회원별 구매 금액의 평균을 구하시오
SELECT userID, ROUND(AVG(price*amount),1) AS pavg FROM buytbl
GROUP BY userID
HAVING pavg > 100
ORDER BY pavg DESC;

SELECT COUNT(DISTINCT(userID)) FROM buytbl;

-- groupName 별 구매 고객의 수를 구하시오.
SELECT groupName, COUNT(DISTINCT(userID)) FROM buytbl
GROUP BY groupName;

-- usertbl 회원들의 평균 키보다 큰 회원을 조회하시오
SELECT AVG(height) FROM usertbl;

SELECT * FROM usertbl
WHERE height > (SELECT AVG(height) FROM usertbl);

-- 회원 중 폰을 가지고 있는 회원의 수
SELECT count(mobile1) FROM usertbl;

-- ~별, 그룹별, 회원별
SELECT userID, groupName, SUM(price* amount) as usum FROM buytbl
GROUP BY userID, groupName -- id와 groupName 중에서
HAVING userID IN ('KBS','BBK') -- where 대신 having -- kbs와 bbk 중에서만
AND groupName IS NOT NULL -- groupName이 null인 것을 빼고
ORDER BY userID; -- id 별로 정렬

SELECT num,groupName, SUM(price*amount) FROM buytbl
GROUP BY groupName,num -- groupName으로 먼저 그루핑을 하고 num을 가지고 그루핑
WITH ROLLUP; -- 집계를 함 (num 없는deptemp 부분이 합계)



-- TABLE 생성

DROP TABLE IF EXISTS itemtbl;
CREATE TABLE itemtbl(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL UNIQUE,
    price INT,
    regdate DATE
);
ALTER TABLE itemtbl AUTO_INCREMENT=1000;
INSERT INTO itemtbl VALUES (NULL, 'shirts',NULL,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants1',10000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants2',20000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants3',30000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants4',40000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants5',50000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants6',60000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants7',70000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants8',80000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants9',90000,SYSDATE());
INSERT INTO itemtbl VALUES (NULL, 'pants10',100000,SYSDATE());
SELECT * FROM itemtbl;


DROP TABLE IF EXISTS carttbl;
CREATE TABLE carttbl(
	id INT PRIMARY KEY AUTO_INCREMENT,
    userID CHAR(8) NOT NULL,
    itemID INT,
    qt INT NOT NULL,
    regdate DATE
);

-- 1000,1001
-- BBK KBS JYP

INSERT INTO carttbl VALUES(NULL, 'BBK',1000,10,SYSDATE());
INSERT INTO carttbl VALUES(NULL, 'KBS',1001,5,SYSDATE());
INSERT INTO carttbl VALUES(NULL, 'JYP',1004,2,SYSDATE());

SELECT * FROM carttbl;

DELETE FROM carttbl WHERE userID = 'BBB';


WITH temp(userID,total)
AS
(SELECT userID, SUM(price*amount) FROM buytbl
GROUP BY userID)
SELECT total FROM temp;

-- 각 지역별 가장 키가 큰 키들의 평균을 구하시오.

WITH temp(addr,max)
AS
(SELECT addr, MAX(height) FROM usertbl
GROUP BY addr)
SELECT AVG(max) FROM temp;
-- 위아래가 같은 형식
-- 현업에서는 아래 형식을 더 자주 씀
SELECT a.addr, a.hmax FROM (
SELECT addr, MAX(height) AS hmax FROM usertbl
GROUP BY addr ) a;


SELECT CONCAT(prodName, ' | ' ,groupName) FROM buytbl;

SELECT userID, price*amount AS tt, IF (price*amount > 500, 'Hight','Low') AS level FROM buytbl;

SELECT prodName,IFNULL(groupName,'None') FROM buytbl;
SELECT COUNT(IFNULL(prodName,'None')) FROM buytbl;

SELECT userID,amount,
CASE
	WHEN amount >= 1 AND amount < 2  THEN 'C'
	WHEN amount >= 2 AND amount < 4 THEN 'B'
	WHEN amount >= 4 AND amount < 6 THEN 'A'
    ELSE 'None'
END AS level
FROM buytbl;



SELECT char_length('abc') , length('abc');
SELECT char_length('가나다') , length('가나다');

SELECT FORMAT(123456.123456,4);

SELECT * FROM usertbl;

SELECT mDate,ADDDATE(mDate, INTERVAL 30 DAY),
		SUBDATE(mDate , INTERVAL 30 DAY) 
FROM usertbl;

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT SYSDATE();

SELECT YEAR (SYSDATE());

SELECT YEAR(mDate) FROM usertbl;
SELECT DATE_FORMET(mDate,'%Y%m') FROM usertbl;


SELECT mDate, DATEDIFF(NOW(),mDate) FROM usertbl;

SELECT mDate, 
PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'),DATE_FORMAT(mDate,'%Y%m')) 
FROM usertbl;









