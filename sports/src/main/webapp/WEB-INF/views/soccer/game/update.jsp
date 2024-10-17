<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

			/*버튼*/
			.training_memo_btn_whole {
				width: 100%;
				height: auto;
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				margin: 10px auto 30px auto;
				margin-top: 20px;
			}
			
			.training_memo_btn {
				display: block;
				width: 100%;
				max-width: 100px;
				height: 40px;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				border: 1px solid transparent;
				border-radius: 5px;
			}
			
			.training_memo_btn.memo_btn_cancel {
				color: #556B2F;
				background-color: #fff;
				border-color: #556B2F;				
			}
			
			.training_memo_btn.memo_btn_save {
				color: #fff;
				background-color: #556B2F;
				border-color: #556B2F;
			}
			
			.training_memo_btn + .training_memo_btn {
				margin-left: 20px;
			}

	p.traning_pop_subtext {
		font-size: 16px;
		line-height: 24px;
		font-weight: 400;
		color: #999;
		text-align: center;
		margin: 10px auto 0 auto;
	}
	
	.traning_pop_inner {
		width: 100%;
		max-width: 1000px;
		height: calc(100% - 70px);
		overflow: hidden;
		overflow-y: auto;
		margin: 0 auto;
	}	

	.traning_pop_inner::-webkit-scrollbar {
		display: none;
	}p.traning_choose_pop_title {
		font-size: 17px;
		line-height: 28px;
		color: #777;
		text-align: center;
		margin: 60px auto 10px auto;
	}
			
	p.traning_choose_pop_title2 {
		font-size: 14px;
		line-height: 20px;
		color: #999;
		text-align: center;
		margin: 0 auto 10px auto;
	}
	.traning_people_choose {
				display: flex;
				flex-wrap: nowrap;
				justify-content: center;
				align-items: center;
				width: 100%;
				margin: 0 auto;
			}
			.traning_people_choose div{
				display: flex;
				flex-wrap: wrap;
			}
			
			.traning_people_choose label {
				display: block;
				width: calc(16.6% - 10px);
				max-width: 100%;
				margin: 0;
			}
			
			.traning_people_choose label + label {
				margin-left: 10px;
			}
			
			.traning_people_choose label:nth-child(6n + 1) {
				margin-left: 0;
			}
			
			input[name="team1"],
			input[name="team2"]{
				display: none;
			}
			
			input[name="team1"] + img,
			input[name="team2"] + img{
				border: 2px solid transparent;
				border-radius: 50px;
			}
			
			input[name="team1"]:checked + img,
			input[name="team2"]:checked + img{
				border-color: #006400;
			}
			
			
			p.no_data_txt {
				padding-top: 20px;
			}
			.traning_map_flex select,
			input.traning_calendar_input,
			input.traning_calendar_datepicker,
			input.traning_calendar_datepicker2 {
				width: calc(100% - 22px);
				height: 40px;
				line-height: 60px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				padding: 0 10px;				
			}

			input.traning_calendar_input {
				max-width: 130px;
			}
			
			/*datepicker*/
			.daterangepicker {
				width: auto;
				max-width: none;
			}
			
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var team1 = $('#gt1').val();
		var team2 = $('#gt2').val();
		var place = $('#place').val();
		$('input[name="team1"]:input[value="'+team1+'"]').prop("checked",true);
		$('input[name="team2"]:input[value="'+team2+'"]').prop("checked",true);
	    $("#gamePlace").val(place).prop("selected", true);
		
	});
</script>
</head>
<body>
<input type="hidden" name="gt1" id="gt1" value="${dto.team1}">
<input type="hidden" name="gt2" id="gt2" value="${dto.team2}">
<input type="hidden" name="place" id="place" value="${dto.gameplace}">
<p class="traning_pop_subtext">경기를 수정해주세요 :)</p>
        		<div class="traning_pop_inner">
	        		<form action="soccerGameUpdate" method="post">
	        		<input type="hidden" name="gamenum" value="${dto.gamenum}">
		       			<div class="traning_people_inner" >
		        			<p class="traning_choose_pop_title">팀 선택</p>
		       				<div class="traning_people_choose">
			       				<div>
			       					<label for="select_team1_gangwon">
			       						<input type="radio" id="select_team1_gangwon" name="team1" value="강원">
			       							<img alt="" src="./image/soccer/logo/강원.png" width="50px">
			       					</label>
			       					<label for="select_team1_gwangju">
			       						<input type="radio" id="select_team1_gwangju" name="team1" value="광주">
			       							<img alt="" src="./image/soccer/logo/광주.png" width="50px">
			       					</label>
			       					<label for="select_team1_gimcheon">
			       						<input type="radio" id="select_team1_gimcheon" name="team1" value="김천">
			       							<img alt="" src="./image/soccer/logo/김천.png" width="50px">
			       					</label>
			       					<label for="select_team1_daegu">
			       						<input type="radio" id="select_team1_daegu" name="team1" value="대구">
			       							<img alt="" src="./image/soccer/logo/대구.png" width="50px">
			       					</label>
			       					<label for="select_team1_daejeon">
			       						<input type="radio" id="select_team1_daejeon" name="team1" value="대전">
			       							<img alt="" src="./image/soccer/logo/대전.png" width="50px">
			       					</label>
			       					<label for="select_team1_seoul">
			       						<input type="radio" id="select_team1_seoul" name="team1" value="서울">
			       							<img alt="" src="./image/soccer/logo/서울.png" width="50px">
			       					</label>
			       					<label for="select_team1_suwon">
			       						<input type="radio" id="select_team1_suwon" name="team1" value="수원">
			       							<img alt="" src="./image/soccer/logo/수원.png" width="50px">
			       					</label>
			       					<label for="select_team1_ulsan">
			       						<input type="radio" id="select_team1_ulsan" name="team1" value="울산">
			       							<img alt="" src="./image/soccer/logo/울산.png" width="50px">
			       					</label>
			       					<label for="select_team1_incheon">
			       						<input type="radio" id="select_team1_incheon" name="team1" value="인천">
			       							<img alt="" src="./image/soccer/logo/인천.png" width="50px">
			       					</label>
			       					<label for="select_team1_jeonbuk">
			       						<input type="radio" id="select_team1_jeonbuk" name="team1" value="전북">
			       							<img alt="" src="./image/soccer/logo/전북.png" width="50px">
			       					</label>
			       					<label for="select_team1_jeju">
			       						<input type="radio" id="select_team1_jeju" name="team1" value="제주">
			       							<img alt="" src="./image/soccer/logo/제주.png" width="50px">
			       					</label>
			       					<label for="select_team1_pohang">
			       						<input type="radio" id="select_team1_pohang" name="team1" value="포항">
			       							<img alt="" src="./image/soccer/logo/포항.png" width="50px">
			       					</label>
			       				</div>
		       					<p>  vs  </p>
		       					<div class="select_team2">
			       					<label for="select_team2_gangwon">
			       						<input type="radio" id="select_team2_gangwon" name="team2" value="강원">
			       							<img alt="" src="./image/soccer/logo/강원.png" width="50px">
			       					</label>
			       					<label for="select_team2_gwangju">
			       						<input type="radio" id="select_team2_gwangju" name="team2" value="광주">
			       							<img alt="" src="./image/soccer/logo/광주.png" width="50px">
			       					</label>
			       					<label for="select_team2_gimcheon">
			       						<input type="radio" id="select_team2_gimcheon" name="team2" value="김천">
			       							<img alt="" src="./image/soccer/logo/김천.png" width="50px">
			       					</label>
			       					<label for="select_team2_daegu">
			       						<input type="radio" id="select_team2_daegu" name="team2" value="대구">
			       							<img alt="" src="./image/soccer/logo/대구.png" width="50px">
			       					</label>
			       					<label for="select_team2_daejeon">
			       						<input type="radio" id="select_team2_daejeon" name="team2" value="대전">
			       							<img alt="" src="./image/soccer/logo/대전.png" width="50px">
			       					</label>
			       					<label for="select_team2_seoul">
			       						<input type="radio" id="select_team2_seoul" name="team2" value="서울">
			       							<img alt="" src="./image/soccer/logo/서울.png" width="50px">
			       					</label>
			       					<label for="select_team2_suwon">
			       						<input type="radio" id="select_team2_suwon" name="team2" value="수원">
			       							<img alt="" src="./image/soccer/logo/수원.png" width="50px">
			       					</label>
			       					<label for="select_team2_ulsan">
			       						<input type="radio" id="select_team2_ulsan" name="team2" value="울산">
			       							<img alt="" src="./image/soccer/logo/울산.png" width="50px">
			       					</label>
			       					<label for="select_team2_incheon">
			       						<input type="radio" id="select_team2_incheon" name="team2" value="인천">
			       							<img alt="" src="./image/soccer/logo/인천.png" width="50px">
			       					</label>
			       					<label for="select_team2_jeonbuk">
			       						<input type="radio" id="select_team2_jeonbuk" name="team2" value="전북">
			       							<img alt="" src="./image/soccer/logo/전북.png" width="50px">
			       					</label>
			       					<label for="select_team2_jeju">
			       						<input type="radio" id="select_team2_jeju" name="team2" value="제주">
			       							<img alt="" src="./image/soccer/logo/제주.png" width="50px">
			       					</label>
			       					<label for="select_team2_pohang">
			       						<input type="radio" id="select_team2_pohang" name="team2" value="포항">
			       							<img alt="" src="./image/soccer/logo/포항.png" width="50px">
			       					</label>
			       				</div>
		       				</div>
		       			</div>
		        		<div class="traning_date_pop_choose">
		        			<p class="traning_choose_pop_title">경기 날짜 및 시간 선택</p>
		        			<div class="traning_date_pop_flex">
		        			</div>
			       			<div>
								<input type="date" id="game_select_date" name="gameDate" class="traning_calendar_datepicker" value="${dto.gamedate}">
			       			</div>
			       			<div>
								<input type="time" id="game_select_time" name="gameTime" class="traning_calendar_datepicker" value="${dto.gametime}">
			       			</div>
		        		</div>
		       			<div class="traning_map_inner">
		        			<p class="traning_choose_pop_title">경기장소</p>
		        			<div class="traning_map_flex">
			       				<select name="gamePlace" id="gamePlace">
			       					<option value="강릉종합운동장">강릉종합운동장
			       					<option value="춘천송암스포츠타운">춘천송암스포츠타운
			       					<option value="광주축구전용구장">광주축구전용구장
			       					<option value="김천종합운동장">김천종합운동장
			       					<option value="DGB대구은행파크">DGB대구은행파크
			       					<option value="대전월드컵경기장">대전월드컵경기장
			       					<option value="서울월드컵경기장">서울월드컵경기장
			       					<option value="수원종합운동장">수원종합운동장
			       					<option value="울산문수월드컵경기장">울산문수월드컵경기장
			       					<option value="인천축구전용경기장">인천축구전용경기장
			       					<option value="전주월드컵경기장">전주월드컵경기장
			       					<option value="제주월드컵경기장">제주월드컵경기장
			       					<option value="포항스틸야드">포항스틸야드
			       				</select>
		        			</div>
		       			</div>
		       			<div class="training_memo_btn_whole">
		       				<button type="submit" class="training_memo_btn memo_btn_save">수정</button>
		       				<button type="button" class="training_memo_btn memo_btn_cancel" onclick="location.href='soccer_gameinfo'" >취소</button>
		       			</div>
	       			</form>
       			</div>
        	</div>
        </div>
</body>
</html>