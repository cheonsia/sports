<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
	<style type="text/css">
	.header_logo_inner.scroll_inn{
		display: none;
	}
	.main_section{
		margin-top: 20px;
	}
	h1{
		margin-top: 0px;	
	}
	.mainFrame{
		width: 600px;
		margin: 0 auto;
		text-align: center;
	}
	.mainFrame div{
		margin: 15px auto;
		height: 35px;
	}
	.mainFrame label{
		width: 80px;
		text-align: left;
		margin: 0 10px 0 0;
	}
	.mainFrame .select{
		margin: 40px auto;
	}
	.mainFrame select:disabled{
	    width: calc(80% - 22px);
	    height: 40px;
	    border: none;
	    padding: 0 10px;
	    border-radius: 5px;
	    outline: none;
	    color: #000;
	    text-align: center;
	    font-size: 26px;
	    font-weight: bold;
	     -webkit-appearance:none;
         background: none;
	}
	.mainFrame input{
		width: 75%;
		border: none;
		padding: 0 10px; 
		border-radius: 5px;
	}
	.mainFrame .more{
		width: 550px;
		margin: -60px 0 -10px 0 ;
	    text-align: right;
	    position: relative;
	}
	.mainFrame .more img{
		width: 30px;
	}
	.mainFrame .more ul{
		position: absolute;
		right: -75px;
		top: 0;
		background-color: #fff;
		border: 1px solid #0c400c;
		border-radius: 5px;
	}
	.mainFrame .more li{
		padding: 10px 20px;
		list-style: none;
		text-align: center;
	}
	.mainFrame .more li:hover{
		background-color: #0c400c20;		
	}
	.mainFrame .boxing{
		border: 1px solid #0c400c20;
		border-radius: 5px;
		height: auto;
		width: auto;
		padding: 10px 20px;
	}
	.mainFrame .writer,
	.mainFrame .title{
		display: flex;
		align-items: center;
	}
	.mainFrame .title input{
		padding: 0 10px;
		width: 70%;
	}
	.mainFrame .title p{
	    word-break: break-all;	
	    color: #000;
	    font-size: inherit;
	    padding-left: 10px;
	    text-align: left;
	}
	#value:focus,
	.mainFrame select:focus,
	.mainFrame input:focus{
		border-color: #0c400c;
	}
	#value{
		border:none;
		width: 95%;
	    height: 280px;
		border-radius: 5px;
	    padding: 10px 10px 0 10px;	
	}
	.mainFrame input[type="button"]{
		width: 25%;
	    height: 50px;
	    border-radius: 10px;
	    background-color: #fff;
	    border: 1px solid #0c400c;
	    color: #0c400c;
	}
	.mainFrame input[type="button"]:hover{
	    background-color: #0c400c20;
	}
	.mainFrame div.value,
	.mainFrame div.button{
		height: auto;
	}
	.mainFrame div.value label{
		text-align: center;
	}
	.mainFrame .value #textlen{
	    width: 36px;
	    text-align: end;
	    border: none;
	    padding: 0;
	    background-color: transparent;
	}
	.mainFrame p{
		display:block;
	    text-align: right;
	    color: #aaa;
	}
	.mainFrame hr{
		margin: 0;
	}
	.mainFrame .check{
	    align-items: center;
	    display: flex;
	    padding-left: 4px;
	}
	.mainFrame .checking{
		width: 60px;
	    border: none;
	    align-items: center;
	    display: flex;
	    border-radius: 5px;
	}
    #check+span{
		margin: 0 10px;
    	width: 20px;
    	height: 20px;
    	display:block; 
        background-repeat: no-repeat;
        background-image: url('./image/member/logo/keyoff.png'); /*off 이미지*/
        background-size: contain;
    }
    #check:checked+span{
        background-repeat: no-repeat; /* 반복 방지 */
        background-image: url('./image/member/logo/keyon.png'); /*on 이미지*/
        background-size: contain;
    }    
	.mainFrame .comment{
	   width: 100%;
	   max-width: 700px;
	   display: flex;
	   flex-wrap: wrap;
	   justify-content: space-between;
	   margin: 20px auto 0 auto;
	   align-items: center;
	}
	.mainFrame .comment #comment{
		width: 100%;
	    height: 38px;
	    padding: 0 0 0 10px;
	    margin: 0 5px 0 0;
	    border: 1px solid #e8e8e8;
	    border-radius: 5px;
	    text-indent: 10px;
	    line-height: 40px;
	    overflow: hidden;
	}
 	.mainFrame .comment_flex{
	   display: flex;
	   flex-wrap: nowrap;
	   width: 100%;
	}
	.mainFrame .comment input[type="text"]{
	   width: 100%;
	   height: 38px;
	   margin-right: 5px;
	   background-color: #ffffff;
	   border: 1px solid #e1e1e1;
	   border-radius: 5px;
	   padding: 0 10px;
	}
	.mainFrame .comment input[type="text"][name="comment"]{
	   width: 100%;
	   padding: 0 10px;
	}
	.mainFrame .comment input[type="submit"]{
	   display: block;
	   min-width: 88px;
	   width: 88px;
	   max-width: 88px;
	   height: 38px;
	   font-size: 16px;
	   line-height: 38px;
	   color: #006400;
	   padding: 0;
	   margin: 0 auto;
	   background-color: #00640010;
	   border: 1px solid #006400;
	   border-radius: 5px;
	}
	.mainFrame .comment input[type="text"].writer{
	   min-width: 128px;
	   width: 128px;
	   text-align: center;
	   margin-bottom: 5px;
	}
	.mainFrame .commentResult{
	    width: 100%;
	    max-width: 700px;
	    margin: 20px auto 0 auto;
	    height: auto;
	}
	.mainFrame .commentResult hr{
	    width: 100%;
	    margin: 10px auto;
	}
	.mainFrame .commentResult p{
		text-align: left;
	}
	.mainFrame div.eachResult{
	   width: calc(100% - 10px);
	   padding-left: 10px;
	   height: auto;
	}
	.mainFrame .eachResult .p0{
	   font-weight: bold;
	   margin-bottom: 10px;
	}
	.mainFrame .commentvalue{
	   display: flex;
	   flex-wrap: wrap;
	   margin-bottom: 10px;
       height: auto;
	}
	.mainFrame .comment_input{
	   display: none;
	}
	.mainFrame .commentvalue .p1{
	   display: flex;
	   width: 100%;
	   justify-content: flex-start;
	   margin-bottom: 5px;
	   white-space: pre-line;
	}
	.mainFrame .commentvalue textarea{
	   width: 100%;
	   height:auto;
       box-sizing: border-box;
       overflow: hidden; 
       resize: none; 
       wrap: hard;
	}
	.mainFrame .p1 span{
	   word-break: break-all;
	   margin-left: 15px;
	}
	.mainFrame .commentvalue .p1_p2{
	    width: 100%;
	    display: flex;
	    margin: 0;
	}
	.mainFrame .commentvalue .p2{
	   display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    width: 100%;
	    padding-left: 0;
	    margin: 5px auto 0 auto;
	}
	.mainFrame input[type="text"].commentDate{
	   width: 100%;
	   padding: 0;
	}
	.mainFrame .commentvalue .p3{
	   display: flex;
	   justify-content: end;
	    width: 100%;
	   margin: 5px auto 0 auto;
	}
	.mainFrame .commentvalue .p3 a{
	   display: block;
	    color: #006400;
	   border-bottom: 1px solid transparent;
	}
	.mainFrame .commentvalue .p3 a:hover{
	   text-decoration: none;
	   border-color: #006400;
	}
	.mainFrame .commentvalue .p3 a.p3_delete{
	    color: #bb0000;
	}
	.mainFrame .commentvalue .p3 a.p3_delete:hover{
	   border-color: #bb0000;
	}
	.mainFrame .no_show{
	    font-size: 15px;
	    line-height: 20px;
	    font-weight: 400;
	    color: #999;
	    text-align: center;
	    margin: 0 auto;
	    height: auto;
        padding: 30px 0;
	    border: 1px solid #eee;
	    border-radius: 5px;
	}
	
	@media (min-width: 800px){
	   .mainFrame .comment{
	      flex-wrap: nowrap;
	      margin-top: 20px;
	   }
	   .mainFrame .comment input[type="text"].writer{
	      margin-bottom: 0;
	   }
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
	</style>
	<script type="text/javascript">
		function showdata() {
			$('#moredata').attr("hidden",false);
		}
		function hidedata() {
			$('#moredata').attr("hidden",true);
		}
		// 클릭 시 모달 창 표시
		function pwCheck(a){
			$("#way").val(a);
			$("#pw").val("");
			$("#pwCheckModal").modal("show");
		};
		///비밀번호 확인 Enter
		function btn_pwcheck(e){
			if(e.key == 'Enter'){
				$('#board').click();
			}
		};
		function commentDelete(num){
			if(!confirm("정말로 삭제 하시겠습니까?")){
				alert("취소되었습니다.");
			}else{
				alert("삭제 되었습니다.");
				location.href="bcommentdelete?num="+num+"&way=detail";
			}
		}
		function commentUpdate(num){
			var ucomment =$('#commentEdit').val().replace(/\n/g, "<br>");
			if(!confirm("수정하시겠습니까?")){
				alert("취소되었습니다.");
				
			}else{
				alert("수정되었습니다.");
				location.href="bcommentupdate?num="+num+"&ucomment="+ucomment+"&way=detail";
			}
		}
		function commentChange(num){
			var edit = $('#commentValue').val();
			$('#commentValue').prop('hidden', true);
			$('#commentEdit').val(edit);
			$('#commentEdit').prop('hidden', false);
			$('#commentEdit').focus();
			$('#edit_'+num).text('수정하기');
			$('#delete_'+num).text('취소');
			setTimeout(function(){
				$('#edit_'+num).attr('onclick','commentUpdate('+num+')');
				$('#delete_'+num).attr('onclick','reCommentChange('+num+')');
			}, 100);
		}
		function reCommentChange(num){
			$('#edit_'+num).text('수정');
			$('#delete_'+num).text('삭제');
			setTimeout(function(){
				$('#edit_'+num).attr('onclick','commentChange('+num+')');
				$('#delete_'+num).attr('onclick','commentDelete('+num+')');
			}, 100);
		};
		$(document).ready(function(){
			var part= `${dto.part}`;
			$('#part').val(part).prop("selected",true);
			
			var check = `${dto.checking}`;
			(check == 'y') ? $('#check').prop('checked',true) : $('#check').prop('checked',false);
			
			var comment = `${cli.value}`;
			var text = comment.replaceAll("<br>","\r\n");
			$('#commentValue').val(text);
			$('.p1').on( 'keyup', 'textarea', function (e){
		        $(this).css('height', 'auto' );
		        $(this).height( this.scrollHeight );
		      });
		      $('.p1').find( 'textarea' ).keyup();
		    
		<!-- 모달창 자바스크립트: 비밀번호 확인 -->
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
				var pw1=$('#pw1').val();			
				var way=$('#way').val();
				if(pw == ""){
					$("#pwCheckModal").modal("hide");
					alertShow('오류','비밀번호를 입력해주세요.');
					return false;
				}else if(pw !=pw1){
					$("#pwCheckModal").modal("hide");
					alertShow('오류','비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
					return false;			
				}else {
					location.href="boardSelect?num="+num+"&way="+way;
				}
			});
		});
	</script>
</head>
	<body>
		<div class="mainFrame">
			<div class = "select">
				<input type="hidden" name="num" id="num" value="${dto.num}">
				<select name="part" id="part" disabled>
					<option value="login">로그인 관련 문의</option>
					<option value="player">선수 정보 문의</option>
					<option value="content">내용 추가/오류 수정/삭제 문의</option>
					<option value="member">댓글 비방/모욕 신고</option>
					<option value="error">오류 신고</option>
					<option value="etc">기타 문의</option>
				</select>
			</div>
			<div class="more">
				<img alt="" src="./image/member/logo/readmore.png" onmouseover="showdata()">
				<ul id="moredata" hidden="hidden" onmouseleave="hidedata()">
					<c:if test="${adminlogin}"><li onclick="location.href='boardSelect?num=${dto.num}&way=delete'">삭제</li></c:if>
					<c:if test="${!adminlogin}"><li onclick="pwCheck('delete')">삭제</li></c:if>
					<li onclick="pwCheck('update')">수정</li>
					<c:if test="${adminlogin}"><li onclick="location.href='answerComplete?num=${dto.num}'">답변 완료</li></c:if>
				</ul>
				<input type="hidden" name="way" id="way"/>
			</div>
			<div class="boxing">
				<div class ="title">
					<label for ="title"> 제 목 </label>
					<input type="hidden" id="pw1" name="pw1" value="${dto.pw}" readonly> 
					<p>${dto.title}</p>
					 <div class="checking">
						<input type="checkbox" id="check" name="check" value="y" hidden="hidden" onclick="lockcheck()" disabled><span></span>
					 </div>
				</div>
				<div class="writer">
					<label for ="writer"> 작 성 자 </label>
					<input type="text" id="writer" name="writer" value="${dto.writer}" readonly>
				</div>
				<div class="value">
					<label for ="value"> 내 용 </label>
				<hr>
					<textarea id="value" name="value" placeholder="내용을 500자 이내로 입력해주세요" maxlength="500" readonly>${dto.content}</textarea>
				</div>
				<p>${dto.rdate}</p>
			</div>
			<div class="commentResult">
			<c:if test="${dto.step!=0}">
				<div class="eachResult">				
					<p class="p0"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${cli.writer}</p>
					<div class="commentvalue">
						<p class="p1">
						<textarea id="commentEdit" name="commentEdit" hidden="hidden"></textarea>
						<textarea id="commentValue" name="commentValue" readonly></textarea>
						</p>
						<div class="p1_p2">
							<p class="p p2">
								<input type="text" class="commentDate" name="rdate" value="${cli.rdate}" readonly>
							</p>
							<c:if test="${adminlogin}">
								<p class="p3">
									<a href="javascript:void(0)" id="edit_${cli.num}" onclick="commentChange(${cli.num})">수정</a>&emsp;
									<a id="delete_${cli.num}" onclick="commentDelete(${cli.num})">삭제</a>
								</p>
							</c:if>
						</div>
					</div>
				</div><hr>
			</c:if>
			<c:if test="${dto.step==0}">
				<div class="no_show">아직 답변이 없습니다.</div>
				<c:if test="${adminlogin}">
					<form action="boardCommentSave" method="post">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="step" value="${dto.step}">
						<div class="comment">
							<input class="writer" type="text" name="writer" value="관리자" readonly> 
							<textarea id="comment" name="comment" placeholder="답변을 입력해주세요" required></textarea>
							<input type="submit" value="답변 달기">						
						</div>
					</form>
				</c:if>
			</c:if>
			</div>
				<div class="button">
					<input type="button" value="목록으로" onclick="location.href='boardMain'">
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
	</body>
</html>