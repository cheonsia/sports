<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선수 상세 정보</title>
		<style type="text/css">
			.soccer,
			.soccer *{
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			.baseball,
			.baseball *{
				cursor: url('./image/baseball/cursor/cursor2.png'), auto !important;
			}
			.main_section{
				width: calc(100% - 40px);
				margin-top: 105px;
			}
			h1{
				font-size: 30px;
				margin-top: 0;
			}
			table{
				table-layout: fixed;
				width: 100%;
				max-width: 700px;
				margin: 0 auto 20px auto;
			}
			td{
				height: auto;
				font-size: 16px;
				color: #333;
			}
			td.playerImg{
				display: block;
				width: 100%;
				margin: 0 auto;
			}
			td div{
				display: block;
			}
			td p{
				display: inline-block;
				min-width: 100px;
				width: 100px;
				max-width: 100px;
				font-size: 14px;
				line-height: 24px;
				color: #777777;
				margin: 0;
			}
			td p + p{
				min-width: auto;
				width: 100%;
				max-width: none;
				font-size: 16px;
				color: #3d3d3d;
				margin: 5px 0 20px 0;
			}
			td:nth-child(2) input,
			td:nth-child(2) input:hover{
				width: 100%;
				height: 24px;
				color: #3d3d3d;
				border: none;
				outline: none;
				padding: 0;
				margin: 5px auto 20px auto;
			}
			td:nth-child(2){
				display: flex;
				align-items: center;
			}
			.img1{
				width: 100%;
				height: 480px;
				text-align: center;
				border-radius: 10px;
				overflow: hidden;
				object-fit: cover;
				margin: 0 auto 40px auto;
			}
			textarea{
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
			.soccer .p img:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .p img:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.p1 img{
				margin-right: 5px;
			}
			.click{
				position: relative;
				height: auto;
				display: flex;
			 	justify-content: end;
			 	align-items: center;
			 	margin-top: 20px;
		    }
		    td.click p{
			 	min-width: auto;
			 	width: max-content;
			 	max-width: none;
			 	font-size: 18px;
			 	line-height: 27px;
			 	font-weight: bold;
			 	color: #333;
		    }
			.click .hovermsg{
				display: none;
				position: absolute;
				min-width: auto;
				width: 150px;
				max-width: 150px;
				line-height: 20px;
				color: #f9f9f9;
				text-align: center;
				border-radius: 5px;
				padding: 10px 20px;
				top: 20px;
				right: 0;
				background-color: #00640080;
				word-break: break-word;
			}
			.click .img{
				margin-right: 15px;
			}
			.click div + div{
				font-size: 20px;
				font-weight: bold;
			}
			.likebutton{
				width: 38px;
				height: 38px;
				border: 1px solid #e1e1e1;
				border-radius: 40px;
				background-color: #f9f9f9;
			}
			.soccer .likebutton,
			.soccer .likebutton *{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .likebutton,
			.baseball .likebutton *{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.likebutton img{
				width: 100%;
				height: auto;
				background-size: contain;
			}
			.click:hover .hovermsg{
				display: block;	  
			}
			.likebutton:hover{
				border-color: #006400;
				background-color: #00640020;
			}
			.baseball .likebutton:hover{
				border-color: #bb0000;
				background-color: #bb000020;
			}
			.first1{
				display: flex; 
				justify-content: space-between;
				max-width: 800px; 
				margin: 0 auto;
			}
			.comment{
				width: 100%;
				max-width: 700px;
				display: flex;
				flex-wrap: wrap;
				justify-content: space-between;
				margin: 20px auto 0 auto;
				align-items: center;
			}
			.comment_flex{
				display: flex;
				flex-wrap: nowrap;
				width: 100%;
			}
			.comment input[type="text"]{
				width: 100%;
				height: 38px;
				margin-right: 5px;
				background-color: #ffffff;
				border: 1px solid #e1e1e1;
				border-radius: 5px;
				padding: 0 10px;
			}
			.comment input[type="text"][name="comment"]{
				width: 100%;
			}
			.comment input[type="submit"]{
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
			.soccer .comment input[type="submit"]:hover{
				background-color: #00640015;
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .comment input[type="submit"]:hover{
				color: #bb0000;
				border-color: #bb0000;
				background-color: #bb000015;
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.comment input[type="text"].writer{
				min-width: 128px;
				width: 128px;
				text-align: center;
				margin-bottom: 5px;
			}
			.soccer .comment input[type="text"].writer{
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			.baseball .comment input[type="text"].writer{
				cursor: url('./image/baseball/cursor/cursor2.png'), auto !important;
			}
			.commentResult{
				position: relative;
			 	width: 100%;
			 	max-width: 700px;
			 	margin: 20px auto 0 auto;
			}
			.no_login.commentResult{
				min-height: 240px;
				max-height: 240px;
				overflow: hidden;
			}
			.no_login_txt{
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				background-color: #ffffff70;
				z-index: 1;
			}
			.no_login_txt img{
				width: auto;
				height: 100%;
				background-size: contain;
			    filter: blur(7px);
			}
			.no_login_txt p{
				position: absolute;
				font-size: 18px;
				line-height: 27px;
				font-weight: 400;
				color: #999;
				text-align: center;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			.commentResult hr{
				width: 100%;
			    margin: 10px auto;
			}
			.eachResult{
				width: calc(100% - 10px);
				padding-left: 10px;
			}
			.eachResult .p0{
				font-weight: bold;
				margin-bottom: 10px;
			}
			.commentvalue{
				display: flex;
				flex-wrap: wrap;
				margin-bottom: 10px;
			}
			.comment_input{
				display: none;
			}
			.commentvalue .p1{
				display: flex;
			    width: 100%;
				justify-content: flex-start;
				margin-bottom: 5px;
			}
			.p1 span{
				word-break: break-all;
				margin-left: 15px;
			}
			.commentvalue .p2{
				display: flex;
			    justify-content: flex-start;
			    align-items: center;
			    /*width: 200px;*/
			    width: 100%;
			    padding-left: 0;
			    margin: 5px auto 0 auto;
			}
			input[type="text"].heart{
				width: 28px;
				padding: 0 15px 0 5px;
			}
			input[type="text"].commentDate{
				width: 100px;
				padding: 0;
			}
			.soccer input[type="text"].heart:hover,
			.soccer input[type="text"].commentDate:hover{
				cursor: url('./image/soccer/cursor/cursor.png'), auto !important;
			}
			.baseball input[type="text"].heart:hover,
			.baseball input[type="text"].commentDate:hover{
				cursor: url('./image/baseball/cursor/cursor2.png'), auto !important;
			}
			.commentvalue .p3{
				display: flex;
				justify-content: end;
			    /*width: 120px;*/
			    width: 100%;
				margin: 5px auto 0 auto;
			}
			.commentvalue .p3 a{
				display: block;
			    color: #006400;
				border-bottom: 1px solid transparent;
			}
			.commentvalue .p3 a:hover{
				text-decoration: none;
				border-color: #006400;
			}
			.commentvalue .p3 a.p3_delete{
			    color: #bb0000;
			}
			.commentvalue .p3 a.p3_delete:hover{
				border-color: #bb0000;
			}
			.soccer .commentvalue .p3 a:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .commentvalue .p3 a:hover *,
			.baseball .commentvalue .p3 a:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.no_show{
				font-size: 15px;
				line-height: 22px;
				font-weight: 400;
				color: #999;
				text-align: center;
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
				display: block;
				width: 20px;
				min-width: 20px;
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
				display: block;
				width: 20px;
				min-width: 20px;
				color: #006400;
				font-size: 18px;
				font-weight: bold;
				text-align: center;
			}
			.soccer .page span:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .page span:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.button_align{
			    display: flex;
			    flex-wrap: nowrap;
			    justify-content: center;
			    align-items: center;
			    width: 100%;
				margin: 50px auto 80px auto;
			}
			.button_align input[type="button"]{
				width: 100%;
				max-width: 118px;
				height: 48px;
				font-size: 16px;
				line-height: 24px;
				font-weight: 400;
				color: #006400;
				background-color: transparent;
				border: 1px solid #006400;
				border-radius: 5px;
			}
			.soccer .button_align input[type="button"]:hover{
				cursor: url('./image/soccer/cursor/pointer.png'), auto !important;
			}
			.baseball .button_align input[type="button"]:hover{
				cursor: url('./image/baseball/cursor/pointer2.png'), auto !important;
			}
			.button_align input[type="button"] + input[type="button"]{
				margin-left: 10px;
			}
			.button_align input[type="button"].btn_confirm{
				color: #f9f9f9;
				background-color: #006400;
			}
			.button_align input[type="button"].btn_confirm:hover{
				background-color: #0c400c;
			}
			.button_align input[type="button"].btn_change:hover{
				background-color: #00640015;
				border-color: #0c400c;
			}
			.button_align input[type="button"].btn_delete{
				color: #bb0000;
				border-color: #bb0000;
			}
			.button_align input[type="button"].btn_delete:hover{
				color: #bb0000;
				border-color: #bb0000;
				background-color: #bb000015;
			}
			@media (min-width: 600px){
				.img1{
					width: calc(100% - 30px);
					height: 400px;
					margin: 0 30px 0 0;
				}
				td.playerImg{
					display: revert;
					width: 250px;
					max-width: 250px;
				}
				td div{
					display: flex;
				}
				tr{
					height: 30px;
				}
				td{
					height: 30px;
				}
				td:nth-child(2) input{
					margin: 0 0 0 10px;
				}
				td p{
					font-size: 16px;
				}
				td p + p{
					font-size: 18px;
					margin: 0 0 0 10px;
				}
				.click .hovermsg{
					font-weight: 400;
					line-height: 24px;
				}
			}
			@media (min-width: 800px){
				.comment{
					flex-wrap: nowrap;
					margin-top: 50px;
				}
				.comment input[type="text"].writer{
					margin-bottom: 0;
				}
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				var name;
				var team = `${dto.tname}`;
				if (team=='kangwon') name='강원';
				if (team=='gwangju') name='광주';
				if (team=='gimcheon') name='김천';
				if (team=='daegu') name='대구';
				if (team=='daejeon') name='대전';
				if (team=='seoul') name='서울';
				if (team=='suwon') name='수원';
				if (team=='ulsan') name='울산';
				if (team=='incheon') name='인천';
				if (team=='jeonbuk') name='전북';
				if (team=='jeju') name='제주';
				if (team=='pohang') name='포항';
				if (team=='KIA')name='KIA';
		        if (team=='KT')name='KT';
		        if (team=='LG')name='LG';
		        if (team=='NC')name='NC';
		        if (team=='SSG')name='SSG';
		        if (team=='DOOSAN')name='두산';
		        if (team=='LOTTE')name='롯데';
		        if (team=='SAMSUNG')name='삼성';
		        if (team=='KIWOOM')name='키움';
		        if (team=='HANHWA')name='한화';
				$("#team").text(name);	
				$(".c1_a").click(function(){
					$(this).parent('.p1').parent(".cocomentresult").next('.c1').toggle();
				});
			});
			function heart(playernum,step){
				$.ajax({
					type : "post",
					url : "heart",
					async : true,
					data :{"playernum" : playernum,"step":step},
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
			function commentChange(playernum,step,play){
				$('#span_'+playernum+'_'+step).hide();
				$('input[name="comment_val_'+playernum+'_'+step+'"]').show();
				$('input[name="comment_val_'+playernum+'_'+step+'"]').prop('readonly', false);
				$('input[name="comment_val_'+playernum+'_'+step+'"]').focus();
				$('#edit_'+playernum+'_'+step).text('수정하기');
				$('#delete_'+playernum+'_'+step).text('취소');
				setTimeout(function(){
					$('#edit_'+playernum+'_'+step).attr('onclick','commentUpdate('+playernum+','+step+',"'+ play +'")');
					$('#delete_'+playernum+'_'+step).attr('onclick','reCommentChange('+playernum+','+step+',"'+play+'")');
				}, 100);
			}
			function reCommentChange(playernum,step,play){
				$('#span_'+playernum+'_'+step).show();
				$('input[name="comment_val_'+playernum+'_'+step+'"]').hide();
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
		<div class="<c:if test="${dto.play == '축구'}">soccer</c:if><c:if test="${dto.play == '야구'}">baseball</c:if>">
			<h1>'${dto.pname}' 선수의 정보</h1>
			<table>
				<tr>
					<td rowspan="9" class="playerImg">
						<c:choose>
							<c:when test="${dto.play == '축구'}">
								<img class="img1" alt="" src="./image/soccer/player/${dto.pimage}">
							</c:when>
							<c:otherwise>
								<img class="img1" alt="" src="./image/baseball/player/${dto.pimage}">
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<div>
							<p>소속</p>
							<p id="team">${dto.tname}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>선수이름</p>
							<p>${dto.pname}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>번호</p>
							<p>${dto.pnumber}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>생년월일</p>
							<p>${dto.pbirth}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>키</p>
							<p>${dto.height}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>몸무게</p>
							<p>${dto.weight}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>포지션</p>
							<p>${dto.main}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<p>추가사항</p>
							<p>${dto.pchar}</p>
						</div>
					</td>
				</tr>
				<tr>
					<td class="click">	
						<div class="img">
							 <button class="likebutton" type="button" onclick="location.href='clickup?playernum=${dto.playernum}&play=${dto.play}'">
								<c:choose>
									<c:when test="${dto.play == '축구'}">
								 		 <img alt="" src="./image/soccer/logo/soccer.png" width="40px">
									</c:when>
									<c:otherwise>
										 <img alt="" src="./image/baseball/logo/baseball.png" width="40px">					
									</c:otherwise>
								</c:choose>
							</button>
						</div>
						<div>
							<p>${dto.clickup}</p>
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
							<div class="comment_flex">
								<input type="text" name="comment" placeholder=" ${dto.pname} 선수에게 응원 메세지 남기기😊" required> 
								<input type="submit" value="댓글 달기">
							</div>
						</c:when>
						<c:when test="${adminlogin}">
							<input type="hidden" name="id" value="★"> 
							<input class="writer" type="text" name="writer" value="관리자" readonly> 
							<div class="comment_flex">
								<input type="text" name="comment" placeholder="댓글 내용 입력" required> 
								<input type="submit" value="댓글 달기">
							</div>
						</c:when>
						<c:otherwise>
							<input class="writer" type="text" name="writer" placeholder="작성자" readonly> 
							<div class="comment_flex">
								<input type="text" name="comment" placeholder="댓글은 로그인 후 이용가능합니다." readonly> 
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
			<div class="<c:if test="${!normallogin && !superlogin && !adminlogin}">no_login </c:if>commentResult">
				<c:if test="${!normallogin && !superlogin && !adminlogin}">
					<div class="no_login_txt">
						<img alt="로그인 전 이미지" src="./image/common/no_login_comment.png">
						<p>로그인 후 보실 수 있습니다.</p>
					</div>
				</c:if>
				<c:if test="${normallogin || superlogin || adminlogin}">
					<c:if test="${dto.step!=0}">
						<c:forEach items="${clist}" var="cli">
							<div class="eachResult">				
								<p class="p0"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${cli.id}(${fn:substring(cli.writer, 0, cli.writer.length()-2)}*${fn:substring(cli.writer, cli.writer.length()-1, cli.writer.length())})</p>
								<div class="commentvalue">
									<p class="p1">
										┗
										<span id="span_${cli.playernum}_${cli.step}">${cli.ucomment}</span>
										<input type="text" class="comment_input" value="${cli.ucomment}" id="${cli.playernum}_${cli.step}" name="comment_val_${cli.playernum}_${cli.step}" readonly>&emsp;
									</p>
									<p class="p p2">
										<c:if test="${dto.play == '축구'}">
											<img src="./image/soccer/logo/soccer.png" width="80px" onclick="heart(${dto.playernum},${cli.step})">
										</c:if>
										<c:if test="${dto.play == '야구'}">
											<img src="./image/baseball/logo/baseball.png" width="80px" onclick="heart(${dto.playernum},${cli.step})">
										</c:if>
										<input type="text" class="heart" name="heartresult" id="heartresult_${cli.step}" value="${cli.heart}" readonly>
										<input type="text" class="commentDate" name="cdate" value="${cli.cdate}" readonly>
									</p>
									<c:if test="${cli.id == member.id || adminlogin}">
										<p class="p3">
											<a href="javascript:void(0)" id="edit_${cli.playernum}_${cli.step}" onclick="commentChange(${cli.playernum},${cli.step},'${dto.play}')">수정</a>&emsp;
											<a href="javascript:void(0)" class="p3_delete" id="delete_${cli.playernum}_${cli.step}" onclick="commentDelete(${cli.playernum},${cli.step},'${dto.play}')">삭제</a>
										</p>
									</c:if>
								</div>
							</div>
							<hr>
						</c:forEach>
						<div class="page">
							<c:if test="${paging.startPage!=1 }">
						      <a href="pagedetail?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}"></a>
							</c:if>
					  		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					     		<c:choose>
					        		<c:when test="${p == paging.nowPage}">
						  				<span>${p}</span>
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
				</c:if>
				<c:if test="${!normallogin || !superlogin || !adminlogin}">
				</c:if>
			</div>
			<div class="button_align">
				<input type="button" class="btn_confirm" value="확인" onclick="location.href='selectTeam?name=${dto.tname}&play=${dto.play}'">	
				<c:if test="${superlogin || adminlogin}">
					<input type="button" class="btn_change" value="수정" onclick="location.href='playerupdate?playernum=${dto.playernum}&play=${dto.play}'">
					<input type="button" class="btn_delete" value="삭제" onclick="location.href='goplayerdelete?playernum=${dto.playernum}&play=${dto.play}'">
				</c:if>
			</div>
		</div>
	</body>
</html>