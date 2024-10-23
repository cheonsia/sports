<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			.main_section{
				width: calc(100% - 40px);
			}
			.whole_rank{
				width: 100%;
				height: calc(100vh - 350px);
				overflow: auto;
				margin: 0 auto;
			}
			.whole_rank::-webkit-scrollbar{
				width: 10px;
				height: 10px;
				background-color: #ddd;
				border-radius: 5px;
			}
			.whole_rank::-webkit-scrollbar-thumb{
				width: 10px;
				height: 10px;
				background-color: #00640030;
				border-radius: 5px;
			}
			.table.table-hover.memlist {
				min-width: 1400px;
				width: 100%;
				table-layout: fixed;
			}
			.table thead{
				position: -webkit-sticky; /* 사파리 브라우저 지원 */
				position: sticky;
				top: 0;
			}
			.table.table-hover.memlist th,
			.table.table-hover.memlist td{
				width: 100%;
				text-align: center;
				padding: 10px;
				white-space: nowrap;
				line-height: 24px;
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			.table.table-hover.memlist th{
				background-color: #dee9de;
			}
			.table.table-hover.memlist th:nth-child(1),
			.table.table-hover.memlist td:nth-child(1){
				min-width: 70px;
				width: 70px;
				max-width: 70px;
			}
			.table.table-hover.memlist th:nth-child(5),
			.table.table-hover.memlist td:nth-child(5){
				min-width: 130px;
				width: 130px;
				max-width: 130px;
			}
			.table.table-hover.memlist th:nth-child(7),
			.table.table-hover.memlist td:nth-child(7){
				min-width: 80px;
				width: 80px;
				max-width: 80px;
			}
			.table.table-hover.memlist th:nth-child(10),
			.table.table-hover.memlist td:nth-child(10),
			.table.table-hover.memlist th:nth-child(11),
			.table.table-hover.memlist td:nth-child(11),
			.table.table-hover.memlist th:nth-child(12),
			.table.table-hover.memlist td:nth-child(12),
			.table.table-hover.memlist th:nth-child(13),
			.table.table-hover.memlist td:nth-child(13){
				min-width: 70px;
				width: 70px;
				max-width: 70px;
			}
			.table.table-hover.memlist tbody tr:nth-child(2n){
				background-color: #00640005;
			}
			.table.table-hover.memlist tbody tr:hover{
				background-color: #00640010;
			}
			button{
				width: 50px;
				border: 1px solid #3da73d;
				background-color: #fff;
				border-radius: 5px;
			}
			button:hover{
				background-color: #0c400c80;
				color: #fff;
			}
		</style>
	</head>
	<body>
		<h1><c:if test="${!empty list && list.get(0).getInputaccess()=='no'}">승인 요청 </c:if>회원 목록</h1>
		<div class="whole_rank">
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
										<td onclick="location.href='memberAccess?id=${mem.id}'"><button type="button"><c:if test="${mem.part=='일반'}">해제</c:if><c:if test="${mem.part=='감독'}">승인</c:if></button></td>
									</c:if>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="13" style="padding:120px 0;color:#999;">회원 목록이 없습니다</td>
							</tr>
						</c:otherwise> 
					</c:choose>
				</tbody>
			</table>
		</div>
	</body>
</html>