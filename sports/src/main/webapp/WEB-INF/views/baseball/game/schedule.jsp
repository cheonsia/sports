<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>경기 일정</title>
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
				margin-left: 0;
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
			    border-top: none;
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
			    min-height: 36px;
			    height: 36px;
			   	max-height: 36px;
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
			
			.custom_calendar_table tbody tr {
				height: auto;
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
			    color: #fff!important;
			}
			
			.custom_calendar_table tbody td span.day_txt {
			    position: absolute;
				top: 10px;
				left: 50%;
				transform: translateX(-50%);			
			}
			
			.custom_calendar_table tbody td.td_today span.day_txt {
			    text-decoration: underline!important;
			    font-weight: bold;
			}
			
			span.work_in {
				display: none;
			    width: 100%;
				height: auto;
				font-size: 14px;
				line-height: 20px;
				font-weight: bold;
				color: #333!important;
			    max-width: calc(100% - 30px);
			    white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    text-align: center;
			    margin: 0 auto;
			}

			span.work_in + span.work_in {
				margin-top: 5px;
			}
			
			.calendar_td span:nth-child(2) {
				margin-top: 25px;
			}
			
			
			.calendar_td span:nth-child(2),
			.calendar_td span:nth-child(3),
			.calendar_td span:nth-child(4) {
				display: block;
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


			/*훈련일기 상세 팝업 시작*/
			.traning_pop_whole.detail_pop {
				position: fixed;
				width: 100vw;
				height: 100vh;
				bottom: -200vh;
				bottom: 0;
				left: 0;
				z-index: 4;
				transition: 0.5s;
			}
			
			.detail_pop_whole.pop_show {
				bottom: 0;
				transition: 0.5s;
			}
			
			.detail_pop_bg {
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0, 0, 0, 0.5);
				z-index:0;
				display: none;
			}
			
			.detail_pop_box {
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
			
			.detail_pop_flex {
				max-width: 1000px;
				display: flex;
				flex-wrap: nowrap;
				justify-content: space-between;
				align-items: start;
				margin: 0 auto;
			}
			
			p.detail_pop_title {
				font-size: 24px;
				line-height: 36px;
				font-weight: bold;
				color: #3d3d3d;
				text-align: center;
				margin: 0 auto;
			}


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
				border: none;
				background-color: transparent;
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
			
			
			/*훈련 인원 선택*/
			.traning_people_inner {
				width: 103%;
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
			}
			
			.traning_people_choose label {
				display: block;
				width: calc(20% - 11px);
				max-width: 100%;
				margin: 0;
			}
			
			.traning_people_choose label + label {
				margin-left: 10px;
			}
			
			.traning_people_choose label:nth-child(5n + 1) {
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
			
			.traning_people_list div p {
				text-align: center;
				margin: 0 auto;
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
			
			.traning_plus_flex div {
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
			}
			
			input.traning_plus_time {
				min-width: 68px;
				width: calc(100% - 20px);
				max-width: 68px;
			    height: 40px;
			    line-height: 60px;
			    text-align: center;
			    border: 1px solid #e1e1e1;
			    border-radius: 5px;
			    background-color: #fff;
			    margin-left: 10px;
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			
			input.traning_plus_time + p {
				margin-left: 5px;
			}
			
			p + input.traning_plus_time {
				margin-left: 5px;
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
			
			
			/*메모*/
			.traning_memo_whole {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.traning_memo_inner {
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			
			.traning_memo_inner textarea {
				display: block;
				width: calc(100% - 22px);
				height: 200px;
				border: 1px solid #e1e1e1;
				padding: 5px 10px;
				border-radius: 5px;
			}
			
			.traning_memo_inner p {
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				text-align: end;
				margin: 5px 0 0 auto;
			}
			
			.traning_memo_inner p span {
				font-weight: bold;
				color: #333;
			}
			
			
			/*버튼*/
			.training_memo_btn_whole {
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 10px auto 30px auto;
			}
			
			.training_memo_btn {
				display: block;
				width: 100%;
				max-width: 100px;
				height: 40px;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				border: 1px solid transparent;
				border-radius: 5px;
			}
			
			.training_memo_btn.memo_btn_cancel {
				color: #556B2F;
				background-color: #fff;
				border-color: #556B2F;				
			}
			
			.training_memo_btn.memo_btn_save {
				color: #fff;
				background-color: #556B2F;
				border-color: #556B2F;
			}
			
			.training_memo_btn + .training_memo_btn {
				margin-left: 20px;
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
			
			.imagegame{
				display: flex;
				justify-content:space-between;
				align-items:center;
			}
			
			.select_team2{
				margin-left: 10px;
			}
			.selectPlace{
			    border: none;
			    display: block;
			    margin: 0 auto 20px auto;
			}
		</style>
		<!-- css 다 복붙 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fc5c2706f2e6d4c77d545c0c0bd345e"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		<script type="text/javascript">
		$(function() {
			var nowDate = new Date();
			var todayDate = new Date();
			var td_year = todayDate.getFullYear();
			var td_month = todayDate.getMonth() + 1;
			var td_day = todayDate.getDate();
			
				//달력
			function calendarMake() {
				calendarMaker($("#calendarForm"), new Date());
			}
			calendarMake();
			 
			function calendarMaker(target, date, date2) {
				if (date == null || date == undefined) {
			    	date = new Date();}
			    if (date2 == null || date2 == undefined) {
			    	date2 = new Date();}
			     
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
				}else {
					console.error("custom_calendar Target is empty!!!");
					return;}
		     
				var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
				var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
		           
		        var cnt = 0;
		        var tag = "<tr>";
		        //빈 공백 만들어주기
		        for (i = 0; i < thisMonth.getDay(); i++) {
		        	tag += "<td></td>";
					cnt++;}
			    //날짜 채우기
		        for (i = 1; i <= thisLastDay.getDate(); i++) {
		        	if (cnt % 7 == 0) {
						tag += "<tr>";
					}
		            if(year + '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2) == year2 + ('0'+month2).slice(-2) + ('0'+day).slice(-2)) {//오늘 날짜
		            	tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td td_today'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
		            }else {
		            	tag += "<td id="+ (year+ '' + ('0'+month).slice(-2) + '' + ('0'+i).slice(-2)) +" class='calendar_td'>" + "<span class='day_txt'>" + ('0'+i).slice(-2) + "</span></td>";
		            }
		            cnt++;
		            if (cnt % 7 == 0) {
		            	tag += "</tr>";
		            }
		       }//for
		           
		        //캘린더 날짜 보여주기
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
		        }//assembly
		        function calMoveEvtFn() {
					//이전 달 클릭
		            $(".custom_calendar_table").on("click", ".prev", function () {
		            	nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
		            	calendarMaker($(target), nowDate);
		            });
		            //다음 달 클릭
		            $(".custom_calendar_table").on("click", ".next", function () {
			            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
			            calendarMaker($(target), nowDate);
		            });
		            //일자 클릭 시
		            $(".custom_calendar_table").on("click", "td", function () {
			            if($(this).hasClass('select_day') == true) {
			            	$(".custom_calendar_table .select_day").removeClass("select_day");
			            	$(this).removeClass("select_day").addClass("select_day");
			            }else {
			            	$(".custom_calendar_table .select_day").removeClass("select_day");
			            }
			            var yy = $('#calendar_choosed_yy').val();
			   	        var mm = $('#calendar_choosed_mm').val();
			   	        var dd = $('#calendar_choosed_dd').val();
			   			var date = yy + '-' + mm + '-' + dd;
						location.href='baseball_schedule_date?date='+date;	   			
		           });
		           
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
		                var date_title = $('.date_title').text();
		                var day = $(this).find('.day_txt').text();
		                $('#calendar_schedule_date').text(date_title + ' ' + day + '일');
			            $('#calendar_choosed_dd').attr('value', day);
		               }
		           });
		       };//calMoveEvtFn
			};//calendarMaker
		});
		
		    function scheduleShow() {
			    var calendar_choosed_yy = $('#calendar_choosed_yy').val();
			    var calendar_choosed_mm = $('#calendar_choosed_mm').val();
			    var calendar_choosed_dd = $('#calendar_choosed_dd').val();
				var selected_date = calendar_choosed_yy + '-' + calendar_choosed_mm + '-' + calendar_choosed_dd;
				$('#game_select_date').attr('value', selected_date);
				$('body').css('overflow', 'hidden');
				$('.traning_pop_whole').addClass("pop_show");
				$('.traning_pop_bg').show();
			}//scheduleShow
		    
			function scheduleHide() {
				$('body').css('overflow', 'auto');	
				$('.traning_pop_whole').removeClass("pop_show");
				setTimeout(function() {$('.traning_pop_bg').hide();}, 350);
			}//scheduleHide
		      
		    function scheduleDelete(ths) {
				var ths_id = ths.dataset.id;
				var sche_len = $('.traning_plus_row').length;
				$('#'+ths_id).remove();
				for(var i = schedule_len; i <= sche_len; i++) {
					$('#traning_plus_row'+schedule_len).attr('id', 'traning_plus_row'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_date'+schedule_len).attr('id', 'traning_plus_date'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_time'+schedule_len+'_1').attr('id', 'traning_plus_date'+(schedule_len - 1)+'_1');
					$('#traning_plus_row'+(schedule_len - 1)).find('#traning_plus_time'+schedule_len+'_2').attr('id', 'traning_plus_date'+(schedule_len - 1)+'_2');
					$('#traning_plus_row'+(schedule_len - 1)).find('.traning_plus_content').attr('name', 'traning_plus_content'+(schedule_len - 1));
					$('#traning_plus_row'+(schedule_len - 1)).find('button').attr('data-id', 'traning_plus_row'+(schedule_len - 1));
				}//for
				schedule_len--;
			}//scheduleDelete
      
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
      		var team2= $('#teamsel2').val();
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
		<div class="calendar_whole">
			<div class="calendar_schedule_whole">
				<div class="calendar_schedule_title">
					<input type="hidden" id="calendar_choosed_yy" value="">
					<input type="hidden" id="calendar_choosed_mm" value="">
					<input type="hidden" id="calendar_choosed_dd" value="">
					<p class="calendar_schedule_date" id="calendar_schedule_date">${date.substring(0,4)}년 ${date.substring(5,7)}월 ${date.substring(8,10)}일</p>
					<button type="button" class="schedule_plus_btn" onclick="scheduleShow()">경기 등록+</button>
					<button type="button" class="schedule_plus_btn" onclick="location.href='baseball_gameinfo'">경기 목록</button>
				</div>
				<div class="calendar_schedule_inner">
					<div class="schedule_list_box">
						<!-- schedule_list_inner div 반복 -->
						<c:forEach items="${list}" var="calendar">
								<div class="schedule_list_inner">
									<div class="schedule_list_txt">
										<script type="text/javascript">
									        $(function() {//달력에 일정 띄우기 위한 js 코드
									        	var team1 = `${calendar.team1}`;
									        	var team2 = `${calendar.team2}`;
												var gamedate = `${calendar.gamedate}`;
												var gametime = `${calendar.gametime}`;
												var gamplace = `${calendar.gameplace}`;
												var gamedate1 = gamedate.split('-'); // DB에서 가져온 날짜
										        var resultgamedate = gamedate1.join(''); // YYYYMMDD 형식으로 변환
												
												
												var date_yy = gamedate.slice(0,4);
												var date_mm = gamedate.slice(5,7);
												var date_dd = gamedate.slice(8,10);
												var date_wh = date_yy + date_mm + date_dd;										
												
												if(date_wh == resultgamedate) {
													$('#'+date_wh).append('<span class="work_in">' + team1 + ' vs ' + team2);
												}
									        });
										</script>
									</div>
								</div>
						</c:forEach>
						<!-- 경기일정 표시화면 -->
								<c:forEach items="${datelist}" var="date">
									<div class="game">
										<input type="hidden" value="${date.gamedate}" id="gamedate" name="gamedate">
										<div class="imagegame">
											<img alt="" src="./image/baseball/logo/${date.team1}.png" width="50px">
											<span> vs </span>
											<img alt="" src="./image/baseball/logo/${date.team2}.png" width="50px">
										</div>
										<p style="text-align: center" >${date.gametime}</p>
										<button type="button" onclick="gameMap('${date.gameplace}')" data-area="${date.gameplace}" class="selectPlace">${date.gameplace}</button>
									</div>
								</c:forEach>
						
						<c:if test="${empty list}">
							<p class="no_data_txt">달력 데이터가<br/>없습니다.</p>
						</c:if>
					</div>
				</div>
			</div>
	        <div id="calendarForm"></div>
		</div>

        <!-- 경기 등록 팝업 -->
        <div class="traning_pop_whole">
        	<div class="traning_pop_bg"></div>
        	<div class="traning_pop_box">
        		<div class="traning_pop_flex">
	        		<p class="traning_pop_title">경기 등록</p>
	        		<button type="button" class="common_pop_hide" onclick="scheduleHide()">
		        		<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지" width="30px" style="border: none;">
	        		</button>
        		</div>
        		<p class="traning_pop_subtext">경기를 등록해주세요 :)</p>
        		<div class="traning_pop_inner">
	        		<form action="baseballGameSchedule" method="post">
		       			<div class="traning_people_inner" >
		        			<p class="traning_choose_pop_title">팀 선택</p>
		       				<div class="traning_people_choose">
			       				<div>
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
		       			<div class="traning_map_inner">
		        			<p class="traning_choose_pop_title">경기장소</p>
		        			<div class="traning_map_flex">
			       				<select name="gamePlace">
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
		       				<button type="button" class="training_memo_btn memo_btn_cancel">닫기</button>
		       				<button type="submit" class="training_memo_btn memo_btn_save">저장</button>
		       			</div>
	       			</form>
       			</div>
        	</div>
        </div>
        
        <!-- 지도 팝업 -->
        <div class="map_pop_whole">
        	<div class="map_pop_bg"></div>
        	<div class="traning_pop_box">
        		<div class="traning_pop_flex">
	        		<p class="traning_pop_title">찾아오시는 길</p>
	        		<button type="button" class="common_pop_hide" onclick="mapHide()">
		        		<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지" width="30px">
	        		</button>
        		</div>
        		<div id="map" style="width:100%;height:750px;margin-top:20px;"></div>
       		</div>
        </div>
	</body>
</html>