<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Map, java.util.List, java.util.HashMap"%>
<%
	//서블릿으로부터 받은 객체를 요청객체(request)의  
	List<Map<String,Object>> rlist
		= (List<Map<String,Object>>)request.getAttribute("output");
	//out.print(rlist.size());
	int size = 0;
	if(rlist.size()!=0){//조회건수가 1건이라도 있으면
		if(rlist.size()<6){//조회건수가 6건 미만이면 길이를 5칸으로
			size = 5;			
		}else if((rlist.size()>=6)&&(rlist.size()<10)){//조회건수가 6건이상 10건미만일때
			size = 10;
		}
	}
	//조회대상
	String category = null;
	int b_no = 0;//화면에는 출력하지 않을 예정
	String b_name = null;
	String author = null;
	int price = 0;
	
	int cnt = 0;
%>
<%
if(size>0){
%>
<div class="row">
	<!-- div 태그안에 공간을 할당함 3:6:3 -->
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<!-- 조회결과를 담는 테이블 -->
	<table class="table table-striped table-condensed"><!-- style="width: 100px !important;" > -->
		<!-- <tr>
			<td><b>분류</b></td>
			<td width="70%"><b>도서명</b></td>
			<td><b>저자</b></td>
			<td width="30%" align="center"><b>책표지</b></td>
		</tr> -->
 <%	Map<String,Object> pMap = new HashMap<String,Object>();
	//반복해서 테이블 로우 생성하기
 	for(int i=0;i<rlist.size();i++){
	 		 pMap = rlist.get(i);
 %>
		<tr valign="middle">
			<td width="70%" id="td_<%=i+1%>" onmouseover="getThumb('<%=pMap.get("B_IMG")%>')">
				<%=pMap.get("B_NAME")%> <font color="grey">- <%=pMap.get("AUTHOR")%></font>
			</td><!-- 도서명 -->
			<%-- <td><%=pMap.get("AUTHOR") %></td> --%><!-- 저자명 -->
	<%	if(cnt==0){ %>
			<td width="30%" align="center" rowspan="<%=size %>">
				<div id="d_detail"></div>
			</td>
	<%		cnt++;
		}//end : if
	}//end : for
 	
 	//조회건수가 5건미만이면 추가 로우 생성하는 조건문
	if(rlist.size()<5){//예:4개
		for(int i = 0;i<6-rlist.size();i++){//예:0~1 < 6-4=2 까지 반복%>
		<tr>
			<td valign="top" onmouseover="getThumb('')">&nbsp;</td>
			<!-- <td>&nbsp;</td> -->
			<!-- <td>&nbsp;</td> -->
		</tr>	
	<%	}//end : for
	}//end : if	
	%>
	</table>
	</div>
	<div class="col-md-3"></div>
</div>
<%} else {%>
	<center><div id="no_search"></div></center>
<%
}//end : if-else
%>