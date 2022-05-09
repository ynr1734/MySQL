-- WS01
-- 1. 직원정보를 출력한다. 직원의 연봉 정보와 연봉의 세금 정보를 같이 출력한다. (세금은 10%)
SELECT * FROM emp;
SELECT empname, salary, (salary * 0.1) as tax FROM emp;

-- 2. 직원정보 중 2001 이전에 입사하였고 월급이 4000만원 미만인 직원을 조회한다.
SELECT empname, hdate, salary FROM emp
WHERE hdate < '2001-01-01'
AND salary < 4000;

-- 3. manager가 있는 직원 중 이름에 '자'가 들어가있는 직원정보를 조회한다.
SELECT empname,manager FROM emp
WHERE empname like '%자%'
AND manager IS NOT NULL;

-- 4. 월급이 2000만원 미만은 '하', 4000만원 미만은 '중', 4000만원 이상은 '고'를 출력한다.
SELECT empname,salary,
CASE
	WHEN salary <= 2000 THEN '하' 
	WHEN salary <= 4000 THEN '중'
	ELSE '고'
END AS level
FROM emp;

-- WS02
-- 5. 부서별 월급의 평균을 구하시오. 단, 평균이 3000 이상인 부서만 출력하시오.
SELECT titleno, ROUND(AVG(salary)) as savg FROM emp
GROUP BY titleno
HAVING ROUND(AVG(salary)) >= 3000
AND titleno IS NOT NULL;

-- 6. 부서별 대리와 사원 연봉의 평균을 구하시오. 단, 평균이 2500 이상인 부서만 출력하시오.
SELECT titleno, ROUND(AVG(salary)) as savg FROM emp
GROUP BY titleno
HAVING titleno = '10' OR titleno = '20'
AND ROUND(AVG(salary)) >= 2500;

-- 7. 2000년부터 2002년에 입사한 직원들의 월급의 평균을 구하시오.
SELECT ROUND(AVG(salary)) AS savg FROM emp
WHERE hdate BETWEEN '2000-01-01' AND '2002-12-31';

-- 8. 부서별 월급의 합의 ranking을 1위부터 조회하시오.
SELECT titleno, SUM(salary) as ssum FROM emp
GROUP BY titleno
HAVING titleno IS NOT NULL
ORDER BY ssum DESC;

-- 9. 서울에서 근무하는 직원들을 조회하시오.
SELECT e.empname, d.deptname FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE deptloc = '서울';

-- 10. 이영자가 속한 부서의 직원들을 조회하시오.
SELECT e.empname, d.deptname FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE e.deptno = (SELECT deptno FROM emp
WHERE empname = '이영자');

-- 11. 김강국의 타이틀과 같은 직원들을 조회하시오.
SELECT e.empname, t.titlename FROM emp e
INNER JOIN title t ON e.titleno = t.titleno
WHERE e.titleno = (SELECT titleno FROM emp
WHERE empname = '김강국');

-- WS03
-- 1. 2000년 이후 입사한 사원들의 정보를 출력하시오. (사번, 이름, 타이틀, 부서, 지역)
SELECT e.empno, e.empname, t.titlename, t.titleno, d.deptloc FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
LEFT OUTER JOIN title t ON e.titleno = t.titleno
WHERE date_format(hdate,'%Y') >= '2000'; 

-- 2. 부서 이름별 월급의 평균을 구하시오. 단, 평균이 3000 이상인 부서만 출력하시오.
SELECT d.deptname, ROUND(AVG(salary)) as savg FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptname
HAVING savg >= 3000;

-- 3. 대구 지역의 직원들의 평균 연봉을 구하시오.
SELECT d.deptloc, ROUND(AVG(salary)) as savg FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptloc
HAVING deptloc = '대구';

-- 4. 홍영자 직원과 같은 부서 직원들의 근무 월수를 구하시오 .
SELECT e.empname, d.deptno, PERIOD_DIFF(DATE_FORMAT(NOW(),'%Y%m'),
DATE_FORMAT(hDate,'%Y%m')) as months FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptno = (SELECT e.deptno FROM emp e
 WHERE e.empname = '홍영자');

-- 5. 입사 년수가 가장 큰 직원 순으로 정렬하여 순위를 정한다. (이름, 부서명, 직위, 입사년수)
SELECT e.empname, d.deptname, t.titlename, YEAR(hdate) as years FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
LEFT OUTER JOIN title t ON e.titleno = t.titleno
ORDER BY years DESC;
