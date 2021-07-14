--[����] Ʈ����� ��ɾ� : COMMIT, ROLLBACK, SACEPOINT
-- ������ó���� ����, �������� DQL��ɹ����� ó���Ǵ� ������ �۾�����
-- �۾��� �����μ� Ʈ������� �������� �ϰ����� �����ϸ鼭 ���������� �����͸� �����ϵ��� ������.
COMMIT; -- ���ο� Ʈ����� ����(INSERT, UPDATE, DELETE�۾� �����߰��� ����)
DROP TABLE DEPT01;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
DESC DEPT01;
SELECT * FROM DEPT01;
DELETE FROM DEPT01 WHERE DEPTNO=40;
SELECT * FROM DEPT01;
ROLLBACK;
-- ���������� ������ ROLLBACK(Ȥ�� COMMIT) ��� ���ĺ��� ���ο� Ʈ������� ���۵�.
SELECT * FROM DEPT01;
DELETE FROM DEPT01 WHERE DEPTNO = 40;
COMMIT;
-- ���ο� Ʈ����� ����.
SELECT * FROM DEPT01;   -- ���� DEPTNO 10, 20, 30, 50�� ����
DELETE FROM DEPT01 WHERE DEPTNO = 30;
SELECT * FROM DEPT01;   -- ���� DEPTNO 10, 20, 50�� ����
SAVEPOINT C1;   -- C1���� : 10, 20, 50
DELETE FROM DEPT01 WHERE DEPTNO = 20;
SELECT * FROM DEPT01;   -- 10, 50�� �μ�
SAVEPOINT C2;
DELETE FROM DEPT01 WHERE DEPTNO = 10;
SELECT * FROM DEPT01;   -- 50�� �μ�
ROLLBACK TO C2; -- ROLLBACK�� �����ϸ� ���ο� Ʈ����� ���� �κ����� ���ư�.
