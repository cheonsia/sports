<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>
<form action="deleteMember" method="post">
<	<div>
		<label>아이디</label>
		<input type="text" name="id" id="id" value="${my.id}" readonly>
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="name" id="name" value="${my.name}" readonly>
	</div>
	<div>
		<label>생년월일</label>
		<input type="text" id="year" name="year" value="">년
		<input type="text" id="month" name="month" value="">월
		<input type="text" id="day" name="day" value="">일
	</div>
	<div>
		<label>전화번호</label>
		<input type="text" id="tel" name="tel" value="${my.tel}" readonly>
	</div>
	<div>
		<label>이메일</label>
		<input type="text" id="email" name="email" value="${my.email}" readonly>
	</div>
	<div>
	    <label>우편주소</label>
	    <input type="text" name="zzip_code" id="zzip_code" value="${my.zzip_code}" readonly>
	</div>
	<div>
	    <label>주소</label>
	    <input type="text" name="user_add1" id="user_add1" value="${my.user_add1}" readonly>
	    <input type="text" name="user_add2" id="user_add2" value="${my.user_add2}" readonly>
	</div>
	<div>
		<!-- 일반회원일 때 -->
		<c:if test="${my.part == '일반'}">
			<label>관심 종목</label>
		</c:if>
		<!-- 감독일 때 -->
		<c:if test="${my.part == '감독'}">
			<label>관리 종목</label>
		</c:if>
		<input type="text" id="sport" name="sport" value="${my.sport}" readonly>
	</div>
	<div>
	<!-- 일반 회원 -->	
		<c:if test="${my.part == '일반'}">
			<label>관심 팀</label>
		</c:if>
	<!-- 감독일 때 -->
		<c:if test="${my.part == '감독'}">
			<label>관리 팀</label>
		</c:if>
			<input type="text" id="team" name="team" value="${my.team}" readonly>
	</div>
	<div>
		<label>구분</label>
		<input type="text" name="part" id="part" value="${my.part}" readonly>
	</div>
	<div>
		<input type="submit" value="삭제">
		<input type="button" value="취소" onclick="javascript:history.go(-1)">
	</div>
</form>

</body>
</html>