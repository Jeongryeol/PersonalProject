<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../../srcInclude/initJQ_EU_2.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JL�������� :: �����˻�����</title>
<!-- ������[[HEAD style : css]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<style type="text/css">

</style>
<!-- ������[[HEAD script : javascript]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<script type="text/javascript">
	//��ĭ���� ������ִ� �Լ�
	function clearMethod(){
		$('#t_wordBar').val('');//��ĭ���� �����
		showRecommand();//��õ�˻�� �� ����
	}
	//����Ʈ�� ����ִ� �Լ�
	function clearList(){
		$("#d_bookList").html("");//����
	}
	//��õ�˻�� �����ִ� �Լ�
	function showRecommand(){
		var recom1 = "��";
		var recom2 = "��";
		var recom3 = "����";
		var recom4 = "�ڹ�";
		var recom5 = "o";
		$("#d_bookList").html("<b>��õ</b>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(1)' id='a_rc1'>"+recom1+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(2)' id='a_rc2'>"+recom2+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(3)' id='a_rc3'>"+recom3+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(4)' id='a_rc4'>"+recom4+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(5)' id='a_rc5'>"+recom5+"</a>"	);
	}
	//��õ�˻��� Ŭ���� �ؽ�Ʈ�ڽ��� �Է½�Ű��
	function clickRecommand(num) {
		$('#t_wordBar').val($("#a_rc"+num+"").text());
		getBookList();
	}
<%/* [[ �ʼ����� ���� ]]
����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
	1. �ʼ������� ��� 19�� : 	��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��
	2. �߼������� ��� 21�� : 	��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��
	3. ���������� ��� 27��: 	��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��,��(��ħ���� ������ �� 28����)
����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
	1. ������ �ٲ�� ��� �ڵ尪 ���� : 28
	2. �ʼ��� �ٲ�� ��� �ڵ尪 ���� : 588( = 21*28)
	3. �ѱۿ� ���� ù �ڵ尪('��'�� �ڵ尪�� 44032)
		�ʼ� : ������ �ڵ忡�� '44032'�� ���� '21*28'�� ���� �� :0~18
		�߼� : ������ �ڵ忡�� '44032'�� ���� '21*28'�� ���� �������� �ٽ� 28�� ���� �� :0~20
		���� : ������ �ڵ忡�� '44032'�� ���� '21*28'�� ���� �������� �ٽ� 28�� ���� ������ :0~27
����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������*/%>
	//�ѱ��ʼ�ó�� �Լ�
	function choSung(str){
		var cho = ["��","��","��","��","��","��"
				  ,"��","��","��","��","��","��"
				  ,"��","��","��","��","��","��","��"];//19�� �ʼ�
		var result = "";
		for(i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			//alert("code = "+code);//str�� '�ڹ�'��� 2�� ��ȯ��
			if(code>-1 && code<11172){
				result += cho[Math.floor(code/588)];
			}
		}
		console.log("result : "+result);
		return result;
	}
	//�������� �����ִ� �Լ�
	function getWordDetail(tds){
		//console.log("getWordDetail ȣ��");
		var src = tds.childNodes[3].value;//hidden���� �Ѿ��  B_IMG�÷����� ���� (�����Ǹ� ���ǥ��,������ �̸����� �ȳ�)
		var bname = tds.childNodes[4].value;//hidden���� �Ѿ��  B_NAME�÷����� ���� (�����ǥ�� ���ñ��� ,������ �̸����� �ȳ�)
		console.log("src = "+src);
		var param = "B_IMG="+src+"&B_NAME="+bname;
		$.ajax({
			 method:"post"
			,url:"./BookSearch_Detail.jsp"
			,data:param
			,success:function(htmlCode) {
				$("#d_detail").html(htmlCode);
			}
		});
	}
	//��ȸ�ϱ�
	function getBookList(){
			//alert("keyupȣ�⼺��");
			//���ڴ��(�ʼ�ó��)
			var v_word = $("#t_wordBar").val().toUpperCase();//�������� �빮�ں�ȯ
			//var v_word = $("#t_wordBar").val();
			console.log("v_word : "+v_word);
			var choKeyword = choSung($("#t_wordBar").val());//�ѱ��ʼ�ó�� �� �������
			console.log("choKeyword : "+choKeyword);
			
			/*	[�˰��� �ؼ�]
				toUpperCase()�Լ��� ������ ���Ͽ� �빮�ڷ� ��ȯ�ϰ�,
				choSung()�Լ��� �ʼ��� �߼��̻��� �������� �̻��� �ѱۿ� ���Ͽ� �ʼ��� ��ȯ�ϹǷ�
				
				�ܺ� if������
					v_word���� ���� �ԷµǾ ��("")�� �ƴϰ�,
					choKeyword�� ��("")�� ���´� "���� �Ǵ� ����"�� �����̴�.
				    ���� if������	
					v_word�� ��ȯ�� ���� ���� �빮�� A(�ƽ�Ű�ڵ� 48)����  �����빮�� Z(�ƽ�Ű�ڵ�90)�� �����Ͽ�
					�Ϻ� ���� ���� ������ �����ϱ� ���� 200���� �����ϸ�,
					"�����϶��� �ʼ���尡 �������� ������"
				    ���� else������ 
					�� ���� ���ڸ� ��� ���� �����ϹǷ�
					"�����϶��� �ʼ���尡 ����"
				
				�ܺ� else if������
					v_word���� ���� �ԷµǾ��־ ��("")�� �ƴϰ�,
					choKeyword�� ���� ��ȯ�Ǿ��־ ��("")�� �ƴѻ��´� "�ѱ�����"�� �����̹Ƿ�
					"�ѱ��϶��� �ʼ���尡 ����"
				
				�ܺ� else������
					v_word�� ��("")�� ���� �˻������� ���� �����̹Ƿ�
					��ȸ����� ����ΰ� �Լ��� ������
			*/
			//�ʼ���� Y/N �м��ϱ�
			if(v_word!="" && choKeyword=="") {//���� �Ǵ� ����  �Ǵ� �ѱ� �ʼ�: �Է��� �Ǿ����� �ʼ���ȯ�� �ȵ�
				if(v_word.charCodeAt(0)>=48 && v_word.charCodeAt(0)<=200){//����� ���� ���
				//ASCII CODE 48:A ~ ASCII CODE 90:Z 
					choMode = "N";//�ʼ���� NO
				}else{//�ѱ��ʼ� 
					choMode = "Y";//�ʼ���� YES ( �ʼ���带 �Ѽ� xml���� �ȿ� ��ġ�� )
				}
				choKeyword = v_word;
			} else if(v_word!="" && choKeyword!="") {//�ѱ� ���� : �Է��� �Ǿ��µ� �ʼ���ȯ�� ��
				choMode = "N";//�ʼ���� NO ( �ֳ��ϸ�, �ѱ� �״�� DB�� ���ϸ� �� )
				choKeyword = v_word;
			} else {//�Է°��� ���� ���
				showRecommand();
				return;
			}
			
			var param // = "userInput="+$("#t_wordBar").val(); 
				= "command=select"
					+"&userInput="+choKeyword//�������� ��ȸ������ �Ǵ��ϵ��� ��
					+"&choMode="+choMode;
			console.log("param = "+param);//�Է°� �������ܼ�â Ȯ�ο�
			
			$.ajax({
				 method:"POST"
				,url:"./Book_Select.JL"//web.xml���� �ۼ��� url���� Ȯ��(�������� ��θ��߱�)
			//	,url:"./BookAction_List_json.jsp"//json����
				//,data:userInput
				,data:param
				,success:function(htmlCode){
					//alert("Book_List.jsp�κ��� ���䵵��");
				/*  css��Ÿ�ϸ�
					$("#d_bookList").css("border-left","green 4px solid");//�ɼ�	
					$("#d_bookList").css("border-radius","5px");//�ɼ�
					$("#d_bookList").css("background","#CEF6CE");//�ɼ�
					$("#d_bookList").css("left",$("#t_wordBar").offset().left+"px");
					$("#d_bookList").css("top",$("#t_wordBar").offset().top+$("#t_wordBar").offset().height+"px"); */
					$("#d_bookList").html(htmlCode);//result���� html�±�
					if($("#no_search")!=null){
						$("#no_search").html("<br><dl><dt><h3>'"+$("#t_wordBar").val()+"' �� �˻������ �����ϴ�.</h3></dt>"
										+"<dd>�˻����� ö�ڰ� ��Ȯ���� �ٽ� �ѹ� Ȯ�����ּ���.</dd>"
										+"<d>�˻����� �ܾ� ���� ���̰ų�, �ܾ��� ���⸦ ���ּ���.</dd>");
					}
					//����� ���콺 �ø��� �ڵ����� �����������ϴ� �̺�Ʈó��
					/* var tds = document.getElementsByTagName("td");//�������� ���� �±װ� 2���̻��̸� �ڵ����� �迭�� ó��
					console.log(tds);
					for(var i=0;i<tds.length;i++){//TagName���� �ݺ�
						tds[i].onmouseover = function(){//���콺����
							//this.className = "listIn";//css
							for(var i=0; i<this.childNodes.length;i++)
								if(this.childNodes[i].value!=null){
									console.log("��� : "+this.childNodes[i].value);
								}else{
									console.log("��� : NULL")
								}
							//ajaxó��
							getWordDetail(this);
						}
						tds[i].onmouseout = function(){//���콺�ƿ�ó��
							//this.className = "listOut";//css
						}
					} */
				}
				,error:function(xhrObject){
					alert(xhrObject.responseText);
				}
			});
 		}
	//�������� �����ִ� �Լ�
	function getThumb(B_IMG){
		console.log("getThumb()ȣ��� / B_IMG = "+B_IMG);
		if(B_IMG!=""){
			var param = "B_IMG="+B_IMG;
			$.ajax({
				 method:"post"
				,url:"./BookSearch_Detail.jsp"
				,data:param
				,success:function(htmlCode) {
					$("#d_detail").html(htmlCode);
				}
			});
		} else {
			$("#d_detail").html("");
		}
	}
</script>
</head>
<!--
��������������������������������������������������������������������������������������������������������������
-->
<body>
<!-- ������[[BODY script : javascript]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<script type="text/javascript">
 	$(document).ready(function() {//DOM���� �Ϸ�
 		showRecommand();
 		$("#t_wordBar").keyup(function() {getBookList();});
	});
</script>

<!-- ������[[BODY content : html]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<div align="center">
<!-- ��� �ΰ� �ֱ� -->
<a href="./BookSearch_Intro.jsp">
	<img src="../../src/img/logo_kyobo.png" width="350" height="350" class="img-responsive" alt="Responsive image">
</a>
<!-- �˻� �ؽ�Ʈ�ڽ� [����] -->
<form class="form-inline">
	<div class="form-group">
		<div class="input-group">
			<div class="input-group-addon">���հ˻�</div>
			<input type="text" class="form-control" id="t_wordBar"
				style="width:360;" placeholder="������ �Ǵ� ���ڸ��� �Է����ּ���"
				data-toggle="tooltip" data-placement="top" title="������ �Ǵ� ���ڸ��� �Է����ּ���.�ʼ��˻��� �����մϴ�."
				onClick="clearMethod()">
		</div>
	</div>
	<button type="submit" class="btn btn-primary">�˻�</button>
</form>	
<!-- �˻� �ؽ�Ʈ�ڽ� [�ݱ�] -->
<!-- ���� �˻� ���  [����]-->
<div id="d_bookList"></div>
<!-- ���� �˻� ���  [�ݱ�]-->
</body>
</html>