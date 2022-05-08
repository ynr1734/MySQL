SELECT * FROM emp;

-- 1. 부서별 직급별 연봉 평균을 구하시오.
SELECT titleno,deptno, AVG(salary) as savg FROM emp
GROUP BY titleno,deptno;

-- 2. 입사년도 별 월급의 평균을 구하시오.
SELECT date_format(hdate, '%Y'), AVG(salary) as yavg FROM emp
GROUP BY hdate;

-- 3. 부서별 입사 월을 기준으로 연봉의 합을 구하시오.
SELECT date_format(hdate, '%m'), SUM(salary) as mavg FROM emp
GROUP BY date_format(hdate, '%m');

-- 4. 이영업이 속한 부서의 연봉의 평균을 구하시오.
SELECT deptno, ROUND(AVG(salary)) as davg FROM emp
WHERE deptno = (SELECT deptno FROM emp
WHERE empname = '이영업');

-- 5. 홍영자 직급과 같은 직원들의 연봉 평균보다 많이 받는 직원을 구하시오.
SELECT empname, salary FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp
WHERE titleno = (SELECT titleno FROM emp
WHERE empname = '홍영자'));

-- 6. 회사 내 매니저는 총 몇명인지 구하시오.
SELECT COUNT(DISTINCT(manager)) FROM emp;

-- 7. 2000-01-01 부터 2002-12-31일까지 입사한 직원들의 평균연봉을 구하시오.
SELECT ROUND(AVG(salary)) AS savg FROM emp
WHERE hdate BETWEEN '2000-01-01' AND '2002-12-31';
