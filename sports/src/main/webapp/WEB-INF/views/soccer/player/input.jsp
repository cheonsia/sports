 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선수 등록</title>
		<style type="text/css">
			h1{
				margin-top: 120px;
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
				max-width: 198px;
				height: 48px;
				border: 1px solid #006400;
				border-radius: 5px;
				background-color: transparent;
			}
			.bt input + input{
				margin-left: 10px;
			}
			input[type="reset"]{
				color: #006400;
			}
			input[type="reset"]:hover{
				color: #0c400c;
				boder-color: #0c400c;
				background-color: #00640015;
			}
			input[type="button"]{
				color: #f9f9f9;
				background-color: #006400;
			}
			input[type="button"]:hover{
				background-color: #0c400c;
			}
		</style>
	</head>
	<body>
		<h1>선수 등록</h1>
		<form action="playersave" method="post" enctype="multipart/form-data" id="form1" name="form1">
			<table>
				<tr>
					<td rowspan="9" class="img_td">
						<label for="soccerimg">
							<input type="file" id="soccerimg" onchange="readURL(this)" name="pimage">
							<img alt="선수 이미지" src="" id="imgpreview" onerror="this.src='./image/member/no_src_img.png'">
						</label>
					</td>
					<th>종목</th>
					<td>
						<input type="text" id="play" name="play" value="축구" readonly>
					</td>
				</tr>
				<tr>
					<th>팀</th>
					<td>
						<select name="tname" disabled="disabled">
							<option value="all">구단을 선택하세요.</option>
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
					<td>
						<input type="text" name="pname" placeholder="이름 입력">
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>
						<input type="number" name="pnumber" placeholder="선수 번호 입력">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="pbirth">
					</td>
				</tr>
				<tr>
					<th>키</th>
					<td>
						<input type="number" name="height" placeholder="키 입력">
					</td>
				</tr>
				<tr>
					<th>몸무게</th>
					<td>
						<input type="number" name="weight" placeholder="몸무게 입력">
					</td>
				</tr>
				<tr>
					<th>주포지션</th>
					<td colspan="2">
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
					<th>특징</th>
					<td>
						<input type="text" name="pchar" placeholder="특징 입력">
					</td>
				</tr>
			</table>
			<div class="bt">
				<input type="reset" onclick="formReset()" value="다시 입력">
				<input type="button" onclick="formRegister()" value="등록하기">
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
		function formReset(){
			$('#imgpreview').attr('src','./image/member/no_src_img.png');
		}
		function formRegister(){
			//tname/pname/pnumber/pbirth/height/weight/main/pchar
			var val_img = $('#imgpreview').attr('src');
			var val_tname = $('select[name="tname"]').val();
			var val_pname = $('input[name="pname"]').val();
			var val_pnumber = $('input[name="pnumber"]').val();
			var val_pbirth = $('input[name="pbirth"]').val();
			var val_height = $('input[name="height"]').val();
			var val_weight = $('input[name="weight"]').val();
			var val_main = $('input[name="main"]:checked').val();
			var val_pchar = $('input[name="pchar"]').val();
			if(val_img == './image/member/no_src_img.png'){
				alertShow('입력 오류', '이미지를 선택하세요.');
				return false;
			}
			else if(val_tname == 'all'){
				alertShow('입력 오류', '구단을 선택하세요.');
				return false;
			}
			else if(val_pname == ''){
				alertShow('입력 오류', '선수 이름을 입력하세요.');
				return false;
			}
			else if(val_pnumber == ''){
				alertShow('입력 오류', '선수 번호를 입력하세요.');
				return false;
			}
			else if(val_pbirth == ''){
				alertShow('입력 오류', '선수의 생일을 입력하세요.');
				return false;
			}
			else if(val_height == ''){
				alertShow('입력 오류', '선수의 키를 입력하세요.');
				return false;
			}
			else if(val_weight == ''){
				alertShow('입력 오류', '선수의 몸무게를 입력하세요.');
				return false;
			}
			else if(val_main == ''){
				alertShow('입력 오류', '선수의 주 포지션을 선택하세요.');
				return false;
			}
			else if(val_pchar == ''){
				alertShow('입력 오류', '선수의 특징을 입력하세요.');
				$('input[name="pchar"]').focus();
				return false;
			}
			$('#form1').submit();
		}
		$(document).ready(function(){
			var team = $('#soccer_area').val();
			$("select[name='tname']").val(team).prop("selected", true);
		});
	</script>
</html>