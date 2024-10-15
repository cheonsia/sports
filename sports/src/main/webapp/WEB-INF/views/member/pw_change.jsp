<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script type="text/javascript">
$(document).ready(function() {
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
	$('#check').click(function() {
		//비밀번호 체크
		var vpw = /^[a-zA-Z0-9]{6,16}$/;
		var pw = $('#pw').val();
		var pwcheck = $('#pwcheck').val();
		if(pw=="") {
			alertShow('오류','비밀번호를 입력해주세요.');
			$('#pw').focus();
			return false;
		}
		else if(pwcheck=="") {
			alertShow('오류','비밀번호 확인을 해주세요.');
			$('#pwcheck').focus();
			return false;
		}
		else if(!vpw.test(pw)) {
			alertShow('오류','비밀번호는 영문자+숫자 6~16글자 이내로 작성해야합니다.');
			$('#pw').focus();			
			return false;
		}
		else if(pw != pwcheck) {
			alertShow('오류','입력한 비밀번호가 일치하지 않습니다.다시 입력해주세요');
			$('#pwcheck').focus();
			return false;
		}
		$('#pwchange_form').submit();
	});
});

//비밀번호 일치 유무
function passwordCheck() {
	var pw = $("#pw").val();	
	var pwcheck = $("#pwcheck").val();	
	var pw_message = document.getElementById("pw_message");	//확인 메세지
	var correctColor = "#416b41";	//맞았을 때 출력되는 색깔.
	var wrongColor = "#ff0000";		//틀렸을 때 출력되는 색깔
	if(pw == pwcheck){ //password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
		if(pw.length<6 ||pw.length>16){
			pw_message.style.color = wrongColor;
			pw_message.innerHTML = "비밀번호는 6~16자 이내로 입력해주세요.";				
		}
		else{
			pw_message.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			pw_message.innerHTML = "비밀번호가 일치합니다.";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
	}
	}else{
		pw_message.style.color = wrongColor;
		pw_message.innerHTML = "비밀번호가 일치하지 않습니다.";
	}
}
</script>
<style type="text/css">
	#footer,
	.side_rightbar_whole,
	.header_section,
	.header_team_logo scroll_div{
		display: none;
	}
	@media (max-width: 359px) {
	    #body {
			padding: 0;
	    }
	}
	.pwchange div {
		display:flex;
	    margin: 0 auto;
	    width: max-content;
	    max-width: max-content;
	    text-align: center;
	}
	.pwchange label {
		width: 95px;
		max-width: 95px;
	    margin: 0 auto 5px auto;
	    font-weight: 700;
	}
	.pwchange input {
	text-align: center;
	}
</style>
<title>비밀번호 바꾸기</title>
</head>
<body>

<h1>비밀번호 수정</h1>
<div class="pwchange">
	<form action="pwud" method="post" id="pwchange_form">
		<div class="pw">
			<input type="hidden" name="id" value="${id}">
			<label for="pw">비밀번호</label>
			<div class="pw1">
				<input type="password" name="pw" id="pw" placeholder="6~16글자 이내로 입력">
				<i class="fa fa-eye-slash fa-lg"></i>
			</div>
		</div>
		<div class="pw">
			<label for="pwcheck">비밀번호 확인</label>
			<div class="pw1">
				<input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호를 한번 더 입력" onkeyup="passwordCheck()">
				<i class="fa fa-eye-slash fa-lg"></i>
				  <span id="pw_message"></span>
			</div>
		</div>
		<div>
			<input type="button" value="비밀번호 수정" id="check">
			<input type="button" value="닫기" onclick="javascript:window.close()">
		</div>
	</form>
</div>

</body>
</html>