-- [111] JOIN : 테이블 2개 이상을 연결하여 검색
SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM DEPT;
SELECT * FROM EMP;
-- CROSS JOIN (FROM절에 테이블 2개 이상)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT';  -- 4행 : EMP테이블의 1행 * DEPT의 4행
SELECT * FROM EMP, DEPT; -- 4행 : EMP테이블의 14행 * DEPT의 4행 = 56행;
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DERPTNO;

--★ EQUI JOIN (공통 필드인 DEPTNO값이 일치되는 조건만 JOIN)
SELECT * 
    FROM EMP, DEPT
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME, LOC 
    FROM EMP, DEPT  -- EMP.DEPTNO로 어느 테이블에서 특정 필드를 호출해야할지 분명히 해줘야함.
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
    -- 테이블에 별칭이 있으면 그 별칭으로만(원명칭 이용불가) 테이블을 엑세스 할 수 있다.  
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D    -- 테이블 별칭을 선언. AS 혹은 ""를 사용해서는 안됨.
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    
    --급여가 2000이상인 직원만 이름, 업무(JOB), 급여, 부서명, 근무지를 출력하시오
SELECT ENAME, JOB, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL > 2000;

    --LOC이 CHICAGO인 사람의 이름, 업무, 급여를 출력
SELECT ENAME, JOB, SAL FROM EMP, DEPT WHERE LOC = 'CHICAGO';
    --LOC이 CHICAGO인 사람의 이름, 업무, 급여, 부서명, 근무지를 출력
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE LOC = 'CHICAGO'; -- 와의 차이가 어떻게 되는거지?

    -- 부서번호가 10이거나 20번인 사원의 이름(ENAME), 업무(JOB), 근무지(LOC), 급여순
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO AND E.DEPTNO IN (10, 20)
    ORDER BY SAL;
    
    -- JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉((SAL+COMM)*12), 부서명, 근무지// 연봉이 큰 순으로 정렬
DESCRIBE EMP;
DESCRIBE DEPT;
SELECT * FROM EMP;
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 "연봉", DNAME, LOC 
FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER') ORDER BY 연봉 DESC;
    -- COMM이 NULL이고 급여가 1200 이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명 // 부서명, 급여 큰 순으로 정렬
SELECT ENAME, SAL, HIREDATE, DEPT.DEPTNO, DNAME
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>=1200 AND COMM IS NULL ORDER BY DNAME, SAL DESC;

    -- 'NEW YORK'에서 근무하는 사원의 이름과 급여 출력
SELECT ENAME, SAL 
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = 'NEW YORK';
    -- 'ACCOUNTING'부서 소속의 사원 이름과 입사일 출력
SELECT ENAME, HIREDATE 
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND DNAME = 'ACCOUNTING';
    -- 직급이 MANAGER인 사원의 이름, 부서명 출력
SELECT ENAME, DNAME
FROM EMP, DEPT 
WHERE JOB = 'MANAGER' AND EMP.DEPTNO=DEPT.DEPTNO;    
    -- COMM이 NULL이 아닌 사원의 이름, 급여, 부서번호, 근무지 출력
SELECT ENAME, SAL, DEPT.DEPTNO, LOC 
FROM EMP, DEPT 
WHERE COMM IS NOT NULL AND EMP.DEPTNO=DEPT.DEPTNO;

-- ★ NON-EQUI JOIN
-- 어떤 항목의 일치여부를 확인하는 것이 아니기 때문.
SELECT * FROM SALGRADE;
SELECT * FROM EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND ENAME = 'SCOTT';  -- CROSS
    -- 모든 사원의 사번, 이름, JOB, 상사사번, 급여, 급여등급(1등급, 2등급)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE FROM EMP, SALGRADE WHERE GRADE = 1 OR GRADE = 2; 
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
    -- COMM이 NULL이 아닌 사원의 이름, 급여, 급여등급, 부서번호, 부서이름, 근무지
SELECT ENAME, SAL, GRADE, DEPT.DEPTNO, DNAME, LOC FROM EMP, DEPT WHERE (DEPT.DEPTNO=EMP.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL) AND (COMM IS NOT NULL);

    -- 이름, 급여, 입사일, 급여등급
    -- 이름, 급여, 입사일, 급여등급, 부서명, 근무지
    -- 이름, 급여, 급여등급, 연봉(부서별 정렬, 부서가 같으면 연봉순, 연봉 = (SAL+COMM)*12)
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 AS "연봉" 
FROM SALGRADE, EMP, DEPT 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO 
ORDER BY DNAME, 연봉 DESC;
    -- 이름, 업무(JOB), 급여, 급여등급, 부서번호, 부서명(급여가 1000~3000사이, 부서이름, 업무, 급여 큰 순서 정렬)
SELECT ENAME, JOB, SAL, GRADE, DEPT.DEPTNO, DNAME 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND (SAL BETWEEN 1000 AND 3000) 
ORDER BY DNAME, JOB, SAL DESC;
    -- 이름, 급여, 등급, 입사일, 근무지(81년에 입사한 사람만, 등급 큰 순 정렬)
SELECT ENAME, SAL, GRADE, HIREDATE, LOC 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND HIREDATE LIKE '81/%' -- 시스템이 년도가 먼저오고 2자리만으로 표시하는 형식이어야함.
ORDER BY GRADE DESC;
SELECT ENAME, SAL, GRADE, HIREDATE, LOC 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND TO_CHAR(HIREDATE,'RR')= '81'
ORDER BY GRADE DESC; 
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

-- ★ SELF JOIN
    -- SMITH의 사번, 이름, 매니저번호, 매니저이름을 출력하시오^^
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = 7902;

SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR , MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME = 'SMITH' AND WORKER.MGR= MANAGER.EMPNO;
    -- 모든 사원의 사번, 이름, 상사의 사번, 상사의 이름
SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.MGR, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.EMPNO = MANAGER.MGR;
    --'SMITH의 상사는 FORD다' 포멧으로 출력
SELECT WORKER.ENAME || '의 상사는' || MANAGER.ENAME ||'다'
    FROM EMP WORKER, EMP MANAGER 
    WHERE WORKER.MGR = MANAGER.EMPNO AND WORKER.ENAME = 'SMITH';
    -- 상사의 이름이 'KING'인 사원들의 이름과 JOB을 출력
SELECT * FROM EMP;
SELECT WORKER.ENAME, WORKER.JOB
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO AND MANAGER.ENAME = 'KING'; 
    
    -- SCOTT과 동일한 부서번호에서 근무하는 사람의 이름을 출력하세요
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME='SCOTT' AND E1.DEPTNO = E2.DEPTNO AND E2.ENAME!='SCOTT'; -- '동일 부서번호'의 근무자를 출력하고 싶으므로 테이블의 결합 조건도 동일부서번호가 설정됨(?)
    
    
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP VALUES (9999, '홍', NULL, NULL, NULL, 9000, NULL, 50);
    -- (난이도 上)SCOTT과 동일한 근무지에서 근무하는 사람들의 이름을 출력하세요
SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.ENAME = 'SCOTT' AND
        E1.DEPTNO = D1.DEPTNO AND E2.DEPTNO = D2.DEPTNO AND
        D1.LOC = D2.LOC;
    
    ROLLBACK;   -- 데이터를 입력, 추가, 삭제, 수정(DML)을 취소
SELECT * FROM DEPT;
SELECT * FROM EMP;

-- OUTER JOIN : 조인시 조건에 만족하지 않는 행까지 표시
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    --"SMITH의 매니저는 FORD입니다." 포멧으로 출력
    --"KING의 매니저는 無입니다."
SELECT W.ENAME || '의 매니저는 ' || NVL(M.ENAME,'無') || '입니다.'
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    -- ★★★ 말단사원의 이름         
            --- (+)가 반대편에 있으면 자신을 관리하는 매니저가 없는 임원들도 포함, (+)가 왼편에 있기 때문에 말단사원이 분류되어 반환됨.
            --- 아직 여러 필드에 걸친 NULL자료가 발생하는 이유를 이해 못했음...ㅠ
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- 1단계
SELECT M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- 완성 2단계
    
-- 셤 연습문제
SELECT* FROM EMP;
SELECT* FROM DEPT;
SELECT* FROM SALGRADE;
--예제 PART1
--1. EMP테이블의 모든 사원에 대해 사원명과 직속상사명을 출력하시오.
SELECT WORKER.ENAME EMPLOYEE, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO(+);
--2. 상사가 있는 직원에 대해 사원명, 급여, 직책, 직속상사명을 출력하시오.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, WORKER.JOB, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO;
--3. 상사가 없는 직원과 상사가 있는 직원들 모두에 대해 사원명, 급여, 직책, 직속상사명을 출력하시오.
SELECT WORKER.ENAME, WORKER.SAL, WORKER.JOB, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO(+);
--4. 상사가 있는 직원에 대해 사원명, 사원명, 급여, 부서명, 직속상사명을 출력하시오.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, DNAME, BOSS.ENAME AS MANAGER
    FROM EMP WORKER, DEPT, EMP BOSS
    WHERE DEPT.DEPTNO=WORKER.DEPTNO AND WORKER.MGR=BOSS.EMPNO;
--5. 상사가 없는 직원과 상사가 있는 직원 모두에 대해 사원명, 급여, 부서코드, 부서명, 근무지, 직속상사명을 출력하시오. 
-- 단, 직속상사가 없을 경우 직속상사명에는 ‘없음’으로 대신 출력하시오.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, WORKER.DEPTNO, DNAME, LOC, NVL(BOSS.ENAME, '없음') AS MANAGER
    FROM EMP WORKER, DEPT, EMP BOSS
    WHERE DEPT.DEPTNO=WORKER.DEPTNO AND WORKER.MGR=BOSS.EMPNO(+);
--6. 급여가 2000이상인 사원에 대해 사원명, 급여, 급여등급, 부서명, 직속상사명을 출력하시오.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE (WORKER.MGR=BOSS.EMPNO(+)) AND (WORKER.DEPTNO=DEPT.DEPTNO) AND (WORKER.SAL BETWEEN LOSAL AND HISAL) AND (WORKER.SAL >= 2000);
--7. 상사가 있는 직원과 상사가 없는 직원 모두에 대해 사원명, 급여, 급여등급, 부서명, 직속상사명 을 부서명 알파벳 순으로 정렬하여 출력하시오.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE (WORKER.MGR=BOSS.EMPNO(+)) AND (WORKER.DEPTNO=DEPT.DEPTNO) AND (WORKER.SAL BETWEEN LOSAL AND HISAL) 
    ORDER BY DNAME;
--8.  사원명, 급여, 급여등급, 부서명, 연봉, 직속상사명을 출력하시오. 단 연봉은 (SAL+COMM)*12로 계산한다.  -----------------------------
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, (WORKER.SAL+NVL(WORKER.COMM,0))*12 AS ANNUAL_SAL, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE WORKER.MGR=BOSS.EMPNO AND DEPT.DEPTNO=WORKER.DEPTNO AND (WORKER.SAL BETWEEN LOSAL AND HISAL);
--9. 위 8번을 부서명 알파벳 순으로 정렬하고 부서명이 같으면 급여가 큰 사원에서 작은 사원 순으로 정렬하여 출력하시오.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, (WORKER.SAL+NVL(WORKER.COMM,0))*12 AS ANNUAL_SAL, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE WORKER.MGR=BOSS.EMPNO AND DEPT.DEPTNO=WORKER.DEPTNO AND (WORKER.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY DNAME, SAL DESC;

--예제PART2
SELECT* FROM EMP;
SELECT* FROM DEPT;
SELECT* FROM SALGRADE;
-- 1. EMP테이블의 모든 사원에 대해 사원명, 부서번호 부서명을 출력하시오.
SELECT ENAME, DEPTNO
    FROM EMP;
--2. EMP테이블에서 NEW YORK에서 근무하고 있는 사원에 대해 사원명, 직책, 급여, 부서명을 출력하시오.
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP,DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND LOC = 'NEW YORK';
--3. EMP테이블에서 상여(COMM)를 받는 사원에 대해 사원명, 부서명, 위치를 출력하시오.
SELECT ENAME, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND COMM>0;
--4. EMP테이블에서 사원명에 알파벳 L이 있는 사원에 대해 사원명, 직책, 부서명, 근무지를 출력하시오.
SELECT ENAME, JOB, DNAME, LOC
    FROM DEPT, EMP
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND ENAME LIKE '%L%'; 
--5. EMP테이블에서 사번, 사원명, 부서번호, 부서명을 출력하되 사원명 알파벳 순으로 출력하시오.
SELECT EMPNO, ENAME, DEPT.DEPTNO, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
    ORDER BY ENAME;
--6. 급여가 2000이상인 사원에 대해 사번, 사원명, 급여, 부서명을 급여기준으로 내림차순 정렬하여 출력하시오.
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL <=2000
    ORDER BY SAL DESC;
--7. 직책이 MANAGER이며 급여가 2500이상인 사원에 대해 사번, 사원명, 직책, 급여, 부서명을 사번 기준으로 오름차순 정렬하여 출력하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND JOB = 'MANAGER' AND SAL >= 2500
    ORDER BY EMPNO;
--8. 사번, 사원명, 직책, 급여, 급여등급을 급여기준으로 내림차순 정렬하여 출력하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
--9. 상사가 없는 직원과 상사가 있는 직원 모두에 대해, 사원명, 직속상사명을 출력하시오.
SELECT WORKER.ENAME, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR = BOSS.EMPNO(+); 
--10.상사가 없는 직원과 상사가 있는 직원 모두에 대해, 사원명, 상사명, 상사의 상사명을 출력하시오.
SELECT WORKER.ENAME, BOSS.ENAME AS MANAGER, HEADCOACH.ENAME AS HEADCOACH
    FROM EMP WORKER, EMP BOSS, EMP HEADCOACH
    WHERE WORKER.MGR = BOSS.EMPNO AND BOSS.MGR = HEADCOACH.EMPNO;
--11.위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT WORKER.ENAME, BOSS.ENAME AS MANAGER, HEADCOACH.ENAME AS HEADCOACH
    FROM EMP WORKER, EMP BOSS, EMP HEADCOACH
    WHERE WORKER.MGR = BOSS.EMPNO(+) AND BOSS.MGR = HEADCOACH.EMPNO(+);