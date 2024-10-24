<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			.header_team_logo{
				display: none;
			}
			.main_section{
				width: calc(100% - 40px);
				margin-top: 50px;
			}
			h1{
				margin-top:0;
			}
			.whole_rank{
				width: 100%;
				height: calc(100vh - 370px);
				overflow: auto;
				margin: 0 auto 50px auto;
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
			table{
				table-layout: fixed;
				width: 1200px;
			    margin: 0 auto;
			}
			table thead{
				position: -webkit-sticky; /* 사파리 브라우저 지원 */
				position: sticky;
				top: 0;
			}
			td{
				text-align: center;
				border: 1px solid #e8e8e8;
			}
			th{
				text-align: center;
				background-color: #44674d;
				color: #fff;
			}
			td img {
				width:30px;
			}
			td input[type="text"]{
				padding: 0px;
				text-align: center;
			}
			tr th,
			tr td{
				width: 100%;
				height: 40px;
			}
			tr th:nth-child(1),
			tr td:nth-child(1){
				min-width: 70px;
				width: 70px;
			}		
			tr th:nth-child(2),
			tr td:nth-child(2){
				min-width: 150px;
				width: 150px;
				font-weight: bold;
			}
			tr td:nth-child(2){
				text-align: left;
	    		padding-left: 35px;
			}
			tr td:nth-child(4){
			    font-weight: bold;
			    background-color: #e4f4e480;
			    color: #000000;
			    font-size: 18px;
			}
			tr th:nth-child(12),
			tr td:nth-child(12){
				min-width: 200px;
				width: 200px;
			}
		</style>
	</head>
	<body>
		<h1>KBO 정규리그 순위</h1>
		<div class="whole_rank">
			<table>
				<thead>
					<tr>
						<th>순위</th>
						<th>팀명</th>
						<th>경기</th>
						<th>승</th>
						<th>패</th>
						<th>무</th>
						<th>승률</th>
						<th>게임차</th>
						<th>연속</th>
						<th>출타율</th>
						<th>장타율</th>
						<th>최근 10경기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="team" items="${list}">
						<tr>
							<td>${team.rank}</td>
							<td>
								<img src="image/baseball/logo/${team.title}.png" width="25" height="25"> 
								&emsp;${team.title}
							</td>
							<td>${team.match}</td>
							<td>${team.victory}</td>
							<td>${team.defeat}</td>
							<td>${team.draw}</td>
							<td>${team.rate}</td>
							<td>${team.between}</td>
							<td>${team.winning}</td>
							<td>${team.base}</td>
							<td>${team.slugging}</td>
							<td>${team.recent}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>