<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../srcInclude/initJQ_EU_1.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome to visit JLStore!</title>
<!-- ������[[BODY script ]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<script type="text/javascript">
	//��й�ȣã�� �Լ�
	function findPW(){
		//�Է°� ���
		var userName = $("#i_name").val();
		var userEmail = $("#i_email").val();
		//��û��ü�� ���� �Ķ���� ����
		var param = "command=select"
				  	+"&m_name="+userName
				  	+"&m_email="+userEmail;
		/* ���� ������ ȭ����ȯ �׽�Ʈ�ʿ� */
		response.sendRedirect("/task/FindPassword.JL");
	}
	//�α��� �Լ�
	function signIn(){
		//�Է°� ���
		var userName = $("#i_name").val();
		var userEmail = $("#i_email").val();
		var userPw = $("#i_pw").val();
		//��û��ü�� ���� �Ķ���� ����
		var param  = "command"	+"="+"select"	//�⺻���:��ȸ����
			+"&"	+"comtype"	+"="+"signIn"	//���θ��:ȸ������
			+"&"	+"m_name"	+"="+userName
			+"&"	+"m_email"	+"="+userEmail
			+"&"	+"m_pw"		+"="+userPw;
		//�񵿱�ó���� �α���Ȯ���ϱ�
		$.ajax({
			 method:"post"
			,url:"/SignIn.JL"/* ���� ������ ��  */
			,data:param
			,success:function(htmlCode){
				/* �α����� ������������ �ڵ� ����ϱ� */
			}
			,error:function(xhrObject){
				alert("[[����]] "+xhrObject);
				console.log("[[����]] "+xhrObject);
			}
		});
	}
</script>
</head>
<body>
<!-- ������[[BODY script ]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<script type="text/javascript">
	$(document).ready(function() {
	//��й�ȣã�� ��ư�� ������ �� : ��й�ȣã���Լ� ȣ��
		$("#btn_findPW").click(function() {
			findPW();//��й�ȣã���Լ� ȣ��
		});
	//�α��� ��ư�� ������ �� : �α����Լ� ȣ��
		$("#btn_signIn").click(function() {
			signIn();//�α����Լ�ȣ��
		});
	alert("'�α���,ȸ������,��й�ȣã��'������! [�˻�]���񽺷� �̵��մϴ�...!")
	location.href = "./user/BookSearch_Intro.jsp";
	});
</script>
<!-- ������[[BODY content : html]]������������������������������������������������������������������������������������������������������������������������������������������������������������������ -->
<!-- form�±׸�  ���� ȸ������������(SignUp.jsp)�� �̵� / �����׽�Ʈ �� ȭ�� �ٵ�� �� ��-->
<form action="./SignUp.jsp" method="post">
<div class="form-group">
	<div class="row">
		<div class="col-md-4"><!-- �������� --></div>
		<div class="col-md-4" align="center"><!-- �߾ӷα��� -->
			<!-- �ΰ���� -->
			<div><img src="../src/img/logo_kyobo.png" width="250" height="250" class="img-responsive" alt="Responsive image"></div>
			<div class="jumbotron" style="width: auto;"><!-- ����Ʈ�� -->
				<!-- �̸� -->
				<label for="exampleInputEmail2"><h4><strong>Name</strong></h4></label>
				<div class="input-group">
					<input type="text" id="i_name" name="n_name" value="Tester_Jung"
							class="form-control" placeholder="nickname"
							 size="35" style="text-align:center;"
							onclick="javascript:$('#i_name').val('')">
				</div>
				<!-- �̸���-->
				<label for="exampleInputEmail2"><h4><strong>Email Account</strong></h4></label>
				<div class="input-group">
					<input type="text" id="i_email" name="n_email" value="guestID@jlstore.com"
							class="form-control" placeholder="example@exam.com"
							size="35" style="text-align:center;" 
							onclick="javascript:$('#i_email').val('')">
				</div>
				<!-- ��й�ȣ -->
				<label for="exampleInputEmail2"><h4><strong>Password</strong></h4></label>
				<div class="input-group">
					<input type="password" id="i_pw" name="n_pw" value="test1234"
							class="form-control" placeholder="��������������������"
							size="35" style="text-align:center;"
							onclick="javascript:$('#i_pw').val('')">
				</div>
				<br>
				<!-- ��ư�׷� -->
		  		<p align="center">
		  		<!-- ȸ������(Sign up) -->
					<input type="submit" id="btn_signUp" value="Sign Up"
							class="btn btn-primary btn-lg" style="width:300px;">
				<!-- ���� --><div></div>
				<!-- ��й�ȣã�� -->
					<input type="button" id="btn_findPW" value="Find password"
							class="btn btn-default" style="width:145px;">&nbsp;
				<!-- �α���(Sign in) -->
		  			<input type="button" id="btn_signIn" value="Sign In" 
		  					class="btn btn-success" style="width:145px;">
		  		</p>
		  		<div></div><!-- ���м� -->
			</div><!-- ����Ʈ�� �� -->
	  	</div><!-- �߾ӷα��� �� -->
		<div class="col-md-4"><!-- �������� --></div>
	</div>
</div>
</form>
<div class="col-md-4"></div>
<div class="col-md-4" align="center">
	<p class="bg-info"><!-- ���۱�ǥ�� -->
  		<h6><b>Copyright��2018 by JL. All Page content is property of JL</b></h6>
	</p>
</div>
<div class="col-md-4"></div>
</body>
</html>