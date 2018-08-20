CREATE TABLE SCOTT.BOOK_LIST
(
  B_CODE     NUMBER(4)         NOT NULL,
  B_NAME     VARCHAR2(50 BYTE),
  B_PRICE    VARCHAR2(50 BYTE),
  B_PICTURE  VARCHAR2(100 BYTE)
) 

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0001,'완벽한 공부법','25000',null);
--INSERT문엔 반드시 싱글쿼테이션을 이용합니다.

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0002,'순서도작성기법','19500',null);

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0003,'아주 멋진 가짜','23000',null);

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0004,'스눕','23000',null);


DELETE FROM BOOK_LIST WHERE rownum=1;

CREATE OR REPLACE VIEW v_booklist
as
SELECT b_code,b_name,b_price,b_picture
  FROM BOOK_LIST
  

SELECT b_code,b_name,b_price,b_picture FROM v_booklist
 WHERE b_name='완벽한 공부법';