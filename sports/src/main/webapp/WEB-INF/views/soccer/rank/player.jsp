<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.header_team_logo {
			display: none;
		}
	
	    .main_section {
        	max-width: 1400px;
       }
        h3{
        	font-weight: bold;
        }
		table{
			width: 100%;
			table-layout: fixed;
			margin: 20px auto;
		}
		th{
			text-align: center;
			background-color: #44674d;
			color: #fff;
			width: 100%;
			height: 36px;
		}
		td{
			text-align: center;
			width: 100%;
			height: 36px;
		}
		.playerimage{
		    display: flex;
	    	align-items: center;
    		flex-direction: column;
    		margin: 0 0 10px 40px;
		}
		.playerimage .crown{
			width: 40px;
		}
		.playerimage .playerimg{
			margin-top:5px;
			margin-bottom:5px;
		    width: 200px;
			border-radius: 50px;	
		}
		.teamLogo{
			width: 30px;
		}
       .player{
       		width: 1400px;
        	margin: 0 auto;
        	display: flex;
       }	
       .section{
		    width: 100%;
		    margin: -10px 8px 20px 0;
		    display: inline-table;
		}
       .section table{
			width: 100%;
			table-layout: fixed;
			margin-bottom: 30px;
		}
		.section .teamLogo{
			width: 40px;
		}
		.section th{
		    background-color: #e3f5e3;
    		color: #000;
    		font-weight:bold;
			font-size: 20px;
			height: 60px;
			border-radius: 10px;
		}
		.section tr{
			font-size: 20px;
			height: 60px;
		}
		.section td{
			text-align:left;
			font-size: 17px;
			padding-left: 60px;
		}
		.section td:nth-child(1){
			padding-left: 110px;
		}
		.section td:nth-child(2){
			font-weight:700;
			color:#006400;
		}
		.section tr:nth-child(1) .teamLogo{
			width: 80px;
		}
		.section tr:nth-child(1) td{
			text-align: center;
		    padding-left: 0;
		}
		.section tr:nth-child(1) td span{
			font-size: 20px;
			font-weight:700;
			display: block;
			margin-top: 20px;
		}
		#lastTable{
			width: 1400px;
			table-layout: fixed;
		}
		#lastTable td{
			border: 1px solid #e8e8e8;
		}
		#lastTable td input[type="text"]{
			padding: 0px;
			text-align: center;
		}
		#lastTable tr th:nth-child(1),
		#lastTable tr td:nth-child(1){
			min-width: 50px;
			width: 50px;
		}		
		#lastTable tr th:nth-child(2),
		#lastTable tr td:nth-child(2){
		    min-width: 180px;
		    width: 180px;
		}
		#lastTable tr td:nth-child(2){
			text-align: left;
		    padding-left: 20px;
		}
		#lastTable tr td:nth-child(3){
		    font-weight: bold;
		    background-color: #e4f4e480;
		    color: #000000;
		    font-size: 18px;
		}
	</style>
</head>
<body>
	<h3>부문별 선수 순위 TOP3</h3>
	<div class = "player">
		<c:forEach var="i" begin="0" end="${fn:length(sectionlist)-1}" step="3">
			<div class = "section">
				<table>
					<colgroup>
						<col width="6">
						<col width="4">
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">${sectionlist[i].record}</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="j" begin="${i}" end="${i+2}" step="1">
						<c:if test="${j==i}">
						<tr>
							<td>
								<div class="playerimage">
									<img class="crown" src="./image/soccer/icon/crown.png">			
									<img class="playerimg" src="./image/soccer/player/${sectionlist[j].change}">
								</div>
							</td>
							<td>
								<img class="teamLogo" src="./image/soccer/logo/${sectionlist[j].team}.png">
								<span>${sectionlist[j].name}</span>
								<span>
									${sectionlist[j].score}
									${sectionlist[j].assist}
								</span>
							</td>
						</tr>
						</c:if>
							<c:if test="${j!=i}">
								<tr>
									<td>
										${sectionlist[j].rank}&emsp;&emsp;
										<img class="teamLogo" src="./image/soccer/logo/${sectionlist[j].team}.png">&emsp;
										${sectionlist[j].name}
									</td>
									<td>
										${sectionlist[j].score}
										${sectionlist[j].assist}
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	<h3> 전체 선수 순위</h3>
	<table id="lastTable">
		<thead>
			<tr>
				<th>순위</th>
				<th>선수</th>
				<th>득점</th>
				<th>도움</th>
				<th>공격포인트</th>
				<th>실점</th>
				<th>코너킥</th>
				<th>파울</th>
				<th>슈팅</th>
				<th>오프사이드</th>
				<th>경고</th>
				<th>퇴장</th>
				<th>무실점경기</th>
				<th>출장</th>
				<th>교체</th>
				<th>경기당기록</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="player" items="${list}">
				<tr>
					<td>${player.rank}</td>
					<td>
						<img class="teamLogo" alt="" src="./image/soccer/logo/${player.team}.png">&emsp;
						${player.name}
					</td>
					<td>${player.score}</td>
					<td>${player.assist}</td>
					<td>${player.attackPoint}</td>
					<td>${player.conceded}</td>
					<td>${player.conner}</td>
					<td>${player.foul}</td>
					<td>${player.shooting}</td>
					<td>${player.offside}</td>
					<td>${player.warning}</td>
					<td>${player.exit}</td>
					<td>${player.scoreless}</td>
					<td>${player.businessTrip}</td>
					<td>${player.change}</td>
					<td>${player.record}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>