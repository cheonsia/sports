<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			$.ajax({
				type: "post",
				url:"loginpossible",
				async:true,
				data: {"id":id,"pw":pw},
				success:function(data){
					alert(data);
				},
				error:function(){
					alert("에러");
				}
			});
		});
	});

////아이디 찾기 팝업창
$(document).ready(function() {
	$('#is').click(function() {
		var windowFeatures="width=300px, heigth=600px, popup=yes";
		var popup = window.open("idsearch","_blank",windowFeatures);
		popup.resizeTo(350,500);	
	});
});

////비밀번호 찾기 팝업창
$(document).ready(function() {
	$('#ps').click(function() {
		var windowFeatures="width=300px, heigth=600px, popup=yes";
		var pwpopup = window.open("pwsearch","_blank",windowFeatures);
		pwpopup.resizeTo(350,500);	
	});
});
</script>
<style type="text/css">
.isps, .is, .ps {
font-size: 13px;
}
</style>
</head>
<body>
<h1>Login</h1>
<form action="logincheck" method="post">
<table>
<tr>
	<th>아이디</th>
	<td> <input type="text" id="id" name="id"> </td>
</tr>
<tr>
	<th>비밀번호</th>
	<td> <input type="password" id="pw" name="pw"> </td>
</tr>
</table>
	<input type="submit" id ="login" value="로그인"><br>
		<p class="isps">
			<a id="is" class="is">아이디 찾기</a>
			 | 
			<a id="ps" class="ps">비밀번호 찾기</a>
		</p>
		<p class="p">아직 회원이 아니신가요? <a href="signup">회원가입</a></p>
</form>
</body>
</html>