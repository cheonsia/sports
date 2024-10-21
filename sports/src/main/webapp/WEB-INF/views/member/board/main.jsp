<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">
	.header_team_logo.scroll_div{
		display: none;
	}
    .main_section {
       margin-top: 30px;
    }
    .main_section h1 {
       margin-bottom: 0;
    }
	.board div{
		width: 900px;
		text-align: right;
		margin: 10px auto;
	}
	.board div.button{
		margin-top: -30px;
	}
	.button .inquiry{
		width:80px;
	    height: 35px;
	    border-radius: 5px;
		border: 1px solid #0c400c80;
		background-color:#fff;
		color: #0c400c;
	}
	.button .inquiry:hover{
		border-color:#0c400c20;
		background-color:#0c400c10;
	}
	div.result{
		text-align: center;
	}
	table{
		text-align: center;
		width: 100%;
	}
	tr{
		height: 40px;
	}
	th{
		text-align: center;
		border: 1px solid #fff;
		background-color: #0c400c20;
	}
	td{
		text-align: center;
		border: 1px solid #e8e8e8;
	}
	th:nth-child(1){
		width: 80px;
	}
	th:nth-child(2){
		width: calc(100% - 180px);
	}
	td:nth-child(2){
		text-align: left;
	}
	th:nth-child(3){
		width: 100px;
	}
	</style>
		<meta charset="UTF-8">
	</head>
	<body>
		<div class="board">
			<h1>문의 게시판</h1>
			<!--  글작성 버튼-->
			<div class="button">
				<input type="button" class="inquiry" value="문의하기" onclick="location.href='boardInput'"/>
			</div>
			<!--  조회 화면 -->
			<div class="result">
				<table>
					<tr>
						<th>No.</th>
						<c:if test="${adminlogin}"><th>분 야</th></c:if>
						<th>제 목</th>
						<th>작 성 자</th>
					</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr><td colspan="3">아직 게시글이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="li">
							<tr>
								<td></td>
								<td>
									<c:if test="${li.status=='n'}">
										<img alt="" src="./image/member/logo/keyoff.png">
										<a href="boardDetail?num=${li.num}">${li.part}</a>
										<span>(답변 대기)</span>
									</c:if>
									<c:if test="${li.status=='y'}">
										<img alt="" src="./image/member/logo/keyon.png">
										<a href="boardDetail?num=${li.num}">${li.part}</a>
										<span>(답변 완료)</span>
									</c:if>
								</td>
								<c:if test="${adminlogin}"><td>${li.title}</td></c:if>
								<td></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
			</div>
		</div>
	</body>
</html>