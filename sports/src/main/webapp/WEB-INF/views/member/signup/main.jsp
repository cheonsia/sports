<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			#body{
				width: 100%;
				background: #b0c4b010;
			}
			.side_rightbar_whole,
			.header_team_logo.scroll_div{
				display: none;
			}
			#footer{
			     width: calc(100vw - 40px);
			}
			.main_section{
				max-width: 600px;
			}
			.main_section h1{
				font-size: 40px;
				line-height: 56px;
				text-align: center;
				margin: 0 auto 20px auto;
			}
			.main_section p{
				font-size: 16px;
				line-height: 24px;
				color: #999;
				text-align: center;
				margin: 0 auto 50px auto;
			}
			.find-btn{
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.w-btn{
			    position: relative;
			    border: 1px solid #006400;
			    display: block;
			    width: 100%;
			    max-width: 300px;
			    font-size: 20px;
			    line-height: 38px;
			    font-weight: 400;
			    color: #0c400c;
			    padding: 60px 30px;
			    border-radius: 10px;
			    text-decoration: none;
			    transition: 0.25s;
			    background-color: #ffffff95;
			    margin: 0 auto;
			}
			.w-btn:hover{
			    background-color: #00640020;
			}
			.w-btn + .w-btn{
				margin-top: 30px;
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
		<h1>회원 가입</h1>
		<p>회원가입 방식을 선택해주세요.</p>
		<div class="find-btn">
			<button onclick="location.href='signupForm?part=일반'" class="w-btn" type="button">일반 회원</button>
	    	<button onclick="location.href='signupForm?part=감독'" class="w-btn" type="button">감독 회원</button>
		</div>
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg1">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg2">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg3">
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg4">
		<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg5">
		<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg6">
	</body>
</html>