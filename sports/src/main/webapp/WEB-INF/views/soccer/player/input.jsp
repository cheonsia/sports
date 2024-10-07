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
		.bt input[type="reset"]{
			width: 100px;
			height: 40px;
			font-size: 20px;
		}
		.bt input[type="submit"] + input[type="reset"]{
			margin-left: 20px;
		}
	</style>
</head>
<body>
	<h1>선수 등록</h1>
	<form action="playersave" method="post" enctype="multipart/form-data" id="form1" name="form1">
		<table >
			<tr>
				<td rowspan="9" width="200px"> <input type="file" name="pimage"> </td>
				<th>종목</th>
				<td>
					<input type="text" id =play name="play" value="축구" readonly>
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
				<td> <input type="text" name="pname"> </td>
			</tr>
			<tr>
				<th>번호</th>
				<td> <input type="number" name="pnumber"> </td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td> <input type="date" name="pbirth"> </td>
			</tr>
			<tr>
				<th>키</th>
				<td> <input type="number" name="height"> </td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td> <input type="number" name="weight"> </td>
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
			</tr>
			<tr>
				<th>특징</th>
				<td>
					<input type="text" name="pchar">
				</td>
			</tr>
		</table>
		<div class="bt">
			<input type="submit"  value="등록하기">
			<input type="reset" value="다시 입력">
		</div>
	</form>
</body>
</html>