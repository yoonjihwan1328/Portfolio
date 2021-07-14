-- [��] SUB QUERY : QUERY�ȿ� QUERY�� ����
-- 1. ���� ���� ����
-- �޿��� ���� ���� �޴� ����� �̸��� �޿�
SELECT MAX(SAL) FROM EMP;   -- �������� -> ���������� ���Ե�.
SELECT ENAME, SAL FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);  -- ��������(������ ����)
-- �������� ����(1) ������ ��������(�������� ����� ������) = > >= != < <=
-- SCOTT�� �ٹ��ϴ� �μ��̸� ���
SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';    -- EQUI JOIN
SELECT DEPTNO FROM EMP WHERE EMANE='SCOTT';
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME= 'SCOTT');
--�������� ����(2) �����༭������(������������� 2���̻�)  - IN, ANY, ALL, EXISTS
    -- JOB�� MANAGER�� ����� �μ��̸�
    SELECT DNAME 
        FROM DEPT 
        WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');   -- ���������κ��� (10, 20, 30)���� �ٲ�� ������ �۵����� ����.
    SELECT DNAME 
        FROM DEPT 
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');   -- ���������� �ذ�!!!! 
-- 2. ������ ��������
-- SCOTT�� ���� �μ���ȣ�� ����� �̸��� �޿�
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT') AND ENAME<> 'SCOTT';
    SELECT E2.ENAME, E2.SAL 
        FROM EMP E1, EMP E2 
        WHERE E1.DEPTNO=E2.DEPTNO AND E1.ENAME = 'SCOTT' AND E2.ENAME != 'SCOTT';
-- SCOTT�� ���� �ٹ����� �ִ� ����� �̸��� �޿�
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
    SELECT ENAME, SAL 
        FROM EMP, DEPT 
        WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = (SELECT LOC FROM DEPT, EMP WHERE DEPT.DEPTNO=EMP.DEPTNO AND ENAME='SCOTT') AND ENAME != 'SCOTT';
    SELECT E2.ENAME, E2.SAL 
        FROM EMP E1, EMP E2, DEPT D1 
        WHERE E1.DEPTNO=D1.DEPTNO, E1.DEPTNO=E2.DEPTNO;           ------------------------------------------------;;;;;
    ROLLBACK;
-- SCOTT�� ���� �μ��� �ٹ��ϴ� ������� �޿���
    SELECT SUM(SAL) 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
-- SCOTT�� ������ ��å(JOB)�� ���� ����� ��� �ʵ�
    SELECT * 
        FROM EMP 
        WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');
-- DALLAS���� �ٹ��ϴ� ����� �̸�, �μ���ȣ----------------------------------------------------------------------
    SELECT ENAME, DEPTNO
        FROM EMP
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
    SELECT * FROM DEPT;
-- SALES(DNAME) �μ��� �ٹ��ϴ� ����� �̸�, �޿�
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
-- 'KING'�� ���ӻ���� ����� �̸��� �޿�
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
-- EX1) ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿��� ���
    SELECT ENAME, SAL 
        FROM EMP 
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
-- EX2) ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿� �׸��� ��ձ޿��� ��� ��
    SELECT ENAME, SAL, (SELECT ROUND(AVG(SAL)) FROM EMP) 
        FROM EMP 
        WHERE SAL <= (SELECT AVG(SAL) FROM EMP);
    --    SELECT E2.ENANE, E2.SAL FROM EMP E1, EMP E2 WHERE E1.DEPTNO=E2.DEPTNO AND E2.SAL <= (SELECT AVG(E1.SAL) FROM E1);
-- EX3) ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿� �׸��� ��հ��� ���̸� ���
    SELECT ENAME, SAL, ROUND(ABS((SELECT AVG(SAL) FROM EMP)-SAL)) DIFF FROM EMP WHERE SAL<= (SELECT AVG(SAL) FROM EMP);
-- SCOTT�� JOB�� �μ���ȣ�� ���� ������ ��� �ʵ� ���
SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- ���߿� ��������
SELECT * FROM EMP WHERE(JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';

-- �� �� ��������
SELECT * FROM EMP;
SELECT * FROM SALGRADE;
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE 
    FROM EMP 
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP); 
--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME 
    FROM EMP, DEPT 
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL <= (SELECT AVG(SAL) FROM EMP);
--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE 
    WHERE (SAL BETWEEN LOSAL AND HISAL) AND HIREDATE <= (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME ^= 'SCOTT';
--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� �޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME 
    FROM EMP E, SALGRADE, DEPT D
    WHERE (E.DEPTNO=D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL) AND HIREDATE<= (SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME ^= 'SCOTT' 
    ORDER BY SAL DESC;
--7. BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='BLAKE');
--8. MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի���
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');
--9. �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK�� ���� �μ���ȣ�̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL>=(SELECT SAL FROM EMP WHERE EMPNO = '7698') AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK'); 
--11.  �����ȭ. CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL >= (SELECT SAL FROM EMP WHERE EMPNO = '7698') AND DNAME = (SELECT DNAME FROM DEPT T, EMP P WHERE T.DEPTNO=P.DEPTNO AND ENAME = 'CLARK');
--12. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') AND ENAME <> 'BLAKE';
--13. ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸� �� �޿��� ���� ������ ���)
SELECT EMPNO, ENAME
    FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;

-- 3. ������ �������� : IN, ALL, ANY=SOME, EXISTS
    --(1) IN    ; �������� ��� �� �ϳ��� ��ġ�ϸ� ��
    -- �μ����� �Ի����� ���� ���� ����� �μ���ȣ, �̸�, �Ի���, �μ���ȣ
    SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO;  -- ������ ��������
    SELECT ENAME, HIREDATE, DEPTNO FROM EMP
        WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); -- ������!!! ���� �߿�!!!
    --�޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ������� ��� �ʵ�
    SELECT DEPTNO FROM EMP WHERE SAL >= 3000;
    SELECT * FROM EMP
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>3000);    -- �������� ����� �����ϴ� ������ ��� ��ȯ��(?)
    --(2)ALL    ; �������� ����� ��� �����ϸ� ��
    SELECT SAL FROM EMP WHERE DEPTNO = 30;
    -- 30���μ� �޿��� ��κ��� ū��� == 30���μ� �ִ� �޿����� ū ���
    SELECT * FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);  -- ������ ��������
        
    SELECT * FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30); -- ������ ��������
    
    --(3)ANY=SOME   ; ����������� �ϳ��� �����ϸ� ��
    -- 30�� �μ� �޿��� �ϳ����̶� ū ��� == 30�� �μ� �ּ� �޿����� ū ���
    SELECT * FROM EMP
        WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);   --  ������ ��������
        
    SELECT * FROM EMP
        WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- ������ ���������� ����ϴ� ��찡 �� ����.
    
    --(4)EXISTS ; �������� ����� �����ϸ� ��(���)
    SELECT EMPNO, ENAME, SAL
        FROM EMP MANAGER
        WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);  -- ��������
    SELECT DISTINCT M.EMPNO, M.ENAME, M.SAL
        FROM EMP W, EMP M
        WHERE W.MGR=M.EMPNO;    -- SELF JOIN, �� EXISTS �� ������ ���
    -- NOT EXISTS�� ���ܻ��.
    SELECT * FROM EMP MANAGER
        WHERE NOT EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);  -- ��������
    SELECT M.*
        FROM EMP W, EMP M
        WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;  -- SELF JOIN, �� EXISTS ���������� ������ ���. NULL�� �ڷ�� ���������� ������ �ǹ�!
        
    -- ex1. ����(job)�� MANAGER�� ����� ���� �μ��� �μ���ȣ�� ������
    SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';   -- ��������
    SELECT DEPTNO, LOC FROM DEPT
        WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');
    
    -- ex2. ������ 3000 �̻��� ����� �� ������޺� �ְ� ������ �޴� ������� ���, �̸�, ����, �Ի���, �޿�, �޿����(4, 5��� �ְ� sal ������)
    SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
        GROUP BY GRADE; -- ��������
        
    SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, GRADE
        FROM EMP, SALGRADE
        WHERE SAL BETWEEN LOSAL AND HISAL AND
            (GRADE, SAL) IN(SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
             WHERE SAL BETWEEN LOSAL AND HISAL AND SAL >=3000
             GROUP BY GRADE);
    
    -- ex3. �Ի�б⺰ �ְ� ������ �޴� ����� �б�, ���, �̸�, job, �����, �Ի�, �޿�, ��(?)
    SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE, 'MM')/3) FROM EMP;  -- �б� ���ϴ� ��
    SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) "QUARTER", MAX(SAL) 
        FROM EMP
        GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3);      -- ��������
    SELECT CEIL(TO_CHAR(HIREDATE, 'MM')/3) AS "QUARTER", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM 
        FROM EMP 
        WHERE(CEIL(TO_CHAR(HIREDATE, 'MM')/3), SAL) 
        IN (SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3), MAX(SAL) FROM EMP
        GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3));
        
    -- ex4. JOB�� SALESMAN�� ����� ��κ��� �޿��� ���� �޴� ����� �̸�, �޿�(ALL / ������)
    SELECT ENAME, SAL FROM EMP
        WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    SELECT ENAME, SAL FROM EMP
        WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');
    
    -- ex5. �޿��� 3000 �̸��� ��� �� �ֱ� �Ի��� ����� ���, �̸�, ����, �Ի���
    SELECT EMPNO, ENAME, (SAL*12+NVL(COMM,0)) AS "ANNUAL_SAL", HIREDATE 
    FROM EMP 
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP) AND SAL < 3000;
    
-- ���⼭���ʹ� �����༭�������� �����༭������, ������ �����༭������
-- 14.  �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ������ ��� ��ȣ,�̸�,�޿�(�� ��� �� ���)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')
    ORDER BY EMPNO;
-- 15. �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿�
SELECT ENAME, JOB, SAL
    FROM EMP, DEPT
    WHERE DEPT.DEPTNO = EMP.DEPTNO AND INITCAP(LOC) = 'Dallas';
SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE DEPTNO = ANY(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');
-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿�
SELECT ENAME, SAL
    FROM EMP
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE INITCAP(ENAME) ='King');

SELECT E.ENAME, E.SAL   -----------------------------------
    FROM EMP E, EMP M
    WHERE E.MGR(+)=M.EMPNO AND M.ENAME = 'KING';
-- 17. SALES�μ� ����� �̸�, ����   ------------------------------
SELECT ENAME, JOB
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND DNAME = 'SALES';
    
    
    
-- 18. ������ �μ� 30�� ���� ���޺��� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); 
    
    
    
-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ����   ---------------------------------------------------
SELECT ENAME, JOB
    FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE IN(DEPTNO = 10, 30));
    
-- 20.  FORD�� ������ ���޵� ���� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE (JOB, SAL) IN(SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD');
-- 21. �̸��� JONES�� ������ JOB�� ���ų� FORD�� SAL �̻��� �޴� ����� ������ �̸�, ����, �μ���ȣ, �޿�
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ���
SELECT 
SELECT JOB FROM EMP WHERE ENAME = 'JONES';
-- 22. SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿�

-- 23. CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,����
SELECT DISTINCT JOB FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = 'CHICAGO';
-- 24. �μ����� ������ ��� ���޺��� ���� ����� ���, �̸�, �޿�
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;   -- �μ��� ����� �ٸ��� �����......
SELECT EMPNO, ENAME, SAL
    FROM EMP E
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
        -- ���, �̸�, �޿�, �μ���ȣ, �ش�μ� ��ȣ�� ��ձ޿�
        SELECT EMPNO, ENAME, SAL, DEPTNO, (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)
            FROM EMP E
            WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);       -- �������� ����ߴ� ������ �� ���ͼ� �ٸ� ����� ����µ�...
-- 25. �������� ��� ���޺��� ���� ������ �޴� ����� �μ���ȣ, �̸�, �޿�
SELECT DEPTNO, ENAME, SAL FROM EMP WHERE SAL < (SELECT E.SAL FROM EMP E GROUP BY E.JOB) GROUP BY JOB;
SELECT SAL FROM EMP WHERE (SELECT JOB FROM EMP);
-- 26. ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����, �̸�, ���, �μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMP M
    WHERE EXISTS (SELECT * FROM EMP WHERE MGR=MEMPNO);  --EXISTS������ �̿�
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO IN (SELECT MGR FROM EMP);   -- IN������ �̿�
SELECT DISTINCT M.JOB, M.ENAME, M.EMPNO, M.DEPTNO
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;    -- SELF JOIN �̿�
-- 27.  ���� ����� ���, �̸�, ����, �μ���ȣ
    -- 26�� ������ �ݴ��̱� ������ NOT�� 
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMP M
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MGR=MEMPNO);
            -------------------------------------------------
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP);   -- (SELECT MGR FROM EMP)�� NULL�� ���ԵǹǷ� !=NULL�� ���� ������ �߻�
        --�� SQL�� �ݴ�
SELECT JOB, ENAME, EMPNO, DEPTNO
    FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP WHERE NOT MGR IS NULL);
            -------------------------------------------------
SELECT M.JOB, M.ENAME, M.EMPNO, M.DEPTNO
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
    
    
    
    
    
    
    
    
    
    
    
    