--[Ⅳ] 단일행함수; 내장함수
-- 함수 = 단일행함수 + 그룹함수(집계함수)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"년"MM"월"DD"일"') FROM EMP; -- 단일행 함수 : 여러행을 집어넣고 여러행이 반환됨.
SELECT ENAME, INITCAP(ENAME) FROM EMP;  -- 그룹함수(집계함수) : 여러행을 계산하여 한 행이 반환됨.
SELECT SUM(SAL) FROM EMP;

SELECT DEPTNO, SUM(SAL) FROM EMP;   -- (ERROR!!!)단일행함수와 그룹함수는 함께 쓰일 수 없다.
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;   -- 부서번호별 합계

-- EX. 숫자관련함수, 문자관련함수, 날짜관련함수, 형변환함수, NVL(), ETC...
-- 1. 숫자함수
-- DUAL 테이블 : 오라클에서 제공하는 기본테이블(1행 1열짜리 DUMMY TABLE)
SELECT * FROM DUAL;
DESCRIBE DUAL;
SELECT * FROM DUMMY;
DESCRIBE DUMMY;
SELECT ABS(-9) FROM DUAL;
SELECT FLOOR(34.5678) FROM DUAL;    -- 소수점 아래를 버림.
SELECT FLOOR(34.5678*100) /100 FROM DUAL;   -- 소수점 두 번째 자리에서 내림
SELECT TRUNC(34.5678) FROM DUAL;    -- 소수점 아래를 버림
SELECT TRUNC(34.5678,2) FROM DUAL;  -- 소수점 자리수를 선택하여 버림할 수 있음
SELECT TRUNC(34.5678, -1) FROM DUAL;-- 일의 자리에서 내림
SELECT TRUNC(-34.5678) FROM DUAL;

    -- EMP 테이블에서 이름, 급여(십의 자리에서 내림)
    SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; -- 0의 자리수로 반올림.
SELECT ROUND(34.5678) FROM DUAL;
SELECT ROUND(34.5678, 2) FROM DUAL; -- 소수점 두번째 자리에서 반올림.
SELECT ROUND(34.5678, -1) FROM DUAL;    -- 일의자리에서 반올림.

SELECT MOD(9,2) FROM DUAL;  -- 나머지 연산자
SELECT MOD('9'/2) FROM DUAL;

-- 홀수달에 입사한 직원들의 모든 필드를 출력
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'MM'),2)=1;

-- 2. 문자함수                          -- 6월 3일
SELECT UPPER('abcABC') FROM DUAL;
SELECT LOWER('abcABC') FROM DUAL;
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL;
    -- JOB이 MANAGER인 직원의 모든 필드
    SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
    -- 이름이 SCOTT인 직원의 모든 필드
    SELECT * FROM EMP WHERE INICAP(ENAME) = 'Scott';    -- 데이터(이름)가 어떤 형태로 저장되어 있는지 알 수 없으므로
-- 문자연결(CONCAT함수, ||연산자 모두 가능 - MYSQL에서는 ||가 OR과 같기때문에 문자연결에 사용할 수 없다)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT('AB', 'CD') FROM DUAL;
SELECT CONCAT(CONCAT('AB', 'CD'), CONCAT('EF', 'GH')) FROM DUAL;
SELECT CONCAT('AB', 'CD', 'EF', 'GH') FROM DUAL;    -- (ERROR!!!)CONCAT이 2개씩밖에 작동 안하는 듯.
    -- xxx는 xx다 (SCOTT은 JOB이다)
SELECT CONCAT(CONCAT(ENAME, '은(는) '),CONCAT(JOB, '이다')) FROM EMP;   -- 연결연산자를 쓰지 않는다면
-- SUBSTR(STR, 시작위치, 문자갯수)    -- 시작위치는 1이 첫번째 위치, 음수도 가능
-- SUBSTRB(STR, 시작바이트, 문자바이트수)
SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL;    -- 3번째 글자부터 2글자 추출
SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL;   -- 3번째 BYTE부터 2BYTE 추출
SELECT SUBSTR('데이터베이스', 4, 2) FROM DUAL;    -- 4번째 글자부터 2글자 추출
SELECT SUBSTRB('데이터베이스', 4, 2) FORM DUAL;   -- 4번째 BYTE부터 3BYTE 추출
-- 영어는 한 글자가 1BYTE, 한글은 한 글자가 3BYTE
-- SUBSTR 인수에 음수를 사용하는 경우
--  O   R   A   C   L   E
--  1   2   3   4   5   6 (위치)
--(-6)(-5)(-4)(-3)(-2)(-1) (위치)
SELECT SUBSTR('WELCOME TO ORACLE', -1, 1) FROM DUAL;
    -- 9월에 입사한 사원의 모든 필드
    SELECT SUBSTR(123, 2, 1) FROM DUAL; -- 숫자인 경우에도 가능
    -- 9월에 입사한 사원의 모든 필드 81/09/01
    ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4, 2) ='09';
    -- 9일에 입사한 사원의 모든 플디 81/09/09
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2) = '09'; -- 전화번호 뒷자리를 추출할 때, 중간자리수는 INSTR(왜?)
SELECT LENGTH('ABCD') FROM DUAL;    -- 글자수
SELECT LENGTHB('ABCD') FROM DUAL;   -- BYTE수
SELECT LENGTH('오라클') FROM DUAL;   -- 글자수 : 3
SELECT LENGTHB('오라클') FROM DUAL;  -- BYTE수 : 9
-- INSTR(STR, 찾을글자); STR에서 찾을 글자의 위치(첫번째 1), 없을 경우 0을 반환
-- INSTR(STR, 찾을글자, 시작위치); JAVA의 LASTINDEXOF 대신 사용할 수 있음. STR에서 시작위치부터 찾는 글자의 위치를 반환
SELECT INSTR('ABCabcABCabc', 'B') FROM DUAL;    -- 처음부터 찾아서 처음 나오는 B의 위치를 반환
SELECT INSTR('ABCabcABCabc', 'B', 3) FROM DUAL; -- 3번째부터 찾아서 처음 나오는 B의 위치
SELECT INSTR('ABCabdcABCabcd', 'B', -3) FROM DUAL;    -- 뒤 3번째부터 역방향으로 찾아 첫음나오는 B의 위치
    -- 9월에 입사한 사원(INSTR이용) 81/09/01
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 3) = 4;   -- 시스템의 날짜입력방식을 미리 알고 있는 경우에만 가능한 방법인듯?
    -- 9일에 입사한 사원(INSTR이용)
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 6) = 7;
    -- 9일이 아닌 다른 날에 입사한 사원
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 6) = 0;   -- 없을 경우 0을 반환하므로
-- LPAD(문자, 자리수, 채울문자) STR을 자리수만큼 확보하고 왼쪽 빈자리에 채울문자 출력
SELECT LPAD('ORACLE', 10, '#'), RPAD('ORACLE', 10, '*') FROM DUAL;

    SELECT ENAME, LPAD(SAL, 6, '*') FROM EMP;
    -- 사번 S****(이름은 앞 한 글자만 출력하고 나머지는 *)
    -- 사번 W***  (RPAD, SUBSTR, LENGTH)
    SELECT RPAD('S',5,'*') FROM DUAL;
    SELECT RPAD(SUBSTR(EMPNO,1,1), LENGTH(ENAME), '*') FROM EMP;
    -- 7499_****H 80/12/**
    SELECT EMPNO, LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME),'*') AS "NAME", RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*') AS "HireDate" FROM EMP;
    -- 이름의 세 번째 자리가 R인 사원의 모든 필드(LIKE, INSTR, SUBSTR)
    SELECT * FROM EMP WHERE ENAME LIKE '__R%';
    SELECT * FROM EMP WHERE INSTR(ENAME, 'R', 3) = 3;   -- 결과값이 그저 ENAME 3번째에 R이 있는 대상들인데?
    SELECT * FROM EMP WHERE SUBSTR(ENAME, 3, 1) = 'R';
SELECT TRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT LTRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT RTRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP; 
SELECT REPLACE(HIREDATE, '0', 'XX') FROM EMP;

SELECT SYSDATE FROM DUAL; -- SYSDATE : 지금
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD DY HH24:MI';
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';   -- 원상복구
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS') FROM DUAL;
    -- 오라클 타입 : 문자, 숫자, DATE(숫자, DATE는 연산 가능)
        -- 사진이름을 문자로 저장, 직원들의 증명사진이 들어있는 폴더를 별도로 생성, 오라클에는 사진이름만 기록.
SELECT SYSDATE-1 어제이시간, SYSDATE 지금, SYSDATE+1 내일이시간 FROM DUAL;
-- 14일 후
SELECT SYSDATE+14 FROM DUAL;
    -- EMP에서 이름, 입사일, 근무기간
    SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE,1) FROM EMP;
    SELECT ENAME, HIREDATE, FLOOR(SYSDATE-HIREDATE) FROM EMP;
    -- 이름, 입사일, 근무주수, 근무년수
    SELECT ENAME, HIREDATE, TRUNC((SYSDATE - HIREDATE)/7), TRUNC((SYSDATE - HIREDATE)/365) FROM EMP;
    -- 이름, 입사일, 근무월수 (MONTH_BETWEEN()함수)
    SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE)FROM EMP;
    SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "근무월수" FROM EMP;
    -- 이름, 입사일, 수습종료시점 (ADD_MONTHS()함수 : 특정시점부터 몇 개월 후)
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3) AS "수습 종료 후 근무월수" FROM EMP;
    -- 이름, 입사한 이후 받은 급여와 상여(급여는 매달 SAL 을 받고 상여금은 2번 COMM을 받음)
    SELECT ENAME, (TRUNC((MONTHS_BETWEEN(SYSDATE, HIREDATE) * SAL)) + TRUNC((SYSDATE-HIREDATE)/365)*2*NVL(COMM,0)) AS COST FROM EMP; 
-- NEXT_DAY(특정날짜, '수') 특정날짜로부터 처음 도래하는 수요일
SELECT NEXT_DAY(SYSDATE, '토') FROM DUAL;    -- 특정한 요일을 알고 싶을 때
-- LAST_DAY(특정날짜) ; 특정월의 말일
SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- EMP 이름, 입사일, 첫 월급날(월급날 말일)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;
-- ROUND: 날짜 반올림 가능 TRUNC: 날짜버림
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- YEAR를 기준으로 반올림할 경우 가까운 1월 1일로 
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL;   -- MONTH를 기준으로 가까운 1일
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- 가까운 일요일
SELECT ROUND(SYSDATE) FROM DUAL;    -- 가까운 0시
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL;    -- 올해 1월    
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL;   -- 이번달 1일
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- 지난 일요일
SELECT TRUNC(SYSDATE) FROM DUAL; -- 오늘 0시
    -- 이름, 입사일, 입사한 월의 5일
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+4 FROM EMP;
    -- 이름, 입사일, 월급날(5일) ; 월급은 입사한지 한 달이 안되어도 5일이 되면 무조건 지급
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11, 'MONTH') FROM EMP;   -- '15 OR 16' 기준을 '4 OR 5'로 변경;
    -- 이름, 입사일, 월급날(15일)
    
    -- 이름, 입사일, 월급날(25일)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH') FROM EMP;

-- 4. 형변환 함수 (TO_CHAR() : 문자로 형변환, TO_DATE() : 날짜형으로 형변환)
-- (1) TO_CHAR(DATE형 데이터, '출력형식')
SELECT TO_CHAR(SYSDATE, 'YY"년"MM"월"DD"일" DY"요일" HH24:MI:SS') FROM DUAL;
    -- YYYY 년도4자리 / YY 년도2자리 / RR 년도2자리 / MM월 / DD일
    -- DAY요일 / DY 요일요약표현
    -- AM 이나 PM / HH12(12시간제) HH24(24시간제)
    -- MI : 분/ SS : 초
SELECT TO_CHAR(HIREDATE, 'YYMMDD DY AM HH12:MI:SS') FROM EMP;    -- 00시00분00초인 것으로 보아 HIREDATE입력시 시간을 입력하지 않았다는 것을 알 수 있음.
--(2)TO_CHAR(숫자데이터, '출력형식')
        -- 0 : 자릿수, 0이 형성한 형식의 자릿수만큼 반드시 출력(숫자가 부족할 경우 0이 출력됨) 
        -- 9 : 자릿수, 
        -- , : 세자리 마다 ,로 구분
        -- . : 소수점
        -- L : 지역통화단위
        -- $ : 통화단위 $가 앞에 붙을 수 있음.
SELECT TO_CHAR(12345678, '999,999,999') FROM DUAL;
SELECT TO_CHAR(12345678, '000,000,000') FROM DUAL;
SELECT TO_CHAR(1000, 'L9,999') FROM DUAL;
SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999') FROM EMP;
--(3) TO_DATE(문자, '패턴')
SELECT TO_DATE('20210603', 'YY/MM/DD/') FROM EMP;
    SELECT * FROM EMP WHERE HIREDATE BETWEEN '81/05/01' AND '83/05/01';
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('810501', 'RRMMDD') AND TO_DATE('830501', 'RRMMDD');
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/05/01', 'RR/MM/DD') AND TO_DATE('83/05/01', 'RR/MM/DD'); 
        -- 시스템 형식이 MM/DD/YY이지만(무슨 형식인지 모르는 경우) 81/05/01와 83/05/01이 일괄적으로 적용될 수 있도록 TO_DATE를 사용해 조건을 설정

--TO_NUMBER(문자, 패턴)
SELECT '3456.78'+1 FROM DUAL;
SELECT '3,456,78'+1 FROM DUAL;
SELECT TO_NUMBER('3,456.78', '9,999.99') + 1 FROM DUAL; -- 182에서처럼 원래는 안해주는데 TO_NUM()을 사용할 경우 형변환이 가능해짐.

-- 5. NVL(널 일수도 있는 데이터, 널이면 대신할 값) -- 매개변수 2개는 타입일치
-- 이름, 상사의 사번(MGR)을 출력, 직속상사가 없을 경우 'CEO'로 출력
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MANAGER_NUM FROM EMP;

-- 6. ETC
-- (1) EXTRACT : 연도나 월만 추출하고 싶을 때
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') FROM DUAL;
    --81년도에 입사한 직원
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YY') = '81';
    SELECT * FROM EMP WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('1981/01/01', 'YYYY-MM-DD') AND TO_DATE('1981/12/31', 'YYYY-MM-DD');
-- (2) 레벨별 출력 : LEVEL, START WITH 조건, CONNECT BY PRIOR 조건
SELECT LEVER, ENAME FROM EMP START WITH MGR IS NULL CONNECT BY PRIOR EMPNO = MGR;
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME FROM EMP START WITH MGR IS NULL CONNECT BY PRIOR EMPNO=MGR;

-- ★ 연습문제
-- <총 연습문제>

-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') "CURRENT DATE" FROM DUAL;
-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 AS "New Salary", SAL*1.15-SAL AS "Increase" FROM EMP;
--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
-- SELECT ENAME, HIREDATE, ROUND(ADD_MONTHS(HIREDATE, 6),'DAY') FROM EMP;
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'월') FROM EMP;
--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "WORKING MONTHS", SAL, TO_CHAR(SAL*ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)), '9,999,999') AS "TOTAL SALARY" FROM EMP; --- 세 자리마다 ,를 표시하려면?
--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력
SELECT ENAME, LPAD(SAL,15, '*') FROM EMP;
--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DY') FROM EMP;
--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>=6;
--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력
SELECT ENAME, JOB, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;
-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT SUBSTR(ENAME, 2, 3) FROM EMP;
--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE, 'MM') = '12';
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE) =12;
--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		ENAME		급여
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--……. 
SELECT EMPNO, ENAME, LPAD(SAL, 11, '*') FROM EMP;

-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO	 ENAME 	입사일
-- 7369	  SMITH		1980-12-17
-- ….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$9,999') FROM EMP WHERE DEPTNO=20;

--[Ⅴ] 그룹함수 : SUM, AVG, MIN, MAX, COUNT, STDDEV, VARIANCE

SELECT ENAME, ROUND(SAL, -3) FROM EMP;  -- 단일행 함수
SELECT MAX(SAL) FROM EMP;    -- 그룹함수
SELECT ENAME, MAX(SAL) FROM EMP;    -- 그룹함수와 단일행 함수는 동시에 작동할 수 없다. -> Ⅵ장 서브쿼리에서 해결!
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;   -- GROUP BY를 사용하는 경우 단일행함수가 그룹함수와 동시에 작동...
-- 1. 그룹함수들 실습
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(*) FROM EMP;   -- EMP 테이블 행의 개수
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT COUNT(COMM), SUM(COMM), AVG(COMM), SUM(COMM)/COUNT(COMM) FROM EMP;
    -- 모든 그룹함수는 NULL값을 제외
-- SAL의 평균, 합, 최소값, 최대값, 분산, 표준편차, 개수
SELECT  ROUND(AVG(SAL),2), SUM(SAL), MIN(SAL), MAX(SAL), ROUND(VARIANCE(SAL),2), ROUND(STDDEV(SAL),2),COUNT(SAL) FROM EMP;
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL) FROM EMP;

-- 그룹함수 MAX, MIN, COUNT는 숫자형, 문자형, 날짜형 모두 사용가능
    -- 가장 최근에 입사한 사원의 입사일과 입사한지 가장 오래된 사원의 입사일
    SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;   -- 최초로 입사한 사원이 누군지 반환시키려면 SUBQUERY를 배워야함. :)
    -- 최근입사일은 83/01/12 : x,xxx일 근무, 최초입사일은 80/12/17 : xx,xxx일 근무
    SELECT '최근입사일은 ' || TO_CHAR(MAX(HIREDATE), 'YY/MM/DD')||' : '|| TO_CHAR(MIN(TRUNC(SYSDATE-HIREDATE)),'99,999') || '일 근무, 최초입사일은 '|| TO_CHAR(MIN(HIREDATE),'YY/MM/DD') || ' : ' || TO_CHAR(TRUNC(MAX(SYSDATE-HIREDATE)),'99,999')||'일 근무' FROM EMP;
    -- 10번 부서 소속의 사원 급여평균
    SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10;
-- 2. GROUP BY 절
-- 부서번호별 최대급여
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;   --WHERE DEPTNO를 10, 20, 30 세 번 수행할 필요가 없어짐.
-- 부서번호별 사원수, 최대급여, 최소급여, 평균급여(소수점 2자리)
SELECT COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2) 
    FROM EMP 
    GROUP BY DEPTNO 
    ORDER BY DEPTNO;
-- SAL이 5000미만인 사원에 대해서만 부서번호별 사원수, 최대급여, 최소급여, 평균급여
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2) 
    FROM EMP WHERE SAL < 5000 
    GROUP BY DEPTNO 
    ORDER BY DEPTNO;
-- 부서명별 사원수, 최대급여, 최소급여, 평균급여
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL)    -- GROUP BY를 SELECT절에 있는 항목으로 실시하라고 D.DEPTNO로는 오류가 발생...!
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME;
    
-- 3. HAVING절
-- 부서번호별 평균 급여가 2000이상인 부서만 출력
SELECT DEPTNO, AVG(SAL) FROM EMP
    WHERE AVG(SAL) >= 2000      -- 개인의 월급이 2000이상인 사원들을 대상으로 DEPTNO로 그룹화하는 명령임.
    GROUP BY DEPTNO;
SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000
    ORDER BY AVG_SAL DESC;   -- 필드의 별칭은 ORDER BY절에서만 사용가능. Having절에서는 별칭을 쓸 수 없음.
    
-- 4. 결과집합 내에 집계값 생성
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);
SELECT DEPTNO, JOB, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO, JOB);

------------------------------------------------------------------------------------6월 4일

SELECT * FROM EMP;
-- 1. 사원 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력
SELECT COUNT(*), MAX(SAL), MIN(SAL), SUM(SAL) FROM EMP;
-- 2. 사원테이블에서 업무별 인원수를 구하여 출력
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;
-- 3. 사원테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력
SELECT MAX(SAL)-MIN(SAL) FROM EMP;
-- 4. 각 부서별로 인원수, 급여 평균, 최저 급여, 최고 급여, 급여의 합을 출력하되 급여의 합이 많은 순으로 출력
SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;
SELECT DNAME, COUNT(*), ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME ORDER BY SUM(SAL) DESC;
-- 5. 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하라(출력결과는 부서번호, 업무순으로 오름차순 정렬)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO,JOB;
SELECT DNAME, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME, JOB;
-- 6. 업무별, 부서별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하라.(출력결과는 업무순, 부서번호 순 오름차순 정렬)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY JOB, DEPTNO ASC;
-- 7. 사원수가 5명이상 넘는 부서번호와 사원수 출력
SELECT DEPTNO, COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*) >=5;
-- 8. 사원수가 5명이상 넘는 부서명과 사원수를 출력
SELECT DNAME, COUNT(*) FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME HAVING COUNT(*) >= 5 ;
-- 9. 사원 테이블에서 업무별 급여의 평균이 3000이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여 출력
SELECT JOB, AVG(SAL), SUM(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) >=3000;
-- 10. 사원테이블에서 전체 급여가 5000을 초과하는 각 업무에 대해서 업무와 급여합계를 출력하라 단, 급여 합계로 내림차순 정렬
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB HAVING SUM(SAL) >= 5000 ORDER BY SUM(SAL) DESC;
-- 11. 부서별 급여평균, 부서별 급여합계, 부서별 최소급여를 출력
SELECT DEPTNO, ROUND(AVG(SAL),2), SUM(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO;
-- 12. 위의	11번에서 나온, 부서별 급여평균들 최대치, 부서별 급여합들의 최대치, 부서별 최소급여들의 최대치를 출력하라  
-- SELECT MAX(AVG(SAL),SUM(SAL),MIN(SAL)) FROM EMP GROUP BY E.DEPTNO;
SELECT MAX(AVG(SAL)), MAX(SUM(SAL)),MAX(MIN(SAL)) FROM EMP GROUP BY DEPTNO;
-- 13. 사원 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.  -------------------------------------------------------------------------------------------------
SELECT TO_CHAR(HIREDATE, 'YY'), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YY');
SELECT EXTRACT(YEAR FROM HIREDATE), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY EXTRACT(YEAR FROM HIREDATE);
SELECT SUBSTR(HIREDATE, 1, 2), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY SUBSTR(HIREDATE, 1, 2);
-- 14. 사원 테이블에서 아래의 결과를 출력하는 SELECT 문 작성    -------------------------------------------------------------------------------------------------------
SELECT NVL(TO_CHAR(HIREDATE, 'YY'),'TOTAL'), COUNT(*) FROM EMP GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YY'));
SELECT EXTRACT(YEAR FROM HIREDATE), COUNT(*) FROM EMP GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE));
-- 15. 사원테이블에서 최대급여, 최소급여, 전체급여합, 평균을 구하시오
SELECT MAX(SAL), MIN(SAL), SUM(SAL), AVG(SAL) FROM EMP;
-- 16. 사원테이블에서 부서별 인원수를 구하시오
SELECT COUNT(*) FROM EMP GROUP BY DEPTNO;
-- 17. 사원 테이블에서 부서별 인원수가 6명이상인 부서코드를 구하시오
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>=6;
-- 18. 사원테이블에서 급여가 높은 순서대로 등수를 부여하여 다음과 같은 결과가 나오게 하시오. (힌트 self join, outer join, group by, count사용)   -------------------------------
SELECT ENAME, RANK() OVER(ORDER BY SAL DESC) AS "RANK" FROM EMP;
SELECT ENAME, DENSE_RANK() OVER(ORDER BY SAL DESC) AS "DENSE_RANK" FROM EMP;
SELECT ENAME, ROW_NUMBER() OVER(ORDER BY SAL DESC) AS "ROW_NUM" FROM EMP;
SELECT E1.ENAME, E1.SAL, E2.ENAME, E2.SAL FROM EMP E1, EMP E2 WHERE E1.ENAME='SCOTT' AND E1.SAL<E2.SAL(+);
SELECT COUNT(E1.ENAME) FROM EMP E1, EMP E2 WHERE E1.SAL<E2.SAL(+);  -- 1단계 : SELF JOIN
SELECT E1.ENAME, COUNT(E2.ENAME)+1 AS "RANK" FROM EMP E1, EMP E2 WHERE E1.SAL < E2.SAL(+) GROUP BY E1.ENAME ORDER BY RANK;  -- 2단계 : GROUP BY, COUNT