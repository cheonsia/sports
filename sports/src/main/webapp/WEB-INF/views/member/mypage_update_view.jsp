<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
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
    
$(document).ready(function(){
	////비밀번호 보기 구현
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
	////전화번호 앞자리 선택
	var fir_tel=$('#fir_telvalue').val();
	
	$('#fir_tel').val(fir_tel).prop("selected",true);
	//// 종목 가져와서 변환
    var sportname=$('#sportvalue').val();
    var teamname=$('#teamvalue').val();
	if(sportname=='축구'){
	    $('#sport1').prop("checked",true);	
	}else{
	    $('#sport2').prop("checked",true);		
	}
	    updateList(sportname);
	    $('#normal_team').val(teamname).prop("selected",true);
	
});
    //// 팀 내용 가져오기

//축구를 고를 떄와 야구를 골랐을 때 Select 내용 바꾸기
function Activity(name, list){
    this.name = name;
    this.list = list;
}

var acts = new Array();
    acts[0] = new Activity('축구', ['강원', '울산', '수원FC', '김천', '서울', '포항', '광주', '제주', '대전', '인천', '전북', '대구']);
    acts[1] = new Activity('야구', ['KIA', '삼성', 'LG', '두산', 'KT', '한화', '롯데', 'SSG', 'NC', '키움']);
 
function updateList(str){
    var uf = document.updateform;
    var teamLen = uf.team.length;
    var numActs;
 
    for (var i = 0; i < acts.length; i++){
        if (str == acts[i].name) {
            numActs = acts[i].list.length;
            for (var j = 0; j < numActs; j++)
            	uf.team.options[j] = new Option(acts[i].list[j], acts[i].list[j]);
            for (var j = numActs; j < teamLen; j++)
            	uf.team.options[numActs] = null;
        }
    }
}

</script>
<script type="text/javascript">
//유효성 체크
function check() {
	var uf = document.updateform;
		
	////이름 체크
	var vname=/^[가-힣]{2,5}$/;
	var cname=uf.name.value;
	
	if(cname=="") {
		alertShow('이름 입력오류','이름을 입력해주세요.');
		return false;
	}
	else if(!vname.test(cname)) {
		alertShow('이름 입력오류','이름은 한글로만 2~5글자이내로 작성해주세요.');
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
	
	
	////주소 체크
	var code=uf.zipp_code.value;
	var cadd1=uf.user_add1.value;
	var cadd2=uf.user_add2.value;
	var vcode=/^[0-9]{5}$/;
	
	if(code=="") {
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
	
	var part = uf.part.value;
	
	if(part == '일반') {
		uf.submit();
	}
	else if(part == '감독') {
		////감독중인 팀 확인
		var team=uf.superteam.value;
		var vteam=/^[a-zA-Z가-힣0-9]*$/;
		
		if(team=="") {
			alertShow('팀 입력 오류','감독중인 팀을 입력해주세요.');
			return false;
		}
		else if(!vteam.test(team)) {
			alertShow('팀 입력 오류','팀 이름은 한글과 영어 대소문자, 숫자로만 입력해주세요.');
			return false;
		}
		uf.submit();
	}
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
<title>수정페이지</title>
</head>
<body>
<form action="myUpdate" method="post" name="updateform" enctype="multipart/form-data">
	<input type="hidden" name="part" id="part" value="${up.part}">
	<input type="hidden" name="refvoe" id="refvoe" value="${up.voe}">
	<input type="hidden" name="refrr" id="refrr" value="${up.rr}">
	<input type="hidden" name="teamvalue" id="teamvalue" value="${up.team}">
<div>
	<label>아이디</label>
	<input type="text" name="id" id="id" value="${up.id}" readonly>
</div>
<div>
	<label>이름</label>
	<input type="text" name="name" id="name" value="${up.name}">
</div>
<div>
	<label>생년월일</label>
	<input type="text" id="total_birthday" name="birthday" value="${up.birthday}" readonly>
</div>
<div>
	<label>전화번호</label>
	<input type="hidden" name="fir_telvalue" id="fir_telvalue" value="${up.tel.substring(0,3)}">
	<select id="fir_tel">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="019">019</option>
	</select>
	-
	<input type="text" maxlength="4" id="mid_tel" size="5" value="${up.tel.substring(4,8)}">
	-
	<input type="text" maxlength="4" id="end_tel" size="5" value="${up.tel.substring(9,13)}">
	<input type="hidden" id="total_tel" name="tel" value="">
</div>
<div>
	<label>이메일</label>
	<input type="text" id="total_email" name="email" value="${up.email}" readonly>
</div>
<div class="col-sm-10">
    <label for="zipp_btn" class="form-label">주소</label><br/>
    <c:choose>
		<c:when test="${up.zzip_code.length() <= 4}">
    		<input type="text" class="form-control mb-2" id="zipp_code_id" name="zipp_code" maxlength="10" placeholder="우편번호" style="width: 10%; display: inline;" readonly value="0${up.zzip_code}">
		</c:when>
		<c:otherwise>
	 	   <input type="text" class="form-control mb-2" id="zipp_code_id" name="zipp_code" maxlength="10" placeholder="우편번호" style="width: 10%; display: inline;" readonly value="${up.zzip_code}">
		</c:otherwise>
	</c:choose>
    <input type="button" id="zipp_btn" class="btn btn-primary" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" class="form-control mb-2" name="user_add1" id="UserAdd1" maxlength="40" placeholder="기본 주소를 입력하세요" required readonly value="${up.user_add1}">
    <div class="invalid-feedback">주소를 입력해주시기 바랍니다!</div>
    <input type="text" class="form-control" name="user_add2" id="UserAdd2" maxlength="40" placeholder="상세 주소를 입력하세요" value="${up.user_add2}">
</div>
<div>
	<c:if test="${up.part == '일반'}">
		<label>관심 종목</label>
	</c:if>
	<c:if test="${up.part == '감독'}">
		<label>관리 종목</label>
	</c:if>
	<input type="hidden" name="sportvalue" id="sportvalue" value="${up.sport}">
	<input type="radio" name="sport" id="sport1" onclick="updateList(this.value)" value="축구"><span><span></span></span><span>축구</span>
	<input type="radio" name="sport" id="sport2" onclick="updateList(this.value)" value="야구"><span><span></span></span><span>야구</span>
</div>
	<div>
		<c:if test="${up.part == '일반'}">
			<label>관심 팀</label>
		</c:if>
		<c:if test="${up.part == '감독'}">
			<label>관리 팀</label>
		</c:if>
		<select name="team" id="normal_team">
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
	<c:if test="${up.part == '감독'}">
			<div>
				<label>재직 증명서</label>
				<img src="./image/member/super/${up.voe}" width="100px" height="70px">
				<input type="file" name="voe" id="voe">
			</div>
			<div>
				<label>등본</label>			
				<img src="./image/member/super/${up.rr}" width="100px" height="70px">
				<input type="file" name="rr" id="rr">
			</div>
	</c:if>
	<div>
		<input type="button" value="내 정보 수정" onclick="check()">
		<input type="button" value="취소" onclick="javascript:history.go(-1)">
	</div>
</form>
</body>
</html>