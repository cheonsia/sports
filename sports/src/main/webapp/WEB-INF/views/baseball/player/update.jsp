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
	<form action="baseballupdatesave" method="post" enctype="multipart/form-data" id="form1" name="form1">
		<input type="hidden" value="${dto.playernum}" name="playernum">
		<input type="hidden" value="${dto.pimage}" name="rimage">
		<table align="center">
			<tr>
				<td rowspan="9" width="200px"> <input type="file" name="pimage">
					<img alt="" src="./image/baseball/player/${dto.pimage}" width="250px">
				</td>
				<th>종목</th>
				<td>
					<input type="text" name="play" value="${dto.play}" readonly>
				</td>
			</tr>
			<tr>
				<th>팀</th>
				<td>
					<select name="btname">
					<option value="kia">KIA</option>
					<option value="kt">KT</option>
					<option value="lg">LG</option>
					<option value="nc">NC</option>
					<option value="ssg">SSG</option>
					<option value="doosan">두산</option>
					<option value="lotte">롯데</option>
					<option value="samsung">삼성</option>
					<option value="kiwoom">키움</option>
					<option value="hanwha">한화</option>
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
					<div id="baseball">
						<input type="radio" name="main" value="투수"> 투수
						<input type="radio" name="main" value="포수"> 포수
						<input type="radio" name="main" value="내야수"> 내야수
						<input type="radio" name="main" value="외야수"> 외야수
					</div>
				</td>
			</tr>
			<tr>
				<th>특징</th>
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