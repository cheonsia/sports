<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		margin: 0 auto 20px auto;
	}
	td{
		font-size: 20px;
		padding-left: 30px;
		height: 40px;
	}
	h1{
		font-size: 30px;
	}
	.img1{
		text-align: center;
		height: 360px;
	}
	textarea {
	 height: 500px;
	 padding: 20px; 
	 }
	.con{
		width: 100%;
		max-width: 800px;
		margin: 0 auto; 
		border: 1px solid #e8e8e880;
	}
	.p{
		display: flex;
		align-items: center;
	}
	.p img{
	    min-width: 20px;
	    width: 20px;
	    display: block;
	    background-size: contain;
	    height: 20px;
	}
	.p img:hover{
		transform: none;
	}
	
	.p1 img {
		margin-right: 5px;
	}
	.click{
		position: relative;
		display: flex;
    	justify-content: flex-start;
    	align-items: center;
	}
	.click .hovermsg{
		display: none;
		position: absolute;
		padding: 10px;
		left: -50px;
	}
	.click .img{
		margin-right: 15px;
	}
	.likebutton{
		border: 1px solid;
		border-radius: 40px;
	}
	.click:hover .hovermsg{
		display: block;              
	}
	.likebutton:hover{
		background-color: gray;
	}
	.first1{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 0 auto;
	}
	.comment{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 20px auto 0 auto;
		align-items: center;
	}
	.comment input[type="text"]{
		width:100%;
		height:40px;
		border: 1px solid #e8e8e8;
		margin-right: 20px;
		padding-left: 3px;
	}
	.comment input[type="submit"]{
		margin: 0 auto; 
	}
	.comment input[type="text"].writer{
		min-width: 150px;
		width: 100px;
		text-align: center;
	}
	.commentResult{
		padding-left: 25px;
    	width: 800px;
    	margin: 20px auto 0 auto;
	}
	.commentResult hr{
		width: 80%;
	    margin: 10px auto;
	}
	
	.eachResult{
		padding-left: 170px;
	}
	.eachResult .p0{
		font-weight: bold;
	}
	.commentvalue{
		display: flex;
		margin-bottom: 10px;
	}
	.commentvalue .p1{
		display: flex;
	    width: 280px;
   		justify-content: flex-start;
	}
	.commentvalue .p2{
		display: flex;
	    width: 200px;
	    padding-left: 0;
	    justify-content: flex-start;
	}
	.commentvalue .p3{
		display: flex;
	    width: 120px;
	    margin-left: 15px;
	}
	.commentvalue a{
	    display: contents;
	}
	.no_show{
		width: max-content;
		margin: 45px auto;
	}
	.page{
	    display: flex;
	    margin: 0 auto;
   	 	width: max-content;
   	 	align-items:center;
   	 	letter-spacing: 10px;
   	
	}
	.page a{
		color: #939393;
		font-size:15px;
		text-align:center;
	    text-decoration: none;
	}
	.page a:hover{
		color: #000;
		font-size: 18px;
		font-weight: bold;
	}
	.page span{
		color: teal;
		font-size: 18px;
		font-weight: bold;
	}
	.button_align{
		margin: 10px auto 10px auto;
	    width: max-content;
	}
	.button_align input[type="button"]{
		width: 100px;
		height: 40px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".c1_a").click(function(){
			$(this).parent('.p1').parent(".cocomentresult").next('.c1').toggle();
		});	
	});
	
	function heart(playernum,step){
		$.ajax({
			type : "post",
			url : "heart",
			async : true,
			data : {"playernum" : playernum,"step":step},
			success:function(data){
				console.log(step);
				$('#heartresult_'+step).val(data);
			},
			error:function(data){
				alert("오류");
			}
		});		
	}
	
	function commentDelete(playernum,step,play){
		if(!confirm("정말로 삭제 하시겠습니까?")){
			alert("취소되었습니다.");
		}else{
			alert("삭제 되었습니다.");
			location.href="commentdelete?playernum="+playernum+"&step="+step+"&play="+play;
		}
	}
	
	function commentUpdate(playernum,step,play){
		var ucomment =$('#'+playernum+'_'+step).val();
		if(!confirm("수정하시겠습니까?")){
			alert("취소되었습니다.");
			
		}else{
			alert("수정되었습니다.");
			location.href="commentupdate?playernum="+playernum+"&step="+step+"&ucomment="+ucomment+"&play="+play;
		}
	}
	function commentChange(playernum,step,play) {
		$('input[name="comment_val_'+playernum+'_'+step+'"]').prop('readonly', false);
		$('input[name="comment_val_'+playernum+'_'+step+'"]').focus();
		$('#edit_'+playernum+'_'+step).text('수정하기');
		$('#delete_'+playernum+'_'+step).text('취소');

		setTimeout(function(){
			$('#edit_'+playernum+'_'+step).attr('onclick','commentUpdate('+playernum+','+step+',"'+ play +'")');
			$('#delete_'+playernum+'_'+step).attr('onclick','reCommentChange('+playernum+','+step+',"'+play+'")');
		}, 100);
	}
	function reCommentChange(playernum,step,play) {
		$('#edit_'+playernum+'_'+step).text('수정');
		$('#delete_'+playernum+'_'+step).text('삭제');

		setTimeout(function(){
			$('#edit_'+playernum+'_'+step).attr('onclick','commentChange('+playernum+','+step+',"'+play+'")');
			$('#delete_'+playernum+'_'+step).attr('onclick','commentDelete('+playernum+','+step+',"'+play+'")');
		}, 100);
	}
	
</script>
</head>
<body>
<h1>${dto.pname} 선수의 정보</h1>
<table>
	<tr>
		<td rowspan="9">
		<c:choose>
			<c:when test="${dto.play == '축구'}">
				<img class="img1" alt="" src="./image/soccer/player/${dto.pimage}">
			</c:when>
			<c:otherwise>
				<img class="img1" alt="" src="./image/baseball/player/${dto.pimage}">
			</c:otherwise>
		</c:choose> 
		</td>
		<td>소 속:
		<c:choose>
			<c:when test="${dto.play == '축구'}">
				<c:if test="${dto.tname=='kangwon'}">강원</c:if>
	            <c:if test="${dto.tname=='gwangju'}">광주</c:if>
	            <c:if test="${dto.tname=='gimcheon'}">김천</c:if>
	            <c:if test="${dto.tname=='daegu'}">대구</c:if>
	            <c:if test="${dto.tname=='daejeon'}">대전</c:if>
	            <c:if test="${dto.tname=='seoul'}">서울</c:if>
	            <c:if test="${dto.tname=='suwon'}">수원</c:if>
	            <c:if test="${dto.tname=='ulsan'}">울산</c:if>
	            <c:if test="${dto.tname=='incheon'}">인천</c:if>
	            <c:if test="${dto.tname=='jeonbuk'}">전북</c:if>
	            <c:if test="${dto.tname=='jeju'}">제주</c:if>
	            <c:if test="${dto.tname=='pohang'}">포항</c:if>
			</c:when>
			<c:otherwise>
				${dto.tname}
			</c:otherwise>
		</c:choose> 
        </td>
	</tr>
	<tr>
		<td>선 수 이 름: ${dto.pname}</td>
	</tr>
	<tr>
		<td>번 호: ${dto.pnumber}</td>
	</tr>
	<tr>
		<td>생년월일: ${dto.pbirth}</td>
	</tr>
	<tr>
		<td>키: ${dto.height}</td>
	</tr>
	<tr>
		<td>몸무게: ${dto.weight}</td>
	</tr>
	<tr>
		<td>포지션: ${dto.main}</td>
	</tr>
	<tr>
		<td>추가사항: ${dto.pchar}</td>
	</tr>
	<tr>
		<td class="click">	
			<div class="img">
				 <button class="likebutton" type="button" onclick="location.href='clickup?playernum=${dto.playernum}&play=${dto.play}'">
					<c:choose>
						<c:when test="${dto.play == '축구'}">
					 		 <img alt="" src="./image/soccer/logo/soccer.ico" width="40px">
						</c:when>
						<c:otherwise>
							 <img alt="" src="./image/baseball/logo/baseball.ico" width="40px">					
						</c:otherwise>
					</c:choose>
				</button>
			</div>
			<div>
				${dto.clickup} 
				<p class="hovermsg">버튼을 눌러 선수를 응원해주세요!</p>
			</div>
		</td>
	</tr>
</table>
	<!-- 댓글 구현 창 -->
	<form action="commentsave" method="post">
	<input type="hidden" name="playernum" value="${dto.playernum}">
	<input type="hidden" name="play" value="${dto.play}">
	<input type="hidden" name="step" value="${dto.step}">
		<div class="comment">
			<c:choose>
				<c:when test="${normallogin || superlogin}">
					<input type="hidden" name="id" value="${member.id}"> 
					<input class="writer" type="text" name="writer" value="${member.name}" placeholder="작성자" readonly> 
					<input type="text" name="comment" placeholder=" ${dto.pname} 선수에게 응원 메세지 남기기😊" required> 
				</c:when>
				<c:when test="${adminlogin}">
					<input type="hidden" name="id" value="★"> 
					<input class="writer" type="text" name="writer" value="관리자" readonly> 
					<input type="text" name="comment" placeholder="댓글 내용 입력" required> 
				</c:when>
				<c:otherwise>
					<input class="writer" type="text" name="writer" placeholder="작성자" readonly> 
					<input type="text" name="comment" placeholder="댓글은 로그인 후 이용가능합니다." readonly> 
				</c:otherwise>
			</c:choose>
			<input type="submit" value="댓글 달기">
		</div>
	</form>
	<div class="commentResult">
		<c:choose>
			<c:when test="${normallogin || superlogin || adminlogin}">
				<c:if test="${dto.step!=0}">
					<c:forEach items="${clist}" var="cli">
						<div class="eachResult">				
							<p class="p0"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${cli.id}(${fn:substring(cli.writer, 0, cli.writer.length()-1)}○)</p>
							<div class="commentvalue">
								<p class="p1">
								┗<input type="text" value="${cli.ucomment}" id="${cli.playernum}_${cli.step}" name="comment_val_${cli.playernum}_${cli.step}" readonly>&emsp;
								</p>
								<p class="p p2">
								<!--  
										<a href="heart?playernum=${dto.playernum}&step=${cli.step}&play=${dto.play}">				
										</a>
								-->
									<img src="./image/soccer/logo/soccer.ico" width="80px" onclick="heart(${dto.playernum},${cli.step})">
									<input type="text" class="heart" name="heartresult" id="heartresult_${cli.step}" value="${cli.heart}" readonly>
									<input type="text" class="commentDate" name="cdate" value="${cli.cdate}" readonly>
								</p>
								<c:if test="${cli.id == member.id || adminlogin}">
									<p class="p3">
										<a href="javascript:void(0)" id="edit_${cli.playernum}_${cli.step}" onclick="commentChange(${cli.playernum},${cli.step},'${dto.play}')">수정</a>&emsp;
										<a id="delete_${cli.playernum}_${cli.step}" onclick="commentDelete(${cli.playernum},${cli.step},'${dto.play}')">삭제</a>
									</p>
								</c:if>
							</div>
						</div><hr>
					</c:forEach>
					<div class="page">
						<c:if test="${paging.startPage!=1 }">
					      <a href="pagedetail?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}"></a>
						</c:if>   
				     	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p"> 
				        	<c:choose>
				           		<c:when test="${p == paging.nowPage}">
				              		<b><span>${p}</span></b>
				            	</c:when>   
				            	<c:when test="${p != paging.nowPage}">
				               		<a href="playerdetail?playernum=${dto.playernum}&nowPage=${p}&cntPerPage=${paging.cntPerPage}&play=${dto.play}">${p}</a>
				            	</c:when>   
				         	</c:choose>
				      	</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a href="playerdetail?playernum=${dto.playernum}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&play=${dto.play}"></a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${dto.step==0}">
					<div class="no_show">선수에게 첫번째 응원메세지를 남겨주세요.</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<div class="no_show">댓글은 로그인 후 볼 수 있습니다.</div>
			</c:otherwise>
		</c:choose>      
	</div>
	<div class="button_align">
		<input type="button" value="확인" onclick="location.href='selectTeam?name=${dto.tname}&play=${dto.play}'">	
		<c:if test="${superlogin || adminlogin}">
			<input type="button" value="수정" onclick="location.href='playerupdate?playernum=${dto.playernum}&play=${dto.play}'">
			<input type="button" value="삭제" onclick="location.href='goplayerdelete?playernum=${dto.playernum}&play=${dto.play}'">
		</c:if>
	</div>
	
</body>
</html>