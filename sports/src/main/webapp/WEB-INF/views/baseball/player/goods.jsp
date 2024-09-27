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
        	<a href="https://teamstore.tigers.co.kr/">
				<img alt="" src="./image/baseball/logo/KIA.png">
			</a>
        </div>
        <div class="flex-item">
        	<a href="https://ktwizstore.co.kr/">
				<img alt="" src="./image/baseball/logo/KT.png">
			</a>
        </div>
        <div class="flex-item">
        	<a href="https://www.lgtwins.com/service/html.ncd?baRq=&baRs=OUT_DS&view=%2Fpc_twins%2Ftwins%2Ftwins_shop&actID=BR_DetailShopMall">
				<img alt="" src="./image/baseball/logo/LG.png">
			</a>
        </div>
    </div>
    <div class="flex-container space-around">
        <div class="flex-item">
        	<a href="https://store.ncdinos.com/">
				<img alt="" src="./image/baseball/logo/NC.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://store.ssglanders.com/">
				<img alt="" src="./image/baseball/logo/SSG.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://www.doosanbearswefan.shop/">
				<img alt="" src="./image/baseball/logo/두산.png">
			</a>
        </div>
        <div class="flex-item color-blue">
        	<a href="https://www.lottegiantsshop.com/">
				<img alt="" src="./image/baseball/logo/롯데.png">
			</a>
        </div>
    </div>
    <div class="flex-container space-around">
        <div class="flex-item color-blue">
        	<a href="https://samsunglionsmall.com/">
				<img alt="" src="./image/baseball/logo/삼성.png">
			</a>
        </div>
        <div class="flex-item color-green">
        	<a href="https://interparkmdshop.com/category/%ED%82%A4%EC%9B%80%ED%9E%88%EC%96%B4%EB%A1%9C%EC%A6%88/29/">
				<img alt="" src="./image/baseball/logo/키움.png">
			</a>
        </div>
        <div class="flex-item color-green">
        	<a href="https://eaglesshop.kr/?srsltid=AfmBOoruSGQ_LKdB1cFGCJpyVNlAYUUbT3ISZzB2gj8344-RGDBomiF4">
				<img alt="" src="./image/baseball/logo/한화.png">
			</a>
        </div>
    </div>
</body>
</html>