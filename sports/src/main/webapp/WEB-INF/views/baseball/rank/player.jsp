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
			max-width: 1400px;
			margin-top: 50px;
		}
		h1{
		    margin-bottom: 0;
		    word-break: auto-phrase;
		}
		h3{
		    font-size: 20px;
		    font-weight: bold;
	        margin: 80px auto 20px auto;
		}
		.result{
			margin: 0 auto;
			text-align: center;
		}
		.tag{
			text-align: left;
		}
		.section_row{
			display: flex;
			flex-wrap: wrap;
			justify-content: start;
			align-items: stretch;
		}
		.section{
		    width: 100%;
		    margin: 10px 0 40px 0;
		    display: inline-table;
		}
		table{
			width: 100%;
			table-layout: fixed;
			margin-bottom: 30px;
		}
		table tbody tr:first-child td{
			padding: 20px 0;
		}
		th{
		    text-align: center;
		    background-color: #e3f5e3;
  			color: #000;
		    width: 100%;
		    height: 60px;
		    font-size: 20px;
		    font-weight: bold;
		    border-radius: 10px;

		}		
		tr td:nth-child(1){
			width: 20px;
			height: 36px;
			font-weight: bold;
		}
		.playerimage{
		    display: flex;
	    	align-items: center;
    		flex-direction: column;
    		margin: 0;
		}
		.playerimage .crown{
			width: 25px;
		}
		.playerimage .player{
		    min-width: 150px;
		    width: 150px;
		    height: 150px;
			overflow: hidden;
			object-fit: cover;
			border-radius: 50px;
		}
		.teamLogo{
			min-width: 30px;
			width: 30px;
			margin-right: 5px;
		}
		tr:nth-child(1) td{
			padding: 0;
		}
		tr:nth-child(1) .teamLogo{
			width: 70px;
		}
		tr td:nth-child(1){
			width: 20px;
		}
		tr td:nth-child(2){
			text-align: left;
			padding-left: 0;
		}
		tr td:nth-child(3){
			color: #006400;
			font-weight: bold;
		}
		tr:nth-child(1) td:nth-child(2){
			text-align: center;
		    padding: 0;
		}
		tr:nth-child(1) td:nth-child(2) span{
			font-size: 20px;
			font-weight: 700;
			display: block;
		}
		tr:nth-child(1) td:nth-child(2) span+span{
			margin-top: 10px;
		}
		@media(min-width: 768px){
			.section{
				width: calc(50% - 10px);
			}
			.section:nth-child(2n){
				margin-left: 20px;
			}
		}
		@media(min-width: 1300px){
			.section{
				width: calc(25% - 15px);
				margin-left: 20px;
			}
			.section:nth-child(2n){
				margin-left: 20px;
			}
			.section:nth-child(4n + 1){
				margin-left: 0;
			}
		}
	</style>
</head>
<body>
	<h1>KBO 정규리그 선수 순위 TOP5</h1>
	<div class="result">
		<c:forEach var="i" begin="0" end="2" step="1">
			<h3>${section[i]}</h3>
			<div class="section_row">
				<c:forEach var="j" begin="${i*4}" end="${i*4 + 3}" step="1">
					<div class="section">
						<table>
							<colgroup>
								<col width="3">
								<col width="7">
								<col width="6">
							</colgroup>
							<thead>
								<tr>
									<th colspan="3">${sectionlist[5*j].hold}</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="k" begin="${5*j}" end="${5*j+4}" step="1">
									<c:if test="${k==5*j}">
										<tr>
											<td colspan="2">
												<div class="playerimage">
													<img class="crown" src="./image/soccer/icon/crown.png">			
													<img class="player" src="./image/baseball/player/${sectionlist[k].era}">
												</div>
											</td>
											<td>
												<img class="teamLogo" src="./image/baseball/logo/${sectionlist[k].team}.png">
												<span>${sectionlist[k].name}</span>
												<span>${sectionlist[k].win}</span>
											</td>
										</tr>
									</c:if>
									<c:if test="${k!=5*j}">
										<tr>
											<td>${sectionlist[k].rank}</td>
											<td>
												<img class="teamLogo" src="./image/baseball/logo/${sectionlist[k].team}.png">
												${sectionlist[k].name}
											</td>
											<td>${sectionlist[k].win}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
</body>
</html>