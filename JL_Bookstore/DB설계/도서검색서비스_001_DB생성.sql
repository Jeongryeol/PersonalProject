--DDL 관리자계정 생성
CREATE USER adm_book identified by test0725
    --[확인] User created

--DCL 관리자계정 관리권한부여
GRANT connect, resource TO adm_book
    --[확인]Grant complete

--DDL 조회계정 생성
CREATE USER viewer_book identified by 0725
    --[확인] User created

--DCL 조회계정 접속권한부여
GRANT connect TO viewer_book
    --[확인]Grant complete

--테이블스페이스 생성하기(메모리공간할당)
CREATE TABLESPACE adm_book DATAFILE 'E:\app\513\oradata\orcl11\db_adm_book.dbf' SIZE 200M
DEFAULT STORAGE
(INITIAL 10K
 NEXT 10K
 MINEXTENTS 2
 MAXEXTENTS 50
 PCTINCREASE 50)
    --[확인] Tablespace created

--생성된 테이블스페이스를 오라클에서 확인하기
SELECT
    tablespace_name
   ,initial_extent
   ,max_extents
  FROM dba_tablespaces;
  
--컴퓨터 하드디스크 상에서 물리적 서버생성확인하기
--E:\app\513\oradata\orcl11 에서 db_adm_book.dbf 확인하기


--ER-Win에서 잘못들어온 테이블 삭제하기
DROP TABLE BOOK_IT;
DROP TABLE BOOK_SELFDEV;
DROP TABLE BOOK_SIENCE;
DROP TABLE BOOK_SOCIETY;
DROP TABLE BOOK_INDEX;
commit;
