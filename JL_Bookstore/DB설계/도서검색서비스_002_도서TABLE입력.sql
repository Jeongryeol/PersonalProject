A CREATE TABLE t_test
(t_no NUMBER(5) constraints t_no_pk primary key --�������Ǽ���
,t_id VARCHAR2(20) not null
,t_pw VARCHAR2(30) not null)
--[Ȯ��] Table created.

SELECT * FROM t_test

--�θ����̺� �� �Է��ϱ�
INSERT INTO BOOK_INDEX(b_no,category)
VALUES('100','�������');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('200','����');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('300','��ȸ');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('400','�ڱ���');

--�Է�Ȯ���ϱ�
SELECT
    b_no,category
   FROM BOOK_INDEX

--�ڽ����̺� �� �Է��ϱ�
INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023001','Oracle 11g ���α׷���','������','�Ͻ�Ȧ��','2��1��',23000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023002','�ڹ��� ���� 3rd Edition','���ü�','��������','1��3��',30000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023003','JSP 2.3 �����α׷��� ���ʺ��� �߱ޱ���','�ֹ���','�������ǻ�','2��3��',27000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023004','Do it! �ڹٽ�ũ��Ʈ+�������� �Թ�','���ο�','�������ۺ���','1��3��',20000,null,null,null,null);

--�Է� Ȯ���ϱ�
SELECT
     b_no,b_no2,b_name,author,publisher
    ,print_no,price,sale_cum,stock_now,stock_cum,b_img
  FROM book_it
  



EDIT book_it

SELECT * FROM book_it

INSERT INTO book_it(B_NO,B_NO2,B_NAME,AUTHOR,PUBLISHER,PRINT_NO,PRICE,SALE_CUM,STOCK_NOW,STOCK_CUM,B_IMG)
VALUES('100','0023005','Head First Servlet and JSP','Bert Bates','O`Reilly Media','2��1��',43900,null,null,null,null)

DELETE FROM book_it
 WHERE b_no2 = '0023005';
 
commit;

rollback;


