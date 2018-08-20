A CREATE TABLE t_test
(t_no NUMBER(5) constraints t_no_pk primary key --제약조건설정
,t_id VARCHAR2(20) not null
,t_pw VARCHAR2(30) not null)
--[확인] Table created.

SELECT * FROM t_test

--부모테이블 값 입력하기
INSERT INTO BOOK_INDEX(b_no,category)
VALUES('100','정보통신');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('200','과학');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('300','사회');

INSERT INTO BOOK_INDEX(b_no,category)
VALUES('400','자기계발');

--입력확인하기
SELECT
    b_no,category
   FROM BOOK_INDEX

--자식테이블 값 입력하기
INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023001','Oracle 11g 프로그래밍','성윤정','북스홀릭','2판1쇄',23000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023002','자바의 정석 3rd Edition','남궁성','도우출판','1판3쇄',30000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023003','JSP 2.3 웹프로그래밍 기초부터 중급까지','최범균','가메출판사','2판3쇄',27000,null,null,null,null);

INSERT INTO book_it(b_no,b_no2,b_name,author,publisher,print_no,price,sale_cum,stock_now,stock_cum,b_img)
VALUES('100','0023004','Do it! 자바스크립트+제이쿼리 입문','정인용','이지스퍼블리싱','1판3쇄',20000,null,null,null,null);

--입력 확인하기
SELECT
     b_no,b_no2,b_name,author,publisher
    ,print_no,price,sale_cum,stock_now,stock_cum,b_img
  FROM book_it
  



EDIT book_it

SELECT * FROM book_it

INSERT INTO book_it(B_NO,B_NO2,B_NAME,AUTHOR,PUBLISHER,PRINT_NO,PRICE,SALE_CUM,STOCK_NOW,STOCK_CUM,B_IMG)
VALUES('100','0023005','Head First Servlet and JSP','Bert Bates','O`Reilly Media','2판1쇄',43900,null,null,null,null)

DELETE FROM book_it
 WHERE b_no2 = '0023005';
 
commit;

rollback;


