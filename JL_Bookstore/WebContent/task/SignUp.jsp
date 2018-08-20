<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//form태그는 내부에 위치한 값을 name속성으로 자료를 전송함     ↓name이름
	String n_name 	= request.getParameter("n_name");
	String n_email 	= request.getParameter("n_email");
	String n_pw 	= request.getParameter("n_pw");		//단위테스트 완료
	
	
%>


					<div class="checkbox">
						<label>
							<input type="checkbox" value="">Remember my account setting
						</label>
					</div>


</body>
</html>