<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 페이지</title>
</head>
<body>
<div class="container">   
  <table class="table table-hover memlist">
  <caption>회원 조회</caption>
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>생년월일</th>
        <th>전화번호</th>
		<th>이메일</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>종목</th>
		<th>팀</th>
		<th>등급</th>
		<th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="spo">
	      <tr onclick="location.href='member_detail?id=${spo.id}'">
      		<td onclick="location.href='member_detail?id=${spo.id}'">${spo.id}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.part}</td>
      		<td onclick="location.href='member_detail?id=${spo.id}'">${spo.name}</td>
      		<td onclick="location.href='member_detail?id=${spo.id}'">${spo.birthday}</td>
      		<td onclick="location.href='member_detail?id=${spo.id}'">${spo.tel}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.email}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.zzip_code}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.user_add1}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.user_add2}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.sport}</td>
			<td onclick="location.href='member_detail?id=${spo.id}'">${spo.team}</td>
      	  	<td onclick="location.href='member_delete?id=${spo.id}'"><button type="button">삭제</button></td>
		  </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>