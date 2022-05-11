-- DML
-- cust data
SELECT * FROM cust;
INSERT INTO cust VALUES ('id01','1111','yoon','Incheon','2022-05-04');
INSERT INTO cust VALUES ('id02','2222','kim','Seoul','2022-04-04');

-- cate data
SELECT * FROM cate;
INSERT INTO cate VALUES (100,'소',NULL);
INSERT INTO cate VALUES (101,'등심',100);
INSERT INTO cate VALUES (102,'안심',100);
INSERT INTO cate VALUES (200,'돼지',NULL);
INSERT INTO cate VALUES (201,'삼겹살',200);
INSERT INTO cate VALUES (202,'목살',200);
INSERT INTO cate VALUES (300,'닭',NULL);
INSERT INTO cate VALUES (301,'닭다리살',300);
INSERT INTO cate VALUES (302,'닭가슴살',300);

-- meat data
SELECT * FROM meat;
INSERT INTO meat VALUES (NULL,'등심',7000,'A','미국','2022-05-01',101);
INSERT INTO meat VALUES (NULL,'안심',10000,'A','미국','2022-05-01',102);
INSERT INTO meat VALUES (NULL,'삼겹살',5000,'B','대한민국','2022-05-02',201);
INSERT INTO meat VALUES (NULL,'목살',3000,'B','대한민국','2022-05-02',202);
INSERT INTO meat VALUES (NULL,'닭다리살',1000,'B','브라질','2022-05-03',301);
INSERT INTO meat VALUES (NULL,'닭가슴살',500,'B','브라질','2022-05-03',302);

-- cart data
SELECT * FROM cart;
INSERT INTO cart VALUES (NULL,'id01', 103, 10);
INSERT INTO cart VALUES (NULL,'id02', 101, 5);

-- payment data
SELECT * FROM payment;
INSERT INTO payment VALUES (NULL,'CARD','2022-05-05');

-- shipping data
SELECT * FROM shipping;
INSERT INTO shipping VALUES (NULL,'인천광역시','부평구','21392','윤나래',
'010-2515-1734','부재 시 문앞에 두고 가세요.');

-- coupon data
SELECT * FROM coupon;
INSERT INTO coupon VALUES ('cp001','10% 할인!','2022-07-17',10);
INSERT INTO coupon VALUES ('cp002','15% 할인!','2022-07-17',15);

-- mycoupon data
SELECT * FROM mycoupon;
INSERT INTO mycoupon VALUES (1,'cp001','id01');

-- ordertbl data
SELECT * FROM ordertbl;
INSERT INTO ordertbl VALUES (NULL,'id01','15','cart','complate','2022-05-05',1000,10000,1);

-- detail data
SELECT * FROM detail;
INSERT INTO detail VALUES (NULL,1,101,5);
INSERT INTO detail VALUES (NULL,1,103,10);
