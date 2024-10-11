<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>정말로 삭제하시겠습니까?</h1>
<table border="1" align="center" width="800px">
	<tr>
		<th>대전팀</th><th>날짜</th><th>시간</th><th>장소</th>
	</tr>
	<tr>
		<td>
		<img alt="" src="./image/soccer/logo/${dto.team1}.png" width="30px">
		${dto.team1} vs ${dto.team2}
		<img alt="" src="./image/soccer/logo/${dto.team2}.png" width="30px">
		</td>
		<td>${dto.gamedate}</td>
		<td>${dto.gametime}</td>
		<td>${dto.gameplace}</td>
	</tr>
</table>
<button type="button" onclick="location.href='soccergamedelete?gamenum=${dto.gamenum}'">삭제</button>
<button type="button" onclick="location.href='soccer_gameinfo'">취소</button>
</body>
</html>