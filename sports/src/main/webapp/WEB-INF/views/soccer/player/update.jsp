<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
			//팀 체크
			var tname=$("#tnameRef").val();
			$("#tname").val(tname).prop("selected", true);
			//포지션 체크
			var main =$('#mainposition').val();
			$('input:radio[name=main]:input[value="'+main+'"]').prop("checked", true);
		});
	</script>
	<style type="text/css">
		table {
			margin: 40px auto 0 auto;
		}
		th,td{
			padding-top: 10px;
			padding-bottom: 10px;
		}
		th{
			width: 80px;
		}
		h1{
			font-size: 40px;
		}
		.bt{
			padding-top: 10px;
			text-align: center;
			display: flex;
			width: max-content;
			margin: 40px auto 0 auto;
		}
		.bt input[type="submit"],
		.bt input[type="button"]{
			width: 100px;
			height: 40px;
			font-size: 20px;
		}
		.bt input[type="submit"] + input[type="button"]{
			margin-left: 20px;
		}
	</style>
</head>
<body>
	<h1>${dto.pname} 선수의 정보</h1>
	<form action="soccerupdatesave" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${dto.playernum}" name="playernum">
		<input type="hidden" value="${dto.pimage}" name="rimage">
		<table align="center">
			<tr>
				<td rowspan="9" width="200px"> 
					<img alt="" src="./image/soccer/player/${dto.pimage}" width="250px">
					<input type="file" name="pimage" required>
				</td>
				<th>종목</th>
				<td>
					<input type="text" name="play" value="${dto.play}" readonly>
				</td>
			</tr>
			<tr>
				<th>팀</th>
				<td>
					<input type="hidden" id="tnameRef" value="${dto.tname}">
					<select name="tname" id=tname>
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
					<input type="hidden" id="mainposition" value="${dto.main}">
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
		</table>
		<div class="bt">
			<input type="submit"  value="수정">
			<input type="button" value="이전으로" onclick="javascript:history.go(-1)">
		</div>
	</form>
</body>
</html>