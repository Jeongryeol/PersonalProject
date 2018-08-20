<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../srcInclude/initJQ_EU_1.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome to visit JLStore!</title>
<!-- ―――[[BODY script ]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<script type="text/javascript">
	//비밀번호찾기 함수
	function findPW(){
		//입력값 담기
		var userName = $("#i_name").val();
		var userEmail = $("#i_email").val();
		//요청객체에 담을 파라미터 생성
		var param = "command=select"
				  	+"&m_name="+userName
				  	+"&m_email="+userEmail;
		/* 서블릿 생성후 화면전환 테스트필요 */
		response.sendRedirect("/task/FindPassword.JL");
	}
	//로그인 함수
	function signIn(){
		//입력값 담기
		var userName = $("#i_name").val();
		var userEmail = $("#i_email").val();
		var userPw = $("#i_pw").val();
		//요청객체에 담을 파라미터 생성
		var param  = "command"	+"="+"select"	//기본명령:조회업무
			+"&"	+"comtype"	+"="+"signIn"	//세부명령:회원가입
			+"&"	+"m_name"	+"="+userName
			+"&"	+"m_email"	+"="+userEmail
			+"&"	+"m_pw"		+"="+userPw;
		//비동기처리로 로그인확인하기
		$.ajax({
			 method:"post"
			,url:"/SignIn.JL"/* 서블릿 생성할 것  */
			,data:param
			,success:function(htmlCode){
				/* 로그인이 성공했을때의 코드 기록하기 */
			}
			,error:function(xhrObject){
				alert("[[에러]] "+xhrObject);
				console.log("[[에러]] "+xhrObject);
			}
		});
	}
</script>
</head>
<body>
<!-- ―――[[BODY script ]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<script type="text/javascript">
	$(document).ready(function() {
	//비밀번호찾기 버튼을 눌렀을 때 : 비밀번호찾기함수 호출
		$("#btn_findPW").click(function() {
			findPW();//비밀번호찾기함수 호출
		});
	//로그인 버튼을 눌렀을 때 : 로그인함수 호출
		$("#btn_signIn").click(function() {
			signIn();//로그인함수호출
		});
	alert("'로그인,회원가입,비밀번호찾기'구현중! [검색]서비스로 이동합니다...!")
	location.href = "./user/BookSearch_Intro.jsp";
	});
</script>
<!-- ―――[[BODY content : html]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<!-- form태그를  통해 회원가입페이지(SignUp.jsp)로 이동 / 단위테스트 후 화면 다듬기 할 것-->
<form action="./SignUp.jsp" method="post">
<div class="form-group">
	<div class="row">
		<div class="col-md-4"><!-- 좌측여백 --></div>
		<div class="col-md-4" align="center"><!-- 중앙로그인 -->
			<!-- 로고삽입 -->
			<div><img src="../src/img/logo_kyobo.png" width="250" height="250" class="img-responsive" alt="Responsive image"></div>
			<div class="jumbotron" style="width: auto;"><!-- 점프트론 -->
				<!-- 이름 -->
				<label for="exampleInputEmail2"><h4><strong>Name</strong></h4></label>
				<div class="input-group">
					<input type="text" id="i_name" name="n_name" value="Tester_Jung"
							class="form-control" placeholder="nickname"
							 size="35" style="text-align:center;"
							onclick="javascript:$('#i_name').val('')">
				</div>
				<!-- 이메일-->
				<label for="exampleInputEmail2"><h4><strong>Email Account</strong></h4></label>
				<div class="input-group">
					<input type="text" id="i_email" name="n_email" value="guestID@jlstore.com"
							class="form-control" placeholder="example@exam.com"
							size="35" style="text-align:center;" 
							onclick="javascript:$('#i_email').val('')">
				</div>
				<!-- 비밀번호 -->
				<label for="exampleInputEmail2"><h4><strong>Password</strong></h4></label>
				<div class="input-group">
					<input type="password" id="i_pw" name="n_pw" value="test1234"
							class="form-control" placeholder="··········"
							size="35" style="text-align:center;"
							onclick="javascript:$('#i_pw').val('')">
				</div>
				<br>
				<!-- 버튼그룹 -->
		  		<p align="center">
		  		<!-- 회원가입(Sign up) -->
					<input type="submit" id="btn_signUp" value="Sign Up"
							class="btn btn-primary btn-lg" style="width:300px;">
				<!-- 구분 --><div></div>
				<!-- 비밀번호찾기 -->
					<input type="button" id="btn_findPW" value="Find password"
							class="btn btn-default" style="width:145px;">&nbsp;
				<!-- 로그인(Sign in) -->
		  			<input type="button" id="btn_signIn" value="Sign In" 
		  					class="btn btn-success" style="width:145px;">
		  		</p>
		  		<div></div><!-- 구분선 -->
			</div><!-- 점프트론 끝 -->
	  	</div><!-- 중앙로그인 끝 -->
		<div class="col-md-4"><!-- 우측여백 --></div>
	</div>
</div>
</form>
<div class="col-md-4"></div>
<div class="col-md-4" align="center">
	<p class="bg-info"><!-- 저작권표시 -->
  		<h6><b>Copyrightⓒ2018 by JL. All Page content is property of JL</b></h6>
	</p>
</div>
<div class="col-md-4"></div>
</body>
</html>