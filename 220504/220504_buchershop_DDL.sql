-- DDL
DROP DATABASE IF EXISTS butchershopdb;
CREATE DATABASE butchershopdb;
USE butchershopdb;

DROP TABLE IF EXISTS cust;
DROP TABLE IF EXISTS meat;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS cate;
DROP TABLE IF EXISTS ordertbl;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS shipping;
DROP TABLE IF EXISTS detail;
DROP TABLE IF EXISTS coupon;

/*
ORDER
1. NULL
2. PRIMARY KEY---
    ALTER TABLE cust
    ADD CONSTRAINT PRIMARY KEY (id);
3. FORIEGN KEY---
    ALTER TABLE cate
    ADD CONSTRAINT FOREIGN KEY (pid) REFERENCES cate(id);
4. AUTO_INCREMENT---
    ALTER TABLE product MODIFY id INT AUTO_INCREMENT;
    ALTER TABLE product AUTO_INCREMENT = 1000;
5. UNIQUE---
    ALTER TABLE cate
    ADD CONSTRAINT UNIQUE (name);
6. CHECK---
    ALTER TABLE product ADD CONSTRAINT CHECK (price > 0);
7. DEFAULT---
    ALTER TABLE cust
    ALTER COLUMN addr SET DEFAULT 'Seoul';
*/

-- cust table

CREATE TABLE cust(
	id VARCHAR(30) NOT NULL PRIMARY KEY,
    pw VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    addr VARCHAR(100) NOT NULL,
    regdate DATE NOT NULL
    );

 -- cate table

CREATE TABLE cate(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
	ctid INT 
);
ALTER TABLE cate ADD CONSTRAINT UNIQUE (name);
ALTER TABLE cate ADD CONSTRAINT FOREIGN KEY (ctid)
REFERENCES cate (id);

 -- meat table
 
CREATE TABLE meat(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    price INT NOT NULL,
    grade CHAR(1) NOT NULL,
	country VARCHAR(20) NOT NULL,
    death DATE NOT NULL,
    ctnum INT NOT NULL
);
ALTER TABLE meat MODIFY id INT AUTO_INCREMENT;
ALTER TABLE meat AUTO_INCREMENT = 100;
ALTER TABLE meat ADD CONSTRAINT CHECK (price > 0);
ALTER TABLE meat ADD CONSTRAINT FOREIGN KEY (ctnum) 
REFERENCES cate (id);

 -- cart table

CREATE TABLE cart(
	num INT NOT NULL PRIMARY KEY,
    cid VARCHAR(30) NOT NULL,
    mid INT NOT NULL,
	amount INT NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (cid)
REFERENCES cust (id);
ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (mid)
REFERENCES meat (id);
ALTER TABLE cart MODIFY num INT AUTO_INCREMENT;
ALTER TABLE cart AUTO_INCREMENT = 10;


 -- payment table

CREATE TABLE payment(
	pnum INT NOT NULL PRIMARY KEY,
    way VARCHAR(20) NOT NULL,
    pdate DATE NOT NULL
);
ALTER TABLE payment MODIFY pnum INT AUTO_INCREMENT;
ALTER TABLE payment AUTO_INCREMENT = 1000;

 -- shipping table

CREATE TABLE shipping(
	shipnum INT NOT NULL PRIMARY KEY,
    addr1 VARCHAR(30) NOT NULL,
    addr2 VARCHAR(30) NOT NULL,
    zip CHAR(5) NOT NULL,
    receiver VARCHAR(20) NOT NULL,
    phone VARCHAR(30)NOT NULL ,
    memo VARCHAR(100)
);
ALTER TABLE shipping MODIFY shipnum INT AUTO_INCREMENT;
ALTER TABLE shipping AUTO_INCREMENT = 10000;

 -- coupon table

CREATE TABLE coupon(
	id VARCHAR(30) NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    period DATE,
    saleRate DOUBLE NOT NULL
);

 -- mycoupon table

CREATE TABLE mycoupon(
	mcid INT NOT NULL PRIMARY KEY,
    id VARCHAR(30) NOT NULL,
    id2 VARCHAR(30) NOT NULL
);
ALTER TABLE mycoupon ADD CONSTRAINT FOREIGN KEY (id) 
REFERENCES coupon (id);
ALTER TABLE mycoupon ADD CONSTRAINT FOREIGN KEY (id2) 
REFERENCES cust (id);


 -- ordertbl table

CREATE TABLE ordertbl(
	onum INT NOT NULL PRIMARY KEY,
    cid VARCHAR(30) NOT NULL,
	total INT NOT NULL,
    pstatus VARCHAR(20) NOT NULL,
    dstatus VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    pnum INT NOT NULL,
    shipnum INT NOT NULL ,
    mcid INT
);
ALTER TABLE ordertbl ADD CONSTRAINT FOREIGN KEY (cid) 
REFERENCES cust (id);
ALTER TABLE ordertbl ADD CONSTRAINT FOREIGN KEY (pnum) 
REFERENCES payment (pnum);
ALTER TABLE ordertbl ADD CONSTRAINT FOREIGN KEY (shipnum) 
REFERENCES shipping (shipnum);
ALTER TABLE ordertbl ADD CONSTRAINT FOREIGN KEY (mcid) 
REFERENCES mycoupon (mcid);

ALTER TABLE ordertbl MODIFY onum INT AUTO_INCREMENT;
ALTER TABLE ordertbl AUTO_INCREMENT = 001;

ALTER TABLE ordertbl ADD CONSTRAINT CHECK (total > 0);



 -- detail table

CREATE TABLE detail(
	detailno INT NOT NULL PRIMARY KEY,
    onum INT NOT NULL,
    meatid INT NOT NULL,
    amount INT
);
ALTER TABLE detail ADD CONSTRAINT FOREIGN KEY (onum) 
REFERENCES ordertbl (onum);
ALTER TABLE detail ADD CONSTRAINT FOREIGN KEY (meatid) 
REFERENCES meat (id);

ALTER TABLE detail MODIFY detailno INT AUTO_INCREMENT;
ALTER TABLE detail AUTO_INCREMENT = 200;

ALTER TABLE detail ALTER COLUMN amount SET DEFAULT '1';
