<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <style type="text/css">
         /*훈련일기 팝업 시작*/
         .traning_pop_whole,
         .map_pop_whole{
            position: fixed;
            width: 100vw;
            height: 100vh;
            bottom: -200vh;
            left: 0;
            z-index: 4;
            transition: 0.5s;
         }
         .traning_pop_whole.pop_show,
         .map_pop_whole.pop_show{
            bottom: 0;
            transition: 0.5s;
         }
         .traning_pop_bg,
         .map_pop_bg{
            position: fixed;
            width: 100vw;
            height: 100vh;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index:0;
            display: none;
         }
         .traning_pop_box{
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
         .traning_pop_flex{
            max-width: 1000px;
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: start;
            margin: 0 auto;
         }
         p.traning_pop_title{
            font-size: 24px;
            line-height: 36px;
            font-weight: bold;
            color: #3d3d3d;
            text-align: center;
            margin: 0 auto;
         }
         .common_pop_hide{
            min-width: 30px;
            width: 30px;
            height: 30px;
         }
         p.traning_pop_subtext{
            font-size: 16px;
            line-height: 24px;
            font-weight: 400;
            color: #999;
            text-align: center;
            margin: 10px auto 0 auto;
         }
         .traning_pop_inner{
            width: 100%;
            max-width: 1000px;
            height: calc(100% - 70px);
            overflow: hidden;
            overflow-y: auto;
            margin: 0 auto;
         }
         .traning_pop_inner::-webkit-scrollbar{
            display: none;
         }
         .traning_people_inner{
            width: 100%;
            margin: 0 auto;
            text-align: center;
         }
         .traning_people_choose{
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
         .traning_people_choose label{
            display: block;
            width: calc(16.6% - 10px);
            max-width: 100%;
            margin: 0;
         }
         .traning_people_choose label + label{
            margin-left: 10px;
         }
         .traning_people_choose label:nth-child(6n + 1){
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
         p.no_data_txt{
            padding-top: 20px;
         }
         input[name="traning_player_choose"] + span > img.player_img{
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            margin: 0 auto;
         }
         input[name="traning_player_choose"] + span > img.player_chk_img{
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
         input[name="traning_player_choose"]:checked + span > img.player_chk_img{
            display: block;
         }
         .traning_people_list div p{
            text-align: center;
            margin: 0 auto;
         }
         .traning_date_pop_choose{
            width: 100%;
            height: auto;
            margin: 0 auto;
         }
         p.traning_choose_pop_title{
            font-size: 17px;
            line-height: 28px;
            color: #777;
            text-align: center;
            margin: 60px auto 10px auto;
         }
         p.traning_choose_pop_title2{
            font-size: 14px;
            line-height: 20px;
            color: #999;
            text-align: center;
            margin: 0 auto 10px auto;
         }
         .traning_date_pop_flex{
            display: flex;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
         }
         .traning_date_pop_choose label{
            display: block;
            width: max-content;
            max-width: 100%;
            margin: 0;
         }
         .traning_date_pop_choose label + label{
            margin-left: 10px;
         }
         input[name="traning_date_choose"] + span{
            min-width: auto;
            width: max-content;
            max-width: 100%;
            padding: 10px 20px;
            background-color: #fff;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
            margin: 0;
         }
         input[name="traning_date_choose"]:checked + span{
            color: #f9f9f9;
         }
         .traning_pop_date{
            width: 100%;
            height: auto;
            margin: 10px auto 0 auto;
         }
         .traning_pop_date#traning_pop_date2{
            display: none;
         }
         .traning_pop_date#traning_pop_date2 div{
            display: flex;
            flex-wrap: nowrap;
         }
         .traning_pop_date#traning_pop_date2 div p{
            line-height: 42px;
            margin: 0 10px;
         }
         .traning_map_flex select,
         input.traning_calendar_input,
         input.traning_calendar_datepicker,
         input.traning_calendar_datepicker2{
            width: calc(100% - 22px);
            height: 40px;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
            padding: 0 10px;            
         }
         input.traning_calendar_input{
            max-width: 130px;
         }
         .schedule_list_txt{
            margin: 0 auto!important;
            text-align: center!important;
         }
         .schedule_list_txt img{
            width: 40px;
         }
         .schedule_list_txt p{
            width: 180px!important;
            margin: 0 auto!important;
         }
         .calendar_schedule_whole{
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
            background: #fff;
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
         .custom_calendar_table tbody td:nth-child(1).calendar_td.select_day span.work_in,
         .custom_calendar_table tbody td:nth-child(7).calendar_td.select_day span.work_in{
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
                        "   <thead class='cal_date'>" +
                        "      <th><button type='button' class='prev' onclick='calendarMove(this)' data-type='prev'><img src='./image/soccer/icon/arrow_prev_gr.png' alt=''></button></th>" +
                        "      <th colspan='5' class='date_title'><p><span id='date_yy'>" + year + "</span>년 <span id='date_mm'>" + ('0'+month).slice(-2) + "</span>월</p></th>" +
                        "      <th><button type='button' class='next' onclick='calendarMove(this)' data-type='next'><img src='./image/soccer/icon/arrow_next_gr.png' alt=''></button></th>" +
                        "   </thead>" +
                        "   <thead class='cal_week'>" +
                        "      <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
                        "   </thead>" +
                        "   <tbody id='custom_set_date'>" +
                        "   </tbody>" +
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
            $(".select_team1").click(function(){
               var team = $("input[name='team1']:checked").val();
               var place="";
               if(team=='강원') place="강릉종합운동장";
               else if(team=="광주") place="광주축구전용구장";
               else if(team=="김천") place="김천종합운동장";
               else if(team=="대구") place="DGB대구은행파크";
               else if(team=="대전") place="대전월드컵경기장";
               else if(team=="서울") place="서울월드컵경기장";
               else if(team=="수원") place="수원종합운동장";
               else if(team=="울산") place="울산문수월드컵경기장";
               else if(team=="인천") place="인천축구전용경기장";
               else if(team=="전북") place="전주월드컵경기장";
               else if(team=="제주") place="제주월드컵경기장";
               else if(team=="포항") place="포항스틸야드";
               $("#gamePlace").val(place).prop("selected", true);
            });
         });
         function mapShow(){
            $('body').css('overflow', 'hidden');
            $('.map_pop_whole').addClass("pop_show");
            $('.map_pop_bg').show();
         }//mapShow
          function mapHide(){
            $('body').css('overflow', 'auto');
            $('.map_pop_whole').removeClass("pop_show");
            $('.map_pop_bg').hide();
         }//mapHide
         function gameMap(gameplace){
            mapShow();
             var gyung = "";
             var wui = "";
             var imageSrc = null,// 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(150,150),// 마커이미지의 크기입니다 
            imageOption ={offset: new kakao.maps.Point(90, 115)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
            //경도,위도 찾기
             if(gameplace=="강릉종합운동장"){
                gyung = 129.1022435;
                wui = 37.51610640000001 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_강원.png';
             }else if(gameplace=="춘천송암스포츠타운"){
                gyung = 127.6911534;
                wui = 37.8542953 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_강원.png';
             }else if (gameplace=="광주축구전용구장"){
                gyung = 126.8749676;
                wui = 35.1310482 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_광주.png';
             }else if (gameplace=="김천종합운동장"){
                gyung = 128.0862916;
                wui = 36.1395332 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_김천.png';
             }else if (gameplace=="DGB대구은행파크"){
                gyung = 128.5882175;
                wui = 35.8812441 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_대구.png';
             }else if (gameplace=="대전월드컵경기장"){
                gyung = 127.324859;
                wui = 36.3652954 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_대전.png';
             }else if (gameplace=="서울월드컵경기장"){
                gyung = 126.8972735;
                wui = 37.5682617 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_서울.png';
             }else if (gameplace=="수원종합운동장"){
                gyung = 127.0113456;
                wui = 37.297749 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_수원.png';
             }else if (gameplace=="울산문수월드컵경기장"){
                gyung = 129.2595839;
                wui = 35.5352422 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_울산.png';
             }else if (gameplace=="인천축구전용경기장"){
                gyung = 126.6431483;
                wui = 37.4653709 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_인천.png';
             }else if (gameplace=="전주월드컵경기장"){
                gyung = 127.0644156;
                wui = 35.8681258 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_전북.png';
             }else if (gameplace=="제주월드컵경기장"){
                gyung = 126.5093244;
                wui = 33.2461852 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_제주.png';
             }else{
                gyung = 129.3844018;
                wui = 35.9977189 ;
                imageSrc = 'https://mbc-project-test.netlify.app/image/map_포항.png';
             }
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption ={ 
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
               <c:if test="${adminlogin}">
                  <button type="button" class="schedule_plus_btn" onclick="scheduleShow()">경기 등록+</button>
                  <button type="button" class="schedule_plus_btn" onclick="location.href='soccer_gameinfo'">경기 목록</button>
               </c:if>
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
                           if(date_wh == resultgamedate){
                              $('#'+date_wh).append('<span class="work_in">' + team1 + ' vs ' + team2);
                           }
                        });
                     </script>
                     <div class="schedule_list_inner day_${calendar.gamedate}" data-number="${calendar.gamenum}">
                        <div class="schedule_list_txt">
                           <c:choose>
                              <c:when test="${calendar.season == '파이널'}">
                                 <p style="color: blue"> <${calendar.season} 시즌> </p>
                              </c:when>
                              <c:otherwise>
                                 <p> <${calendar.season} 시즌> </p>                                 
                              </c:otherwise>
                           </c:choose>
                           <p>
                           <img alt="" src="./image/soccer/logo/${calendar.team1}.png" width="25px"> ${calendar.team1} vs ${calendar.team2} <img alt="" src="./image/soccer/logo/${calendar.team2}.png" width="25px">
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
               <form action="soccerGameSchedule" id="soccer_calendar_save" method="post">
                  <c:choose>
                     <c:when test="${areaset}">
                        <input type="hidden" value="${area.area_eng}" name="soccer_calendar_team1">
                        <input type="hidden" value="${area.area_kor}" name="soccer_calendar_team2">
                     </c:when>
                  </c:choose>
                  <input type="hidden" id="chked_member_val" name="chked_member_val">
                  <input type="hidden" id="chked_traing_val" name="chked_traing_val">
                  <input type="hidden" id="calendar_info_val" name="calendar_info_val" value="soccer">
                  <div class="traning_map_inner">
                     <p class="traning_choose_pop_title">시즌 선택</p>
                     <div class="traning_map_flex">
                        <select name="gameSeason" id="gameSeason">
                           <option value="정규">정규
                           <option value="파이널">파이널
                        </select>
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
                  <div class="traning_people_inner">
                     <p class="traning_choose_pop_title">팀 선택</p>
                     <div class="traning_people_choose">
                        <div class="select_team1">
                           <label for="select_team1_gangwon">
                              <input type="radio" id="select_team1_gangwon" name="team1" value="강원">
                              <img alt="" src="./image/soccer/logo/강원.png" width="50px">
                           </label>
                           <label for="select_team1_gwangju">
                              <input type="radio" id="select_team1_gwangju" name="team1" value="광주">
                              <img alt="" src="./image/soccer/logo/광주.png" width="50px">
                           </label>
                           <label for="select_team1_gimcheon">
                              <input type="radio" id="select_team1_gimcheon" name="team1" value="김천">
                              <img alt="" src="./image/soccer/logo/김천.png" width="50px">
                           </label>
                           <label for="select_team1_daegu">
                              <input type="radio" id="select_team1_daegu" name="team1" value="대구">
                              <img alt="" src="./image/soccer/logo/대구.png" width="50px">
                           </label>
                           <label for="select_team1_daejeon">
                              <input type="radio" id="select_team1_daejeon" name="team1" value="대전">
                              <img alt="" src="./image/soccer/logo/대전.png" width="50px">
                           </label>
                           <label for="select_team1_seoul">
                              <input type="radio" id="select_team1_seoul" name="team1" value="서울">
                              <img alt="" src="./image/soccer/logo/서울.png" width="50px">
                           </label>
                           <label for="select_team1_suwon">
                              <input type="radio" id="select_team1_suwon" name="team1" value="수원">
                              <img alt="" src="./image/soccer/logo/수원.png" width="50px">
                           </label>
                           <label for="select_team1_ulsan">
                              <input type="radio" id="select_team1_ulsan" name="team1" value="울산">
                              <img alt="" src="./image/soccer/logo/울산.png" width="50px">
                           </label>
                           <label for="select_team1_incheon">
                              <input type="radio" id="select_team1_incheon" name="team1" value="인천">
                              <img alt="" src="./image/soccer/logo/인천.png" width="50px">
                           </label>
                           <label for="select_team1_jeonbuk">
                              <input type="radio" id="select_team1_jeonbuk" name="team1" value="전북">
                              <img alt="" src="./image/soccer/logo/전북.png" width="50px">
                           </label>
                           <label for="select_team1_jeju">
                              <input type="radio" id="select_team1_jeju" name="team1" value="제주">
                              <img alt="" src="./image/soccer/logo/제주.png" width="50px">
                           </label>
                           <label for="select_team1_pohang">
                              <input type="radio" id="select_team1_pohang" name="team1" value="포항">
                              <img alt="" src="./image/soccer/logo/포항.png" width="50px">
                           </label>
                        </div>
                        <p>  vs  </p>
                        <div class="select_team2">
                           <label for="select_team2_gangwon">
                              <input type="radio" id="select_team2_gangwon" name="team2" value="강원">
                              <img alt="" src="./image/soccer/logo/강원.png" width="50px">
                           </label>
                           <label for="select_team2_gwangju">
                              <input type="radio" id="select_team2_gwangju" name="team2" value="광주">
                              <img alt="" src="./image/soccer/logo/광주.png" width="50px">
                           </label>
                           <label for="select_team2_gimcheon">
                              <input type="radio" id="select_team2_gimcheon" name="team2" value="김천">
                              <img alt="" src="./image/soccer/logo/김천.png" width="50px">
                           </label>
                           <label for="select_team2_daegu">
                              <input type="radio" id="select_team2_daegu" name="team2" value="대구">
                              <img alt="" src="./image/soccer/logo/대구.png" width="50px">
                           </label>
                           <label for="select_team2_daejeon">
                              <input type="radio" id="select_team2_daejeon" name="team2" value="대전">
                              <img alt="" src="./image/soccer/logo/대전.png" width="50px">
                           </label>
                           <label for="select_team2_seoul">
                              <input type="radio" id="select_team2_seoul" name="team2" value="서울">
                              <img alt="" src="./image/soccer/logo/서울.png" width="50px">
                           </label>
                           <label for="select_team2_suwon">
                              <input type="radio" id="select_team2_suwon" name="team2" value="수원">
                              <img alt="" src="./image/soccer/logo/수원.png" width="50px">
                           </label>
                           <label for="select_team2_ulsan">
                              <input type="radio" id="select_team2_ulsan" name="team2" value="울산">
                              <img alt="" src="./image/soccer/logo/울산.png" width="50px">
                           </label>
                           <label for="select_team2_incheon">
                              <input type="radio" id="select_team2_incheon" name="team2" value="인천">
                              <img alt="" src="./image/soccer/logo/인천.png" width="50px">
                           </label>
                           <label for="select_team2_jeonbuk">
                              <input type="radio" id="select_team2_jeonbuk" name="team2" value="전북">
                              <img alt="" src="./image/soccer/logo/전북.png" width="50px">
                           </label>
                           <label for="select_team2_jeju">
                              <input type="radio" id="select_team2_jeju" name="team2" value="제주">
                              <img alt="" src="./image/soccer/logo/제주.png" width="50px">
                           </label>
                           <label for="select_team2_pohang">
                              <input type="radio" id="select_team2_pohang" name="team2" value="포항">
                              <img alt="" src="./image/soccer/logo/포항.png" width="50px">
                           </label>
                        </div>
                     </div>
                  </div>
                  <div class="traning_map_inner">
                     <p class="traning_choose_pop_title">경기 장소 선택</p>
                     <div class="traning_map_flex">
                        <select name="gamePlace" id="gamePlace">
                           <option value="강릉종합운동장">강릉종합운동장
                           <option value="춘천송암스포츠타운">춘천송암스포츠타운
                           <option value="광주축구전용구장">광주축구전용구장
                           <option value="김천종합운동장">김천종합운동장
                           <option value="DGB대구은행파크">DGB대구은행파크
                           <option value="대전월드컵경기장">대전월드컵경기장
                           <option value="서울월드컵경기장">서울월드컵경기장
                           <option value="수원종합운동장">수원종합운동장
                           <option value="울산문수월드컵경기장">울산문수월드컵경기장
                           <option value="인천축구전용경기장">인천축구전용경기장
                           <option value="전주월드컵경기장">전주월드컵경기장
                           <option value="제주월드컵경기장">제주월드컵경기장
                           <option value="포항스틸야드">포항스틸야드
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
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키입력"></script>
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
            location.href='soccerScheduleMove?start='+wholestart;
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