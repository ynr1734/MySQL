CREATE TABLE CUST(
	id VARCHAR(20) PRIMARY KEY,
    pwd VARCHAR(20),
    name VARCHAR(30)
);

CREATE TABLE ITEM(
	id int PRIMARY KEY,
    name VARCHAR(30),
    price FLOAT
);
-- CRUD
-- Create
INSERT INTO CUST VALUES ('id01','pwd01','이말숙');
INSERT INTO CUST VALUES ('id02','pwd02','이말숙');
-- Update
UPDATE CUST SET pwd='1111', name='홍말숙' WHERE id= 'id01';
-- Delete
DELETE FROM CUST WHERE id='id02';
-- Read All
SELECT * FROM CUST;
-- Read One
SELECT * FROM CUST WHERE id = 'id01';

-- CRUD
-- Create
INSERT INTO ITEM VALUES ('1','phone',10000);
INSERT INTO ITEM VALUES ('2','bag',5000);
-- Update
UPDATE ITEM SET name='Wallet', price=10000 WHERE id='1';
-- Delete
DELETE FROM ITEM WHERE id='2';
-- Read All
SELECT * FROM ITEM;
-- Read One
SELECT * FROM ITEM WHERE id = '1'


