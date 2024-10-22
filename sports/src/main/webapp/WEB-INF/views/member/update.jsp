<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<meta charset="UTF-8">
		<script>
			$(document).ready(function(){
				//생년월일 가져와서 선택
				var year = $('#birth').val().substr(0,4);
				var month = $('#birth').val().substr(5,2);
				var day = $('#birth').val().substr(8,2);
				$('#year').val(year).prop("selected",true);
				$('#month').val(month).prop("selected",true);
				$('#day').val(day).prop("selected",true);
				$('#day').click(function(){
					var year=$('#year').val();
					var month=$('#month').val();
					var day=$('#day').val();
					if(month==2){
						if(year%4==0){//29일까지
							for(var i = 1;i <= 31;i++){
								if(i<=29 && $("#day option").length-1 < i){$("#day").append("<option value=\"" + i + "\">" + i + "</option>");}
								else{$("#day option[value=\""+i+"\"]").remove();}
							}
						}else{//28일까지
							for(var i = 1;i <= 31;i++){
								if( i<=28 && $("#day option").length-1 < i){ $("#day").append("<option value=\"" + i + "\">" + i + "</option>");}
								else{$("#day option[value=\""+i+"\"]").remove();}
					}}}
					else if( month==4 || month==6 || month==9 || month==11){//30일까지
						for(var i = 1;i <= 30;i++){
							if ($("#day option").length-1 < i){$("#day").append("<option value=\"" + i + "\">" + i + "</option>");}
							$("#day option[value=\"31\"]").remove();				
						}
					}else{
						for(var i = 1;i <= 31;i++){
							if ($("#day option").length-1 < i){$("#day").append("<option value=\"" + i + "\">" + i + "</option>");}
					}}
				});
				//전화번호 앞자리 선택
				var fir_tel=$('#fir_telvalue').val();
				$('#fir_tel').val(fir_tel).prop("selected",true);
				
				//이메일 가져와서 선택
				var email = $('#email').val().split('@');		
				$('#email_id').val(email[0]);
				$('#mail_select').val(email[1]).prop("selected",true);
				mailSelect();
				//운동 종목 및 팀 가져와서 변환
				var sportname=$('#sportvalue').val();
				var teamname=$('#teamvalue').val();
				if(sportname=='축구'){
					$('#sport1').prop("checked",true);	
				}else{
					$('#sport2').prop("checked",true);		
				}
					updateList(sportname);
					$('#team').val(teamname).prop("selected",true);
		
				//비밀번호 보기 구현
				$('.pw1 i').on('click',function(){
					$('input').toggleClass('active');
					if($('input').hasClass('active')){
						$(this).attr('class',"fa fa-eye fa-lg")
						.prev('input').attr('type',"text");
					}else{
						$(this).attr('class',"fa fa-eye-slash fa-lg")
						.prev('input').attr('type','password');
					}
				});
				// 비밀번호 수정 버튼 클릭 시 모달 창 표시
				$("btn-pwCheck").click(function (){
					$("#PwCheckModal").modal("show");
				});
				$("#PwCheckModal").on("shown.bs.modal", function (){		
					$("#pw").focus();
				});
		
				//// 비밀번호 수정창으로 이동
				$("#pwCheck").click(function(){
					var pw = $("#pw").val();	
					var vpw=/^[a-zA-Z0-9]{6,16}$/;
					
					if(pw==""){
						alertShow('오류','비밀번호를 입력해주세요.');
						$("#PwCheckModal").modal("close")
						return false;
					}
					else if(!vpw.test(pw)){
						alertShow('오류','비밀번호는 영문자+숫자 6~16글자 이내로 작성해야합니다.');
						$("#PwCheckModal").modal("close")
						return false;
					}
					$("#PwUpdateModal").modal("show");
				});
				$("#PwUpdateModal").on("shown.bs.modal", function (){		
					$("#pwcheck").focus();
				});
				///수정한 비밀번호 유효성 검사
				$("#pwupdate").click(function(){
					var id=$('#id').val();
					var pw = $("#pw").val();	
					var pwcheck = $("#pwcheck").val();	
					if(pw == pwcheck){
						$.ajax({
							type: "post",
							url: "pwUpdate",
							async: true,
							data:{"id":id,"pw":pw},
							success:function(data){
								alertShow('변경 완료','비밀번호 변경이 완료되었습니다');
							},
							error:function(){
								alertShow("오류",'비밀번호를 다시 입력해주세요');
							}
						});				
					}else{
						alertShow('오류',"비밀번호가 다릅니다 다시 확인해주세요");
						$("#PwUpdateModal").modal("close")
					}
				});
			});
			//비밀번호 확인 Enter
			function btn_pwcheck(e){
				if(e.key == 'Enter'){
					$('#pwCheck').click();
				}
			}
			//비밀번호 수정 Enter
			function btn_pwupdate(e){
				if(e.key == 'Enter'){
					$('#pwupdate').click();
				}
			}	
			//주소 API CDN 방식 사용
			function execDaumPostcode(){
				new daum.Postcode({
					oncomplete: function(data){
					  	// 팝업을 통한 검색 결과 항목 클릭 시 실행
						var addr = ''; // 주소_결과값이 없을 경우 공백 
						var extraAddr = ''; // 참고항목
		
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R'){ // 도로명 주소를 선택
							addr = data.roadAddress;
						} else{ // 지번 주소를 선택
							addr = data.jibunAddress;
						}
		
						if(data.userSelectedType === 'R'){
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraAddr !== ''){
								extraAddr = ' (' + extraAddr + ')';
							}
						} else{
							document.getElementById("UserAdd1").value = '';
						}
						// 선택된 우편번호와 주소 정보를 input 박스에 넣는다.
						document.getElementById('zipp_code_id').value = data.zonecode;
						document.getElementById("UserAdd1").value = addr;
						document.getElementById("UserAdd1").value += extraAddr;
						document.getElementById("UserAdd2").focus(); // 우편번호 + 주소 입력이 완료되었음으로 상세주소로 포커스 이동
					}
				}).open();
			}
			//이메일 도메인에 값 넣기
			function mailSelect(){
				var domain = $('#mail_select').find('option:selected').val();		
				if(domain == 'emailall'){
					$('#email_domain').val("");
				}
				else{
					$('#email_domain').val(domain);
				}		
			}
			//축구를 고를 떄와 야구를 골랐을 때 Select 내용 바꾸기
			function Activity(name, list){
				this.name = name;
				this.list = list;
			}
			var acts = new Array();
				acts[0] = new Activity('축구', ['강원', '울산', '수원FC', '김천', '서울', '포항', '광주', '제주', '대전', '인천', '전북', '대구']);
				acts[1] = new Activity('야구', ['KIA', '삼성', 'LG', '두산', 'KT', '한화', '롯데', 'SSG', 'NC', '키움']);
			function updateList(str){
			 	var gf = document.updateform;
				var teamLen = gf.team.length;
				var numActs;
				for (var i = 0; i < acts.length; i++){
					if (str == acts[i].name){
						numActs = acts[i].list.length;
						for (var j = 0; j < numActs; j++)
							gf.team.options[j] = new Option(acts[i].list[j], acts[i].list[j]);
						for (var j = numActs; j < teamLen; j++)
							gf.team.options[numActs] = null;
					}
				}
			}
			
			//유효성 체크
			function check(){
				////이름 체크
				var vname=/^[가-힣]{2,5}$/;
				var name=$('#name').val();
				if(name==""){
					alertShow('오류','이름을 입력해주세요.');
					$('#name').focus();
					return false;
				}
				else if(!vname.test(name)){
					alertShow('오류','이름은 한글 2~5글자 이내로 작성해주세요.');
					$('#name').focus();
					return false;
				}	
				//생년월일 체크 후 이어붙이기		
				var year = $("select[id='year'] option:selected").val();
				var month = $("select[id='month'] option:selected").val();
				var day = $("select[id='day'] option:selected").val();
				var birth = year + "-" + month + "-" + day;
				var birth_regexp = /^\d{4}-\d{2}-\d{2}$/;//생년월일 정규식		
				if(birth_regexp.test(birth)){
					$('#birth').val(birth);
				}
				else{
					alertShow('오류','생년월일을 입력해주세요');
					$('#year').focus();
					return false;
				}
				//전화번호 체크 후 이어붙이기
				var fir_tel = $("select[id='fir_tel'] option:selected").val();
				var mid_tel = $('#mid_tel').val();
				var end_tel = $('#end_tel').val();
				var total_tel = fir_tel + "-" + mid_tel + "-" + end_tel;		
				var tel_regexp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;//전화번호 정규식
				if(tel_regexp.test(total_tel)){
					$('#total_tel').val(total_tel);
				}
				else{
					alertShow('오류','전화번호를 다시 입력해주세요');
					$('#mid_tel').focus();
					return false;
				}
				//이메일 이어붙이기
				var email_id = $('#email_id').val();
				var email_domain = $('#email_domain').val();
				var email = email_id + "@" + email_domain;
				var email_regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;//이메일 정규식
				if(email_regexp.test(email)){
					$('#email').val(email);				
				}
				else{
					alertShow('오류','이메일 형식이 맞지 않습니다');
					$('#email_id').focus();
					return false;
				}			
				//주소 체크
				var code = $('#zipp_code').val();
				var cadd1 = $('#UserAdd1').val();
				var cadd2 = $('#UserAdd2').val();
				if(code=="" || cadd1==""){
					alertShow('오류','우편주소를 검색해주세요.');
					return false;
				}
				if(cadd2==""){
					alertShow('오류','상세 주소를 입력해주세요.');
					return false;
				}
				$('#updateform').submit();
			}
		</script>
		<style type="text/css">
			.side_rightbar_whole{
				display: none;
			}
			#body{
				width: 100%;
			}
			.main_section{
				margin: 30px auto 0 auto;
				overflow: auto;
			}
			h1{
				margin: 0 auto 40px auto;
			}
			#footer{
				width: calc(100% - 40px);
			}
			.header_team_logo{
				display: none;
			}
			.updateform{
				width: 100%;
				max-width: 600px;
				margin: 40px auto 50px 29%;
			}
			.info_whole{
				width: 100%;
				max-width: 600px;
				margin: 0 auto;
				font-size: 14px;
				line-height: 20px;
			}
			.info_whole *{
				font-size: 14px;
				line-height: 20px;
			}
			.info_whole div{
				width: 100%;
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-content: center;
			}
			.info_whole div + div{
				margin-top: 10px;
			}
			.info_whole label{
				min-width: 120px;
				width: 120px;
				line-height: 36px;
				margin: 0;
			}
			.info_whole div.adr label{
				line-height: 118px;
			}
			.info_whole input,
			.info_whole select{
				display: block;
				width: calc(100% - 20px);
				max-width: 328px;
				height: 34px;
				border: 1px solid #e8e8e8;
				border-radius: 5px;
				cursor: url('./image/soccer/cursor/text.png'), auto !important;
				padding: 0 10px;
			}
			#id, #pw, #pwcheck{
				max-width: 170px;
				margin: 0 10px 0 0;
			}
			button.btn.btn-pwCheck{
				min-width: 120px;
				width: 120px;
				height: 34px;
				border: 1px solid #006400;
				border-radius: 5px;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
				padding: 0;
				outline: none!important;
				background-color: #00640005;
				box-shadow: none!important;
			}
			button.btn.btn-pwCheck:hover{
				background-color: #00640015;
			}
			.info_whole select{
				padding: 0;
				max-width: 86px;
				text-align: center;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.info_whole select:focus{
				outline: none;
				border-color: #006400;
			}
			.info_whole select#day + p{
				margin-right: 0;
			}
			.info_whole div + div.phone select,
			.info_whole div + div.phone input{
				width: 100%;
				max-width: 88px;
			}
			.info_whole div + div.phone input{
				max-width: 68px;
			}
			.info_whole input#mid_tel,
			.info_whole input#end_tel{
				text-align: center;
				cursor: url('./image/soccer/cursor/text.png'), auto !important;
			}
			.info_whole input[type="text"]:focus,
			.info_whole input[type="password"]:focus{
				border-color: #006400;
			}
			.info_whole input[type="text"]:read-only,
			.info_whole input[type="password"]:read-only{
				background-color: #f9f9f9;
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			.info_whole input[type="text"]:read-only:focus{
				border-color: #e8e8e8;
			}
			.info_whole div p{
				min-width: 16px;
				width: 16px;
				font-size: 14px;
				line-height: 36px;
				margin: 0 10px 0 5px;
			}
			.info_whole div.phone p{
				min-width: 11px;
				width: 11px;
				text-align: center;
				margin: 0 10px;
			}
			.info_whole div div{
				display: block;
				width: 100%;
			}
			.info_whole div div.email_write{
				display: flex;
				width: 100%;
			}
			.info_whole div div.email_write p{
				min-width: 13px;
				width: 13px;
				max-width: 13px;
				text-align: center;
				margin: 0 10px;
			}
			.info_whole div div.email_write select{
				width: 100%;
				max-width: 128px;
			    height: 34px;
			    text-align: center;
			    margin: 0 0 0 10px;
			    border: 1px solid #e8e8e8;
			    border-radius: 5px;
			}
			.info_whole div div.email_write select:focus{
				border-color: #006400;
			}
			.info_whole div.part{
				justify-content: space-between;
			}
			.info_whole div.part div{
				display: flex;
			}
			.info_whole div.part div + div{
				margin: 0 0 0 100px;
				justify-content: end;
			}
			.info_whole div.part div + div label{
				min-width: 60px;
				width: 60px;
				margin-right: 0;
			}
			.info_whole div.part div + div select{
				max-width: 128px;
			}
			.info_whole div div img{
				display: block;
				width: 100%;
				max-width: 190px;
				height: auto;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
				background-size: contain;
			}
			.info_whole div.adr{
				padding: 0;
				margin-bottom: 10px;
			}
			.info_whole div div.adr_inner{
				display: flex;
			}
			.info_whole div div.adr_inner input + input{
				min-width: 82px;
				width: 82px;
				height: 36px;
				margin: 0 0 0 10px;
				border: none;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
				background-color: #4c693f;
			}
			.info_whole div div.adr_inner input + input:hover{
				background-color: #4c693f80;
			}
			.info_whole div.adr input{
				box-shadow: none;
			}
			.info_whole div.adr input#zipp_code_id{
				max-width: 100px;
				text-align: center;
				background-color: #fff
			}
			.info_whole div.adr input[name="user_add1"]{
				margin: 5px 0;
				background-color: #eee;
			}
			.info_whole label + label{
				min-width: auto;
				width: auto;
			}
			.info_whole div input[type="radio"]{
				display: none;
			}
			.info_whole div input[type="radio"] + span{
				width: 80px;
				max-width: 80px;
				height: 34px;
				line-height: 34px;
				text-align: center;
			}
			.info_whole div input[type="radio"] + span:hover{
				background: rgba(0,0,0,0.05);
			}
			.info_whole div input[type="radio"]:checked + span{
				color: #f9f9f9;
				border-color: #556B2F;
				background: #556B2F;
			}
			.info_whole input#voe,
			.info_whole input#rr{
				width: 100%;
				height: 30px;
				line-height: 26px;
				border: none;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.info_whole input#voe::file-selector-button,
			.info_whole input#rr::file-selector-button{
				width: 100px;
				height: 30px;
				line-height: 26px;
				border: 1px solid #e8e8e8;
				border-radius: 5px;
				margin-right: 10px;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			#pw,
			#pwcheck{
				margin: 0 10px 0 10px;
			}
			.info_whole div.img,
			.info_whole div.img div{
				display: flex;
			}
			.info_whole div.img div{
				width: 100%;
				margin-top: 0;
			}
			.info_whole div.img div + div label{
				min-width: 80px;
				width: 80px;
			}
			.big_img_whole{
				position: fixed;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				z-index: 4;
				display: none;
			}
			.big_img_bg{
				position: absolute;
				width: 100vw;
				height: 100vh;
				top: 0;
				left: 0;
				background: rgba(0,0,0,0.5);
			}
			.big_img_box{
				position: absolute;
				width: auto;
				height: auto;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			.big_img_box img{
				display: block;
				width: auto;
				max-width: calc(100vw - 100px);
				height: auto;
				max-height: calc(100vh - 100px);
				margin: 0 0 0 auto;
				background-size: contain;
			}
			img.hide_img{
				position: absolute;
				display: flex;
				min-width: 36px;
				width: 36px;
				height: auto;
				top: 0;
				right: -80px;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
				background-size: contain;
			}
			.info_whole div.btn_flex{
				margin: 60px auto;
				padding: 0;
				justify-content: center;
			}
			.btn_flex input[type="button"]{
				display: block;
				width: 100%;
				max-width: 150px;
				height: 38px;
				font-size: 14px;
				line-height: 20px;
				font-weight: 400;
				color: #333;
				border: 1px solid transparent;
				background-color: transparent;
				border-radius: 5px;
				outline: none;
				padding: 0;
			}
			.btn_flex input[type="button"] + input[type="button"]{
				margin-left: 20px;
			}
			.btn_flex input[type="button"].prev{/*이전으로*/
				border: 1px solid #4c693f;
				background-color: white;
				color: #4c693f;
			}
			.btn_flex input[type="button"].appro{/*수정*/
				color: #f9f9f9;
				background-color: #4c693f;
			}
			.btn_flex input[type="button"]:hover{
				color: #f9f9f9;
				background-color: #4c693f80;
			}
			.modal-header{
				display: flex;
				justify-content: space-between;
			}
			.modal-header:before,
			.modal-header:after,
			.modal-footer:before,
			.modal-footer:after{
				content: inherit;
			}
			.modal-header .close{
				display: block;
				min-width: 30px;
				width: 30px;
				height: 24px;
				margin: 0;
				opacity: 1;
			}
			.modal-header .close span{
				display: block;
				width: 100%;
				height: auto;
				font-size: 40px;
				color: #777;
				background-size: contain;
			}
			.modal-header .close span:hover{
				color: #333;
			}
			.modal-title{
				font-size: 16px;
				line-height: 24px;
			}
			.modal-body .pw1{
				display: flex;
				flex-wrap: nowrap;
			}
			.modal-body .pw p{
				font-size: 15px;
				line-height: 22px;
				font-weight: 500;
			}
			.modal-body .pw1 input#pw,
			.modal-body .pw1 input#pwcheck{
				display: flex;
				align-items: center;
				width: 100%;
				max-width: none;
				height: 34px;
				margin: 8px auto 0 auto;
				padding: 0 10px;
				border: 1px solid #e8e8e8;
				border-radius: 5px;
			}
			.modal-body .pw1 input#pw:focus,
			.modal-body .pw1 input#pwcheck:focus{
				border-color: darkgreen;
				box-shadow: 0 0 20px rgba(0,100,0,0.15);
			}
			.modal-body .pw1 i{
				margin: auto auto auto 10px;
				color: darkgreen;
			}
			.modal-footer{
				display: flex;
				justify-content: center;
			}
			.modal-footer button{
				width: 80px;
				outline: none;
			}
			.modal-footer button.btn-secondary{
				color: #006400;
				border-color: #006400;
				background-color: transparent;
			}
			.modal-footer button.btn-secondary:hover{
				color: #0c400c;
				border-color: #0c400c;
				background-color: #00640010;
			}
			.modal-footer button.btn-primary{
				color: #f9f9f9;
				background-color: #006400;
			}
			.modal-footer button.btn-primary:hover{
				background-color: #0c400c;
			}
		</style>
	</head>
	<body>
		<h1>'${my.name}'님의 정보 수정</h1>
		<form action="memberUpdate" method="post" id="updateform" class="updateform" name="updateform" enctype="multipart/form-data">
			<div class="info_whole">
				<input type="hidden" name="part" id="part" value="${my.part}">
				<input type="hidden" name="refvoe" id="refvoe" value="${my.voe}">
				<input type="hidden" name="refrr" id="refrr" value="${my.rr}">
				<input type="hidden" name="sportvalue" id="sportvalue" value="${my.sport}">
				<input type="hidden" name="teamvalue" id="teamvalue" value="${my.team}">
				<div class="id">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" value="${my.id}" readonly>
				</div>
				<div>
					<label for="pwchange">비밀번호</label>
					<button type="button" id="pwchange" class="btn btn-pwCheck" data-toggle="modal" data-target="#PwCheckModal">비밀번호 수정</button>
				</div>
				<div class="name">
					<label for="name">이름</label>
					<input type="text" name="name" id="name" value="${my.name}">
				</div>
				<div>
					<label for="year">생년월일</label>
					<input type="hidden" id="birth" name="birth" value="${my.birth}">
					<select name="year" id="year">
						<option value="">--</option>
						<c:forEach var="i" begin="1920" end="2024">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<p>년</p>
					<select name="month" id="month">
						<option value="">--</option>
						<c:forEach var="i" begin="1" end="12">
							<c:choose>
								<c:when test="${i lt 10}">
									<option value="0${i}">0${i}</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<p>월</p>
					<select name="day" id="day">
						<option value="">--</option>
						<c:forEach var="i" begin="1" end="31">
							<c:choose>
								<c:when test="${i lt 10}">
									<option value="0${i}">0${i}</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<p>일</p>
				</div>
				<div class="phone">
					<label for="fir_tel">전화번호</label>
					<input type="hidden" name="fir_telvalue" id="fir_telvalue" value="${my.tel.substring(0,3)}">
					<select id="fir_tel">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<p>-</p>
					<input type="text" maxlength="4" id="mid_tel" size="5" value="${my.tel.substring(4,8)}">
					<p>-</p>
					<input type="text" maxlength="4" id="end_tel" size="5" value="${my.tel.substring(9,13)}">
					<input type="hidden" id="total_tel" name="tel" value="">
				</div>
				<div class="col-sm-10 adr">
					<label for="zipp_btn" class="form-label">주소</label>
					<div>
						<div class="adr_inner">
							<c:choose>
								<c:when test="${my.zzip_code.length() <= 4}">
									<input type="text" class="form-control mb-2" id="zipp_code_id" name="zipp_code" maxlength="10" placeholder="우편번호" readonly value="0${my.zzip_code}">
								</c:when>
								<c:otherwise>
							 	   <input type="text" class="form-control mb-2" id="zipp_code_id" name="zipp_code" maxlength="10" placeholder="우편번호" readonly value="${my.zzip_code}">
								</c:otherwise>
							</c:choose>
							<input type="button" id="zipp_btn" class="btn btn-primary" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						<input type="text" class="form-control mb-2" name="user_add1" id="UserAdd1" maxlength="40" placeholder="기본 주소를 입력하세요" required readonly value="${my.user_add1}">
						<input type="text" class="form-control" name="user_add2" id="UserAdd2" maxlength="40" placeholder="상세 주소를 입력하세요" value="${my.user_add2}">
					</div>
				</div>
				<div>
					<label for="email_id">이메일</label>
					<div class="email_write">
						<input type="text" id="email_id" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" />
						<p>@</p>
						<input type="text" id="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"/> 
						<select class="select" id="mail_select" title="이메일 도메인 주소 선택" onchange="mailSelect()">
							<option value="emailall" selected>-선택-</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select>
					</div>
					<input type="hidden" id="email" name="email" value="${my.email}">
				</div>
				<div class="part">
					<div>
						<label><c:if test="${my.part=='일반'}">선호 </c:if>종목</label>
						<label>
							<input type="radio" name="sport" id="sport1" onclick="updateList(this.value)" checked value="축구" hidden>
							<span>축구</span>
						</label>
						<label>
							<input type="radio" name="sport" id="sport2" onclick="updateList(this.value)" value="야구" hidden>
							<span>야구</span>
						</label>
					</div>
					<div>
						<c:if test="${my.part == '일반'}">
							<label>선호 팀</label>
						</c:if>
						<c:if test="${my.part == '감독'}">
							<label>관리 팀</label>
						</c:if>
						<select name="team" id="team">
							<option value="강원">강원</option>
							<option value="울산">울산</option>
							<option value="수원FC">수원FC</option>
							<option value="김천">김천</option>
							<option value="서울">서울</option>
							<option value="포항">포항</option>
							<option value="광주">광주</option>
							<option value="제주">제주</option>
							<option value="대전">대전</option>
							<option value="인천">인천</option>
							<option value="전북">전북</option>
							<option value="대구">대구</option>
						</select>	
					</div>
				</div>
				<c:if test="${my.part == '감독'}">
					<div>
						<label>재직 증명서</label>
						<img src="./image/member/super/${my.voe}" width="100px" height="70px">
						<input type="file" name="voe" id="voe">
					</div>
					<div>
						<label>등본</label>			
						<img src="./image/member/super/${my.rr}" width="100px" height="70px">
						<input type="file" name="rr" id="rr">
					</div>
				</c:if>
				<div class="btn_flex">
					<input type="button" class="prev" value="취소" onclick="location.href='mypage?id=${my.id}'">
					<input type="button" class="appro" value="수정 완료" onclick="check()">
				</div>
			</div>
		</form>
		<!-- 모달창: 비밀번호 확인 -->
		<div class="modal fade" id="PwCheckModal" tabindex="-1" role="dialog" aria-labelledby="PwCheckModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="PwCheckModalLabel">비밀번호 확인</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="pw">
							<p>새로운 비밀번호를 입력해주세요.</p>
							<div class="pw1">
								<input type="password" name="pw" id="pw" onkeydown="btn_pwcheck(event)">
								<i class="fa fa-eye-slash fa-lg"></i>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="pwCheck">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달창: 비밀번호 확인 -->
		<div>
			<input type="hidden" class="btn btn-PwUpdate" data-toggle="modal" data-target="#PwUpdateModal">
			<div class="modal fade" id="PwUpdateModal" tabindex="-1" role="dialog" aria-labelledby="PwUpdateModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="PwUpdateModalLabel">비밀번호 수정</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="pw">
								<p>다시 한 번 비밀번호를 입력해주세요.</p>
								<div class="pw1">
									<input type="password" name="pwcheck" id="pwcheck" onkeydown="btn_pwupdate(event)">
									<i class="fa fa-eye-slash fa-lg"></i>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="pwupdate">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>