<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin-top: 50px;
	width: 1000px;
}
th,td{
	text-align: center;
	border: 1px solid #808080;
}
td img {
	width:30px;
}
td input[type="text"]{
	padding: 0px;
	text-align: center;
}
td .soccerrank_player{
	display: flex;
	align-items:center;
	padding-left: 10px;
}
td .soccerrank_player .soccerrank_playername{
	width: 60px;
	margin: 0 5px 0 5px;
}
td .soccerrank_player .soccerrank_pnumber{
	width: 18px;
	margin:0 3px 0 3px;
	background-color:transparent; 
	padding: 0px;
	text-align: center;
}
</style>
</head>
<body>
<input type="button" value="결과 등록" onclick="location.href='playresult'">
<input type="button" value="결과 수정" onclick="location.href='playresultedit'">
<table>
	<colgroup>
		<col width="50px">
		<col width="150px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
	</colgroup>
	<tr>
		<th>Rank<br>(순위)</th>
		<th>Player<br>(선수)</th>
		<th>Gain<br>(득점)</th>
		<th>Assist<br>(도움)</th>
		<th>AttackPoint<br>(공격포인트)</th>
		<th>Match<br>(경기 수)</th>
		<th>Rate<br>(평점)</th>
		<th>MOM</th>
		<th>Best11<br>선정 수</th>
		<th>Shoot<br>(슈팅)</th>
		<th>On Target Shoot<br>(유효 슈팅)</th>
	</tr>
	<c:forEach items="${sprlist}" var="player">
		<tr>
			<td>${player.ranking}</td>
			<td>
				<div class="soccerrank_player">
					<c:if test="${player.playerDTO.tname=='kangwon'}"><img src="./image/soccer/logo/강원.png"></c:if>
					<c:if test="${player.playerDTO.tname=='gwangju'}"><img src="./image/soccer/logo/광주.png"></c:if>
					<c:if test="${player.playerDTO.tname=='gimcheon'}"><img src="./image/soccer/logo/김천.png"></c:if>
					<c:if test="${player.playerDTO.tname=='daegu'}"><img src="./image/soccer/logo/대구.png"></c:if>
					<c:if test="${player.playerDTO.tname=='daejeon'}"><img src="./image/soccer/logo/대전.png"></c:if>
					<c:if test="${player.playerDTO.tname=='seoul'}"><img src="./image/soccer/logo/서울.png"></c:if>
					<c:if test="${player.playerDTO.tname=='suwon'}"><img src="./image/soccer/logo/수원.png"></c:if>
					<c:if test="${player.playerDTO.tname=='ulsan'}"><img src="./image/soccer/logo/울산.png"></c:if>
					<c:if test="${player.playerDTO.tname=='incheon'}"><img src="./image/soccer/logo/인천.png"></c:if>
					<c:if test="${player.playerDTO.tname=='jeonbuk'}"><img src="./image/soccer/logo/전북.png"></c:if>
					<c:if test="${player.playerDTO.tname=='jeju'}"><img src="./image/soccer/logo/제주.png"></c:if>
					<c:if test="${player.playerDTO.tname=='pohang'}"><img src="./image/soccer/logo/포항.png"></c:if>
					<input type="text" class="soccerrank_playername" value="${player.playerDTO.pname}" readonly> (<input type="text" class="soccerrank_pnumber" value="${player.playerDTO.pnumber}" readonly>)
				</div>
			</td>
			<td><input type="text" value="${player.gain}" readonly></td>
			<td><input type="text" value="${player.assist}" readonly></td>
			<td><input type="text" value="${player.attackpoint}" readonly></td>
			<td><input type="text" value="${player.round}" readonly></td>
			<td><input type="text" value="${player.avgscore}" readonly></td>
			<td><input type="text" value="${player.mom}" readonly></td>
			<td><input type="text" value="${player.best11}" readonly></td>
			<td><input type="text" value="${player.shoot}" readonly></td>
			<td><input type="text" value="${player.possibleshoot}" readonly></td>
	</c:forEach>
</table>
</body>
</html>