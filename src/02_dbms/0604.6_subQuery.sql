-- [Ⅵ] SUB QUERY : QUERY안에 QUERY가 내포
-- 1. 서브 쿼리 개념
-- 급여를 제일 많이 받는 사람의 이름과 급여
SELECT MAX(SAL) FROM EMP;   -- 서브쿼리 -> 메인쿼리에 포함됨.
SELECT ENAME, SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);  -- 메인쿼리(실행할 쿼리)
-- 서브쿼리 종류(1) 단일행 서브쿼리(서브쿼리 결과가 단일행) = > >= != < <=
-- SCOTT이 근무하는 부서이름 출력
SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';    -- EQUI JOIN
SELECT DEPTNO FROM EMP WHERE EMANE='SCOTT';
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME= 'SCOTT');
--서브쿼리 종류(2) 다중행서브쿼리(서브쿼리결과가 2행이상)  - IN, ANY, ALL, EXISTS
    -- JOB이 MANAGER인 사람의 부서이름
    SELECT DNAME 
        FROM DEPT 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');   -- 서브쿼리부분이 (10, 20, 30)으로 바뀌기 때문에 작동하지 않음.
    SELECT DNAME 
        FROM DEPT 
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');   -- 다중행으로 해결!!!! 
-- 2. 단일행 서브쿼리
-- SCOTT과 같은 부서번호인 사람의 이름과 급여
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME<> 'SCOTT';
    SELECT E2.ENAME, E2.SAL 
        FROM EMP E1, EMP E2 
        WHERE E1.DEPTNO=E2.DEPTNO AND E1.ENAME = 'SCOTT' AND E2.ENAME != 'SCOTT';
-- SCOTT과 같은 근무지에 있는 사람의 이름과 급여
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
    SELECT ENAME, SAL 
        FROM EMP, DEPT 
        WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = (SELECT LOC FROM DEPT, EMP WHERE DEPT.DEPTNO=EMP.DEPTNO AND ENAME='SCOTT') AND ENAME != 'SCOTT';
    SELECT E2.ENAME, E2.SAL 
        FROM EMP E1, EMP E2, DEPT D1 
        WHERE E1.DEPTNO=D1.DEPTNO, E1.DEPTNO=E2.DEPTNO;           ------------------------------------------------;;;;;
    ROLLBACK;
-- SCOTT과 같은 부서에 근무하는 사람들의 급여합
    SELECT SUM(SAL) 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
-- SCOTT과 동일한 직책(JOB)을 가진 사원의 모든 필드
    SELECT * 
        FROM EMP 
        WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');
-- DALLAS에서 근무하는 사원의 이름, 부서번호----------------------------------------------------------------------
    SELECT ENAME, DEPTNO
        FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
    SELECT * FROM DEPT;
-- SALES(DNAME) 부서에 근무하는 사원의 이름, 급여
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
-- 'KING'이 직속상사인 사원의 이름과 급여
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
-- EX1) 평균급여 이하로 받는 사원의 이름, 급여를 출력
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
-- EX2) 평균급여 이하로 받는 사원의 이름, 급여 그리고 평균급여를 출력 ★
    SELECT ENAME, SAL, (SELECT ROUND(AVG(SAL)) FROM EMP) 
        FROM EMP 
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
    --    SELECT E2.ENANE, E2.SAL FROM EMP E1, EMP E2 WHERE E1.DEPTNO=E2.DEPTNO AND E2.SAL <= (SELECT AVG(E1.SAL) FROM E1);
-- EX3) 평균급여 이하로 받는 사원의 이름, 급여 그리고 평균과의 차이를 출력
    SELECT ENAME, SAL, ROUND(ABS((SELECT AVG(SAL) FROM EMP)-SAL)) DIFF FROM EMP WHERE SAL<= (SELECT AVG(SAL) FROM EMP);
-- SCOTT과 JOB과 부서번호가 같은 직원의 모든 필드 출력
SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 다중열 서브쿼리
SELECT * FROM EMP WHERE(JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';

-- ★ 총 연습문제
SELECT * FROM EMP;
SELECT * FROM SALGRADE;
--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT ENAME, SAL, HIREDATE 
    FROM EMP 
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP); 
--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME 
    FROM EMP, DEPT 
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL <= (SELECT AVG(SAL) FROM EMP);
--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE 
    WHERE (SAL BETWEEN LOSAL AND HISAL) AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME ^= 'SCOTT';
--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME 
    FROM EMP E, SALGRADE, DEPT D
    WHERE (E.DEPTNO=D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL) AND HIREDATE<= (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME ^= 'SCOTT' 
    ORDER BY SAL DESC;
--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');
--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL>=(SELECT SAL FROM EMP WHERE EMPNO = '7698') AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK'); 
--11.  응용심화. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL >= (SELECT SAL FROM EMP WHERE EMPNO = '7698') AND DNAME = (SELECT DNAME FROM DEPT T, EMP P WHERE T.DEPTNO=P.DEPTNO AND ENAME = 'CLARK');
--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') AND ENAME <> 'BLAKE';
--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 단 급여가 많은 순으로 출력)
SELECT EMPNO, ENAME
    FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;

-- 3. 다중행 서브쿼리 : IN, ALL, ANY=SOME, EXISTS
    --(1) IN    ; 서브쿼리 결과 중 하나라도 일치하면 참
    -- 부서별로 입사일이 가장 늦은 사람의 부서번호, 이름, 입사일, 부서번호
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO;  -- 다중행 서브쿼리
    SELECT ENAME, HIREDATE, DEPTNO FROM EMP
        WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- 다중행!!! 순서 중요!!!
    --급여를 3000이상 받는 사원이 소속된 부서에서 근무하는 사원들의 모든 필드
    SELECT DEPTNO FROM EMP WHERE SAL >= 3000;
    SELECT * FROM EMP
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>3000);    -- 서브쿼리 결과가 만족하는 대상들은 모두 반환됨(?)
    --(2)ALL    ; 서브쿼리 결과가 모두 만족하면 참
    SELECT SAL FROM EMP WHERE DEPTNO = 30;
    -- 30번부서 급여들 모두보다 큰경우 == 30번부서 최대 급여보다 큰 경우
    SELECT * FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);  -- 다중행 서브쿼리
        
    SELECT * FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- 단일행 서브쿼리
    
    --(3)ANY=SOME   ; 서브쿼리결과 하나라도 만족하면 참
    -- 30번 부서 급여들 하나만이라도 큰 경우 == 30번 부서 최소 급여보다 큰 경우
    SELECT * FROM EMP
        WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);   --  다중행 서브쿼리
        
    SELECT * FROM EMP
        WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- 단일행 서브쿼리로 사용하는 경우가 더 많음.
    
    --(4)EXISTS ; 서브쿼리 결과가 존재하면 참(출력)
    SELECT EMPNO, ENAME, SAL
        FROM EMP MANAGER
        WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);  -- 서브쿼리
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO;    -- SELF JOIN, 위 EXISTS 와 동일한 결과
    -- NOT EXISTS면 말단사원.
    SELECT * FROM EMP MANAGER
        WHERE NOT EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);  -- 서브쿼리
    SELECT M.*
        FROM EMP W, EMP M
        WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;  -- SELF JOIN, 위 EXISTS 서브쿼리와 동일한 결과. NULL인 자료는 부하직원이 없음을 의미!
        
    -- ex1. 직급(job)이 MANAGER인 사람이 속한 부서의 부서번호와 지역명
    SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';   -- 서브쿼리
    SELECT DEPTNO, LOC FROM DEPT
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
    
    -- ex2. 연봉이 3000 이상인 사람들 중 연봉등급별 최고 연봉을 받는 사람들의 사번, 이름, 직업, 입사일, 급여, 급여등급(4, 5등급 최고 sal 수령자)
    SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
        GROUP BY GRADE; -- 서브쿼리
        
    SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
        FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL AND
            (GRADE, SAL) IN(SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
             WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
             GROUP BY GRADE);
    
    -- ex3. 입사분기별 최고 연봉을 받는 사원의 분기, 사번, 이름, job, 상사사번, 입사, 급여, 상여(?)
    SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE, 'MM')/3) FROM EMP;  -- 분기 구하는 식
    SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER", MAX(SAL) 
        FROM EMP
        GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3);      -- 서브쿼리
    SELECT CEIL(TO_CHAR(HIREDATE, 'MM')/3) AS "QUARTER", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM 
        FROM EMP 
        WHERE(CEIL(TO_CHAR(HIREDATE, 'MM')/3), SAL) 
        IN (SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3), MAX(SAL) FROM EMP
        GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3));
        
    -- ex4. JOB이 SALESMAN인 사원들 모두보다 급여를 많이 받는 사원의 이름, 급여(ALL / 단일행)
    SELECT ENAME, SAL FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    SELECT ENAME, SAL FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');
    
    -- ex5. 급여가 3000 미만인 사람 중 최근 입사한 사원의 사번, 이름, 연봉, 입사일
    SELECT EMPNO, ENAME, (SAL*12+NVL(COMM,0)) AS "ANNUAL_SAL", HIREDATE 
    FROM EMP 
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP) AND SAL < 3000;
    
-- 여기서부터는 다중행서브쿼리와 단일행서브쿼리, 이전은 단일행서브쿼리
-- 14.  이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 직원의 사원 번호,이름,급여(단 사번 순 출력)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
    ORDER BY EMPNO;
-- 15. 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여
SELECT ENAME, JOB, SAL
    FROM EMP, DEPT
    WHERE DEPT.DEPTNO = EMP.DEPTNO AND INITCAP(LOC) = 'Dallas';
SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE DEPTNO = ANY(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
-- 16. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE INITCAP(ENAME) ='King');

SELECT E.ENAME, E.SAL   -----------------------------------
    FROM EMP E, EMP M
    WHERE E.MGR(+)=M.EMPNO AND M.ENAME = 'KING';
-- 17. SALES부서 사원의 이름, 업무   ------------------------------
SELECT ENAME, JOB
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND DNAME = 'SALES';
    
    
    
-- 18. 월급이 부서 30의 최저 월급보다 높은 사원의 모든 필드
SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); 
    
    
    
-- 19. 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무   ---------------------------------------------------
SELECT ENAME, JOB
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE IN(DEPTNO = 10, 30));
    
-- 20.  FORD와 업무도 월급도 같은 사원의 모든 필드
SELECT * FROM EMP
    WHERE (JOB, SAL) IN(SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD');
-- 21. 이름이 JONES인 직원의 JOB과 같거나 FORD의 SAL 이상을 받는 사원의 정보를 이름, 업무, 부서번호, 급여
    -- 단, 업무별 알파벳 순, 월급이 많은 순으로 출력
SELECT 
SELECT JOB FROM EMP WHERE ENAME = 'JONES';
-- 22. SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여

-- 23. CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원들의 이름,업무
SELECT DISTINCT JOB FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = 'CHICAGO';
-- 24. 부서별로 월급이 평균 월급보다 높은 사원을 사번, 이름, 급여
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;   -- 부서별 평균이 다르게 도출됨......
SELECT EMPNO, ENAME, SAL
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
        -- 사번, 이름, 급여, 부서번호, 해당부서 번호의 평균급여
        SELECT EMPNO, ENAME, SAL, DEPTNO, (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)
            FROM EMP E
            WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);       -- 조건절이 비슷했던 문제가 또 나와서 다른 방법을 썼었는데...
-- 25. 업무별로 평균 월급보다 적은 월급을 받는 사원을 부서번호, 이름, 급여
SELECT DEPTNO, ENAME, SAL FROM EMP WHERE SAL < (SELECT E.SAL FROM EMP E GROUP BY E.JOB) GROUP BY JOB;
SELECT SAL FROM EMP WHERE (SELECT JOB FROM EMP);
-- 26. 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원을 업무, 이름, 사번, 부서번호를 출력(단, 부서번호 순으로 오름차순 정렬)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMP M
    WHERE EXISTS (SELECT * FROM EMP WHERE MGR=MEMPNO);  --EXISTS연산자 이용
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT MGR FROM EMP);   -- IN연산자 이용
SELECT DISTINCT M.JOB, M.ENAME, M.EMPNO, M.DEPTNO
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;    -- SELF JOIN 이용
-- 27.  말단 사원의 사번, 이름, 업무, 부서번호
    -- 26번 문제의 반대이기 때문에 NOT을 
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMP M
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MGR=MEMPNO);
            -------------------------------------------------
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP);   -- (SELECT MGR FROM EMP)에 NULL이 포함되므로 !=NULL에 대한 연산이 발생
        --위 SQL의 반대
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP WHERE NOT MGR IS NULL);
            -------------------------------------------------
SELECT M.JOB, M.ENAME, M.EMPNO, M.DEPTNO
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
    
    
    
    
    
    
    
    
    
    
    
    