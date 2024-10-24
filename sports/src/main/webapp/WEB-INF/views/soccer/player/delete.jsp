<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선수 정보 삭제</title>
		<style type="text/css">
			.main_section{
				width: calc(100% - 40px);
				max-width: 700px;
				margin-top: 50px;
			}
			.header_team_logo{
				display: none;
			}
			h1{
				font-size: 30px;
				margin-top: 0;
				word-break: auto-phrase;
			}
			table{
				table-layout: fixed;
				width: 100%;
				max-width: 700px;
				margin: 0 auto 20px auto;
			}
			td{
				height: auto;
				font-size: 16px;
				color: #333;
			}
			td.playerImg{
				display: block;
				width: 100%;
				margin: 0 auto;
			}
			td div{
				display: block;
			}
			td p{
				display: inline-block;
				min-width: 100px;
				width: 100px;
				max-width: 100px;
				font-size: 14px;
				line-height: 24px;
				color: #777777;
				margin: 0;
			}
			td p + p{
				min-width: auto;
				width: 100%;
				max-width: none;
				font-size: 16px;
				color: #3d3d3d;
				margin: 5px 0 20px 0;
			}
			td:nth-child(2) input,
			td:nth-child(2) input:hover{
				width: 100%;
				height: 24px;
				color: #3d3d3d;
				border: none;
				outline: none;
				padding: 0;
				margin: 5px auto 20px auto;
			}
			td:nth-child(2){
				display: flex;
				align-items: center;
			}
			.img1{
				width: 100%;
				height: 480px;
				text-align: center;
				border-radius: 10px;
				overflow: hidden;
				object-fit: cover;
				margin: 0 auto 40px auto;
			}
			textarea{
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
			.soccer .p img:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .p img:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.p1 img{
				margin-right: 5px;
			}
			.bt{
			    display: flex;
			    flex-wrap: nowrap;
			    justify-content: center;
			    align-items: center;
			    width: 100%;
				margin: 50px auto 80px auto;
			}
			.bt input{
				display: block;
				width: 100%;
				max-width: 118px;
				height: 48px;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				border-radius: 5px;
				outline: none;
				border: 1px solid transparent;
			}
			.bt input[type="button"]{
				color: #bb0000;
				background-color: transparent;
				border-color: #bb0000;
			}
			.bt input[type="button"]:hover{
				background-color: #bb000015;
				border-color: #8d0c0c;
			}
			.bt input[type="submit"]{
				margin-left: 10px;
				color: #f9f9f9;
				background-color: #bb0000;
			}
			.bt input[type="submit"]:hover{
				background-color: #8d0c0c;
			}
			.soccer .bt input:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .bt input:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			@media (min-width: 600px){
				.img1{
					width: calc(100% - 30px);
					height: 400px;
					margin: 0 30px 0 0;
				}
				td.playerImg{
					display: revert;
					width: 250px;
					max-width: 250px;
				}
				td div{
					display: flex;
				}
				tr{
					height: 30px;
				}
				td{
					height: 30px;
				}
				td:nth-child(2) input{
					margin: 0 0 0 10px;
				}
				td p{
					font-size: 16px;
				}
				td p + p{
					font-size: 18px;
					margin: 0 0 0 10px;
				}
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				var team = `${dto.tname}`;
				if(team=='kangwon') name='강원';
				if(team=='gwangju') name='광주';
				if(team=='gimcheon') name='김천';
				if(team=='daegu') name='대구';
				if(team=='daejeon') name='대전';
				if(team=='seoul') name='서울';
				if(team=='suwon') name='수원';
				if(team=='ulsan') name='울산';
				if(team=='incheon') name='인천';
				if(team=='jeonbuk') name='전북';
				if(team=='jeju') name='제주';
				if(team=='pohang') name='포항';
				if(team=='KIA')name='KIA';
				if(team=='KT')name='KT';
				if(team=='LG')name='LG';
				if(team=='NC')name='NC';
				if(team=='SSG')name='SSG';
				if(team=='DOOSAN')name='두산';
				if(team=='LOTTE')name='롯데';
				if(team=='SAMSUNG')name='삼성';
				if(team=='KIWOOM')name='키움';
				if(team=='HANHWA')name='한화';
				$("#team").text(name);	
			});
		</script>
	</head>
	<body>
		<div class="<c:if test="${dto.play == '축구'}">soccer</c:if><c:if test="${dto.play == '야구'}">baseball</c:if>">
			<h1>${dto.pname} 선수의 정보를 삭제하시겠습니까?</h1>
			<form action="playerdelete" method="post">
				<input type="hidden" name="playernum" value="${dto.playernum}">
				<input type="hidden" name="play" value="${dto.play}">
				<input type="hidden" name="tname" value="${dto.tname}">
				<input type="hidden" name="pimage" value="${dto.pimage}">
				<table>
					<tr>
						<td rowspan="8" class="playerImg">
							<c:if test="${dto.play == '축구'}"><img alt="" src="./image/soccer/player/${dto.pimage}" width="300px" class="img1"></c:if>
							<c:if test="${dto.play == '야구'}"><img alt="" src="./image/baseball/player/${dto.pimage}" width="300px" class="img1"></c:if>
						</td>
						<td>
							<div>
								<p>소속</p>
								<p id="team">${dto.tname}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>선수이름</p>
								<p>${dto.pname}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>번호</p>
								<p>${dto.pnumber}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>생년월일</p>
								<p>${dto.pbirth}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>키</p>
								<p>${dto.height}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>몸무게</p>
								<p>${dto.weight}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>포지션</p>
								<p>${dto.main}</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<p>추가사항</p>
								<p>${dto.pchar}</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="bt">
					<input type="button" value="취소" onclick="javascript:history.go(-1)">
					<input type="submit" value="삭제">
				</div>
			</form>
		</div>
	</body>
</html>