--[����] �ε��� : '��Ű�� �ƴ�' �ʵ� �߽����� ����(Ư�� ��ȸ)�� �����ϴ� ��� ��ȸ�ӵ� ���.
SELECT * FROM USER_INDEXES ;    -- 'SCOTT'������ ������ �ε��� ����
DROP TABLE EMP01;
CREATE TABLE EMP01
    AS
    SELECT * FROM EMP;  -- ��������...
INSERT INTO EMP01 SELECT * FROM EMP01;
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (1111, 'HONG', 40);
INSERT INTO EMP01 SELECT * FROM EMP01;
SELECT TO_CHAR(COUNT(*), '9,999,999') FROM EMP01;
-- �ε��� ���� �� ��ȸ�ӵ�
SELECT * FROM EMP01 WHERE ENAME = 'HONG';   -- 0.074��
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);   -- �ε��� ������ 17.29��
-- �ε��� ���� �� ��ȸ�ӵ�    -- 0.025��
SELECT * FROM EMP01 WHERE ENAME = 'HONG';
SELECT * FROM USER_INDEXES WHERE INDEX_NAME = 'IDX_EMP01_ENAME';
DROP INDEX IDX_EMP01_ENAME;
SELECT * FROM EMP01 WHERE ENAME = 'HONG';   -- 0.078��

select * from all;
