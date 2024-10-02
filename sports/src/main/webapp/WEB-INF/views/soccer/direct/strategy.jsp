<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>코치 전략페이지</title>
		<style type="text/css">
			#body {
				background-color: #006e00;
			}
		
			.header_team_logo {
				display: none;
			}
			
			.main_section {
				position: relative;
				width: 100%;
				height: calc(100vh - 180px);
				margin: 0 auto;
			}
		
			.strategy_whole {
				width: 100%;
				height: 100%;
				margin: 0 auto;
				overflow: auto;
			}
			
			.strategy_inner {
				width: 100%;
				height: 100%;
				margin: 0 auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: space-between;
				align-items: stretch;
			}
			
			.strategy_side_whole {
				min-width: 200px;
				width: 100%;
				max-width: 200px;
				height: auto;
				background-color: #ddd;
			}

			.strategy_img_box {
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 15px auto;
			}
			
			.strategy_img {
				min-width: 50px;
				width: 50px;
				height: 50px;
				margin: 0 10px 0 0;
			}
			
			.strategy_img img {
				display: block;
				width: 100%;
				height: auto;
				background-size: contain;
			}
			
			h1.strategy_title {
				font-size: 32px;
			    line-height: 48px;
			    font-weight: bold;
			    text-align: center;
			    color: #3d3d3d;
				margin: 0;
				background: transparent;
				padding: 0;
			}
			
			p.strategy_vs_txt {
				font-size: 18px;
				line-height: 80px;
				font-weight: bold;
				color: #ddd;
				text-align: center;
				margin: 0 40px;
			}
			
			
			/*훈련 인원 선택*/
			.traning_people_inner {
				width: 100%;
				margin: 0 auto;
			}
			
			p.traning_choose_pop_title {
				font-size: 17px;
				line-height: 28px;
				color: #777;
				text-align: center;
				margin: 0 auto;
			}
			
			p.traning_choose_pop_title2 {
				font-size: 17px;
				line-height: 28px;
				color: #777;
				text-align: center;
				margin: 0 auto;
			}
			
			.traning_people_choose {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 0 auto;
			}
			
			.traning_people_choose label {
				display: block;
				width: max-content;
				max-width: 100%;
				margin: 0;
			}
			
			.traning_people_choose label + label {
				margin-left: 10px;
			}
			
			input[name="traning_people_select"] + span {
				min-width: auto;
				width: max-content;
				max-width: 100%;
				padding: 10px 20px;
				background-color: #fff;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				margin: 0;
			}
			
			input[name="traning_people_select"]:checked + span {
				color: #f9f9f9;
			}
			
			p.no_data_txt {
				padding-top: 20px;
			}
			
			/*선수명단 label*/
			.traning_people_list {
				width: 100%;
				height: auto;
				margin: 0 auto;
			    max-height: calc(100vh - 333px);
			    overflow: hidden;
			    overflow-y: auto;
			}
			
			.traning_people_list:-webkit-scrollbar {
				display: none;
			}
			
			.traning_people_list div {
				display: flex;
				flex-wrap: wrap;
				justify-content: start;
				align-items: stretch;
			}
			
			.traning_people_list div div {
				width: calc(50% - 20px);
				max-width: 100px;
				height: auto;
				margin: 20px 10px 0 10px;
			}
			
			.traning_people_list div div label {
				width: 100%;
				height: 100%;
				max-height: 100px;
			}
			
			input[name="traning_player_choose"] + span {
				position: relative;
				display: block;
				width: calc(100% - 4px);
				height: calc(100% - 4px);
				background-color: transparent;
				border: 2px solid #e1e1e1;
				border-radius: 50vw;
				overflow: hidden;
			}
			
			input[name="traning_player_choose"]:checked + span {
				border-color: #0c400c;
				background-color: #0c400c10;
			}
			
			input[name="traning_player_choose"] + span > img.player_img {
			    display: block;
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			    margin: 0 auto;
			}
			
			input[name="traning_player_choose"] + span > img.player_chk_img {
				position: absolute;
				min-width: 50px;
				width: 50px;
				height: 50px;
				background-size: contain;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				display: none;
			}
			
			input[name="traning_player_choose"]:checked + span > img.player_chk_img {
				display: block;
			}
			
			.traning_people_list div p {
				text-align: center;
				margin: 0 auto 20px auto;
			}
			
			
			/*전략 이미지*/
			.strategy_box {
				position: relative;
				width: 100%;
				height: auto;
			}
			
			.strategy_box form {
				min-width: 1200px;
				width: 1200px;
				max-width: 1200px;
				height: 740px;
				overflow: hidden;
				margin: 0 auto 0 0;
			}
			
			.strategy_box img.strategy_bg {
				position: absolute;
				display: block;
				min-width: 1000px;
				width: max-content;
				height: auto;
				background-size: contain;
				margin: auto;
				top: 0;
				left: 0;
			}
			
			.strategy_map {
				position: relative;
				width: 100%;
				height: 100%;
				z-index: 1;
				margin: 0 auto 0 0;
			}
			
			.player_box {
				position: absolute;
				width: 100px;
				height: 100px;
				border: 5px solid #0c400c;
				background-color: #ffffff;
				border-radius: 70px;
				overflow: hidden;
			}
			
			.player_box img {
				display: block;
				width: 100%;
				height: auto;
				background-size: contain;
			}
			
			
			/*저장/초기화 버튼*/
			.strategy_btn_flex {
				position: absolute;
				width: 100%;
				max-width: 1200px;
				height: auto;
				bottom: 0;
				left: 0;
				transition: 0.5s;
				z-index: -1;
			}
			
			.strategy_btn_flex.btn_on {
				bottom: 20px;
				transition: 0.5s;
				z-index: 2;
			}
			
			.strategy_btn_flex div {
				width: 100%;
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
			}
			
			.strategy_btn {
				display: block;
				min-width: 100px;
				width: 100px;
				height: 40px;
				color: #f9f9f9;
				border: 1px solid transparent;
				border-radius: 5px;
			}
			
			.strategy_btn + .strategy_btn {
				margin-left: 20px;
			}
			
			.strategy_btn.strategy_btn_reset {
				border-color: #bb0000;
				background-color: #00000050;
			}
			
			.strategy_btn.strategy_btn_reset:hover {
				background-color: #bb0000;
			}
			
			.strategy_btn.strategy_btn_submit {
				border-color: #f9f9f9;
				background-color: #00000050;
			}
			
			.strategy_btn.strategy_btn_submit:hover {
				border-color: #0c400c;
				background-color: #0c400c;
			}
			
			.strategy_btn.strategy_btn_cancel {
				color: #bb0000;
				border-color: #bb0000;
				background-color: #f9f9f9;
			}
			
			.strategy_btn.strategy_btn_cancel:hover {
				color: #f9f9f9;
				background-color: #bb0000;
			}
			
			.strategy_save_flex .strategy_btn.strategy_btn_submit {
				border-color: #006400;
				background-color: #006400;
			}
			
			.strategy_save_flex .strategy_btn.strategy_btn_submit:hover {
				border-color: #0c400c;
				background-color: #0c400c;
			}
			
			.strategy_btn:disabled {
				opacity: 0.3!important;
				border-color: #e1e1e1!important;
				background: #000!important;
				color: #fff!important;
			}
			
			.strategy_btn:disabled:hover {
				opacity: 0.3!important;
				border-color: #e1e1e1!important;
				background: #000!important;
				color: #fff!important;
			}
			
			
			
			/*전략 이름 팝업*/
			.strategy_save_whole {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: -100vh;
				left: 0;
				transition: 0.5s;
				z-index: 4;
			}
			
			.strategy_save_whole.strategy_on {
				bottom: 0;
				transition: 0.5s;
			}
			
			.strategy_save_bg {
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0, 0, 0, 0.5);
				z-index: 3;
				display: none;
			}
			
			.strategy_save_box {
				position: absolute;
				width: calc(100% - 100px);
				max-width: 460px;
				height: auto;
				background-color: #f9f9f9;
				border-radius: 10px;
				padding: 20px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			
			.strategy_save_box p {
				font-size: 18px;
				line-height: 27px;
				font-weight: 400;
				color: #3d3d3d;
				text-align: center;
				margin: 0 auto 10px auto;
			}
			
			.strategy_save_box input {
				width: calc(100% - 22px);
				height: 38px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
			}
			
			.strategy_save_flex {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 10px auto 0 auto;
			}
			
			
			
			
			/*전략 이름 팝업*/
			.strategy_list_whole {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: -100vh;
				left: 0;
				transition: 0.5s;
				z-index: 4;
			}
			
			.strategy_list_whole.list_on {
				bottom: 0;
				transition: 0.5s;
			}
			
			.strategy_list_box {
				position: absolute;
				width: calc(100% - 100px);
				max-width: 460px;
				height: auto;
				background-color: #f9f9f9;
				border-radius: 10px;
				padding: 20px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			
			p.strategy_list_title {
				font-size: 18px;
				line-height: 27px;
				font-weight: bold;
				color: #3d3d3d;
				text-align: center;
				margin: 0 auto 10px auto;
			}
			
			p.strategy_list_subtitle {
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				text-align: center;
				margin: 0 auto;
			}
			
			span.strategy_list_line {
				display: block;
				width: 100px;
				height: 1px;
				background-color: #006400;
				margin: 30px auto 20px auto;
			}
			
			.strategy_list_row {
				width: calc(100% - 40px);
				height: auto;
				padding: 10px 20px;
				display: flex;
				justify-content: space-between;
				align-items: center;
				border-bottom: 1px solid #ddd;
			}
			
			.strategy_list_row p {
				font-size: 16px;
				line-height: 24px;
				font-weight: bold;
				color: #3d3d3d;
			}
			
			.strategy_list_row p + p {
				font-weight: 400;
				color: #999;
			}
			
			.common_alert_box {
				max-height: calc(100vh - 100px);
				overflow: auto;
			}
			
			
			/*전략 삭제*/
			.strategy_delete_whole {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: -100vh;
				left: 0;
				transition: 0.5s;
				z-index: 4;
			}
			
			.strategy_delete_whole.delete_on {
				bottom: 0;
				transition: 0.5s;
			}
			
			.strategy_delete_bg {
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0, 0, 0, 0.5);
				z-index: 3;
				display: none;
			}
			
			.strategy_delete_box {
				position: absolute;
				width: calc(100% - 100px);
				max-width: 460px;
				height: auto;
				background-color: #f9f9f9;
				border-radius: 10px;
				padding: 20px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			
			.strategy_delete_box p {
				font-size: 18px;
				line-height: 27px;
				font-weight: bold;
				color: #3d3d3d;
				text-align: center;
				margin: 0 auto;
			}
			
			.strategy_delete_box p + p {
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #999;
				margin-top: 20px;
			}
			
			.strategy_delete_flex {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				width: 100%;
				height: auto;
				margin: 40px auto 0 auto;
			}
			
			.strategy_delete_btn {
				display: block;
				width: 100px;
				height: 40px;
				background-color: #fff;
				border: 1px solid transparent;
				margin: 0;
				border-radius: 5px;
			}
			
			.strategy_delete_btn + .strategy_delete_btn {
				margin-left: 20px;
			}
			
			.strategy_delete_btn.delete_btn_no {
				color: #bb0000;
				border-color: #bb0000;
			}
			
			.strategy_delete_btn.delete_btn_no:hover {
				color: #911818;
				border-color: #911818;
				background-color: #91181820;
			}
			
			.strategy_delete_btn.delete_btn_ok {
				color: #f9f9f9;
				background-color: #bb0000;
			}
			
			.strategy_delete_btn.delete_btn_ok:hover {
				background-color: #7d0d0d;
			}


			
			
			@media (min-width: 1250px) {
				.main_section {
					max-width: none;
					height: calc(100vh - 130px);
				}
				
				/*선수명단 label*/
				.traning_people_list {
				    height: calc(100vh - 283px);
				    max-height: calc(100vh - 283px);
				}
			}
		</style>
		<script type="text/javascript">
	        /*오늘 날짜가 기본으로 뜨게(추후 불러오기하면 첫 저장 날짜로 뜸)*/
			$(function() {
		        var nowDate = new Date();
		        var todayDate = new Date();
		        var td_year = todayDate.getFullYear();
		        var td_month = todayDate.getMonth() + 1;
		        var td_day = todayDate.getDate();
		        $('.traning_choose_pop_title3').text(td_year+'-'+('0'+td_month).slice(-2)+'-'+td_day);
			});
			
	        /*좌측 이미지 클릭하면 배열 및 경기장 위에 저장*/
	        var people_array = [];
	        function peopleChoose(ths) {
	        	var people_chk_len = $('input[name="traning_player_choose"]:checked').length;
	        	
	        	//선택된 선수 및 번호 배열에 넣기
	        	var ths_val = $(ths).val();//이름
        		var ths_num = ths.dataset.type;//선수 번호
        		var ths_img = ths.dataset.image;//선수 이미지
        		if($(ths).is(':checked')) {//체크했을 때
   	        		people_array.push(ths_val, ths_num, ths_img, 0, 0);//배열에 선수 이름, 번호, x, y 좌표 저장
   	        		var people_div = "";
   	        		people_div += "<div id='player_num" + ths_num + "' data-id='player_num" + ths_num + "' class='player_box' onmousedown='playerDragStart(this, event)' data-number='" + ths_num + "'>";
   	        		people_div += "	<img src='./image/soccer/player/" + ths_img + "' alt='" + ths_val + " 이미지'>";
   	        		people_div += "</div>";
   	        		$('.strategy_map').append(people_div);
   	        		$('.strategy_btn_flex').addClass('btn_on');
        		}
        		else {//체크 해제시
        			var people_num = people_array.indexOf(ths_num);
        			people_array.splice((people_num - 1), 5);
        			$('#player_num'+ths_num).remove();
        			if(people_chk_len <= 0) {
	   	        		$('.strategy_btn_flex').removeClass('btn_on');
        			}
        		}
        		$('#chked_member_val').attr('value', people_array);
	        	$('#strategy_btn_change').prop('disabled', false);
	        	$('#strategy_btn_change').addClass('strategy_btn_change');
	        };

	        /*이미지 드래그*/
	        var isDrag = false;
	        function playerDragStart(ths, event) {
	        	isDrag = true;
	        	var ths_id = ths.dataset.id;
	        	var ths_status = ths.dataset.status;
	        	$('#drag_id').attr('value', ths_id);
	        	$('#drag_status').attr('value', ths_status);
			}

	        function playerDragMove(ths, event) {
	        	if(isDrag) {
	        		var win_wid = window.innerWidth;
	        		var ths_type = $('#drag_status').val();
		        	var drag_id = $('#drag_id').val();
		        	var event_x;
		        	var event_y;
		        	
	        		var ths_num = $('#'+drag_id).attr('data-number');//선수 번호
        			var people_num = people_array.indexOf(ths_num);

		        	if(win_wid >= 1250) {
			        	event_x = (event.clientX - 445);
			        	event_y = (event.clientY - 95);
		        	}
		        	else {
			        	event_x = (event.clientX - 245);
			        	event_y = (event.clientY - 145);
		        	}
		        	
		        	//드래그 위치 옮김
					$("#"+drag_id).css('top', event_y);
					$("#"+drag_id).css('left', event_x);
					
					//이동하면서 배열에 x, y값 할당
	        		people_array[people_num+2] = event_x;
	        		people_array[people_num+3] = event_y;
	        		$('#chked_member_val').attr('value', people_array);
	        	}
			}

	        function playerDragEnd() {
	        	isDrag = false;
	        	$('#strategy_btn_change').prop('disabled', false);
	        	$('#strategy_btn_change').addClass('strategy_btn_change');
			}

	        /*전략 초기화*/
	        function strategyReset() {
	        	people_array = [];
	        	$('#chked_member_val').attr('value', '');
	        	$('.player_box').remove();
	        	$('input[name="traning_player_choose"]').prop('checked', false);
			}

	        /*전략 저장 팝업*/
	        function strategyShow() {
				$('body').css('overflow', 'hidden');
				$('.strategy_save_bg').show();
				$('.strategy_save_whole').addClass('strategy_on');
			}
	        
	        function strategyHide() {
				$('body').css('overflow', 'auto');
				$('.strategy_save_whole').removeClass('strategy_on');
				setTimeout(function() { 
					$('.strategy_save_bg').hide();
				}, 350);
			}
	        
	        /*전략 저장*/
	        function strategyChk() {
				var strategy_val = $('input[name="strategy_name"]').val();
				if(strategy_val == '') {
					$('input[name="strategy_name"]').attr('value', '제목 없음');
				}
				
				$('#strategy_form').submit();
			}
	        
	        /*전략 불러오기 전 리스트 띄워주는 페이지*/
	        function strategyListShow() {
				$('body').css('overflow', 'hidden');
				$('.strategy_save_bg').show();
				$('.strategy_list_whole').addClass('list_on');
			}
	        
	        function strategyListHide() {
				$('body').css('overflow', 'auto');
				$('.strategy_save_bg').hide();
				$('.strategy_list_whole').removeClass('list_on');
			}

	        /*전략 불러오기*/
			function strategyListLoad(ths) {
				var area_eng = $('input[name="area_eng"]').val();
				var area_kor = $('input[name="area_kor"]').val();
				var stnum = ths.dataset.number;

				if($('#strategy_btn_flex').hasClass('btn_on') || $('#strategy_btn_change').hasClass('strategy_btn_change')) {
					strategyListHide();
					strategyShow();
				}
				else {
					location.href="strategyListFind?name="+area_eng+"&area="+area_kor+"&stnum="+stnum;
				}
			}
			
			/*전략 삭제*/
			function strategyDeleteShow() {
				$('body').css('overflow', 'hidden');
				$('.strategy_delete_whole').addClass('delete_on');
				$('.strategy_delete_bg').show();
			}
			
			function strategyDeleteHide() {
				$('body').css('overflow', 'auto');
				$('.strategy_delete_whole').removeClass('delete_on');
				setTimeout(function() { 
					$('.strategy_delete_bg').hide();
				}, 350);
			}
			
			function strategyDeleteOk() {
				var strategy_stnum = $('input[name="strategy_stnum"]').val();
				var area_kor = $('input[name="area_kor"]').val();
				var area_eng = $('input[name="area_eng"]').val();
				location.href="soccerStrategyDelete?name=" + area_eng + "&area=" + area_kor + "&stnum="+strategy_stnum;
			}
	        
	        /*전략 수정*/
	        function strategyChk2() {
				var strategy_val = $('input[name="strategy_name"]').val();
				if(strategy_val == '') {
					$('input[name="strategy_name"]').attr('value', '제목 없음');
				}
				
				$('#strategy_form_update').submit();
			}
	        
	        /*새로운 전략으로*/
	        function newStrategyGo() {
				var area_eng = $('input[name="area_eng"]').val();
				var area_kor = $('input[name="area_kor"]').val();

				if($('#strategy_btn_flex').hasClass('btn_on') || $('#strategy_btn_change').hasClass('strategy_btn_change')) {
					strategyListHide();
					strategyShow();
				}
				else {
		        	location.href='soccerstrategy?name=${area.area_eng}&area=${area.area_kor}';
				}
			}
	   </script>
	</head>
	<body>
		<input type="hidden" id="drag_id">
		<div class="strategy_whole">
			<div class="strategy_inner">
				<div class="strategy_side_whole">
					<div class="strategy_img_box">
						<c:choose>
							<c:when test="${areaset}">
								<div class="strategy_img">
									<img alt="전략 팀 추가 아이콘" src="./image/soccer/logo/${area.area_kor}.png">
								</div>
								<h1 class="strategy_title">전략</h1>
							</c:when>
						</c:choose>
					</div>
	       			<div class="traning_people_inner">
	        			<p onclick="strategyListShow()" data-area="<c:if test="${areaset}">${area.area_kor}</c:if>" class="traning_choose_pop_title2">
	        			<c:if test="${strategyPlayerList != null}">
	        				${strategyPlayerList.stname}
	        			</c:if>
	        			<c:if test="${empty strategyPlayerList}">제목 없음</c:if></p>
	        			
        				<c:if test="${strategyPlayerList != null}">
		        			<p class="traning_choose_pop_title">${strategyPlayerList.stdate}</p>
        				</c:if>
        				<c:if test="${empty strategyPlayerList}">
		        			<p class="traning_choose_pop_title traning_choose_pop_title3"></p>
        				</c:if>
	       				<div class="traning_people_list">
	       					<div>
	       						<!-- 선수 명단 및 사진 반복 -->
	       						<c:forEach items="${player_list}" var="my">
	       							<div>
			       						<label for="traning_player_choose_${my.playernum}">
			       							<input type="hidden" value="${my.playernum}" name="traning_player_number">
			       							<input type="checkbox" id="traning_player_choose_${my.playernum}" onclick="peopleChoose(this)" name="traning_player_choose" data-type="${my.playernum}" value="${my.pname}" data-image="${my.pimage}" hidden>
			       							<span>
			       								<img alt="체크 이미지" src="./image/soccer/icon/player_chk.png" class="player_chk_img">
				       							<img alt="선수 이미지" src="./image/soccer/player/${my.pimage}" class="player_img">
			       							</span>
				       						<p>${my.pname}</p>
			       						</label>
	       							</div>
	       						</c:forEach>
	       						<c:if test="${empty player_list}">
	       							<p class="no_data_txt">
	       								선수 명단이 없습니다.
	       								<br/>
	       								등록해주세요.
	       							</p>
	       						</c:if>
	       					</div>
	       				</div>
	       			</div>
				</div>
				<div class="strategy_box">
       				<c:if test="${strategyPlayerList != null}">
       					<!-- 불러오기 및 수정 영역 -->
						<form action="soccerStrategyUpdate" method="post" id="strategy_form_update">
							<c:if test="${areaset != null}">
								<input type="hidden" value="${area.area_eng}" name="area_eng">
								<input type="hidden" value="${area.area_kor}" name="area_kor">
							</c:if>
				        	<input type="hidden" id="chked_member_val" value="${strategyPlayerList.stinfo}" name="chked_member_val">
							<div class="strategy_map" data-type="change" onmousemove="playerDragMove(this, event)" onmouseup="playerDragEnd(this, event)"></div>
							<script type="text/javascript">
						        $(function() {
						        	//전략 페이지에서 stinfo 배열을 나눠주기 위함
						        	var win_wid = window.innerWidth;
						        	var stinfo = `${strategyPlayerList.stinfo}`;
						        	var stinfoArray = stinfo.split(',');
						        	for(var i = 0; i < stinfoArray.length; i++) {//배열 저장
								        people_array.push(stinfoArray[i]);
						        	}
						        	for(var i = 0; i < (stinfoArray.length / 5); i++) {
										var people_div = "";
					   	        		people_div += "<div id='player_num" + stinfoArray[(5 * i) + 1] + "' data-id='player_num" + stinfoArray[(5 * i) + 1] + "' class='player_box' onmousedown='playerDragStart(this, event)' data-number='" + stinfoArray[(5 * i) + 1] + "'>";
					   	        		people_div += "	<img src='./image/soccer/player/" + stinfoArray[(5 * i) + 2] + "' alt='" + stinfoArray[5 * i] + " 이미지'>";
					   	        		people_div += "</div>";
					   	        		$('.strategy_map').append(people_div);
							        	if(win_wid >= 1250) {
					   	        			$('#player_num' + stinfoArray[(5 * i) + 1]).css('top', stinfoArray[(5 * i) + 4] + 'px');
						   	        		$('#player_num' + stinfoArray[(5 * i) + 1]).css('left', stinfoArray[(5 * i) + 3] + 'px');
							        	}
							        	else {
					   	        			$('#player_num' + stinfoArray[(5 * i) + 1]).css('top', stinfoArray[(5 * i) + 4] + 'px');
						   	        		$('#player_num' + stinfoArray[(5 * i) + 1]).css('left', stinfoArray[(5 * i) + 3] + 'px');
							        	}
							        	$('#traning_player_choose_'+stinfoArray[(5 * i) + 1]).prop('checked', true);
					   	        		$('.strategy_btn_flex').addClass('btn_on');
									}
						        });
							</script>
							<img alt="경기장 이미지" src="./image/soccer/icon/soccer_play_bg.png" class="strategy_bg">
							<div class="strategy_btn_flex">
								<div>
									<button type="button" onclick="strategyReset()" class="strategy_btn strategy_btn_reset">초기화</button>
									<c:if test="${areaset != null}">
										<button type="button" onclick="strategyDeleteShow()" class="strategy_btn strategy_btn_cancel">삭제</button>
									</c:if>
									<button type="button" onclick="strategyShow()" id="strategy_btn_change" class="strategy_btn strategy_btn_submit" disabled>수정</button>
								</div>
							</div>
							<div class="strategy_save_bg"></div>
							<div class="strategy_save_whole">
								<div class="strategy_save_box">
									<p>전략 이름을 저장/수정해주세요.</p>
									<input type="hidden" name="strategy_stnum" value="${strategyPlayerList.stnum}">
									<input type="text" name="strategy_name" value="${strategyPlayerList.stname}">
									<div class="strategy_save_flex">
										<button type="button" onclick="strategyHide()" class="strategy_btn strategy_btn_cancel">닫기</button>
										<button type="button" onclick="strategyChk2()" class="strategy_btn strategy_btn_submit">전략 저장</button>
									</div>
								</div>
							</div>
							<div class="strategy_save_bg"></div>
							<div class="strategy_save_whole">
								<div class="strategy_save_box">
									<p>전략 이름을 저장/수정해주세요.</p>
									<input type="hidden" name="strategy_stnum" value="${strategyPlayerList.stnum}">
									<input type="text" name="strategy_name" value="${strategyPlayerList.stname}">
									<div class="strategy_save_flex">
										<button type="button" onclick="strategyHide()" class="strategy_btn strategy_btn_cancel">닫기</button>
										<button type="button" onclick="strategyChk2()" class="strategy_btn strategy_btn_submit">전략 저장</button>
									</div>
								</div>
							</div>
						</form>
					</c:if>
       				<c:if test="${empty strategyPlayerList}">
	  					<!-- 처음 시작 영역 -->
						<form action="soccerStrategySave" method="post" id="strategy_form">
							<c:if test="${areaset != null}">
								<input type="hidden" value="${area.area_eng}" name="area_eng">
								<input type="hidden" value="${area.area_kor}" name="area_kor">
							</c:if>
				        	<input type="hidden" id="chked_member_val" name="chked_member_val">
							<div class="strategy_map" onmousemove="playerDragMove(this, event)" onmouseup="playerDragEnd(this, event)"></div>
							<img alt="경기장 이미지" src="./image/soccer/icon/soccer_play_bg.png" class="strategy_bg">
							<div id="strategy_btn_flex" class="strategy_btn_flex">
								<div>
									<button type="button" onclick="strategyReset()" class="strategy_btn strategy_btn_reset">초기화</button>
									<button type="button" onclick="strategyShow()" class="strategy_btn strategy_btn_submit">저장</button>
								</div>
							</div>
							<div class="strategy_save_bg"></div>
							<div class="strategy_save_whole">
								<div class="strategy_save_box">
									<p>전략 이름을 저장해주세요.</p>
									<input type="text" name="strategy_name" placeholder="이름 입력">
									<div class="strategy_save_flex">
										<button type="button" onclick="strategyHide()" class="strategy_btn strategy_btn_cancel">닫기</button>
										<button type="button" onclick="strategyChk()" class="strategy_btn strategy_btn_submit">전략 저장</button>
									</div>
								</div>
							</div>
						</form>
					</c:if>
				</div>
				<div class="strategy_list_whole">
					<div class="strategy_list_box">
						<p class="strategy_list_title">전략 불러오기</p>
						<p class="strategy_list_subtitle">불러오고 싶은 전략을 클릭해주세요.</p>
						<span class="strategy_list_line"></span>
						<c:forEach items="${strategy_list}" var="strategylist">
							<div class="strategy_list_row" onclick="strategyListLoad(this)" data-number="${strategylist.stnum}">
								<p>${strategylist.stname}</p>
								<p>${strategylist.stdate}</p>
							</div>
						</c:forEach>
						<c:if test="${empty strategy_list}">
							<p class="no_data_txt">저장된 전략이 없습니다.<br/>전략을 만들어 저장해주세요.</p>
						</c:if>
						<div class="strategy_save_flex">
							<button type="button" onclick="strategyListHide()" class="strategy_btn strategy_btn_cancel">닫기</button>
							<c:if test="${areaset != null}">
								<button type="button" onclick="newStrategyGo()" class="strategy_btn strategy_btn_submit">새로운 전략</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="strategy_delete_bg"></div>
				<div class="strategy_delete_whole">
					<div class="strategy_delete_box">
						<p>전략 삭제</p>
						<p>정말 전략을 삭제하시겠습니까?<br/>삭제하시면 되돌릴 수 없습니다.</p>
						<div class="strategy_delete_flex">
							<button type="button" onclick="strategyDeleteHide()" class="strategy_delete_btn delete_btn_no">닫기</button>
							<button type="button" onclick="strategyDeleteOk()" class="strategy_delete_btn delete_btn_ok">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>