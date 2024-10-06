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
	<form action="updatesave" method="post" enctype="multipart/form-data" id="form1" name="form1">
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
					<input type="hidden" id="tnameRef" value="${dto.tname}">
					<select name="tname" id="tname">
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
					<input type="hidden" id="mainposition" value="${dto.main}">
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
		</table>
		<div class="bt">
			<input type="submit"  value="수정">
			<input type="button" value="이전으로" onclick="javascript:history.go(-1)">
		</div>
	</form>
</body>
</html>