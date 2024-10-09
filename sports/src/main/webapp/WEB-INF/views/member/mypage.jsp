<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
	    var year = $('#birth').val().substr(0,4);
		var month = $('#birth').val().substr(5,2);
		var day = $('#birth').val().substr(8,2);
		$('#year').val(year);
		$('#month').val(month);
		$('#day').val(day);
		<!-- 모달창 자바스크립트: 내 정보 수정 -->
	    // 내 정보 수정 버튼 클릭 시 모달 창 표시
	    $("btn_updateModal").click(function () {
	        $("#updateModal").modal("show");
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
		$("#mypageupdate").click(function() {
			var vpw=/^[a-zA-Z0-9]{6,16}$/;
			var id=$('#id').val();
			var pw=$('#pw').val();
			
			if(pw=="") {
				alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
				return false;
			}
			else if(!vpw.test(pw)) {
				alertShow('비밀번호 입력오류','비밀번호는 영문자와 숫자로만 6~16글자 이내로만 작성해야합니다.');
				return false;
			}			
			$.ajax({
				type:"post",
				url:"pwCheck",
				async:true,
				data:{"id":id, "pw":pw},
				success:function(data) {
					if(data==1) {
						////마이페이지 수정창 이동하기
						location.href="memberupdate?id="+id;	
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
	////비밀번호 확인 Enter
	function btn_pwcheck(e) {
		if(e.key == 'Enter') {
			$('#pwupdate').click();
		}
	}
</script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<input type="hidden" id="birth" name="birth" value="${my.birth}">
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
		<input type="text" id="year" name="year" value="">년
		<input type="text" id="month" name="month" value="">월
		<input type="text" id="day" name="day" value="">일
	</div>
	<div>
		<label>전화번호</label>
		<input type="text" id="tel" name="tel" value="${my.tel}" readonly>
	</div>
	<div>
		<label>이메일</label>
		<input type="text" id="email" name="email" value="${my.email}" readonly>
	</div>
	<div>
	    <label>우편주소</label>
	    <input type="text" name="zzip_code" id="zzip_code" value="${my.zzip_code}" readonly>
	</div>
	<div>
	    <label>주소</label>
	    <input type="text" name="user_add1" id="user_add1" value="${my.user_add1}" readonly>
	    <input type="text" name="user_add2" id="user_add2" value="${my.user_add2}" readonly>
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
	<div>
		<c:choose>
			<c:when test="${adminlogin}">
			 	<c:if test="${my.inputaccess == 'no'}">
					<button type="button" onclick="location.href='memberAccess?id=${my.id}'">승인</button>
					<button type="button" onclick="location.href='deleteMember?id=${my.id}'">거부(삭제)</button>
			 	</c:if> 
				<c:if test="${my.inputaccess == 'ok'}">
					<button type="button" onclick="location.href='memberAccess?id=${my.id}'">차단(보류)</button>
				</c:if>	
			</c:when>	
			<c:when test="${!adminlogin}">		
				<button type="button" class="btn_updateModal" data-toggle="modal" data-target="#updateModal">내 정보 수정</button>
			</c:when>	
		</c:choose>
		<button type="button" onclick="javascript:history.go(-1)">이전으로</button>
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
				                <input type="password" name="pw" id="pw" onkeydown="btn_mypage_pwcheck(event)">				                <i class="fa fa-eye-slash fa-lg"></i>
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
</body>
</html>