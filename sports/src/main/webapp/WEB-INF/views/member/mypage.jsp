<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<div>
	<label>아이디</label>
	<input type="text" name="id" id="id_id" value="${my.id}" readonly>
</div>
<div>
	<label>이름</label>
	<input type="text" name="name" id="name_id" value="${my.name}" readonly>
</div>
<div>
	<label>생년월일</label>
	<input type="text" id="birthday_id" name="birthday" value="${my.birthday}" readonly>
</div>
<div>
	<label>전화번호</label>
	<input type="text" id="tel_id" name="tel" value="${my.tel}" readonly>
</div>
<div>
	<label>이메일</label>
	<input type="text" id="email_id" name="email" value="${my.email}" readonly>
</div>
<div>
    <label>우편주소</label>
    <input type="text" name="zzip_code" id="zzip_code_id" value="${my.zzip_code}" readonly>
</div>
<div>
    <label>주소</label>
    <input type="text" name="user_add1" id="user_add1_id" value="${my.user_add1}" readonly>
    <input type="text" name="user_add2" id="user_add2_id" value="${my.user_add2}" readonly>
</div>
<c:choose>
	<c:when test="${my.part =='일반'}">
	<!-- 일반회원일 떄 -->
		<div>
			<label>관심 종목</label>
			<input type="text" id="sport_id" name="sport" value="${my.sport}" readonly>
		</div>
		<div>
			<label>관심 팀</label>
			<input type="text" id="team_id" name="team" value="${my.team}" readonly>
		</div>
	</c:when>
	<c:otherwise>
	<!-- 감독일 떄 -->
		<div>
			<label>관리 종목</label>
			<input type="text" id="sport_id" name="sport" value="${my.sport}" readonly>
		</div>
		<div>
			<label>관리 팀</label>
			<input type="text" id="team_id" name="team" value="${my.team}" readonly>
		</div>
		<div>
			<label>등급</label>
			<input type="text" name="part" id="part_id" value="${my.part}" readonly>
		</div>
	</c:otherwise>
</c:choose>
<div>
	<button type="button" onclick="location.href='mypage_update'">내 정보 수정</button>
</div>
<div>
	<button type="button" onclick="location.href='signup_lookup'">이전으로</button>
</div>

</body>
</html>