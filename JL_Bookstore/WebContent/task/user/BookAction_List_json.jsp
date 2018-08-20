<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="task.BookSelect_Dao" %>
<%@ page import="util.HashMapBinder" %>

<%
	//json.jsp�� ��û(request)���� ��, ��û�� �� �Ӽ����� Map�ڷ��� �����ϱ�
	Map<String,Object> pMap = new HashMap<String,Object>();	
	HashMapBinder hmb = new HashMapBinder(request);//���δ��� request �ʱ�ȭ
	hmb.bind(pMap);//�ʱ�ȭ�� request�� �� pMap�� ������ �ѵ� ����(���ε�)

	//MyBatis�� ������ �ڷᰴü 
	BookSelect_Dao bDao = new BookSelect_Dao();
	List<Map<String,Object>> wordList = bDao.getDataList(pMap);
	
	//List�ڷ����� json���� �����ϱ�
	Gson g = new Gson();
	String jsonWord = g.toJson(wordList);		//jsonó�� �ǵ��� �迭�� ����� (���������̼� ����)
	//out.print(jsonWord);
%>
<script>
	var objectWord = <%=jsonWord %>;			//jsonȭ�� �迭�� ��ũ��Ʈ�� ����. ���� object����
	var jsonWord = JSON.stringify(objectWord);	//json������Ʈ�� (�ڹٽ�ũ��Ʈ��)�� JSON���ڿ��� ��ȯ�ϱ�
	var jsonDoc = JSON.parse(jsonWord);			//json���ڿ��� �Ľ��ؼ� �迭�� �����ϰ� ��ȯ�ϱ�
	
	//alert(jsonWord+", "+jsonDoc.length);		//Ȯ��
	for(var i=0;i<jsonDoc.length;i++){
		//jsonDoc[i].thing : thimg�� ���� Ű������ ���Ǿ��� �Ӽ����� �̸����� �����̼��� �ʿ����
		console.log(jsonDoc[i].B_NAME);
	}
</script>