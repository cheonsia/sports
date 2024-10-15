<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1 {
	font-size: 40px;
	margin-top: 0;
}

body {
    text-align: center;
    padding: 100px;
    background: whitesmoke;
    display: table-cell;
}

button {
    margin: 25px;
}
@media (min-width: 1250px) {
    .main_section {
        margin-top: 70px;
    }
}
.side_rightbar_whole,
.header_team_logo.scroll_div{
	display: none;
}
#footer {
     width: calc(100vw - 40px);
 }
.find-btn{
    display: flex;
    width: 400px;
    flex-direction: column;
    margin: 0 auto;
    border: 3px solid #006400;
    padding: 40px;
    border-radius: 25px;
    
}
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 30px 30px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-green {
    background-color: white;
    height: 40px;
    font-size: x-large;
    color: #0c400c;
    border: 1px solid #0c400c;
}

.w-btn-green:hover {
    background-color: #0c400c80;
    color: #fff;
}
* {
    font-family: 'RIDIBatang';
    font-size: 19px;
    line-height: 41px;
    font-weight: 400;
    color: #3d3d3d;
    margin: 0px;
    padding: 0;
    box-sizing: content-box;
}
</style>
<title>회원가입</title>
</head>
<body>
	<h1>회원 가입</h1>
	<div>회원가입 방식을 선택해주세요.</div>
	<div class="find-btn">
		<button onclick="location.href='signupForm?part=일반'" class="w-btn w-btn-green" type="button">
        일반 회원
    	</button>
    	<button onclick="location.href='signupForm?part=감독'" class="w-btn w-btn-green" type="button">
        감독 회원
    	</button>
	</div> 
</body>
</html>