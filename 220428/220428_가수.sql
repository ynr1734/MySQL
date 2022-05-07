SELECT * FROM usertbl
WHERE addr = '서울'
AND birthYear > 1970
AND mobile1 IS NOT NULL;

SELECT * FROM usertbl
WHERE height > 170 OR birthYear < 1970;

SELECT * FROM usertbl
WHERE height = 182;

SELECT * FROM usertbl
WHERE height >= 180 AND height <= 183;
-- 위아래가 같은 결과.
SELECT * FROM usertbl
WHERE height BETWEEN 180 AND 183;


SELECT * FROM usertbl
WHERE height = 182 OR height = 170 OR height = 172;
-- 위아래가 같은 결과.
SELECT * FROM usertbl
WHERE height IN (182,170,172);

SELECT * FROM usertbl
WHERE mDate < '2010-10-10'; -- 연산 가능
-- WHERE mDate < '2010' (X)

SELECT * FROM usertbl
WHERE date_format(mDate,'%Y') < '2010'; -- (O)

-- 가입년도가 2005년과 2008년 사이의 회원을 조회하시오.
SELECT * FROM usertbl
WHERE date_format(mDate,'%Y') BETWEEN '2005' AND '2008';
-- 가입년도가 2007, 2009년인 회원을 조회하시오.
SELECT * FROM usertbl
WHERE date_format(mDate,'%Y') IN ('2007','2009');
-- 가입월이 04월, 07월인 회원을 조회하시오.
SELECT * FROM usertbl
WHERE date_format(mDate,'%m') IN ('04','07');
-- %Y %m %d %H %i %s 년월일시분초	

SELECT * FROM usertbl
WHERE name LIKE '%김%'; -- 이름에 '김'이 들어간 사람

SELECT * FROM usertbl
WHERE name LIKE '김__'; -- '김'으로 시작되는 세 글자

SELECT * FROM usertbl
WHERE name LIKE '_종_'; -- 가운데가 '종'인 세 글자

SELECT * FROM usertbl
WHERE name LIKE '_종%'; -- 가운데가 '종'이 들어가는 사람

-- 윤종신 회원과 같은 지역의 회원을 조회하시오.
SELECT addr FROM usertbl
WHERE name = '윤종신';
SELECT * FROM usertbl
WHERE addr = '경남';

SELECT * FROM usertbl
WHERE addr = (SELECT addr FROM usertbl
WHERE name = '윤종신');

-- 윤종신 회원보다 키가 큰 회원을 조회하시오.
SELECT * FROM usertbl
WHERE height > (SELECT height FROM usertbl
WHERE name = '윤종신');

-- 경남 지역의 회원들 키와 동일한 회원들을 조회하시오.
SELECT * FROM usertbl
WHERE height IN (SELECT height FROM usertbl -- subquery에 있는게 여러개 일때는 IN을 쓴다
WHERE addr = '경남');

SELECT * FROM usertbl 
ORDER BY birthYear DESC; -- ORDER BY : 정렬 -- ASC 순서대로 DESC 반대순서로
-- SELECT * FROM usertbl ORDER BY 3; -- : 컬럼넘버

SELECT * FROM usertbl 
ORDER BY height DESC, name ASC; -- = ORDER BY 3 DESC, name 2; 

SELECT * FROM usertbl 
WHERE addr = '서울'
AND birthYear < 1980
ORDER BY name; -- ORDER BY는 맨 마지막에 써서 정렬

SELECT DISTINCT addr FROM usertbl; 
-- DISTINCT : 중복 제외 -- 대부분 컬럼을 하나만 두고 쓰는 경우가 많음

SELECT * FROM usertbl
ORDER BY height
LIMIT 2,5; -- 순위를 걸 때 LIMIT 사용 -- 2번부터 5번까지


