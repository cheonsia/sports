<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
</head>
<body>

	<div>
		<label>아이디</label>
		<input type="text" name="id" id="id_id" value="${wm.id}" readonly>
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="name" id="name_id" value="${wm.name}" readonly>
	</div>
	<div>
		<label>생년월일</label>
		<input type="text" id="birthday_id" name="birthday" value="${wm.birthday}" readonly>
	</div>
	<div>
		<label>전화번호</label>
		<input type="text" id="tel_id" name="tel" value="${wm.tel}" readonly>
	</div>
	<div>
		<label>이메일</label>
		<input type="text" id="email_id" name="email" value="${wm.email}" readonly>
	</div>
	<div>
	    <label>우편주소</label>
	    <input type="text" name="zzip_code" id="zzip_code_id" value="${wm.zzip_code}" readonly>
	</div>
	<div>
	    <label>주소</label>
	    <input type="text" name="user_add1" id="user_add1_id" value="${wm.user_add1}" readonly>
	    <input type="text" name="user_add2" id="user_add2_id" value="${wm.user_add2}" readonly>
	</div>
	<c:choose>
		<c:when test="${wm.part =='감독'}">
			<div>
				<label>관리 종목</label>
				<input type="text" id="sport_id" name="sport" value="${wm.sport}" readonly>
			</div>
			<div>
				<label>관리 팀</label>
				<input type="text" id="team_id" name="team" value="${wm.team}" readonly>
			</div>
			<div>
				<label>재직 증명서</label>
				<img src="./image/super/${wm.voe}" width="100px" height="70px">
				<input type="hidden" name="voe" id="voe_id" value="${wm.voe}">
			</div>
			<div>
				<label>등본</label>
				<img src="./image/super/${wm.rr}" width="100px" height="70px">
				<input type="hidden" name="rr" id="rr_id" value="${wm.rr}">
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<label>관심 종목</label>
				<input type="text" id="sport_id" name="sport" value="${wm.sport}" readonly>
			</div>
			<div>
				<label>관심 팀</label>
				<input type="text" id="team_id" name="team" value="${wm.team}" readonly>
			</div>
		</c:otherwise>
	</c:choose>
	<div>
		<label>등급</label>
		<input type="text" name="part" id="part_id" value="${wm.part}" readonly>
	</div>
	<c:choose>
		<c:when test="${wm.part == '감독'}">
			<div>
				<button type="button">승인하기</button>
				<button type="button">거부하기</button>
			</div>
		</c:when>
	</c:choose>
	<div>
		<button type="button" onclick="location.href='signup_lookup'">이전으로</button>
	</div>

</body>
</html>