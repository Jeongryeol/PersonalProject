--'A'를 포함한 문자
SELECT * FROM emp
 WHERE ename LIKE '%'||'A'||'%'

--LIKE문에서 사용하는 문자는 대소문자가 구별된다. (쿼테이션때문)
SELECT * FROM emp
 WHERE ename LIKE '%'||'a'||'%'


--'A'로 끝나는 문자
SELECT * FROM emp
 WHERE ename LIKE '%'||'A'

--'A'로 시작하는 문자
SELECT * FROM emp
 WHERE ename LIKE 'A'||'%'


--서버 제품을 사용하는 주요한 이유중 하나, 빠른 검색속도 : 인덱스로 가능하게 함
CREATE INDEX i_dname ON dept(dname);

SELECT * FROM dept order by deptno

DELETE FROM dept
 WHERE deptno IN(70,75,90,99)