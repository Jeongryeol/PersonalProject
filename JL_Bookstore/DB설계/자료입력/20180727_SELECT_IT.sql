--��ü��ϰ� �÷�
SELECT
      b_no, b_no2, b_name, author, publisher,
      print_no, price, sale_cum, stock_now, stock_cum,
      b_img
  FROM book_it


--��ȸ�� ����� SQL��
SELECT
     ind.category "�з�"
    ,it.b_no "������ȣ"
    ,it.b_name "������"
    ,it.author "����"
    ,it.price "�ݾ�"
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
         WHERE b_name LIKE '%'||'��'||'%'
            OR author LIKE '%'||'��'||'%') it, book_index ind
    WHERE ind.b_no = it.b_no