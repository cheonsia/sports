<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 야구 -->
		<script type="text/javascript">
			function logoClick(){//헤더&푸터 로고 클릭시
				var location = window.location.pathname;//페이지 이름
				if(location == '/sports/'){//메인페이지에서 클릭할 경우
					window.scrollTo({top: 0, behavior: 'smooth'});//스크롤 자동 위로 올리기
				}
				else{//메인페이지 외 다른 페이지에서 클릭할 경우
					window.location.href = 'baseballmain';//메인으로 이동
				}
			}
			function sessionSet(eng, kor){
				$('#baseball_area').attr("value", eng);//soccer_area 에 data-id 값 할당
				$('#side_rightbar_txt').val(kor);//side_rightbar_txt 에 data-type 값 할당
				$.ajax({//동기화 자세한 설명은 패스한다. 모르시면 안 돼요...ㅠㅠ
					type: "post",
					url: "areaClick",
					data:{"area_en":eng,"area_ko":kor},
					async: true,
					success: function(){
						//addAttribute, HttpSession에 저장시키기 위함이라 별다른 문구 송출 X
					},
					error: function(){
						alertShow('로딩 중','로딩 중입니다.<br/>잠시만 기다려주세요.');
					},
				});
				$('.header_logo_inner a').removeClass('clicked_on');
				$('#baseball_'+eng).addClass('clicked_on');
			}
			function baseballClick(ths){//top 속 야구 로고 클릭 시
				var ths_id = ths.dataset.id;//각 야구 로고 속 data-id 값을 가져옴
				var ths_type = ths.dataset.type;//각 야구 로고 속 data-type 값을 가져옴
				sessionSet(ths_id, ths_type);
				var ths_href = window.location.pathname;
				if(ths_href.includes('playerinput')||ths_href.includes('detail')||ths_href.includes('playerdelete')||ths_href.includes('playerupdate')){
					ths_href="selectTeam";
				}
				window.location.replace(ths_href + "?name=" + ths_id + "&play=야구");
			}
			function playMove(){//좌측 사이드메뉴 선수 목록 클릭 시
				var area_val = $('#baseball_area').val();//baseball_area 값 가져옴
				if(area_val == "" || area_val== null) area_val = "ALL";
				location.href = "selectTeam?name="+area_val+"&play=야구";//컨트롤러에 영어 지역 가져감
			}
			function playRandom(){//좌측 사이드메뉴 선수 랜덤 클릭 시
				var area_val = $('#baseball_area').val();//baseball_area 값 가져옴
				if(area_val == "" || area_val== null) area_val = "ALL";
				location.href = "baseballRandom?name="+area_val;//컨트롤러에 영어 지역 가져감
			}
			function baseball_highlight(){//좌측 사이드메뉴 하이라이트 클릭 시
				var area_val = $('input[name="team"]').val();//baseball_area 값 가져옴
				if(area_val == "" || area_val== null) area_val = "ALL";
				window.location.href = "baseball_highlight?name="+area_val;//컨트롤러에 영어/한글 지역 가져감
			}
			function baseballCalendarMove(){//좌측 사이드메뉴 코치존 클릭 시
				var area_val = $('#baseball_area').val();//baseball_area 값 가져옴
				if(area_val == "" || area_val== null) area_val = "ALL";
				var area_val_han = $('#side_rightbar_txt').val();//side_rightbar_txt 값 가져옴
				location.href = "baseballcalendar?name="+area_val+"&area="+area_val_han;//컨트롤러에 영어/한글 지역 가져감
			}
			function baseballStrategyMove(){//좌측 사이드메뉴 코치존 클릭 시
				var area_val = $('#baseball_area').val();//baseball_area 값 가져옴
				if(area_val == "" || area_val== null) area_val = "ALL";
				var area_val_han = $('#side_rightbar_txt').val();//side_rightbar_txt 값 가져옴
				location.href = "baseballstrategy?name="+area_val+"&area="+area_val_han;//컨트롤러에 영어/한글 지역 가져감
			}
			/*팝업 구역*/
			//alert 팝업은 디자인이 들어간 div 폼으로 사용 예정. 코드는 아래와 같이 써주세요!!
			//alertShow("타이틀","서브타이틀")
			function alertShow(txt,txt2){//alert 팝업 보이게
				$('.common_fixed_bg').fadeIn(500, function (){
					$(this).show();
				});;
				$('.common_alert_whole').show();
				$('.common_alert_title').html(txt);
				$('.common_alert_subtxt').html(txt2);
			}
			function commonHide(){//전체 팝업 닫기
				$('.common_fixed_bg').fadeOut(500, function (){
					$(this).hide();
				});;
				$('.common_alert_whole').hide();
			}
			$(document).ready(function(){//제이쿼리 필수 준비
				var normallogin = $("#normallogin").val();
				var superlogin = $("#superlogin").val();
				var sportstype = `${sportstype}`;
				if(sportstype == '야구'){
				 	if(normallogin=='true' || superlogin=='true'){
				 		var team = $("#memberTeam").val();
						teamEng = (team == '두산') ? 'DOOSAN' : (team == '삼성') ? 'SAMSUNG' : (team == '롯데') ? 'LOTTE' : (team == '키움') ? 'KIWOOM' : (team == '한화') ? 'HANHWA' : team;
						sessionSet(teamEng,team);
					}
				}else{
					sessionSet("ALL","ALL");
				}
				$('.side_rightbar_flex a').on('click', function(){
					if($(this).hasClass('side_menu_click')){
						$(this).toggleClass("side_menu_on");
				 	}
				});
				/*서버 절대 불필요(건드리지 않아요~~)*/
				var origin_scroll = 0;
				$(window).on('scroll', function(){
					let scroll_hei = $(window).scrollTop();
				 	if(origin_scroll <= scroll_hei){
						$('.header_team_logo').removeClass('scroll_off');
						$('.header_team_logo').addClass('scroll_on');				
				 	}
					else{
						$('.header_team_logo').addClass('scroll_off');
						$('.header_team_logo').removeClass('scroll_on');				
					}
				 	origin_scroll = scroll_hei;
				});
				$('.scroll_div').on('mousewheel',function(e){//마우스 스크롤로 좌우 스크롤
					var win_wid = window.innerWidth;//현재 윈도우 넓이 값을 가져옴
					if(win_wid < 1250){//모바일 일 때(웹일 때는 스크롤 불필요)
						var wheelDelta = e.originalEvent.wheelDelta;//마우스 스크롤 값
						$(this).find('.scroll_inn').scrollLeft(-wheelDelta + $(this).find('.scroll_inn').scrollLeft());//scroll_inn div를 스크롤 값 만큼 움직이도록
						e.preventDefault();//그 외 이벤트 막음
					};
				});
				var isDragging = false;//드래그 상태 값 할당
				var mouseOffsetY = 0;//마우스 기본 값 초기화
				$('.scroll_div').on('mousedown', function(e){//웹에서 scroll_div에 마우스를 올려뒀을 때 이벤트 시작
					var win_wid = window.innerWidth;
					if(win_wid < 1250){//앱 사이즈일 때
						isDragging = true;//드래그 상태 true
						mouseOffsetY = e.clientX;//mouseOffsetY 값을 현재 마우스의 좌/우 위치 값으로 변경
						$('#offsetX').val(mouseOffsetY);//offsetX 에 마우스 값 저장
				 	}
				});
				$('.scroll_div').on('mousemove',function(e){//scroll_div div를 마우스로 클릭 시
					var win_wid = window.innerWidth;
					if(win_wid < 1250){
						if (isDragging){//isDragging 상태가 true일 때만 이루어짐
							var offsetX = $('#offsetX').val();//mousedown에서 저장해뒀던 마우스 값 불러오기(마우스 시작 값)
							var wheelDelta = e.clientX;//wheelDelta 변수에 지금 마우스 값 저장
							var offsetX2 = Number(wheelDelta) - Number(offsetX);//현재 마우스 값 - 이전 마우스 값
							var offset_left_val = $('#offset_scroll_left').val();//이전에 만약 마우스로 div 이동을 했다면 저장 됐을 값 불러오기
							$(this).find('.scroll_inn').scrollLeft(Number(offset_left_val) - Number(offsetX2));//이전 값 - offset_left_val 값
						}
					}
				});
				$('.scroll_div').on('mouseup', function(){//이동하다가 마우스를 뗐을 때
					var win_wid = window.innerWidth;
					if(win_wid < 1250){
						var offset_left = $(this).scrollLeft();//스크롤 된 값
						$('#offset_scroll_left').attr("value", offset_left);//스크롤 값을 저장(나중에 스크롤 할 때 자연스럽게 + 처음부터 스크롤 되지 않게)
						isDragging = false;//드래그 상태 false로
					}
				});
				$('.header_logo_inner a').removeClass('clicked_on');
				var area_clicked_val = $('#baseball_area').val();//baseball_area 값 가져옴
				$('#baseball_'+area_clicked_val).addClass('clicked_on');
			 });
		</script>
	</head>
	<body>
		<input type="hidden" id="normallogin" value="${normallogin}">
		<input type="hidden" id="superlogin" value="${superlogin}">
		<input type="hidden" id="offsetX" value="">
		<input type="hidden" id="offset_scroll_left" value="">
		<header class="header_section">
			<div class="header_top_whole">
				<div class="header_top_inner">
					<div class="header_top_logo_flex">
						<img src="./image/soccer/logo/soccer.png" alt="축구 로고" onclick="location.href='soccermain'" class="go_other_img">
					 	<div class="header_logo cursor" onclick="logoClick()">
							<img src="./image/baseball/logo/baseball.png" alt="야구 로고">
							<p class="logo_txt">MVP</p>
						</div>
					</div>
					<div class="header_login_txt">
						<c:choose>
					 		<c:when test="${!normallogin && !superlogin && !adminlogin}">
								<a href="signup">회원가입</a>
								<a href="login">로그인</a>
					 		</c:when>
					 		<c:when test="${normallogin || superlogin}">
						 		<input type="hidden" id="memberTeam" value="${member.team}">
								<a href="mypage?id=${member.id}">${member.name}님(${member.part})</a>
								<a href="logout">로그아웃</a>
					 		</c:when>
					 		<c:when test="${adminlogin}">
								<a href="memberList">관리자 계정</a>
								<a href="logout">로그아웃</a>
					 		</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<aside class="side_rightbar_whole">
				<div class="side_rightbar_bar scroll_div">
					<div class="side_rightbar_flex scroll_inn">
						<input type="text" id="side_rightbar_txt" name="team" value="<c:choose><c:when test="${areaset}">${area.area_kor}</c:when><c:otherwise>ALL</c:otherwise></c:choose>" readonly>
						<!-- 일반 회원 -->
						<ul>
							<li>
								<a href="javascript:void(0)" class="side_menu_title side_menu_click">선수</a>
								<ul>
									<li>
										<a href="baseballPlayerRank">- 순위</a>
									</li> 
									<li>
										<a href="javascript:void(0)" onclick="playMove()">- 선수 정보</a>
									</li>
									<c:if test="${superlogin||adminlogin}">
										<li>
											<a href="baseballplayerinput?play=야구" onclick="playMove()">- 선수 등록</a>
										</li>
									</c:if>
									<li>
										<a href="javascript:void(0)" onclick="playRandom()">- 랜덤 뽑기</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="javascript:void(0)" class="side_menu_title side_menu_click">경기</a>
								<ul>
								 	<li>
										<a href="baseball_schedule">- 일정</a>
								 	</li>
									<li>
										<a href="baseballTeamRank">- 순위</a>
									</li>
									<li>
										<a href="javascript:void(0)" onclick="baseball_highlight()">- 하이라이트</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="baseballgoods" class="side_menu_title">굿즈</a>
							</li>
						</ul>
						<c:if test="${superlogin && sportstype == '야구'}">
							<ul>
								<li>
									<a href="javascript:void(0)" class="side_menu_title" onclick="baseballStrategyMove()">전략</a>
								</li>
								<li>
							 		<a href="javascript:void(0)" class="side_menu_title" onclick="baseballCalendarMove()">캘린더</a>						
								</li>
					 		</ul>
						</c:if>
						<c:if test="${adminlogin}">
							<ul>
								<li>
							 		<a href="javascript:void(0)" class="side_menu_title side_menu_click">회원</a>
									<ul>
								 		<li>
											<a href="memberList">- 목록(${access})</a>
								 		</li>
										<li>
											<a href="memberNoList">- 승인 요청(${notAccess})</a>
										</li>
									</ul>
								</li>
							</ul>
						</c:if>
					</div>
				</div>
			</aside>
			<nav class="header_team_logo scroll_div" id="header_team" data-id="header_team" ontouch="scrollEvent(this)">
				<div class="header_logo_inner scroll_inn">
					<input type="text" id="baseball_area" value="<c:choose><c:when test="${areaset}">${area.area_eng}</c:when><c:otherwise>ALL</c:otherwise></c:choose>" hidden>
					<a href="javascript:void(0)" id="baseball_ALL" data-id="ALL" data-type="ALL" onclick="baseballClick(this)" class="header_logo_all">
						<img alt="" src="./image/baseball/logo/all.png">
						<p class="header_all_txt">ALL</p>
					 </a>
					<a href="javascript:void(0)" id="baseball_KIA" data-id="KIA" data-type="KIA" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/KIA.png">
					</a>
					<a href="javascript:void(0)" id="baseball_KT" data-id="KT" data-type="KT" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/KT.png">
					</a>
					<a href="javascript:void(0)" id="baseball_LG" data-id="LG" data-type="LG" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/LG.png">
					</a>
					<a href="javascript:void(0)" id="baseball_NC" data-id="NC" data-type="NC" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/NC.png">
					</a>
					<a href="javascript:void(0)" id="baseball_SSG" data-id="SSG" data-type="SSG" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/SSG.png">
					</a>
					<a href="javascript:void(0)" id="baseball_DOOSAN" data-id="DOOSAN" data-type="두산" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/두산.png">
					</a>
					<a href="javascript:void(0)" id="baseball_LOTTE" data-id="LOTTE" data-type="롯데" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/롯데.png">
					</a>
					<a href="javascript:void(0)" id="baseball_SAMSUNG" data-id="SAMSUNG" data-type="삼성" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/삼성.png">
					</a>
					<a href="javascript:void(0)" id="baseball_KIWOOM" data-id="KIWOOM" data-type="키움" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/키움.png">
					</a>
					<a href="javascript:void(0)" id="baseball_HANHWA" data-id="HANHWA" data-type="한화" onclick="baseballClick(this)">
						<img alt="" src="./image/baseball/logo/한화.png">
					</a>
				</div>
			</nav>
		</header>
		<!-- alert 팝업 -->
		<div class="common_fixed_bg"></div>
		<div class="common_alert_whole common_pop">
			<div class="common_alert_box">
				<p class="common_alert_title">타이틀</p>
				<p class="common_alert_subtxt">서브타이틀</p>
				<div class="common_fixed_btn_whole">
					<button type="button" onclick="commonHide()" class="common_fixed_btn">확인</button>
				</div>
			</div>
		</div>
	</body>
</html>