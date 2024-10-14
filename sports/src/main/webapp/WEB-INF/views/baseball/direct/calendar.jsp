<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>훈련 일정</title>
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
					<button type="button" class="schedule_plus_btn" onclick="scheduleShow()">훈련 일기+</button>
				</div>
				<div class="calendar_schedule_inner">
					<div class="schedule_list_box">
						<c:forEach items="${calendar_list}" var="calendar">
							<script type="text/javascript">
								$(function(){//달력에 일정 띄우기 위한 js 코드
									var date = `${calendar.TRDATE}`;
									var tr_content = `${calendar.TRCONTENT}`;
									var date_yy = date.slice(0,4);
									var date_mm = date.slice(5,7);
									var date_dd = date.slice(8,10);
									var date_wh = date_yy + date_mm + date_dd;
									//td id를 쓰기 위해서 년/월/일
									var date2 = `${calendar.TRDATE2}`;
									var date2_yy = date2.slice(0,4);
									var date2_mm = date2.slice(5,7);
									var date2_dd = date2.slice(8,10);
									var date2_wh = date2_yy + date2_mm + date2_dd;
									//td id를 쓰기 위해서 년/월/일
									var con_array = tr_content.split(',');
									var con_array_len = con_array.length;
									var con_content_val = "";
									$('.day_'+date).addClass('list_'+date_wh);
									con_content_val = con_array[3];
									if(date_wh == date2_wh){
										if(con_array_len <= 4){
											$('#'+date_wh).append('<span class="work_start work_in work_end">' + con_content_val + '</span>');
										}
										else{
											$('#'+date_wh).append('<span class="work_start work_in work_end">' + con_content_val + ' 외 ' + ((con_array_len / 4) - 1) + '개</span>');
										}
									}
									else{
										for(var i = date_wh; i <= date2_wh; i++){
											$('.day_'+date+'.day_'+date2).addClass('list_'+i);
										}
										if(con_array_len <= 4){
											$('#'+date_wh).append('<span class="work_start work_in">' + con_content_val + '</span>');
										}
										else{
											$('#'+date_wh).append('<span class="work_start work_in">' + con_content_val + ' 외 ' + ((con_array_len / 4) - 1) + '개</span>');
										}
										for(var i = date_wh; i < date2_wh; i++){
											if(i != date_wh){
												$('#'+i).append('<span class="work_in work_ing"></span>');
											}
										}
										$('#'+date2_wh).append('<span class="work_in work_end">' + con_content_val + ' 외 ' + ((con_array_len / 4) - 1) + '개</span>');
									}
								});
							</script>
							<c:if test="${calendar.TRDATE == calendar.TRDATE2}">
								<div class="schedule_list_inner day_${calendar.TRDATE}" data-number="${calendar.TRNUM}" onclick="listGet(this)">
									<span class="schedule_list_span"></span>
									<div class="schedule_list_txt">
										<p>${calendar.TRDATE}</p>
										<p>당일</p>
									</div>
								</div>
							</c:if>
							<c:if test="${calendar.TRDATE != calendar.TRDATE2}">
								<div class="schedule_list_inner day_${calendar.TRDATE} day_${calendar.TRDATE2}" data-number="${calendar.TRNUM}" onclick="listGet(this)">
									<span class="schedule_list_span schedule_long"></span>
									<div class="schedule_list_txt">
										<p>
											${calendar.TRDATE}
											<br/>
											${calendar.TRDATE2}
										</p>
										<p>전지훈련</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<p class="no_data_txt">달력 데이터가<br/>없습니다.</p>
					</div>
				</div>
			</div>
			<div id="calendarForm"></div>
		</div>
		<!-- 훈련일지 상세 팝업 -->
		<c:forEach items="${calendar_detail}" var="detail">
			<div class="traning_show_whole">
				<div class="traning_show_bg"></div>
				<div class="traning_show_box">
					<div class="traning_show_flex">
						<p class="traning_show_title">훈련일지</p>
						<button type="button" class="common_pop_hide" onclick="listHide()">
							<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지">
						</button>
					</div>
					<p class="traning_show_subtext">작성하신 훈련 일지입니다.</p>
					<div class="traning_show_inner">
						<form action="baseballCalendarUpdate" id="baseball_calendar_update" method="post">
							<c:choose>
								<c:when test="${areaset}">
									<input type="hidden" value="${area.area_eng}" id="area_eng" name="baseball_team1">
									<input type="hidden" value="${area.area_kor}" id="area_kor" name="baseball_team2">
								</c:when>
							</c:choose>
							<c:if test="${calendar_data != null}">
								<input type="hidden" value="${calendar_data}" id="startdate2" name="startdate2">
							</c:if>
							<input type="hidden" id="chked_member_num2" name="chked_member_num2" value="${detail.TRNUM}">
							<input type="hidden" id="chked_member_val2" name="chked_member_val2" value="${detail.TRMEMBER}">
							<input type="hidden" id="chked_traing_val2" name="chked_traing_val2" value="${detail.TRCONTENT}">
							<input type="hidden" id="calendar_info_val2" name="calendar_info_val2" value="baseball">
							<div class="traning_date_pop_choose">
								<p class="traning_choose_pop_title">훈련 날짜 선택</p>
								<div class="traning_date_pop_flex">
									<c:if test="${detail.TRDATE == detail.TRDATE2}">
										<label for="traning_date_choose3">
											<input type="radio" name="traning_date_choose2" id="traning_date_choose3" onchange="traningDateSelect(this)" data-type="당일" value="당일" hidden disabled checked>
											<span>당일</span>
										</label>
										<label for="traning_date_choose4">
											<input type="radio" name="traning_date_choose2" id="traning_date_choose4" onchange="traningDateSelect(this)" data-type="전지훈련" value="전지훈련" hidden disabled>
											<span>전지훈련</span>
										</label>
									</c:if>
									<c:if test="${detail.TRDATE != detail.TRDATE2}">
										<label for="traning_date_choose3">
											<input type="radio" name="traning_date_choose2" id="traning_date_choose3" onchange="traningDateSelect(this)" data-type="당일" value="당일" hidden disabled>
											<span>당일</span>
										</label>
										<label for="traning_date_choose4">
											<input type="radio" name="traning_date_choose2" id="traning_date_choose4" onchange="traningDateSelect(this)" data-type="전지훈련" value="전지훈련" hidden disabled checked>
											<span>전지훈련</span>
										</label>
									</c:if>
								</div>
								<c:if test="${detail.TRDATE == detail.TRDATE2}">
									<div id="traning_show_date3" class="traning_show_date" style="display:block;">
										<input type="date" id="traning_select_date4" value="${detail.TRDATE}" name="traning_select_date4" class="traning_calendar_datepicker" disabled>
									</div>
									<div id="traning_show_date4" class="traning_show_date" style="display:none;">
										<div>
											<input type="date" id="traning_select_date5" value="${detail.TRDATE}" name="traning_select_date5" class="traning_calendar_datepicker" disabled>
											<p> ~ </p>
											<input type="date" id="traning_select_date6" value="${detail.TRDATE2}" name="traning_select_date6" class="traning_calendar_datepicker2" placeholder="날짜 선택" disabled>
										</div>
									</div>
								</c:if>
								<c:if test="${detail.TRDATE != detail.TRDATE2}">
									<div id="traning_show_date3" class="traning_show_date" style="display:none;">
										<input type="date" id="traning_select_date4" value="${detail.TRDATE}" name="traning_select_date4" class="traning_calendar_datepicker" disabled>
									</div>
									<div id="traning_show_date4" class="traning_show_date" style="display:block;">
										<div>
											<input type="date" id="traning_select_date5" value="${detail.TRDATE}" name="traning_select_date5" class="traning_calendar_datepicker" disabled>
											<p> ~ </p>
											<input type="date" id="traning_select_date6" value="${detail.TRDATE2}" name="traning_select_date6" class="traning_calendar_datepicker2" disabled placeholder="날짜 선택">
										</div>
									</div>
								</c:if>
							</div>
							<div class="traning_people_inner">
								<p class="traning_choose_pop_title">훈련 인원 선택</p>
								<div class="traning_people_choose">
									<label for="traning_people_select3">
										<input type="radio" id="traning_people_select3" name="traning_people_select2" onclick="peopleChooseAll2()" value="전체" disabled hidden>
										<span>전체</span>
									</label>
									<label for="traning_people_select2">
										<input type="radio" id="traning_people_select4" name="traning_people_select2" onclick="peopleChooseAll2()" value="선택" disabled checked hidden>
										<span>선택</span>
									</label>
								</div>
								<div class="traning_people_list">
									<div>
										<c:forEach items="${player_list}" var="my">
											<div>
												<label for="traning_player_choose2_${my.playernum}">
													<input type="hidden" value="${my.playernum}" name="traning_player_number2">
													<input type="checkbox" id="traning_player_choose2_${my.playernum}" onclick="peopleChoose2(this)" name="traning_player_choose2" data-type="${my.playernum}" value="${my.pname}" hidden="hidden" disabled>
													<span>
														<img alt="체크 이미지" src="./image/soccer/icon/player_chk.png" class="player_chk_img">
														<img alt="선수 이미지" src="./image/baseball/player/${my.pimage}" class="player_img">
													</span>
													<p>${my.pname}</p>
												</label>
											</div>
										</c:forEach>
										<script type="text/javascript">
											var chked_member_val2 = $('#chked_member_val2').val();
											var chked_member_div2 = chked_member_val2.split(',');
											var chked_member_len2 = chked_member_div2.length / 2;
											for(var i = 0; i < chked_member_len2; i++){
												var chked_num2 = chked_member_div2[(2 * i) + 1];
												$('#traning_player_choose2_'+chked_num2).attr('checked', true);
											}
										</script>
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
								<p class="traning_choose_pop_title">훈련 장소 입력</p>
								<div class="traning_map_flex">
									<input type="text" id="traning_map_input2" name="traning_map_input2" maxlength="50" value="${detail.TRPLACE}" disabled>
								</div>
							</div>
							<div class="traning_plus_whole">
								<p class="traning_choose_pop_title">훈련 일정</p>
								<p class="traning_choose_pop_title2">일정은 최대 3개까지 추가 가능합니다. (일정은 30자 이내)</p>
								<div class="traning_plus_inner2"></div>
							</div>
							<div class="traning_memo_whole">
								<p class="traning_choose_pop_title">훈련 메모</p>
								<p class="traning_choose_pop_title2">이번 훈련에 대하여 메모가 있으시다면 적어주세요.(최대 300자)</p>
								<div class="traning_memo_inner">
									<textarea id="training_memo_txtarea2" name="training_memo_txtarea2" maxlength="300" onkeyup="scheduleKeyup()" disabled>${detail.TRMEMO}</textarea>
									<p><span id="traning_memo_len2"></span>/300</p>
								</div>
							</div>
							<div class="training_memo_btn_whole">
								<button type="button" onclick="listHide()" class="training_memo_btn memo_btn_cancel">닫기</button>
								<button type="button" onclick="listDelete()" class="training_memo_btn memo_btn_delete">삭제하기</button>
								<button type="button" onclick="traingChange()" class="training_memo_btn memo_btn_save memo_btn_save1">수정하기</button>
								<button type="button" onclick="traingUpdateChk()" class="training_memo_btn memo_btn_save memo_btn_save2">수정완료</button>
							</div>
							<script type="text/javascript">
								var chked_member_val = $('#chked_traing_val2').val();
								var chked_member_div = chked_member_val.split(',');
								var chked_member_len = chked_member_div.length;
								var chked_member_len2 = chked_member_len / 4;
								for(var i = 0; i < chked_member_len2; i++){
									for(var j = 0; j <= chked_member_len; j++){
										 var schedule_div = '';
										 schedule_div += '<div class="traning_plus_row traning_plus_row2" id="traning_plus2_row' + (i + 1) + '">';
										 schedule_div += '	<div class="traning_plus_flex">';
										 schedule_div += '		<input type="date" id="traning_plus2_date' + (i + 1) + '" value="' + chked_member_div[4*i] + '" name="traning_plus2_date' + (i + 1) + '" class="traning_calendar_input traning_calendar_input2" disabled>';
										 schedule_div += '		<div>';
										 schedule_div += '			<input type="number" id="traning_plus2_time' + (i + 1) + '_1" value="' + chked_member_div[(4*i)+1] + '" name="traning_plus2_time'+(i + 1)+'_1" class="traning_plus_time" placeholder="00" disabled>';
										 schedule_div += '			<p>:</p>';
										 schedule_div += '			<input type="number" id="traning_plus2_time' + (i + 1) + '_2" value="' + chked_member_div[(4*i)+2] + '" name="traning_plus2_time'+(i + 1)+'_2" class="traning_plus_time" placeholder="00" disabled>';
										 schedule_div += '		</div>';
										 schedule_div += '	</div>';
										 schedule_div += '	<div class="traning_plus_flex">';
										 schedule_div += '		<input type="text" name="traning_plus2_content' + (i + 1) + '" class="traning_plus_content" placeholder="일정 입력(30자 이내)" maxlength="30" value="' + chked_member_div[(4*i)+3] + '" disabled>';
										 if(i == 0){
										 schedule_div += '		<button type="button" data-id="traning_plus2_row' + (i + 1) + '" class="traning_plus_btn traning_btn_new" onclick="schedulePlus2(this)" disabled>일정 추가</button>';
										 }else{
										 schedule_div += '		<button type="button" data-id="traning_plus2_row' + (i + 1) + '" class="traning_plus_btn traning_btn_new traning_minus_btn" onclick="scheduleDelete2(this)" disabled>일정 삭제</button>';
										 }
										 schedule_div += '	</div>';
										 schedule_div += '</div>';
									}
									 $('.traning_plus_inner2').append(schedule_div);
								}
								var txt_len = $('#training_memo_txtarea2').val().length;
								$('#traning_memo_len2').text(txt_len);
							</script>
						</form>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$('.traning_show_whole').addClass('pop_show');
			</script>
		</c:forEach>
		<!-- 훈련일지 등록 팝업 -->
		<div class="traning_pop_whole">
			<div class="traning_pop_bg"></div>
			<div class="traning_pop_box">
				<div class="traning_pop_flex">
					<p class="traning_pop_title">훈련일지</p>
					<button type="button" class="common_pop_hide" onclick="scheduleHide()">
						<img src="./image/soccer/icon/pop_hide.png" alt="팝업 숨김 이미지">
					</button>
				</div>
				<p class="traning_pop_subtext">오늘의 훈련이 어땠는지 적어주세요.</p>
				<div class="traning_pop_inner">
					<form action="baseballCalendarSave" id="baseball_calendar_save" method="post">
						<c:choose>
							<c:when test="${areaset}">
								<input type="hidden" value="${area.area_eng}" name="baseball_calendar_team1">
								<input type="hidden" value="${area.area_kor}" name="baseball_calendar_team2">
							</c:when>
						</c:choose>
						<input type="hidden" id="chked_member_val" name="chked_member_val">
						<input type="hidden" id="chked_traing_val" name="chked_traing_val">
						<input type="hidden" id="calendar_info_val" name="calendar_info_val" value="baseball">
						<div class="traning_date_pop_choose">
							<p class="traning_choose_pop_title">훈련 날짜 선택</p>
							<div class="traning_date_pop_flex">
								<label for="traning_date_choose1">
									<input type="radio" name="traning_date_choose" id="traning_date_choose1" onchange="traningDateSelect(this)" data-type="당일" value="당일" hidden checked>
									<span>당일</span>
								</label>
								<label for="traning_date_choose2">
									<input type="radio" name="traning_date_choose" id="traning_date_choose2" onchange="traningDateSelect(this)" data-type="전지훈련" value="전지훈련" hidden>
									<span>전지훈련</span>
								</label>
							</div>
							<div id="traning_pop_date1" class="traning_pop_date">
								<input type="date" id="traning_select_date1" value="" name="traning_select_date1" class="traning_calendar_datepicker">
							</div>
							<div id="traning_pop_date2" class="traning_pop_date">
								<div>
									<input type="date" id="traning_select_date2" value="" name="traning_select_date2" class="traning_calendar_datepicker">
									<p> ~ </p>
									<input type="date" id="traning_select_date3" value="" name="traning_select_date3" class="traning_calendar_datepicker2" placeholder="날짜 선택">
								</div>
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
									<c:forEach items="${player_list}" var="my">
										<div>
											<label for="traning_player_choose_${my.playernum}">
												<input type="hidden" value="${my.playernum}" name="traning_player_number">
												<input type="checkbox" id="traning_player_choose_${my.playernum}" onclick="peopleChoose(this)" name="traning_player_choose" data-type="${my.playernum}" value="${my.pname}" hidden>
												<span>
													<img alt="체크 이미지" src="./image/soccer/icon/player_chk.png" class="player_chk_img">
													<img alt="선수 이미지" src="./image/baseball/player/${my.pimage}" class="player_img">
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
						<div class="traning_map_inner">
							<p class="traning_choose_pop_title">훈련 장소 입력</p>
							<div class="traning_map_flex">
								<input type="text" id="traning_map_input" name="traning_map_input" maxlength="50" placeholder="훈련 장소 입력(50자 이내)">
							</div>
						</div>
						<div class="traning_plus_whole">
							<p class="traning_choose_pop_title">훈련 일정</p>
							<p class="traning_choose_pop_title2">일정은 최대 3개까지 추가 가능합니다. (일정은 30자 이내)</p>
							<div class="traning_plus_inner">
								<div class="traning_plus_row">
									<input type="date" id="traning_plus_date1" value="" name="traning_plus_date" class="traning_calendar_input">
									<div class="traning_plus_flex">
										<div>
											<input type="number" id="traning_plus_time1_1" value="" name="traning_plus_time" class="traning_plus_time" placeholder="00">
											<p>:</p>
											<input type="number" id="traning_plus_time1_2" value="" name="traning_plus_time" class="traning_plus_time" placeholder="00">
										</div>
									</div>
									<div class="traning_plus_flex">
										<input type="text" name="traning_plus_content1" maxlength="30" class="traning_plus_content" placeholder="일정 입력(30자 이내)">
										<button type="button" onclick="schedulePlus(this)" class="traning_plus_btn">일정 추가</button>
									</div>
								</div>
							</div>
						</div>
						<div class="traning_memo_whole">
							<p class="traning_choose_pop_title">훈련 메모</p>
							<p class="traning_choose_pop_title2">이번 훈련에 대하여 메모가 있으시다면 적어주세요.(최대 300자)</p>
							<div class="traning_memo_inner">
								<textarea id="training_memo_txtarea" name="training_memo_txtarea" maxlength="300" onkeyup="scheduleKeyup()"></textarea>
								<p><span id="traning_memo_len">0</span>/300</p>
							</div>
						</div>
						<div class="training_memo_btn_whole">
							<button type="button" onclick="scheduleHide()" class="training_memo_btn memo_btn_cancel">닫기</button>
							<button type="button" onclick="traingSaveChk()" class="training_memo_btn memo_btn_save">저장</button>
						</div>
					</form>
				</div>
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
				location.href='baseballCalendarMove?name='+area_eng+'&area='+area_kor+'&start='+wholestart;
			}
			//스케줄
			function scheduleShow(){
				var calendar_choosed_yy = $('#calendar_choosed_yy').val();
				var calendar_choosed_mm = $('#calendar_choosed_mm').val();
				var calendar_choosed_dd = $('#calendar_choosed_dd').val();
				var selected_date = calendar_choosed_yy + '-' + calendar_choosed_mm + '-' + calendar_choosed_dd;
				$('#traning_select_date1').attr('value', selected_date);
				$('#traning_select_date2').attr('value', selected_date);
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
			function traningDateSelect(ths){
				var date_type = ths.dataset.type;
				if(date_type == '전지훈련'){
					//전지훈련 선택 시
					$('#traning_pop_date1').hide();
					$('#traning_pop_date2').show();
					$('#traning_show_date3').hide();
					$('#traning_show_date4').show();
				}
				else{
					//당일 선택 시
					$('#traning_pop_date1').show();
					$('#traning_pop_date2').hide();
					$('#traning_show_date3').show();
					$('#traning_show_date4').hide();
				}
			}
			var people_array = [];
			function peopleChooseAll(){
				people_array = [];
				$('input[name="traning_player_choose"]').prop('checked', true);
				$('input[name="traning_player_choose"]').each(function(){
					var player_name = $(this).val();
					var player_num = $(this).attr('data-type');
					if($(this).is(':checked')){//체크했을 때
						people_array.push(player_name, player_num);
					}
					else{//체크 해제시
						var people_num = people_array.indexOf(player_num);
						people_array.splice((player_num - 1), 2);
					}
				});
				$('#chked_member_val').attr('value', people_array);
			}
			function peopleChoose(ths){
				var people_len = $('input[name="traning_player_choose"]').length;
				var people_chk_len = $('input[name="traning_player_choose"]:checked').length;
				if(people_len == people_chk_len){//선수들 전체 다 선택 됐을 때
					$('#traning_people_select1').prop('checked', true);
					$('#traning_people_select2').prop('checked', false);
				}
				else{
					$('#traning_people_select1').prop('checked', false);
					$('#traning_people_select2').prop('checked', true);
				}
				//선택된 선수 및 번호 배열에 넣기
				var ths_val = $(ths).val();
				var ths_num = ths.dataset.type;
				if($(ths).is(':checked')){//체크했을 때
					people_array.push(ths_val, ths_num);
				}
				else{//체크 해제시
					var people_num = people_array.indexOf(ths_num);
					people_array.splice((people_num - 1), 2);
				}
				$('#chked_member_val').attr('value', people_array);
			}
			var schedule_len = 1;
			function schedulePlus(object){
				schedule_len++;
				if(schedule_len > 3){
					alertShow('추가 불가', '3개 이상의 훈련 일정은 추가하실 수 없습니다.');
				}else{
					var schedule_div = '';
					schedule_div += '<div class="traning_plus_row" id="traning_plus_row' + schedule_len + '">';
					schedule_div += '	<div class="traning_plus_flex">';
					schedule_div += '		<input type="date" id="traning_plus_date' + schedule_len + '" value="" name="traning_plus_date' + schedule_len + '" class="traning_calendar_input">';
					schedule_div += '		<div>';
					schedule_div += '			<input type="number" id="traning_plus_time' + schedule_len + '_1" value="" name="traning_plus_time' + schedule_len + '_1" class="traning_plus_time" placeholder="00">';
					schedule_div += '			<p>:</p>';
					schedule_div += '			<input type="number" id="traning_plus_time' + schedule_len + '_2" value="" name="traning_plus_time' + schedule_len + '_2" class="traning_plus_time" placeholder="00">';
					schedule_div += '		</div>';
					schedule_div += '	</div>';
					schedule_div += '	<div class="traning_plus_flex">';
					schedule_div += '		<input type="text" name="traning_plus_content' + schedule_len + '" class="traning_plus_content" placeholder="일정 입력(30자 이내)" maxlength="30">';
					schedule_div += '		<button type="button" data-id="traning_plus_row' + schedule_len + '" class="traning_plus_btn traning_minus_btn" onclick="scheduleDelete(this)">일정 삭제</button>';
					schedule_div += '	</div>';
					schedule_div += '</div>';
					$('.traning_plus_inner').append(schedule_div);
				}
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
			function scheduleKeyup(){
				var schedule_len = $('#training_memo_txtarea').val().length;
				$('#traning_memo_len').text(schedule_len);
				if(schedule_len > 300){
					alertShow('메모 글자', '300자 이하로 적어주세요.');
					$('#traning_memo_len').text('300');
				}
			}
			$('.traning_plus_content').on('keyup', function(){
				var input_len = $(this).val().length;
				if(input_len >= 31){
					alertShow('텍스트 초과', '일정은 최대 30자입니다.');
				}
			});
			var TRDATE_array = [];
			function traingSaveChk(){
				TRDATE_array = [];//배열 초기화
				var traning_date_choose = $('input[name="traning_date_choose"]:checked').val();
				var date_val = $('#traning_select_date1').val();
				var date_val2 = $('#traning_select_date2').val();
				var date_val3 = $('#traning_select_date3').val();
				if(traning_date_choose == '당일'){
					if(date_val == ''){
						alertShow('날짜 선택', '날짜를 선택해주세요.<br/>선택하신 날짜로 저장됩니다.');
						return false;
					}
				}
				else{
					if(date_val2 == '' || date_val3 == ''){
						alertShow('날짜 선택', '날짜를 선택해주세요.<br/>선택하신 날짜로 저장됩니다.');
						return false;
					}
				}
				var member_len = $('input[name="traning_player_choose"]:checked').length;
				if(member_len <= 0){
					alertShow('인원 선택', '인원은 1명 이상 선택되어야 합니다.');
					return false;
				}
				var plus_num = $('.traning_calendar_input').length;
				for(var i = 1; i <= plus_num; i++){
					var plus_date = $('input[id="traning_plus_date' + i + '"]').val();
					var traning_plus_time1 = $('input[id="traning_plus_time' + i + '_1"]').val();
					var traning_plus_time2 = $('input[id="traning_plus_time' + i + '_2"]').val();
					var traning_plus_content = $('input[name="traning_plus_content' + i + '"]').val();
					if(plus_date != '' && traning_plus_time1 != '' && traning_plus_time2 != '' && traning_plus_content != ''){
						TRDATE_array.push(plus_date,traning_plus_time1,traning_plus_time2,traning_plus_content);
						$('#chked_traing_val').attr('value', TRDATE_array);
					}
				}
				$('#baseball_calendar_save').submit();
			}
			//스케줄
			function listGet(ths){
				var ths_type = ths.dataset.number;
				var area_eng = $('#area_eng').val();
				var area_kor = $('#area_kor').val();
				wholestart = startyy + '-' + startmm + '-01';
				location.href='baseballCalendarGet?name='+area_eng+'&area='+area_kor+'&start='+wholestart+'&number='+ths_type;
				listShow();
			}
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
			//수정
			function traingChange(){
				$('.traning_show_whole input[type="text"]').prop('disabled', false);
				$('.traning_show_whole input[type="number"]').prop('disabled', false);
				$('.traning_show_whole input[type="radio"]').prop('disabled', false);
				$('.traning_show_whole input[type="date"]').prop('disabled', false);
				$('textarea[name="training_memo_txtarea2"]').prop('disabled', false);
				$('input[name="traning_player_choose2"]').prop('disabled', false);
				$('.traning_btn_new').show();
				$('.traning_btn_new').prop('disabled', false);
				$('.memo_btn_save1').hide();
				$('.memo_btn_save2').show();
			}
			var people_array2 = [];
			function peopleChooseAll2(){
				people_array2 = [];
				$('input[name="traning_player_choose2"]').prop('checked', true);
				$('input[name="traning_player_choose2"]').each(function(){
					var player_name = $(this).val();
					var player_num = $(this).attr('data-type');
					if($(this).is(':checked')){//체크했을 때
						people_array2.push(player_name, player_num);
					}
					else{//체크 해제시
						var people_num = people_array.indexOf(player_num);
						people_array2.splice((player_num - 1), 2);
					}
				});
				$('#chked_member_val2').attr('value', people_array2);
			}
			var people_array2 = [];
			function peopleChoose2(ths){
				var chked_member_val2 = $('#chked_member_val2').val();
				people_array2 = chked_member_val2.split(',');
				var people_len = $('input[name="traning_player_choose2"]').length;
				var people_chk_len = $('input[name="traning_player_choose2"]:checked').length;
				if(people_len == people_chk_len){//선수들 전체 다 선택 됐을 때
					$('#traning_people_select3').prop('checked', true);
					$('#traning_people_select4').prop('checked', false);
				}
				else{
					$('#traning_people_select3').prop('checked', false);
					$('#traning_people_select4').prop('checked', true);
				}
				//선택된 선수 및 번호 배열에 넣기
				var ths_val = $(ths).val();
				var ths_num = ths.dataset.type;
				if($(ths).is(':checked')){//체크했을 때
					people_array2.push(ths_val, ths_num);
				}
				else{//체크 해제시
					var people_num = people_array.indexOf(ths_num);
					people_array2.splice((people_num - 1), 2);
				}
				$('#chked_member_val2').attr('value', people_array2);
				console.log(people_array2);
			}
			function schedulePlus2(object){
				var schedule_len2 = $('.traning_plus_row2').length;
				schedule_len2++;
				console.log(schedule_len2);
				if(schedule_len2 > 3){
					alertShow('추가 불가', '3개 이상의 훈련 일정은 추가하실 수 없습니다.');
				}else{
					var schedule_div = '';
					schedule_div += '<div class="traning_plus_row traning_plus_row2" id="traning_plus2_row' + schedule_len2 + '">';
					schedule_div += '	<div class="traning_plus_flex">';
					schedule_div += '		<input type="date" id="traning_plus2_date' + schedule_len2 + '" value="" name="traning_plus2_date' + schedule_len + '" class="traning_calendar_input traning_calendar_input2">';
					schedule_div += '		<div>';
					schedule_div += '			<input type="number" id="traning_plus2_time' + schedule_len2 + '_1" value="" name="traning_plus2_time' + schedule_len + '_1" class="traning_plus_time" placeholder="00">';
					schedule_div += '			<p>:</p>';
					schedule_div += '			<input type="number" id="traning_plus2_time' + schedule_len2 + '_2" value="" name="traning_plus2_time' + schedule_len + '_2" class="traning_plus_time" placeholder="00">';
					schedule_div += '		</div>';
					schedule_div += '	</div>';
					schedule_div += '	<div class="traning_plus_flex">';
					schedule_div += '		<input type="text" name="traning_plus2_content' + schedule_len2 + '" class="traning_plus_content" placeholder="일정 입력(30자 이내)" maxlength="30">';
					schedule_div += '		<button type="button" data-id="traning_plus2_row' + schedule_len2 + '" class="traning_plus_btn traning_minus_btn" onclick="scheduleDelete2(this)">일정 삭제</button>';
					schedule_div += '	</div>';
					schedule_div += '</div>';
					$('.traning_plus_inner2').append(schedule_div);
				}
			}
			function scheduleDelete2(ths){
				var ths_id = ths.dataset.id;
				var sche_len = $('.traning_plus_row2').length;
				$('#'+ths_id).remove();
				for(var i = schedule_len; i <= sche_len; i++){
					$('#traning_plus2_row2'+sche_len).attr('id', 'traning_plus2_row'+(sche_len - 1));
					$('#traning_plus2_row2'+(sche_len - 1)).find('#traning_plus2_date'+sche_len).attr('id', 'traning_plu2s_date'+(sche_len - 1));
					$('#traning_plus2_row2'+(sche_len - 1)).find('#traning_plus2_time'+sche_len+'_1').attr('id', 'traning_plus2_date'+(sche_len - 1)+'_1');
					$('#traning_plus2_row2'+(sche_len - 1)).find('#traning_plus2_time'+sche_len+'_2').attr('id', 'traning_plus2_date'+(sche_len - 1)+'_2');
					$('#traning_plus2_row2'+(sche_len - 1)).find('.traning_plus2_content'+sche_len).attr('name', 'traning_plus2_content'+(sche_len - 1));
					$('#traning_plus2_row2'+(sche_len - 1)).find('button').attr('data-id', 'traning_plus2_row2'+(sche_len - 1));
				}
				sche_len--;
			}
			var TRDATE_array2 = [];
			function traingUpdateChk(){
				TRDATE_array2 = [];//배열 초기화
				var traning_date_choose = $('input[name="traning_date_choose2"]:checked').val();
				var date_val = $('#traning_select_date4').val();
				var date_val2 = $('#traning_select_date5').val();
				var date_val3 = $('#traning_select_date6').val();
				if(traning_date_choose == '당일'){
					if(date_val == ''){
						alertShow('날짜 선택', '날짜를 선택해주세요.<br/>선택하신 날짜로 저장됩니다.');
						return false;
					}
				}
				else{
					if(date_val2 == '' || date_val3 == ''){
						alertShow('날짜 선택', '날짜를 선택해주세요.<br/>선택하신 날짜로 저장됩니다.');
						return false;
					}
				}
				var member_len = $('input[name="traning_player_choose2"]:checked').length;
				if(member_len <= 0){
					alertShow('인원 선택', '인원은 1명 이상 선택되어야 합니다.');
					return false;
				}
				var plus_num = $('.traning_calendar_input2').length;
				for(var i = 1; i <= plus_num; i++){
					var plus_date = $('input[id="traning_plus2_date' + i + '"]').val();
					var traning_plus_time1 = $('input[id="traning_plus2_time' + i + '_1"]').val();
					var traning_plus_time2 = $('input[id="traning_plus2_time' + i + '_2"]').val();
					var traning_plus_content = $('input[name="traning_plus2_content' + i + '"]').val();
					if(plus_date != '' && traning_plus_time1 != '' && traning_plus_time2 != '' && traning_plus_content != ''){
						TRDATE_array.push(plus_date,traning_plus_time1,traning_plus_time2,traning_plus_content);
						$('#chked_traing_val2').attr('value', TRDATE_array);
					}
				}
				$('#baseball_calendar_update').submit();
			}
			//삭제
			function listDelete() {
				var startdate = $('#startdate').val();
				var area_eng = $('#area_eng').val();
				var area_kor = $('#area_kor').val();
				var num = $('#chked_member_num2').val();
				window.location.href='baseballCalendarDelete?name='+area_eng+'&area='+area_kor+'&start='+startdate+'&num='+num;
			}
		</script>
	</body>
</html>