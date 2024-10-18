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
  	  margin: 45px auto 0 auto;
    }
    .idsearch{
        width: 310px;	
	    margin: 0 auto;
    }
	.idsearch div {
		display:flex;
	    margin: 30px auto;
	    width: 100%;
	    text-align: center;
	    align-items: center;
	}
	.idsearch label {
   		width: 60px;
    	min-width: 60px;
    	text-align: end;
    	margin: 0 10px 0 0;
    	font-weight: 700;
	}
	.idsearch select{
		border-color: #e8e8e8;
		margin : 0 5px;
		height: 30px;
		width: 60px;
		border-radius: 5px;
	}
	.idsearch select#month, #day{
		width: 50px;
	}
	.idsearch input {
		border: 1px solid #e8e8e8;
		height:30px;
		width: 65%;
		border-radius: 5px;
	}
	.idsearch select:focus,
	.idsearch input:focus {
		border: 2px solid #0c6042;
		height: 28px;
	}
	.idsearch input#mid_tel,#end_tel{
		width: 40px;
		margin : 0 5px;
	}
	.idsearch input[type="button"]{
		width: 100%;
		border: 1px solid #08750e20;
	    background-color: #08750e90;
	    color: #fff;
	    height: 50px;
	    border-radius: 10px;
	}
	.idsearch input[type="button"]:hover{
		border-color: #08750e;
	    background-color: #08750e20;
	    color: #08750e;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#name').focus();
	});
	function click_btn(){
		if(window.event.keyCode == 13){
			$('#findid').click();
		}
	};
	function checkform() {
		var vname=/^[가-힣]{2,5}$/;
		var name=$('#name').val();
		if(name=="") {
			alertShow('오류','이름을 입력해주세요.');
			$('#name').focus();
			return false;
		}
		if(!vname.test(name)) {
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
		return true;
	};
	function findId() {
		var name=$('#name').val();
		var year = $("select[id='year'] option:selected").val();
		var month = $("select[id='month'] option:selected").val();
		var day = $("select[id='day'] option:selected").val();
		var birth= year + "-" + month + "-" + day;
		var fir_tel = $("select[id='fir_tel'] option:selected").val();
		var mid_tel = $('#mid_tel').val();
		var end_tel = $('#end_tel').val();
		var tel = fir_tel + "-" + mid_tel + "-" + end_tel;		
		if(checkform()){			
			$.ajax({
				type:"post",
				url:"getid",
				async:true,
				data:{"name":name, "birth":birth, "tel":tel},
				success:function(data) {
						alertShow('아이디 찾기',data);
						setTimeout(function(){window.close();}, 1000);  
				},
				error:function() {
					alertShow('에러','다시 입력해주세요.');
				}
			});//ajax
		}
	};//findid
</script>
</head>
<body>
<h1>아이디 찾기</h1>
<div class="idsearch">
	<div>
		<label>이&emsp;&nbsp;름</label>
		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요." onkeyup="click_btn()">
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
							<option value="0${i}" >0${i}</option>
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
		<input type="text" maxlength="4" id="mid_tel" size="5" onkeyup="click_btn()">
		-
		<input type="text" maxlength="4" id="end_tel" size="5" onkeyup="click_btn()">
		<input type="hidden" id="total_tel" name="tel" value="">
	</div>
		<input type="button" onclick="findId()" id="findid" value="아이디 찾기">
</div>
</body>
</html>