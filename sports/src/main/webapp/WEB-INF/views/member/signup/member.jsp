<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
table {
width: 2000px;
}
caption {
text-align: center;
font-size: 30px;
}
</style>
<title>조회 페이지</title>
</head>
<body>
<div class="container">   
  <table class="table table-hover">
  <caption>회원 조회</caption>
    <thead>
      <tr>
        <th>아이디</th><th>이름</th><th>생년월일</th><th>전화번호</th>
		<th>이메일</th><th>우편번호</th><th>주소</th><th>상세주소</th>
		<th>(관심/관리)종목</th><th>(관심/관리)팀</th><th>등급</th><th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="spo">
      <tr onclick="location.href='member_detail?id=${spo.id}'">
		<td>${spo.id}</td><td>${spo.name}</td><td>${spo.birthday}</td><td>${spo.tel}</td>
		<td>${spo.email}</td><td>${spo.zzip_code}</td><td>${spo.user_add1}</td>
		<td>${spo.user_add2}</td><td>${spo.sport}</td><td>${spo.team}</td><td>${spo.part}</td>
	  	<td><button type="button" onclick="location.href='member_delete?id=${spo.id}'">삭제</button></td>
	  </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>