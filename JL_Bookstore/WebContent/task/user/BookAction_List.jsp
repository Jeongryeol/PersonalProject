<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Map, java.util.List, java.util.HashMap"%>
<%
	//�������κ��� ���� ��ü�� ��û��ü(request)��  
	List<Map<String,Object>> rlist
		= (List<Map<String,Object>>)request.getAttribute("output");
	//out.print(rlist.size());
	int size = 0;
	if(rlist.size()!=0){//��ȸ�Ǽ��� 1���̶� ������
		if(rlist.size()<6){//��ȸ�Ǽ��� 6�� �̸��̸� ���̸� 5ĭ����
			size = 5;			
		}else if((rlist.size()>=6)&&(rlist.size()<10)){//��ȸ�Ǽ��� 6���̻� 10�ǹ̸��϶�
			size = 10;
		}
	}
	//��ȸ���
	String category = null;
	int b_no = 0;//ȭ�鿡�� ������� ���� ����
	String b_name = null;
	String author = null;
	int price = 0;
	
	int cnt = 0;
%>
<%
if(size>0){
%>
<div class="row">
	<!-- div �±׾ȿ� ������ �Ҵ��� 3:6:3 -->
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<!-- ��ȸ����� ��� ���̺� -->
	<table class="table table-striped table-condensed"><!-- style="width: 100px !important;" > -->
		<!-- <tr>
			<td><b>�з�</b></td>
			<td width="70%"><b>������</b></td>
			<td><b>����</b></td>
			<td width="30%" align="center"><b>åǥ��</b></td>
		</tr> -->
 <%	Map<String,Object> pMap = new HashMap<String,Object>();
	//�ݺ��ؼ� ���̺� �ο� �����ϱ�
 	for(int i=0;i<rlist.size();i++){
	 		 pMap = rlist.get(i);
 %>
		<tr valign="middle">
			<td width="70%" id="td_<%=i+1%>" onmouseover="getThumb('<%=pMap.get("B_IMG")%>')">
				<%=pMap.get("B_NAME")%> <font color="grey">- <%=pMap.get("AUTHOR")%></font>
			</td><!-- ������ -->
			<%-- <td><%=pMap.get("AUTHOR") %></td> --%><!-- ���ڸ� -->
	<%	if(cnt==0){ %>
			<td width="30%" align="center" rowspan="<%=size %>">
				<div id="d_detail"></div>
			</td>
	<%		cnt++;
		}//end : if
	}//end : for
 	
 	//��ȸ�Ǽ��� 5�ǹ̸��̸� �߰� �ο� �����ϴ� ���ǹ�
	if(rlist.size()<5){//��:4��
		for(int i = 0;i<6-rlist.size();i++){//��:0~1 < 6-4=2 ���� �ݺ�%>
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