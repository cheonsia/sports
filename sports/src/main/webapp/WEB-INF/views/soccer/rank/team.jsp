<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.header_team_logo {
			display: none;
		}
		.main_section{
			width: calc(100% - 40px);
			margin-top: 50px;
		}
		h1{
			margin-top:0;
		}
		.whole_rank{
			width: 100%;
			height: calc(100vh - 370px);
			overflow: auto;
			margin: 0 auto 50px auto;
		}
		.whole_rank::-webkit-scrollbar{
			width: 10px;
			height: 10px;
			background-color: #ddd;
			border-radius: 5px;
		}
		.whole_rank::-webkit-scrollbar-thumb{
			width: 10px;
			height: 10px;
			background-color: #006400;
			border-radius: 5px;
		}
		table{
			width: 1200px;
			table-layout: fixed;
		    margin: 0 auto;
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
			height: 40px;
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
			font-weight: bold;
		}
		td:nth-child(4){
		    font-weight: bold;
		    background-color: #e4f4e480;
		    color: #000000;
		    font-size: 18px;
		}
	</style>
</head>
<body>
	<h1>KLeague 팀 순위</h1>
	<div class="whole_rank">
		<table>
			<thead>
				<tr>
					<th>순위</th>
					<th>팀 명</th>
					<th>경기 수</th>
					<th>승점</th>
					<th>승</th>
					<th>무</th>
					<th>패</th>
					<th>득점</th>
					<th>실점</th>
					<th>득실차</th>
					<th>도움</th>
					<th>파울</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="team" items="${list}">
					<tr>
						<td>${team.rank}</td>
						<td>
							<img src="image/soccer/logo/${team.title}.png" width="25" height="25"> 
							&emsp;${team.title}
						</td>
						<td>${team.round}</td>
						<td>${team.points}</td>
						<td>${team.win}</td>
						<td>${team.draw}</td>
						<td>${team.lose}</td>
						<td>${team.score}</td>
						<td>${team.conceded}</td>
						<td>${team.difference}</td>
						<td>${team.assist}</td>
						<td>${team.foul}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>