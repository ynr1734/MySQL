SELECT * FROM cust;
SELECT * FROM item;
SELECT * FROM cart;
INSERT INTO cart 
VALUES (NULL,'id03',1000,3,CURRENT_DATE());

SELECT c.id, cu.name, i.name, i.price, (c.num * i.price) FROM cart c
INNER JOIN cust cu ON c.custid = cu.id
INNER JOIN item i ON c.itemid = i.id
WHERE i.price > 15000;

-- 장바구니에 고객 이름별 총 금액의 평균을 구하시오.
SELECT cu.name, AVG(c.num * i.price) AS iavg FROM cart c
INNER JOIN cust cu ON c.custid = cu.id
INNER JOIN item i ON c.itemid = i.id
GROUP BY cu.name
HAVING iavg >= 100000;

