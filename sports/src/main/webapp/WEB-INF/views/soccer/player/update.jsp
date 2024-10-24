<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선수 정보 수정</title>
		<style type="text/css">
			h1{
				margin-top: 0;
			}
			.main_section{
				margin-top: 70px;
			}
			.header_team_logo{
				display: none;
			}
			table{
				table-layout: fixed;
				width: 100%;
				max-width: 800px;
				height: auto;
				margin: 0 auto;
			}
			tbody tr th{
				min-width: 100px;
				width: 100px;
				max-width: 100px;
			}
			tbody tr td{
				width: 100%;
			}
			td.img_td{
				min-width: 300px;
				width: 300px;
				max-width: 300px;
			}
			td.img_td label{
				width: calc(100% - 40px);
				height: 440px;
				display: flex;
				flex-direction: column-reverse;
				margin: 0 auto 0 0;
			}
			input[name="pimage"]{
				width: 100%;
				height: auto;
				font-weight: 400;
				color: #3d3d3d;
				margin: 10px auto 0 0;
				outline: none;
				border: none;
			}
			input[name="pimage"]:focus{
				outline: none;
			}
			input[name="pimage"]::file-selector-button{
				line-height: 20px;
				padding: 4px 10px;
				border: 1px solid #006400;
				border-radius: 5px;
				background-color: #00640010;
				margin: 0 10px 0 0;
			}
			input[name="pimage"]:focus::file-selector-button{
				background-color: #00640020;
			}
			input[name="pimage"] + img{
				display: block;
				width: 100%;
				height: calc(100% - 40px);
				object-fit: cover;
				border-radius: 5px;
				overflow: hidden;
			}
			tbody input[type="text"],
			tbody input[type="number"],
			tbody input[type="date"]{
				width: calc(100% - 22px);
				max-width: 228px;
				height: 28px;
				padding: 5px 10px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				margin: 0 auto;
			}
			tbody input[type="text"][name="pchar"]{
				max-width: none;
			}
			tbody input[type="text"]:read-only{
				border: none;
			}
			tbody input[type="text"]:read-only:focus{
				border-color: #e1e1e1;
			}
			/*tbody input[type="date"]{
			}*/
			tbody input[type="text"]:focus,
			tbody input[type="number"]:focus,
			tbody input[type="date"]:focus,
			tbody select:focus{
				border-color: #006400;
				outline: none;
			}
			tbody select{
				width: calc(100% - 15px);
				max-width: 233px;
				height: 38px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				padding: 0 5px 0 10px;
			}
			#soccer{
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-items: center;
			}
			tbody label{
				display: block;
				margin: 0 10px 0 0;
			}
			tbody input[type="radio"]{
				display: none;
			}
			tbody input[type="radio"] + span{
				min-width: auto;
				width: calc(100% - 22px);
				max-width: none;
				height: 38px;
				line-height: 38px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				text-align: center;
				padding: 0 10px;
			}
			tbody input[type="radio"]:hover + span{
				border-color: #006400;
			}
			tbody input[type="radio"]:checked + span{
				background-color: #00640015;
			}
			.bt{
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 60px auto 0 auto;
			}
			.bt input{
				width: calc(100% - 2px);
				max-width: 118px;
				height: 48px;
				border: 1px solid #006400;
				border-radius: 5px;
				background-color: transparent;
			}
			.bt input + input{
				margin-left: 10px;
			}
			input[type="button"]{
				color: #006400;
			}
			input[type="button"]:hover{
				color: #0c400c;
				boder-color: #0c400c;
				background-color: #00640015;
			}
			input[type="submit"]{
				color: #f9f9f9;
				background-color: #006400;
			}
			input[type="submit"]:hover{
				background-color: #0c400c;
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
					<td rowspan="9" class="img_td">
						<label for="soccerimg">
							<input type="file" id="soccerimg" onchange="readURL(this)" name="pimage" value="${dto.pimage}" required>
							<img alt="선수 사진" src="./image/soccer/player/${dto.pimage}" id="imgpreview">
						</label>
					</td>
					<th>종목</th>
					<td><input type="text" name="play" value="${dto.play}" readonly></td>
				</tr>
				<tr>
					<th>팀</th>
					<td>
						<input type="hidden" id="tnameRef" value="${dto.tname}">
						<select name="tname" id="tname">
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
					<td><input type="text" name="pname" value="${dto.pname}"></td>
				</tr>
				<tr>
					<th>번호</th>
					<td><input type="number" name="pnumber" value="${dto.pnumber}"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="pbirth" value="${dto.pbirth}"></td>
				</tr>
				<tr>
					<th>키</th>
					<td><input type="number" name="height" value="${dto.height}"></td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td><input type="number" name="weight" value="${dto.weight}"></td>
				</tr>
				<tr>
					<th>주포지션</th>
					<td colspan="2">
						<input type="hidden" id="mainposition" value="${dto.main}">
						<div id="soccer">
							<label for="soccerposi1">
								<input type="radio" id="soccerposi1" name="main" value="FW">
								<span>FW</span>
							</label>
							<label for="soccerposi2">
								<input type="radio" id="soccerposi2" name="main" value="MF">
								<span>MF</span>
							</label>
							<label for="soccerposi3">
								<input type="radio" id="soccerposi3" name="main" value="DF">
								<span>DF</span>
							</label>
							<label for="soccerposi4">
								<input type="radio" id="soccerposi4" name="main" value="GK">
								<span>GK</span>
							</label>
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
				<input type="button" value="이전으로" onclick="javascript:history.go(-1)">
				<input type="submit"  value="수정">
			</div>
		</form>
	</body>
	<script type="text/javascript">
		function readURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imgpreview').attr('src',e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
			}else {
				$('#imgpreview').attr('src','./image/member/no_src_img.png');
			}
		}
		$(document).ready(function(){
			$("select[name='tname']").val(`${dto.tname}`).prop("selected", true);
			$("input[name='main']").val(`${dto.main}`).prop("checked", true);
		});
	</script>
</html>