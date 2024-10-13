<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		table{
			width: 600px;
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
		<c:forEach var="i" begin="0" end="${list.size()/5}" step="1">
			<c:forEach items="player" var="player" begin="5*i" end="5*i+5" step="1">
			<thead>
				<tr>
					<th>순위</th>
					<th>이름</th>
					<th>팀명</th>
					<th>기록</th>
				</tr>
			</thead>
			<tbody>
			<!-- 
				<c:forEach var="player" items="${list}">
			 -->
					<tr>
						<td>${player.rank}</td>
						<td>${player.name}</td>
						<td>${player.team}</td>
						<td>${player.win}</td>
					</tr>
			<!-- 
				</c:forEach>
			 -->
			</tbody>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>