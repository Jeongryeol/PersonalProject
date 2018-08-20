<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Map"%>
<%
	
	String srcLocation = (String)request.getParameter("B_IMG");
	System.out.println(srcLocation);
%>
<center>
	<img src="../../src/img/book/<%=srcLocation%>" class="img-rounded" width="120" height="150"/>
</center>
