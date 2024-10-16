<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			$.ajax({
				type: "post",
				url:"loginpossible",
				async:true,
				data: {"id":id,"pw":pw},
				success:function(data){
					alert(data);
				},
				error:function(){
					alert("에러");
				}
			});
		});
	});

////아이디 찾기 팝업창
$(document).ready(function() {
	$('#is').click(function() {
		var windowFeatures="width=300px, heigth=600px, popup=yes";
		var popup = window.open("idsearch","_blank",windowFeatures);
		popup.resizeTo(350,500);	
	});
});

////비밀번호 찾기 팝업창
$(document).ready(function() {
	$('#ps').click(function() {
		var windowFeatures="width=300px, heigth=600px, popup=yes";
		var pwpopup = window.open("pwsearch","_blank",windowFeatures);
		pwpopup.resizeTo(350,500);	
	});
});
</script>
<style type="text/css">
	.side_rightbar_whole,
	.header_team_logo.scroll_div{
		display: none;
	}
    #body {
        width: 100%;
    }
	#footer {
        width: calc(100vw - 40px);
    }
    .main_section{
    	width: 100%;
    }
	.isps, .is, .ps {
		font-size: 13px;
		color:#777;
	}
	.p {
		text-align: center;
		margin: 10px 0 20px 0;
	}
	.is:hover ,.ps:hover {
		color:#777;
	}
	.p a{
		color: #0c400c;
	}
	
	.isps {
		text-align: center;
	}
	.loginValue{
		width: 300px;
		margin: 30px auto;
	}
	.loginValue div{
		display: flex;
	}
	.loginValue label{
		width: 150px;
		max-width: 150px;
	}
	.loginValue input{
		border: 1px solid #e8e8e8;
		height: 60px;
		margin-bottom: 10px;
		border-radius: 10px;
	}
	#login {
		margin : 20px auto 5px auto;
		display: block;
		width: 22%;
		padding: 5px 0;
		border-radius: 10px;
		box-sizing: border-box;
		background-color: #ffffff;
		transition: background-color 0.5s;
		color: black;
		width: 300px;
		height: 50px;
		border: 1px solid #08750e;
	}
	#login:hover {
		border: none;
		background-color: #08750e90;
		color: white;
	}
	.div_form {
		border: 2px solid #08750e90;
	    margin: 120px auto;
	    border-radius: 25px;
	    width: 500px;
	    padding: 75px 0;
	}
	h1 {
		margin: 20px auto;
	}
	.img_bg{
		position: fixed;
		display: block;
		height: auto;
		background-size: contain;
		opacity: 0.1;
		z-index: -1;
	}
	.img_bg.img_bg1{
		width: 100px;
		top: 0;
		left: 0;
		opacity: 0.05;
	}
	.img_bg.img_bg2{
		width: 150px;
		bottom: 0;
		right: -50px;
		opacity: 0.05;
	}
	.img_bg.img_bg3{
		width: 50px;
		top: 80vh;
		left: 20vw;
	}
	.img_bg.img_bg4{
		width: 80px;
		bottom: 64vh;
		left: 37vw;
		opacity: 0.2;
	}
	.img_bg.img_bg5{
		width: 75px;
		top: 63vh;
		left: 59vw;
		opacity: 0.2;
	}
	.img_bg.img_bg6{
		width: 50px;
		top: 20vh;
		right: 10vw;
		opacity: 0.05;
	}
</style>
</head>
<body>
<div class="div_form">
	<h1>MVP</h1>
	<form action="logincheck" method="post">
		<div class="loginValue">
			<div>
				<input type="text" id="id" name="id" placeholder="아이디">
			</div>
			<div>
				<input type="password" id="pw" name="pw" placeholder="비밀번호">
			</div>
		</div>
		<input type="submit" id ="login" value="로그인"><br>
			<p class="isps">
				<a id="is" class="is">아이디 찾기</a>
				 | 
				<a id="ps" class="ps">비밀번호 찾기</a>
			</p>
			<p class="p">아직 회원이 아니신가요? <a href="signup">회원가입</a></p>
	</form>
</div>
	<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg1">
	<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg2">
	<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg3">
	<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg4">
	<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg5">
	<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg6">
</body>
</html>