--전체목록과 컬럼
SELECT
      b_no, b_no2, b_name, author, publisher,
      print_no, price, sale_cum, stock_now, stock_cum,
      b_img
  FROM book_it


--조회에 사용할 SQL문
SELECT
     ind.category "분류"
    ,it.b_no "도서번호"
    ,it.b_name "도서명"
    ,it.author "저자"
    ,it.price "금액"
  FROM book_index ind, book_it it
 WHERE ind.b_no = it.b_no
   AND it.b_name LIKE '%'||'Oracle'||'%'


     
    SELECT     
        ind.category CATEGORY
       ,it.b_no B_NO
       ,it.b_name B_NAME
       ,it.author AUTHOR
       ,it.price PRICE
    FROM (SELECT
             b_no B_NO
            ,b_name B_NAME
            ,author AUTHOR
            ,price PRICE
          FROM book_it
         WHERE b_name LIKE '%'||'성'||'%'
            OR author LIKE '%'||'성'||'%') it, book_index ind
    WHERE ind.b_no = it.b_no