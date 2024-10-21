<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">
	.header_logo_inner.scroll_inn{
		display: none;
	}
	.main_section{
		margin-top: 40px;
	}
	h1{
		margin-top: 0px;	
	}
	.mainFrame{
		width: 500px;
		margin: 0 auto;
		text-align: center;
	}
	.mainFrame label{
		width: 80px;
		text-align: left;
	}
	.mainFrame select{
		width: 80%;
		border: 1px solid #e8e8e8;
	}
	.mainFrame input{
		width: 75%;
		border: 1px solid #e8e8e8;
	}
	#value{
		border: 1px solid #e8e8e8;
		width: 100%;
		height: 200px;
	}
	</style>
		<meta charset="UTF-8">
	</head>
	<body>
		<h1>문 의 하 기</h1>
		<form action="boardSave" method="post">
			<div class="mainFrame">
				<div>
					<label for ="part">분 류	</label>
					<select name="part" id="part">
						<option value="login">로그인 관련 문의</option>
						<option value="player">선수 정보 관련 문의</option>
						<option value="content">내용 추가/수정/삭제 문의</option>
						<option value="member">댓글 비방/모욕 신고</option>
						<option value="etc">기타 문의</option>
					</select>
				</div>
				<div>
					<label for ="title"> 제 목 </label>
					<input type="text" id="title" name="title">
				</div>
				<div>
					<label for ="writer"> 작 성 자 </label>
					<input type="text" id="writer" name="writer">
				</div>
				<div>
					<label for ="pw"> 비 밀 번 호 </label>
					<input type="password" id="pw" name="pw">
				</div>
				<div>
					<label for ="value"> 내 용 </label>
					<textarea id="value" name="value" placeholder="내용을 500자 이내로 입력해주세요"></textarea>
				</div>
				<div>
					<input type="submit" value="작성하기">
				</div>
			</div>
		</form>
	</body>
</html>