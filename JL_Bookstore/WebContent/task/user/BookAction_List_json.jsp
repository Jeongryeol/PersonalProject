<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="task.BookSelect_Dao" %>
<%@ page import="util.HashMapBinder" %>

<%
	//json.jsp를 요청(request)했을 때, 요청의 각 속성별로 Map자료형 생성하기
	Map<String,Object> pMap = new HashMap<String,Object>();	
	HashMapBinder hmb = new HashMapBinder(request);//바인더에 request 초기화
	hmb.bind(pMap);//초기화된 request로 빈 pMap을 보내어 한데 묶음(바인딩)

	//MyBatis에 연동된 자료객체 
	BookSelect_Dao bDao = new BookSelect_Dao();
	List<Map<String,Object>> wordList = bDao.getDataList(pMap);
	
	//List자료형을 json으로 변경하기
	Gson g = new Gson();
	String jsonWord = g.toJson(wordList);		//json처럼 되도록 배열로 담아줌 (더블쿼테이션 없음)
	//out.print(jsonWord);
%>
<script>
	var objectWord = <%=jsonWord %>;			//json화된 배열을 스크립트에 담음. 아직 object상태
	var jsonWord = JSON.stringify(objectWord);	//json오브젝트를 (자바스크립트값)을 JSON문자열로 변환하기
	var jsonDoc = JSON.parse(jsonWord);			//json문자열을 파싱해서 배열로 접근하고 변환하기
	
	//alert(jsonWord+", "+jsonDoc.length);		//확인
	for(var i=0;i<jsonDoc.length;i++){
		//jsonDoc[i].thing : thimg은 맵의 키값으로 사용되었던 속성값의 이름으로 쿼테이션이 필요없음
		console.log(jsonDoc[i].B_NAME);
	}
</script>