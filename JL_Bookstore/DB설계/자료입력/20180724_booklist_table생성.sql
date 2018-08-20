CREATE TABLE SCOTT.BOOK_LIST
(
  B_CODE     NUMBER(4)         NOT NULL,
  B_NAME     VARCHAR2(50 BYTE),
  B_PRICE    VARCHAR2(50 BYTE),
  B_PICTURE  VARCHAR2(100 BYTE)
) 

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0001,'�Ϻ��� ���ι�','25000',null);
--INSERT���� �ݵ�� �̱������̼��� �̿��մϴ�.

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0002,'�������ۼ����','19500',null);

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0003,'���� ���� ��¥','23000',null);

INSERT INTO BOOK_LIST(b_code,b_name,b_price,b_picture)
VALUES(0004,'����','23000',null);


DELETE FROM BOOK_LIST WHERE rownum=1;

CREATE OR REPLACE VIEW v_booklist
as
SELECT b_code,b_name,b_price,b_picture
  FROM BOOK_LIST
  

SELECT b_code,b_name,b_price,b_picture FROM v_booklist
 WHERE b_name='�Ϻ��� ���ι�';