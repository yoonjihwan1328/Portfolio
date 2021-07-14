--[II] SELECT문 : 조회(검색)
-- 1. SQL문장 작성법
SELECT * FROM TAB;  -- 현 계정(scott)이 가지고 있는 테이블
SELECT * FROM DEPT; -- DEPT 테이블에 모든 필드(열), 모든 행을 출력
SELECT * FROM EMP;  -- EMP 테이블에 모든 필드(열), 모든 행 출력
-- DEPT 테이블의 구조(DEPTNO, DNAME, LOC)
DESC DEPT;

-- 2. SQL문 실행(특정 열만 출력)
SELECT EMPNO, ENAME, SAL, JOB FROM EMP; -- 호출하고 싶은 '필드'를 명시
SELECT EMPNO AS "사번", ENAME AS "이름", SAL AS "급여", JOB AS "직책" FROM EMP;   -- ""별칭, ''문자, (기본문법)
SELECT EMPNO AS 사번, ENAME AS 이름, SAL AS 급여, JOB AS 직책 FROM EMP; -- ""생략가능, AS 이후에는 별칭이 위치함.
SELECT EMPNO 사번, ENAME 이름, SAL 급여, JOB 직책 FROM EMP; -- AS도 생략가능
SELECT EMPNO "사 번", ENAME "이 름" FROM EMP;   -- SPACE가 포함된 경우 ""가 필수!
SELECT EMPNO NO, ENAME NAME, SAL SALARY FROM EMP;

-- 3. WHERE절(조건절) <- 특정한 행을 출력하고자 함, 산술연산자, 비교연산자, SQL에서만 쓸 수 있는 연산자 등 모두 사용 가능
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL = 3000;  -- 오라클에서는 = 가 할당이 아닌 등호임.
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL != 3000; -- 다르다
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL <> 3000; -- 다르다
SELECT EMPNO "사번", ENAME "이름", SAL "급여" FROM EMP WHERE SAL ^= 3000;  -- 다르다
    -- 10번 부서(DEPTNO)인 사원의 모든 필드를 출력
SELECT * FROM EMP WHERE DEPTNO=10;
    -- 이름(ENAME)이 FORD인 직원의 EMPNO, ENAME, MGR을 출력
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'FORD'; -- 데이터 부분은 대소문자 구분을 해주어야 함, 'ford'는 불일치로 결과가 도출됨

-- 4. 논리연산자 ; 급여(SAL)이 2000이상 3000미만인 직원의 모든 필드
SELECT * FROM EMP WHERE SAL>=2000 AND SAL<3000;
    -- 비교연산은 숫자, 문자, DATE형 필드 모두 가능
    -- 사원의 이름(ENAME)이 'A', 'B', 'C'로 시작하는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME < 'D'; -- A,B,C,D 등 문자를 아스키코드로 변환하여 비교할 수 있음을 이용  --★
    -- 81년 이전에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE <'81/01/01';    -- 비교연산자는 숫자, 문자, DATE형 모두 가능하다    --★
    -- EMP 테이블의 구조
DESC EMP;
    -- 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE >= '82/01/01' AND HIREDATE <= '82/12/31';
    -- 날짜 표기법 세팅 (현재 : RR/MM/DD0
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR'; --★
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT HIREDATE FROM EMP;   -- 데이터를 유지하며 표시형식을 변경 할 수 있다. BUT 형식에 따라 37행의 구문이 작동하지 않게 될 수 있음을 인식하자@!@!  --★
    -- 연봉이 2400 이상인 직원의 ENAME, SAL, 연봉 출력(연봉 = SAL * 12)
SELECT ENAME 이름, SAL 월급, SAL*12 연봉 FROM EMP WHERE SAL*12>=24000;
SELECT ENAME, SAL, SAL*12 연봉  -- (3)  
    FROM EMP                    -- (1)
    WHERE 연봉 >= 24000         -- (2) 순으로 실행되기 때문에 WHERE전에서는 아직 SAL*12가 연봉으로 규정되지 않은 상태이다.   --★
    ORDER BY 연봉;              -- (4) 가장 나중에 실행되기 때문에 별칭으로 정렬이 가능하다.
    
    -- 10번 부서에서 job(직책)이 MANAGER인 사람의 모든 필드
SELECT * FROM EMP WHERE DEPTNO = 10 AND JOB = 'MANAGER';
    -- 10번 부서이거나 직책이 MANAGER인 사람의 모든 필드
SELECT * FROM EMP WHERE DEPTNO = 10 OR JOB = 'MANAGER';
    -- 부서번호가 10번이 아닌 사람의 모든 필드
SELECT * FROM EMP WHERE DEPTNO <> 10;
SELECT * FROM EMP WHERE NOT DEPTNO = 10;

-- 5. 산술표현식
SELECT ENAME, SAL, SAL+100 UPGRADE_SAL FROM EMP WHERE DEPTNO = 10;
    -- 모든 사원의 이름, 월급(SAL), 상여(COMM), 연봉(SAL*12+COMM)
SELECT ENAME, SAL, COMM, SAL*12+COMM "연봉" FROM EMP; -- NULL값이 포함된 산술연산은 NULL값을 반환한다.
    --NVL(NULL일 수도 있는 필드명, 대치값)을 이용할 경우 매개변수 둘의 타입은 반드시 일치해야함.
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) FROM EMP;
    -- 모든 사원의 사원명, 상사사번(MGR)을 출력(상사가 없으면 0으로)
SELECT ENAME, NVL(MGR, 0) FROM EMP; -- 데이터 타입을 일치시켜야 하므로 반드시 숫자를 이용, 차후에 "사장"으로 바꾸는 법을 배울 예정.   --★

-- 6. 연결연산자(||) : 열이나 문자를 연결하는 용도   --★
SELECT ENAME || '은 ' || JOB EMPLOYEES FROM EMP;
SELECT ENAME || '은 ' || JOB AS EMPLOYEES FROM EMP;  -- 순전히 가독성을 높히기 위해 AS 혹은 ""를 사용할 수 있다. 
SELECT ENAME || '은 ' || JOB "EMPLOYEES" FROM EMP;

    --"SMITH : ANNUAL SALARY = XXXX"과 같이 모든 행이 출력(연봉=SAL*12+COMM)
SELECT ENAME || ' : ANNUAL SALARY = ' || (SAL*12+NVL(COMM,0)) "MSG" FROM EMP;

-- 7. 중복제거('DISTINCT' 키워드)  --★
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;
SELECT * FROM DEPT;

-- 예제문제
--1. emp 테이블의 구조 출력
DESC EMP;   -- DESC는 오라클에서만 가능한 명령어. MYSQL에서는 작동 X
--2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;
--3. 현 scott 계정에서 사용가능한 테이블 출력
SELECT * FROM TAB;
SHOW USER;
--4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL < 2000;
--6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >= '81/02/01';
--7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
--8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP WHERE JOB ^= 'CLERK';
--9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= 1500 AND SAL <= 3000;
--10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 30;
--11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE SAL >= 3000 OR JOB = 'SALESMAN';
--12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL>=2500 AND JOB = 'MANAGER';
--13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME || '은 ' || JOB || ' 업무이고 연봉은 ' || (SAL*12+NVL(COMM,0)) ||'다' FROM EMP;
SELECT '이름은 ' || ENAME || '이고' FROM EMP;
-- '이름은 ' || SELECT ENAME || '이고' FROM EMP;
--예제문제 끝

-- 8. SQL 연산자(BETWEEN, IN, LIKE, IS NULL)
    -- SAL이 1500이상 3000이하인 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= 1500 AND SAL <= 3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500;  -- 결과값이 나오지 않음. 필드명 BETWEEN A AND B : A부터 B까지(A, B포함, A<B)

SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;

    -- 82년도에 입사한 직원의 모든 필드 출력
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31'; --★
    -- 사원 이름이 'B','C'로 시작하는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME BETWEEN 'B' AND 'D' AND ENAME^= 'D';  --★

    -- (2) IN
        -- 부서번호가 10, 20번 부서 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 20 OR DEPTNO = 40;  --★
SELECT * FROM EMP WHERE DEPTNO IN(10, 20, 40);                      --★
        -- 부서번호가 10, 20, 40번 부서를 제외한 사원의 모든 필드
SELECT * FROM EMP WHERE DEPTNO NOT IN (10, 20, 40);
SELECT * FROM EMP WHERE DEPTNO!=10 AND DEPTNO^=2 AND DEPTNO<>40;
SELECT * FROM EMP WHERE EMPNO IN (7902, 7788, 7566);

    -- (3) LIKE 연산
        -- 이름이 M으로 시작하는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE 'M%';
        -- 이름에 N이 들어가는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
        -- 이름이 S로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE ENAME LIKE '%S';
        -- SAL이 5로 끝나는 사원의 모든 필드
SELECT * FROM EMP WHERE SAL LIKE '%5';
        -- 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE LIKE '82%';
        -- 1월에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE LIKE '__/01/__';   --★
        -- 82년도가 아닌 년도에 입사한 사원의 모든 필드
SELECT * FROM EMP WHERE HIREDATE NOT LIKE '82/%';

    -- (4) IS NULL
        -- 상여금이 없는 사원의 모든 필드
SELECT * FROM EMP WHERE COMM = 0 OR COMM IS NULL;
        -- 상여금이 있는 사원의 모든 필드
SELECT * FROM EMP WHERE NOT COMM IS NULL AND COMM != 0;

    -- 9. 정렬(오름차순, 내림차순)
SELECT ENAME, SAL FROM EMP ORDER BY SAL;    -- 오름차순 정렬
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;   -- 내림차순 정렬
SELECT ENAME, SAL FROM EMP ORDER BY ENAME;  -- 문자로도 정렬 가능(숫자가 아니어도 됨) + SELECT 대상이 아닌 필드로의 정렬도 가능.
SELECT ENAME, SAL FROM EMP ORDER BY HIREDATE;   -- 날짜순서대로 정렬
SELECT ENAME, SAL HIREDATE FROM EMP ORDER BY HIREDATE DESC; -- 최신순으로 정렬
    -- 이름, 연봉(SAL*12+COMM)을 출력(연봉이 높은 순으로, 연봉이 같은 경우 이름 순으로)
SELECT ENAME, SAL*12+NVL(COMM, 0) FROM EMP ORDER BY SAL*12+NVL(COMM, 0) DESC, ENAME;
SELECT ENAME, SAL*12+NVL(COMM, 0) 연봉 FROM EMP ORDER BY 연봉 DESC, ENAME;
    -- 사번, 이름, HIREDATE, SAL 출력(부서순, 부서가 같으면 입사일순으로 오름차순 정렬)
SELECT EMPNO, ENAME, HIREDATE, SAL FROM EMP ORDER BY DEPTNO, HIREDATE;


-- ★ 시험 연습문제
--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000;
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7788;
--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE (SAL*12 + NVL(COMM, 0))>24000 ORDER BY SAL DESC; 
--4.	EMP 테이블에서 hiredate가 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 
--ename,job,hiredate을 출력하는 SELECT 문장을 작성 (단 hiredate 순으로 출력)
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01' ORDER BY HIREDATE;    --시스템의 날짜표기법이 RR-MM-DD, DD/MM/RR 등 다른 형태면 문제가 발생할 수 있음
--날짜 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
-- 문자형를 날짜형으로 변환 : TO_DATE('81/02/20','RR/MM/DD')
-- 날짜형을 문자형으로 변환 : TO_CHAR(날짜형, 패턴)
SELECT ENAME, TO_CHAR(HIREDATE,'RR-MM-DD') FROM EMP;
SELECT ENAME, JOB, HIREDATE FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('1991/02/20','YYYY/MM/DD')
                        AND TO_DATE('1981/05/01','YYYY/MM/DD')
                        ORDER BY HIREDATE;
SELECT ENAME, JOB, HIREDATE FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('81/02/20','RR/MM/DD')
                        AND TO DATE;

--5.	EMP 테이블에서 deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * FROM EMP WHERE DEPTNO IN(10, 20) ORDER BY ENAME;
--6.	EMP 테이블에서 sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME AS "employee", SAL AS "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN(10, 30);

--7.	EMP 테이블에서 hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
SELECT * FROM EMP WHERE HIREDATE LIKE'82%';
--TO_DATE(), TO_CHAR함수 이용
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YYYY') =1982;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR') = 82;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') LIKE '82%';

--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME, SAL FROM EMP WHERE ENAME >= 'C' AND ENAME < 'Q' ORDER BY ENAME, SAL;
SELECT ENAME, SAL FROM EMP WHERE ENAME BETWEEN 'C' AND 'Q' AND ENAME != 'Q' ORDER BY ENAME, SAL;
--9.	EMP 테이블에서 comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= SAL*1.1;
--10.	EMP 테이블에서 job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP WHERE (JOB = 'CLERK' OR JOB = 'ANALYST') AND NOT (SAL IN(1000, 3000, 5000));
SELECT * FROM EMP WHERE (JOB = 'CLERK' OR JOB = 'ANALYST') AND SAL NOT IN(1000, 3000, 5000);
--11.	EMP 테이블에서 ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (DEPTNO = 30 OR MGR = 7782);


--12.	사원 테이블에서 입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE LIKE '81/%';
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31';
-- TO_DATE(), TO_CHAR()함수를 사용해서 다른 표시형식(시스템)에서도 작동할 수 있는 구문을 만들어보자.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE TO_CHAR(HIREDATE, 'RR') = 81;
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') LIKE '81%';
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/01/01', 'RR/MM/DD') AND TO_DATE('81/12/31', 'RR/MM/DD');


--13.	사원 테이블에서 입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE HIREDATE LIKE '81/%' AND JOB != 'SALESMAN';  -- 내 시스템이 년도를 가장 처음에 출력했다는 전제하에서만 작동
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP WHERE TO_CHAR(HIREDATE, 'RR') = 81 AND JOB !=' SALESMAN';


--14.	사원 테이블의 사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP ORDER BY SAL DESC, HIREDATE;
--15.	사원 테이블에서 사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오         ----
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '__N%';
--16.	사원 테이블에서연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE SAL*12 >= 35000;
SELECT EMPNO, ENAME, SAL*12 연봉 FROM EMP WHERE 연봉 >= 35000;  -- 작동하지 않음! 구문 순서^^

-- 이름에 A가 들어간 사원의 모든 정보
SELECT * FROM EMP WHERE ENAME LIKE '%A%';
-- 이름에 %가 들어간 사원의 모든 정보
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE '\';
INSERT INTO EMP VALUES(9999, 'LISA%', NULL, NULL, NULL, 9000, 9999, 40);    -- 이름을 한글로 치면 한 문자당 세 글자로 인식
SELECT * FROM DEPT;
ROLLBACK; -- 데이터를 삭제/수정/ 입력한 문장을  DML(데이터 조작어)를 취소하는 명령어 // 여러줄일경우 될 수도 안될 수도 있다.

--테이블 하나에서만 조회하는 작업을 함.
