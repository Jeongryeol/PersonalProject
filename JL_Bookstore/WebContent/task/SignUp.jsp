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
	//form�±״� ���ο� ��ġ�� ���� name�Ӽ����� �ڷḦ ������     ��name�̸�
	String n_name 	= request.getParameter("n_name");
	String n_email 	= request.getParameter("n_email");
	String n_pw 	= request.getParameter("n_pw");		//�����׽�Ʈ �Ϸ�
	
	
%>


					<div class="checkbox">
						<label>
							<input type="checkbox" value="">Remember my account setting
						</label>
					</div>


</body>
</html>