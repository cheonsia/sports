<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<style type="text/css">
			.side_rightbar_whole{
				display: none;
			}
			#body{
				width: 100%;
			}
			.main_section{
				margin: -20px auto 0 auto;
				overflow: auto;
			}
			#footer{
				width: calc(100% - 40px);
			}
			.header_team_logo{
				display: none;
			}
			.info_whole{
				width: 100%;
				max-width: 600px;
				margin: 0 auto;
			}
			.info_whole div{
				display: flex;
				flex-wrap: nowrap;
				justify-content: start;
				align-content: center;
			}
			.info_whole div + div{
				margin-top: 20px;
			}
			.info_whole label{
				min-width: 100px;
				width: 100px;
				line-height: 36px;
				text-align: end;
				margin: 0 20px 0 0;
			}
			.info_whole div.adr label{
				line-height: 118px;
			}
			.info_whole input{
				display: block;
				width: calc(100% - 20px);
				height: 34px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			.info_whole input#year,
			.info_whole input#month,
			.info_whole input#day{
				max-width: 78px;
			}
			.info_whole input:read-only{
				background-color: #f9f9f9;
			}
			.info_whole div p{
				font-size: 14px;
				line-height: 36px;
				margin: 0 10px 0 5px;
			}
			.info_whole div div{
				display: block;
				width: 100%;
			}
			.info_whole div div input + input{
				margin-top: 5px;
			}
			.info_whole div div img{
				display: block;
				width: 100%;
				max-width: 190px;
				height: auto;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
				background-size: contain;
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
				margin: 20px auto 40px auto;
				padding: 0;
				justify-content: center;
			}
			.btn_flex button{
				display: block;
				width: 100%;
				max-width: 120px;
				height: 36px;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #333;
				border: 1px solid transparent;
				background-color: transparent;
				border-radius: 5px;
				outline: none;
			}
			.btn_flex button + button{
				margin-left: 10px;
			}
			.btn_flex button.prev{/*이전으로*/
				color: #006400;
				border-color: #006400;
			}
			.btn_flex button.prev:hover{
				background-color: #00640010;
			}
			.btn_flex button.reject{/*거부/차단*/
				color: #bb0000;
				border-color: #bb0000;
			}
			.btn_flex button.reject:hover{
				background-color: #bb000010;
			}
			.btn_flex button.appro{/*승인*/
				color: #f9f9f9;
				background-color: #537fad;
			}
			.btn_flex button.appro:hover{
				background-color: #2a5077;
			}
			.btn_flex button.btn_updateModal{/*수정*/
				color: #f9f9f9;
				background-color: #006400;
			}
			.btn_flex button.btn_updateModal:hover{
				background-color: #0c400c;
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
			.modal-body .pw1 input#pw{
				display: flex;
				align-items: center;
				width: 100%;
				height: 34px;
				margin: 8px auto 0 auto;
				padding: 0 10px;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
			}
			.modal-body .pw1 input#pw:focus{
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
		<script type="text/javascript">
			$(document).ready(function(){
				var year = $('#birth').val().substr(0,4);
				var month = $('#birth').val().substr(5,2);
				var day = $('#birth').val().substr(8,2);
				$('#year').val(year);
				$('#month').val(month);
				$('#day').val(day);
				<!-- 모달창 자바스크립트: 내 정보 수정 -->
				// 내 정보 수정 버튼 클릭 시 모달 창 표시
				$("btn_updateModal").click(function (){
					$("#updateModal").modal("show");
					$("#pw").focus();
				});
				$("#updateModal").on("shown.bs.modal", function (){		
					$("#pw").focus();
				});
				//비밀번호 보기 구현
				$('.pw i').on('click',function(){
					$('input').toggleClass('active');
					if($('input').hasClass('active')){
						$(this).attr('class',"fa fa-eye fa-lg")
						.prev('input').attr('type',"text");
					}else{
						$(this).attr('class',"fa fa-eye-slash fa-lg")
						.prev('input').attr('type','password');
					}
				});
				//비밀번호 확인(유효성 검사,AJAX) 후 마이페이지 수정창으로 이동
				$("#mypageupdate").click(function(){
					var vpw=/^[a-zA-Z0-9]{6,16}$/;
					var id=$('#id').val();
					var pw=$('#pw').val();
					
					if(pw==""){
						alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
						return false;
					}
					else if(!vpw.test(pw)){
						alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
						return false;
					}			
					$.ajax({
						type:"post",
						url:"pwCheck",
						async:true,
						data:{"id":id, "pw":pw},
						success:function(data){
							if(data==1){
								////마이페이지 수정창 이동하기
								location.href="memberupdate?id="+id;	
							}
							else{
								alertShow('비밀번호 확인',"비밀번호가 다릅니다 다시 입력해주세요.");
							}
						},
						error:function(){
							alertShow('에러','비밀번호를 다시 입력해주세요');
						}
					});
				});
			});
			////비밀번호 확인 Enter
			function btn_pwcheck(e){
				if(e.key == 'Enter'){
					$('#mypageupdate').click();
				}
			}
			function imgShow(){
				$('body').css('overflow', 'hidden');
				$('.big_img_whole').show();
			}
			function imgHide(){
				$('body').css('overflow', 'auto');
				$('.big_img_whole').hide();
			}
			function imgBig(ths){
				imgShow();
				var imgSrc = ths.dataset.src;
				$('#big_img').attr('src', imgSrc);
			}
		</script>
	</head>
	<body>
		<h1>'${my.name}'님의 정보</h1>
		<input type="hidden" id="birth" name="birth" value="${my.birth}">
		<div class="info_whole">
			<div>
				<label>아이디</label>
				<input type="text" name="id" id="id" value="${my.id}" readonly>
			</div>
			<div>
				<label>이름</label>
				<input type="text" name="name" id="name" value="${my.name}" readonly>
			</div>
			<div>
				<label>생년월일</label>
				<input type="text" id="year" name="year" value="" readonly>
				<p>년</p>
				<input type="text" id="month" name="month" value="" readonly>
				<p>월</p>
				<input type="text" id="day" name="day" value="" readonly>
				<p>일</p>
			</div>
			<div>
				<label>전화번호</label>
				<input type="text" id="tel" name="tel" value="${my.tel}" readonly>
			</div>
			<div>
				<label>이메일</label>
				<input type="text" id="email" name="email" value="${my.email}" readonly>
			</div>
			<div class="adr">
				<label>주소</label>
				<div>
					<input type="text" name="zzip_code" id="zzip_code" value="${my.zzip_code}" readonly>
					<input type="text" name="user_add1" id="user_add1" value="${my.user_add1}" readonly>
					<input type="text" name="user_add2" id="user_add2" value="${my.user_add2}" readonly>
				</div>
			</div>
			<div>
				<!-- 일반회원일 때 -->
				<c:if test="${my.part == '일반'}">
					<label>관심 종목</label>
				</c:if>
				<!-- 감독일 때 -->
				<c:if test="${my.part == '감독'}">
					<label>관리 종목</label>
				</c:if>
				<input type="text" id="sport" name="sport" value="${my.sport}" readonly>
			</div>
			<div>
				<!-- 일반 회원 -->
				<c:if test="${my.part == '일반'}">
					<label>관심 팀</label>
				</c:if>
				<!-- 감독일 때 -->
				<c:if test="${my.part == '감독'}">
					<label>관리 팀</label>
				</c:if>
				<input type="text" id="team" name="team" value="${my.team}" readonly>
			</div>
			<div>
				<label>구분</label>
				<input type="text" name="part" id="part" value="${my.part}" readonly>
			</div>
			<div class="img">
				<c:if test="${my.part == '감독'}">
					<div>
						<label>재직 증명서</label>
						<img src="./image/member/super/${my.voe}" onclick="imgBig(this)" data-src="./image/member/super/${my.voe}">
					</div>
					<div>
						<label>등본</label>
						<img src="./image/member/super/${my.rr}" onclick="imgBig(this)" data-src="./image/member/super/${my.rr}">
					</div>
				</c:if>
			</div>
			<div class="btn_flex">
				<button type="button" class="prev" onclick="javascript:history.go(-1)">이전으로</button>
				<c:choose>
					<c:when test="${adminlogin}">
					 	<c:if test="${my.inputaccess == 'no'}">
							<button type="button" class="appro" onclick="location.href='memberAccess?id=${my.id}'">승인</button>
							<button type="button" class="reject" onclick="location.href='deleteMember?id=${my.id}'">거부(삭제)</button>
					 	</c:if>
						<c:if test="${my.inputaccess == 'ok'}">
							<button type="button" class="reject" onclick="location.href='memberAccess?id=${my.id}'">차단(보류)</button>
						</c:if>
					</c:when>
					<c:when test="${!adminlogin}">
						<button type="button" class="btn_updateModal" data-toggle="modal" data-target="#updateModal">내 정보 수정</button>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!-- 모달창: 비밀번호 확인 (마이페이지 이동) -->
		<div>
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="Mypage_Update_pwCheckModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="Mypage_Update_pwCheckModalLabel">비밀번호 확인</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						 <div class="modal-body">
							<div class="pw">
								<p>비밀번호를 입력해주세요.</p>
								<div class="pw1">
									<input type="password" name="pw" id="pw" onkeydown="btn_pwcheck(event)" placeholder="비밀번호를 입력">
									<i class="fa fa-eye-slash fa-lg"></i>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="mypageupdate">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="big_img_whole">
			<div class="big_img_bg"></div>
			<div class="big_img_box">
				<img alt="닫기 아이콘" src="./image/member/delete_wh.png" class="hide_img" onclick="imgHide()">
				<img alt="" src="" id="big_img">
			</div>
		</div>
	</body>
</html>