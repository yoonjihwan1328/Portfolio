-- [111] JOIN : ���̺� 2�� �̻��� �����Ͽ� �˻�
SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM DEPT;
SELECT * FROM EMP;
-- CROSS JOIN (FROM���� ���̺� 2�� �̻�)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT';  -- 4�� : EMP���̺��� 1�� * DEPT�� 4��
SELECT * FROM EMP, DEPT; -- 4�� : EMP���̺��� 14�� * DEPT�� 4�� = 56��;
SELECT * FROM EMP, DEPT WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DERPTNO;

--�� EQUI JOIN (���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * 
    FROM EMP, DEPT
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME, LOC 
    FROM EMP, DEPT  -- EMP.DEPTNO�� ��� ���̺��� Ư�� �ʵ带 ȣ���ؾ����� �и��� �������.
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
    -- ���̺� ��Ī�� ������ �� ��Ī���θ�(����Ī �̿�Ұ�) ���̺��� ������ �� �� �ִ�.  
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D    -- ���̺� ��Ī�� ����. AS Ȥ�� ""�� ����ؼ��� �ȵ�.
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    
    --�޿��� 2000�̻��� ������ �̸�, ����(JOB), �޿�, �μ���, �ٹ����� ����Ͻÿ�
SELECT ENAME, JOB, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND SAL > 2000;

    --LOC�� CHICAGO�� ����� �̸�, ����, �޿��� ���
SELECT ENAME, JOB, SAL FROM EMP, DEPT WHERE LOC = 'CHICAGO';
    --LOC�� CHICAGO�� ����� �̸�, ����, �޿�, �μ���, �ٹ����� ���
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
SELECT ENAME, JOB, SAL, DNAME, LOC FROM EMP E, DEPT D WHERE LOC = 'CHICAGO'; -- ���� ���̰� ��� �Ǵ°���?

    -- �μ���ȣ�� 10�̰ų� 20���� ����� �̸�(ENAME), ����(JOB), �ٹ���(LOC), �޿���
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO AND E.DEPTNO IN (10, 20)
    ORDER BY SAL;
    
    -- JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����((SAL+COMM)*12), �μ���, �ٹ���// ������ ū ������ ����
DESCRIBE EMP;
DESCRIBE DEPT;
SELECT * FROM EMP;
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 "����", DNAME, LOC 
FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO AND JOB IN ('SALESMAN', 'MANAGER') ORDER BY ���� DESC;
    -- COMM�� NULL�̰� �޿��� 1200 �̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ��� // �μ���, �޿� ū ������ ����
SELECT ENAME, SAL, HIREDATE, DEPT.DEPTNO, DNAME
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL>=1200 AND COMM IS NULL ORDER BY DNAME, SAL DESC;

    -- 'NEW YORK'���� �ٹ��ϴ� ����� �̸��� �޿� ���
SELECT ENAME, SAL 
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC = 'NEW YORK';
    -- 'ACCOUNTING'�μ� �Ҽ��� ��� �̸��� �Ի��� ���
SELECT ENAME, HIREDATE 
FROM EMP, DEPT 
WHERE EMP.DEPTNO=DEPT.DEPTNO AND DNAME = 'ACCOUNTING';
    -- ������ MANAGER�� ����� �̸�, �μ��� ���
SELECT ENAME, DNAME
FROM EMP, DEPT 
WHERE JOB = 'MANAGER' AND EMP.DEPTNO=DEPT.DEPTNO;    
    -- COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �μ���ȣ, �ٹ��� ���
SELECT ENAME, SAL, DEPT.DEPTNO, LOC 
FROM EMP, DEPT 
WHERE COMM IS NOT NULL AND EMP.DEPTNO=DEPT.DEPTNO;

-- �� NON-EQUI JOIN
-- � �׸��� ��ġ���θ� Ȯ���ϴ� ���� �ƴϱ� ����.
SELECT * FROM SALGRADE;
SELECT * FROM EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND ENAME = 'SCOTT';  -- CROSS
    -- ��� ����� ���, �̸�, JOB, �����, �޿�, �޿����(1���, 2���)
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE FROM EMP, SALGRADE WHERE GRADE = 1 OR GRADE = 2; 
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
    -- COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �޿����, �μ���ȣ, �μ��̸�, �ٹ���
SELECT ENAME, SAL, GRADE, DEPT.DEPTNO, DNAME, LOC FROM EMP, DEPT WHERE (DEPT.DEPTNO=EMP.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL) AND (COMM IS NOT NULL);

    -- �̸�, �޿�, �Ի���, �޿����
    -- �̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
    -- �̸�, �޿�, �޿����, ����(�μ��� ����, �μ��� ������ ������, ���� = (SAL+COMM)*12)
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 AS "����" 
FROM SALGRADE, EMP, DEPT 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO 
ORDER BY DNAME, ���� DESC;
    -- �̸�, ����(JOB), �޿�, �޿����, �μ���ȣ, �μ���(�޿��� 1000~3000����, �μ��̸�, ����, �޿� ū ���� ����)
SELECT ENAME, JOB, SAL, GRADE, DEPT.DEPTNO, DNAME 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND (SAL BETWEEN 1000 AND 3000) 
ORDER BY DNAME, JOB, SAL DESC;
    -- �̸�, �޿�, ���, �Ի���, �ٹ���(81�⿡ �Ի��� �����, ��� ū �� ����)
SELECT ENAME, SAL, GRADE, HIREDATE, LOC 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND HIREDATE LIKE '81/%' -- �ý����� �⵵�� �������� 2�ڸ������� ǥ���ϴ� �����̾����.
ORDER BY GRADE DESC;
SELECT ENAME, SAL, GRADE, HIREDATE, LOC 
FROM DEPT, EMP, SALGRADE 
WHERE (SAL BETWEEN LOSAL AND HISAL) AND DEPT.DEPTNO = EMP.DEPTNO AND TO_CHAR(HIREDATE,'RR')= '81'
ORDER BY GRADE DESC; 
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

-- �� SELF JOIN
    -- SMITH�� ���, �̸�, �Ŵ�����ȣ, �Ŵ����̸��� ����Ͻÿ�^^
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME = 'SMITH';
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO = 7902;

SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.MGR , MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.ENAME = 'SMITH' AND WORKER.MGR= MANAGER.EMPNO;
    -- ��� ����� ���, �̸�, ����� ���, ����� �̸�
SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.MGR, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.EMPNO = MANAGER.MGR;
    --'SMITH�� ���� FORD��' �������� ���
SELECT WORKER.ENAME || '�� ����' || MANAGER.ENAME ||'��'
    FROM EMP WORKER, EMP MANAGER 
    WHERE WORKER.MGR = MANAGER.EMPNO AND WORKER.ENAME = 'SMITH';
    -- ����� �̸��� 'KING'�� ������� �̸��� JOB�� ���
SELECT * FROM EMP;
SELECT WORKER.ENAME, WORKER.JOB
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO AND MANAGER.ENAME = 'KING'; 
    
    -- SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ����ϼ���
SELECT E2.ENAME
    FROM EMP E1, EMP E2
    WHERE E1.ENAME='SCOTT' AND E1.DEPTNO = E2.DEPTNO AND E2.ENAME!='SCOTT'; -- '���� �μ���ȣ'�� �ٹ��ڸ� ����ϰ� �����Ƿ� ���̺��� ���� ���ǵ� ���Ϻμ���ȣ�� ������(?)
    
    
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP VALUES (9999, 'ȫ', NULL, NULL, NULL, 9000, NULL, 50);
    -- (���̵� ߾)SCOTT�� ������ �ٹ������� �ٹ��ϴ� ������� �̸��� ����ϼ���
SELECT E2.ENAME
    FROM EMP E1, DEPT D1, EMP E2, DEPT D2
    WHERE E1.ENAME = 'SCOTT' AND
        E1.DEPTNO = D1.DEPTNO AND E2.DEPTNO = D2.DEPTNO AND
        D1.LOC = D2.LOC;
    
    ROLLBACK;   -- �����͸� �Է�, �߰�, ����, ����(DML)�� ���
SELECT * FROM DEPT;
SELECT * FROM EMP;

-- OUTER JOIN : ���ν� ���ǿ� �������� �ʴ� ����� ǥ��
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    --"SMITH�� �Ŵ����� FORD�Դϴ�." �������� ���
    --"KING�� �Ŵ����� ���Դϴ�."
SELECT W.ENAME || '�� �Ŵ����� ' || NVL(M.ENAME,'��') || '�Դϴ�.'
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    -- �ڡڡ� ���ܻ���� �̸�         
            --- (+)�� �ݴ��� ������ �ڽ��� �����ϴ� �Ŵ����� ���� �ӿ��鵵 ����, (+)�� ���� �ֱ� ������ ���ܻ���� �з��Ǿ� ��ȯ��.
            --- ���� ���� �ʵ忡 ��ģ NULL�ڷᰡ �߻��ϴ� ������ ���� ������...��
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- 1�ܰ�
SELECT M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; -- �ϼ� 2�ܰ�
    
-- �� ��������
SELECT* FROM EMP;
SELECT* FROM DEPT;
SELECT* FROM SALGRADE;
--���� PART1
--1. EMP���̺��� ��� ����� ���� ������ ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME EMPLOYEE, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO(+);
--2. ��簡 �ִ� ������ ���� �����, �޿�, ��å, ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, WORKER.JOB, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO;
--3. ��簡 ���� ������ ��簡 �ִ� ������ ��ο� ���� �����, �޿�, ��å, ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME, WORKER.SAL, WORKER.JOB, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR=BOSS.EMPNO(+);
--4. ��簡 �ִ� ������ ���� �����, �����, �޿�, �μ���, ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, DNAME, BOSS.ENAME AS MANAGER
    FROM EMP WORKER, DEPT, EMP BOSS
    WHERE DEPT.DEPTNO=WORKER.DEPTNO AND WORKER.MGR=BOSS.EMPNO;
--5. ��簡 ���� ������ ��簡 �ִ� ���� ��ο� ���� �����, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ����� ����Ͻÿ�. 
-- ��, ���ӻ�簡 ���� ��� ���ӻ����� ������������ ��� ����Ͻÿ�.
SELECT WORKER.ENAME EMPLOYEE, WORKER.SAL, WORKER.DEPTNO, DNAME, LOC, NVL(BOSS.ENAME, '����') AS MANAGER
    FROM EMP WORKER, DEPT, EMP BOSS
    WHERE DEPT.DEPTNO=WORKER.DEPTNO AND WORKER.MGR=BOSS.EMPNO(+);
--6. �޿��� 2000�̻��� ����� ���� �����, �޿�, �޿����, �μ���, ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE (WORKER.MGR=BOSS.EMPNO(+)) AND (WORKER.DEPTNO=DEPT.DEPTNO) AND (WORKER.SAL BETWEEN LOSAL AND HISAL) AND (WORKER.SAL >= 2000);
--7. ��簡 �ִ� ������ ��簡 ���� ���� ��ο� ���� �����, �޿�, �޿����, �μ���, ���ӻ��� �� �μ��� ���ĺ� ������ �����Ͽ� ����Ͻÿ�.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, BOSS.ENAME MANAGER
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE (WORKER.MGR=BOSS.EMPNO(+)) AND (WORKER.DEPTNO=DEPT.DEPTNO) AND (WORKER.SAL BETWEEN LOSAL AND HISAL) 
    ORDER BY DNAME;
--8.  �����, �޿�, �޿����, �μ���, ����, ���ӻ����� ����Ͻÿ�. �� ������ (SAL+COMM)*12�� ����Ѵ�.  -----------------------------
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, (WORKER.SAL+NVL(WORKER.COMM,0))*12 AS ANNUAL_SAL, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE WORKER.MGR=BOSS.EMPNO AND DEPT.DEPTNO=WORKER.DEPTNO AND (WORKER.SAL BETWEEN LOSAL AND HISAL);
--9. �� 8���� �μ��� ���ĺ� ������ �����ϰ� �μ����� ������ �޿��� ū ������� ���� ��� ������ �����Ͽ� ����Ͻÿ�.
SELECT WORKER.ENAME, WORKER.SAL, GRADE, DNAME, (WORKER.SAL+NVL(WORKER.COMM,0))*12 AS ANNUAL_SAL, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS, DEPT, SALGRADE
    WHERE WORKER.MGR=BOSS.EMPNO AND DEPT.DEPTNO=WORKER.DEPTNO AND (WORKER.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY DNAME, SAL DESC;

--����PART2
SELECT* FROM EMP;
SELECT* FROM DEPT;
SELECT* FROM SALGRADE;
-- 1. EMP���̺��� ��� ����� ���� �����, �μ���ȣ �μ����� ����Ͻÿ�.
SELECT ENAME, DEPTNO
    FROM EMP;
--2. EMP���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���� �����, ��å, �޿�, �μ����� ����Ͻÿ�.
SELECT ENAME, JOB, SAL, DNAME
    FROM EMP,DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND LOC = 'NEW YORK';
--3. EMP���̺��� ��(COMM)�� �޴� ����� ���� �����, �μ���, ��ġ�� ����Ͻÿ�.
SELECT ENAME, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND COMM>0;
--4. EMP���̺��� ����� ���ĺ� L�� �ִ� ����� ���� �����, ��å, �μ���, �ٹ����� ����Ͻÿ�.
SELECT ENAME, JOB, DNAME, LOC
    FROM DEPT, EMP
    WHERE EMP.DEPTNO = DEPT.DEPTNO AND ENAME LIKE '%L%'; 
--5. EMP���̺��� ���, �����, �μ���ȣ, �μ����� ����ϵ� ����� ���ĺ� ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, DEPT.DEPTNO, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
    ORDER BY ENAME;
--6. �޿��� 2000�̻��� ����� ���� ���, �����, �޿�, �μ����� �޿��������� �������� �����Ͽ� ����Ͻÿ�.
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND SAL <=2000
    ORDER BY SAL DESC;
--7. ��å�� MANAGER�̸� �޿��� 2500�̻��� ����� ���� ���, �����, ��å, �޿�, �μ����� ��� �������� �������� �����Ͽ� ����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP, DEPT
    WHERE EMP.DEPTNO=DEPT.DEPTNO AND JOB = 'MANAGER' AND SAL >= 2500
    ORDER BY EMPNO;
--8. ���, �����, ��å, �޿�, �޿������ �޿��������� �������� �����Ͽ� ����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
--9. ��簡 ���� ������ ��簡 �ִ� ���� ��ο� ����, �����, ���ӻ����� ����Ͻÿ�.
SELECT WORKER.ENAME, BOSS.ENAME
    FROM EMP WORKER, EMP BOSS
    WHERE WORKER.MGR = BOSS.EMPNO(+); 
--10.��簡 ���� ������ ��簡 �ִ� ���� ��ο� ����, �����, ����, ����� ������ ����Ͻÿ�.
SELECT WORKER.ENAME, BOSS.ENAME AS MANAGER, HEADCOACH.ENAME AS HEADCOACH
    FROM EMP WORKER, EMP BOSS, EMP HEADCOACH
    WHERE WORKER.MGR = BOSS.EMPNO AND BOSS.MGR = HEADCOACH.EMPNO;
--11.���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT WORKER.ENAME, BOSS.ENAME AS MANAGER, HEADCOACH.ENAME AS HEADCOACH
    FROM EMP WORKER, EMP BOSS, EMP HEADCOACH
    WHERE WORKER.MGR = BOSS.EMPNO(+) AND BOSS.MGR = HEADCOACH.EMPNO(+);