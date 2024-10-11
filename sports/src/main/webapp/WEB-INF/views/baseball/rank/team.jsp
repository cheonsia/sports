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
<h1>KBO 정규리그 순위</h1>
	<table>
		<thead>
			<tr>
				<th>순위</th>
				<th>팀명</th>
				<th>경기</th>
				<th>승</th>
				<th>패</th>
				<th>무</th>
				<th>승률</th>
				<th>게임차</th>
				<th>연속</th>
				<th>출타율</th>
				<th>장타율</th>
				<th>최근 10경기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="team" items="${list}">
				<tr>
					<td>${team.rank}</td>
					<td>
						<img src="image/baseball/logo/${team.title}.png" width="25" height="25"> 
						&emsp;${team.title}
					</td>
					<td>${team.match}</td>
					<td>${team.victory}</td>
					<td>${team.defeat}</td>
					<td>${team.draw}</td>
					<td>${team.rate}</td>
					<td>${team.between}</td>
					<td>${team.winning}</td>
					<td>${team.base}</td>
					<td>${team.slugging}</td>
					<td>${team.recent}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>