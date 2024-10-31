<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p.traning_pop_subtext {
		font-size: 25px;
		line-height: 24px;
		font-weight: 400;
		color: #999;
		text-align: center;
		margin: 10px auto 0 auto;
		margin-top: 25px;
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
	}
	
	p.traning_choose_pop_title {
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
			.traning_people_choose p{
				margin: 0 20px;
			}
			.traning_people_choose label {
				display: block;
				width: calc(20% - 10px);
				max-width: 100%;
				margin: 0;
			}
			
			.traning_people_choose label + label {
				margin-left: 10px;
			}
			
			.traning_people_choose label:nth-child(5n + 1) {
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
			    margin: 0 auto;
   				display: block;
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
			
			
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var team1 = $('#gt1').val();
		var team2 = $('#gt2').val();
		var place = $('#place').val();
		var season = $('#season').val();
		$('input[name="team1"]:input[value="'+team1+'"]').prop("checked",true);
		$('input[name="team2"]:input[value="'+team2+'"]').prop("checked",true);
	    $("#gamePlace").val(place).prop("selected", true);
	    $("#gameSeason").val(season).prop("selected", true);
		
	});
</script>
</head>
<body>
<input type="hidden" name="gt1" id="gt1" value="${dto.team1}">
<input type="hidden" name="gt2" id="gt2" value="${dto.team2}">
<input type="hidden" name="place" id="place" value="${dto.gameplace}">
<input type="hidden" name="season" id="season" value="${dto.season}">
<p class="traning_pop_subtext">경기를 삭제하시겠습니까?</p>
        		<div class="traning_pop_inner">
	        		<form action="baseballgamedelete" method="post">
	        		<input type="hidden" name="gamenum" value="${dto.gamenum}">
		       			<div class="traning_people_inner" >
		       				<p class="traning_choose_pop_title">시즌</p>
							<div class="traning_map_flex">
								<select name="gameSeason" id="gameSeason" disabled>
									<option value="정규">정규
									<option value="포스트">포스트
									<option value="취소">취소
								</select>
							</div>
		        			<p class="traning_choose_pop_title">팀 선택</p>
		       				<div class="traning_people_choose">
			       				<div>
			       					<label for="select_team1_kia">
			       						<input type="radio" id="select_team1_kia" name="team1" value="KIA" disabled>
			       							<img alt="" src="./image/baseball/logo/KIA.png" width="50px">
			       					</label>
			       					<label for="select_team1_kt">
			       						<input type="radio" id="select_team1_kt" name="team1" value="KT" disabled>
			       							<img alt="" src="./image/baseball/logo/KT.png" width="50px">
			       					</label>
			       					<label for="select_team1_lg">
			       						<input type="radio" id="select_team1_lg" name="team1" value="LG" disabled>
			       							<img alt="" src="./image/baseball/logo/LG.png" width="50px">
			       					</label>
			       					<label for="select_team1_nc">
			       						<input type="radio" id="select_team1_nc" name="team1" value="NC" disabled>
			       							<img alt="" src="./image/baseball/logo/NC.png" width="50px">
			       					</label>
			       					<label for="select_team1_ssg">
			       						<input type="radio" id="select_team1_ssg" name="team1" value="SSG" disabled>
			       							<img alt="" src="./image/baseball/logo/SSG.png" width="50px">
			       					</label>
			       					<label for="select_team1_doosan">
			       						<input type="radio" id="select_team1_doosan" name="team1" value="두산" disabled>
			       							<img alt="" src="./image/baseball/logo/두산.png" width="50px">
			       					</label>
			       					<label for="select_team1_lotte">
			       						<input type="radio" id="select_team1_lotte" name="team1" value="롯데" disabled>
			       							<img alt="" src="./image/baseball/logo/롯데.png" width="50px">
			       					</label>
			       					<label for="select_team1_samsung">
			       						<input type="radio" id="select_team1_samsung" name="team1" value="삼성" disabled>
			       							<img alt="" src="./image/baseball/logo/삼성.png" width="50px">
			       					</label>
			       					<label for="select_team1_kiwoom">
			       						<input type="radio" id="select_team1_kiwoom" name="team1" value="키움" disabled>
			       							<img alt="" src="./image/baseball/logo/키움.png" width="50px">
			       					</label>
			       					<label for="select_team1_hanhwa">
			       						<input type="radio" id="select_team1_hanhwa" name="team1" value="한화" disabled>
			       							<img alt="" src="./image/baseball/logo/한화.png" width="50px">
			       					</label>
			       				</div>
		       					<p>  vs  </p>
		       					<div class="select_team2">
			       					<label for="select_team2_kia">
			       						<input type="radio" id="select_team2_kia" name="team2" value="KIA" disabled>
			       							<img alt="" src="./image/baseball/logo/KIA.png" width="50px">
			       					</label>
			       					<label for="select_team2_kt">
			       						<input type="radio" id="select_team2_kt" name="team2" value="KT" disabled>
			       							<img alt="" src="./image/baseball/logo/KT.png" width="50px">
			       					</label>
			       					<label for="select_team2_lg">
			       						<input type="radio" id="select_team2_lg" name="team2" value="LG" disabled>
			       							<img alt="" src="./image/baseball/logo/LG.png" width="50px">
			       					</label>
			       					<label for="select_team2_nc">
			       						<input type="radio" id="select_team2_nc" name="team2" value="NC" disabled>
			       							<img alt="" src="./image/baseball/logo/NC.png" width="50px">
			       					</label>
			       					<label for="select_team2_ssg">
			       						<input type="radio" id="select_team2_ssg" name="team2" value="SSG" disabled>
			       							<img alt="" src="./image/baseball/logo/SSG.png" width="50px">
			       					</label>
			       					<label for="select_team2_doosan">
			       						<input type="radio" id="select_team2_doosan" name="team2" value="두산" disabled>
			       							<img alt="" src="./image/baseball/logo/두산.png" width="50px">
			       					</label>
			       					<label for="select_team2_lotte">
			       						<input type="radio" id="select_team2_lotte" name="team2" value="롯데" disabled>
			       							<img alt="" src="./image/baseball/logo/롯데.png" width="50px">
			       					</label>
			       					<label for="select_team2_samsung">
			       						<input type="radio" id="select_team2_samsung" name="team2" value="삼성" disabled>
			       							<img alt="" src="./image/baseball/logo/삼성.png" width="50px">
			       					</label>
			       					<label for="select_team2_kiwoom">
			       						<input type="radio" id="select_team2_kiwoom" name="team2" value="키움" disabled>
			       							<img alt="" src="./image/baseball/logo/키움.png" width="50px">
			       					</label>
			       					<label for="select_team2_hanhwa">
			       						<input type="radio" id="select_team2_hanhwa" name="team2" value="한화" disabled>
			       							<img alt="" src="./image/baseball/logo/한화.png" width="50px">
			       					</label>
			       				</div>
		       				</div>
		       			</div>
		        		<div class="traning_date_pop_choose">
		        			<p class="traning_choose_pop_title">경기 날짜 및 시간 선택</p>
		        			<div class="traning_date_pop_flex">
		        			</div>
			       			<div>
								<input type="date" id="game_select_date" name="gameDate" class="traning_calendar_datepicker" value="${dto.gamedate}" disabled>
			       			</div>
			       			<div>
								<input type="time" id="game_select_time" name="gameTime" class="traning_calendar_datepicker" value="${dto.gametime}" disabled>
			       			</div>
		        		</div>
		       			<div class="traning_map_inner">
		        			<p class="traning_choose_pop_title">경기장소</p>
		        			<div class="traning_map_flex">
			       				<select name="gamePlace" disabled>
			       					<option value="기아챔피언스필드">기아챔피언스필드
			       					<option value="월명야구장">월명야구장
			       					<option value="수원KT위즈파크">수원KT위즈파크
			       					<option value="잠실야구장">잠실야구장
			       					<option value="창원NC파크">창원NC파크
			       					<option value="인천SSG랜더스필드">인천SSG랜더스필드
			       					<option value="사직야구장">사직야구장
			       					<option value="울산문수야구장">울산문수야구장
			       					<option value="대구삼성라이온즈파크">대구삼성라이온즈파크
			       					<option value="포항야구장">포항야구장
			       					<option value="고척스카이돔">고척스카이돔
			       					<option value="한화생명이글스파크">한화생명이글스파크
			       					<option value="청주종합경기장야구장">청주종합운동장야구장
			       				</select>
		        			</div>
		       			</div>
		       			<div class="training_memo_btn_whole">
		       				<button type="submit" class="training_memo_btn memo_btn_save">삭제</button>
		       				<button type="button" class="training_memo_btn memo_btn_cancel" onclick="location.href='baseball_gameinfo'" >취소</button>
		       			</div>
	       			</form>
       			</div>
        	</div>
        </div>
</body>
</html>