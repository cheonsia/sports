<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.flex-container{
            display: flex;
            padding: 10px;
            border-radius: 10px;
            margin-top: 50px;
   			padding-bottom: 67px;
        }
        .flex-container.space-around{justify-content: space-around;}

        .flex-item{
            width: 50px;
            height: 50px;
            margin: 5px;
            color: white;
            font-size: 36px;
            text-align: center;
        }
        .img{
        	width: 150px;
        }
</style>
</head>
<body>
	<h1>굿즈샵</h1>
	
	<div class="flex-container space-around">
        <div class="flex-item">
        	<a href="https://gangwon-fc.imweb.me/">
				<img alt="" src="./image/soccer/logo/강원.png">
			</a>
        </div>
        <div class="flex-item">
        	<a href="https://www.gjfcshop.com/">
				<img alt="" src="./image/soccer/logo/광주.png">
			</a>
        </div>
        <div class="flex-item">
        	<a href="https://gimcheonfcshop.com/">
				<img alt="" src="./image/soccer/logo/김천.png">
			</a>
        </div>
        <div class="flex-item">
        	<a href="https://daegufcmall.co.kr/">
				<img alt="" src="./image/soccer/logo/대구.png">
			</a>
        </div>
    </div>
    <div class="flex-container space-around">
        <div class="flex-item color-blue">
        	<a href="https://mbp.hanabank.com/oneqplus.jsp?MENUM/mbp/resource/html/BCUS/BCUS13/">
				<img alt="" src="./image/soccer/logo/대전.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://m.fcseoul.com/fcapp/shop/main">
				<img alt="" src="./image/soccer/logo/서울.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://www.suwonfcshop.com/">
				<img alt="" src="./image/soccer/logo/수원.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://uhdshop.co.kr/">
				<img alt="" src="./image/soccer/logo/울산.png">
			</a>
        </div>
    </div>
    <div class="flex-container space-around">
        <div class="flex-item color-green">
        	<a href="https://www.incheonutdmarket.com/">
				<img alt="" src="./image/soccer/logo/인천.png">
			</a>
        </div>
        <div class="flex-item color-green">
        	<a href="https://shop.hyundai-motorsfc.com/">
				<img alt="" src="./image/soccer/logo/전북.png">
			</a>
        </div>
        <div class="flex-item color-green">
        	<a href="https://www.jeju-utd-fanstore.com/">
				<img alt="" src="./image/soccer/logo/제주.png">
			</a>
        </div>
        <div class="flex-item color-green">
        	<a href="https://www.fcphshop.com/">
				<img alt="" src="./image/soccer/logo/포항.png">
			</a>
        </div>
    </div>
</body>
</html>