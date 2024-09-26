<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>코치 캘린더</title>
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
		<style type="text/css">
			@font-face {
			    font-family: 'Ownglyph_kimkonghae';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/Ownglyph_kimkonghae.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
		
			.main_section {
				margin-top: 79px;
			}
			
			/*캘린더 시작*/
			/*캘린더 좌측 리스트*/
			.calendar_whole {
				width: 100%;
				display: flex;
				flex-wrap: nowrap;
				justify-content: space-between;
				align-items: stretch;
				overflow: hidden;
			}

			.calendar_schedule_whole {
				min-width: 200px;
				width: 200px;
				height: calc(100vh - 260px);
				background-color: #ececec;
				margin-left: -200px;
				transition: 0.5s;
			}
			
			.calendar_schedule_whole.calen_on {
				margin-left: 0;
				transition: 0.5s;
			}
			
			
			.calendar_schedule_title {
				width: calc(100% - 40px);
				height: auto;
				padding: 20px;
				background-color: #fff;
				margin: 0 auto;
			}
			
			p.calendar_schedule_date {
				text-align: center;
			}
			
			.calendar_schedule_inner {
				width: 100%;
				height: auto;
				overflow: hidden;
			}
			
			.schedule_plus_btn {
				display: block;
				min-width: 100px;
				width: 100px;
				height: 32px;
				font-size: 16px;
				line-height: 34px;
				font-weight: 400;
				color: #3d3d3d;
				background-color: #f9f9f9;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				margin: 10px auto 0 auto;
			}
			
			.schedule_plus_btn:hover {
				font-weight: bold;
				background-color: #00000010;				
			}
			
			.schedule_list_box {
				width: calc(100% - 40px);
				height: auto;
				max-height: calc(100vh - 406px);
				margin: 0 auto;
				padding: 20px;
				overflow: hidden;
				overflow-y: auto;
			}
			
			
			.schedule_list_box::-webkit-scrollbar {
				display: none;
			}
			
			
			
			/*달력 구간*/
			#calendarForm {
				width: 100%;
				height: auto;
				max-height: calc(100vh - 259px);
				overflow: hidden;
				overflow-y: auto;
			}
			
			#calendarForm::-webkit-scrollbar {
				display: none;
			}
			
			.custom_calendar_table {
			    table-layout: fixed;
			    width: 100%;
			    height: 100%;
			    border: none;
			    border-spacing: 0;
			    margin: 0 auto;
			}
			
			.cal_date {
			    width: 100%;
			    height: 40px;
			    background-color: #e1e1e1;
			    border: 1px solid #e1e1e1;
			}
			
			.custom_calendar_table td {
			    text-align: center;
			}
			
			.custom_calendar_table thead.cal_date th {
			    font-size: 18px;
			    line-height: 40px;
			    font-weight: bold;
			    color: #fff;
			}
			
			.custom_calendar_table thead.cal_date th:first-child,
			.custom_calendar_table thead.cal_date th:last-child {
				display: flex;
				justify-content: center;
				height: 40px;
				max-height: 40px;
			}
			
			.custom_calendar_table thead.cal_date th p,
			.custom_calendar_table thead.cal_date th p span {
				text-align: center;
				color: #3d3d3d;
			}
			
			.custom_calendar_table thead.cal_date th button {
			    width: 40px;
			    height: 40px;
			    background: none;
			    border: none;
			    margin: 0;
			    padding: 0;
			    cursor: pointer;
			}
			
			.custom_calendar_table thead.cal_date th button * {
			    cursor: pointer;
			}
			
			.custom_calendar_table thead.cal_date th button > img {
			    display: block;
			    width: calc(100% - 20px);
			    height: auto;
			    background-size: contain;
			    margin: 0 auto;
			}
			
			.custom_calendar_table thead.cal_week {
			    min-height: 38px;
			    height: 38px;
			   	max-height: 38px;
			   	border: 1px solid #E5ECEA;
			}
			
			.custom_calendar_table thead.cal_week th {
			    width: max-content;
			    min-height: 36px;
			    height: 36px;
			    max-height: 36px;
			    font-size: 15px;
			    line-height: 36px;
			    color: #333333;
			    background-color: #E5ECEA;
			    word-break:break-all;
			    text-align: center;
			}
			
			.custom_calendar_table tbody td {
			    position: relative;
			    width: 40px;
			    max-width: 40px;
			    height: calc((100vh - 238px) / 6);
			    font-size: 15px;
			    line-height: 44px;
			    color: #777;
			    cursor: pointer;
			    word-break:break-all;
			    border: 1px solid #e1e1e1;
			}
			
			.custom_calendar_table tbody td:nth-child(1),
			.custom_calendar_table tbody td:nth-child(1) span {
			    color: red;
			    border-left: none;
			}
			
			.custom_calendar_table tbody td:nth-child(7),
			.custom_calendar_table tbody td:nth-child(7) span {
			    color: #288CFF;
			    border-right: none;
			}
			
			.custom_calendar_table tbody tr:first-child td {
				border-top: none;
			}
			
			.custom_calendar_table tbody tr:last-child td {
				border-bottom: none;
			}
			
			.custom_calendar_table tbody td.select_day {
			    background-color: #00462E;
			}
			
			.custom_calendar_table tbody td.select_day span {
			    color: #fff;
			}
			
			.custom_calendar_table tbody td.td_today {
			    text-decoration: underline;
			}
			
			.custom_calendar_table tbody td span.day_txt {
			    position: absolute;
				top: 10px;
				left: 50%;
				transform: translateX(-50%);			
			}
			
			span.work_in {
			    position: absolute;
			    font-family: 'Ownglyph_kimkonghae';
			    max-width: calc(100% - 30px);
			    top: 60%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis;
			}
			
			.schedule_list_inner {
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: flex-start;
				align-items: stretch;
				overflow: hidden;
			}
			
			.schedule_list_inner + .schedule_list_inner {
				margin-top: 30px;
			}
			
			span.schedule_list_span {
				display: block;
				min-width: 10px;
				height: 45px;
				background-color: #556b2f;
			}
			
			span.schedule_list_span.schedule_long {
				background-color: #bb0000;
			}

			.schedule_list_txt {
				width: 100%;
				height: auto;
				margin: 0 0 0 20px;
				overflow: hidden;
			}
			
			.schedule_list_txt p {
				font-size: 15px;
				line-height: 20px;
				font-weight: 400;
				color: #3d3d3d;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			
			.schedule_list_txt p + p {
				margin-top: 5px;
			}


			/*훈련일기 팝업 시작*/
			.traning_pop_whole {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: 0;
				bottom: -200vh;
				left: 0;
				z-index: 4;
				transition: 0.5s;
			}
			
			.traning_pop_whole.pop_show {
				bottom: 0;
				transition: 0.5s;
			}
			
			.traning_pop_bg {
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
			
			/*훈련 날짜 선택*/
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
				margin: 50px auto 10px auto;
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
			
			input.traning_calendar_datepicker,
			input.traning_calendar_datepicker2 {
				width: calc(100% - 22px);
				height: 40px;
				line-height: 60px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
			}
			
			input[name="traning_plus_date"].traning_calendar_datepicker {
				max-width: 100px;
				text-align: center;
			}
			
			p#traning_pop_date_txt {
				font-size: 20px;
				line-height: 36px;
				font-weight: 400;
				color: #3d3d3d;
				text-align: start;
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
			
			
			/*훈련 인원 선택*/
			.traning_people_inner {
				width: 100%;
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
			}
			
			.traning_people_list div {
				display: flex;
				flex-wrap: wrap;
				justify-content: start;
				align-items: stretch;
			}
			
			.traning_people_list div div {
				width: calc(33.3% - 6.9px);
				max-width: 100px;
				height: 22.77vh;
				max-height: 100px;
				margin: 10px 10px 0 0;
				overflow: hidden;
			}
			
			.traning_people_list div div label {
				width: 100%;
				height: 100%;
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
			
			
			/*지도*/
			.traning_map_inner {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.traning_map_flex {
				width: 100%;
				height: auto;
				margin: 0 auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: space-between;
				align-items: center;
			}
			
			.traning_map_flex input {
				width: 100%;
				height: 40px;
				background-color: #fff;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
			}
			
			
			/* 훈련 일정 */
			.traning_plus_whole {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.traning_plus_inner {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.traning_plus_row {
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: wrap;
				justify-content: start;
				align-items: center;
			}
				
			.traning_plus_row + .traning_plus_row {
				margin-top: 10px;
			}
			
			.traning_plus_flex {
				width: max-content;
				max-width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
			}
			
			.traning_plus_flex + .traning_plus_flex {
				width: 100%;
				margin-top: 5px;
			}
			
			input.traning_plus_time {
				width: calc(100% - 20px);
				max-width: 100px;
			    height: 40px;
			    line-height: 60px;
			    text-align: center;
			    border: 1px solid #e1e1e1;
			    border-radius: 5px;
			    background-color: #fff;
			    margin-left: 10px;
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			
			input.traning_plus_content {
				width: calc(100% - 20px);
			    height: 40px;
			    line-height: 60px;
			    border: 1px solid #e1e1e1;
			    border-radius: 5px;
			    background-color: #fff;
			}
			
			.traning_plus_btn {
				display: block;
				min-width: 90px;
				width: 90px;
				height: 40px;
				background-color: #fff;
				border: 1px solid #0c400c;
				border-radius: 5px;
				margin: 0 0 0 10px;
			}
			
			.traning_plus_btn:hover {
				background-color: #0c400c20;
			}
			
			.traning_plus_btn.traning_minus_btn {
				color: #f9f9f9;
				background-color: #0c400c;
			}
			
			
			
			
			@media (min-width: 768px) {
				.traning_people_list div label {
					min-width: calc(20% - 12px);
					width: calc(20% - 12px);
				}
			}
			
			
			
			@media (min-width: 1024px) {
				.main_section {
					width: 100%;
				}
				
				.custom_calendar_table tbody td {
				    height: calc((100vh - 238px) / 6);
				}
				
				.traning_pop_box {
				    width: calc(100% - 100px);
				    height: calc(100% - 80px);
			        padding: 50px 50px 0 50px;
					border-radius: 50px 50px 0 0;
				}
				
				.traning_plus_row {
					flex-wrap: nowrap;
				}
				
				.traning_plus_flex + .traning_plus_flex {
					width: 100%;
					margin-top: 0;
				}
				
				input.traning_plus_content {
					margin-left: 10px;
				}
				
				input.traning_plus_time,
				input[name="traning_plus_date"].traning_calendar_datepicker {
					min-width: 100px;
				}
			}
			
			
			@media (min-width: 1250px) {
				.main_section {
					max-width: none;
				}
				
				.calendar_schedule_whole {
					height: calc(100vh - 209px);
				}
				
				.schedule_list_box {
					max-height: calc(100vh - 357px);
				}

				.custom_calendar_table tbody td {
				    height: calc((100vh - 178px) / 6);
				}
			
				#calendarForm {
					max-height: calc(100vh - 209px);
				}
			}
		</style>
		<!-- css 다 복붙 -->
		<script type="text/javascript">
	        $(function(){
		        var nowDate = new Date();
		        var todayDate = new Date();
		        var td_year = todayDate.getFullYear();
		        var td_month = todayDate.getMonth() + 1;
		        var td_day = todayDate.getDate();
		        
				$('input[class="traning_calendar_datepicker"]').daterangepicker ({//달력 api
				    singleDatePicker: true,
				    showDropdowns: true,
				    locale: {
						format: 'YYYY-MM-DD'
					},
					setValue: function(){
				        var choosed_yy = $('#calendar_choosed_yy').val();
				        var choosed_mm = $('#calendar_choosed_mm').val();
				        var choosed_dd = $('#calendar_choosed_dd').val();
				        var choosed_date = choosed_yy + '-' + choosed_mm + '-' + choosed_dd;
						choosed_date;
				    },
				}, function(start, end, label) {
					console.log(start.format('YYYY-MM-DD'));
				});

				$('input[class="traning_calendar_datepicker2"]').daterangepicker({//날짜 여러개 선택하는 달력 api
					opens: 'center',
				    locale: {
						format: 'YYYY-MM-DD'
					},
				}, function(start, end, label) {
					console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
				});
	        	
				
	        	//달력
		        function calendarMake() {
		            calendarMaker($("#calendarForm"), new Date());
		        }calendarMake();
		        
		        function calendarMaker(target, date, date2) {
		            if (date == null || date == undefined) {
		                date = new Date();
		            }
		            if (date2 == null || date2 == undefined) {
		                date2 = new Date();
		            }
		            
		            nowDate = date;
		            todayDate = date2;
		            if ($(target).length > 0) {
		                var year = nowDate.getFullYear();
		                var year2 = todayDate.getFullYear();
		                var month = nowDate.getMonth() + 1;
		                var month2 = todayDate.getMonth() + 1;
		                var day = todayDate.getDate();
		                $(target).empty().append(assembly(year, month));

			            $('#calendar_choosed_yy').attr('value', year);
			            $('#calendar_choosed_mm').attr('value', ('0'+month).slice(-2));
			            $('#calendar_choosed_dd').attr('value', day);
		            } else {
		                console.error("custom_calendar Target is empty!!!");
		                return;
		            }
		            
		            var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
		            var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
		            var tag = "<tr>";
		            var cnt = 0;
		            //빈 공백 만들어주기
		            for (i = 0; i < thisMonth.getDay(); i++) {
		                tag += "<td></td>";
		                cnt++;
		            }
	
		            //날짜 채우기
		            for (i = 1; i <= thisLastDay.getDate(); i++) {
		                if (cnt % 7 == 0) { tag += "<tr>"; }
		                if(year + '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2) == year2 + ('0'+month2).slice(-2) + ('0'+day).slice(-2)) {//오늘 날짜
		                    tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td td_today'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
		                }else {
		                    tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
		                }
		                cnt++;
		                if (cnt % 7 == 0) {
		                    tag += "</tr>";
		                }
		            }
		            
		            $(target).find("#custom_set_date").append(tag);
		            calMoveEvtFn();
	
		            function assembly(year, month) {
		                var calendar_html_code =
		                    "<table class='custom_calendar_table'>" +
		                    "	<thead class='cal_date'>" +
		                    "		<th><button type='button' class='prev'><img src='./image/soccer/icon/arrow_prev_gr.png' alt=''></button></th>" +
		                    "		<th colspan='5' class='date_title'><p><span>" + year + "</span>년 <span>" + ('0'+month).slice(-2) + "</span>월</p></th>" +
		                    "		<th><button type='button' class='next'><img src='./image/soccer/icon/arrow_next_gr.png' alt=''></button></th>" +
		                    "	</thead>" +
		                    "	<thead  class='cal_week'>" +
		                    "		<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
		                    "	</thead>" +
		                    "	<tbody id='custom_set_date'>" +
		                    "	</tbody>" +
		                    "</table>";
		                return calendar_html_code;
		            }
		            
		            function calMoveEvtFn() {
		                //전달 클릭
		                $(".custom_calendar_table").on("click", ".prev", function () {
		                    nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
		                    calendarMaker($(target), nowDate);
		                });
		                //다음날 클릭
		                $(".custom_calendar_table").on("click", ".next", function () {
		                    nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
		                    calendarMaker($(target), nowDate);
		                });
		                //일자 선택 클릭
		                $(".custom_calendar_table").on("click", "td", function () {
		                    if($(this).hasClass('select_day') == true) {
		                        $(".custom_calendar_table .select_day").removeClass("select_day");
		                        $(this).removeClass("select_day").addClass("select_day");
		                    }else {
		                        $(".custom_calendar_table .select_day").removeClass("select_day");
		                    }
		                });
		            };
		            $('#20240913').append('<span class="work_in work_end">일정입력</span>');
		            
		            $('.calendar_td').on('click', function() {
		                var ths_td_id = $(this).attr('id');
		                $('.pic_row_a').hide();
		                if($(this).hasClass("select_day")) {
			                $(this).removeClass("select_day");
			                $('.calendar_schedule_whole').removeClass('calen_on');
		                }
		                else {
			                $(this).addClass("select_day");
			                $('.calendar_schedule_whole').addClass('calen_on');
		                }
		                var date_title = $('.date_title').text();
		                var day = $(this).find('.day_txt').text();
		                $('#calendar_schedule_date').text(date_title + ' ' + day + '일');
			            $('#calendar_choosed_dd').attr('value', day);
		            });
		        }
			});

	        function scheduleShow() {
				var selected_date = $('#calendar_schedule_date').text();//선택한 날짜 가져오기
				$('#traning_pop_date_txt').html(selected_date);//선택된 날짜 보여주기

				$('body').css('overflow', 'hidden');
				$('.traning_pop_whole').addClass("pop_show");
				$('.traning_pop_bg').show();
			}

	        function scheduleHide() {
				$('body').css('overflow', 'auto');	
				$('.traning_pop_whole').removeClass("pop_show");
				setTimeout(function() { 
					$('.traning_pop_bg').hide();
				}, 350);
			}
	        
	        function traningDateSelect(ths) {
				var date_type = ths.dataset.type;
				if(date_type == '전지훈련') {
					//전지훈련 선택 시
					$('#traning_pop_date1').hide();
					$('#traning_pop_date2').show();
				}
				else {
					//당일 선택 시
					$('#traning_pop_date1').show();
					$('#traning_pop_date2').hide();
				}
			}
	        
	        function peopleChooseAll() {
				$('input[name="traning_player_choose"]').prop('checked', true);
			}
	        
	        function scheduleDetail() {
				
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
		<div class="calendar_whole">
			<div class="calendar_schedule_whole">
				<div class="calendar_schedule_title">
					<input type="hidden" id="calendar_choosed_yy" value="">
					<input type="hidden" id="calendar_choosed_mm" value="">
					<input type="hidden" id="calendar_choosed_dd" value="">
					<p class="calendar_schedule_date" id="calendar_schedule_date">0000년 00월 00일</p>
					<button type="button" class="schedule_plus_btn" onclick="scheduleShow()">훈련 일기+</button>
				</div>
				<div class="calendar_schedule_inner">
					<div class="schedule_list_box">
						<!-- schedule_list_inner div 반복 -->
						<div class="schedule_list_inner" onclick="scheduleDetail()">
							<!-- 전지훈련: schedule_long 클래스명 추가 -->
							<span class="schedule_list_span"></span>
							<div class="schedule_list_txt">
								<p>날짜 / 시간</p>
								<p>스케줄내용스케줄내용스케줄내용스케줄내용스케줄내용스케줄내용스케줄내용</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	        <div id="calendarForm"></div>
		</div>
        <div class="traning_pop_whole">
        	<div class="traning_pop_bg"></div>
        	<div class="traning_pop_box">
        		<div class="traning_pop_flex">
	        		<p class="traning_pop_title">훈련일기</p>
	        		<button type="button" class="common_pop_hide" onclick="scheduleHide()">
		        		<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지">
	        		</button>
        		</div>
        		<p class="traning_pop_subtext">오늘의 훈련이 어땠는지 적어주세요.</p>
        		<div class="traning_pop_inner">
	        		<div class="traning_date_pop_choose">
	        			<p class="traning_choose_pop_title">훈련 날짜 선택</p>
	        			<div class="traning_date_pop_flex">
		        			<label for="traning_date_choose1">
		        				<input type="radio" name="traning_date_choose" id="traning_date_choose1" onchange="traningDateSelect(this)" data-type="당일" hidden checked>
		        				<span>당일</span>
		        			</label>
		        			<label for="traning_date_choose2">
		        				<input type="radio" name="traning_date_choose" id="traning_date_choose2" onchange="traningDateSelect(this)" data-type="전지훈련" hidden>
		        				<span>전지훈련</span>
		        			</label>
	        			</div>
		       			<div id="traning_pop_date1" class="traning_pop_date">
							<input type="text" id="traning_select_date1" value="" name="traning_select_date" class="traning_calendar_datepicker">
		       			</div>
		       			<div id="traning_pop_date2" class="traning_pop_date">
							<input type="text" id="traning_select_date2" value="" name="traning_select_date2" class="traning_calendar_datepicker2" placeholder="날짜 선택">
		       			</div>
	        		</div>
	       			<div class="traning_people_inner">
	        			<p class="traning_choose_pop_title">훈련 인원 선택</p>
	       				<div class="traning_people_choose">
	       					<label for="traning_people_select1">
	       						<input type="radio" id="traning_people_select1" name="traning_people_select" onclick="peopleChooseAll()" value="전체" hidden>
	       						<span>전체</span>
	       					</label>
	       					<label for="traning_people_select2">
	       						<input type="radio" id="traning_people_select2" name="traning_people_select" value="선택" checked hidden>
	       						<span>선택</span>
	       					</label>
	       				</div>
	       				<div class="traning_people_list">
	       					<div>
	       						<!-- 선수 명단 및 사진 반복 -->
	       						<c:forEach items="${player_list}" var="my" begin="1" step="1">
	       							<div>
			       						<label for="traning_player_choose_${my.playernum}">
			       							<input type="checkbox" id="traning_player_choose_${my.playernum}" name="traning_player_choose" value="${my.pname}" hidden>
			       							<span>
			       								<img alt="체크 이미지" src="./image/soccer/icon/player_chk.png" class="player_chk_img">
				       							<img alt="선수 이미지" src="./image/soccer/player/<c:choose><c:when test="${areaset}">${area.area_kor}</c:when></c:choose>/${my.pimage}" class="player_img">
			       							</span>
			       						</label>
			       						<p>${my.pname}</p>
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
	       			<div class="traning_map_inner">
	        			<p class="traning_choose_pop_title">훈련 장소 선택</p>
	        			<div class="traning_map_flex">
		       				<input type="text" id="traning_map_input" placeholder="훈련 장소 입력">
	        			</div>
	       			</div>
	       			<div class="traning_plus_whole">
	        			<p class="traning_choose_pop_title">훈련 일정</p>
	        			<p class="traning_choose_pop_title2">일정은 최대 3개까지 추가 가능합니다.</p>
						<div class="traning_plus_inner">
							<div class="traning_plus_row">
								<div class="traning_plus_flex">
									<input type="text" id="traning_plus_date1" data-id="traning_plus_date1" value="" name="traning_plus_date" class="traning_calendar_datepicker">
									<input type="text" id="traning_plus_time1" data-id="traning_plus_time1" value="" name="traning_plus_time" class="traning_plus_time" placeholder="시간 선택" readonly>
								</div>
								<div class="traning_plus_flex">
									<input type="text" name="traning_plus_content1" class="traning_plus_content" placeholder="일정 입력">
									<button type="button" class="traning_plus_btn">일정 추가</button>
								</div>
							</div>
							<div class="traning_plus_row">
								<div class="traning_plus_flex">
									<input type="text" id="traning_plus_date2" data-id="traning_plus_date2" value="" name="traning_plus_date" class="traning_calendar_datepicker">
									<input type="text" id="traning_plus_time2" data-id="traning_plus_time2" value="" name="traning_plus_time" class="traning_plus_time" placeholder="시간 선택" readonly>
								</div>
								<div class="traning_plus_flex">
									<input type="text" name="traning_plus_content2" class="traning_plus_content" placeholder="일정 입력">
									<button type="button" class="traning_plus_btn traning_minus_btn">일정 삭제</button>
								</div>
							</div>
						</div>
	       			</div>
       			</div>
        	</div>
        </div>
	</body>
</html>