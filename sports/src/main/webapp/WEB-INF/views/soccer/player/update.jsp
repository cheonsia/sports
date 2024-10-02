<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#player").click(function(){
		var bmain_len = $("input[name='main']:checked").length;
		if(bmain_len>=3) {
			alert('3개 이상은 선택이 불가해요!');
			return false;
		}
		$('#form1').submit();
	});
});
</script>
<style type="text/css">
th,td{
	padding-top: 10px;
	padding-bottom: 10px;
}
th{
	width: 80px;
}
</style>
</head>
<body>
	<form action="soccerupdatesave" method="post" enctype="multipart/form-data" id="form1" name="form1">
		<input type="hidden" value="${dto.playernum}" name="playernum">
		<input type="hidden" value="${dto.pimage}" name="rimage">
		<input type="hidden" value="${dto.pimage}" name="mtname">
		<input type="hidden" value="${dto.pimage}" name="rimage">
		<table align="center">
			<tr>
				<td rowspan="9" width="200px"> <input type="file" name="pimage">
					<img alt="" src="./image/soccer/player/${dto.pimage}" width="250px">
				</td>
				<th>종목</th>
				<td>
					<input type="text" name="play" value="${dto.play}" readonly>
				</td>
			</tr>
			<tr>
				<th>팀</th>
				<td>
					<select name="tname">
						<option value="kangwon">강원</option>
						<option value="gwangju">광주</option>
						<option value="gimcheon">김천</option>
						<option value="daegu">대구</option>
						<option value="daejeon">대전</option>
						<option value="seoul">서울</option>
						<option value="suwon">수원</option>
						<option value="ulsan">울산</option>
						<option value="incheon">인천</option>
						<option value="jeonbuk">전북</option>
						<option value="jeju">제주</option>
						<option value="pohang">포항</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td> <input type="text" name="pname" value="${dto.pname}"> </td>
			</tr>
			<tr>
				<th>번호</th>
				<td> <input type="number" name="pnumber" value="${dto.pnumber}"> </td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td> <input type="date" name="pbirth" value="${dto.pbirth}"> </td>
			</tr>
			<tr>
				<th>키</th>
				<td> <input type="number" name="height" value="${dto.height}"> </td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td> <input type="number" name="weight" value="${dto.weight}"> </td>
			</tr>
			<tr>
				<th>주포지션</th>
				<td colspan="2">
					<div id="soccer">
						<input type="radio" name="main" value="FW"> FW
						<input type="radio" name="main" value="MF"> MF
						<input type="radio" name="main" value="DF"> DF
						<input type="radio" name="main" value="GK"> GK
					</div>
				</td>
			</tr>
			<tr>
				<th>특이사항</th>
				<td>
					<input type="text" name="pchar" value="${dto.pchar}">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button"  value="수정" id="player">
					<input type="reset" value="입력 초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>