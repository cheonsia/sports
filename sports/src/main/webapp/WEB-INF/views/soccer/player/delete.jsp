<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		margin: 0 auto;
	}
	td{
		font-size: 24px;
		padding-left: 30px;
	}
	h1{
		font-size: 40px;
	}
	.img1{
		text-align: center;
	}
	textarea {
	 height: 500px;
	 padding: 20px; 
	 }
	.con{
		width: 100%;
		max-width: 800px;
		margin: 0 auto; 
		border: 1px solid #e8e8e880;
	}
	.p{
		display: flex;
		align-items: center;
	}
	.p img{
	    min-width: 20px;
	    width: 20px;
	    display: block;
	    background-size: contain;
	    height: 20px;
	}
	.p img:hover{
		transform: none;
	}
	
	.p1 img {
		margin-top: -5px;
		margin-right: 5px;
	}
	.first1{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 0 auto;
	}
	.comment{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 20px auto 0 auto;
		align-items: center;
	}
	.comment input[type="text"]{
		width:100%;
		height:40px;
		border: 1px solid #e8e8e8;
		margin-right: 20px;
		padding-left: 3px;
	}
	.comment input[type="submit"]{
		margin: 0 auto; 
	}
	.comment input[type="text"].writer{
		min-width: 150px;
		width: 100px;
		text-align: center;
	}
	.commentresult{
		display: flex;
		flex-wrap: wrap;
		min-width: 800px;
		max-width: 800px; 
		margin: 10px auto 0 auto; 
	}
	.commentresult .p2{
		display: flex; 
		justify-content: flex-start;
		max-width: 800px;
		margin: 0 auto;
		text-align: left;
	}
	.commentresult .p1{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 0 auto;
		text-align: left;
	}
	.commentresult .p1 a{
		display: flex; 
		justify-content: space-between;
		align-items: center;
	}
	.c1{
		width: 100%;
	}
	.cocomment{
		max-width: 400px;
	}
	.comment.cocomment input[type="text"].writer{
		min-width: 100px;
		max-width: 100px;
		display: block;
	}
	.indent_span{
		display: block;
		width: 50px;
	}
	.bt{
		padding-top: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>${dto.pname} 선수의 정보를 삭제하시겠습니까?</h1>
<input type="hidden" value="${playernum}" id="playernum" name="playernum">
<input type="hidden" value="${dto.pnumber}" id="pnum" name="pnum">
<input type="hidden" value="${teamarea}" id="teamarea" name="teamarea">
<table align="center">
	<tr>
		<td rowspan="8">
			<div class="img1">
			<img alt="" src="./image/soccer/player/${dto.pimage}" width="300px">
			</div>
		</td>
		<td>소속: 
			<c:if test="${dto.tname=='kangwon'}">강원</c:if>
            <c:if test="${dto.tname=='gwangju'}">광주</c:if>
            <c:if test="${dto.tname=='gimcheon'}">김천</c:if>
            <c:if test="${dto.tname=='daegu'}">대구</c:if>
            <c:if test="${dto.tname=='daejeon'}">대전</c:if>
            <c:if test="${dto.tname=='seoul'}">서울</c:if>
            <c:if test="${dto.tname=='suwon'}">수원</c:if>
            <c:if test="${dto.tname=='ulsan'}">울산</c:if>
            <c:if test="${dto.tname=='incheon'}">인천</c:if>
            <c:if test="${dto.tname=='jeonbuk'}">전북</c:if>
            <c:if test="${dto.tname=='jeju'}">제주</c:if>
            <c:if test="${dto.tname=='pohang'}">포항</c:if>
        </td>
	</tr>
	<tr>
		<td>선수이름: ${dto.pname}</td>
	</tr>
	<tr>
		<td>번호: ${dto.pnumber}</td>
	</tr>
	<tr>
		<td>생년월일: ${dto.pbirth}</td>
	</tr>
	<tr>
		<td>키: ${dto.height}</td>
	</tr>
	<tr>
		<td>몸무게: ${dto.weight}</td>
	</tr>
	<tr>
		<td>포지션: ${dto.main}</td>
	</tr>
	<tr>
		<td>추가사항: ${dto.pchar}</td>
	</tr>
	<tr>
		<div class="bt">
			<td>
				<input type="button" value="삭제" onclick="location.href='soccerdelete?playernum=${dto.playernum}&tname=${dto.tname}&pimage=${dto.pimage}'">
				<input type="button" value="메인으로" onclick="location.href='./'">
			</td>
		</div>
	</tr>
</table>
</body>
</html>