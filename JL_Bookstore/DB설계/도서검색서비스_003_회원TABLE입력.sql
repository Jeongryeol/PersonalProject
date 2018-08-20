-- 꼭 참고하시오~!!!
-- http://www.gurubee.net/lecture/1013

--등급테이블
CREATE TABLE MEM_GRADE
(G_NO   NUMBER(3) constraints gno_pk primary key --제약조건설정
,G_NAME VARCHAR2(20) NOT NULL
,G_IMG  VARCHAR2(200)
,G_GRANT VARCHAR2(1))
--[확인] Table created.

--회원테이블
CREATE TABLE MEM_LIST(
  M_NO     NUMBER(5) constraints mno_pk primary key, --제약조건설정
  M_ID     VARCHAR2(50) NOT NULL,
  M_PW    VARCHAR2(50) NOT NULL,
  M_NAME  VARCHAR2(10),
  M_GENDER VARCHAR(2),
  M_EMAIL VARCHAR2(50),
  M_PHONE VARCHAR2(11),
  G_NO NUMBER(3)) 
--[확인] Table created.

 
--FK관계 부여하기
ALTER TABLE MEM_LIST ADD CONSTRAINT MEM_LIST_fk_MEM_GRADE
     FOREIGN  KEY (G_NO) REFERENCES MEM_GRADE(G_NO);

--확인하기
SELECT * FROM mem_list, mem_grade
 where MEM_LIST.G_NO = mem_grade.g_no;

SELECT * FROM book_it

EDIT book_it


-------------------------------------------------------------


SELECT * FROM mem_grade

--관리자등급
INSERT INTO mem_grade(G_NO,G_NAME,G_IMG,G_GRANT)
VALUES(300,'ADMIN',null,3);

--실무자등급
INSERT INTO mem_grade(G_NO,G_NAME,G_IMG,G_GRANT)
VALUES(200,'WORK',null,2);

--일반회원등급
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

--관리자등급 테스터아이디 추가 (시퀀스포함)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'Tester_Jung','test1234','테스터','남','guestID@jlstore.com','00011112222',300);

--관리자등급 기본아이디 추가 (시퀀스포함)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'admin','0000','기본관리자','남','adminID@jlstore.com','00011110000',300);

--실무자등급 기본아이디 추가 (시퀀스포함)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'worker','0000','기본실무자','남','workerID@jlstore.com','00022220000',200);

--일반등급 기본아이디 추가 (시퀀스포함)
INSERT INTO mem_list(M_NO,M_ID,M_PW,M_NAME,M_GENDER,M_EMAIL,M_PHONE,G_NO)
VALUES(seq_m_no.NEXTVAL,'worker','0000','기본회원','남','workerID@jlstore.com','00033330000',100);

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