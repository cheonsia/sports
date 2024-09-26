<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<style type="text/css">
			#top,
			#footer {
				display: none;
			}
			
			.header_top_inner {
				justify-content: end;
			}
			
			
			#body {
				width: 100%;
				min-height: 100vh;
			    padding: 0;
			}
			
			.main_section {
				width: 100%;
				max-width: none;
				margin-top: 0;
			}
			
			.index_choose_whole {
				position: relative;
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.index_choose_top {
				position: fixed;
				width: max-content;
				height: auto;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				z-index: 1;
				padding: 20px 30px;
		        background: transparent;
			}
			
			.index_choose_flex {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
			}
			
			.index_choose_flex a {
				display: block;
				min-width: 120px;
				width: 100%;
				max-width: 120px;
				height: 40px;
				background-color: #00000090;
				font-size: 16px;
				line-height: 42px;
				font-weight: 400;
				color: #f9f9f9;
				text-align: center;
				border-radius: 5px;
			}
			
			.index_choose_flex a + a {
				margin-left: 10px;
			}
			
			
			.index_choose_flex a:hover {
				background-color: #0c400c;
			}
			
			.index_choose_inner {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				flex-direction: column;
			}
			
			.index_choose_box {
				position: relative;
				width: 100%;
				height: 50vh;
			}
			
			.index_choose_box p {
				position: absolute;
				display: none;
				width: max-content;
				height: auto;
				font-size: 20px;
				line-height: 29px;
				font-weight: 500;
				color: #f9f9f9;
				text-align: center;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				z-index: 1;
			}
			
			.index_choose_box span {
				position: absolute;
				display: block;
				width: 100%;
				height: 100%;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255,255,255,0.2);
			}
			
			.index_choose_box:hover p {
				display: block;
			}
				
			.index_choose_box:hover span {
				background: rgba(0, 0, 0, 0.5);
			}

			.index_choose_box img {
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
			
			.index_choose_box.index_choose_soccer,
			.index_choose_box.index_choose_soccer * {
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			
			.index_choose_box.index_choose_baseball,
			.index_choose_box.index_choose_baseball * {
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			
			
			@media (min-width: 1024px) {
				.index_choose_top {
					top: auto;
					bottom: 10%;
				}
			
				.index_choose_flex {
					width: max-content;
					flex-direction: column;
					margin: 0 auto;
				}
				
				.index_choose_flex a {
					min-width: 160px;
					max-width: 160px;
				}
				
				.index_choose_flex a + a {
					margin: 20px auto 0 auto;
				}
			
				.index_choose_inner {
					flex-direction: row;
				}
				
				.index_choose_box {
					height: 100vh;
				}
				
				.index_choose_box span {
					display: block;
				}
			}
		</style>
	</head>
	<body>
		<div class="index_choose_whole">
			<div class="index_choose_top">
				<div class="index_choose_flex">
					<a href="login">로그인</a>
					<a href="signup">회원가입</a>
				</div>
			</div>
			<div class="index_choose_inner">
				<div class="index_choose_box index_choose_soccer" onclick="location.href='soccermain'">
					<span></span>
					<p>
						축구 페이지로 가기
					</p>
					<img src="./image/soccer/icon/soccer_bg.png" alt="축구 배경">
				</div>
				<div class="index_choose_box index_choose_baseball" onclick="location.href='baseballmain'">
					<span></span>
					<p>
						야구 페이지로 가기
					</p>
					<img src="./image/baseball/icon/baseball_bg.png" alt="야구 배경">
				</div>
			</div>
		</div>
	</body>
</html>