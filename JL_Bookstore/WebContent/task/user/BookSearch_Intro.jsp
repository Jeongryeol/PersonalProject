<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../../srcInclude/initJQ_EU_2.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JL교보문고 :: 도서검색서비스</title>
<!-- ―――[[HEAD style : css]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<style type="text/css">

</style>
<!-- ―――[[HEAD script : javascript]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<script type="text/javascript">
	//빈칸으로 만들어주는 함수
	function clearMethod(){
		$('#t_wordBar').val('');//빈칸으로 만들기
		showRecommand();//추천검색어를 또 띄우기
	}
	//리스트를 비워주는 함수
	function clearList(){
		$("#d_bookList").html("");//비우기
	}
	//추천검색어를 보여주는 함수
	function showRecommand(){
		var recom1 = "정";
		var recom2 = "ㅈ";
		var recom3 = "ㅈㅂ";
		var recom4 = "자바";
		var recom5 = "o";
		$("#d_bookList").html("<b>추천</b>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(1)' id='a_rc1'>"+recom1+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(2)' id='a_rc2'>"+recom2+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(3)' id='a_rc3'>"+recom3+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(4)' id='a_rc4'>"+recom4+"</a>"
			+"&nbsp;&nbsp;<a href='javascript:clickRecommand(5)' id='a_rc5'>"+recom5+"</a>"	);
	}
	//추천검색어 클릭시 텍스트박스에 입력시키기
	function clickRecommand(num) {
		$('#t_wordBar').val($("#a_rc"+num+"").text());
		getBookList();
	}
<%/* [[ 초성지식 도움말 ]]
─────────────────────────────────────────────────────────────────────────────────────────────────────
	1. 초성자음은 모두 19개 : 	ㄱ,ㄲ,ㄴ,ㄷ,ㄸ,ㄹ,ㅁ,ㅂ,ㅃ,ㅅ,ㅆ,ㅇ,ㅈ,ㅉ,ㅊ,ㅋ,ㅌ,ㅍ,ㅎ
	2. 중성모음은 모두 21개 : 	ㅏ,ㅐ,ㅑ,ㅒ,ㅓ,ㅔ,ㅕ,ㅖ,ㅗ,ㅘ,ㅚ,ㅙ,ㅛ,ㅜ,ㅝ,ㅟ,ㅞ,ㅠ,ㅡ,ㅢ,ㅣ
	3. 종성자음은 모두 27개: 	ㄱ,ㄲ,ㄳ,ㄴ,ㄵ,ㄶ,ㄷ,ㄹ,ㄺ,ㄻ,ㄼ,ㄽ,ㄾ,ㅀ,ㅁ,ㅂ,ㅄ,ㅅ,ㅆ,ㅇ,ㅈ,ㅊ,ㅋ,ㅌ,ㅍ,ㅎ(받침없을 경우까지 총 28가지)
─────────────────────────────────────────────────────────────────────────────────────────────────────
	1. 종성이 바뀌는 경우 코드값 차이 : 28
	2. 초성이 바뀌는 경우 코드값 차이 : 588( = 21*28)
	3. 한글에 대한 첫 코드값('가'의 코드값은 44032)
		초성 : 글자의 코드에서 '44032'를 빼고 '21*28'로 나눈 몫 :0~18
		중성 : 글자의 코드에서 '44032'를 빼고 '21*28'로 나눈 나머지를 다시 28로 나눈 몫 :0~20
		종성 : 글자의 코드에서 '44032'를 빼고 '21*28'로 나눈 나머지를 다시 28로 나눈 나머지 :0~27
─────────────────────────────────────────────────────────────────────────────────────────────────────*/%>
	//한글초성처리 함수
	function choSung(str){
		var cho = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ"
				  ,"ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ"
				  ,"ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"];//19개 초성
		var result = "";
		for(i=0;i<str.length;i++){
			code = str.charCodeAt(i)-44032;
			//alert("code = "+code);//str이 '자바'라면 2가 반환됨
			if(code>-1 && code<11172){
				result += cho[Math.floor(code/588)];
			}
		}
		console.log("result : "+result);
		return result;
	}
	//상세정보를 보여주는 함수
	function getWordDetail(tds){
		//console.log("getWordDetail 호출");
		var src = tds.childNodes[3].value;//hidden으로 넘어온  B_IMG컬럼값을 담음 (감지되면 경로표시,없으면 미리보기 안내)
		var bname = tds.childNodes[4].value;//hidden으로 넘어온  B_NAME컬럼값을 담음 (썸네일표시 감시기준 ,없으면 미리보기 안내)
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
	//조회하기
	function getBookList(){
			//alert("keyup호출성공");
			//문자담기(초성처리)
			var v_word = $("#t_wordBar").val().toUpperCase();//영문문자 대문자변환
			//var v_word = $("#t_wordBar").val();
			console.log("v_word : "+v_word);
			var choKeyword = choSung($("#t_wordBar").val());//한글초성처리 후 변수담기
			console.log("choKeyword : "+choKeyword);
			
			/*	[알고리즘 해설]
				toUpperCase()함수는 영문에 대하여 대문자로 반환하고,
				choSung()함수는 초성과 중성이상의 음절단위 이상의 한글에 대하여 초성을 반환하므로
				
				외부 if문에서
					v_word에는 뭔가 입력되어서 빈값("")이 아니고,
					choKeyword가 빈값("")인 상태는 "영어 또는 숫자"인 상태이다.
				    내부 if문에서	
					v_word에 반환된 값이 영문 대문자 A(아스키코드 48)부터  영문대문자 Z(아스키코드90)을 포함하여
					일부 작은 숫자 값까지 포함하기 위해 200으로 지정하면,
					"영어일때는 초성모드가 꺼지도록 설정됨"
				    내부 else문에서 
					그 외의 숫자를 대상에 대해 설정하므로
					"숫자일때는 초성모드가 켜짐"
				
				외부 else if문에서
					v_word에는 뭔가 입력되어있어서 빈값("")이 아니고,
					choKeyword도 뭔가 반환되어있어서 빈값("")이 아닌상태는 "한글음절"인 상태이므로
					"한글일때는 초성모드가 꺼짐"
				
				외부 else문에서
					v_word가 빈값("")인 경우는 검색조건이 없는 상태이므로
					조회결과를 비워두고 함수를 종료함
			*/
			//초성모드 Y/N 분석하기
			if(v_word!="" && choKeyword=="") {//영어 또는 숫자  또는 한글 초성: 입력은 되었지만 초성변환은 안됨
				if(v_word.charCodeAt(0)>=48 && v_word.charCodeAt(0)<=200){//영어와 숫자 라면
				//ASCII CODE 48:A ~ ASCII CODE 90:Z 
					choMode = "N";//초성모드 NO
				}else{//한글초성 
					choMode = "Y";//초성모드 YES ( 초성모드를 켜서 xml문서 안에 위치한 )
				}
				choKeyword = v_word;
			} else if(v_word!="" && choKeyword!="") {//한글 음절 : 입력은 되었는데 초성변환도 됨
				choMode = "N";//초성모드 NO ( 왜냐하면, 한글 그대로 DB와 비교하면 됨 )
				choKeyword = v_word;
			} else {//입력값이 없을 경우
				showRecommand();
				return;
			}
			
			var param // = "userInput="+$("#t_wordBar").val(); 
				= "command=select"
					+"&userInput="+choKeyword//서블릿에서 조회용으로 판단하도록 함
					+"&choMode="+choMode;
			console.log("param = "+param);//입력값 브라우저콘솔창 확인용
			
			$.ajax({
				 method:"POST"
				,url:"./Book_Select.JL"//web.xml문서 작성된 url패턴 확인(폴더까지 경로맞추기)
			//	,url:"./BookAction_List_json.jsp"//json문서
				//,data:userInput
				,data:param
				,success:function(htmlCode){
					//alert("Book_List.jsp로부터 응답도착");
				/*  css스타일링
					$("#d_bookList").css("border-left","green 4px solid");//옵션	
					$("#d_bookList").css("border-radius","5px");//옵션
					$("#d_bookList").css("background","#CEF6CE");//옵션
					$("#d_bookList").css("left",$("#t_wordBar").offset().left+"px");
					$("#d_bookList").css("top",$("#t_wordBar").offset().top+$("#t_wordBar").offset().height+"px"); */
					$("#d_bookList").html(htmlCode);//result에는 html태그
					if($("#no_search")!=null){
						$("#no_search").html("<br><dl><dt><h3>'"+$("#t_wordBar").val()+"' 의 검색결과가 없습니다.</h3></dt>"
										+"<dd>검색어의 철자가 정확한지 다시 한번 확인해주세요.</dd>"
										+"<d>검색어의 단어 수를 줄이거나, 단어의 띄어쓰기를 해주세요.</dd>");
					}
					//결과에 마우스 올리면 자동으로 보여지도록하는 이벤트처리
					/* var tds = document.getElementsByTagName("td");//브라우저는 같은 태그가 2개이상이면 자동으로 배열로 처리
					console.log(tds);
					for(var i=0;i<tds.length;i++){//TagName별로 반복
						tds[i].onmouseover = function(){//마우스오버
							//this.className = "listIn";//css
							for(var i=0; i<this.childNodes.length;i++)
								if(this.childNodes[i].value!=null){
									console.log("출력 : "+this.childNodes[i].value);
								}else{
									console.log("출력 : NULL")
								}
							//ajax처리
							getWordDetail(this);
						}
						tds[i].onmouseout = function(){//마우스아웃처리
							//this.className = "listOut";//css
						}
					} */
				}
				,error:function(xhrObject){
					alert(xhrObject.responseText);
				}
			});
 		}
	//상세정보를 보여주는 함수
	function getThumb(B_IMG){
		console.log("getThumb()호출됨 / B_IMG = "+B_IMG);
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
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
-->
<body>
<!-- ―――[[BODY script : javascript]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<script type="text/javascript">
 	$(document).ready(function() {//DOM구성 완료
 		showRecommand();
 		$("#t_wordBar").keyup(function() {getBookList();});
	});
</script>

<!-- ―――[[BODY content : html]]――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― -->
<div align="center">
<!-- 상단 로고 넣기 -->
<a href="./BookSearch_Intro.jsp">
	<img src="../../src/img/logo_kyobo.png" width="350" height="350" class="img-responsive" alt="Responsive image">
</a>
<!-- 검색 텍스트박스 [열기] -->
<form class="form-inline">
	<div class="form-group">
		<div class="input-group">
			<div class="input-group-addon">통합검색</div>
			<input type="text" class="form-control" id="t_wordBar"
				style="width:360;" placeholder="도서명 또는 저자명을 입력해주세요"
				data-toggle="tooltip" data-placement="top" title="도서명 또는 저자명을 입력해주세요.초성검색도 가능합니다."
				onClick="clearMethod()">
		</div>
	</div>
	<button type="submit" class="btn btn-primary">검색</button>
</form>	
<!-- 검색 텍스트박스 [닫기] -->
<!-- 도서 검색 결과  [열기]-->
<div id="d_bookList"></div>
<!-- 도서 검색 결과  [닫기]-->
</body>
</html>