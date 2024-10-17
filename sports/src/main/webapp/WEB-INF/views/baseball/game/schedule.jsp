<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
		
		/*훈련일기 팝업 시작*/
			.traning_pop_whole,
			.map_pop_whole {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: -200vh;
				left: 0;
				z-index: 4;
				transition: 0.5s;
			}
			
			.traning_pop_whole.pop_show,
			.map_pop_whole.pop_show {
				bottom: 0;
				transition: 0.5s;
			}
			
			.traning_pop_bg,
			.map_pop_bg {
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0, 0, 0, 0.5);
				z-index:0;
				display: none;
			}
			
			.traning_pop_box {
				position: absolute;
				width: calc(100% - 40px);
				height: calc(100% - 50px);
				bottom: 0;
				left: 50%;
				transform: translateX(-50%);
				background-color: #f9f9f9;
				border-radius: 30px 30px 0 0;
				padding: 20px 20px 0 20px;
			}
			
			.traning_pop_flex {
				max-width: 1000px;
				display: flex;
				flex-wrap: nowrap;
				justify-content: space-between;
				align-items: start;
				margin: 0 auto;
			}
			
			p.traning_pop_title {
				font-size: 24px;
				line-height: 36px;
				font-weight: bold;
				color: #3d3d3d;
				text-align: center;
				margin: 0 auto;
			}

			.common_pop_hide {
				min-width: 30px;
				width: 30px;
				height: 30px;
			}
			
			p.traning_pop_subtext {
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #999;
				text-align: center;
				margin: 10px auto 0 auto;
			}
			
			.traning_pop_inner {
				width: 100%;
				max-width: 1000px;
				height: calc(100% - 70px);
				overflow: hidden;
				overflow-y: auto;
				margin: 0 auto;
			}
			
			.traning_pop_inner::-webkit-scrollbar {
				display: none;
			}
		
			.traning_people_inner {
				width: 100%;
				margin: 0 auto;
				text-align: center;
			}
			
			.traning_people_choose {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				width: 100%;
				margin: 0 auto;
			}
			.traning_people_choose div{
				display: flex;
				flex-wrap: wrap;
			    justify-content: center;
			    width: 420px;
			    margin: 0 33px;
			}
			
			.traning_people_choose label {
				display: block;
				width: calc(16.6% - 10px);
				max-width: 100%;
				margin: 0;
			}
			
			.traning_people_choose label + label {
				margin-left: 10px;
			}
			
			.traning_people_choose label:nth-child(6n + 1) {
				margin-left: 0;
			}
			
			input[name="team1"],
			input[name="team2"]{
				display: none;
			}
			
			input[name="team1"] + img,
			input[name="team2"] + img{
				border: 2px solid transparent;
				border-radius: 50px;
			}
			
			input[name="team1"]:checked + img,
			input[name="team2"]:checked + img{
				border-color: #006400;
			}
			
			
			p.no_data_txt {
				padding-top: 20px;
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
				margin: 0 auto;
			}
			
			.traning_date_pop_choose {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			p.traning_choose_pop_title {
				font-size: 17px;
				line-height: 28px;
				color: #777;
				text-align: center;
				margin: 60px auto 10px auto;
			}
			
			p.traning_choose_pop_title2 {
				font-size: 14px;
				line-height: 20px;
				color: #999;
				text-align: center;
				margin: 0 auto 10px auto;
			}
			
			.traning_date_pop_flex {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
			}
			
			.traning_date_pop_choose label {
				display: block;
				width: max-content;
				max-width: 100%;
				margin: 0;
			}
			
			.traning_date_pop_choose label + label {
				margin-left: 10px;
			}
			
			input[name="traning_date_choose"] + span {
				min-width: auto;
				width: max-content;
				max-width: 100%;
				padding: 10px 20px;
				background-color: #fff;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				margin: 0;
			}
			
			input[name="traning_date_choose"]:checked + span {
				color: #f9f9f9;
			}
			
			.traning_pop_date {
				width: 100%;
				height: auto;
				margin: 10px auto 0 auto;
			}
			
			.traning_pop_date#traning_pop_date2 {
				display: none;
			}
			
			.traning_pop_date#traning_pop_date2 div {
				display: flex;
				flex-wrap: nowrap;
			}
			
			.traning_pop_date#traning_pop_date2 div p {
				line-height: 42px;
				margin: 0 10px;
			}
			
			.traning_map_flex select,
			input.traning_calendar_input,
			input.traning_calendar_datepicker,
			input.traning_calendar_datepicker2 {
				width: calc(100% - 22px);
				height: 40px;
				line-height: 60px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				padding: 0 10px;				
			}

			input.traning_calendar_input {
				max-width: 130px;
			}
			
			/*datepicker*/
			.daterangepicker {
				width: auto;
				max-width: none;
			}
			
			.daterangepicker .drp-calendar.left {
				padding: 0;
			}
			
			.daterangepicker .drp-calendar.left .calendar-table {
				padding-right: 10px;
			}
			
			.daterangepicker select.monthselect {
				width: 55%;
			}
			
			.daterangepicker th.month {
				padding: 0;
			}
			
			.daterangepicker select.monthselect,
			.daterangepicker select.yearselect {
				margin-right: 10px;
				border: none;
				outline: none;
			}
			
			.daterangepicker .drp-calendar {
				max-width: none;
				clear: inherit;
				padding: 0;
			}
			
			.daterangepicker select.monthselect,
			.daterangepicker select.yearselect {
				height: 30px;
				font-size: 15px;
				line-height: 30px;
				padding: 0;
			}
			
			.daterangepicker .calendar-table th,
			.daterangepicker .calendar-table td {
				height: 30px;
				font-size: 14px;
				line-height: 30px;
			}
			
			.daterangepicker .calendar-table td:hover {
				border-radius: 30px;
			}
			
			.daterangepicker td.active,
			.daterangepicker td.active:hover {
				background-color: #556B2F!important;
			}
			
			.daterangepicker td.active.start-date {
				border-radius: 30px 0 0 30px;
			}
			
			.daterangepicker td.active.end-date {
				border-radius: 0 30px 30px 0;
			}
			
			.daterangepicker td.active.start-date.end-date {
				border-radius: 30px;
			}
			
			.daterangepicker td.in-range {
				background-color: #556B2F20;
			}
			
			.daterangepicker .drp-buttons .btn {
				font-size: 14px;
			}
			
			.daterangepicker .drp-buttons .btn.btn-primary {
				color: #556B2F;
				border: 1px solid #556B2F;
				background-color: transparent;
			}
			
			.daterangepicker .drp-buttons .btn.btn-primary:hover {
				font-weight: bold;
				background-color: #556B2F10;
			}
			.schedule_list_txt {
			    margin: 0 auto!important;
			    text-align: center!important;
			}
			.schedule_list_txt img{
				width: 40px;
			}
			.schedule_list_txt p {
			    width: 180px!important;
			    margin: 0 auto!important;
			}
			.calendar_schedule_whole {
    			min-width: 240px!important;
    			margin-left: -240px!important;
    		}
    		.calendar_schedule_whole.calen_on{
    			margin-left: 0!important;    		
    		}
    		.selectPlace{
    			margin-top: 5px;
    			border: none;
    		}
			.custom_calendar_table tbody td span.work_in{
				top: 40%;
    		}
			.custom_calendar_table tbody td span.work_in+span.work_in{
				top: 62%;
    		}
			.custom_calendar_table tbody td span.work_in+span.work_in+span.work_in{
				top: 84%;
    		}
			.custom_calendar_table tbody td:nth-child(1) span.work_in,
			.custom_calendar_table tbody td:nth-child(7) span.work_in{
    			color: #3d3d3d!important;
    			background-color: #fff!important;
				top: 40%;
    		}
			.custom_calendar_table tbody td:nth-child(1) span.work_in+span.work_in,
			.custom_calendar_table tbody td:nth-child(7) span.work_in+span.work_in{
				top: 62%;
    		}
			.custom_calendar_table tbody td:nth-child(1) span.work_in+span.work_in+span.work_in,
			.custom_calendar_table tbody td:nth-child(7) span.work_in+span.work_in+span.work_in{
				top: 84%;
    		}
    		.custom_calendar_table tbody td.select_day span.work_in ,
    		.custom_calendar_table  tbody td:nth-child(1).calendar_td.select_day span.work_in,
    		.custom_calendar_table  tbody td:nth-child(7).calendar_td.select_day span.work_in{
    			display: none!important;
    		}
    		</style>
		<meta charset="UTF-8">
		<title>경기 일정</title>
		<link rel="stylesheet" href="./css/calendar.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		<script type="text/javascript">
			//캘린더 날짜 데이터 값이 없을 때 현재 날짜를 넣어주기 위함
			var firstDate = new Date();
			var firstyy = firstDate.getFullYear();
			var firstmm = firstDate.getMonth() + 1;
			var firstdd = firstDate.getDate();
			var wholestart;
			var startyy;
			var startmm;
			var startdd;
			$(function(){
				var startdate = $('#startdate').val();
				if(startdate == 'undefined' || startdate == null || startdate == ''){//초기값을 오늘 날짜로 설정
					startyy = firstyy;
					startmm = firstmm;
					startdd = firstdd;
				}else{
					startyy = startdate.slice(0,4);
					startmm = startdate.slice(5,7);
				}
				//달력
				function calendarMake(){
					calendarMaker($("#calendarForm"), new Date());
				}calendarMake();
				function calendarMaker(target, date, date2){
					if (date == null || date == undefined){
						date = new Date();
					}
					if (date2 == null || date2 == undefined){
						date2 = new Date();
					}
					nowDate = date;
					todayDate = date2;
					if ($(target).length > 0){
						var year = nowDate.getFullYear();
						var year2 = todayDate.getFullYear();
						var month = nowDate.getMonth() + 1;
						var month2 = todayDate.getMonth() + 1;
						var day = todayDate.getDate();
						$(target).empty().append(assembly(year, month));
						$('#calendar_choosed_yy').attr('value', year);
						$('#calendar_choosed_mm').attr('value', ('0'+month).slice(-2));
						$('#calendar_choosed_dd').attr('value', day);
					} else{
						console.error("custom_calendar Target is empty!!!");
						return;
					}
					var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
					var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
					var cnt = 0;
					var tag = "<tr>";
					//빈 공백 만들어주기
					for (i = 0; i < thisMonth.getDay(); i++){
						tag += "<td></td>";
						cnt++;
					}
					//날짜 채우기
					for (i = 1; i <= thisLastDay.getDate(); i++){
						if (cnt % 7 == 0){
							tag += "<tr>";
						}
						if(year + '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2) == year2 + ('0'+month2).slice(-2) + ('0'+day).slice(-2)){//오늘 날짜
							tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td td_today'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
						}else{
							tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
						}
						cnt++;
						if (cnt % 7 == 0){
							tag += "</tr>";
						}
					}
					$(target).find("#custom_set_date").append(tag);
					 function assembly(year, month){
						  var calendar_html_code =
								"<table class='custom_calendar_table'>" +
								"	<thead class='cal_date'>" +
								"		<th><button type='button' class='prev' onclick='calendarMove(this)' data-type='prev'><img src='./image/soccer/icon/arrow_prev_gr.png' alt=''></button></th>" +
								"		<th colspan='5' class='date_title'><p><span id='date_yy'>" + year + "</span>년 <span id='date_mm'>" + ('0'+month).slice(-2) + "</span>월</p></th>" +
								"		<th><button type='button' class='next' onclick='calendarMove(this)' data-type='next'><img src='./image/soccer/icon/arrow_next_gr.png' alt=''></button></th>" +
								"	</thead>" +
								"	<thead  class='cal_week'>" +
								"		<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
								"	</thead>" +
								"	<tbody id='custom_set_date'>" +
								"	</tbody>" +
								"</table>";
						  return calendar_html_code;
					 }
					$('.calendar_td').on('click', function(){
						if($(this).hasClass("select_day") == true){
							$(this).removeClass("select_day");
							$('.calendar_schedule_whole').removeClass('calen_on');
						}else{
							$(".custom_calendar_table .select_day").removeClass("select_day");
							$(this).addClass("select_day");
							$('.calendar_schedule_whole').addClass('calen_on');
							var this_date = $(this).attr('id');
							$('.schedule_list_inner').hide();
							$('.list_'+this_date).show();
							if($(this).find('span').hasClass('work_in') == true){
								$('.schedule_list_box').find('.no_data_txt').hide();
							}else{
								$('.schedule_list_box').find('.no_data_txt').show();
							}
						}
						var date_title = $('.date_title').text();
						var day = $(this).find('.day_txt').text();
						$('#calendar_schedule_date').text(date_title + ' ' + day + '일');
						$('#calendar_choosed_dd').attr('value', day);
					});
				};
				nowDate = new Date(startyy, startmm-1, '01');
				calendarMaker($("#calendarForm"), nowDate);
			});
			
			//팀1 선택시 경기장 변경
			$(document).ready(function(){
				$(".select_team2").click(function(){
					var team = $("input[name='team2']:checked").val();
					var place="";
					if(team=='KIA') place="기아챔피언스필드";
			        else if(team=="KT") place="수원KT위즈파크";
			        else if(team=="LG" ||team=="두산") place="잠실야구장";
			        else if(team=="NC") place="창원NC파크";
			        else if(team=="SSG") place="인천SSG랜더스필드";
			        else if(team=="롯데") place="사직야구장";
			        else if(team=="삼성") place="대구삼성라이온즈파크";
			        else if(team=="키움") place="고척스카이돔";
			        else if(team=="한화") place="한화생명이글스파크";
			        $("#gamePlace").val(place).prop("selected", true);
				});
			});
			
			function mapShow() {
				$('body').css('overflow', 'hidden');
				$('.map_pop_whole').addClass("pop_show");
				$('.map_pop_bg').show();
			}//mapShow
			
			 function mapHide() {
				$('body').css('overflow', 'auto');
				$('.map_pop_whole').removeClass("pop_show");
				$('.map_pop_bg').hide();
			}//mapHide
			
			function gameMap(gameplace) {
		    	mapShow();
		      	var gyung = "";
		      	var wui = "";
		      	var imageSrc = null, // 마커이미지의 주소입니다
		        imageSize = new kakao.maps.Size(150,150), // 마커이미지의 크기입니다 
		        imageOption = {offset: new kakao.maps.Point(90, 115)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      	
		      //경도,위도 찾기
		         if(gameplace=="기아챔피언스필드") {
		            gyung = 126.8891056;
		            wui = 35.1681242  ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_KIA.png';
		         }else if(gameplace=="월명야구장") {
		            gyung = 126.7481183;
		            wui = 35.9660304   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_KIA.png';
		         }else if (gameplace=="수원KT위즈파크") {
		            gyung = 127.0096685;
		            wui = 37.2997553   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_KT.png';
		         }else if (gameplace=="잠실야구장" ) {
		            gyung = 127.071827;
		            wui = 37.5120673   ;
		            imageSrc = (team2 =='두산') ? 'https://mbc-project-test.netlify.app/image/map_두산.png' :'https://mbc-project-test.netlify.app/image/map_LG.png';
		         }else if (gameplace=="창원NC파크") {
		            gyung = 128.5822292;
		            wui = 35.2225967   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_NC.png';
		         }else if (gameplace=="인천SSG랜더스필드") {
		            gyung = 126.6932617;
		            wui = 37.4370423   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_SSG.png';
		         }else if (gameplace=="사직야구장") {
		            gyung = 129.0615183;
		            wui = 35.1940316   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_롯데.png';
		         }else if (gameplace=="울산문수야구장") {
		            gyung = 129.2655749;
		            wui = 35.5321681   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_롯데.png';
		         }else if (gameplace=="대구삼성라이온즈파크") {
		            gyung = 128.6815273;
		            wui = 35.8411705   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_삼성.png';
		         }else if (gameplace=="포항야구장") {
		            gyung = 129.3593993;
		            wui = 36.0081953   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_삼성.png';
		         }else if (gameplace=="고척스카이돔") {
		            gyung = 126.8670866;
		            wui = 37.498931   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_키움.png';
		         }else if (gameplace=="한화생명이글스파크") {
		            gyung = 127.4291345;
		            wui = 36.3170789   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_한화.png';
		         }else {
		            gyung = 127.4723234 ;
		            wui = 36.6378563   ;
		            imageSrc = 'https://mbc-project-test.netlify.app/image/map_한화.png';
		         }
		        
		    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		       	mapOption = { 
		           center: new kakao.maps.LatLng(wui, gyung), // 지도의 중심좌표
		           level: 2 // 지도의 확대 레벨
		       	}
		       	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		       	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		       	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		       	markerPosition = new kakao.maps.LatLng(wui, gyung); // 마커가 표시될 위치입니다
		       	// 마커를 생성합니다
		       	var marker = new kakao.maps.Marker({
		        	position: markerPosition, 
		           	image: markerImage // 마커이미지 설정 
		       	});
		       	// 마커가 지도 위에 표시되도록 설정합니다
		       	marker.setMap(map);
		       }
		</script>
	</head>
	<body>
		<c:choose>
			<c:when test="${areaset}">
				<input type="hidden" value="${area.area_eng}" id="area_eng" name="area_eng">
				<input type="hidden" value="${area.area_kor}" id="area_kor" name="area_kor">
			</c:when>
		</c:choose>
		<c:if test="${calendar_data != null}">
			<input type="hidden" value="${calendar_data}" id="startdate" name="startdate">
		</c:if>
		<div class="calendar_whole">
			<div class="calendar_schedule_whole">
				<div class="calendar_schedule_title">
					<input type="hidden" id="calendar_choosed_yy" value="">
					<input type="hidden" id="calendar_choosed_mm" value="">
					<input type="hidden" id="calendar_choosed_dd" value="">
					<p class="calendar_schedule_date" id="calendar_schedule_date">0000년 00월 00일</p>
					<button type="button" class="schedule_plus_btn" onclick="scheduleShow()">경기 등록+</button>
					<button type="button" class="schedule_plus_btn" onclick="location.href='baseball_gameinfo'">경기 목록</button>
				</div>
				<div class="calendar_schedule_inner">
					<div class="schedule_list_box">
						<c:forEach items="${list}" var="calendar">
							<script type="text/javascript">
								$(function(){//달력에 일정 띄우기 위한 js 코드
									var date = `${calendar.gamedate}`;
									var time = `${calendar.gametime}`;
									var team1 = `${calendar.team1}`;
									var team2 = `${calendar.team2}`;
									var place = `${calendar.gameplace}`;
									var gamedate1 = date.split('-'); // DB에서 가져온 날짜
									var resultgamedate = gamedate1.join(''); // YYYYMMDD 형식으로 변환
									var date_yy = date.slice(0,4);
									var date_mm = date.slice(5,7);
									var date_dd = date.slice(8,10);
									var date_wh = date_yy + date_mm + date_dd;
									
									$('.day_'+date).addClass('list_'+date_wh);
									if(date_wh == resultgamedate) {
										$('#'+date_wh).append('<span class="work_in">' + team1 + ' vs ' + team2);
									}
								});
							</script>
								<div class="schedule_list_inner day_${calendar.gamedate}" data-number="${calendar.gamenum}">
									<div class="schedule_list_txt">
										<p>
										<img alt="" src="./image/baseball/logo/${calendar.team1}.png" width="25px"> ${calendar.team1} vs ${calendar.team2} <img alt="" src="./image/baseball/logo/${calendar.team2}.png" width="25px">
										</p>
										<p style="text-align: center;">${calendar.gametime}</p>
										<button type="button" onclick="gameMap('${calendar.gameplace}')" data-area="${calendar.gameplace}" class="selectPlace">${calendar.gameplace}</button>
									</div>
								</div>
						</c:forEach>
						<p class="no_data_txt">달력 데이터가<br/>없습니다.</p>
					</div>
				</div>
			</div>
			<div id="calendarForm"></div>
		</div>
		<!-- 훈련일지 등록 팝업 -->
		<div class="traning_pop_whole">
			<div class="traning_pop_bg"></div>
			<div class="traning_pop_box">
				<div class="traning_pop_flex">
					<p class="traning_pop_title">경기 등록</p>
					<button type="button" class="common_pop_hide" onclick="scheduleHide()">
						<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지">
					</button>
				</div>
				<p class="traning_pop_subtext">경기를 등록해주세요 :)</p>
				<div class="traning_pop_inner">
					<form action="baseballGameSchedule" id="soccer_calendar_save" method="post">
						<input type="hidden" id="chked_member_val" name="chked_member_val">
						<input type="hidden" id="chked_traing_val" name="chked_traing_val">
						<input type="hidden" id="calendar_info_val" name="calendar_info_val" value="soccer">
						<div class="traning_date_pop_choose">
		        			<p class="traning_choose_pop_title">경기 날짜 및 시간 선택</p>
		        			<div class="traning_date_pop_flex">
		        			</div>
			       			<div>
								<input type="date" id="game_select_date" name="gameDate" class="traning_calendar_datepicker">
			       			</div>
			       			<div>
								<input type="time" id="game_select_time" name="gameTime" class="traning_calendar_datepicker">
			       			</div>
		        		</div>
						<div class="traning_people_inner">
							<p class="traning_choose_pop_title">팀 선택</p>
							<div class="traning_people_choose">
								<div class="select_team1">
			       					<label for="select_team1_kia">
			       						<input type="radio" id="select_team1_kia" name="team1" value="KIA">
			       							<img alt="" src="./image/baseball/logo/KIA.png" width="50px">
			       					</label>
			       					<label for="select_team1_kt">
			       						<input type="radio" id="select_team1_kt" name="team1" value="KT">
			       							<img alt="" src="./image/baseball/logo/KT.png" width="50px">
			       					</label>
			       					<label for="select_team1_lg">
			       						<input type="radio" id="select_team1_lg" name="team1" value="LG">
			       							<img alt="" src="./image/baseball/logo/LG.png" width="50px">
			       					</label>
			       					<label for="select_team1_nc">
			       						<input type="radio" id="select_team1_nc" name="team1" value="NC">
			       							<img alt="" src="./image/baseball/logo/NC.png" width="50px">
			       					</label>
			       					<label for="select_team1_ssg">
			       						<input type="radio" id="select_team1_ssg" name="team1" value="SSG">
			       							<img alt="" src="./image/baseball/logo/SSG.png" width="50px">
			       					</label>
			       					<label for="select_team1_doosan">
			       						<input type="radio" id="select_team1_doosan" name="team1" value="두산">
			       							<img alt="" src="./image/baseball/logo/두산.png" width="50px">
			       					</label>
			       					<label for="select_team1_lotte">
			       						<input type="radio" id="select_team1_lotte" name="team1" value="롯데">
			       							<img alt="" src="./image/baseball/logo/롯데.png" width="50px">
			       					</label>
			       					<label for="select_team1_samsung">
			       						<input type="radio" id="select_team1_samsung" name="team1" value="삼성">
			       							<img alt="" src="./image/baseball/logo/삼성.png" width="50px">
			       					</label>
			       					<label for="select_team1_kiwoom">
			       						<input type="radio" id="select_team1_kiwoom" name="team1" value="키움">
			       							<img alt="" src="./image/baseball/logo/키움.png" width="50px">
			       					</label>
			       					<label for="select_team1_hanhwa">
			       						<input type="radio" id="select_team1_hanhwa" name="team1" value="한화">
			       							<img alt="" src="./image/baseball/logo/한화.png" width="50px">
			       					</label>
			       				</div>
		       					<p>  vs  </p>
		       					<div class="select_team2">
			       					<label for="select_team2_kia">
			       						<input type="radio" id="select_team2_kia" name="team2" value="KIA">
			       							<img alt="" src="./image/baseball/logo/KIA.png" width="50px">
			       					</label>
			       					<label for="select_team2_kt">
			       						<input type="radio" id="select_team2_kt" name="team2" value="KT">
			       							<img alt="" src="./image/baseball/logo/KT.png" width="50px">
			       					</label>
			       					<label for="select_team2_lg">
			       						<input type="radio" id="select_team2_lg" name="team2" value="LG">
			       							<img alt="" src="./image/baseball/logo/LG.png" width="50px">
			       					</label>
			       					<label for="select_team2_nc">
			       						<input type="radio" id="select_team2_nc" name="team2" value="NC">
			       							<img alt="" src="./image/baseball/logo/NC.png" width="50px">
			       					</label>
			       					<label for="select_team2_ssg">
			       						<input type="radio" id="select_team2_ssg" name="team2" value="SSG">
			       							<img alt="" src="./image/baseball/logo/SSG.png" width="50px">
			       					</label>
			       					<label for="select_team2_doosan">
			       						<input type="radio" id="select_team2_doosan" name="team2" value="두산">
			       							<img alt="" src="./image/baseball/logo/두산.png" width="50px">
			       					</label>
			       					<label for="select_team2_lotte">
			       						<input type="radio" id="select_team2_lotte" name="team2" value="롯데">
			       							<img alt="" src="./image/baseball/logo/롯데.png" width="50px">
			       					</label>
			       					<label for="select_team2_samsung">
			       						<input type="radio" id="select_team2_samsung" name="team2" value="삼성">
			       							<img alt="" src="./image/baseball/logo/삼성.png" width="50px">
			       					</label>
			       					<label for="select_team2_kiwoom">
			       						<input type="radio" id="select_team2_kiwoom" name="team2" value="키움">
			       							<img alt="" src="./image/baseball/logo/키움.png" width="50px">
			       					</label>
			       					<label for="select_team2_hanhwa">
			       						<input type="radio" id="select_team2_hanhwa" name="team2" value="한화">
			       							<img alt="" src="./image/baseball/logo/한화.png" width="50px">
			       					</label>
			       				</div>
							</div>
						</div>
						<div class="traning_map_inner">
							<p class="traning_choose_pop_title">경기 장소 선택</p>
							<div class="traning_map_flex">
								<select name="gamePlace" id="gamePlace">
	                               <option value="기아챔피언스필드">기아챔피언스필드
	                               <option value="월명야구장">월명야구장
	                               <option value="수원KT위즈파크">수원KT위즈파크
	                               <option value="잠실야구장">잠실야구장
	                               <option value="창원NC파크">창원NC파크
	                               <option value="인천SSG랜더스필드">인천SSG랜더스필드
	                               <option value="사직야구장">사직야구장
	                               <option value="울산문수야구장">울산문수야구장
	                               <option value="대구삼성라이온즈파크">대구삼성라이온즈파크
	                               <option value="포항야구장">포항야구장
	                               <option value="고척스카이돔">고척스카이돔
	                               <option value="한화생명이글스파크">한화생명이글스파크
	                               <option value="청주종합경기장야구장">청주종합운동장야구장
	                            </select>
							</div>
						</div>
						<div class="training_memo_btn_whole">
							<button type="button" onclick="scheduleHide()" class="training_memo_btn memo_btn_cancel">닫기</button>
							<button type="submit" class="training_memo_btn memo_btn_save">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 지도 팝업 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fc5c2706f2e6d4c77d545c0c0bd345e"></script>
        <div class="map_pop_whole">
        	<div class="map_pop_bg"></div>
        	<div class="traning_pop_box">
        		<div class="traning_pop_flex">
	        		<p class="traning_pop_title">찾아오시는 길</p>
	        		<button type="button" class="common_pop_hide" onclick="mapHide()">
		        		<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지">
	        		</button>
        		</div>
        		<div id="map" style="width:100%;height:750px;margin-top:20px;"></div>
       		</div>
        </div>
		<script type="text/javascript">
			function calendarMove(ths){//이전/다음달 버튼 클릭 시
				var ths_type = ths.dataset.type;
				var area_eng = $('#area_eng').val();
				var area_kor = $('#area_kor').val();
				if(ths_type == 'prev'){//이전달
					if(startmm <= 1){
						startyy = Number(startyy) - 1;
						startmm = '12';
					}
					else{
						startmm = ('0'+(Number(startmm) - 1)).slice(-2);
					}
				}else{//다음달
					if(startmm >= 12){
						startyy = Number(startyy) + 1;
						startmm = '01';
					}
					else{
						startmm = ('0'+(Number(startmm) + 1)).slice(-2);
					}
				}
				wholestart = startyy + '-' + startmm + '-01';
				location.href='baseballScheduleMove?start='+wholestart;
			}
			//스케줄
			function scheduleShow(){
				var calendar_choosed_yy = $('#calendar_choosed_yy').val();
				var calendar_choosed_mm = $('#calendar_choosed_mm').val();
				var calendar_choosed_dd = $('#calendar_choosed_dd').val();
				var selected_date = calendar_choosed_yy + '-' + calendar_choosed_mm + '-' + calendar_choosed_dd;
				$('#game_select_date').attr('value', selected_date);
				$('body').css('overflow', 'hidden');
				$('.traning_pop_whole').addClass("pop_show");
				$('.traning_pop_bg').show();
			}
			function scheduleHide(){
				$('body').css('overflow', 'auto');	
				$('.traning_pop_whole').removeClass("pop_show");
				setTimeout(function(){
				$('.traning_pop_bg').hide();
				}, 350);
			}
			function scheduleDelete(ths){
				var ths_id = ths.dataset.id;
				var sche_len = $('.traning_plus_row').length;
				$('#'+ths_id).remove();
				for(var i = schedule_len; i <= sche_len; i++){
					$('#traning_plus_row'+schedule_len).attr('id', 'traning_plus_row'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_date'+schedule_len).attr('id', 'traning_plus_date'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_time'+schedule_len+'_1').attr('id', 'traning_plus_date'+(schedule_len - 1)+'_1');
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_time'+schedule_len+'_2').attr('id', 'traning_plus_date'+(schedule_len - 1)+'_2');
					$('#traning_plus_row'+(schedule_len - 1)).find('.traning_plus_content').attr('name', 'traning_plus_content'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('button').attr('data-id', 'traning_plus_row'+(schedule_len - 1));
				}
				schedule_len--;
			}
			//스케줄

			function listShow(){
				$('body').css('overflow', 'hidden');
				$('.traning_show_whole').addClass("pop_show");
				$('.traning_show_bg').show();
			}
			function listHide(){
				$('body').css('overflow', 'auto');
				$('.traning_show_whole').removeClass("pop_show");
				setTimeout(function(){
					$('.traning_show_bg').hide();
				}, 350);
			}
		</script>
	</body>
</html>