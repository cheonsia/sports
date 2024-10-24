<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>굿즈샵</title>
		<style type="text/css">
			.header_team_logo{
				display: none;
			}
			h1{
				margin-top: 0;
				margin-bottom: 50px;
			}
			.main_section{
				width: calc(100% - 40px);
				max-width: 880px;
				margin-top: 60px;
			}
			.flex-container{
				display: flex;
				flex-wrap: wrap;
			}
			.flex-container.space-around{
				justify-content: space-around;
			}
			.flex-item{
				width: calc(50% - 10px);
				height: auto;
				margin: 0 20px 60px 0;
			}
			.flex-item:nth-child(2n){
				margin-right: 0;
			}
			.flex-item img{
				display: block;
				width: 100%;
				max-width: 120px;
				height: auto;
				margin: 0 auto;
				background-size: contain;
			}
			@media (min-width: 700px){
				.flex-item{
					width: calc(25% - 15px);
				}
				.flex-item:nth-child(2n){
					margin-right: 20px;
				}
				.flex-item:nth-child(4n){
					margin-right: 0;
				}
			}
			@media (min-width: 1024px){
				h1{
					margin-bottom: 100px;
				}
				.flex-item{
					width: calc(20% - 16px);
				}
				.flex-item:nth-child(4n){
					margin-right: 20px;
				}
				.flex-item:nth-child(5n){
					margin-right: 0;
				}
			}
		</style>
	</head>
	<body>
		<h1>굿즈샵</h1>
		<div class="flex-container space-around">
			<div class="flex-item">
				<a href="https://teamstore.tigers.co.kr/" target="_blank">
					<img alt="" src="./image/baseball/logo/KIA.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://ktwizstore.co.kr/" target="_blank">
					<img alt="" src="./image/baseball/logo/KT.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://www.lgtwins.com/service/html.ncd?baRq=&baRs=OUT_DS&view=%2Fpc_twins%2Ftwins%2Ftwins_shop&actID=BR_DetailShopMall" target="_blank">
					<img alt="" src="./image/baseball/logo/LG.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://store.ncdinos.com/" target="_blank">
					<img alt="" src="./image/baseball/logo/NC.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://store.ssglanders.com/" target="_blank">
					<img alt="" src="./image/baseball/logo/SSG.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://www.doosanbearswefan.shop/" target="_blank">
					<img alt="" src="./image/baseball/logo/두산.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://www.lottegiantsshop.com/" target="_blank">
					<img alt="" src="./image/baseball/logo/롯데.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://samsunglionsmall.com/" target="_blank">
					<img alt="" src="./image/baseball/logo/삼성.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://interparkmdshop.com/category/%ED%82%A4%EC%9B%80%ED%9E%88%EC%96%B4%EB%A1%9C%EC%A6%88/29/" target="_blank">
					<img alt="" src="./image/baseball/logo/키움.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://eaglesshop.kr/?srsltid=AfmBOoruSGQ_LKdB1cFGCJpyVNlAYUUbT3ISZzB2gj8344-RGDBomiF4" target="_blank">
					<img alt="" src="./image/baseball/logo/한화.png">
				</a>
			</div>
		</div>
	</body>
</html>