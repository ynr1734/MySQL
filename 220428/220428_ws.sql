-- 1. 직원 중에 manager가 없는 직원을 조회하시오
SELECT * FROM emp
WHERE manager is NULL;

-- 2. 직원들의 월급과 세금(*0.15)을 조회하시오 
-- 월급 컬럼명은 month 로, 세금 컬럼명은 fee로 조회하시오
-- 단, fee가 많은 순으로 정렬하시오
SELECT empname,salary AS month,salary * 0.15 AS fee FROM emp
ORDER BY fee DESC;

-- 3. 01월과 12월에 입사한 직원들 중 이씨를 조회하시오
SELECT * FROM emp
WHERE date_format(hdate, '%m') IN (01,12)
AND empname LIKE '이__';

-- 4. 홍영자 직원의 입사일보다 나중에 입사한 직원들을 조회하시오
SELECT * FROM emp
WHERE hdate > (SELECT hdate FROM emp
WHERE empname = '홍영자');

-- 5. 월급의 범위가 3000에서 4500인 직원 중 manager가 김생산과 같은 직원들을 조회하시오
 SELECT * FROM emp
 WHERE salary BETWEEN 3000 AND 4500
 AND manager = (SELECT manager FROM emp
 WHERE empname = '김생산');