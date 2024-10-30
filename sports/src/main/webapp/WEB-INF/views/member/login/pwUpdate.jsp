<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<style type="text/css">
		#footer,
	.side_rightbar_whole,
	.header_section,
	.header_team_logo scroll_div{
		display: none;
	}
    #body {
		padding: 0;
    }
    .main_section {
  	  margin: 45px auto 0 auto;
    }
    h1{
    	margin-top:0;
    }
    .pwupdate{
        width: 500px;	
	    margin: 0 auto;
    }
	.pwupdate .pw {
		display:flex;
		flex-wrap: wrap;
	    margin: 30px auto;
	    width: 100%;
	    text-align: center;
	    align-items: center;
	}
	.pwupdate .pw1 {
	    width: calc(100% - 110px);
	}
	.pwupdate .pw1 i{
	    margin-left: 20px;
	}
	.pwupdate .pw span{
		margin: 10px 0 0 130px;
	}
	.pwupdate .pw label {
   		width: 100px;
    	text-align: end;
    	margin: 0 10px 0 0;
    	font-weight: 700;
	}
	.pwupdate select{
		border-color: #e8e8e8;
		margin : 0 5px;
		height: 30px;
		width: 60px;
		border-radius: 5px;
	}
	.pwupdate select#month, #day{
		width: 50px;
	}
	.pwupdate input {
		border: 1px solid #e8e8e8;
		height:40px;
		width: 65%;
		border-radius: 5px;
	}
	.pwupdate input:focus {
		height: 38px;
		border: 2px solid #0c6042;
	}
	.pwupdate input[type="button"]{
		width: 7+0%;
		border: 1px solid #08750e20;
	    background-color: #08750e90;
	    color: #fff;
	    height: 50px;
	    border-radius: 10px;
	}
	.pwupdate .button{
		text-align: center;
	}
	.pwupdate input[type="button"]:hover{
		border-color: #08750e;
	    background-color: #08750e20;
	    color: #08750e;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#pw').focus();
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
	});

	function checkform(){
		var pw = $('#pw').val();
		var pwcheck = $('#pwcheck').val();
		var vpw = /^[a-zA-Z0-9]{6,16}$/;
		//비밀번호 체크
		if(pw=="") {
			alertShow('오류','비밀번호를 입력해주세요.');
			$('#pw').focus();
			return false;
		}
		else if(pwcheck=="") {
			alertShow('오류','비밀번호 확인을 입력해주세요.');
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
		return true;
	}
	function check(){
		var id= $('#id').val();
		var pw = $('#pw').val();
		var pwcheck = $('#pwcheck').val();
		if(checkform()){			
			$.ajax({
				type: "post",
				url: "pwUpdate",
				async: true,
				data: {"id":id,"pw":pw},
				success:function(){
					alertShow('변경 완료','비밀번호 변경이 완료되었습니다.');
					setTimeout(function(){window.close();}, 10000);  
				},
				error:function(){
					alertShow("오류",'비밀번호를 다시 입력해주세요');
				}
			});
		}
	};

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
		if(window.event.keyCode == 13){
			check();
		}
}
</script>
</head>
<body>

<h1>비밀번호 수정</h1>
<div class="pwupdate">
	<div class="pw">
		<input type="hidden" name="id" id="id" value="${id}">
		<label for="pw">비밀번호</label>
		<div class="pw1">
			<input type="password" name="pw" id="pw" placeholder="6~16글자 이내로 입력" onkeyup="click_btn()">
			<i class="fa fa-eye-slash fa-lg"></i>
		</div>
	</div>
	<div class="pw">
		<label for="pwcheck">비밀번호 확인</label>
		<div class="pw1">
			<input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" onkeyup="passwordCheck()">
			<i class="fa fa-eye-slash fa-lg"></i>
		</div>
		  <span id="pw_message"></span>
	</div>
	<div class="button">
		<input type="button" value="비밀번호 수정" id="check" onclick="check()">
		</div>
</div>

</body>
</html>