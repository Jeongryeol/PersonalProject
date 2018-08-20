        SELECT     
             ind.category CATEGORY
            ,it.b_no B_NO
            ,it.b_name B_NAME
            ,it.author AUTHOR
            ,it.price PRICE
        FROM book_index ind
            ,(SELECT
                 b_no B_NO
                ,b_name B_NAME
                ,author AUTHOR
                ,price PRICE
                FROM book_it
               WHERE b_name LIKE '%'||'a'||'%'
                  OR author LIKE '%'||'a'||'%') it
        WHERE ind.b_no = it.b_no



        SELECT     
             ind.category CATEGORY
            ,it.b_no B_NO
            ,it.b_name B_NAME
            ,it.author AUTHOR
            ,it.price PRICE
        FROM book_index ind
            ,(SELECT
                 b_no B_NO
                ,b_name B_NAME
                ,author AUTHOR
                ,price PRICE
                FROM book_it
               WHERE AUTHOR = '남궁성') it
        WHERE ind.b_no = it.b_no
        
            
        <if test="b_title!=null and choMode.equals('N')"><!-- 초성모드OFF -->
               WHERE b_name LIKE '%'||#{userInput}||'%'
                  OR author LIKE '%'||#{userInput}||'%') it
             </if>
        
        
        
        <if test="b_title!=null and choMode.equals('Y')"><!-- 초성모드ON -->
            AND func_chosung(b_title) LIKE '%'||#{b_title}||'%'
        </if>