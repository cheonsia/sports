<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	$('#findpw').click(function() {
	////아이디 체크
		var vid = /^[a-zA-Z0-9]{4,10}$/;
		var id = $('#id').val();
	 	
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
		var name=$('#name').val();
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
		var year = $("select[id='year'] option:selected").val();
		var month = $("select[id='month'] option:selected").val();
		var day = $("select[id='day'] option:selected").val();
		var birth= year + "-" + month + "-" + day;
		var birth_regexp = /^\d{4}-\d{2}-\d{2}$/;//생년월일 정규식		
		if(!birth_regexp.test(birth)) {
			alertShow('오류','생년월일을 입력해주세요');
			$('#year').focus();
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
		$.ajax({
			type:"post",
			url:"getpw",
			async:true,
			data:{"id":id, "name":name, "birth":birth, "tel":tel},
			success:function(data) {
				if(data==1) {
					location.href='pwchange?id='+id;
				}
				else {
					alertShow('오류','일치하는 결과가 없습니다.');
				}
			},
			error:function() {
				alertShow('에러','다시 입력해주세요.');
			}
		});//ajax
	});//findpw
});//
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
	.pwsearch div {
		display:flex;
	    margin: 0 auto;
	    width: max-content;
	    max-width: max-content;
	    text-align: center;
	}
	.pwsearch label {
		width: 90px;
		max-width: 90px;
	    margin: 0 auto 5px auto;
	    font-weight: 700;
	}
	
	.pwsearch input {
	text-align: center;
	}
	.pwsearch input#mid_tel,#end_tel{
		width: 80px;
	}
</style>
<title>비밀번호 찾기</title>
</head>
<body>

<h1>비밀번호 찾기</h1>
<div class="pwsearch">
	<div>
		<label>아이디</label>
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요.">
	</div>
	<div>
		<label for="year">생년월일</label>
		<select name="year" id="year">
			<option value="">--</option>
				<c:forEach var="i" begin="1920" end="2024">
				<option value="${i}">${i}</option>
				</c:forEach>
		</select>년
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
		</select>월
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
		</select>일
		<input type="hidden" id="birth" name="birth" value="">
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
		<input type="text" maxlength="4" id="mid_tel" size="5">
		-
		<input type="text" maxlength="4" id="end_tel" size="5">
		<input type="hidden" id="total_tel" name="tel" value="">
	</div>
	<div style="text-align: center" class="button">
		<input type="button" id="findpw" value="비밀번호 찾기">
		<button type="button" onclick="javascript:window.close()">닫기</button>
	</div>
</div>

</body>
</html>