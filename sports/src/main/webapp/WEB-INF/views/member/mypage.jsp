<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<script type="text/javascript">
<!-- 모달창 자바스크립트: 비밀번호 수정 -->
$(document).ready(function () {
    // 비밀번호 수정 버튼 클릭 시 모달 창 표시
    $("btn-pwCheck").click(function () {
        $("#PwCheckModal").modal("show");
	   	$('#pwcheck_id').focus();
	  	$('#pwcheck_id').empty();
    });
});

////비밀번호 확인(유효성 검사,AJAX) 후 비밀번호 수정창으로 이동
$(document).ready(function() {
	$("#pwupdate").click(function() {
		var vpw=/^[a-zA-Z0-9]{6,16}$/;
		var id=$('#id_id').val();
		var cpwcheck=$('#pwcheck_id').val();
		
		if(cpwcheck=="") {
			alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
			return false;
		}
		else if(!vpw.test(cpwcheck)) {
			alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"pwCheck",
			async:true,
			data:{"id":id, "pw":cpwcheck},
			success:function(data) {
				if(data==1) {
					////수정창 띄우기
					$("#PwUpdateModal").modal("show");
				}
				else{
					alertShow('비밀번호 확인',"비밀번호가 다릅니다 다시 입력해주세요.");
				}
			},
			error:function() {
				alertShow('에러','비밀번호를 다시 입력해주세요');
			}
		});
	});
});

////수정한 비밀번호 유효성 검사

$(document).ready(function() {
	$("#pwupdate2").click(function() {
		var vpw=/^[a-zA-Z0-9]{6,16}$/;
		var id=$('#id_id').val();
		var cpwupdate=$('#PwUpdate_id').val();
		
		if(cpwupdate=="") {
			alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
			return false;
		}
		else if(!vpw.test(cpwupdate)) {
			alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
			return false;
		}
		$.ajax({
			type: "post",
			url: "pwUpdate",
			async: true,
			data: {"id":id,"pw":cpwupdate},
			success(){
				alertShow('비밀번호 변경',"비밀번호가 변경되었습니다");
			},
			error(){
				alertShow("에러",'비밀번호를 다시 입력해주세요');
			}
		});
	});
});
<!-- 모달창 자바스크립트: 내 정보 수정 -->
$(document).ready(function () {
    // 내 정보 수정 버튼 클릭 시 모달 창 표시
    $("btn-Mypage_Update_pwCheck").click(function () {
        $("#Mypage_Update_pwCheckModal").modal("show");
    });
});

////비밀번호 확인(유효성 검사,AJAX) 후 마이페이지 수정창으로 이동
$(document).ready(function() {
	$("#mypageupdate").click(function() {
		var vpw=/^[a-zA-Z0-9]{6,16}$/;
		var id=$('#id_id').val();
		var cpwcheck=$('#mypage_pwcheck_id').val();
		
		if(cpwcheck=="") {
			alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
			return false;
		}
		else if(!vpw.test(cpwcheck)) {
			alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
			return false;
		}
		
		$.ajax({
			type:"post",
			url:"pwCheck",
			async:true,
			data:{"id":id, "pw":cpwcheck},
			success:function(data) {
				if(data==1) {
					////마이페이지 수정창 이동하기
					location.href="mypage_update?id=korea1"				
				}
				else{
					alertShow('비밀번호 확인',"비밀번호가 다릅니다 다시 입력해주세요.");
				}
			},
			error:function() {
				alertShow('에러','비밀번호를 다시 입력해주세요');
			}
		});
	});
});
/////////////////////////////////////////////////Enter 키로 넘어가게 설정/////////////////////////////////////////////
////비밀번호 확인 Enter
function btn_pwcheck(e) {
	if(e.key == 'Enter') {
		$('#pwupdate').click();
	}
}

////비밀번호 수정 Enter
function btn_pwupdate(e) {
	if(e.key == 'Enter') {
		$('#pwupdate2').click();
	}
}

////비밀번호 수정 Enter
function btn_mypage_pwcheck(e) {
	if(e.key == 'Enter') {
		$('#mypageupdate').click();
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////비밀번호 보기 구현
$(document).ready(function() {
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
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<div>
	<label>아이디</label>
	<input type="text" name="id" id="id_id" value="korea1" readonly>
</div>
<div>
	<label>이름</label>
	<input type="text" name="name" id="name_id" value="한라산" readonly>
</div>
<div>
	<label>생년월일</label>
	<input type="text" id="birthday_id" name="birthday" value="1990-07-12" readonly>
</div>
<div>
	<label>전화번호</label>
	<input type="text" id="tel_id" name="tel" value="010-1234-5678" readonly>
</div>
<div>
	<label>이메일</label>
	<input type="text" id="email_id" name="email" value="sasd123@gmail.com" readonly>
</div>
<div>
    <label>우편주소</label>
    
		
		
	 	   <input type="text" name="zzip_code" id="zzip_code_id" value="34891" readonly>
		
	
</div>
<div>
    <label>주소</label>
    <input type="text" name="user_add1" id="user_add1_id" value="대전 중구 계백로1565번길 1 (유천동)" readonly>
    <input type="text" name="user_add2" id="user_add2_id" value="2동 2호" readonly>
</div>
<div>
<!-- 일반회원일 떄 -->
	
		<label>관심 종목</label>
	
<!-- 감독일 떄 -->
	
		<input type="text" id="sport_id" name="sport" value="축구" readonly>
</div>
<div>
	
		<label>관심 팀</label>
	
	
		<input type="text" id="team_id" name="team" value="인천" readonly>
</div>

<!-- ------------------------------------------------------------------------------------------------------- -->
<div>
	<label>등급</label>
	<input type="text" name="part" id="part_id" value="일반" readonly>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->
<div>
	<button type="button" class="btn btn-pwCheck" data-toggle="modal" data-target="#PwCheckModal">비밀번호 수정</button>
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
		                <p>비밀번호를 입력해주세요.</p>
		                <div class="pw1">
			                <input type="password" name="pwcheck" id="pwcheck_id" onkeydown="btn_pwcheck(event)">
			                <i class="fa fa-eye fa-lg"></i>
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
<!-- 모달창: 수정할 비밀번호 입력 -->
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
		                <p>수정할 비밀번호를 입력해주세요.</p>
		                <div class="pw1">
			                <input type="password" name="PwUpdate" id="PwUpdate_id" onkeydown="btn_pwupdate(event)">
			                <i class="fa fa-eye fa-lg"></i>
		                </div>
		            </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                <button type="button" class="btn btn-primary" data-dismiss="modal" id="pwupdate2">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->
<div>
	<button type="button" class="btn btn-Mypage_Update_pwCheck" data-toggle="modal" data-target="#Mypage_Update_pwCheckModal">내 정보 수정</button>
	<!-- 모달창: 비밀번호 확인 (마이페이지 이동) -->
	<div class="modal fade" id="Mypage_Update_pwCheckModal" tabindex="-1" role="dialog" aria-labelledby="Mypage_Update_pwCheckModalLabel" aria-hidden="true">
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
			                <input type="password" name="mypage_pwcheck" id="mypage_pwcheck_id" onkeydown="btn_mypage_pwcheck(event)" autofocus>
			                <i class="fa fa-eye fa-lg"></i>
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
<!-- ------------------------------------------------------------------------------------------------------- -->
<div>
	<button type="button" onclick="javascript:history.go(-1)">이전으로</button>
</div>

</body>
</html>