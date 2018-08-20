--DDL �����ڰ��� ����
CREATE USER adm_book identified by test0725
    --[Ȯ��] User created

--DCL �����ڰ��� �������Ѻο�
GRANT connect, resource TO adm_book
    --[Ȯ��]Grant complete

--DDL ��ȸ���� ����
CREATE USER viewer_book identified by 0725
    --[Ȯ��] User created

--DCL ��ȸ���� ���ӱ��Ѻο�
GRANT connect TO viewer_book
    --[Ȯ��]Grant complete

--���̺����̽� �����ϱ�(�޸𸮰����Ҵ�)
CREATE TABLESPACE adm_book DATAFILE 'E:\app\513\oradata\orcl11\db_adm_book.dbf' SIZE 200M
DEFAULT STORAGE
(INITIAL 10K
 NEXT 10K
 MINEXTENTS 2
 MAXEXTENTS 50
 PCTINCREASE 50)
    --[Ȯ��] Tablespace created

--������ ���̺����̽��� ����Ŭ���� Ȯ���ϱ�
SELECT
    tablespace_name
   ,initial_extent
   ,max_extents
  FROM dba_tablespaces;
  
--��ǻ�� �ϵ��ũ �󿡼� ������ ��������Ȯ���ϱ�
--E:\app\513\oradata\orcl11 ���� db_adm_book.dbf Ȯ���ϱ�


--ER-Win���� �߸����� ���̺� �����ϱ�
DROP TABLE BOOK_IT;
DROP TABLE BOOK_SELFDEV;
DROP TABLE BOOK_SIENCE;
DROP TABLE BOOK_SOCIETY;
DROP TABLE BOOK_INDEX;
commit;
