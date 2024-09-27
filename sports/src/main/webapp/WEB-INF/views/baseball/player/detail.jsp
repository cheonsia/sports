<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		margin: 0 auto;
	}
	td{
		font-size: 24px;
		padding-left: 30px;
	}
	h1{
		font-size: 40px;
	}
	.img1{
		text-align: center;
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
		margin-top: -5px;
		margin-right: 5px;
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
	.commentresult{
		display: flex;
		flex-wrap: wrap;
		min-width: 800px;
		max-width: 800px; 
		margin: 10px auto 0 auto; 
	}
	.commentresult .p2{
		display: flex; 
		justify-content: flex-start;
		max-width: 800px;
		margin: 0 auto;
		text-align: left;
	}
	.commentresult .p1{
		display: flex; 
		justify-content: space-between;
		max-width: 800px;
		margin: 0 auto;
		text-align: left;
	}
	.commentresult .p1 a{
		display: flex; 
		justify-content: space-between;
		align-items: center;
	}
	.c1{
		width: 100%;
	}
	.cocomment{
		max-width: 400px;
	}
	.comment.cocomment input[type="text"].writer{
		min-width: 100px;
		max-width: 100px;
		display: block;
	}
	.indent_span{
		display: block;
		width: 50px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".c1_a").click(function(){
			$(this).parent('.p1').parent(".cocomentresult").next('.c1').toggle();
			console.log('sd');
		});		
	});
	function commentDelete(playernum,step){
		var pnumber = $("#pnumber").val();
		var teamarea = $("#teamarea").val();
		if(!confirm("정말로 삭제 하시겠습니까?")){
			alert("삭제가 취소되었습니다.");
			
		}else{
			alert("삭제되었습니다.");
			location.href="baseballcommentdelete?playernum="+playernum+"&step="+step+"&pnumber="+pnumber+"&teamarea="+teamarea;
		}
	}
	function commentUpdate(playernum,step){
		var ucomment =$('#'+playernum+'_'+step).val();
		var pnumber = $("#pnumber").val();
		var teamarea = $("#teamarea").val();
		if(!confirm("수정하시겠습니까?")){
			alert("수정이 취소되었습니다.");
			
		}else{
			alert("수정이 완료되었습니다.");
			location.href="baseballcommentupdate?playernum="+playernum+"&step="+step+"&pnumber="+pnumber+"&teamarea="+teamarea+"&ucomment="+ucomment;
		}
	}
	function commentChange(playernum,step) {
		$('input[name="comment_val_'+playernum+'_'+step+'"]').prop('readonly', false);
		$('input[name="comment_val_'+playernum+'_'+step+'"]').focus();
		$('#btn_'+playernum+'_'+step).text('수정하기');

		setTimeout(function(){
			$('#btn_'+playernum+'_'+step).attr('onclick','commentUpdate('+playernum+','+step+')');
		}, 2000);
	}
</script>
</head>
<body>
<h1>${dto.pname} 선수의 정보</h1>
<input type="hidden" value="${playernum}" id="playernum" name="playernum">
<input type="hidden" value="${dto.pnumber}" id="pnum" name="pnum">
<input type="hidden" value="${teamarea}" id="teamarea" name="teamarea">
<table align="center">
	<tr>
		<td rowspan="8">
			<div class="img1">
			<img alt="" src="./image/baseball/player/${dto.pimage}" width="300px">
			</div>
		</td>
		<td>소속: ${dto.tname}
        </td>
	</tr>
	<tr>
		<td>선수이름: ${dto.pname}</td>
	</tr>
	<tr>
		<td>번호: ${dto.pnumber}</td>
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
		<td>	
			<div class="img">
				<!-- <a href="clickup?pnumber=${dto.pnumber}">
					<img alt="" src="./image/soccer/logo/soccer.ico" width="50px" style="text-align: center;">
				</a>
				 -->
				 <button type="button" onclick="location.href='baseballclickup?playernum=${dto.playernum}&pnumber=${dto.pnumber}&tname=${dto.tname}&teamarea=${teamarea}'">
					<img alt="" src="./image/baseball/logo/baseball.ico" width="50px">
				 </button>
			</div>
		</td>
		<td> ${dto.clickup} </td>
	</tr>
</table>
	<c:if test="${dto.step!=0}">
		<c:forEach items="${clist}" var="cli">
			<input type="hidden" name="pnumber" id="pnumber"  value="${dto.pnumber}">
			<input type="hidden" name="teamarea" id="teamarea" value="${teamarea}">
			<div class="commentresult">
				<div class="cocomentresult">
					<p class="p2 p">
						<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${cli.writer}
					</p>
					<div>
					<p class="p1 p">┗</p>
					<input type="text" value="${cli.ucomment}" id="${cli.playernum}_${cli.step}" name="comment_val_${cli.playernum}_${cli.step}" readonly>&emsp;
					<p class="p1 p">
						${cli.cdate}&emsp;
							<a href="baseballheart?playernum=${dto.playernum}&writer=${cli.writer}&ucomment=${cli.ucomment}&pnumber=${dto.pnumber}">
								<img src="./image/baseball/logo/baseball.ico" height="80px">
								${cli.heart}
							</a>&emsp;&emsp;&emsp;&emsp;&emsp;
						<!-- 
						<a onclick="commentUpdate(${cli.playernum},${cli.step})" >수정</a>&emsp;
						 -->
						<a href="javascript:void(0)" id="btn_${cli.playernum}_${cli.step}" onclick="commentChange(${cli.playernum},${cli.step})">수정</a>&emsp;
						<a onclick="commentDelete(${cli.playernum},${cli.step})">삭제</a>
					</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	
	<form action="baseballcommentsave" method="post">
	<input type="hidden" name="playernum" value="${dto.playernum}">
	<input type="hidden" name="teamarea" value="${teamarea}">
	<input type="hidden" name="pnumber" value="${dto.pnumber}">
	<input type="hidden" name="step" value="${dto.step}">
	<input type="hidden" name="indent" value="${dto.indent}">
	<input type="hidden" name="tname" value="${dto.tname}">
		<div class="comment">
			<input class="writer" type="text" name="writer" placeholder="작성자"> 
			<input type="text" name="comment" placeholder="작성한 댓글은 삭제 및 수정 불가능하오니 신중하게 작성 부탁드립니다:)"> 
			<input type="submit" value="댓글 달기">
		</div>
	</form>
	
	<input type="button" value="이전페이지" onclick="location.href='selectTeam?name=${dto.tname}&area=${teamarea}'">
	
	<input type="button" value="수정" onclick="location.href='baseballplayerupdate?playernum=${dto.playernum}'">
	<input type="button" value="삭제" onclick="location.href='baseballpdeleteview?playernum=${dto.playernum}'">
	
</body>
</html>