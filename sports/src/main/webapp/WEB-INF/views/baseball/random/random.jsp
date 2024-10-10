<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>랜덤 뽑기</title>
		<style type="text/css">
			@font-face {
			    font-family: 'HakgyoansimDunggeunmisoTTF-B';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408-5@1.0/HakgyoansimDunggeunmisoTTF-B.woff2') format('woff2');
			    font-weight: 700;
			    font-style: normal;
			}
			
			.header_team_logo {
				display: none;
			}
			
			.main_section {
				margin-top: 40px;
			}
			
			
			.random_whole {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			
			.random_info {
				width: 100%;
				height: auto;
				margin: 20px auto 0 auto;			
			}
			
			.random_info h1 {
				display: flex;
				justify-content: center;
				font-size: 40px;
				line-height: 60px;
				font-weight: bold;
				text-align: center;
			    font-family: 'HakgyoansimDunggeunmisoTTF-B';
			    margin-bottom: 10px;
			}
			
			.random_info h1 span {
				display: block;
				font-size: 40px;
				line-height: 60px;
				font-weight: bold;
				color: #306d3a;
			    font-family: 'HakgyoansimDunggeunmisoTTF-B';
				margin-left: 5px;
			}
			
			.random_info h1 span:nth-child(3) {
				color: #96c59d;
				margin-left: 10px;
			}
			
			.random_info h1 span:nth-child(5),
			.random_info h1 span:nth-child(6) {
				color: #bb0000;
			}
			
			.random_info h1 span:nth-child(5) {
				margin-left: 10px;
			}
			
			.random_info p {
				font-size: 16px;
				line-height: 24px;
				font-weight: 500;
				color: #999;
				text-align: center;
				margin: 0 auto;
			}
			
			.random_info p + p {
				margin-top: 5px;
			}


			.random_nav {
				width: 100%;
				height: auto;
				margin: 30px auto 0 auto;
			}
			
			.random_chk_whole {
				position: relative;
				width: 100%;
				height: auto;
			}

			p.random_bling_txt {
				font-size: 15px;
				line-height: 22px;
				font-weight: 400;
				color: #87ab83;
				text-align: center;
				margin: 10px auto 5px auto;
				animation: bling 2s 3;
			}
			
			@keyframes bling {
				0% {
					opacity: 0; 
				}
				100% {
					opacity: 1;
				}
			}
			
			.random_chk_info {
				position: absolute;
				width: calc(100% - 162px);
				height: auto;
				top: 20px;
				left: 50%;
				transform: translateX(-50%);
				display: none;
				padding: 20px;
				background-color: #f9f9f9;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				z-index: 1;
			}
			
			.random_chk_whole:hover .random_chk_info {
				display: block;
			}
			
			p.select_chk_txt {
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				text-align: start;
				margin-bottom: 10px;
			}
			
			.random_flex {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.random_flex label {
				display: block;
				width: max-content;
				height: auto;
				margin: 0;
			}

			.random_flex label + label {
				margin-left: 20px;
			}
			
			.random_flex label,
			.random_flex label * {
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			
			input[name="random_radio"] + span {
				display: block;
				min-width: max-content;
				width: max-content;
				height: auto;
				padding: 8px 30px;
				background-color: #f9f9f9;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				margin: 0;
			}
			
			input[name="random_radio"]:hover + span {
				background-color: #87ab8350;
			}
			
			input[name="random_radio"]:checked + span {
				font-weight: bold;
				color: #f9f9f9;
				background-color: #87ab83;
			}
			
			
			.random_content_row {
				width: 100%;
				height: auto;
				margin: 0 auto;
				display: none;
			}
			
			.random_content_flex {
				width: max-content;
				max-width: 100%;
				display: flex;
				flex-wrap: wrap;
				justify-content: start;
				align-items: center;
				margin: 20px auto 0 auto;
			}
			
			.random_content_flex label {
				position: relative;
				width: 60px;
				height: auto;
				margin-bottom: 0;
			}
			
			.random_content_flex label,
			.random_content_flex label * {
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			
			.random_content_flex label + label {
				margin-left: 10px;
			}
			
			input[name="random_content_logo"],
			input[name="random_content_position"] {
				display: none;
			}
			
			input[name="random_content_logo"] + img {
				width: 100%;
				height: auto;
				border: 2px solid #e1e1e1;
				border-radius: 50px;
			}

			input[name="random_content_position"] + img {
				width: 100%;
				height: auto;
				opacity: 0.2;
			}
			
			input[name="random_content_logo"]:checked + img {
				border-color: #0c400c;
			}
			
			input[name="random_content_position"] + img + span {
				position: absolute;
				display: block;
				width: 100%;
				height: 100%;
				line-height: 64px;
				text-align: center;
				top: 0;
				left: 0;
				border: 2px solid #e1e1e1;
				border-radius: 50px;
			}
			
			input[name="random_content_position"]:checked + img + span {
				border-color: #0c400c;
			}
			
			
			.random_box {
				width: 100%;
				height: auto;
				margin: 20px auto 0 auto;
			}
			
			.random_img_whole {
				position: relative;
				width: 100%;
				max-width: 400px;
				height: auto;
				margin: 0 auto;
			}
			
			.random_img_whole img {
				display: block;
				width: 100%;
				height: auto;
				margin: 0 auto;
				background-size: contain;
			}
			
			img.random_img_handle {
				position: absolute;
				width: 100px;
				height: auto;
				left: 50%;
			    bottom: 75px;
			    transform: translateX(-50%);
			}
			
			img.random_img_logo {
				position: absolute;
				width: 100px;
				height: auto;
			    top: 110px;
				left: 50%;
			    transform: translateX(-50%);
				z-index: 2;
			}
			
			.random_img_whole video {
				position: absolute;
				display: block;
				width: 100%;
				height: auto;
				z-index: 1;
			}
			
			button.random_play_btn {
				position: absolute;
				display: block;
				width: 100px;
				height: 40px;
				color: #f9f9f9;
				font-weight: bold;
				border: 1px solid #f9f9f9;
				background-color: #00640050;
				border-radius: 5px;
				bottom: 65px;
				left: 50%;
				transform: translateX(-50%);
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
				z-index: 2;
			}
			
			button.random_play_btn:hover {
				color: #006400;
				background-color: #f9f9f9;
				border-color: #006400;
			}
			
			
			#footer {
				z-index: 3;
			}
			
			
			
			@media (min-width: 1500px) {
				.random_chk_info {
					display: block;
					position: fixed;
					width: 200px;
					left: auto;
					right: 20px;
					top: 50%;
					transform: translateY(-50%);
				}
			}
		</style>
	</head>
	<body>
		<div class="random_whole">
			<div class="random_info">
				<h1><span>랜</span><span>덤</span> <span>뽑</span><span>기</span></h1>
				<p>어떤 팀을 응원해야 하는지 모르시겠다구요?</p>
				<p>어떤 선수가 있는지 모르시겠다구요?</p>
				<p>저희가 랜덤으로 다!! 뽑아드립니다!</p>
			</div>
			<nav class="random_nav">
				<div class="random_chk_whole">
					<p class="random_bling_txt">뽑고 싶은 종류를 선택해주세요.(*)</p>
					<div class="random_chk_info">
						<p class="select_chk_txt select_chk_txt1">*모두: 팀, 포지션에 상관 없이 모든 선수들 중 한 명을 랜덤으로 뽑아 드립니다.</p>
						<p class="select_chk_txt select_chk_txt2">*팀: 구단을 선택해주시면 해당 구단의 선수들 중 한 명을 랜덤으로 뽑아 드립니다.</p>
						<p class="select_chk_txt select_chk_txt3">*포지션: 팀에 상관 없이 선택하신 포지션으로 한 명을 랜덤으로 뽑아 드립니다.</p>
						<p class="select_chk_txt select_chk_txt4">*팀 & 포지션: 구단을 선택해주시면 해당 구단의 선수들 중 선택하신 포지션으로 한 명을 랜덤으로 뽑아 드립니다.</p>
					</div>
				</div>
				<div class="random_flex">
					<label for="random_radio1">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio1" data-type="all" data-value="all" name="random_radio" value="all" checked hidden>
						<span>모두</span>
					</label>
					<label for="random_radio2">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio2" data-type="choose" data-value="team" name="random_radio" value="team" hidden>
						<span>팀</span>
					</label>
					<label for="random_radio3">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio3" data-type="choose" data-value="position" name="random_radio" value="position" hidden>
						<span>포지션</span>
					</label>
				</div>
				<div class="random_content_row random_content_row1">
					<div class="random_content_flex">
						<label for="random_logo_kia">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_kia" data-id="kia" data-type="KIA" name="random_content_logo" value="kia">
							<img alt="기아 로고 이미지" src="./image/baseball/logo/KIA.png">
						</label>
						<label for="random_logo_kt">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_kt" data-id="kt" data-type="KT" name="random_content_logo" value="kt">
							<img alt="KT 로고 이미지" src="./image/baseball/logo/KT.png">
						</label>
						<label for="random_logo_lg">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_lg" data-id="lg" data-type="LG" name="random_content_logo" value="lg">
							<img alt="LG 로고 이미지" src="./image/baseball/logo/LG.png">
						</label>
						<label for="random_logo_nc">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_nc" data-id="nc" data-type="NC" name="random_content_logo" value="nc">
							<img alt="NC 로고 이미지" src="./image/baseball/logo/NC.png">
						</label>
						<label for="random_logo_ssg">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_ssg" data-id="ssg" data-type="SSG" name="random_content_logo" value="ssg">
							<img alt="SSG 로고 이미지" src="./image/baseball/logo/SSG.png">
						</label>
						<label for="random_logo_doosan">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_doosan" data-id="doosan" data-type="두산" name="random_content_logo" value="doosan">
							<img alt="두산 로고 이미지" src="./image/baseball/logo/두산.png">
						</label>
						<label for="random_logo_lotte">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_lotte" data-id="lotte" data-type="롯데" name="random_content_logo" value="lotte">
							<img alt="롯데 로고 이미지" src="./image/baseball/logo/롯데.png">
						</label>
						<label for="random_logo_samsung">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_samsung" data-id="samsung" data-type="삼성" name="random_content_logo" value="samsung">
							<img alt="삼성 로고 이미지" src="./image/baseball/logo/삼성.png">
						</label>
						<label for="random_logo_kiwoom">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_kiwoom" data-id="kiwoom" data-type="키움" name="random_content_logo" value="kiwoom">
							<img alt="키움 로고 이미지" src="./image/baseball/logo/키움.png">
						</label>
						<label for="random_logo_hanwha">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_hanwha" data-id="hanwha" data-type="한화" name="random_content_logo" value="hanwha">
							<img alt="한화 로고 이미지" src="./image/baseball/logo/한화.png">
						</label>
					</div>
				</div>
				<div class="random_content_row random_content_row2">
					<div class="random_content_flex">
						<label for="random_posi_throw">
							<input type="radio" id="random_posi_throw" data-id="throw" data-type="투수" name="random_content_position" value="투수">
							<img alt="야구 로고 이미지" src="./image/baseball/logo/baseball.png">
							<span>투수</span>
						</label>
						<label for="random_posi_catcher">
							<input type="radio" id="random_posi_catcher" data-id="catcher" data-type="포수" name="random_content_position" value="포수">
							<img alt="야구 로고 이미지" src="./image/baseball/logo/baseball.png">
							<span>포수</span>
						</label>
						<label for="random_posi_inner">
							<input type="radio" id="random_posi_inner" data-id="inner" data-type="내야수" name="random_content_position" value="내야수">
							<img alt="야구 로고 이미지" src="./image/baseball/logo/baseball.png">
							<span>내야수</span>
						</label>
						<label for="random_posi_out">
							<input type="radio" id="random_posi_out" data-id="out" data-type="외야수" name="random_content_position" value="외야수">
							<img alt="야구 로고 이미지" src="./image/baseball/logo/baseball.png">
							<span>외야수</span>
						</label>
					</div>
				</div>
			</nav>
			<div class="random_box">
				<div class="random_img_whole">
					<img alt="로고 이미지" src="./image/baseball/logo/all.png" class="random_img_logo">
					<video class="random_video" id="random_video" muted="muted">
						<source src="./image/baseball/random/baseball.mp4" type="video/mp4">
					</video>
					<img alt="오락기 이미지" src="./image/baseball/random/baseball_random_bg.png" class="random_img_bg">
					<img alt="핸들 이미지" src="./image/baseball/random/baseball_random_handle.png" class="random_img_handle">
					<button type="button" onclick="randomPlay()" class="random_play_btn">뽑기!!</button>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function randomNavClick(ths) {
			var randomRadioVal = $('input[name="random_radio"]:checked').val();
			var randomRadioLen = $('input[name="random_radio"]:checked').length;
			var random_type = ths.dataset.type;
			var random_val = ths.dataset.value;

			if(random_type == 'all') {
				$('#random_radio1').prop('checked', true);
				$('#random_radio2').prop('checked', false);
				$('#random_radio3').prop('checked', false);
				$('.random_content_row').hide();
			}
			else {
				if(randomRadioLen == 0) {
					$('#random_radio1').prop('checked', true);
					$('.random_content_row').hide();
				}
				else {
					$('#random_radio1').prop('checked', false);
					
					if(random_val == 'team') {
						if($('#random_radio2').is(':checked')) {
							$('.random_content_row1').show();
						}
						else {
							$('.random_content_row1').hide();
						}
					}
					else {
						if($('#random_radio3').is(':checked')) {
							$('.random_content_row2').show();
						}
						else {
							$('.random_content_row2').hide();
						}
					}
				}
			}
		}

		let random_video = document.getElementById('random_video');
		function randomPlay() {
			var randomRadioVal = $('input[name="random_radio"]:checked').val();
			var randomRadioLen = $('input[name="random_radio"]:checked').length;
			var logo_len = $('input[name="random_content_logo"]:checked').length;
			var logo_val = $('input[name="random_content_logo"]:checked').val();
			var posi_len = $('input[name="random_content_position"]:checked').length;
			var posi_val = $('input[name="random_content_position"]:checked').val();
			
			if(randomRadioLen >= 2) {//팀/포지션 모두 선택 시
				if(logo_len <= 0 || posi_len == 'position') {
					alertShow('팀, 포지션 선택','팀, 포지션은 반드시 하나씩 선택해주세요.');
				}
				else {
					random_video.play();
					setTimeout(function() {
						location.href = 'randomSelectBoth?team='+logo_val+'&position='+posi_val;
					}, 4500);
				}
			}
			else {
				if(randomRadioVal == 'all') {//모두 선택 시
					random_video.play();
					setTimeout(function() {
						location.href = 'randomSelectAll';
					}, 4500);
				}
				else if(randomRadioVal == 'team') {//팀 선택 시
					if(logo_len <= 0) {
						alertShow('팀 선택','팀은 반드시 하나 선택해주세요.');
					}
					else {
						random_video.play();
						setTimeout(function() {
							location.href = 'randomSelectTeam?team='+logo_val;
						}, 4500);
					}
				}
				else if(randomRadioVal == 'position') {//포지션 선택 시
					if(posi_len <= 0) {
						alertShow('포지션 선택','포지션은 반드시 하나 선택해주세요.');
					}
					else {
						random_video.play();
						setTimeout(function() {
							location.href = 'randomSelectPosition?position='+posi_val;
						}, 4500);
					}
				}
			}
		}
		
		function randomTeamClick(ths) {
			var ths_type = ths.dataset.type;
			$('.random_img_logo').attr('src', './image/baseball/logo/'+ths_type+'.png');
		}
	</script>
</html>