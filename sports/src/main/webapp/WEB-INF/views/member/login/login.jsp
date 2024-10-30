<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<style type="text/css">
			.side_rightbar_whole,
			.header_team_logo.scroll_div{
				display: none;
			}
			#body{
				width: 100%;
			}
			#footer{
				width: calc(100vw - 40px);
			}
			.main_section{
				width: 100%;
			}
			.isps,
			.is,
			.ps{
				font-size: 13px;
				color: #777;
				text-align: center;
			}
			.isps span{
				font-size: 13px;
				color: #00640070;
				text-align: center;
				margin: 0 10px;
			}
			.is:hover ,.ps:hover{
				color: #777;
			}
			.p{
				text-align: center;
				margin: 10px 0 20px 0;
			}
			.p a{
				color: #0c400c;
			}
			
			.loginValue{
				width: 300px;
				margin: 30px auto;
			}
			.loginValue div{
				position: relative;
				display: flex;
			}
			.loginValue label{
				width: 150px;
				max-width: 150px;
			}
			.loginValue input{
				width: calc(100% - 2px);
				border: 1px solid #e8e8e8;
				background-color: #ffffff20;
				height: 60px;
				margin-bottom: 10px;
				border-radius: 10px;
			}
			.loginValue input:focus{
				width: calc(100% - 4px);
				height: 58px;
			}
			.loginValue div p{
				display: none;
				position: absolute;
				width: max-content;
				height: auto;
				padding: 0 5px;
				background-color: #fff;
				top: -10px;
				left: 50%;
				transform: translateX(-50%);
			}
			.loginValue input:focus + p{
				display: block;
			}
			#login{
				margin : 20px auto 5px auto;
				display: block;
				width: 22%;
				padding: 5px 0;
				border-radius: 10px;
				box-sizing: border-box;
				border: 1px solid #08750e20;
				background-color: #08750e90;
				color: white;
				transition: background-color 0.5s;
				width: 300px;
				height: 50px;
			}
			#login:hover{
				border-color: #08750e;
				background-color: #ffffff;
				color: black;
			}
			.div_form{
				border: 2px solid #08750e90;
				margin: 80px auto 0 auto;
				border-radius: 25px;
				width: 500px;
				padding: 50px 0;
			}
			#id:focus,
			#pw:focus{
				border: 2px solid #006d4a;
			}
			.div_form h1{
				margin: 0;
				font-size: 38px;
				color: #0c400c;
			}
			h1{
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
		<script type="text/javascript">
			function click_btn(){
				if(window.event.keyCode == 13){
					$('#login').click();
				}
			};
			$(document).ready(function(){
				$('#id').focus();
				$('#login').click(function(){
					var id = $("#id").val();
					var pw = $("#pw").val();
					if(id==""){
						alert('아이디를 입력해주세요.');
						$('#id').focus();
						return false;
					}
					else if(pw==""){
						alert('비밀번호를 입력해주세요.');
						$('#pw').focus();
						return false;
					}
					$.ajax({
						type:"post",
						url:"loginCheck",
						async:true,
						data:{"id":id,"pw":pw},
						success:function(data){
							if(data == "0"){
								alert('아이디 혹은 비밀번호가 틀립니다');						
							}else if(data == "1"){
								alert("관리자 권한으로 차단한 계정입니다.\n추가 문의사항은 게시판을 이용해주세요.");
							}else if(data == "2"){
								alert("관리자의 승인이 필요한 계정입니다.");
							}else{
								alert(data);
								location.href='main';
							}
						},
						error:function(){
							alert("에러");
						}
					});
				});
				////아이디 찾기 팝업창
				$('#is').click(function(){
					var windowFeatures = "top=300, popup=yes";
					var popup = window.open("idsearch", "_blank",windowFeatures);
					popup.resizeTo(650,500);	
				});
				////비밀번호 찾기 팝업창
				$('#ps').click(function(){
					var windowFeatures = "top=300, popup=yes";
					var pwpopup = window.open("pwsearch", "_blank",windowFeatures);
					pwpopup.resizeTo(650,500);	
				});
			});
		</script>
	</head>
	<body>
		<div class="div_form">
			<h1>IN:OUT</h1>
			<div class="loginValue">
				<div>
					<input type="text" id="id" name="id" placeholder="아이디" onkeyup="click_btn()">
					<p>아이디</p>
				</div>
				<div>
					<input type="password" id="pw" name="pw" placeholder="비밀번호" onkeyup="click_btn()">
					<p>비밀번호</p>
				</div>
			</div>
			<input type="button" id ="login" value="로그인"><br>
			<p class="isps">
				<a id="is" class="is">아이디 찾기</a>
				<span>|</span>
				<a id="ps" class="ps">비밀번호 찾기</a>
			</p>
			<p class="p">아직 회원이 아니신가요? <a href="signup">회원가입</a></p>
		</div>
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg1">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg2">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg3">
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg4">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg5">
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg6">
	</body>
</html>