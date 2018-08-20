-- �� �����Ͻÿ�~!!!
-- http://www.gurubee.net/lecture/1013

--������̺�
CREATE TABLE MEM_GRADE
(G_NO   NUMBER(3) constraints gno_pk primary key --�������Ǽ���
,G_NAME VARCHAR2(20) NOT NULL
,G_IMG  VARCHAR2(200)
,G_GRANT VARCHAR2(1))
--[Ȯ��] Table created.

--ȸ�����̺�
CREATE TABLE MEM_LIST(
  M_NO     NUMBER(5) constraints mno_pk primary key, --�������Ǽ���
  M_ID     VARCHAR2(50) NOT NULL,
  M_PW    VARCHAR2(50) NOT NULL,
  M_NAME  VARCHAR2(10),
  M_GENDER VARCHAR(2),
  M_EMAIL VARCHAR2(50),
  M_PHONE VARCHAR2(11),
  G_NO NUMBER(3)) 
--[Ȯ��] Table created.

 
--FK���� �ο��ϱ�
ALTER TABLE MEM_LIST ADD CONSTRAINT MEM_LIST_fk_MEM_GRADE
     FOREIGN  KEY (G_NO) REFERENCES MEM_GRADE(G_NO);

--Ȯ���ϱ�
SELECT * FROM mem_list, mem_grade
 where MEM_LIST.G_NO = mem_grade.g_no;

SELECT * FROM book_it

EDIT book_it


-------------------------------------------------------------


SELECT * FROM mem_grade

--�����ڵ��
INSERT INTO mem_grade(G_NO,G_NAME,G_IMG,G_GRANT)
VALUES(300,'ADMIN',null,3);

--�ǹ��ڵ��
INSERT INTO mem_grade(G_NO,G_NAME,G_IMG,G_GRANT)
VALUES(200,'WORK',null,2);

--�Ϲ�ȸ�����
INSERT INTO mem_grade(G_NO,G_NAME,G_IMG,G_GRANT)
VALUES(100,'NORMAL',null,1);

SELECT
     G_NO
    ,G_NAME
    ,G_IMG
    ,G_GRANT
  FROM mem_grade

-------------------------------------------------------------
  
SELECT * FROM mem_list

--�����ڵ�� �׽��;��̵� �߰� (����������)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'Tester_Jung','test1234','�׽���','��','guestID@jlstore.com','00011112222',300);

--�����ڵ�� �⺻���̵� �߰� (����������)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'admin','0000','�⺻������','��','adminID@jlstore.com','00011110000',300);

--�ǹ��ڵ�� �⺻���̵� �߰� (����������)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'worker','0000','�⺻�ǹ���','��','workerID@jlstore.com','00022220000',200);

--�Ϲݵ�� �⺻���̵� �߰� (����������)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'worker','0000','�⺻ȸ��','��','workerID@jlstore.com','00033330000',100);

SELECT
     M_NO
    ,M_ID
    ,M_PW
    ,M_NAME
    ,M_GENDER
    ,M_EMAIL
    ,M_PHONE
    ,G_NO
  FROM mem_list