<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<style type="text/css">
	.header_logo_inner.scroll_inn{
		display: none;
	}
	.main_section{
		margin-top: 20px;
	}
	h1{
		margin-top: 0px;	
	}
	.mainFrame{
		width: 500px;
		margin: 0 auto;
		text-align: center;
	}
	.mainFrame div{
		margin: 15px auto;
		height: 35px;
	}
	.mainFrame label{
		width: 80px;
		text-align: left;
		margin-right: 10px;
	}
	.mainFrame select{
		width: calc(80% - 22px);
		height: 40px;
		border: 1px solid #eee;
		padding: 0 10px; 
		border-radius: 5px;
		outline: none;
	}
	.mainFrame input{
		width: 75%;
		border: none;
		padding: 0 10px; 
		border-radius: 5px;
	}
	.mainFrame .title{
		display: flex;
	}
	.mainFrame .title input{
		padding: 0 20px;
		width: 70%;
	}
	#value:focus,
	.mainFrame select:focus,
	.mainFrame input:focus{
		border-color: #0c400c;
	}
	#value{
		border:none;
		width: 95%;
	    height: 280px;
		border-radius: 5px;
	    padding: 10px 10px 0 10px;	
	}
	.mainFrame input[type="button"]{
		width: 25%;
	    height: 50px;
	    border-radius: 10px;
	    background-color: #fff;
	    border-color: #0c400c;
	    color: #0c400c;
	}
	.mainFrame input[type="button"]:hover{
	    background-color: #0c400c20;
	}
	.mainFrame div.value,
	.mainFrame div.button{
		height: auto;
	}
	.mainFrame div.value label{
		text-align: center;
	}
	.mainFrame .value #textlen{
	    width: 36px;
	    text-align: end;
	    border: none;
	    padding: 0;
	    background-color: transparent;
	}
	.mainFrame .value p{
		display:block;
	    text-align: right;
	}
	.mainFrame hr{
		margin: 0;
	}
	.mainFrame .check{
	    align-items: center;
	    display: flex;
	    padding-left: 4px;
	}
	.mainFrame .checking{
		width: 60px;
	    border: none;
	    align-items: center;
	    display: flex;
	    border-radius: 5px;
	}
    #check+span{
		margin: 0 10px;
    	width: 20px;
    	height: 20px;
    	display:block; 
        background-repeat: no-repeat;
        background-image: url('./image/member/logo/keyoff.png'); /*off 이미지*/
        background-size: contain;
    }
    #check:checked+span{
        background-repeat: no-repeat; /* 반복 방지 */
        background-image: url('./image/member/logo/keyon.png'); /*on 이미지*/
        background-size: contain;
    }
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			var part= `${dto.part}`;
			$('#part').val(part).prop("selected",true);
			
			var check = `${dto.checking}`;
			(check == 'y') ? $('#check').prop('checked',true) : $('#check').prop('checked',false);
			textlength();
			<!-- 모달창 자바스크립트: 내 정보 수정 -->
			// 클릭 시 모달 창 표시
			function pwCheck(a){
				$("#pw").val("");
				$("#way").val(a);
				$("#pwCheckModal").modal("show");
			};
			///비밀번호 확인 Enter
			function btn_pwcheck(e){
				if(e.key == 'Enter'){
					$('#board').click();
				}
			};
			//비밀번호 확인(유효성 검사,AJAX) 후 창으로 이동	
			$("#pwCheckModal").on("shown.bs.modal", function (){		
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
			$("#board").click(function(){
				var num=`${li.num}`;
				var pw=$('#pw').val();			
				var way=$('#way').val();			
				if(pw == ""){
					alertShow('오류','비밀번호를 입력해주세요.');
					pw.focus();
					return false;
				}
				$.ajax({
					type:"post",
					url:"boardPwCheck",
					async:true,
					data:{"num":num, "pw":pw},
					success:function(data){
						if(data == 1){
							location.href="boardSelect?num="+num+"&way="+way;
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
		function textlength() {
			var len = $('#value').val().length;
			$('#textlen').text(len);
		}
	</script>
</head>
	<body>
		<h1>문 의 하 기</h1>
		<div class="mainFrame">
			<div>
				<label for ="part">분 류	</label>
				<select name="part" id="part" disabled>
					<option value="login">로그인 관련 문의</option>
					<option value="player">선수 정보 문의</option>
					<option value="content">내용 추가/오류 수정/삭제 문의</option>
					<option value="member">댓글 비방/모욕 신고</option>
					<option value="error">오류 신고</option>
					<option value="etc">기타 문의</option>
				</select>
			</div>
			<div class ="title">
				<label for ="title"> 제 목 </label>
				<input type="hidden" id="pw" name="pw" value="${dto.pw}" readonly>
				<input type="text" id="title" name="title" value="${dto.title}" readonly>
				 <div class="checking">
					<input type="checkbox" id="check" name="check" value="y" hidden="hidden" onclick="lockcheck()" disabled><span></span>
				 </div>
			</div>
			<div>
				<label for ="writer"> 작 성 자 </label>
				<input type="text" id="writer" name="writer" value="${dto.writer}" readonly>
			</div>
			<div class="check">
				<label for ="check">
					 잠 금 여 부
				</label>
			</div>
			<hr>
			<div class="value">
				<label for ="value"> 내 용 </label>
				<textarea id="value" name="value" placeholder="내용을 500자 이내로 입력해주세요" onkeyup="textlength()" maxlength="500" readonly>${dto.content}</textarea>
				<p>
					<span id="textlen">0</span>/500
				</p>
			</div>
			<div class="button">
				<input type="button" value="확인" onclick="location.href='boardMain'">
				<input type="button" value="수정" onclick="pwCheck(1)">
				<input type="button" value="삭제" onclick="pwCheck(2)">
			</div>
		</div>
		<!-- 모달창: 비밀번호 확인 (게시판 이동) -->
		<div>
			<div class="modal fade" id="pwCheckModal" tabindex="-1" role="dialog" aria-labelledby="pwCheckModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="pwCheckModalLabel">비밀번호 확인</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						 <div class="modal-body">
							<div class="pw">
								<p>비밀번호를 입력해주세요.</p>
								<div class="pw1">
									<input type="password" name="pw" id="pw" onkeydown="btn_pwcheck(event)" placeholder="비밀번호를 입력">
									<input type="hidden" name="way" id="way"/>
									<i class="fa fa-eye-slash fa-lg"></i>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="board">확인</button>
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