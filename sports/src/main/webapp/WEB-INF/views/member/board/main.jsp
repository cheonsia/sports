<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
	<style type="text/css">
	.header_team_logo.scroll_div{
		display: none;
	}
    .main_section {
       margin-top: 100px;
    }
    .main_section h1 {
       margin-bottom: 0;
    }
	.board div{
		width: 100%;
		max-width: 700px;
		text-align: right;
		margin: 20px auto;
	}
	.board div.button{
	    margin: -30px auto -30px auto;
	}
	.button .inquiry{
		width:80px;
	    height: 35px;
	    border-radius: 5px;
		border: 1px solid #0c400c80;
		background-color:#fff;
		color: #0c400c;
	}
	.button .inquiry:hover{
		border-color:#0c400c20;
		background-color:#0c400c10;
	}
	.board .page{
	    display: flex;
	    margin: 0 auto;
   	 	width: 700px;
   	 	align-items:center;
   	 	letter-spacing: 10px;
	}
	.board .page a{
		color: #939393;
		font-size:18px;
		text-align:center;
	    text-decoration: none;
	}
	.board .page a:hover{
		color: #000;
		font-size: 21px;
		font-weight: bold;
	}
	.board .page span{
		color: teal;
		font-size: 18px;
		font-weight: bold;
	}
	div.result{
		text-align: center;
	}
	table{
		text-align: center;
		width: 100%;
		table-layout: fixed;
	}
	tr{
		height: 40px;
	}
	th{
		text-align: center;
		border: 1px solid #fff;
		background-color: #0c400c20;
	}
	td{
		text-align: center;
		border: 1px solid #e8e8e8;
	}
	.board td div{
		display: flex;
		width: 100%;
		margin: 0;
	}
	th:nth-child(1){
		width: 80px;
	}
	th:nth-child(2){
		width: calc(100% - 180px);
	}
	td:nth-child(2){
		text-align: left;
		padding-left: 20px;
	}
	td:nth-child(2) a{
		color: #666;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 100%;
		display: block;
		text-align: start;
		margin-right: 40%;
	}
	td:nth-child(2) img{
		width: 20px;
		margin-right: 10px;
	}
	th:nth-child(3){
		max-width: 80px;
		width: 80px;
	}
	th:nth-child(4){
		max-width: 150px;
		width: 150px;
	}
	#pw{
		margin: 0 10px 0 10px;
	}
	.modal-header{
		display: flex;
		justify-content: space-between;
	}
	.modal-header:before,
	.modal-header:after,
	.modal-footer:before,
	.modal-footer:after{
		content: inherit;
	}
	.modal-header .close{
		display: block;
		min-width: 30px;
		width: 30px;
		height: 24px;
		margin: 0;
		opacity: 1;
	}
	.modal-header .close span{
		display: block;
		width: 100%;
		height: auto;
		font-size: 40px;
		color: #777;
		background-size: contain;
	}
	.modal-header .close span:hover{
		color: #333;
	}
	.modal-title{
		font-size: 16px;
		line-height: 24px;
	}
	.modal-body .pw1{
		display: flex;
		flex-wrap: nowrap;
	}
	.modal-body .pw p{
		font-size: 15px;
		line-height: 22px;
		font-weight: 500;
	}
	.modal-body .pw1 input#pw{
		display: flex;
		align-items: center;
		width: 100%;
		height: 34px;
		margin: 8px auto 0 auto;
		padding: 0 10px;
		border: 1px solid #e1e1e1;
		border-radius: 5px;
	}
	.modal-body .pw1 input#pw:focus{
		border-color: darkgreen;
		box-shadow: 0 0 20px rgba(0,100,0,0.15);
	}
	.modal-body .pw1 i{
		margin: auto auto auto 10px;
		color: darkgreen;
	}
	.modal-footer{
		display: flex;
		justify-content: center;
	}
	.modal-footer button{
		width: 80px;
		outline: none;
	}
	.modal-footer button.btn-secondary{
	    color: #006400;
	    border-color: #006400;
	    background-color: transparent;
	}
	.modal-footer button.btn-secondary:hover{
		color: #0c400c;
		border-color: #0c400c;
		background-color: #00640010;
	}
	.modal-footer button.btn-primary{
		color: #f9f9f9;
		background-color: #006400;
	}
	.modal-footer button.btn-primary:hover{
		background-color: #0c400c;
	}
		.img_bg{
		position: fixed;
		display: block;
		height: auto;
		background-size: contain;
		opacity: 0.1;
		z-index: -1;
	}
	.img_bg.img_bg1{
		width: 202px;
	    top: 444px;
	    left: 112px;
	    opacity: 0.05;
	    transform: rotate(103deg);
	}
	.img_bg.img_bg2{
		width: 210px;
	    bottom: 422px;
	    right: 42px;
	    opacity: 0.05;
	    transform: rotate(87deg);
	}
	.img_bg.img_bg3{
	    width: 50px;
	    top: 80vh;
	    left: 20vw;
	    opacity: 0.2;
	}
	.img_bg.img_bg4{
	   width: 100px;
	   bottom: 76vh;
	   left: 400px;
	   opacity: 0.05;
	}
	.img_bg.img_bg5{
	    width: 75px;
	    top: 74vh;
	    left: 78vw;
	    opacity: 0.25;
	}
	.img_bg.img_bg6{
	    width: 70px;
	    top: 10vh;
	    right: 20vw;
	    opacity: 0.05;
	}
	</style>
		<meta charset="UTF-8">
		<script type="text/javascript">
		<!-- 모달창 자바스크립트: 내 정보 수정 -->
		// 비밀 글 클릭 시 모달 창 표시
		function pwCheck(num){
			$("#pw").val("");
			$("#pwCheckModal").modal("show");
		};
		///비밀번호 확인 Enter
		function btn_pwcheck(e){
			if(e.key == 'Enter'){
				$('#board').click();
			}
		};
		//비밀번호 확인(유효성 검사,AJAX) 후 창으로 이동
		$(document).ready(function(){		
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
				var num=$('#num').val();
				var pw=$('#pw').val();
				if(pw==""){
					alertShow('비밀번호 입력오류','비밀번호를 입력해주세요.');
					pw.focus();
					return false;
				}
				console.log(num);
				console.log(pw);
				$.ajax({
					type:"post",
					url:"boardPwCheck",
					async:true,
					data:{"num":num, "pw":pw},
					success:function(data){
						if(data==1){
							location.href="boardSelect?num="+num+"&way=detail";	
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
	</script>
	</head>
	<body>
		<div class="board">
			<h1>문의 게시판</h1>
			<!--  글작성 버튼-->
			<div class="button">
				<input type="button" class="inquiry" value="문의하기" onclick="location.href='boardInput'"/>
			</div>
			<div class="page">
				<c:if test="${paging.startPage!=1}">
			      <a href="boardMain?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}"></a>
				</c:if>   
		     	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p"> 
		        	<c:choose>
		           		<c:when test="${p == paging.nowPage}">
		              		<b><span>${p}</span></b>
		            	</c:when>   
		            	<c:when test="${p != paging.nowPage}">
		               		<a href="boardMain?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		            	</c:when>   
		         	</c:choose>
		      	</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="boardMain?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}"></a>
				</c:if>
			</div>
			<!--  조회 화면 -->
			<div class="result">
				<table>
					<tr>
						<th>No.</th>
						<c:if test="${adminlogin}"><th>분 야</th></c:if>
						<th>제 목</th>
						
						<th>답 변</th>
						<th>작 성 자</th>
					</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr><td colspan="3">아직 게시글이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="li">
							<tr>
								<td><input type="hidden" id="num" value="${li.num}">
									${paging.total - li.num + 1}
								</td>
								<c:if test="${adminlogin}"><td>${li.part}</td></c:if>
								<td>
									<div>
										<c:if test="${li.checking=='n'}">
											<img alt="" src="./image/member/logo/keyoff.png">
											<a href="boardDetail?num=${li.num}">${li.title}</a>
										</c:if>
										<c:if test="${li.checking=='y'}">
											<img alt="" src="./image/member/logo/keyon.png">
											<a onclick="pwCheck(${li.num})">${li.title}</a>
										</c:if>
									</div>
								</td>
								<td>
									<c:if test="${li.status=='no'}"><span style="color:#bb0000;">대기</span></c:if>
									<c:if test="${li.status=='yes'}"><span style="color:#999;">완료</span></c:if>
								</td>
								<td>${li.writer}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
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
			<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg1">
			<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg2">
			<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg3">
			<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg4">
			<img alt="야구공 이미지" src="./image/baseball/logo/baseball.png" class="img_bg img_bg5">
			<img alt="축구공 이미지" src="./image/soccer/logo/soccer.png" class="img_bg img_bg6">
	</body>
</html>