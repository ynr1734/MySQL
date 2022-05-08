SELECT * FROM emp;

-- 1. 오늘 날짜 기준으로 입사일부터 며칠이 지났고 몇달이 지났는지 출력하시오.
SELECT empname, hDate, DATEDIFF(NOW(),hDate) AS days, 
PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'), DATE_FORMAT(hDate,'%Y%m'))AS months FROM emp;

-- 2. 직원들 연봉이 4000 이상이면 high, 2500 이상이면 middle, 2500 이하면 low를 출력하시오.
SELECT empname,salary,
CASE
	WHEN salary >= 4000 THEN 'high' 
	WHEN salary >= 2500 THEN 'middle'
	ELSE 'low'
END AS level
FROM emp;

-- 3. 부서별 연봉 평균의 합을 구하시오.
SELECT SUM(a.davg) FROM (
SELECT deptno, ROUND(AVG(salary)) as davg FROM emp
GROUP BY deptno) a;

-- 4. 부서별 오늘 날짜 기준으로 입사일 평균을 구하시오.
SELECT deptno, ROUND(AVG(DATEDIFF(NOW(),hDate))) AS avgdays FROM emp
GROUP BY deptno;

-- 5. 이말숙 직원과 같은 해에 입사한 직원을 조회하시오.
SELECT * FROM emp
WHERE YEAR(hdate) = (SELECT YEAR(hdate) FROM emp
WHERE empname = '이말숙');

-- 6. 부서별 최고 임금을 받는 직원의 평균을 구하고 그 평균보다 많이 받는 직원을 조회하시오.
SELECT empno, salary FROM emp WHERE salary >
(SELECT AVG(a.msalary) FROM
(SELECT deptno, MAX(salary) AS msalary FROM emp
GROUP BY deptno) a);







-- 조별 WS
-- 1. 입사일이 24년 이상인 직원들의 연봉의 평균을 구하시오.
-- 2. 부서별 입사일이 가장 오래 된 직원의 연봉을 구하시오.
-- 3. 직급별 가장 높은 연봉의 직원들을 구하시오.
-- 4. 이말숙 직원보다 늦게 입사한 직원들의 연봉의 합을 구하시오.






