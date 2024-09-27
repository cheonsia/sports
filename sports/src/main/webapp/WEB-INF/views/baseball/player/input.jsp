 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th,td{
	padding-top: 10px;
	padding-bottom: 10px;
}
th{
	width: 80px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#soccer').hide();
	$('#baseball').hide();
	
	$("input[name='play']").change(function(){
		  var play = $('input[type=radio][name="play"]:checked').val();
		  if(play=="soccer"){
		    $('#soccer').show();
		    $('#baseball').hide();
		    $('#soccerteam').show();
		    $('#baseballteam').hide();
		  }else{
		    $('#soccer').hide();
		    $('#baseball').show();
		    $('#soccerteam').hide();
		    $('#baseballteam').show();
		  }
	});
	
	$("#player").click(function(){
		var bmain_len = $("input[name='bmain']:checked").length;
		if(bmain_len>=3) {
			alert('3개 이상은 선택이 불가해요!');
			return false;
		}
		$('#form1').submit();
	});
});

</script>
</head>
<body>
<form action="playersave" method="post" enctype="multipart/form-data" id="form1" name="form1">
<table align="center">
	<tr>
		<td rowspan="9" width="200px"> <input type="file" name="pimage"> </td>
		<th>종목</th>
		<td>
		<input type="radio" name="play" value="soccer"> 축구
		<input type="radio" name="play" value="baseball"> 야구
		</td>
	</tr>
	<tr>
		<th>팀</th>
			<td colspan="2">
			<div id="soccerteam">
				<select name="stname">
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
			</div>
			<div id="baseballteam" hidden>
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
			</div>
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
				<input type="radio" name="smain" value="FW"> FW
				<input type="radio" name="smain" value="MF"> MF
				<input type="radio" name="smain" value="DF"> DF
				<input type="radio" name="smain" value="GK"> GK
			</div>
			<div id="baseball" hidden>
				<input type="radio" name="bmain" value="투수"> 투수
				<input type="radio" name="bmain" value="포수"> 포수
				<input type="radio" name="bmain" value="내야수"> 내야수
				<input type="radio" name="bmain" value="외야수"> 외야수
			</div>
		</td>
	</tr>
	<tr>
		<th>특징</th>
		<td>
			<input type="text" name="pchar">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="button"  value="선수 등록" id="player">
			<input type="reset" value="입력 초기화">
		</td>
	</tr>
</table>
</form>
</body>
</html>