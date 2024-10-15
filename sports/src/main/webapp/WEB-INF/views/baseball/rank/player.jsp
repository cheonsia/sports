<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.result{
			margin: 0 auto;
			text-align: center;
		}
		.tag{
			text-align: left;
		}
		.section{
			width: 24%;
			display: inline-table;
		}
		table{
			width: 100%;
			table-layout: fixed;
			margin-bottom: 30px;
			border: 1px solid #e8e8e8;
		}
		th{
			border: 1px solid #e8e8e8;
			text-align: center;
			background-color: #44674d;
			color: #fff;
			width: 100%;
		}		
		tr td:nth-child(1){
			height: 36px;
			width: 20px;
		}
		
	</style>
</head>
<body>
	<h1>KBO 정규리그 선수 순위</h1>
	<div class="result">
		<div class="tag">
			<h3>주요 부문 선두</h3>
		</div>
		<c:forEach var="i" begin="0" end="${sectionlist.size()-1}" step="5">
			<div class="section">
				<table>
					<thead>
						<tr>
							<th colspan="3">${i}</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="j" begin="${i}" end="${i+4}" step="1">
							<c:if test="${i==j}">
								<tr>
									<td colspan="2">${sectionlist[j].era}</td>
									<td>
										${sectionlist[j].name}
										${sectionlist[j].team}
										${sectionlist[j].win}
									</td>
								</tr>
							</c:if>
							<c:if test="${i!=j}">
								<tr>
									<td>${sectionlist[j].rank}</td>
									<td>${sectionlist[j].name}
										${sectionlist[j].team}</td>
									<td>${sectionlist[j].win}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
</body>
</html>