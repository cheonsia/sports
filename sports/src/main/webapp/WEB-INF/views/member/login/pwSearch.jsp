<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  	  margin: 15px auto 0 auto;
    }
    h1{
    	margin-top:0;
    }
    .pwsearch{
        width: 310px;	
	    margin: 0 auto;
    }
	.pwsearch div {
		display:flex;
	    margin: 30px auto;
	    width: 100%;
	    text-align: center;
	    align-items: center;
	}
	.pwsearch label {
   		width: 60px;
    	min-width: 60px;
    	text-align: end;
    	margin: 0 10px 0 0;
    	font-weight: 700;
	}
	.pwsearch select{
		border-color: #e8e8e8;
		margin : 0 5px;
		height: 30px;
		width: 60px;
		border-radius: 5px;
	}
	.pwsearch select#month, #day{
		width: 50px;
	}
	.pwsearch input {
		border: 1px solid #e8e8e8;
		height:30px;
		width: 65%;
		border-radius: 5px;
	}
	.pwsearch select:focus,
	.pwsearch input:focus {
		border: 2px solid #0c6042;
		height:28px;
	}
	.pwsearch input#mid_tel,#end_tel{
		width: 40px;
		margin : 0 5px;
	}
	.pwsearch input[type="button"]{
		width: 100%;
		border: 1px solid #08750e20;
	    background-color: #08750e90;
	    color: #fff;
	    height: 50px;
	    border-radius: 10px;
	}
	.pwsearch input[type="button"]:hover{
		border-color: #08750e;
	    background-color: #08750e20;
	    color: #08750e;
	}
</style>
<script type="text/javascript">
	function click_btn(){
		if(window.event.keyCode == 13){
			$('#findpw').click();
		}
	};
	$(document).ready(function() {
		$('#id').focus();
	});
	function checkform() {
		var id = $('#id').val();
		var name=$('#name').val();
		var email=$('#email').val();

		var vid = /^[a-zA-Z0-9]{4,10}$/;
		if(id == "") {
			alertShow('오류','아이디를 입력해주세요.');
			$('#id').focus();
			return false;
		}
		else if(!vid.test(id)) {
			alertShow('오류','아이디는 영문자+숫자 4~10글자 이내로 작성해야합니다.');
			$('#id').focus();
			return false;
		}
		
		var vname=/^[가-힣]{2,5}$/;
		if(name=="") {
			alertShow('오류','이름을 입력해주세요.');
			$('#name').focus();
			return false;
		}
		else if(!vname.test(name)) {
			alertShow('오류','이름은 한글 2~5글자 이내로 작성해주세요.');
			$('#name').focus();
			return false;
		}
		
		var fir_tel = $("select[id='fir_tel'] option:selected").val();
		var mid_tel = $('#mid_tel').val();
		var end_tel = $('#end_tel').val();
		var tel = fir_tel + "-" + mid_tel + "-" + end_tel;		
		var tel_regexp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;//전화번호 정규식
		if(!tel_regexp.test(tel)) {
			alertShow('오류','전화번호를 다시 입력해주세요');
			$('#mid_tel').focus();
			return false;
		}
		
		var email_regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;//이메일 정규식
		if(email == "") {
			alertShow('오류','이메일을 입력해주세요.');
			$('#email').focus();
			return false;
		}
		if(!email_regexp.test(email)){
			alertShow('오류','이메일 형식이 맞지 않습니다');
			$('#email').focus();
			return false;
		}
		return true;
	}
	function findPw() {
		var id = $('#id').val();
		var name=$('#name').val();
		var email=$('#email').val();
		var fir_tel = $("select[id='fir_tel'] option:selected").val();
		var mid_tel = $('#mid_tel').val();
		var end_tel = $('#end_tel').val();
		var tel = fir_tel + "-" + mid_tel + "-" + end_tel;		
		if(checkform()){			
			$.ajax({
				type:"post",
				url:"getpw",
				async:true,
				data:{"id":id, "name":name, "tel":tel, "email":email},
				success:function(data) {
					if(data==1) {
						location.href='pwupdate?id='+id;
					}
					else {
						alertShow('오류','일치하는 결과가 없습니다.');
					}
				},
				error:function() {
					alertShow('에러','다시 입력해주세요.');
				}
			});//ajax
		}
	};//findpw
</script>
<title>비밀번호 찾기</title>
</head>
<body>

<h1>비밀번호 찾기</h1>
<div class="pwsearch">
	<div>
		<label>아이디</label>
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." onkeyup="click_btn()">
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." onkeyup="click_btn()">
	</div>
	<div class="phone">
		<label for="fir_tel">전화번호</label>
		<select id="fir_tel">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="019">019</option>
		</select>
		-
		<input type="text" maxlength="4" id="mid_tel" size="5" onkeyup="click_btn()">
		-
		<input type="text" maxlength="4" id="end_tel" size="5" onkeyup="click_btn()">
	</div>
	<div class="email">
		<label for="email_id">이메일</label>
		<input type="text" id="email" name="email" placeholder="aaa@abc.com" onkeyup="click_btn()"/>
	</div>
	<div style="text-align: center" class="button">
		<input type="button" id="findpw" onclick="findPw()" value="비밀번호 찾기">
	</div>
</div>

</body>
</html>