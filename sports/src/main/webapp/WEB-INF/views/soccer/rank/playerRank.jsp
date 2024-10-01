<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		#lastTable,
		#firstTable{
			width: 1200px;
		}
		#lastTable td{
			border: 1px solid #e8e8e8;
		}
		#firstTable th{
			font-size: 20px;
			background-color: #44674d;
			color: #fff;
		}
		#lastTable th{
			background-color: #44674d;
			color: #fff;
		}
		#lastTable .thkor th{
			font-size:12px;
			background-color: #44674d;
			color: #fff;
		}
		th,td{
			text-align: center;
		}
		td img {
			width:30px;
		}
		td input[type="text"]{
			padding: 0px;
			text-align: center;
		}
		td .soccerrank_player{
			display: flex;
			align-items:center;
			padding-left: 10px;
		}
		td .soccerrank_player .soccerrank_playername{
			width: 60px;
			margin: 0 5px 0 5px;
		}
		td .soccerrank_player .soccerrank_pnumber{
			width: 18px;
			margin:0 3px 0 3px;
			background-color:transparent; 
			padding: 0px;
			text-align: center;
		}
		#gain,
		#assist,
		#mom
		{
			width:400px;
			border: none;
		}
		
		#gain td,
		#assist td,
		#mom td
		{
			border: none;
		}
		#gain tr,
		#assist tr,
		#mom tr
		{
			border: 1px solid #e8e8e8;
		}
		.firstrank .display_flex{
			display:flex;
			margin: 0 auto;
		}
		.playerimage{
		    display: flex;
	    	align-items: center;
    		flex-direction: column;
    		margin: 0 0 10px auto;
		}
		.playerimage .player{
			margin-top:5px;
			margin-bottom:5px;
			width: 150px;
			border-radius: 50px;	
		}
		.firstrank.second{
		    width: max-content;
		    display: flex;
		    align-items: center;
		    flex-direction: column;
		    justify-content: end;
		    margin: 0 auto 50px 20px;
		}
		.firstrank.second .rankteam{
		    font-size: 25px;
		    font-weight: bold;
		    margin-bottom: 10px;
		}
		.firstrank.second .rankteamlogo img{
		    width: 50px;
		    margin-bottom: 10px;
		}
		.firstrank.second .rankvalue span{
		    font-size: 25px;				
		}
		
		.rankplayer{
		    display: flex;
		    margin: 0 0 0 70px;
		    justify-content: flex-start;
		    align-items: center;
		}
		.rankplayer .rank{
			margin-right: 40px;
			font-size: 20px;
		}
		
		.rankplayer .rankteam{
			margin-right: 10px;
			font-size: 20px;			
		}
		
		.rankplayer .rankplayername{
			display: flex;
		}
		.modrankvalue{
			margin-right: 75px;
		}
		.modrankvalue span{
			font-size: 20px;		
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$('input[name=tlogo]').each(function() {
			var tname = $(this).val();
			console.log(tname);
			if(tname=='kangwon') name='강원';
			if(tname=='gwangju') name='광주';
			if(tname=='gimcheon') name='김천';
			if(tname=='daegu') name='대구';
			if(tname=='daejeon') name='대전';
			if(tname=='seoul') name='서울';
			if(tname=='suwon') name='수원';
			if(tname=='ulsan') name='울산';
			if(tname=='incheon') name='인천';
			if(tname=='jeonbuk') name='전북';
			if(tname=='jeju') name='제주';
			if(tname=='pohang') name='포항';
			$(this).next('img').attr("src","./image/soccer/logo/"+name+".png");		
		}); 
		
	})
	</script>
</head>
<body>
<c:if test="${adminlogin || superlogin}">
	<input type="button" value="결과 등록" onclick="location.href='playresult'">
	<input type="button" value="결과 수정" onclick="location.href='playresultedit'">
</c:if>
<h3> 주요 부문 선두</h3>
<div class="sub_ranking">
	<table id="firstTable">
		<colgroup>
			<col width="33%">
			<col width="33%">
			<col width="33%">
		</colgroup>
		<tr>
			<th>득점 Top5</th>
			<th>도움 Top5</th>
			<th>MOM Top5</th>
		</tr>
		<tr>
			<td>
				<table id="gain">
					<tr class="firstrank">
						<td colspan="2">
							<div class="display_flex">
								<div class="playerimage">
									<img class="crown" src="./image/soccer/icon/crown.png">			
									<img class="player" src="./image/soccer/player/${sprlist.get(0).playerDTO.pimage}">			
								</div>
								<div class="firstrank second">
									<div class="rankteamlogo">
										<input type="hidden" name="tlogo" value="${sprlist.get(0).playerDTO.tname}" readonly>
										<img alt="팀 로고" src="">
									</div>
									<div class="rankteam">
										${sprlist.get(0).playerDTO.pname}
									</div>
									<div class="rankvalue">
										<span>
											${sprlist.get(0).gain} 
										</span>
										골 
									</div>
								</div>
							</div>
						</td>
					</tr>
					<c:forEach var="i" begin="1" end="4">
						<tr>
							<td class="rankplayer">
								<div class="rank">
									${i+1}
								</div>
								<div class="rankteam">
									<input type="hidden" name="tlogo" value="${sprlist.get(i).playerDTO.tname}" readonly>
									<img alt="팀 로고" src="">
								</div>
								<div class="rankplayername">
									${sprlist.get(i).playerDTO.pname}
								</div>
							</td>
							<td>
								<div class="modrankvalue">
									<span>
										${sprlist.get(i).gain}
									</span>
									골 
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td>
				<table id="assist">
					<tr class="firstrank">
						<td colspan="2">
							<div class="display_flex">
								<div class="playerimage">
									<img class="crown" src="./image/soccer/icon/crown.png">			
									<img class="player" src="./image/soccer/player/${sprassist.get(0).playerDTO.pimage}">			
								</div>
								<div class="firstrank second">
									<div class="rankteamlogo">
										<input type="hidden" name="tlogo" value="${sprassist.get(0).playerDTO.tname}" readonly>
										<img alt="팀 로고" src="">
									</div>
									<div class="rankteam">
										${sprassist.get(0).playerDTO.pname}
									</div>
									<div class="rankvalue">
										<span>
											${sprassist.get(0).assist} 
										</span>
										도움 
									</div>
								</div>
							</div>
						</td>
					</tr>
					<c:forEach var="i" begin="1" end="4">
						<tr>
							<td class="rankplayer">
								<div class="rank">
									${i+1}
								</div>
								<div class="rankteam">
									<input type="hidden" name="tlogo" value="${sprassist.get(i).playerDTO.tname}" readonly>
									<img alt="팀 로고" src="">
								</div>
								<div class="rankplayername">
									${sprassist.get(i).playerDTO.pname}
								</div>
							</td>
							<td>
								<div class="modrankvalue">
									<span>
										${sprassist.get(i).assist}
									</span>
									도움 
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td>
				<table id="mom">
					<tr class="firstrank">
						<td colspan="2">
							<div class="display_flex">
								<div class="playerimage">
									<img class="crown" src="./image/soccer/icon/crown.png">			
									<img class="player" src="./image/soccer/player/${sprmom.get(0).playerDTO.pimage}">			
								</div>
								<div class="firstrank second">
									<div class="rankteamlogo">
										<input type="hidden" name="tlogo" value="${sprmom.get(0).playerDTO.tname}" readonly>
										<img alt="팀 로고" src="">
									</div>
									<div class="rankteam">
										${sprmom.get(0).playerDTO.pname}
									</div>
									<div class="rankvalue">
										<span>
											${sprmom.get(0).mom} 
										</span>
										회
									</div>
								</div>
							</div>
						</td>
					</tr>
					<c:forEach var="i" begin="1" end="4">
						<tr>
							<td class="rankplayer">
								<div class="rank">
									${i+1}
								</div>
								<div class="rankteam">
									<input type="hidden" name="tlogo" value="${sprmom.get(i).playerDTO.tname}" readonly>
									<img alt="팀 로고" src="">
								</div>
								<div class="rankplayername">
									${sprmom.get(i).playerDTO.pname}
								</div>
							</td>
							<td>
								<div class="modrankvalue">
									<span>
										${sprmom.get(i).mom}
									</span>
									회 
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
	</table>
</div>


<h3> 전체 선수 순위</h3>
<table id="lastTable">
	<colgroup>
		<col width="50px">
		<col width="150px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
	</colgroup>
	<tr>
		<th>Rank</th>
		<th>Player</th>
		<th>Gain</th>
		<th>Assist</th>
		<th>AttackPoint</th>
		<th>Match</th>
		<th>Rate</th>
		<th rowspan="2">MOM</th>
		<th rowspan="2">Best11</th>
		<th>Shoot</th>
		<th>OnTargetShot</th>
	</tr>
	<tr class="thkor">
		<th>( 순위 )</th>
		<th>( 선수 )</th>
		<th>( 득점 )</th>
		<th>( 도움 )</th>
		<th>( 공격포인트 )</th>
		<th>( 경기 수 )</th>
		<th>( 평점 )</th>
		<th>( 선정 수 )</th>
		<th>( 슈팅 )</th>
		<th>( 유효 슈팅 )</th>
	</tr>
	<c:forEach items="${sprlist}" var="player">
		<tr>
			<td>${player.ranking}</td>
			<td>
				<div class="soccerrank_player">
					<input type="hidden" name="tlogo" class="soccerrank_tlogo" value="${player.playerDTO.tname}" readonly>
					<img alt="" src="">
					<input type="text" class="soccerrank_playername" value="${player.playerDTO.pname}" readonly>
					 (<input type="text" class="soccerrank_pnumber" value="${player.playerDTO.pnumber}" readonly>)
				</div>
			</td>
			<td><input type="text" value="${player.gain}" readonly></td>
			<td><input type="text" value="${player.assist}" readonly></td>
			<td><input type="text" value="${player.attackpoint}" readonly></td>
			<td><input type="text" value="${player.round}" readonly></td>
			<td><input type="text" value="${player.avgscore}" readonly></td>
			<td><input type="text" value="${player.mom}" readonly></td>
			<td><input type="text" value="${player.best11}" readonly></td>
			<td><input type="text" value="${player.shoot}" readonly></td>
			<td><input type="text" value="${player.possibleshoot}" readonly></td>
	</c:forEach>
</table>
</body>
</html>