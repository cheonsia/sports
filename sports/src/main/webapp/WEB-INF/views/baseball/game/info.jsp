<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
		<td>
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