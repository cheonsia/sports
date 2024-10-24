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
				max-width: 1020px;
				margin-bottom: 70px;
			}
			h1{
				margin-top: 60px;
			}
			.A{
				display: flex;
				flex-wrap: wrap;
				align-items: stretch;
			}
			.B{
				width: calc(16.6% - 24.4px);
				margin-top: 40px;
				overflow: hidden;
			}
			.B + .B{
				margin-left: 30px;
			}
			.B:nth-child(6n + 1){
				margin-left: 0;
			}
			.B:nth-child(1),
			.B:nth-child(2),
			.B:nth-child(3),
			.B:nth-child(4),
			.B:nth-child(5),
			.B:nth-child(6){
				margin-top: 0;
			}
			.B a{
				width: 100%;
				height: 100%;
				overflow: hidden;
			}
			.B img.player{
				width: calc(100% - 6px);
				height: 194px;
				object-fit: cover;
				border: 3px solid transparent;
				border-radius: 10px;
				overflow: hidden;
			}
			.B:hover img.player{
				box-shadow: 0 0 15px #00640040;
			}
			.B p{
				width: 100%;
				font-size: 16px;
				line-height: 24px;
				font-weight: bold;
				color: #333;
				margin: 0 auto;
				padding-top: 5px;
				text-align: center;
			}
			.B p + p{
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #999;
				margin-top: 5px;
				padding-top: 0;
			}
			.B p img{
				display: block;
				min-width: 30px;
				width: 30px;
				height: auto;
				background-size: contain;
				margin-right: 10px;
			}
			p.no_data_txt{
				padding: calc((100% - 232px) / 2) 0;
			}
			.hidden{
				position: fixed;
				top: -200vh;
				left: -200vw;
			}
			
			
			@media(max-width: 1000px){
				.B{
					width: calc(33.3% - 13.3px);
				}
				.B +.B{
					margin-left: 20px;
				}
				.B:nth-child(6n + 1){
					margin-left: 20px;
				}
				.B:nth-child(3n + 1){
					margin-left: 0;
				}
				.B:nth-child(4),
				.B:nth-child(5),
				.B:nth-child(6){
					margin-top: 30px;
				}
			}
			@media(max-width: 400px){
				.B{
					width: calc(50% - 10px);
				}
				.B:nth-child(3n + 1){
					margin-left: 20px;
				}
				.B:nth-child(2n + 1){
					margin-left: 0;
				}
				.B:nth-child(3){
					margin-top: 30px;
				}
			}
			select{
				width: 80px;
				border-color: #ccc;
				padding-top: 3px;
			    padding-bottom: 3px;
			    padding-left: 5px;
			}
			input[type=search] {
				width: 310px;
				margin-left: 10px;
			}
			.btn{
				margin-left: 10px;
			}
			.d-flex{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<!-- 검색 -->
		<form class="d-flex" role="search" action="Ssearchlist">
			<input type="text" name="kind" value="축구" class="hidden">
			<table>
				<tr>
					<td>
						<div class="selectBox">
						  <select name="searchcategory" class="select">
						    <option value="포지션">포지션</option>
				        	<option value="선수명">선수명</option>
						  </select>
						</div>
					</td>
					<td>
				        <input class="form-control me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" name="searchval">
					</td>
					<td>
				        <button class="btn btn-outline-success" type="submit">검색</button>						
					</td>
				</tr>
			</table>
      	</form>
		<!--     -->
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
							<a href="playerdetail?playernum=${j.playernum}&play=축구">
								<img alt="${j.pname} 선수 이미지" src="./image/soccer/player/${j.pimage}" class="player">
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
								<a href="playerdetail?playernum=${j.playernum}&play=축구">
									<img alt="${j.pname} 선수 이미지" src="./image/soccer/player/${j.pimage}" class="player">
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
								<a href="playerdetail?playernum=${j.playernum}&play=축구">
									<img alt="${j.pname} 선수 이미지" src="./image/soccer/player/${j.pimage}" class="player">
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
								<a href="playerdetail?playernum=${j.playernum}&play=축구">
									<img alt="${j.pname} 선수 이미지" src="./image/soccer/player/${j.pimage}" class="player">
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
	<script type="text/javascript">
		$(document).ready(function() {
			var win_pname = window.location.search;
			var win_bname = win_pname.split('&');
			var win_tname = win_bname[0].slice(6);
			$('.header_logo_inner a').removeClass('clicked_on');
			$('#soccer_'+win_tname).addClass('clicked_on');
		});
	</script>
</html>