--[��] �������Լ�; �����Լ�
-- �Լ� = �������Լ� + �׷��Լ�(�����Լ�)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"��"MM"��"DD"��"') FROM EMP; -- ������ �Լ� : �������� ����ְ� �������� ��ȯ��.
SELECT ENAME, INITCAP(ENAME) FROM EMP;  -- �׷��Լ�(�����Լ�) : �������� ����Ͽ� �� ���� ��ȯ��.
SELECT SUM(SAL) FROM EMP;

SELECT DEPTNO, SUM(SAL) FROM EMP;   -- (ERROR!!!)�������Լ��� �׷��Լ��� �Բ� ���� �� ����.
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;   -- �μ���ȣ�� �հ�

-- EX. ���ڰ����Լ�, ���ڰ����Լ�, ��¥�����Լ�, ����ȯ�Լ�, NVL(), ETC...
-- 1. �����Լ�
-- DUAL ���̺� : ����Ŭ���� �����ϴ� �⺻���̺�(1�� 1��¥�� DUMMY TABLE)
SELECT * FROM DUAL;
DESCRIBE DUAL;
SELECT * FROM DUMMY;
DESCRIBE DUMMY;
SELECT ABS(-9) FROM DUAL;
SELECT FLOOR(34.5678) FROM DUAL;    -- �Ҽ��� �Ʒ��� ����.
SELECT FLOOR(34.5678*100) /100 FROM DUAL;   -- �Ҽ��� �� ��° �ڸ����� ����
SELECT TRUNC(34.5678) FROM DUAL;    -- �Ҽ��� �Ʒ��� ����
SELECT TRUNC(34.5678,2) FROM DUAL;  -- �Ҽ��� �ڸ����� �����Ͽ� ������ �� ����
SELECT TRUNC(34.5678, -1) FROM DUAL;-- ���� �ڸ����� ����
SELECT TRUNC(-34.5678) FROM DUAL;

    -- EMP ���̺��� �̸�, �޿�(���� �ڸ����� ����)
    SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; -- 0�� �ڸ����� �ݿø�.
SELECT ROUND(34.5678) FROM DUAL;
SELECT ROUND(34.5678, 2) FROM DUAL; -- �Ҽ��� �ι�° �ڸ����� �ݿø�.
SELECT ROUND(34.5678, -1) FROM DUAL;    -- �����ڸ����� �ݿø�.

SELECT MOD(9,2) FROM DUAL;  -- ������ ������
SELECT MOD('9'/2) FROM DUAL;

-- Ȧ���޿� �Ի��� �������� ��� �ʵ带 ���
SELECT * FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'MM'),2)=1;

-- 2. �����Լ�                          -- 6�� 3��
SELECT UPPER('abcABC') FROM DUAL;
SELECT LOWER('abcABC') FROM DUAL;
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL;
    -- JOB�� MANAGER�� ������ ��� �ʵ�
    SELECT * FROM EMP WHERE UPPER(JOB) = 'MANAGER';
    -- �̸��� SCOTT�� ������ ��� �ʵ�
    SELECT * FROM EMP WHERE INICAP(ENAME) = 'Scott';    -- ������(�̸�)�� � ���·� ����Ǿ� �ִ��� �� �� �����Ƿ�
-- ���ڿ���(CONCAT�Լ�, ||������ ��� ���� - MYSQL������ ||�� OR�� ���⶧���� ���ڿ��ῡ ����� �� ����)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT('AB', 'CD') FROM DUAL;
SELECT CONCAT(CONCAT('AB', 'CD'), CONCAT('EF', 'GH')) FROM DUAL;
SELECT CONCAT('AB', 'CD', 'EF', 'GH') FROM DUAL;    -- (ERROR!!!)CONCAT�� 2�����ۿ� �۵� ���ϴ� ��.
    -- xxx�� xx�� (SCOTT�� JOB�̴�)
SELECT CONCAT(CONCAT(ENAME, '��(��) '),CONCAT(JOB, '�̴�')) FROM EMP;   -- ���Ῥ���ڸ� ���� �ʴ´ٸ�
-- SUBSTR(STR, ������ġ, ���ڰ���)    -- ������ġ�� 1�� ù��° ��ġ, ������ ����
-- SUBSTRB(STR, ���۹���Ʈ, ���ڹ���Ʈ��)
SELECT SUBSTR('ORACLE', 3, 2) FROM DUAL;    -- 3��° ���ں��� 2���� ����
SELECT SUBSTRB('ORACLE', 3, 2) FROM DUAL;   -- 3��° BYTE���� 2BYTE ����
SELECT SUBSTR('�����ͺ��̽�', 4, 2) FROM DUAL;    -- 4��° ���ں��� 2���� ����
SELECT SUBSTRB('�����ͺ��̽�', 4, 2) FORM DUAL;   -- 4��° BYTE���� 3BYTE ����
-- ����� �� ���ڰ� 1BYTE, �ѱ��� �� ���ڰ� 3BYTE
-- SUBSTR �μ��� ������ ����ϴ� ���
--  O   R   A   C   L   E
--  1   2   3   4   5   6 (��ġ)
--(-6)(-5)(-4)(-3)(-2)(-1) (��ġ)
SELECT SUBSTR('WELCOME TO ORACLE', -1, 1) FROM DUAL;
    -- 9���� �Ի��� ����� ��� �ʵ�
    SELECT SUBSTR(123, 2, 1) FROM DUAL; -- ������ ��쿡�� ����
    -- 9���� �Ի��� ����� ��� �ʵ� 81/09/01
    ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4, 2) ='09';
    -- 9�Ͽ� �Ի��� ����� ��� �õ� 81/09/09
    SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2, 2) = '09'; -- ��ȭ��ȣ ���ڸ��� ������ ��, �߰��ڸ����� INSTR(��?)
SELECT LENGTH('ABCD') FROM DUAL;    -- ���ڼ�
SELECT LENGTHB('ABCD') FROM DUAL;   -- BYTE��
SELECT LENGTH('����Ŭ') FROM DUAL;   -- ���ڼ� : 3
SELECT LENGTHB('����Ŭ') FROM DUAL;  -- BYTE�� : 9
-- INSTR(STR, ã������); STR���� ã�� ������ ��ġ(ù��° 1), ���� ��� 0�� ��ȯ
-- INSTR(STR, ã������, ������ġ); JAVA�� LASTINDEXOF ��� ����� �� ����. STR���� ������ġ���� ã�� ������ ��ġ�� ��ȯ
SELECT INSTR('ABCabcABCabc', 'B') FROM DUAL;    -- ó������ ã�Ƽ� ó�� ������ B�� ��ġ�� ��ȯ
SELECT INSTR('ABCabcABCabc', 'B', 3) FROM DUAL; -- 3��°���� ã�Ƽ� ó�� ������ B�� ��ġ
SELECT INSTR('ABCabdcABCabcd', 'B', -3) FROM DUAL;    -- �� 3��°���� ���������� ã�� ù�������� B�� ��ġ
    -- 9���� �Ի��� ���(INSTR�̿�) 81/09/01
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 3) = 4;   -- �ý����� ��¥�Է¹���� �̸� �˰� �ִ� ��쿡�� ������ ����ε�?
    -- 9�Ͽ� �Ի��� ���(INSTR�̿�)
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 6) = 7;
    -- 9���� �ƴ� �ٸ� ���� �Ի��� ���
    SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 6) = 0;   -- ���� ��� 0�� ��ȯ�ϹǷ�
-- LPAD(����, �ڸ���, ä�﹮��) STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ä�﹮�� ���
SELECT LPAD('ORACLE', 10, '#'), RPAD('ORACLE', 10, '*') FROM DUAL;

    SELECT ENAME, LPAD(SAL, 6, '*') FROM EMP;
    -- ��� S****(�̸��� �� �� ���ڸ� ����ϰ� �������� *)
    -- ��� W***  (RPAD, SUBSTR, LENGTH)
    SELECT RPAD('S',5,'*') FROM DUAL;
    SELECT RPAD(SUBSTR(EMPNO,1,1), LENGTH(ENAME), '*') FROM EMP;
    -- 7499_****H 80/12/**
    SELECT EMPNO, LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME),'*') AS "NAME", RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*') AS "HireDate" FROM EMP;
    -- �̸��� �� ��° �ڸ��� R�� ����� ��� �ʵ�(LIKE, INSTR, SUBSTR)
    SELECT * FROM EMP WHERE ENAME LIKE '__R%';
    SELECT * FROM EMP WHERE INSTR(ENAME, 'R', 3) = 3;   -- ������� ���� ENAME 3��°�� R�� �ִ� �����ε�?
    SELECT * FROM EMP WHERE SUBSTR(ENAME, 3, 1) = 'R';
SELECT TRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT LTRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT RTRIM('     ORACLE DB     ') MSG FROM DUAL;
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP; 
SELECT REPLACE(HIREDATE, '0', 'XX') FROM EMP;

SELECT SYSDATE FROM DUAL; -- SYSDATE : ����
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD DY HH24:MI';
ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';   -- ���󺹱�
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS') FROM DUAL;
    -- ����Ŭ Ÿ�� : ����, ����, DATE(����, DATE�� ���� ����)
        -- �����̸��� ���ڷ� ����, �������� ��������� ����ִ� ������ ������ ����, ����Ŭ���� �����̸��� ���.
SELECT SYSDATE-1 �����̽ð�, SYSDATE ����, SYSDATE+1 �����̽ð� FROM DUAL;
-- 14�� ��
SELECT SYSDATE+14 FROM DUAL;
    -- EMP���� �̸�, �Ի���, �ٹ��Ⱓ
    SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE,1) FROM EMP;
    SELECT ENAME, HIREDATE, FLOOR(SYSDATE-HIREDATE) FROM EMP;
    -- �̸�, �Ի���, �ٹ��ּ�, �ٹ����
    SELECT ENAME, HIREDATE, TRUNC((SYSDATE - HIREDATE)/7), TRUNC((SYSDATE - HIREDATE)/365) FROM EMP;
    -- �̸�, �Ի���, �ٹ����� (MONTH_BETWEEN()�Լ�)
    SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE)FROM EMP;
    SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "�ٹ�����" FROM EMP;
    -- �̸�, �Ի���, ����������� (ADD_MONTHS()�Լ� : Ư���������� �� ���� ��)
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3) AS "���� ���� �� �ٹ�����" FROM EMP;
    -- �̸�, �Ի��� ���� ���� �޿��� ��(�޿��� �Ŵ� SAL �� �ް� �󿩱��� 2�� COMM�� ����)
    SELECT ENAME, (TRUNC((MONTHS_BETWEEN(SYSDATE, HIREDATE) * SAL)) + TRUNC((SYSDATE-HIREDATE)/365)*2*NVL(COMM,0)) AS COST FROM EMP; 
-- NEXT_DAY(Ư����¥, '��') Ư����¥�κ��� ó�� �����ϴ� ������
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;    -- Ư���� ������ �˰� ���� ��
-- LAST_DAY(Ư����¥) ; Ư������ ����
SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- EMP �̸�, �Ի���, ù ���޳�(���޳� ����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;
-- ROUND: ��¥ �ݿø� ���� TRUNC: ��¥����
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- YEAR�� �������� �ݿø��� ��� ����� 1�� 1�Ϸ� 
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL;   -- MONTH�� �������� ����� 1��
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- ����� �Ͽ���
SELECT ROUND(SYSDATE) FROM DUAL;    -- ����� 0��
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL;    -- ���� 1��    
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL;   -- �̹��� 1��
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- ���� �Ͽ���
SELECT TRUNC(SYSDATE) FROM DUAL; -- ���� 0��
    -- �̸�, �Ի���, �Ի��� ���� 5��
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+4 FROM EMP;
    -- �̸�, �Ի���, ���޳�(5��) ; ������ �Ի����� �� ���� �ȵǾ 5���� �Ǹ� ������ ����
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11, 'MONTH') FROM EMP;   -- '15 OR 16' ������ '4 OR 5'�� ����;
    -- �̸�, �Ի���, ���޳�(15��)
    
    -- �̸�, �Ի���, ���޳�(25��)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH') FROM EMP;

-- 4. ����ȯ �Լ� (TO_CHAR() : ���ڷ� ����ȯ, TO_DATE() : ��¥������ ����ȯ)
-- (1) TO_CHAR(DATE�� ������, '�������')
SELECT TO_CHAR(SYSDATE, 'YY"��"MM"��"DD"��" DY"����" HH24:MI:SS') FROM DUAL;
    -- YYYY �⵵4�ڸ� / YY �⵵2�ڸ� / RR �⵵2�ڸ� / MM�� / DD��
    -- DAY���� / DY ���Ͽ��ǥ��
    -- AM �̳� PM / HH12(12�ð���) HH24(24�ð���)
    -- MI : ��/ SS : ��
SELECT TO_CHAR(HIREDATE, 'YYMMDD DY AM HH12:MI:SS') FROM EMP;    -- 00��00��00���� ������ ���� HIREDATE�Է½� �ð��� �Է����� �ʾҴٴ� ���� �� �� ����.
--(2)TO_CHAR(���ڵ�����, '�������')
        -- 0 : �ڸ���, 0�� ������ ������ �ڸ�����ŭ �ݵ�� ���(���ڰ� ������ ��� 0�� ��µ�) 
        -- 9 : �ڸ���, 
        -- , : ���ڸ� ���� ,�� ����
        -- . : �Ҽ���
        -- L : ������ȭ����
        -- $ : ��ȭ���� $�� �տ� ���� �� ����.
SELECT TO_CHAR(12345678, '999,999,999') FROM DUAL;
SELECT TO_CHAR(12345678, '000,000,000') FROM DUAL;
SELECT TO_CHAR(1000, 'L9,999') FROM DUAL;
SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999') FROM EMP;
--(3) TO_DATE(����, '����')
SELECT TO_DATE('20210603', 'YY/MM/DD/') FROM EMP;
    SELECT * FROM EMP WHERE HIREDATE BETWEEN '81/05/01' AND '83/05/01';
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('810501', 'RRMMDD') AND TO_DATE('830501', 'RRMMDD');
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/05/01', 'RR/MM/DD') AND TO_DATE('83/05/01', 'RR/MM/DD'); 
        -- �ý��� ������ MM/DD/YY������(���� �������� �𸣴� ���) 81/05/01�� 83/05/01�� �ϰ������� ����� �� �ֵ��� TO_DATE�� ����� ������ ����

--TO_NUMBER(����, ����)
SELECT '3456.78'+1 FROM DUAL;
SELECT '3,456,78'+1 FROM DUAL;
SELECT TO_NUMBER('3,456.78', '9,999.99') + 1 FROM DUAL; -- 182����ó�� ������ �����ִµ� TO_NUM()�� ����� ��� ����ȯ�� ��������.

-- 5. NVL(�� �ϼ��� �ִ� ������, ���̸� ����� ��) -- �Ű����� 2���� Ÿ����ġ
-- �̸�, ����� ���(MGR)�� ���, ���ӻ�簡 ���� ��� 'CEO'�� ���
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MANAGER_NUM FROM EMP;

-- 6. ETC
-- (1) EXTRACT : ������ ���� �����ϰ� ���� ��
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') FROM DUAL;
    --81�⵵�� �Ի��� ����
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YY') = '81';
    SELECT * FROM EMP WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
    SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('1981/01/01', 'YYYY-MM-DD') AND TO_DATE('1981/12/31', 'YYYY-MM-DD');
-- (2) ������ ��� : LEVEL, START WITH ����, CONNECT BY PRIOR ����
SELECT LEVER, ENAME FROM EMP START WITH MGR IS NULL CONNECT BY PRIOR EMPNO = MGR;
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME FROM EMP START WITH MGR IS NULL CONNECT BY PRIOR EMPNO=MGR;

-- �� ��������
-- <�� ��������>

-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') "CURRENT DATE" FROM DUAL;
-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 AS "New Salary", SAL*1.15-SAL AS "Increase" FROM EMP;
--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
-- SELECT ENAME, HIREDATE, ROUND(ADD_MONTHS(HIREDATE, 6),'DAY') FROM EMP;
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'��') FROM EMP;
--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "WORKING MONTHS", SAL, TO_CHAR(SAL*ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)), '9,999,999') AS "TOTAL SALARY" FROM EMP; --- �� �ڸ����� ,�� ǥ���Ϸ���?
--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL,15, '*') FROM EMP;
--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DY') FROM EMP;
--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>=6;
--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;
-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME, 2, 3) FROM EMP;
--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE, 'MM') = '12';
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE) =12;
--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL, 11, '*') FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$9,999') FROM EMP WHERE DEPTNO=20;

--[��] �׷��Լ� : SUM, AVG, MIN, MAX, COUNT, STDDEV, VARIANCE

SELECT ENAME, ROUND(SAL, -3) FROM EMP;  -- ������ �Լ�
SELECT MAX(SAL) FROM EMP;    -- �׷��Լ�
SELECT ENAME, MAX(SAL) FROM EMP;    -- �׷��Լ��� ������ �Լ��� ���ÿ� �۵��� �� ����. -> ���� ������������ �ذ�!
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;   -- GROUP BY�� ����ϴ� ��� �������Լ��� �׷��Լ��� ���ÿ� �۵�...
-- 1. �׷��Լ��� �ǽ�
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(*) FROM EMP;   -- EMP ���̺� ���� ����
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT COUNT(COMM), SUM(COMM), AVG(COMM), SUM(COMM)/COUNT(COMM) FROM EMP;
    -- ��� �׷��Լ��� NULL���� ����
-- SAL�� ���, ��, �ּҰ�, �ִ밪, �л�, ǥ������, ����
SELECT  ROUND(AVG(SAL),2), SUM(SAL), MIN(SAL), MAX(SAL), ROUND(VARIANCE(SAL),2), ROUND(STDDEV(SAL),2),COUNT(SAL) FROM EMP;
SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL) FROM EMP;

-- �׷��Լ� MAX, MIN, COUNT�� ������, ������, ��¥�� ��� ��밡��
    -- ���� �ֱٿ� �Ի��� ����� �Ի��ϰ� �Ի����� ���� ������ ����� �Ի���
    SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;   -- ���ʷ� �Ի��� ����� ������ ��ȯ��Ű���� SUBQUERY�� �������. :)
    -- �ֱ��Ի����� 83/01/12 : x,xxx�� �ٹ�, �����Ի����� 80/12/17 : xx,xxx�� �ٹ�
    SELECT '�ֱ��Ի����� ' || TO_CHAR(MAX(HIREDATE), 'YY/MM/DD')||' : '|| TO_CHAR(MIN(TRUNC(SYSDATE-HIREDATE)),'99,999') || '�� �ٹ�, �����Ի����� '|| TO_CHAR(MIN(HIREDATE),'YY/MM/DD') || ' : ' || TO_CHAR(TRUNC(MAX(SYSDATE-HIREDATE)),'99,999')||'�� �ٹ�' FROM EMP;
    -- 10�� �μ� �Ҽ��� ��� �޿����
    SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10;
-- 2. GROUP BY ��
-- �μ���ȣ�� �ִ�޿�
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;   --WHERE DEPTNO�� 10, 20, 30 �� �� ������ �ʿ䰡 ������.
-- �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�(�Ҽ��� 2�ڸ�)
SELECT COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2) 
    FROM EMP 
    GROUP BY DEPTNO 
    ORDER BY DEPTNO;
-- SAL�� 5000�̸��� ����� ���ؼ��� �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2) 
    FROM EMP WHERE SAL < 5000 
    GROUP BY DEPTNO 
    ORDER BY DEPTNO;
-- �μ��� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), AVG(SAL)    -- GROUP BY�� SELECT���� �ִ� �׸����� �ǽ��϶�� D.DEPTNO�δ� ������ �߻�...!
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME;
    
-- 3. HAVING��
-- �μ���ȣ�� ��� �޿��� 2000�̻��� �μ��� ���
SELECT DEPTNO, AVG(SAL) FROM EMP
    WHERE AVG(SAL) >= 2000      -- ������ ������ 2000�̻��� ������� ������� DEPTNO�� �׷�ȭ�ϴ� �����.
    GROUP BY DEPTNO;
SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000
    ORDER BY AVG_SAL DESC;   -- �ʵ��� ��Ī�� ORDER BY�������� ��밡��. Having�������� ��Ī�� �� �� ����.
    
-- 4. ������� ���� ���谪 ����
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);
SELECT DEPTNO, JOB, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO, JOB);

------------------------------------------------------------------------------------6�� 4��

SELECT * FROM EMP;
-- 1. ��� ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ���
SELECT COUNT(*), MAX(SAL), MIN(SAL), SUM(SAL) FROM EMP;
-- 2. ������̺��� ������ �ο����� ���Ͽ� ���
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;
-- 3. ������̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ���
SELECT MAX(SAL)-MIN(SAL) FROM EMP;
-- 4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ����ϵ� �޿��� ���� ���� ������ ���
SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL) DESC;
SELECT DNAME, COUNT(*), ROUND(AVG(SAL),2), MIN(SAL), MAX(SAL), SUM(SAL) FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME ORDER BY SUM(SAL) DESC;
-- 5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�(��°���� �μ���ȣ, ���������� �������� ����)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO,JOB;
SELECT DNAME, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME, JOB;
-- 6. ������, �μ��� �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�.(��°���� ������, �μ���ȣ �� �������� ����)
SELECT DEPTNO, JOB, COUNT(*), AVG(SAL), SUM(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY JOB, DEPTNO ASC;
-- 7. ������� 5���̻� �Ѵ� �μ���ȣ�� ����� ���
SELECT DEPTNO, COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*) >=5;
-- 8. ������� 5���̻� �Ѵ� �μ���� ������� ���
SELECT DNAME, COUNT(*) FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO GROUP BY DNAME HAVING COUNT(*) >= 5 ;
-- 9. ��� ���̺��� ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���Ͽ� ���
SELECT JOB, AVG(SAL), SUM(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) >=3000;
-- 10. ������̺��� ��ü �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿��հ踦 ����϶� ��, �޿� �հ�� �������� ����
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB HAVING SUM(SAL) >= 5000 ORDER BY SUM(SAL) DESC;
-- 11. �μ��� �޿����, �μ��� �޿��հ�, �μ��� �ּұ޿��� ���
SELECT DEPTNO, ROUND(AVG(SAL),2), SUM(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO;
-- 12. ����	11������ ����, �μ��� �޿���յ� �ִ�ġ, �μ��� �޿��յ��� �ִ�ġ, �μ��� �ּұ޿����� �ִ�ġ�� ����϶�  
-- SELECT MAX(AVG(SAL),SUM(SAL),MIN(SAL)) FROM EMP GROUP BY E.DEPTNO;
SELECT MAX(AVG(SAL)), MAX(SUM(SAL)),MAX(MIN(SAL)) FROM EMP GROUP BY DEPTNO;
-- 13. ��� ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.  -------------------------------------------------------------------------------------------------
SELECT TO_CHAR(HIREDATE, 'YY'), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE, 'YY');
SELECT EXTRACT(YEAR FROM HIREDATE), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY EXTRACT(YEAR FROM HIREDATE);
SELECT SUBSTR(HIREDATE, 1, 2), COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY SUBSTR(HIREDATE, 1, 2);
-- 14. ��� ���̺��� �Ʒ��� ����� ����ϴ� SELECT �� �ۼ�    -------------------------------------------------------------------------------------------------------
SELECT NVL(TO_CHAR(HIREDATE, 'YY'),'TOTAL'), COUNT(*) FROM EMP GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YY'));
SELECT EXTRACT(YEAR FROM HIREDATE), COUNT(*) FROM EMP GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE));
-- 15. ������̺��� �ִ�޿�, �ּұ޿�, ��ü�޿���, ����� ���Ͻÿ�
SELECT MAX(SAL), MIN(SAL), SUM(SAL), AVG(SAL) FROM EMP;
-- 16. ������̺��� �μ��� �ο����� ���Ͻÿ�
SELECT COUNT(*) FROM EMP GROUP BY DEPTNO;
-- 17. ��� ���̺��� �μ��� �ο����� 6���̻��� �μ��ڵ带 ���Ͻÿ�
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>=6;
-- 18. ������̺��� �޿��� ���� ������� ����� �ο��Ͽ� ������ ���� ����� ������ �Ͻÿ�. (��Ʈ self join, outer join, group by, count���)   -------------------------------
SELECT ENAME, RANK() OVER(ORDER BY SAL DESC) AS "RANK" FROM EMP;
SELECT ENAME, DENSE_RANK() OVER(ORDER BY SAL DESC) AS "DENSE_RANK" FROM EMP;
SELECT ENAME, ROW_NUMBER() OVER(ORDER BY SAL DESC) AS "ROW_NUM" FROM EMP;
SELECT E1.ENAME, E1.SAL, E2.ENAME, E2.SAL FROM EMP E1, EMP E2 WHERE E1.ENAME='SCOTT' AND E1.SAL<E2.SAL(+);
SELECT COUNT(E1.ENAME) FROM EMP E1, EMP E2 WHERE E1.SAL<E2.SAL(+);  -- 1�ܰ� : SELF JOIN
SELECT E1.ENAME, COUNT(E2.ENAME)+1 AS "RANK" FROM EMP E1, EMP E2 WHERE E1.SAL < E2.SAL(+) GROUP BY E1.ENAME ORDER BY RANK;  -- 2�ܰ� : GROUP BY, COUNT