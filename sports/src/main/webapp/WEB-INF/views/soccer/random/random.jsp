<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>랜덤 뽑기</title>
		<style type="text/css">
			@font-face{
				font-family: 'HakgyoansimDunggeunmisoTTF-B';
				src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408-5@1.0/HakgyoansimDunggeunmisoTTF-B.woff2') format('woff2');
				font-weight: 700;
				font-style: normal;
			}
			.header_team_logo{
				display: none;
			}
			.main_section{
				margin-top: 40px;
			}
			.random_whole{
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.random_info{
				width: 100%;
				height: auto;
				margin: -10px auto 0 auto;			
			}
			.random_info h1{
				display: flex;
				justify-content: center;
				font-size: 40px;
				line-height: 60px;
				font-weight: bold;
				text-align: center;
				 font-family: 'HakgyoansimDunggeunmisoTTF-B';
				 margin-bottom: 10px;
				 margin-top: 0;
			}
			.random_info h1 span{
				display: block;
				font-size: 40px;
				line-height: 60px;
				font-weight: bold;
				color: #306d3a;
				 font-family: 'HakgyoansimDunggeunmisoTTF-B';
				margin-left: 5px;
			}
			.random_info h1 span:nth-child(3){
				color: #96c59d;
				margin-left: 10px;
			}
			.random_info h1 span:nth-child(5),
			.random_info h1 span:nth-child(6){
				color: #bb0000;
			}
			.random_info h1 span:nth-child(5){
				margin-left: 10px;
			}
			.random_info p{
				font-size: 16px;
				line-height: 24px;
				font-weight: 500;
				color: #999;
				text-align: center;
				margin: 0 auto;
			}
			.random_info p + p{
				margin-top: 5px;
			}
			.random_nav{
				width: 100%;
				height: auto;
				margin: 30px auto 0 auto;
			}
			.random_chk_whole{
				position: relative;
				width: 100%;
				height: auto;
			}
			p.random_bling_txt{
				font-size: 15px;
				line-height: 22px;
				font-weight: 400;
				color: #87ab83;
				text-align: center;
				margin: 10px auto 5px auto;
				animation: bling 2s 3;
			}
			p.random_bling_txt:hover{
				color: #0c400c;
			}
			@keyframes bling{
				0%{
					opacity: 0; 
				}
				100%{
					opacity: 1;
				}
			}
			.random_chk_info{
				position: fixed;
				width: calc(100% - 162px);
				height: auto;
				top: 50%;
				left: 50%;
				transform: translate(-50%,-50%);
				display: none;
				padding: 20px;
				background-color: #f9f9f9;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				z-index: 5;
			}
			.random_chk_whole:hover .random_chk_info{
				display: block;
			}
			
			.random_chk_info button{
				display: block;
				min-width: 100px;
				width: 100px;
				height: 40px;
				border-radius: 5px;
				margin: 10px auto 0 auto;
				color: #f9f9f9;
				background-color: #006400;
				outline: none;
				border: none;
			}
			.random_chk_info button:hover{
				background-color: #0c400c;
			}
			p.select_chk_txt{
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				text-align: start;
				margin-bottom: 10px;
			}
			.random_flex{
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.random_flex label{
				display: block;
				width: max-content;
				height: auto;
				margin: 0;
			}
			.random_flex label + label{
				margin-left: 20px;
			}
			.random_flex label,
			.random_flex label *{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			input[name="random_radio"] + span{
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
			input[name="random_radio"]:hover + span{
				background-color: #87ab8350;
			}
			input[name="random_radio"]:checked + span{
				font-weight: bold;
				color: #f9f9f9;
				background-color: #87ab83;
			}
			.random_content_row{
				width: 100%;
				height: auto;
				margin: 0 auto;
				display: none;
			}
			.random_content_flex{
				width: max-content;
			max-width: 100%;
			display: flex;
			flex-wrap: wrap;
			justify-content: start;
			align-items: center;
			margin: 20px auto 0 auto;
			}
			.random_content_flex label{
				position: relative;
				width: 60px;
				height: auto;
				margin-bottom: 0;
			}
			.random_content_flex label,
			.random_content_flex label *{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.random_content_flex label + label{
				margin-left: 10px;
			}
			input[name="random_content_logo"],
			input[name="random_content_position"]{
				display: none;
			}
			input[name="random_content_logo"] + img{
				width: 100%;
				height: auto;
				border: 2px solid #e1e1e1;
				border-radius: 50px;
			}
			input[name="random_content_position"] + img{
				width: 100%;
				height: auto;
				opacity: 0.2;
			}
			input[name="random_content_logo"]:checked + img{
				border-color: #0c400c;
			}
			input[name="random_content_position"] + img + span{
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
			input[name="random_content_position"]:checked + img + span{
				border-color: #0c400c;
			}
			.random_box{
				position: relative;
				width: 100%;
				max-width: 900px;
				height: auto;
				margin: 20px auto 0 auto;
			}
			.random_img_whole{
				position: relative;
				width: 100%;
				max-width: 400px;
				height: auto;
				margin: 0 auto;
			}
			.random_img_whole img{
				display: block;
				width: 100%;
				height: auto;
				margin: 0 auto;
				background-size: contain;
			}
			img.random_img_handle{
				position: absolute;
				width: 100px;
				height: auto;
				left: 50%;
				 bottom: 75px;
				 transform: translateX(-50%);
			}
			img.random_img_logo{
				position: absolute;
				width: 100px;
				height: auto;
				 top: 110px;
				left: 50%;
				 transform: translateX(-50%);
				z-index: 2;
			}
			.random_img_whole video{
				position: absolute;
				display: block;
				width: 100%;
				height: auto;
				z-index: 1;
			}
			button.random_play_btn{
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
			button.random_play_btn:hover{
				color: #006400;
				background-color: #f9f9f9;
				border-color: #006400;
			}
			#footer{
				z-index: 3;
			}
			.random_pop_bg{
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0,0,0,0.5);
				z-index: 4;
				display: none;
			}
			@media (min-width: 1024px){
				.random_chk_info{
					position: absolute;
					display: block!important;
					width: 200px;
					top: 50%;
					left: auto;
					right: 0;
					transform: translateY(-50%);
				}
				.random_pop_bg{
					display: none!important;
				}
				.random_chk_info button{
					display: none;
				}
				p.random_bling_txt:hover{
					color: #87ab83;
				}
				.random_chk_info{
					z-index: 0;
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
					<p  onclick="infoClick()" class="random_bling_txt">뽑고 싶은 종류를 선택해주세요.(*)</p>
				</div>
				<div class="random_flex">
					<label for="random_radio1">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio1" data-type="all" data-value="all" name="random_radio" value="all" checked hidden="hidden">
						<span>모두</span>
					</label>
					<label for="random_radio2">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio2" data-type="choose" data-value="team" name="random_radio" value="team" hidden="hidden">
						<span>팀</span>
					</label>
					<label for="random_radio3">
						<input type="checkbox" onclick="randomNavClick(this)" id="random_radio3" data-type="choose" data-value="position" name="random_radio" value="position" hidden="hidden">
						<span>포지션</span>
					</label>
				</div>
				<div class="random_content_row random_content_row1">
					<div class="random_content_flex">
						<label for="random_logo_kangwon">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_kangwon" data-id="kangwon" data-type="강원" name="random_content_logo" value="kangwon">
							<img alt="강원 로고 이미지" src="./image/soccer/logo/강원.png">
						</label>
						<label for="random_logo_gwangju">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_gwangju" data-id="gwangju" data-type="광주" name="random_content_logo" value="gwangju">
							<img alt="광주 로고 이미지" src="./image/soccer/logo/광주.png">
						</label>
						<label for="random_logo_gimcheon">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_gimcheon" data-id="gimcheon" data-type="김천" name="random_content_logo" value="gimcheon">
							<img alt="김천 로고 이미지" src="./image/soccer/logo/김천.png">
						</label>
						<label for="random_logo_daegu">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_daegu" data-id="daegu" data-type="대구" name="random_content_logo" value="daegu">
							<img alt="대구 로고 이미지" src="./image/soccer/logo/대구.png">
						</label>
						<label for="random_logo_daejeon">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_daejeon" data-id="daejeon" data-type="대전" name="random_content_logo" value="daejeon">
							<img alt="대전 로고 이미지" src="./image/soccer/logo/대전.png">
						</label>
						<label for="random_logo_seoul">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_seoul" data-id="seoul" data-type="서울" name="random_content_logo" value="seoul">
							<img alt="서울 로고 이미지" src="./image/soccer/logo/서울.png">
						</label>
						<label for="random_logo_suwon">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_suwon" data-id="suwon" data-type="수원" name="random_content_logo" value="suwon">
							<img alt="수원 로고 이미지" src="./image/soccer/logo/수원.png">
						</label>
						<label for="random_logo_ulsan">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_ulsan" data-id="ulsan" data-type="울산" name="random_content_logo" value="ulsan">
							<img alt="울산 로고 이미지" src="./image/soccer/logo/울산.png">
						</label>
						<label for="random_logo_incheon">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_incheon" data-id="incheon" data-type="인천" name="random_content_logo" value="incheon">
							<img alt="인천 로고 이미지" src="./image/soccer/logo/인천.png">
						</label>
						<label for="random_logo_jeonbuk">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_jeonbuk" data-id="jeonbuk" data-type="전북" name="random_content_logo" value="jeonbuk">
							<img alt="전북 로고 이미지" src="./image/soccer/logo/전북.png">
						</label>
						<label for="random_logo_jeju">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_jeju" data-id="jeju" data-type="제주" name="random_content_logo" value="jeju">
							<img alt="제주 로고 이미지" src="./image/soccer/logo/제주.png">
						</label>
						<label for="random_logo_pohang">
							<input type="radio" onclick="randomTeamClick(this)" id="random_logo_pohang" data-id="pohang" data-type="포항" name="random_content_logo" value="pohang">
							<img alt="포항 로고 이미지" src="./image/soccer/logo/포항.png">
						</label>
					</div>
				</div>
				<div class="random_content_row random_content_row2">
					<div class="random_content_flex">
						<label for="random_posi_throw">
							<input type="radio" id="random_posi_throw" data-type="GK" name="random_content_position" value="GK">
							<img alt="축구 로고 이미지" src="./image/soccer/logo/soccer.png">
							<span>GK</span>
						</label>
						<label for="random_posi_catcher">
							<input type="radio" id="random_posi_catcher" data-type="DF" name="random_content_position" value="DF">
							<img alt="축구 로고 이미지" src="./image/soccer/logo/soccer.png">
							<span>DF</span>
						</label>
						<label for="random_posi_inner">
							<input type="radio" id="random_posi_inner" data-type="MF" name="random_content_position" value="MF">
							<img alt="축구 로고 이미지" src="./image/soccer/logo/soccer.png">
							<span>MF</span>
						</label>
						<label for="random_posi_out">
							<input type="radio" id="random_posi_out" data-type="FW" name="random_content_position" value="FW">
							<img alt="축구 로고 이미지" src="./image/soccer/logo/soccer.png">
							<span>FW</span>
						</label>
					</div>
				</div>
			</nav>
			<div class="random_box">
				<div class="random_chk_info">
					<p class="select_chk_txt select_chk_txt1">*모두: 팀, 포지션에 상관 없이 모든 선수들 중 한 명을 랜덤으로 뽑아 드립니다.</p>
					<p class="select_chk_txt select_chk_txt2">*팀: 구단을 선택해주시면 해당 구단의 선수들 중 한 명을 랜덤으로 뽑아 드립니다.</p>
					<p class="select_chk_txt select_chk_txt3">*포지션: 팀에 상관 없이 선택하신 포지션으로 한 명을 랜덤으로 뽑아 드립니다.</p>
					<p class="select_chk_txt select_chk_txt4">*팀 & 포지션: 구단을 선택해주시면 해당 구단의 선수들 중 선택하신 포지션으로 한 명을 랜덤으로 뽑아 드립니다.</p>
				</div>
				<div class="random_img_whole">
					<img alt="로고 이미지" src="./image/soccer/logo/all.png" class="random_img_logo">
					<video class="random_video" id="random_video" muted="muted">
						<source src="./image/soccer/random/soccer.mp4" type="video/mp4">
					</video>
					<img alt="오락기 이미지" src="./image/soccer/random/soccer_random_bg.png" class="random_img_bg">
					<img alt="핸들 이미지" src="./image/soccer/random/soccer_random_handle.png" class="random_img_handle">
					<button type="button" onclick="randomPlay()" class="random_play_btn">뽑기!!</button>
				</div>
			</div>
		</div>
		<div class="random_pop_bg"></div>
	</body>
	<script type="text/javascript">
		function infoClick(){
			var win_wid = window.innerWidth;
			if(win_wid < 1024){
				$('.random_pop_bg').show();
				$('.random_chk_info').show();
			}
		}
		function randomPopHide(){
			$('.random_pop_bg').hide();
			$('.random_chk_info').hide();
		}
		function randomNavClick(ths){
			var randomRadioVal = $('input[name="random_radio"]:checked').val();
			var randomRadioLen = $('input[name="random_radio"]:checked').length;
			var random_type = ths.dataset.type;
			var random_val = ths.dataset.value;

			if(random_type == 'all'){
				$('#random_radio1').prop('checked', true);
				$('#random_radio2').prop('checked', false);
				$('#random_radio3').prop('checked', false);
				$('.random_content_row').hide();
				$('.random_img_logo').attr('src', './image/soccer/logo/all.png');
				$('input[name="random_content_logo"]').prop('checked', false);
				$('input[name="random_content_position"]').prop('checked', false);
			}
			else{
				if(randomRadioLen == 0){
					$('#random_radio1').prop('checked', true);
					$('.random_content_row').hide();
				}
				else{
					$('#random_radio1').prop('checked', false);
				}
				if(random_val == 'team'){
					if($('#random_radio2').is(':checked')){
						$('.random_content_row1').show();
					}
					else{
						$('.random_content_row1').hide();
						$('.random_img_logo').attr('src', './image/soccer/logo/all.png');
						$('input[name="random_content_logo"]').prop('checked', false);
					}
				}
				if(random_val == 'position'){
					if($('#random_radio3').is(':checked')){
						$('.random_content_row2').show();
					}
					else{
						$('.random_content_row2').hide();
					}
				}
			}
		}
		let random_video = document.getElementById('random_video');
		function randomPlay(){
			var randomRadioVal = $('input[name="random_radio"]:checked').val();
			var randomRadioLen = $('input[name="random_radio"]:checked').length;
			var logo_len = $('input[name="random_content_logo"]:checked').length;
			var logo_val = $('input[name="random_content_logo"]:checked').val();
			var posi_len = $('input[name="random_content_position"]:checked').length;
			var posi_val = $('input[name="random_content_position"]:checked').val();
			if(randomRadioLen >= 2){//팀/포지션 모두 선택 시
				if(logo_len <= 0 || posi_len <= 0){
					alertShow('팀, 포지션 선택','팀, 포지션은 반드시 하나씩 선택해주세요.');
				}
				else{
					random_video.play();
					setTimeout(function(){
						location.href = 'SrandomSelectBoth?team='+logo_val+'&position='+posi_val;
					}, 3000);
				}
			}
			else{
				if(randomRadioVal == 'all'){//모두 선택 시
					random_video.play();
					setTimeout(function(){
						location.href = 'SrandomSelectAll';
					}, 3000);
				}
				else if(randomRadioVal == 'team'){//팀 선택 시
					if(logo_len <= 0){
						alertShow('팀 선택','팀은 반드시 하나 선택해주세요.');
					}
					else{
						random_video.play();
						setTimeout(function(){
							location.href = 'SrandomSelectTeam?team='+logo_val;
						}, 3000);
					}
				}
				else if(randomRadioVal == 'position'){//포지션 선택 시
					if(posi_len <= 0){
						alertShow('포지션 선택','포지션은 반드시 하나 선택해주세요.');
					}
					else{
						random_video.play();
						setTimeout(function(){
							location.href = 'SrandomSelectPosition?position='+posi_val;
						}, 3000);
					}
				}
			}
		}
		function randomTeamClick(ths){
			var ths_type = ths.dataset.type;
			$('.random_img_logo').attr('src', './image/soccer/logo/'+ths_type+'.png');
		}
	</script>
</html>