--'A'�� ������ ����
SELECT * FROM emp
 WHERE ename LIKE '%'||'A'||'%'

--LIKE������ ����ϴ� ���ڴ� ��ҹ��ڰ� �����ȴ�. (�����̼Ƕ���)
SELECT * FROM emp
 WHERE ename LIKE '%'||'a'||'%'


--'A'�� ������ ����
SELECT * FROM emp
 WHERE ename LIKE '%'||'A'

--'A'�� �����ϴ� ����
SELECT * FROM emp
 WHERE ename LIKE 'A'||'%'


--���� ��ǰ�� ����ϴ� �ֿ��� ������ �ϳ�, ���� �˻��ӵ� : �ε����� �����ϰ� ��
CREATE INDEX i_dname ON dept(dname);

SELECT * FROM dept order by deptno

DELETE FROM dept
 WHERE deptno IN(70,75,90,99)