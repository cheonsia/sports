<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><!-- 삭제!!! -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- CDN 방식 사용 -->
   <script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업을 통한 검색 결과 항목 클릭 시 실행
                var addr = ''; // 주소_결과값이 없을 경우 공백 
                var extraAddr = ''; // 참고항목

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 도로명 주소를 선택
                    addr = data.roadAddress;
                } else { // 지번 주소를 선택
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
                } else {
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
    
////비밀번호 보기 구현
$(document).ready(function(){
    $('.pw i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });
});

</script>
<script type="text/javascript">
////아이디 유효성 검사후 중복체크
$(document).ready(function() {
	$("#idcheck").click(function() {
		var id = $("#id").val();
		var vid=/^[a-zA-Z0-9]{4,10}$/;
		
		if(id=="") {
			alertShow('아이디 입력오류','아이디를 입력해주세요.');
			return false;
		}
		else if(!vid.test(id)) {
			alertShow('아이디 입력오류','아이디는 영문자와 숫자로만 4~10글자 이내로만 작성해야합니다.');
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"idcheck",
			async:true,
			data:{"id":id},
			success:function(data) {
				if(data==1) {
					alertShow('중복확인',"이미 사용중인 아이디 입니다.");
					$('#idcheck2').val(1);
				}
				else{
					alertShow('중복확인',"사용할 수 있는 아이디 입니다.");
					$('#idcheck2').val(0);
				}
			},
			error:function() {
				alertShow('에러','아이디를 다시 입력해주세요');
			}
		});
	});
});
//////중복확인을 한 후 아이디를 수정하면 다시 중복확인을 하게하기
function idcheck_reset() {
	$('#idcheck2').val(1);
}
////이메일 도메인에 값 넣기
function mailSelect() {
	
	var domain = $('#mail_select').find('option:selected').val();
	
	if(domain == 'emailall') {
		$('#email_domain').val("");
	}
	else {
		$('#email_domain').val(domain);
	}
	
}

</script>
<script type="text/javascript">
//유효성 체크
function check() {
	var sf = document.superform;
	
 	////중복확인 여부 확인
 	var idchecked = sf.idcheck2.value;
 	if(idchecked==1 || idchecked=="") {
 		alertShow('아이디 중복확인 오류','아이디 중복확인을 해주세요.');
 		return false;
 	}
	
	////아이디 체크
	var vid=/^[a-zA-Z0-9]{4,10}$/;
	var cid=sf.id.value;
	
	if(cid=="") {
		alertShow('아이디 입력오류','아이디를 입력해주세요.');
		sf.id.select();
		return false;
	}
	else if(!vid.test(cid)) {
		alertShow('아이디 입력오류','아이디는 영문자와 숫자로만 4~10글자 이내로만 작성해야합니다.');
		sf.id.select();
		return false;
	}
	
	////비밀번호 체크
	var vpw=/^[a-zA-Z0-9]{6,16}$/;
	var cpw=sf.pw.value;
	
	if(cpw=="") {
		alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
		return false;
	}
	else if(!vpw.test(cpw)) {
		alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
		return false;
	}
	
	////이름 체크
	var vname=/^[가-힣]{2,5}$/;
	var cname=sf.name.value;
	
	if(cname=="") {
		alertShow('이름 입력오류','이름을 입력해주세요.');
		return false;
	}
	else if(!vname.test(cname)) {
		alertShow('이름 입력오류','이름은 한글로만 2~5글자이내로 작성해주세요.');
		return false;
	}
	
	////생년월일 체크 후 이어붙이기
	
	var year = $("select[id='year'] option:selected").val();
	var month = $("select[id='month'] option:selected").val();
	var day = $("select[id='day'] option:selected").val();
	var birth_regexp = /^\d{4}-\d{2}-\d{2}$/;//생년월일 정규식
	
	//생년월일 입력
	var total_birthday = year + "-" + month + "-" + day;
	if(birth_regexp.test(total_birthday)) {
		//올바른 정규식
			
		$('#total_birthday').val(total_birthday);
	}
	else {
		//틀린 정규식
		alertShow('생년월일 입력오류','다시 입력해주세요');
		return false;
	}
	
	////전화번호 체크 후 이어붙이기
	
	var fir_tel = $("select[id='fir_tel'] option:selected").val();
	var mid_tel = $('#mid_tel').val();
	var end_tel = $('#end_tel').val();
	var tel_regexp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;//전화번호 정규식
	
	//전화번호 입력
	var total_tel = fir_tel + "-" + mid_tel + "-" + end_tel;
	if(tel_regexp.test(total_tel)) {
		//올바른 정규식
			
		$('#total_tel').val(total_tel);
	}
	else {
		//틀린 정규식
		alertShow('전화번호 입력오류','다시 입력해주세요');
		return false;
	}
	
	var mail_select = $("select[id='mail_select'] option:selected").val();
	var email_val1 = $('#email_id').val();
	var email_regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;//이메일 정규식

	if(mail_select == 'emailall') {//이메일 입력
		var email_val2 = $('#email_domain').val();
		var total_email = email_val1 + "@" + email_val2;
		if(email_regexp.test(total_email)) {
			//올바른 정규식
			
			$('#total_email').val(total_email);
		}
		else {
			//틀린 정규식
			alertShow('이메일 입력오류','다시 입력해주세요');
			return false;
		}
	}
	else {
		var total_email = email_val1 + "@" + mail_select;
		if(email_regexp.test(total_email)) {
			//올바른 정규식
			
			$('#total_email').val(total_email);
			
		}
		else {
			//틀린 정규식
			alertShow('이메일 입력오류','다시 입력해주세요');
			return false;
		}
		
	}
	
	////주소 체크
	var code=sf.zipp_code.value;
	var cadd1=sf.user_add1.value;
	var cadd2=sf.user_add2.value;
	var vcode=/^[0-9]{5}$/;
	
	if(cadd1=="") {
		alertShow('주소 입력 오류','우편주소를 검색해주세요.');
		return false;
	}
	else if(cadd1=="") {
		alertShow('주소 입력 오류','기본 주소가 입력되지 않았습니다. 우편주소를 검색해주세요.');
		return false;
	}
	else if(cadd2=="") {
		alertShow('주소 입력 오류','상세 주소를 입력해주세요.');
		return false;
	}
	else if(!vcode.test(code)) {
		alertShow('주소 입력 오류','우편번호는 숫자로만 입력 가능합니다.');
		return false;
	}
	
	////감독중인 팀 확인
	 var team=sf.team.value;
	var vteam=/^[a-zA-Z가-힣0-9]*$/;
	
	if(team=="") {
		alertShow('팀 입력 오류','감독중인 팀을 입력해주세요.');
		return false;
	}
	else if(!vteam.test(team)) {
		alertShow('팀 입력 오류','팀 이름은 한글과 영어 대소문자, 숫자로만 입력해주세요.');
		return false;
	} 
	
	////재직증명서 확인
	var voefile = sf.voe.value;
	
	if(voefile=="") {
		alertShow('재직 증명서 등록 오류','재직 증명서를 등록해주세요.');
		return false;
	}
	
	////등본 확인
	var rrfile = sf.rr.value;
	
	if(rrfile=="") {
		alertShow('등본 등록 오류','등본을 등록해주세요.');
		return false;
	}
	
	
	sf.submit();
	
}


</script>
<script type="text/javascript">
	/* 자바 스크립트 함수 선언(비밀번호 확인) */

	function passwordCheck() {
		var pw = document.getElementById("pw");					//비밀번호 
		var pwcheck = document.getElementById("pwcheck");		//비밀번호 확인 값
		var pw_message = document.getElementById("pw_message");	//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor = "#ff0000";		//틀렸을 때 출력되는 색깔
		
		if(pw.value == pwcheck.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			pw_message.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			pw_message.innerHTML = "비밀번호가 일치합니다.";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			pw_message.style.color = wrongColor;
			pw_message.innerHTML = "비밀번호가 일치하지 않습니다.";
		}
	}
</script>
<style type="text/css">
div.pw{
    position: relative;
    padding: 20px;
}
div.pw i{
    position: absolute;
    color: black;
}
.pw1 {
	border: 1px solid #000000;
	
}
.pw1 input[type="password"] {
	border:none;
	width: auto;
}
div {
border: 1px solid #e8e8e8;
}

</style>
<title>감독 회원가입</title>
</head>
<body>

<form action="supersave" method="post" name="superform" enctype="multipart/form-data">
<div>
	<label>아이디</label>
	<input type="text" name="id" id="id" placeholder="4~10글자 이내로 입력" onchange="idcheck_reset()"><!-- onchange 추가!!!! -->
	<input type="button" value="중복확인" id="idcheck">
	<input type="hidden" id="idcheck2" value="">
</div>
<div class="pw">
	<label>비밀번호</label>
	<div class="pw1">
		<input type="password" name="pw" id="pw" placeholder="6~16글자 이내로 입력">
		<i class="fa fa-eye fa-lg"></i>
	</div>
</div>
<div class="pw">
	<label>비밀번호확인</label>
	<div class="pw1">
		<input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호를 한번 더 입력" onkeyup="passwordCheck()">
		<i class="fa fa-eye fa-lg"></i>
		  <span id="pw_message"></span>
	</div>
</div>
<div>
	<label>이름</label>
	<input type="text" name="name" id="name">
</div>
<div>
	<label>생년월일</label>
	<select name="year" id="year">
		<option value="">년</option>
			<c:forEach var="i" begin="1920" end="2024">
			<option value="${i}">${i}</option>
			</c:forEach>
	</select>
	-
	<select name="month" id="month">
		<option value="">월</option>
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
	-
	<select name="day" id="day">
		<option value="">일</option>
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
	<input type="hidden" id="total_birthday" name="birthday" value="">
</div>
<div>
	<label>전화번호</label>
	<select id="fir_tel">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="019">019</option>
	</select>
	-
	<input type="text" maxlength="4" id="mid_tel" size="5">
	-
	<input type="text" maxlength="4" id="end_tel" size="5">
	<input type="hidden" id="total_tel" name="tel" value="">
</div>
<div>
	<label>이메일</label>
	<input type="text" id="email_id" class="form_w200" placeholder="이메일" maxlength="18" /> @ 
	<input type="text" id="email_domain" class="form_w200" placeholder="이메일 도메인" maxlength="18"/> 
	<select class="select" id="mail_select" onchange="mailSelect()">
	    <option value="emailall" selected>-선택-</option>
	    <option value="naver.com">naver.com</option>
	    <option value="gmail.com">gmail.com</option>
	    <option value="hanmail.net">hanmail.net</option>
	    <option value="hotmail.com">hotmail.com</option>
	    <option value="korea.com">korea.com</option>
	    <option value="nate.com">nate.com</option>
	    <option value="yahoo.com">yahoo.com</option>
	</select>
	<input type="hidden" id="total_email" name="email" value="">
</div>
<div class="col-sm-10">
    <label for="zipp_btn" class="form-label">주소</label><br/>
    <input type="text" class="form-control mb-2" id="zipp_code_id" name="zipp_code" maxlength="10" placeholder="우편번호" style="width: 10%; display: inline;">
    <input type="button" id="zipp_btn" class="btn btn-primary" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" class="form-control mb-2" name="user_add1" id="UserAdd1" maxlength="40" placeholder="기본 주소를 입력하세요" required readonly>
    <div class="invalid-feedback">주소를 입력해주시기 바랍니다!</div>
    <input type="text" class="form-control" name="user_add2" id="UserAdd2" maxlength="40" placeholder="상세 주소를 입력하세요">
</div>
<div>
	<label>
	<input type="radio" name="sport" value="축구"><span><span></span></span><span>축구</span>
	</label>
	<label>
	<input type="radio" name="sport" value="야구"><span><span></span></span><span>야구</span>
	</label>
</div>
<div>
	<label>감독팀</label>
	<input type="text" name="team" id="team">
</div>
<div>
	<label>재직증명서</label>
	<input type="file" name="voe" id="voe" required>
</div>
<div>
	<label>등본</label>
	<input type="file" name="rr" id="rr" required>
</div>
<div>
<input type="hidden" name="part" id="part" value="감독">
</div>
<div>
	<input type="button" value="회원가입" onclick="check()">
	<input type="button" value="취소" onclick="location.href='./'">
</div>
</form>

</body>
</html>