<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
			width: 260px;
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th,td{
		text-align: center;
	}
</style>
</head>
<body>
<table border="1" align="center" width="800px">
	<tr>
		<th>대전팀</th><th>날짜</th><th>시간</th><th>장소</th><th>수정 및 삭제</th>
	</tr>
	<c:forEach items="${list}" var="list">
	<tr>
		<td style="width:100px;">
		<img alt="" src="./image/baseball/logo/${list.team1}.png" width="30px">
		${list.team1} vs 
		${list.team2}
		<img alt="" src="./image/baseball/logo/${list.team2}.png" width="30px">
		</td>
		<td>${list.gamedate}</td>
		<td>${list.gametime}</td>
		<td>${list.gameplace}</td>
		<td>
			<a href="baseball_gameupdate?gamenum=${list.gamenum}">수정</a> /
			<a href="baseball_gamedelete?gamenum=${list.gamenum}">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>