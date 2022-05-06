CREATE TABLE BOOK(
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50),
 author VARCHAR(50),
 isbn VARCHAR(50),
 status BIT (50)
);

-- CREATE
INSERT INTO BOOK VALUES (NULL, 'Leaving Time', 'Jodi Picoult', 9781444778168e, 0);
INSERT INTO BOOK VALUES (NULL, 'Three', 'Ted Dekker', 9780849945120, 0);
-- UPDATE
UPDATE BOOK SET name='1111', author='Ted Dekker' WHERE id= '2';
-- DELETE
DELETE FROM BOOK WHERE id='2';
-- READ ALL
SELECT * FROM BOOK;
-- READ ONE
SELECT * FROM BOOK WHERE id = '1'

