<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.A{
	display: flex;
	flex-wrap: wrap;
	align-items: stretch;
}
.B{
	width: calc(16.6% - 33px);
	margin-top: 20px;
}
.B +.B{
	margin-left: 40px;
}
.B:nth-child(6n+1) {
	margin-left: 0;
}
.main_section p{
	text-align: center;
	width: 200px;
	padding-top: 5px;
}
p+p{
	margin: 10px 0 0 0;
	text-align: center;
}

p.no_data_txt{
	padding: calc((100% - 232px) / 2) 0;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${empty list}">
			<p class="no_data_txt">선수 목록이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<h1>미드필더</h1>
			<div class="A">
				<c:forEach items="${list}" var="j">
				<c:if test="${j.main=='MF'}">
					<div class="B">
						<a href="soccerdetail?playernum=${j.playernum}">
							<img alt="" src="./image/soccer/player/${j.pimage}" width="200px"/>
							<p>${j.pname}</p>
							<p>| ${j.pnumber} |</p>
						</a>
					</div>
				</c:if>
				</c:forEach>
			</div>
			<h1>포워드</h1>
			<div class="A">
				<c:forEach items="${list}" var="j">
					<c:if test="${j.main=='FW'}">
						<div class="B">
							<a href="soccerdetail?playernum=${j.playernum}">
								<img alt="" src="./image/soccer/player/${j.pimage}" width="200px">
								<p>${j.pname}</p>
								<p>| ${j.pnumber} |</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h1>골키퍼</h1>
			<div class="A">
				<c:forEach items="${list}" var="j">
					<c:if test="${j.main=='GK'}">
						<div class="B">
							<a href="soccerdetail?playernum=${j.playernum}">
							<img alt="" src="./image/soccer/player/${j.pimage}" width="200px">
							<p>${j.pname}</p>
							<p>| ${j.pnumber} |</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h1>수비수</h1>
			<div class="A">
				<c:forEach items="${list}" var="j">
					<c:if test="${j.main=='DF'}">
						<div class="B">
							<a href="soccerdetail?playernum=${j.playernum}">
							<img alt="" src="./image/soccer/player/${j.pimage}" width="200px">
							<p>${j.pname}</p>
							<p>| ${j.pnumber} |</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>