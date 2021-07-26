-- [��] SEQUENCE : ������ȣ ������, ��κ� �������� PRIMARY KEY �뵵�� ���
DROP SEQUENCE FRIEND_SEQ;
CREATE SEQUENCE FRIEND_SEQ
    START WITH 100
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 100
    NOCACHE    --��ǻ�� ���ٰ� �ѵ� ���������� �̾���. �Է��� ���� ��õ!
    NOCYCLE;
DROP TABLE FRIEND;
CREATE TABLE FRIEND(
    NUM NUMBER(4),  -- ������ �̿�
    NAME VARCHAR2(30) NOT NULL,
    TEL VARCHAR2(20) UNIQUE,
    ADDRESS VARCHAR2(100),
    LAST_MODIFIED DATE DEFAULT SYSDATE,
    PRIMARY KEY(NUM) );
    
INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
    VALUES(FRIEND_SEQ.NEXTVAL, 'KEYNES', NULL, '����� ������');
INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
    VALUES(FRIEND_SEQ.NEXTVAL, 'EINSTEIN', '010-1234-5678', '����� ��õ��');
SELECT * FROM FRIEND;
INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
    VALUES (FRIEND_SEQ.NEXTVAL, 'MARX', '010-1234-5678', '����� ���α�');
INSERT INTO FRIEND (NUM, NAME, TEL, ADDRESS)
    VALUES (FRIEND_SEQ.NEXTVAL, 'ALI', '010-4321-9876', '����� ������');
SELECT FRIEND_SEQ.CURRVAL FROM DUAL;    -- ���� ������ ��.
COMMIT;

CREATE SEQUENCE TEST_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;
SELECT TEST_SEQ.CURRVAL FROM DUAL;