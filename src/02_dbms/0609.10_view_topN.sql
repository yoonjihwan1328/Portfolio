--[ⅹ] VIEW, INLINE VIEW, TOP-N구문
-- 1. VIEW : 가상의 테이블 (1)단순뷰 (2)복합뷰
-- (1) 단순뷰 ; 하나의 테이블로 구성한 뷰
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP;
SELECT * FROM USER_VIEWS;   -- DDL을 수행하면 데이터 딕셔너리가 자동수정
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (9000, '홍', 'MANAGER', 40);    -- VIEW에 추가
SELECT * FROM EMPv0;
SELECT * FROM EMP;  -- '홍'데이터가 원본인 EMP에도 삽입됨 BUT EMPv0에 해당한 4필드만이 기록.
UPDATE EMPv0 SET JOB='ANALYST' WHERE EMPNO=9000;

    -- EMPv0이라는 뷰 = EMP테이블이 30번 부서만
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1111, '홍', NULL, NULL, NULL, NULL, NULL, 30);
SELECT * FROM EMPv0 WHERE EMPNO = 1111;
SELECT * FROM EMP WHERE EMPNO = 1111;
-- EMPv0은 30번 부서만 엑세스 할 수 있는 뷰
INSERT INTO EMPv0 VALUES (1112, '김', NULL, NULL, NULL, NULL, NULL, 40);
SELECT * FROM EMP WHERE EMPNO < 2000;
SELECT * FROM EMPv0;    -- 40번 부서 입력은 가능하나 보이지는 않음.
DELETE FROM EMPv0 WHERE EMPNO < 2000;
SELECT * FROM EMP WHERE EMPNO < 2000;   -- 방금 입력한 1111, 1112를 삭제하려 했으나 30번 부서만 삭제, 1112는 삭제안됨(40번 부서)
-- VIEW의 제한조건
-- ★ WITH CHECK OPTION을 설정한 뷰는 뷰의 조건에 해당하는 데이터만 삽입, 수정, 삭제 가능
-- ★ WITH READ ONLY 설정한 뷰는 읽기전용 뷰
-- 테이블에 NOT NULL로 만든 컬럼은 포함되어야 함.
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB FROM EMP; -- VIEW를 생성할 떄 NOT NULL필드(여기서는 EMPNO를 반드시 포함할 것! OTHERWISE 오류발생)
SELECT * FROM EMPv0;    -- 에러 안나는데?

-- WITH CHECK OPTION
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30
    WITH CHECK OPTION;      -- 조건에 맞는 경우에만 삽입, 삭제, 수정가능(읽기는 항상 가능)
INSERT INTO EMPv0 VALUES (1111, '홍', NULL, NULL, NULL, NULL, NULL, 30);
SELECT * FROM EMPv0;
SELECT * FROM EMP;
INSERT INTO EMPv0 VALUES (1111, '박', NULL, NULL, NULL, NULL, NULL, 40); -- 에러
DELETE FROM EMPv0 WHERE EMPNO=1111;

-- WITH READ ONLY
CREATE OR REPLACE VIEW EMPv1
    AS SELECT * FROM EMP WHERE DEPTNO = 20 WITH READ ONLY;  -- 읽기전용 뷰
SELECT E.*, DNAME FROM EMPv1 E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
INSERT INTO EMPv1 VALUES (11114, '윤', NULL, NULL, NULL, NULL, NULL, 20); -- 에러남(읽기전용 뷰!)
UPDATE EMPv1 SET SAL=9000 WHERE EMPNO =7902;    -- 에러남(읽기전용 뷰!!)
-- (2) 복합뷰 ; 2개 이상의 테이블로 구성한 뷰. DML문을 제한적으로만 사용
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME FROM DEPT D, EMP E WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1200, '홍', 'MANAGER', 'RESEARCH');    -- 복합뷰는 갱신불가
-- 칼럼에 별칭을 이용하여 뷰를 생성
CREATE OR REPLACE VIEW EMPv1
    AS SELECT EMPNO NO, ENAME NAME, SAL*12 YEAR_SAL FROM EMP WHERE DEPTNO=10;
INSERT INTO EMPv1 VALUES (1000, '홍', 12000);    -- 가상의 필드가 있을 경우 불가
-- 서브쿼리의 필드명에 특수문자가 있는 경우 별칭부여가 필수임, ⓐ 별칭을 필드에서 직접부여
CREATE OR REPLACE VIEW EMPv1 (EMPNO, ENAME, YEAR_SAL)
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE DEPTNO = 10;  -- ⓑ 별칭만 따로 부여
-- 사번, 이름, 10의자리에서 반올림한 SAL을 뷰생성.
CREATE OR REPLACE VIEW EMPv1
    AS SELECT EMPNO, ENAME, ROUND(SAL, -2) "SAL" FROM EMP;
CREATE OR REPLACE VIEW EMPv1(NO, ENAME, SAL)
    AS SELECT EMPNO, ENAME, ROUND(SAL, -2) FROM EMP;
    
    -- 부서번호, 최소급여, 최대급여, 부서평균급여를 포함한 DEPTv1 뷰를 생성 ★★★--------------------------------------------
CREATE OR REPLACE VIEW DEPTv1 (DEPTNO, MINSAL, MAXSAL, AVGSAL)
    AS SELECT DEPTNO, MIN(SAL), MAX(SAL), AVG(SAL) 
    FROM EMP 
    GROUP BY DEPTNO;
SELECT * FROM DEPTv1;
SELECT * FROM DEPT;
-- 부서번호, 부서명, 최소급여, 최대급여를 포함한 DEPTv2 뷰를 생성
-- CREATE OR REPLACE VIEW DEPTv2 (DEPTNO, DNAME, MINSAL, MAXSAL)
--    AS SELECT D.DEPTNO, DNAME, MIN(SAL), MAX(SAL) 
--    FROM EMP E, DEPT D 
--    WHERE E.DEPTNO = D.DEPTNO; -- 왜 안되지? 아래에서처럼 조인인 경우는 안되는듯?
                               -- not a single-group function
                               -- where 과 group by 가 병행할 수 있는지도 기억안남.
SELECT D.DEPTNO, DNAME, MINSAL, MAXSAL, AVGSAL
    FROM DEPTv1 DV, DEPT D
    WHERE DV.DEPTNO=D.DEPTNO;
--                                      SELECT EMP.DEPTNO, DNAME, MIN(SAL), MAX(SAL), AVG(SAL)    -- 앞에서는 MIN(SAL)과 같은 값을 출력하려면 어떤 방법을 사용했었지?
--                                          FROM DEPT, EMP
--                                          WHERE DEPT.DEPTNO = EMP.DEPTNO;
--                                      SELECT MAX(SAL) MAXSAL , MIN(SAL) MINSAL , AVG(SAL) AVGSAL  -- 가능! 조인인 경우는 계산이 불가해지는건가?
--                                          FROM EMP;
CREATE OR REPLACE VIEW DEPTv2
    AS SELECT D.DEPTNO, DNAME, MINSAL, MAXSAL, AVGSAL
    FROM DEPTv1 DV, DEPT D
    WHERE DV.DEPTNO=D.DEPTNO;
-- DISTINCT 키워드를 이용한 뷰 : 중복이 제거된 JOB, DEPTNO
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DISTINCT JOB, DEPTNO FROM EMP;
SELECT * FROM EMPV0;
INSERT INTO EMPv0 VALUES ('MANAGER', 10);   --DISTINCT를 이용한 뷰는 읽기전용

-- 2. INLINE VIEW ; FROM절 상의 서브쿼리를 INLINE VIEW라고 하며, FROM 절에 오는 서브쿼리는 VIEW처럼 작용. ★★★------------------------------------------
-- 뷰처럼 작용한다는게 무슨 뜻?
-- 급여가 2000을 초과하는 사원의 평균급여
SELECT AVG(SAL) FROM EMP WHERE SAL>2000;
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);
-- 각 부서에서 부서평균급여보다 높은 사원의 이름, 급여, 부서번호
SELECT ENAME, SAL, DEPTNO 
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);   --------------------------------------- 잉? 서브쿼리는 단독으로 작동안하는데 전체쿼리가 작동하네?
                                        -- 문제가 where절을 조정함으로써 풀이하는게 더 이해하기 쉬워서 아래처럼 FROM을 조정하는게 복잡해지기만 하는것 같은데
    -- FROM절에 올 서브쿼리(부서번호, 평균급여) : 1단계
    SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
    -- 이름, 급여, 부서번호, 부서별평균 : 2단계
    SELECT ENAME, SAL, E.DEPTNO, AVGSAL                             -----------------FROM에 있는 요소만 SELECT에서 호출가능(여기서는 AVGSAL)
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE ENAME='SCOTT';
    SELECT ENAME, SAL, E.DEPTNO, S.DEPTNO, S.AVGSAL
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE E.DEPTNO=S.DEPTNO;
        --  SELECT 필드1, 필드2, ...
        --      FROM 테이블명1, (서브쿼리) 별칭
        --      WHERE 조인조건
    -- 이름, 급여, 부서번호(부서별 평균보다 높은 사원만) : 3단계
    SELECT ENAME, SAL, E.DEPTNO                                     --------------------------------------- 두 번째 답안.
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE E.DEPTNO=S.DEPTNO AND SAL>AVGSAL;
        
-- TOP-N구문 (eg1: 1~10등 조회, eg2: TOP 11~20등 조회, ...)★★★★★------------------------------------------------------------
-- ROWNUM : 테이블로부터 가져온 순서
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20;
DELETE FROM EMP WHERE SAL IS NULL;
SELECT ROWNUM, ENAME, SAL FROM EMP ORDER BY SAL;    -- SAL기준으로 정렬됐기 때문에 ROWNUM 순서가 뒤죽박죽
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT * FROM EMP ORDER BY SAL);
-- SAL 기준으로 1~5등    -- TOP-N구분이 아님, 이유는 아래.
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)
    WHERE ROWNUM<6;
-- SELECT ROWNUM, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL) WHERE ROWNUM < 6; -- 동일한 결과인데 왜 위에처럼 하지?----------------------------------
-- 함수를 이용한 RANK 출력
SELECT RANK() OVER(ORDER BY SAL) RANK, 
    DENSE_RANK() OVER(ORDER BY SAL) D_RANK,
    ROW_NUMBER() OVER(ORDER BY SAL) N_RANK,
    ENAME, SAL FROM EMP;            -- TOP-N구문이 불가함! (eg 1~5등...)
-- SAL 기준으로 6~10등
SELECT ROWNUM, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)
    WHERE ROWNUM>=6 AND ROWNUM<11;      -- 도출이 안됨.
-- TOP-N
SELECT ENAME, SAL FROM EMP ORDER BY SAL; -- 1단계
SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL); -- 2단계
SELECT ROWNUM, RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)); -- 3단계(TOP-N)
SELECT ROWNUM, RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL))
    WHERE RN BETWEEN 6 AND 10;
    
-- 이름을 알파벳 순서대로 정렬해서 6~10등까지 출력(등수, 이름, 사번, JOB, MGR, HIREDATE)

-- 1. 부서명과 사원명을 출력하는 용도의 뷰, DNAME_ENAME_VU 를 작성 하시오
-- 2. 사원명과 직속상관명을 출력하는 용도의 뷰,WORKER_MANAGER_VU를 작성하시오
-- 3. 부서별 급여합계 등수를 출력하시오(부서번호, 급여합계, 등수) ? 친구출제
-- 3-1. 부서별 급여합계 등수가 2~3등인 부서번호, 급여합계, 등수를 출력하시오.
-- 4. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사 원 순으로 정렬하시오
-- 5. 사원테이블에서 사번, 사원명, 입사일을 입사일이 최신에서 오래된 사 원 5명을 출력하시오
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    ORDER BY HIREDATE DESC;
    
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC);
-- 6. 사원 테이블에서 사번, 사원명, 입사일을 최신부터 오래된 순으로 6번째로 늦은 사원부터 10번째 사원까지 출력
