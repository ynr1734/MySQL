-- DML
-- cust data
SELECT * FROM cust;
INSERT INTO cust VALUES ('id01','lee','Busan','2019-03-02');
INSERT INTO cust (id,name,regdate) -- 주소를 안 넣고 싶을 때
VALUES ('id02','kim','2020-05-02');

-- cate data
SELECT * FROM cate;
INSERT INTO cate VALUES (10, 'pants', NULL);
INSERT INTO cate VALUES (11, 'shorts pants', 10);
INSERT INTO cate VALUES (20, 'shirts', NULL);
INSERT INTO cate VALUES (21, 'shorts shirts', 20);

SELECT * FROM cate c1
INNER JOIN cate c2 ON c1.pid = c2.id;

-- product data
SELECT * FROM product;
INSERT INTO product VALUES (NULL, 'levis', 10000, curdate(),11);
INSERT INTO product VALUES (NULL, 'bangbang', 20000, curdate(),11);
INSERT INTO product VALUES (NULL, 'levis', 10000, curdate(),21);
INSERT INTO product VALUES (NULL, 'bangbang', 20000, curdate(),21);

-- 제품의 정보를 출력한다.
-- 카테고리명도 출력한다.
SELECT * FROM product p
INNER JOIN cate c ON p.cid = c.id;

-- cart data
SELECT * FROM cart;
INSERT INTO cart VALUES (NULL, 'id01', 1000, CURDATE());
INSERT INTO cart VALUES (NULL, 'id01', 1001, CURDATE());
INSERT INTO cart VALUES (NULL, 'id01', 1003, CURDATE());

-- cart 정보를 출력하시오.
-- 사용자 이름, 상품이름, 가격, 카테고리 이름
SELECT c.id, cu.id AS uid, cu.name AS uname, ca.name AS cname, 
p.id AS pid, p.name AS pname, p.price, c.regdate FROM cart c
INNER JOIN cust cu ON c.uid = cu.id
INNER JOIN product p ON c.pid = p.id
INNER JOIN cate ca ON ca.id = p.cid;

-- DELETE FROM cart;
-- DELETE FROM cust WHERE id = 'id001';
-- UPDATE cust SET id = 'id001' WHERE id = 'id01';


-- Mark View Table

CREATE VIEW v_cart
AS
SELECT c.id, cu.id AS uid, cu.name AS uname, ca.name AS cname, 
p.id AS pid, p.name AS pname, p.price, c.regdate FROM cart c
INNER JOIN cust cu ON c.uid = cu.id
INNER JOIN product p ON c.pid = p.id
INNER JOIN cate ca ON ca.id = p.cid;

UPDATE cart SET regdate = '2020-05-03' WHERE id = 1000;
SELECT * FROM v_cart;
UPDATE v_cart SET regdate = '2019-05-04' WHERE id = 1001;





