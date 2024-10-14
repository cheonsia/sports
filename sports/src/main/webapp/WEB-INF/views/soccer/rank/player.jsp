<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		table{
			width: 1200px;
			table-layout: fixed;
		}
		td{
			text-align: center;
			border: 1px solid #e8e8e8;
		}
		th{
			text-align: center;
			background-color: #44674d;
			color: #fff;
		}
		td img {
			width:30px;
		}
		td input[type="text"]{
			padding: 0px;
			text-align: center;
		}
		tr th,
		tr td{
			width: 100%;
			height: 36px;
		}
		tr th:nth-child(1),
		tr td:nth-child(1){
			min-width: 70px;
			width: 70px;
		}		
		tr th:nth-child(2),
		tr td:nth-child(2){
			min-width: 150px;
			width: 150px;
		}
		tr td:nth-child(2){
			text-align: left;
    		padding-left: 35px;
		}
		tr th:nth-child(12),
		tr td:nth-child(12){
			min-width: 200px;
			width: 200px;
		}
	</style>
</head>
<body>
<h1>KLeague 전체 선수 기록</h1>
	<table>
		<thead>
			<tr>
				<th>순위</th>
				<th style="width:200px;">선수</th>
				<th>득점</th>
				<th>도움</th>
				<th style="width:100px;">공격포인트</th>
				<th>실점</th>
				<th>코너킥</th>
				<th>파울</th>
				<th>슈팅</th>
				<th style="width:100px;">오프사이드</th>
				<th>경고</th>
				<th style="width:50px;">퇴장</th>
				<th style="width:100px;">무실점경기</th>
				<th>출장</th>
				<th>교체</th>
				<th style="width:100px;">경기당기록</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="player" items="${list}">
				<tr>
					<td>${player.rank}</td>
					<c:choose>
						<c:when test="${player.teamName=='수원FC'}">
							<td>
								<img alt="" src="./image/soccer/logo/수원.png">
								${player.playerName}
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<img alt="" src="./image/soccer/logo/${player.teamName}.png">
								${player.playerName}
							</td>
						</c:otherwise>
					</c:choose>
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