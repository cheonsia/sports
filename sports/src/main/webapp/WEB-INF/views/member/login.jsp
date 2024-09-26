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
</script>
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
	<p class="p">아직 회원이 아니신가요? <a href="signup">회원가입</a></p>
</form>
</body>
</html>