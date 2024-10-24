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
					margin-bottom: 90px;
				}
			}
		</style>
	</head>
	<body>
		<h1>굿즈샵</h1>
		<div class="flex-container space-around">
			<div class="flex-item">
				<a href="https://gangwon-fc.imweb.me/" target="_blank">
					<img alt="" src="./image/soccer/logo/강원.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://www.gjfcshop.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/광주.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://gimcheonfcshop.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/김천.png">
				</a>
			</div>
			<div class="flex-item">
				<a href="https://daegufcmall.co.kr/" target="_blank">
					<img alt="" src="./image/soccer/logo/대구.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://mbp.hanabank.com/oneqplus.jsp?MENUM/mbp/resource/html/BCUS/BCUS13/" target="_blank">
					<img alt="" src="./image/soccer/logo/대전.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://m.fcseoul.com/fcapp/shop/main" target="_blank">
					<img alt="" src="./image/soccer/logo/서울.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://www.suwonfcshop.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/수원.png">
				</a>
			</div>
			<div class="flex-item color-blue">
				<a href="https://uhdshop.co.kr/" target="_blank">
					<img alt="" src="./image/soccer/logo/울산.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://www.incheonutdmarket.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/인천.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://shop.hyundai-motorsfc.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/전북.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://www.jeju-utd-fanstore.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/제주.png">
				</a>
			</div>
			<div class="flex-item color-green">
				<a href="https://www.fcphshop.com/" target="_blank">
					<img alt="" src="./image/soccer/logo/포항.png">
				</a>
			</div>
		</div>
	</body>
</html>