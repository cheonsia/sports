<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
		<style type="text/css">
			*{
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-use-select: none;
				user-select: none;
			}
			.main_section{
				width: calc(100% - 40px);
				max-width: none;
				height: auto;
				margin-top: 120px;
			}
			.common_main_whole{
				width: 100%;
				height: auto;
				margin: 0 auto;
				display: flex;
				flex-direction: column;
				justify-content: space-between;
			}
			.common_main_whole h2{
				display: flex;
				justify-content: space-between;
				align-items: end;
				font-size: 20px;
				line-height: 29px;
				font-weight: bold;
				color: #3d3d3d;
				margin: 0 auto 24px auto;
			}
			.common_main_whole h2 a{
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				text-align: end;
				border-bottom: 1px solid transparent;
			}
			.common_main_whole h2 a:hover{
				font-weight: bold;
				text-decoration: none;
				border-color: #e1e1e1;
			}
			.common_main_member{
				width: calc(100% - 42px);
				max-width: 978px;
				height: auto;
				padding: 20px;
				background-color: #00640005;
				border: 1px solid #e1e1e1;
				border-radius: 10px;
				margin: 0 auto 60px auto;
			}
			.common_member_flex{
				display: flex;
				flex-wrap: wrap;
				width: 100%;
				height: auto;
				margin: 0 auto;
				justify-content: center;
			}
			p.member_name_txt{
				width: 100%;
				font-size: 18px;
				line-height: 27px;
				font-weight: 400;
				color: #777;
				text-align: center;
				margin: 0 auto 20px auto;
			}
			.common_member_flex a{
				display: block;
				width: max-content;
				height: auto;
				font-size: 18px;
				line-height: 27px;
				font-weight: 500;
				color: #333;
				margin: 0;
				text-align: center;
				padding: 10px 20px;
				background-color: #fff;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
			}
			.common_member_flex a:hover{
				border-color: #00640050;
				text-decoration: none;
				box-shadow: 0 0 20px #00640010;
			}
			.common_member_flex a + a{
				margin-left: 30px;
			}
			.common_main_gr{
				display: flex;
				flex-wrap: nowrap;
				align-items: stretch;
				width: 100%;
				max-width: 1020px;
				height: auto;
				margin: 0 auto 50px auto;
			}
			.common_main_game{
				width: 100%;
				height: auto;
				margin: 0 50px 0 0;
			}
			.common_game_whole{
				width: 100%;
				height: auto;
				max-height: 200px;
				margin: 0 auto;
				display: flex;
				flex-wrap: wrap;
				justify-content: space-between;
				align-items: stretch;
				overflow: hidden;
				overflow-y: auto;
				padding-right: 20px;
			}
			.common_game_whole::-webkit-scrollbar{
				width: 10px;
				height: auto;
				background-color: #ddd;
				border-radius: 20px;
			}
			.common_game_whole::-webkit-scrollbar-thumb{
				width: 8px;
				height: auto;
				background-color: #b0c4b0;
				border-radius: 20px;
			}
			.common_game_row{
				width: calc(100% - 40px);
				height: auto;
				overflow: hidden;
				padding: 0 20px 24px 20px;
			}
			.common_game_row + .common_game_row{
				border-top: 1px solid #e1e1e1;
				padding-top: 24px;
			}
			.common_game_row:nth-child(2n){
				background-color: #00640005;
			}
			.common_game_txt{
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
				overflow: hidden;
			}
			p.game_team_season{
				min-width: max-content;
				width: max-content;
				max-width: 100%;
				color: #999;
				text-align: end;
				margin: 0 25px 0 0;
			}
			.common_game_team{
				min-width: max-content;
				width: max-content;
				max-width: 100%;
				height: auto;
				margin: 0 30px 0 0;
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
			}
			.common_game_team p{
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #999;
				text-align: center;
				margin: 0 15px;
			}
			.common_game_team p img{
				display: block;
				min-width: 25px;
				width: 25px;
				height: auto;
				background-size: contain;
				margin-right: 5px;
			}
			.common_game_team p.game_team_txt{
				font-size: 16px;
				line-height: 24px;
				font-weight: bold;
				color: #555;
				margin: 0;
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
			}
			.common_game_flex{
				width: 100%;
				display: flex;
				align-items: center;
				border-left: 1px solid #e1e1e1;
				padding-left: 25px;
			}
			.common_game_flex p{
				width: 100%;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #777;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			.common_game_flex p:last-child{
				min-width: max-content;
				width: max-content;
				font-size: 18px;
				font-weight: bold;
				color: #555;
				margin-left: 15px;
			}
			.common_game_whole p.no_data_txt{
				padding: 80px 0;
			}
			.common_main_rank{
				width: 100%;
				max-width: 400px;
				height: auto;
				margin: 0 auto;
			}
			.main_rank_whole{
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.main_rank_title{
				width: 100%;
				height: auto;
				margin: 0 auto;
				background-color: #e4efe4;
				padding: 10px 0;
			}
			.main_rank_title div{
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.main_rank_title div p{
				width: 100%;
				height: auto;
				font-size: 16px;
				line-height: 30px;
				font-weight: 500;
				color: #3d3d3d;
				text-align: center;
			}
			.main_rank_title div p:nth-child(1){
				min-width: 60px;
				width: 60px;
			}
			.main_rank_title div p:nth-child(3),
			.main_rank_title div p:nth-child(4),
			.main_rank_title div p:nth-child(5){
				min-width: 65px;
				width: 65px;
			}
			.main_rank_row{
				display: flex;
				width: 100%;
				height: auto;
				margin: 0 auto;
				padding: 8px 0;
			}
			.main_rank_row div{
				width: calc(100% - 20px);
				height: auto;
				margin: 0 auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
				background-color: transparent;
			}
			.main_rank_row div + div{
				width: max-content;
			}
			.main_rank_row div + div p{
				width: 100%;
				min-width: 65px;
				width: 65px;
			}
			.main_rank_row div + div p span.w_dis_n{
				font-size: 18px;
				line-height: 27px;
				font-weight: 400;
				color: #777;
			}
			.main_rank_row img{
				display: block;
				min-width: 30px;
				width: 30px;
				height: auto;
				margin: 0 10px 0 auto;
			}
			.main_rank_row p{
				display: flex;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #3d3d3d;
				margin-right: auto;
			}
			.main_rank_row div p + p{
				margin-left: 0;
			}
			.main_rank_row p.ranknum{
				min-width: 60px;
				width: 60px;
				min-width: 15px;
				font-size: 20px;
				line-height: 29px;
				font-weight: bold;
				color: #3d3d3d;
				text-align: center;
				margin-right: 0;
				justify-content: center;
			}
			.main_rank_row p span{
				display: block;
				width: 100%;
				font-size: 24px;
				font-weight: bold;
				color: #666;
				text-align: center;
			}
			.main_rank_row p:first-child span{
				color: #497749;
			}
			.common_main_banner{
				width: calc(100% + 40px);
				margin: 0 -20px;
				background-color: #ededed;
				padding: 35px 0;
			}
			.mySwiper{
				width: 100%;
				height: auto;
			}
			.banner_link_flex{
				width: 100%;
				max-width: 1140px;
				height: auto;
				display: flex;
				justify-content: center;
				align-items: center;
				margin: 0 auto;
			}
			.banner_link_bg{
				width: 100%;
				height: auto;
			}
			.banner_link_img{
				width: 100%;
				height: auto;
				margin: 0 auto;
			}
			.banner_link_img div{
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.banner_link_img img{
				display: block;
				min-width: 50px;
				width: 50px;
				height: auto;
				background-size: contain;
				margin: 0 20px 0 0;
			}
			.banner_link_img p{
				font-size: 18px;
				line-height: 27px;
				font-weight: bold;
				color: #333;
			}
			.banner_link_img a{
				display: block;
				width: max-content;
				max-width: calc(100% - 40px);
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				text-align: center;
				padding: 10px 30px;
				border: 1px solid #e1e1e1;
				color: #fff;
				margin: 20px auto 0 auto;
				border-radius: 5px;
			}
			.banner_link_bg.banner_link_bg1 a{
				background-color: #006262;
			}
			.banner_link_bg.banner_link_bg2 a{
				background-color: #c80021;
			}
			.banner_link_bg.banner_link_bg3 a{
				background-color: #0b1e3e;
			}
			.banner_link_bg.banner_link_bg4 a{
				background-color: #0068b7;
			}
			.banner_link_bg.banner_link_bg5 a{
				background-color: #11345a;
			}
			.banner_link_bg.banner_link_bg6 a{
				background-color: #d71921;
			}
			.banner_link_bg.banner_link_bg7 a{
				background-color: #003a70;
			}
			.banner_link_bg.banner_link_bg8 a{
				background-color: #375a99;
			}
			.banner_link_bg.banner_link_bg9 a{
				background-color: #00509e;
			}
			.banner_link_bg.banner_link_bg10 a{
				background-color: #0f583f;
			}
			.banner_link_bg.banner_link_bg11 a{
				background-color: #f58026;
			}
			.banner_link_bg.banner_link_bg12 a{
				background-color: #fb342e;
			}
			.banner_link_img a:hover{
				text-decoration: none;
			}
			.banner_link_img a:hover{
				background-color: #111;
			}
			.swiper-fade .swiper-slide{
				background-color: #ededed;
			}
			@media (max-width: 999px){
				.common_main_gr{
					flex-direction: column;
				}
				.main_rank_whole{
					max-width: 400px;
				}
				.common_main_game{
					margin: 0 auto 50px auto;
				}
			}
			@media (min-width: 1000px){
				#body{
					height: calc(100vh - 180px);
				}
				.main_section{
					height: calc(100% - 120px);
				}
			}
			@media (min-width: 1250px){
				#body{
					height: calc(100vh - 130px);
				}
				.main_section{
					height: calc(100% - 120px);
				}
				.common_main_whole{
					height: 100%;
				}
			}
		</style>
	</head>
	<body>
		<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
		<div class="common_main_whole">
			<div>
				<div class="common_main_member">
					<div class="common_member_flex">
						<!--로그인 전-->
						<c:if test="${!normallogin && !superlogin && !adminlogin}">
							<p class="member_name_txt">로그인해주세요.</p>
							<a href="javascript:void(0)" onclick="alertShow('로그인', '로그인 후 이용하실 수 있습니다.')">랜덤 뽑기</a>
							<a href="soccerTeamRank">선수 순위</a>
							<a href="soccer_schedule">경기 일정</a>
						</c:if>
						<!--로그인 후(일반)-->
						<c:if test="${normallogin}">
							<p class="member_name_txt">${member.name} 님</p>
							<a href="javascript:void(0)" onclick="playRandom()">랜덤 뽑기</a>
							<a href="soccerTeamRank">선수 순위</a>
							<a href="soccer_schedule">경기 일정</a>
						</c:if>
						<!--로그인 후(감독)-->
						<c:if test="${superlogin}">
							<p class="member_name_txt">${member.name} 님</p>
							<a href="playerinput?play=축구">선수 등록</a>
							<a href="javascript:void(0)" onclick="soccerStrategyMove()">전략 만들기</a>
							<a href="javascript:void(0)" onclick="soccerCalendarMove()">훈련 일정</a>
						</c:if>
						<!--로그인 후(관리자)-->
						<c:if test="${adminlogin}">
							<p class="member_name_txt">관리자 계정</p>
							<a href="memberList">회원 목록</a>
							<a href="memberNoList">회원 요청</a>
							<a href="javascript:void(0)">문의 답변</a>
						</c:if>
					</div>
				</div>
				<div class="common_main_gr">
					<!--경기 일정-->
					<div class="common_main_game">
						<h2>오늘의 경기 일정<a href="soccer_schedule">더보기</a></h2>
						<div class="common_game_whole">
							<!--team1,team2,gametime,gameplace,season-->
							<c:forEach items="${gamelist}" var="game">
								<div class="common_game_row">
									<div class="common_game_txt">
										<p class="game_team_season">${game.season}</p>
										<div class="common_game_team">
											<p class="game_team_txt">
												<img alt="${game.team1} 로고" src="./image/soccer/logo/${game.team1}.png">
												${game.team1}
											</p>
											<p>vs</p>
											<p class="game_team_txt">
												<img alt="${game.team2} 로고" src="./image/soccer/logo/${game.team2}.png">
												${game.team2}
											</p>
										</div>
										<div class="common_game_flex">
											<p>${game.gameplace}</p>
											<p>${game.gametime}</p>
										</div>
									</div>
								</div>
							</c:forEach>
							<c:if test="${empty gamelist}">
								<p class="no_data_txt">오늘 경기 일정이 없습니다</p>
							</c:if>
						</div>
					</div>
					<!--순위-->
					<div class="common_main_rank">
						<h2>팀 순위<a href="soccerTeamRank">더보기</a></h2>
						<div class="main_rank_whole">
							<div class="main_rank_title">
								<div>
									<p>순위</p>
									<p>팀명</p>
									<p>승</p>
									<p>무</p>
									<p>패</p>
								</div>
							</div>
							<c:forEach items="${teamlist}" var="team" end="2">
								<div class="main_rank_row">
									<div>
										<p class="ranknum">${team.rank}</p>
										<c:choose>
											<c:when test="${team.title=='수원FC'}">
												<img src="image/soccer/logo/수원.png"> 
											</c:when>
											<c:otherwise>
												<img src="image/soccer/logo/${team.title}.png"> 
											</c:otherwise>
										</c:choose>
										<p>${team.title}</p>
									</div>
									<div>
										<p><span>${team.win}</span></p>
										<p><span>${team.draw}</span></p>
										<p><span>${team.lose}</span></p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="common_main_banner">
				<div class="soccerSwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="banner_link_flex">
								<div class="banner_link_bg banner_link_bg1">
									<div class="banner_link_img">
										<div>
											<img alt="강원FC 로고" src="./image/soccer/logo/강원.png">
											<p>강원FC</p>
										</div>
										<a href="https://www.gangwon-fc.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg2">
									<div class="banner_link_img">
										<div>
											<img alt="광주FC 로고" src="./image/soccer/logo/광주.png">
											<p>광주FC</p>
										</div>
										<a href="https://www.gwangjufc.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg3">
									<div class="banner_link_img">
										<div>
											<img alt="김천상무 로고" src="./image/soccer/logo/김천.png">
											<p>김천상무</p>
										</div>
										<a href="https://www.gimcheonfc.com/index.php" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg4">
									<div class="banner_link_img">
										<div>
											<img alt="대구FC 로고" src="./image/soccer/logo/대구.png">
											<p>대구FC</p>
										</div>
										<a href="https://www.daegufc.co.kr/main/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="banner_link_flex">
								<div class="banner_link_bg banner_link_bg5">
									<div class="banner_link_img">
										<div>
											<img alt="대전하나시티즌 로고" src="./image/soccer/logo/대전.png">
											<p>대전하나시티즌</p>
										</div>
										<a href="https://www.dhcfc.kr/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg6">
									<div class="banner_link_img">
										<div>
											<img alt="FC 서울 로고" src="./image/soccer/logo/서울.png">
											<p>FC 서울</p>
										</div>
										<a href="https://www.fcseoul.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg7">
									<div class="banner_link_img">
										<div>
											<img alt="수원 FC 로고" src="./image/soccer/logo/수원.png">
											<p>수원 FC</p>
										</div>
										<a href="https://www.suwonfc.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg8">
									<div class="banner_link_img">
										<div>
											<img alt="울산 HD FC 로고" src="./image/soccer/logo/울산.png">
											<p>울산 HD FC</p>
										</div>
										<a href="https://www.uhfc.tv/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="banner_link_flex">
								<div class="banner_link_bg banner_link_bg9">
									<div class="banner_link_img">
										<div>
											<img alt="인천유나이티드 로고" src="./image/soccer/logo/인천.png">
											<p>인천유나이티드</p>
										</div>
										<a href="https://www.incheonutd.com/main/index.php" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg10">
									<div class="banner_link_img">
										<div>
											<img alt="전북 현대 모터스 로고" src="./image/soccer/logo/전북.png">
											<p>전북 현대 모터스</p>
										</div>
										<a href="https://hyundai-motorsfc.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg11">
									<div class="banner_link_img">
										<div>
											<img alt="제주유나이티드 로고" src="./image/soccer/logo/제주.png">
											<p>제주유나이티드</p>
										</div>
										<a href="https://www.jeju-utd.com/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
								<div class="banner_link_bg banner_link_bg12">
									<div class="banner_link_img">
										<div>
											<img alt="포항스틸러스 로고" src="./image/soccer/logo/포항.png">
											<p>포항스틸러스</p>
										</div>
										<a href="https://www.steelers.co.kr/" target="_blank">공식 홈페이지 가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
	<script type="text/javascript">
		const swiper = new Swiper('.soccerSwiper', {
			//speed: 800,
			autoplay: {
				delay: 5000,//5초마다 스와이퍼 움직임
			},
			effect:'fade',
			loop: true,
		});
		$('.common_main_banner').on('mouseover', function() {
			swiper.autoplay.stop();
		});
		$('.common_main_banner').on('mouseleave', function() {
			swiper.autoplay.start();
		});
	</script>
</html>