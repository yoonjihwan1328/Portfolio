--[��] VIEW, INLINE VIEW, TOP-N����
-- 1. VIEW : ������ ���̺� (1)�ܼ��� (2)���պ�
-- (1) �ܼ��� ; �ϳ��� ���̺�� ������ ��
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP;
SELECT * FROM USER_VIEWS;   -- DDL�� �����ϸ� ������ ��ųʸ��� �ڵ�����
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (9000, 'ȫ', 'MANAGER', 40);    -- VIEW�� �߰�
SELECT * FROM EMPv0;
SELECT * FROM EMP;  -- 'ȫ'�����Ͱ� ������ EMP���� ���Ե� BUT EMPv0�� �ش��� 4�ʵ常�� ���.
UPDATE EMPv0 SET JOB='ANALYST' WHERE EMPNO=9000;

    -- EMPv0�̶�� �� = EMP���̺��� 30�� �μ���
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO = 30;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1111, 'ȫ', NULL, NULL, NULL, NULL, NULL, 30);
SELECT * FROM EMPv0 WHERE EMPNO = 1111;
SELECT * FROM EMP WHERE EMPNO = 1111;
-- EMPv0�� 30�� �μ��� ������ �� �� �ִ� ��
INSERT INTO EMPv0 VALUES (1112, '��', NULL, NULL, NULL, NULL, NULL, 40);
SELECT * FROM EMP WHERE EMPNO < 2000;
SELECT * FROM EMPv0;    -- 40�� �μ� �Է��� �����ϳ� �������� ����.
DELETE FROM EMPv0 WHERE EMPNO < 2000;
SELECT * FROM EMP WHERE EMPNO < 2000;   -- ��� �Է��� 1111, 1112�� �����Ϸ� ������ 30�� �μ��� ����, 1112�� �����ȵ�(40�� �μ�)
-- VIEW�� ��������
-- �� WITH CHECK OPTION�� ������ ��� ���� ���ǿ� �ش��ϴ� �����͸� ����, ����, ���� ����
-- �� WITH READ ONLY ������ ��� �б����� ��
-- ���̺� NOT NULL�� ���� �÷��� ���ԵǾ�� ��.
CREATE OR REPLACE VIEW EMPv0
    AS SELECT ENAME, JOB FROM EMP; -- VIEW�� ������ �� NOT NULL�ʵ�(���⼭�� EMPNO�� �ݵ�� ������ ��! OTHERWISE �����߻�)
SELECT * FROM EMPv0;    -- ���� �ȳ��µ�?

-- WITH CHECK OPTION
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30
    WITH CHECK OPTION;      -- ���ǿ� �´� ��쿡�� ����, ����, ��������(�б�� �׻� ����)
INSERT INTO EMPv0 VALUES (1111, 'ȫ', NULL, NULL, NULL, NULL, NULL, 30);
SELECT * FROM EMPv0;
SELECT * FROM EMP;
INSERT INTO EMPv0 VALUES (1111, '��', NULL, NULL, NULL, NULL, NULL, 40); -- ����
DELETE FROM EMPv0 WHERE EMPNO=1111;

-- WITH READ ONLY
CREATE OR REPLACE VIEW EMPv1
    AS SELECT * FROM EMP WHERE DEPTNO = 20 WITH READ ONLY;  -- �б����� ��
SELECT E.*, DNAME FROM EMPv1 E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
INSERT INTO EMPv1 VALUES (11114, '��', NULL, NULL, NULL, NULL, NULL, 20); -- ������(�б����� ��!)
UPDATE EMPv1 SET SAL=9000 WHERE EMPNO =7902;    -- ������(�б����� ��!!)
-- (2) ���պ� ; 2�� �̻��� ���̺�� ������ ��. DML���� ���������θ� ���
CREATE OR REPLACE VIEW EMPv0
    AS SELECT EMPNO, ENAME, JOB, DNAME FROM DEPT D, EMP E WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1200, 'ȫ', 'MANAGER', 'RESEARCH');    -- ���պ�� ���źҰ�
-- Į���� ��Ī�� �̿��Ͽ� �並 ����
CREATE OR REPLACE VIEW EMPv1
    AS SELECT EMPNO NO, ENAME NAME, SAL*12 YEAR_SAL FROM EMP WHERE DEPTNO=10;
INSERT INTO EMPv1 VALUES (1000, 'ȫ', 12000);    -- ������ �ʵ尡 ���� ��� �Ұ�
-- ���������� �ʵ�� Ư�����ڰ� �ִ� ��� ��Ī�ο��� �ʼ���, �� ��Ī�� �ʵ忡�� �����ο�
CREATE OR REPLACE VIEW EMPv1 (EMPNO, ENAME, YEAR_SAL)
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP WHERE DEPTNO = 10;  -- �� ��Ī�� ���� �ο�
-- ���, �̸�, 10���ڸ����� �ݿø��� SAL�� �����.
CREATE OR REPLACE VIEW EMPv1
    AS SELECT EMPNO, ENAME, ROUND(SAL, -2) "SAL" FROM EMP;
CREATE OR REPLACE VIEW EMPv1(NO, ENAME, SAL)
    AS SELECT EMPNO, ENAME, ROUND(SAL, -2) FROM EMP;
    
    -- �μ���ȣ, �ּұ޿�, �ִ�޿�, �μ���ձ޿��� ������ DEPTv1 �並 ���� �ڡڡ�--------------------------------------------
CREATE OR REPLACE VIEW DEPTv1 (DEPTNO, MINSAL, MAXSAL, AVGSAL)
    AS SELECT DEPTNO, MIN(SAL), MAX(SAL), AVG(SAL) 
    FROM EMP 
    GROUP BY DEPTNO;
SELECT * FROM DEPTv1;
SELECT * FROM DEPT;
-- �μ���ȣ, �μ���, �ּұ޿�, �ִ�޿��� ������ DEPTv2 �並 ����
-- CREATE OR REPLACE VIEW DEPTv2 (DEPTNO, DNAME, MINSAL, MAXSAL)
--    AS SELECT D.DEPTNO, DNAME, MIN(SAL), MAX(SAL) 
--    FROM EMP E, DEPT D 
--    WHERE E.DEPTNO = D.DEPTNO; -- �� �ȵ���? �Ʒ�����ó�� ������ ���� �ȵǴµ�?
                               -- not a single-group function
                               -- where �� group by �� ������ �� �ִ����� ���ȳ�.
SELECT D.DEPTNO, DNAME, MINSAL, MAXSAL, AVGSAL
    FROM DEPTv1 DV, DEPT D
    WHERE DV.DEPTNO=D.DEPTNO;
--                                      SELECT EMP.DEPTNO, DNAME, MIN(SAL), MAX(SAL), AVG(SAL)    -- �տ����� MIN(SAL)�� ���� ���� ����Ϸ��� � ����� ����߾���?
--                                          FROM DEPT, EMP
--                                          WHERE DEPT.DEPTNO = EMP.DEPTNO;
--                                      SELECT MAX(SAL) MAXSAL , MIN(SAL) MINSAL , AVG(SAL) AVGSAL  -- ����! ������ ���� ����� �Ұ������°ǰ�?
--                                          FROM EMP;
CREATE OR REPLACE VIEW DEPTv2
    AS SELECT D.DEPTNO, DNAME, MINSAL, MAXSAL, AVGSAL
    FROM DEPTv1 DV, DEPT D
    WHERE DV.DEPTNO=D.DEPTNO;
-- DISTINCT Ű���带 �̿��� �� : �ߺ��� ���ŵ� JOB, DEPTNO
CREATE OR REPLACE VIEW EMPv0
    AS SELECT DISTINCT JOB, DEPTNO FROM EMP;
SELECT * FROM EMPV0;
INSERT INTO EMPv0 VALUES ('MANAGER', 10);   --DISTINCT�� �̿��� ��� �б�����

-- 2. INLINE VIEW ; FROM�� ���� ���������� INLINE VIEW��� �ϸ�, FROM ���� ���� ���������� VIEWó�� �ۿ�. �ڡڡ�------------------------------------------
-- ��ó�� �ۿ��Ѵٴ°� ���� ��?
-- �޿��� 2000�� �ʰ��ϴ� ����� ��ձ޿�
SELECT AVG(SAL) FROM EMP WHERE SAL>2000;
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);
-- �� �μ����� �μ���ձ޿����� ���� ����� �̸�, �޿�, �μ���ȣ
SELECT ENAME, SAL, DEPTNO 
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);   --------------------------------------- ��? ���������� �ܵ����� �۵����ϴµ� ��ü������ �۵��ϳ�?
                                        -- ������ where���� ���������ν� Ǯ���ϴ°� �� �����ϱ� ������ �Ʒ�ó�� FROM�� �����ϴ°� ���������⸸ �ϴ°� ������
    -- FROM���� �� ��������(�μ���ȣ, ��ձ޿�) : 1�ܰ�
    SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
    -- �̸�, �޿�, �μ���ȣ, �μ������ : 2�ܰ�
    SELECT ENAME, SAL, E.DEPTNO, AVGSAL                             -----------------FROM�� �ִ� ��Ҹ� SELECT���� ȣ�Ⱑ��(���⼭�� AVGSAL)
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE ENAME='SCOTT';
    SELECT ENAME, SAL, E.DEPTNO, S.DEPTNO, S.AVGSAL
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE E.DEPTNO=S.DEPTNO;
        --  SELECT �ʵ�1, �ʵ�2, ...
        --      FROM ���̺��1, (��������) ��Ī
        --      WHERE ��������
    -- �̸�, �޿�, �μ���ȣ(�μ��� ��պ��� ���� �����) : 3�ܰ�
    SELECT ENAME, SAL, E.DEPTNO                                     --------------------------------------- �� ��° ���.
        FROM EMP E, (SELECT DEPTNO, AVG(SAL) AS "AVGSAL" FROM EMP GROUP BY DEPTNO) S
        WHERE E.DEPTNO=S.DEPTNO AND SAL>AVGSAL;
        
-- TOP-N���� (eg1: 1~10�� ��ȸ, eg2: TOP 11~20�� ��ȸ, ...)�ڡڡڡڡ�------------------------------------------------------------
-- ROWNUM : ���̺�κ��� ������ ����
SELECT ROWNUM, ENAME FROM EMP WHERE DEPTNO = 20;
DELETE FROM EMP WHERE SAL IS NULL;
SELECT ROWNUM, ENAME, SAL FROM EMP ORDER BY SAL;    -- SAL�������� ���ĵƱ� ������ ROWNUM ������ ���׹���
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT * FROM EMP ORDER BY SAL);
-- SAL �������� 1~5��    -- TOP-N������ �ƴ�, ������ �Ʒ�.
SELECT ROWNUM, ENAME, SAL 
    FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)
    WHERE ROWNUM<6;
-- SELECT ROWNUM, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL) WHERE ROWNUM < 6; -- ������ ����ε� �� ����ó�� ����?----------------------------------
-- �Լ��� �̿��� RANK ���
SELECT RANK() OVER(ORDER BY SAL) RANK, 
    DENSE_RANK() OVER(ORDER BY SAL) D_RANK,
    ROW_NUMBER() OVER(ORDER BY SAL) N_RANK,
    ENAME, SAL FROM EMP;            -- TOP-N������ �Ұ���! (eg 1~5��...)
-- SAL �������� 6~10��
SELECT ROWNUM, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)
    WHERE ROWNUM>=6 AND ROWNUM<11;      -- ������ �ȵ�.
-- TOP-N
SELECT ENAME, SAL FROM EMP ORDER BY SAL; -- 1�ܰ�
SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL); -- 2�ܰ�
SELECT ROWNUM, RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL)); -- 3�ܰ�(TOP-N)
SELECT ROWNUM, RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL FROM (SELECT ENAME, SAL FROM EMP ORDER BY SAL))
    WHERE RN BETWEEN 6 AND 10;
    
-- �̸��� ���ĺ� ������� �����ؼ� 6~10����� ���(���, �̸�, ���, JOB, MGR, HIREDATE)

-- 1. �μ���� ������� ����ϴ� �뵵�� ��, DNAME_ENAME_VU �� �ۼ� �Ͻÿ�
-- 2. ������ ���ӻ������ ����ϴ� �뵵�� ��,WORKER_MANAGER_VU�� �ۼ��Ͻÿ�
-- 3. �μ��� �޿��հ� ����� ����Ͻÿ�(�μ���ȣ, �޿��հ�, ���) ? ģ������
-- 3-1. �μ��� �޿��հ� ����� 2~3���� �μ���ȣ, �޿��հ�, ����� ����Ͻÿ�.
-- 4. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ �� �� ������ �����Ͻÿ�
-- 5. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ �� �� 5���� ����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    ORDER BY HIREDATE DESC;
    
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC);
-- 6. ��� ���̺��� ���, �����, �Ի����� �ֽź��� ������ ������ 6��°�� ���� ������� 10��° ������� ���
