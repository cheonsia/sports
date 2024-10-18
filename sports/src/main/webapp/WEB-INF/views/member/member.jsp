<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		..main_section{
	        max-width: 1400px;
		}
		.container{
		    width: 1400px;
		}
		.table.table-hover.memlist {
			width:100%;
		    min-width: 1400px;
		}
		.table.table-hover.memlist th,
		.table.table-hover.memlist td
		{
			text-align: center;
		}
	</style>
</head>
<body>
<div class="container">   
  <h1><c:if test="${!empty list && list.get(0).getInputaccess()=='no'}">승인 요청 </c:if>회원 목록</h1>
  <table class="table table-hover memlist">
    <thead>
      <tr>
		<th>구분</th>
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
		<th>승인 여부</th>
		<th>비고</th>
      </tr>
    </thead>
    <tbody>
    <c:choose>
	    <c:when test="${!empty list}">
		    <c:forEach items="${list}" var="mem">
			    <tr>
			  		<td onclick="location.href='mypage?id=${mem.id}'">${mem.part}</td>
			       	<td onclick="location.href='mypage?id=${mem.id}'">${mem.id}</td>
			   		<td onclick="location.href='mypage?id=${mem.id}'">${mem.name}</td>
			   		<td onclick="location.href='mypage?id=${mem.id}'">${mem.birth}</td>
			   		<td onclick="location.href='mypage?id=${mem.id}'">${mem.tel}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.email}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.zzip_code}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.user_add1}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.user_add2}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.sport}</td>
					<td onclick="location.href='mypage?id=${mem.id}'">${mem.team}</td>
					<c:if test="${mem.inputaccess=='ok'}">
						<td onclick="location.href='mypage?id=${mem.id}'">✔️</td>
			      	  	<td onclick="location.href='memberAccess?id=${mem.id}'"><button type="button">보류</button></td>
					</c:if>
					<c:if test="${mem.inputaccess=='no'}">
						<td onclick="location.href='mypage?id=${mem.id}'">✖️</td>
			      	  	<td onclick="location.href='memberAccess?id=${mem.id}'"><button type="button">승인</button></td>
					</c:if>
				</tr>
		    </c:forEach>
	    </c:when>
	    <c:otherwise>
	    	<tr><td colspan="13">회원 목록이 없습니다</td></tr>
	    </c:otherwise> 
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>