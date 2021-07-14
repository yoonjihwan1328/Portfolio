-- [Ⅶ]DDL, DML, DCL
-- SQL = DDL(테이블 생성, 테이블 삭제, 테이블 구조변경, 테이블의 모든 데이터 제거)  :   DATA DEFINITION
--      + DML(SELECT, INSERT, UPDATE, DELETE)   :   DATA MANIPULATION
--      + DCL(사용자계정 생성, 사용자에게 권한부여, 권한박탈, 사용자계정 삭제, 트랜젝션 명령어)   : DATA CONTROL

-- DDL
-- 1. 테이블 생성(CREATE TABLE)
CREATE TABLE BOOK (
    BOOKNO NUMBER(4),   -- 도서번호 BOOKNO필드의 타입은 숫자 4자리
    BOOKNAME VARCHAR2(20),  -- 도서이름 BOOKNAME필드의 타입은 문자 20BYTE
    PUBLICHER VARCHAR2(20), -- 출판사
    RDATE   DATE,           -- 출판일 RDATE필드의 타입은 DATE형
    PRICE   NUMBER(8),      -- 가격
    PRIMARY KEY(BOOKNO) );  -- 테이블 내 주키(PRIMARY KEY) 설정(유인, NOT NULL)
SELECT * FROM BOOK;
DESCRIBE BOOK;
DROP TABLE BOOK;    -- 테이블 삭제
CREATE TABLE book (
    bookno NUMBER(4) PRIMARY KEY,   -- PRIMARY KEY(제약조건)
    bookname VARCHAR2(100),
    publisher VARCHAR2(20),
    rdate DATE,
    price number(8) );
DESCRIBE BOOK;
-- EX) EMP와 유사한 EMP01 : EMPNO(숫자4), ENAME(문자20), SAL(숫자7, 2)
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL NUMBER(7, 2)    -- SAL은 전체 7자리(소수점 앞 5자리, 소수점 뒤 2자리, 소수점 기호는 자리수 미포함)
    );
SELECT * FROM EMP01;
-- EX) DEPT와 유사한 DEPT01 : DEPTNO(숫자2), DNAME(문자14), LOC(문자13)
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) );
-- 서브쿼리를 이용한 테이블 생성
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP;  -- 서브쿼리 결과만 EMP02테이블 생성 후 들어가(단, 제약조건은 미포함)
SELECT * FROM EMP02;
DESCRIBE EMP02;
    -- 이관을 한 후 테스트할 필요가 있을 때 유용.---------------------------------------------------------------------------
-- EX) EMP03 : EMP테이블에서 EMPNO, ENAME, DEPTNO만 추출한 데이터
CREATE TABLE EMP03
    AS
    SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- EX) EMP04 : EMP테이블에서 10번 부서만 추출
CREATE TABLE EMP04
    AS
    SELECT * FROM EMP WHERE DEPTNO = 10;
SELECT * FROM EMP04;
-- EX) EMP05 : EMP테이블 구조만 추출
CREATE TABLE EMP05
    AS
    SELECT * FROM EMP WHERE 1=0;    -- 반드시 거짓인 조건을 입력하여 선택되는 데이터가 없도록 함 -> 구조만 복사----------------------------------------------------------
SELECT * FROM EMP05;
DESCRIBE EMP05;

-- 구조변경...(위에서는 개발자가 실수하지 않는 한 발생할 일이 거의 없다고 말씀하셨었는데...-_-;)
-- 2. 테이블 구조변경(ALTER TALBLE)    -- 책에 있고, 시험에 나오고, 데이터 이관시 활용
-- ALTER TABLE 테이블명 ADD || MODIFY || DROP ~
-- (1) 필드 추가
SELECT * FROM EMP03;
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;    -- 필드추가시 데이터는 NULL로
ALTER TABLE EMP03 ADD(COMM NUMBER(7,2));
-- (2) 필드타입 수정(MODIFY)
SELECT * FROM EMP03;    --EMPNO(숫자), ENAME(문자, DEPTNO(숫자), JOB과 SAL 과 COMM데이터가 NULL,
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(5));   -- 오류!!! 숫자데이터가 들어있어서 숫자로만 변경이 가능
ALTER TABLE EMP03 MODIFY (ENAME NUMBER(20));    -- 오류!!!
DESCRIBE EMP03; 
-- 현재 ENAME TYPE : VARCHAR2(10)
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(20));  -- ENAME 타입이 문자20BYTE로 변경됨.
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(8));
SELECT MAX(LENGTH(ENAME)) FROM EMP;  -- 제일 긴 이름의 BYTE수
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR(5));    -- 오류!!!
-- 데이터가 할당되지 않은 빈 필드(NULL)는 크기에 대해 자유롭게 변경이 가능함. 
-- VARCHAR2는 4000BYTE까지

SELECT ROWNUM, EMPNO, ENAME FROM EMP;   -- ROWNUM : 테이블에서 행의 논리적 순서
SELECT ROWID, EMPNO, ENAME FROM EMP;    -- ROWID : 행의 논리적 주소
-- (3) 필드삭제(DROP)
ALTER TABLE EMP03 DROP COLUMN JOB;  -- NULL인 필드 삭제
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN DEPTNO;   -- DEPTNO필드 삭제시 데이터까지 제거    ---------------------------------------------------------------------
-- 논리적으로 특정필드를 접근 못하도록 (낮)
ALTER TABLE EMP03 SET UNUSED (COMM); -- COMM 접근불가, 낮에 실행해 놓고 새벽에 삭제 -----------------------------------------------------------------       
-- 논리적으로 접근 불가했던 필드를 물리적으로 삭제(새벽)
ALTER TABLE EMP03 DROP UNUSED COLUMNS;      --------------------------------------------------------------------------------------------------------

-- 3. 테이블 삭제 (DROP TABLE)
DROP TABLE EMP03;
DROP TABLE DEPT;    -- 오류!! 다른 테이블에서 참조하는 데이터가 있을 경우 DROP불가. (CASCADE 나중에 배움)

-- 4. 테이블의 모든 행을 제거 (TRUNCATE, DDL은 취소 불가! <-> DELETE, DML)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03;
SELECT * FROM EMP03;

-- 5. 테이블명 변경(RENAME)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;   -- EMP02FMF EMP2로 테이블명 변경
SELECT * FROM EMP2;

-- 6. 데이터 딕셔너리(접근불가) vs 데이터 딕셔너리 뷰(사용자 접근용) : 사용자가 테이블을 생성하거나 변경할 때 데이터베이스 서버에 의해 자동으로 갱신되는 테이블----------------------------------------------------
-- 종류
-- USER_XXX : 현 계정이 소유하고 있는 객체(테이블, 인덱스, 제약조건, 뷰...)
    -- USER_TABLES, USER_INDEXES, USER_CONSTRAINTS, USER_VIEWS
-- ALL_XXX : 현 계정이 접근할 수 있는 객체
    -- ALL_TABLES, ALL_INDEXES, ALL_CONSTRAINTS, ALL_VIEWS
-- DBA_XXX : DBA만 접근가능. DBMS의 모든 객체
    -- DBA_TABLES, DBA_INDEXES, DBA_CONSTRAINTS, DBA_VIEWS
SHOW USER;
SELECT * FROM USER_TABLES;  -- 내가 소유한 테이블 객체
SELECT * FROM USER_INDEXES; -- 내 계정이 소유한 인덱스 객체
SELECT * FROM USER_CONSTRAINTS; -- 내 계정이 소유한 제약조건들
SELECT * FROM USER_VIEW;    -- 내 계정이 소유한 뷰
SELECT * FROM ALL_TABLES;   -- 내 계정이 접근 가능한 테이블 객체
SELECT * FROM ALL_TABLES WHERE TABLE_NAME = 'EMP';
SELECT * FROM ALL_INDEXES;
SELECT * FROM ALL_CONSTRAINTS;  -- 시스템 계정이기 떄문에 여러 요소들이 출력되는중...
SELECT * FROM ALL_VIEWS;
SELECT * FROM DBA_TABLES;   -- DBA권한일 경우만 가능
SELECT * FROM DBA_INDEXES;

-- DCL(사용자계정을 생성, 사용자 권한부여, 권한박탈, 사용자계정 삭제)
CREATE USER phl identified by tiger;    --phl 계정생성
-- 권한부여(세션권한, scott.emp, scott.dept에 대한 모든 권한); 세션=로그린해서 가지고 있는애?
GRANT CREATE SESSION TO phl;    -- : 로그인만 가능
GRANT ALL ON EMP TO phl;    -- GRANT SELECT ON EMP TO phl; GRANT UPDATE ON EMP TO phl; GRANT SELECT ON DEPT TO phl; GRANT UPDATE ON DEPT TO phl;
GRANT SELECT ON DEPT TO phl; 
GRANT SELECT ON EMP TO phl;

--권한박탈(권한 박탈할 ID가 접속해제인 상태이어야 함)
REVOKE ALL ON EMP FROM phl; -- 내 계정의 emp테이블에 대한 모든 권한 박탈
REVOKE ALL ON DEPT FROM phl;

-- 사용자 계정 삭제(접속 중 계정삭제 불가)
DROP USER phl CASCADE;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DML(SELECT, INSERT, UPDATE, DELETE)
-- 1. INSERT INTO 테이블명 VALUES (값1, 값2, ...);
--      INSERT INTO 테이블명 (필드명1, 필드명2, ...) VALUES(값1, 값2, ...);
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES(10, 'ACCOUNTING','NEW YORK'); -- 값의 순서를 테이블의 필드순서에 맞춰 정확히 입력해야만 함.
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (20, 'SALES', 'BOSTON');
INSERT INTO DEPT01 (DNAME, LOC, DEPTNO) VALUES ('IT', NULL, 30);    -- 명시적으로 NULL을 입력
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (40, 'OPERATION');        -- 묵시적으로 NULL이 추가
-- 서브쿼리를 이용한 INSERT
    -- DEPT 테이블에서 10~30번 부서를 INSERT
    DESC DEPT01;
    
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
-- BOOK테이블에서 11(책번호)번, '스포츠의학', '한솔출판사',출판일은 오늘, 가격은 90000.
DESCRIBE BOOK;
SELECT * FROM BOOK;
INSERT INTO BOOK VALUES(11, '스포츠의학', '한솔출판사', SYSDATE, 90000);

-- 트랜잭션 명령어(DML명령만 가능)
COMMIT; -- 트랜젝션 단위로 진행, 현 트랜잭션 작업을 DB에 반영 => 이 경우는 INSERT명령을 DB에 반영
ROLLBACK;   -- 현재 트랜잭션 작업을 취소

-- ?	연습문제(ppt 2pt) 다음과 같은 구조로 SAM01테이블을 생성하시오. 같은 이름의 테이블이 존재할 경우를 대비하여 DROP TABLE로 삭제 후 생성하시오.
-- ?	SAM01의 구조 : EMPNO(사번) ? NUMBER(4)
--	ENAME(이름) ? VARCHAR2(10)
--	JOB(직책) ? VARCHAR2(9)
--	SAL(급여) ? NUMBER(7,2)
--?	SAM01테이블에 다음과 같은 데이터를 추가하시오

DROP TABLE SAM01;
CREATE TABLE SAM01 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    SAL NUMBER(7,2) );
    SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM SAM01;
INSERT INTO SAM01 VALUES (1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01 VALUES (1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01 VALUES (1020, 'ORANGE', 'DOCTOR', 25000);
INSERT INTO SAM01 VALUES (1030, 'VERY', NULL, 25000);
INSERT INTO SAM01 VALUES (1040, 'CAT', NULL, 2000);
--INSERT INTO SAM01 VALUES (7782, 'CLARK', 'MANAGER', 2450);
--INSERT INTO SAM01 VALUES (7839, 'KING', 'PRESIDENT', 5000);
--INSERT INTO SAM01 VALUES (7934, 'MILLER', 'CLERK', 1300);
COMMIT;
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 10;-------------------------------------------------------------
SELECT * FROM EMP;
-- 2. UPDATE 테이블명 SET 필드명1=값1[, 필드명2=값2, ...] [WHERE 조건];
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
-- 부서번호를 30으로 수정
UPDATE EMP01 SET DEPTNO=30;

-- 모든 직원의 급여를 10%씩 인상하시오.
UPDATE EMP01 SET SAL = SAL*1.1;
SELECT * FROM EMP01;
-- 10번부서 직원의 입사일을 오늘로, 부서번호는 30번 부서로 수정하시오.
UPDATE EMP01 SET HIREDATE = SYSDATE, DEPTNO = 30 WHERE DEPTNO = 10;
-- SAL이 3000이상인 사원만 급여(SAL)를 10%인상
UPDATE EMP01 SET SAL = SAL*1.1 WHERE SAL >= 3000;
-- 'DALLAS'에 근무하는 직원의 급여를 1000$씩 인상(서브쿼리)
UPDATE EMP01 SET SAL = SAL + 1000 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
--  SCOTT의 부서번호는 20, JOB은 MANAGER, SAL과 COMM을 500씩 인상, 상사는 KING으로 수정
UPDATE EMP01 
    SET DEPTNO = 20, 
        JOB = 'MANAGER', 
        SAL = SAL + 500, 
        COMM = NVL(COMM, 0) + 500, 
        MGR = (SELECT EMPNO FROM EMP01 WHERE ENAME = 'KING') 
    WHERE ENAME = 'SCOTT';
-- DEPT01 20번 부서의 지역명을 60번 부서의 지역명으로 변경
-- JOIN을 이용할 수 있는 것은 SELECT문 뿐! 따라서 서브쿼리(SUBQUERY)를 반드시 이용해야한다!
UPDATE DEPT01
    SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 60)
    WHERE DEPTNO = 20;  -- DEPT테이블에 60번 부서가 없어서 NULL로 수정됨
SELECT * FROM DEPT01;

--EMP01테이블의 모든 사원의 급여와 입사일을 'KING'의 급여와 입사일로 수정
UPDATE EMP01 
    SET SAL=(SELECT SAL FROM EMP01 WHERE ENAME='KING'),
                 HIREDATE = (SELECT HIREDATE FROM EMP01 WHERE ENAME='KING');
UPDATE EMP01 
    SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE FROM EMP01 WHERE ENAME = 'KING');
COMMIT;
-- 3. DELETE FROM 테이블명
SELECT * FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;
SELECT * FROM EMP01;
-- EMP01테이블에서 30번부서 직원만 삭제
DELETE FROM EMP01 WHERE DEPTNO = 30;
-- EMP01테이블에서 사원명이 'FORD'인 사원을 삭제
DELETE FROM EMP01 WHERE ENAME = 'FORD';
--SAM1테이블에서 JOB이 정해지지 않는 사원을 삭제
DELETE FROM SAM01 WHERE JOB IS NULL;
--EMP01테이블에서 부서명(DNAME)이 SALES인 사원을 삭제(서브쿼리 이용)
DELETE FROM EMP01
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
SELECT * FROM DEPT;
-- EMP01테이블에서 RESEARCH부서 소속인 사원을 삭제
DELETE FROM EMP01 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
COMMIT;

-- 연습문제 PDT PT.1
-- 1. 아래의 구조를 만족하는 MYDATA 테이블을 생성하시오. 단 ID가 PRIMARY KEY이다.
CREATE TABLE MY_DATA(
    ID NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(10),
    USERID VARCHAR2(30),
    SALARY NUMBER(10,2) );
-- 2. 1번에 의해 생성된 테이블에 아래의 값을 입력하여라  --------------------------------------------------세 자리수마다 , 표시가 안되는 이유는?
INSERT INTO MY_DATA VALUES(1, 'Scott', 'sscott', 10000.00);
INSERT INTO MY_DATA VALUES(2, INITCAP('Ford'), 'fford',  TO_NUMBER('13,000.00','999,999.00'));
INSERT INTO MY_DATA VALUES(3, 'Patal', 'ppatel',  TO_NUMBER('33,000.00','999,999,999.99'));
INSERT INTO MY_DATA VALUES(4, 'Report', 'rreport', 23500.00);
INSERT INTO MY_DATA VALUES(5, 'Good', 'ggood',  TO_NUMBER('44,450.00','999,999.99'));
-- 3. 2번에서 입력한 자료를 확인하여라
DESCRIBE MY_DATA;
SELECT * FROM MY_DATA;

-- 4. 자료를 영구적으로 데이터베이스에 등록하여라 
COMMIT;
-- 6. ID가 3번인 사람의 급여를 65,000.00으로 갱신하고 영구적으로 데이터베이스에 반영하여라
UPDATE MY_DATA SET SALARY = 65000.00 WHERE ID = 3;
COMMIT;
-- 7. 이름이 Ford인 사원을 영구 제명하여라
DELETE FROM MY_DATA WHERE INITCAP(NAME) = 'Ford';
-- 8. 급여가 15,000이하인 사람의 급여를 15,000로 변경하여라
UPDATE MY_DATA SET SALARY = 15000 WHERE SALARY <= 15000;
-- 9. 1번에서 생성한 테이블을 삭제하여라
DELETE FROM MY_DATA;

-- 제약조건
-- (1) PRIMARY KEY : 유일하게 테이블의 각 행을 식별하는 필드 = NOT NULL + UNIQUE
-- (2) NOT NULL : NULL값을 포함하지 않음.
-- (3) UNIQUE : 모든 행에 대해 유일해야 함. 단, NULL값을 허용.
-- (4) FORIEGN KEY : 테이블의 열은 다른 테이블의 열을 참조
-- (5) CHECK(조건) : 해당 조건이 만족.
-- (6) DEFAULT : 기본값 설정 (해당 열의 데이터입력이 없으면 NULL

CREATE TABLE DEPT1 (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14) UNIQUE,
    LOC VARCHAR2(13) NOT NULL,
    PRIMARY KEY(DEPTNO) 
    );
DESCRIBE DEPT1;
DROP TABLE DEPT1;
CREATE TABLE DEPT1 (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) NOT NULL,
    PRIMARY KEY(DEPTNO),
    UNIQUE(DNAME)
    );
CREATE TABLE EMP1(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) NOT NULL,
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT1(DEPTNO)
    );
SELECT * FROM EMP1;
DROP TABLE EMP1;
CREATE TABLE EMP1(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) NOT NULL,
    MGR NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2),
    PRIMARY KEY(EMPNO),
    CHECK(SAL>0),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO));

INSERT INTO DEPT1 SELECT * FROM DEPT;
INSERT INTO DEPT1 (DEPTNO, DNAME, LOC)
    VALUES(50, 'IT', 'MAPO');
INSERT INTO DEPT1 (DEPTNO, DNAME, LOC)
    VALUES (60, 'PLANNING', 'MAPO');
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, COMM, DEPTNO)
    VALUES (1001, 'KIM', 'MANAGER', 9000, 9000, 50);    -- DEFAULT SYSDATE
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1002, 'PARK', 'MANAGER', 60);   -- PK
INSERT INTO EMP1 (EMPNO, JOB, DEPTNO) VALUES (1003, 'MANAGER', 40); -- NOT NULL
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, DEPTNO) VALUES (1004, 'YUN', 'MANAGER', 0, 30);   -- CHECK 제약조건
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1005, 'YI', 'MANAGER', 80);    -- 외래키 제약조건.

CREATE TABLE BOOKCATEGORY(
    CATEGORYCODE NUMBER(10),
    CATEGORYNAME VARCHAR2(30),
    OFFICE_LOC VARCHAR2(100),
    PRIMARY KEY(CATEGORYCODE),
    UNIQUE(CATEGORYNAME));
ALTER TABLE BOOKCATEGORY MODIFY CATEGORYNAME UNIQUE;
ALTER TABLE BOOKCATEGORY MODIFY OFFICE_LOC NOT NULL;

INSERT INTO BOOKCATEGORY VALUES (100, '철학', '3층 인문실');
INSERT INTO BOOKCATEGORY VALUES (200, '인문', '3층 인문실');
INSERT INTO BOOKCATEGORY VALUES (300, '자연과학', '3층 과학실');
INSERT INTO BOOKCATEGORY VALUES (400, 'IT', '4층 과학실');


CREATE TABLE BOOK(
    CATEGORYCODE NUMBER(10),
    bookNO VARCHAR2(20),
    bookNAME VARCHAR2(30),
    PUBLISHER VARCHAR2(20),
--    PUBYEAR DATE DEFAULT SYSDATE, -- 공란으로 입력안해도 되야하는거 아닌가? -> 입력을 안해도 되지만 DATE부분 뺴고 입력할 항목을 구체화 해주여야함.
    PUBYEAR NUMBER(4) DEFAULT EXTRACT(YEAR FROM SYSDATE), -- 공란으로 입력안해도 되야하는거 아닌가? -> 입력을 안해도 되지만 DATE부분 뺴고 입력할 항목을 구체화 해주여야함.
    FOREIGN KEY(CATEGORYCODE) REFERENCES BOOKCATEGORY(CATEGORYCODE));
ALTER TABLE BOOK MODIFY bookNO PRIMARY KEY;
SELECT * FROM BOOK;
DROP TABLE BOOK;
DESCRIBE BOOKCATEGORY;  
--------------------UNIQUE, FOREIGN KEY 확인할 수 있는 명령어는 없나?
DESCRIBE BOOK;

INSERT INTO BOOK (CATEGORYCODE, bookNO, bookNAME, PUBLISHER) VALUES (100, '110A01', '철학자의 삶', '더존출판');
INSERT INTO BOOK VALUES (300, '400A01', '이것은 DB다', '더존출판', 2019);
INSERT INTO BOOK VALUES (900, '400A02', '이것은 DB다', '더존출판', 2019);   -- 외래키 참조에러
INSERT INTO BOOK VALUES (NULL, '400B02', '아무책', '아무출판', 2020);

SELECT B.*, categoryNAME, OFFICE_LOC
    FROM BOOK B, BOOKCATEGORY C
    WHERE B.CATEGORYCODE = C.CATEGORYCODE;
    
CREATE TABLE MAJOR(
    MAJOR_CODE NUMBER(1),
    MAJOR_NAME VARCHAR2(30),
    MAJOR_OFFICE_LOC VARCHAR2(100) NOT NULL,
    PRIMARY KEY(MAJOR_CODE),
    UNIQUE(MAJOR_NAME));
SELECT * FROM MAJOR;
DESCRIBE MAJOR;
DROP TABLE MAJOR;

INSERT INTO MAJOR VALUES(1, '경영정보', '3층 인문실');
INSERT INTO MAJOR VALUES(2, '소프트웨어공학', '3층 인문실');
INSERT INTO MAJOR VALUES(3, '디자인', '4층 과학실');
INSERT INTO MAJOR VALUES(4, '경제', '4층 과학실');
INSERT INTO MAJOR VALUES( (SELECT MAX(MAJOR_CODE) FROM MAJOR)+1, '빅데이터', '4층 과학실') ;

CREATE TABLE STUDENT (
    STUDENT_CODE VARCHAR2(10),
    STUDENT_NAME VARCHAR(13) NOT NULL,
    SCORE NUMBER(3),
    MAJOR_CODE NUMBER(1),
    PRIMARY KEY(STUDENT_CODE),
    CHECK(SCORE>0 AND SCORE<=100),
    FOREIGN KEY(MAJOR_CODE) REFERENCES MAJOR(MAJOR_CODE));
DESCRIBE STUDENT;
SELECT * FROM STUDENT ORDER BY STUDENT_CODE;
DROP TABLE STUDENT;

INSERT INTO STUDENT VALUES('A01', '김길동', 100, 1);
INSERT INTO STUDENT VALUES('A02', '문월', 90, 2);
INSERT INTO STUDENT VALUES('A03', '홍길', 95, 1);
    
    