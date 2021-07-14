-- [��]DDL, DML, DCL
-- SQL = DDL(���̺� ����, ���̺� ����, ���̺� ��������, ���̺��� ��� ������ ����)  :   DATA DEFINITION
--      + DML(SELECT, INSERT, UPDATE, DELETE)   :   DATA MANIPULATION
--      + DCL(����ڰ��� ����, ����ڿ��� ���Ѻο�, ���ѹ�Ż, ����ڰ��� ����, Ʈ������ ��ɾ�)   : DATA CONTROL

-- DDL
-- 1. ���̺� ����(CREATE TABLE)
CREATE TABLE BOOK (
    BOOKNO NUMBER(4),   -- ������ȣ BOOKNO�ʵ��� Ÿ���� ���� 4�ڸ�
    BOOKNAME VARCHAR2(20),  -- �����̸� BOOKNAME�ʵ��� Ÿ���� ���� 20BYTE
    PUBLICHER VARCHAR2(20), -- ���ǻ�
    RDATE   DATE,           -- ������ RDATE�ʵ��� Ÿ���� DATE��
    PRICE   NUMBER(8),      -- ����
    PRIMARY KEY(BOOKNO) );  -- ���̺� �� ��Ű(PRIMARY KEY) ����(����, NOT NULL)
SELECT * FROM BOOK;
DESCRIBE BOOK;
DROP TABLE BOOK;    -- ���̺� ����
CREATE TABLE book (
    bookno NUMBER(4) PRIMARY KEY,   -- PRIMARY KEY(��������)
    bookname VARCHAR2(100),
    publisher VARCHAR2(20),
    rdate DATE,
    price number(8) );
DESCRIBE BOOK;
-- EX) EMP�� ������ EMP01 : EMPNO(����4), ENAME(����20), SAL(����7, 2)
CREATE TABLE EMP01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL NUMBER(7, 2)    -- SAL�� ��ü 7�ڸ�(�Ҽ��� �� 5�ڸ�, �Ҽ��� �� 2�ڸ�, �Ҽ��� ��ȣ�� �ڸ��� ������)
    );
SELECT * FROM EMP01;
-- EX) DEPT�� ������ DEPT01 : DEPTNO(����2), DNAME(����14), LOC(����13)
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) );
-- ���������� �̿��� ���̺� ����
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP;  -- �������� ����� EMP02���̺� ���� �� ��(��, ���������� ������)
SELECT * FROM EMP02;
DESCRIBE EMP02;
    -- �̰��� �� �� �׽�Ʈ�� �ʿ䰡 ���� �� ����.---------------------------------------------------------------------------
-- EX) EMP03 : EMP���̺��� EMPNO, ENAME, DEPTNO�� ������ ������
CREATE TABLE EMP03
    AS
    SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- EX) EMP04 : EMP���̺��� 10�� �μ��� ����
CREATE TABLE EMP04
    AS
    SELECT * FROM EMP WHERE DEPTNO = 10;
SELECT * FROM EMP04;
-- EX) EMP05 : EMP���̺� ������ ����
CREATE TABLE EMP05
    AS
    SELECT * FROM EMP WHERE 1=0;    -- �ݵ�� ������ ������ �Է��Ͽ� ���õǴ� �����Ͱ� ������ �� -> ������ ����----------------------------------------------------------
SELECT * FROM EMP05;
DESCRIBE EMP05;

-- ��������...(�������� �����ڰ� �Ǽ����� �ʴ� �� �߻��� ���� ���� ���ٰ� �����ϼ̾��µ�...-_-;)
-- 2. ���̺� ��������(ALTER TALBLE)    -- å�� �ְ�, ���迡 ������, ������ �̰��� Ȱ��
-- ALTER TABLE ���̺�� ADD || MODIFY || DROP ~
-- (1) �ʵ� �߰�
SELECT * FROM EMP03;
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;    -- �ʵ��߰��� �����ʹ� NULL��
ALTER TABLE EMP03 ADD(COMM NUMBER(7,2));
-- (2) �ʵ�Ÿ�� ����(MODIFY)
SELECT * FROM EMP03;    --EMPNO(����), ENAME(����, DEPTNO(����), JOB�� SAL �� COMM�����Ͱ� NULL,
ALTER TABLE EMP03 MODIFY (EMPNO VARCHAR2(5));   -- ����!!! ���ڵ����Ͱ� ����־ ���ڷθ� ������ ����
ALTER TABLE EMP03 MODIFY (ENAME NUMBER(20));    -- ����!!!
DESCRIBE EMP03; 
-- ���� ENAME TYPE : VARCHAR2(10)
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(20));  -- ENAME Ÿ���� ����20BYTE�� �����.
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR2(8));
SELECT MAX(LENGTH(ENAME)) FROM EMP;  -- ���� �� �̸��� BYTE��
ALTER TABLE EMP03 MODIFY (ENAME VARCHAR(5));    -- ����!!!
-- �����Ͱ� �Ҵ���� ���� �� �ʵ�(NULL)�� ũ�⿡ ���� �����Ӱ� ������ ������. 
-- VARCHAR2�� 4000BYTE����

SELECT ROWNUM, EMPNO, ENAME FROM EMP;   -- ROWNUM : ���̺��� ���� ���� ����
SELECT ROWID, EMPNO, ENAME FROM EMP;    -- ROWID : ���� ���� �ּ�
-- (3) �ʵ����(DROP)
ALTER TABLE EMP03 DROP COLUMN JOB;  -- NULL�� �ʵ� ����
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN DEPTNO;   -- DEPTNO�ʵ� ������ �����ͱ��� ����    ---------------------------------------------------------------------
-- �������� Ư���ʵ带 ���� ���ϵ��� (��)
ALTER TABLE EMP03 SET UNUSED (COMM); -- COMM ���ٺҰ�, ���� ������ ���� ������ ���� -----------------------------------------------------------------       
-- �������� ���� �Ұ��ߴ� �ʵ带 ���������� ����(����)
ALTER TABLE EMP03 DROP UNUSED COLUMNS;      --------------------------------------------------------------------------------------------------------

-- 3. ���̺� ���� (DROP TABLE)
DROP TABLE EMP03;
DROP TABLE DEPT;    -- ����!! �ٸ� ���̺��� �����ϴ� �����Ͱ� ���� ��� DROP�Ұ�. (CASCADE ���߿� ���)

-- 4. ���̺��� ��� ���� ���� (TRUNCATE, DDL�� ��� �Ұ�! <-> DELETE, DML)
SELECT * FROM EMP03;
TRUNCATE TABLE EMP03;
SELECT * FROM EMP03;

-- 5. ���̺�� ����(RENAME)
SELECT * FROM EMP02;
RENAME EMP02 TO EMP2;   -- EMP02FMF EMP2�� ���̺�� ����
SELECT * FROM EMP2;

-- 6. ������ ��ųʸ�(���ٺҰ�) vs ������ ��ųʸ� ��(����� ���ٿ�) : ����ڰ� ���̺��� �����ϰų� ������ �� �����ͺ��̽� ������ ���� �ڵ����� ���ŵǴ� ���̺�----------------------------------------------------
-- ����
-- USER_XXX : �� ������ �����ϰ� �ִ� ��ü(���̺�, �ε���, ��������, ��...)
    -- USER_TABLES, USER_INDEXES, USER_CONSTRAINTS, USER_VIEWS
-- ALL_XXX : �� ������ ������ �� �ִ� ��ü
    -- ALL_TABLES, ALL_INDEXES, ALL_CONSTRAINTS, ALL_VIEWS
-- DBA_XXX : DBA�� ���ٰ���. DBMS�� ��� ��ü
    -- DBA_TABLES, DBA_INDEXES, DBA_CONSTRAINTS, DBA_VIEWS
SHOW USER;
SELECT * FROM USER_TABLES;  -- ���� ������ ���̺� ��ü
SELECT * FROM USER_INDEXES; -- �� ������ ������ �ε��� ��ü
SELECT * FROM USER_CONSTRAINTS; -- �� ������ ������ �������ǵ�
SELECT * FROM USER_VIEW;    -- �� ������ ������ ��
SELECT * FROM ALL_TABLES;   -- �� ������ ���� ������ ���̺� ��ü
SELECT * FROM ALL_TABLES WHERE TABLE_NAME = 'EMP';
SELECT * FROM ALL_INDEXES;
SELECT * FROM ALL_CONSTRAINTS;  -- �ý��� �����̱� ������ ���� ��ҵ��� ��µǴ���...
SELECT * FROM ALL_VIEWS;
SELECT * FROM DBA_TABLES;   -- DBA������ ��츸 ����
SELECT * FROM DBA_INDEXES;

-- DCL(����ڰ����� ����, ����� ���Ѻο�, ���ѹ�Ż, ����ڰ��� ����)
CREATE USER phl identified by tiger;    --phl ��������
-- ���Ѻο�(���Ǳ���, scott.emp, scott.dept�� ���� ��� ����); ����=�α׸��ؼ� ������ �ִ¾�?
GRANT CREATE SESSION TO phl;    -- : �α��θ� ����
GRANT ALL ON EMP TO phl;    -- GRANT SELECT ON EMP TO phl; GRANT UPDATE ON EMP TO phl; GRANT SELECT ON DEPT TO phl; GRANT UPDATE ON DEPT TO phl;
GRANT SELECT ON DEPT TO phl; 
GRANT SELECT ON EMP TO phl;

--���ѹ�Ż(���� ��Ż�� ID�� ���������� �����̾�� ��)
REVOKE ALL ON EMP FROM phl; -- �� ������ emp���̺� ���� ��� ���� ��Ż
REVOKE ALL ON DEPT FROM phl;

-- ����� ���� ����(���� �� �������� �Ұ�)
DROP USER phl CASCADE;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DML(SELECT, INSERT, UPDATE, DELETE)
-- 1. INSERT INTO ���̺�� VALUES (��1, ��2, ...);
--      INSERT INTO ���̺�� (�ʵ��1, �ʵ��2, ...) VALUES(��1, ��2, ...);
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES(10, 'ACCOUNTING','NEW YORK'); -- ���� ������ ���̺��� �ʵ������ ���� ��Ȯ�� �Է��ؾ߸� ��.
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (20, 'SALES', 'BOSTON');
INSERT INTO DEPT01 (DNAME, LOC, DEPTNO) VALUES ('IT', NULL, 30);    -- ��������� NULL�� �Է�
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (40, 'OPERATION');        -- ���������� NULL�� �߰�
-- ���������� �̿��� INSERT
    -- DEPT ���̺��� 10~30�� �μ��� INSERT
    DESC DEPT01;
    
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
-- BOOK���̺��� 11(å��ȣ)��, '����������', '�Ѽ����ǻ�',�������� ����, ������ 90000.
DESCRIBE BOOK;
SELECT * FROM BOOK;
INSERT INTO BOOK VALUES(11, '����������', '�Ѽ����ǻ�', SYSDATE, 90000);

-- Ʈ����� ��ɾ�(DML��ɸ� ����)
COMMIT; -- Ʈ������ ������ ����, �� Ʈ����� �۾��� DB�� �ݿ� => �� ���� INSERT����� DB�� �ݿ�
ROLLBACK;   -- ���� Ʈ����� �۾��� ���

-- ?	��������(ppt 2pt) ������ ���� ������ SAM01���̺��� �����Ͻÿ�. ���� �̸��� ���̺��� ������ ��츦 ����Ͽ� DROP TABLE�� ���� �� �����Ͻÿ�.
-- ?	SAM01�� ���� : EMPNO(���) ? NUMBER(4)
--	ENAME(�̸�) ? VARCHAR2(10)
--	JOB(��å) ? VARCHAR2(9)
--	SAL(�޿�) ? NUMBER(7,2)
--?	SAM01���̺� ������ ���� �����͸� �߰��Ͻÿ�

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
-- 2. UPDATE ���̺�� SET �ʵ��1=��1[, �ʵ��2=��2, ...] [WHERE ����];
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
-- �μ���ȣ�� 30���� ����
UPDATE EMP01 SET DEPTNO=30;

-- ��� ������ �޿��� 10%�� �λ��Ͻÿ�.
UPDATE EMP01 SET SAL = SAL*1.1;
SELECT * FROM EMP01;
-- 10���μ� ������ �Ի����� ���÷�, �μ���ȣ�� 30�� �μ��� �����Ͻÿ�.
UPDATE EMP01 SET HIREDATE = SYSDATE, DEPTNO = 30 WHERE DEPTNO = 10;
-- SAL�� 3000�̻��� ����� �޿�(SAL)�� 10%�λ�
UPDATE EMP01 SET SAL = SAL*1.1 WHERE SAL >= 3000;
-- 'DALLAS'�� �ٹ��ϴ� ������ �޿��� 1000$�� �λ�(��������)
UPDATE EMP01 SET SAL = SAL + 1000 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
--  SCOTT�� �μ���ȣ�� 20, JOB�� MANAGER, SAL�� COMM�� 500�� �λ�, ���� KING���� ����
UPDATE EMP01 
    SET DEPTNO = 20, 
        JOB = 'MANAGER', 
        SAL = SAL + 500, 
        COMM = NVL(COMM, 0) + 500, 
        MGR = (SELECT EMPNO FROM EMP01 WHERE ENAME = 'KING') 
    WHERE ENAME = 'SCOTT';
-- DEPT01 20�� �μ��� �������� 60�� �μ��� ���������� ����
-- JOIN�� �̿��� �� �ִ� ���� SELECT�� ��! ���� ��������(SUBQUERY)�� �ݵ�� �̿��ؾ��Ѵ�!
UPDATE DEPT01
    SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 60)
    WHERE DEPTNO = 20;  -- DEPT���̺� 60�� �μ��� ��� NULL�� ������
SELECT * FROM DEPT01;

--EMP01���̺��� ��� ����� �޿��� �Ի����� 'KING'�� �޿��� �Ի��Ϸ� ����
UPDATE EMP01 
    SET SAL=(SELECT SAL FROM EMP01 WHERE ENAME='KING'),
                 HIREDATE = (SELECT HIREDATE FROM EMP01 WHERE ENAME='KING');
UPDATE EMP01 
    SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE FROM EMP01 WHERE ENAME = 'KING');
COMMIT;
-- 3. DELETE FROM ���̺��
SELECT * FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;
SELECT * FROM EMP01;
-- EMP01���̺��� 30���μ� ������ ����
DELETE FROM EMP01 WHERE DEPTNO = 30;
-- EMP01���̺��� ������� 'FORD'�� ����� ����
DELETE FROM EMP01 WHERE ENAME = 'FORD';
--SAM1���̺��� JOB�� �������� �ʴ� ����� ����
DELETE FROM SAM01 WHERE JOB IS NULL;
--EMP01���̺��� �μ���(DNAME)�� SALES�� ����� ����(�������� �̿�)
DELETE FROM EMP01
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
SELECT * FROM DEPT;
-- EMP01���̺��� RESEARCH�μ� �Ҽ��� ����� ����
DELETE FROM EMP01 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
COMMIT;

-- �������� PDT PT.1
-- 1. �Ʒ��� ������ �����ϴ� MYDATA ���̺��� �����Ͻÿ�. �� ID�� PRIMARY KEY�̴�.
CREATE TABLE MY_DATA(
    ID NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(10),
    USERID VARCHAR2(30),
    SALARY NUMBER(10,2) );
-- 2. 1���� ���� ������ ���̺� �Ʒ��� ���� �Է��Ͽ���  --------------------------------------------------�� �ڸ������� , ǥ�ð� �ȵǴ� ������?
INSERT INTO MY_DATA VALUES(1, 'Scott', 'sscott', 10000.00);
INSERT INTO MY_DATA VALUES(2, INITCAP('Ford'), 'fford',  TO_NUMBER('13,000.00','999,999.00'));
INSERT INTO MY_DATA VALUES(3, 'Patal', 'ppatel',  TO_NUMBER('33,000.00','999,999,999.99'));
INSERT INTO MY_DATA VALUES(4, 'Report', 'rreport', 23500.00);
INSERT INTO MY_DATA VALUES(5, 'Good', 'ggood',  TO_NUMBER('44,450.00','999,999.99'));
-- 3. 2������ �Է��� �ڷḦ Ȯ���Ͽ���
DESCRIBE MY_DATA;
SELECT * FROM MY_DATA;

-- 4. �ڷḦ ���������� �����ͺ��̽��� ����Ͽ��� 
COMMIT;
-- 6. ID�� 3���� ����� �޿��� 65,000.00���� �����ϰ� ���������� �����ͺ��̽��� �ݿ��Ͽ���
UPDATE MY_DATA SET SALARY = 65000.00 WHERE ID = 3;
COMMIT;
-- 7. �̸��� Ford�� ����� ���� �����Ͽ���
DELETE FROM MY_DATA WHERE INITCAP(NAME) = 'Ford';
-- 8. �޿��� 15,000������ ����� �޿��� 15,000�� �����Ͽ���
UPDATE MY_DATA SET SALARY = 15000 WHERE SALARY <= 15000;
-- 9. 1������ ������ ���̺��� �����Ͽ���
DELETE FROM MY_DATA;

-- ��������
-- (1) PRIMARY KEY : �����ϰ� ���̺��� �� ���� �ĺ��ϴ� �ʵ� = NOT NULL + UNIQUE
-- (2) NOT NULL : NULL���� �������� ����.
-- (3) UNIQUE : ��� �࿡ ���� �����ؾ� ��. ��, NULL���� ���.
-- (4) FORIEGN KEY : ���̺��� ���� �ٸ� ���̺��� ���� ����
-- (5) CHECK(����) : �ش� ������ ����.
-- (6) DEFAULT : �⺻�� ���� (�ش� ���� �������Է��� ������ NULL

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
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, DEPTNO) VALUES (1004, 'YUN', 'MANAGER', 0, 30);   -- CHECK ��������
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO) VALUES (1005, 'YI', 'MANAGER', 80);    -- �ܷ�Ű ��������.

CREATE TABLE BOOKCATEGORY(
    CATEGORYCODE NUMBER(10),
    CATEGORYNAME VARCHAR2(30),
    OFFICE_LOC VARCHAR2(100),
    PRIMARY KEY(CATEGORYCODE),
    UNIQUE(CATEGORYNAME));
ALTER TABLE BOOKCATEGORY MODIFY CATEGORYNAME UNIQUE;
ALTER TABLE BOOKCATEGORY MODIFY OFFICE_LOC NOT NULL;

INSERT INTO BOOKCATEGORY VALUES (100, 'ö��', '3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (200, '�ι�', '3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (300, '�ڿ�����', '3�� ���н�');
INSERT INTO BOOKCATEGORY VALUES (400, 'IT', '4�� ���н�');


CREATE TABLE BOOK(
    CATEGORYCODE NUMBER(10),
    bookNO VARCHAR2(20),
    bookNAME VARCHAR2(30),
    PUBLISHER VARCHAR2(20),
--    PUBYEAR DATE DEFAULT SYSDATE, -- �������� �Է¾��ص� �Ǿ��ϴ°� �ƴѰ�? -> �Է��� ���ص� ������ DATE�κ� ���� �Է��� �׸��� ��üȭ ���ֿ�����.
    PUBYEAR NUMBER(4) DEFAULT EXTRACT(YEAR FROM SYSDATE), -- �������� �Է¾��ص� �Ǿ��ϴ°� �ƴѰ�? -> �Է��� ���ص� ������ DATE�κ� ���� �Է��� �׸��� ��üȭ ���ֿ�����.
    FOREIGN KEY(CATEGORYCODE) REFERENCES BOOKCATEGORY(CATEGORYCODE));
ALTER TABLE BOOK MODIFY bookNO PRIMARY KEY;
SELECT * FROM BOOK;
DROP TABLE BOOK;
DESCRIBE BOOKCATEGORY;  
--------------------UNIQUE, FOREIGN KEY Ȯ���� �� �ִ� ��ɾ�� ����?
DESCRIBE BOOK;

INSERT INTO BOOK (CATEGORYCODE, bookNO, bookNAME, PUBLISHER) VALUES (100, '110A01', 'ö������ ��', '��������');
INSERT INTO BOOK VALUES (300, '400A01', '�̰��� DB��', '��������', 2019);
INSERT INTO BOOK VALUES (900, '400A02', '�̰��� DB��', '��������', 2019);   -- �ܷ�Ű ��������
INSERT INTO BOOK VALUES (NULL, '400B02', '�ƹ�å', '�ƹ�����', 2020);

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

INSERT INTO MAJOR VALUES(1, '�濵����', '3�� �ι���');
INSERT INTO MAJOR VALUES(2, '����Ʈ�������', '3�� �ι���');
INSERT INTO MAJOR VALUES(3, '������', '4�� ���н�');
INSERT INTO MAJOR VALUES(4, '����', '4�� ���н�');
INSERT INTO MAJOR VALUES( (SELECT MAX(MAJOR_CODE) FROM MAJOR)+1, '������', '4�� ���н�') ;

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

INSERT INTO STUDENT VALUES('A01', '��浿', 100, 1);
INSERT INTO STUDENT VALUES('A02', '����', 90, 2);
INSERT INTO STUDENT VALUES('A03', 'ȫ��', 95, 1);
    
    