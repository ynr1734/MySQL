-- 주문상세정보 (고객ID, 상품명, 배송상태, 받는사람, 양, 가격, 등급, 생산지, total price)
SELECT o.cid, m.name, o.dstatus, s.receiver, d.amount, m.price, m.grade, 
m.country, (d.amount * m.price) as totalPrice FROM detail d
INNER JOIN ordertbl o ON o.onum = d.onum
INNER JOIN meat m ON m.id = d.meatid
INNER JOIN shipping s ON s.shipnum = o.shipnum;

-- v_ordertbl(주문정보) (고객id, 받는사람, 배송지, 우편번호, 전화번호, 주문날짜, 
-- 배송상태, 결제날짜, 결제상태, 총 결제금액)
SELECT o.cid, s.receiver, s.addr2, s.zip, s.phone, o.date, 
o.dstatus, p.pdate, o.pstatus, SUM(d.amount * m.price) as totalPrice FROM ordertbl o
INNER JOIN shipping s ON s.shipnum = o.shipnum
INNER JOIN payment p ON p.pnum = o.pnum
INNER JOIN detail d ON d.onum = o.onum
INNER JOIN meat m ON m.id = d.meatid
GROUP BY o.cid;

-- cart view 장바구니 (상품명, 등급, 도축일, 국가, 수량, 가격)
CREATE VIEW v_cart
AS
SELECT m.name, m.grade, m.death, m.country, d.amount, m.price FROM cart c
INNER JOIN meat m ON m.id = c.mid
INNER JOIN detail d ON d.meatid = m.id;

SELECT * FROM v_cart;
UPDATE v_cart SET price = 20000 WHERE name = '안심';

-- coupon 쓰기 @!!!!!!!!!!!!!!!!
