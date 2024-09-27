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

<form action="delete_member" method="post">
<div>
	<label>아이디</label>
	<input type="text" name="id" id="id_id" value="${del.id}" readonly>
</div>
<div>
	<label>이름</label>
	<input type="text" name="name" id="name_id" value="${del.name}" readonly>
</div>
<div>
	<label>생년월일</label>
	<input type="text" id="birthday_id" name="birthday" value="${del.birthday}" readonly>
</div>
<div>
	<label>전화번호</label>
	<input type="text" id="tel_id" name="tel" value="${del.tel}" readonly>
</div>
<div>
	<label>이메일</label>
	<input type="text" id="email_id" name="email" value="${del.email}" readonly>
</div>
<div>
    <label>우편주소</label>
    <input type="text" name="zzip_code" id="zzip_code_id" value="${del.zzip_code}" readonly>
</div>
<div>
    <label>주소</label>
    <input type="text" name="user_add1" id="user_add1_id" value="${del.user_add1}" readonly>
    <input type="text" name="user_add2" id="user_add2_id" value="${del.user_add2}" readonly>
</div>
<c:choose>
	<c:when test="${del.part =='일반'}">
	<!-- 일반회원일 떄 -->
		<div>
			<label>관심 종목</label>
			<input type="text" id="sport_id" name="sport" value="${del.sport}" readonly>
		</div>
		<div>
			<label>관심 팀</label>
			<input type="text" id="team_id" name="team" value="${del.team}" readonly>
		</div>
	</c:when>
	<c:otherwise>
	<!-- 감독일 떄 -->
		<div>
			<label>관리 종목</label>
			<input type="text" id="sport_id" name="sport" value="${del.sport}" readonly>
		</div>
		<div>
			<label>관리 팀</label>
			<input type="text" id="team_id" name="team" value="${del.team}" readonly>
		</div>
		<div>
			<label>재직 증명서</label>
			<img src="./image/super/${del.voe}" width="100px" height="70px" id="voe_img_id">
			<input type="hidden" name="voe" id="voe_id" value="${del.voe}">
		</div>
		<div>
			<label>등본</label>
			<img src="./image/super/${del.rr}" width="100px" height="70px" id="rr_img_id">
			<input type="hidden" name="rr" id="rr_id" value="${del.rr}">
		</div>
	</c:otherwise>
</c:choose>
<div>
	<label>등급</label>
	<input type="text" name="part" id="part_id" value="${del.part}" readonly>
</div>
<div>
	<input type="submit" value="삭제">
	<input type="button" value="취소" onclick="javascript:history.go(-1)">
</div>
</form>

</body>
</html>