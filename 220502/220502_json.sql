SELECT * FROM emp;
SELECT JSON_OBJECT('empno', empno,'empname',empname) 
AS JSONDATA
FROM emp;