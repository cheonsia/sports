<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><t:insertAttribute name="title"/></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="./css/common.css">
		<link rel="stylesheet" href="./css/header.css">
		<link rel="stylesheet" href="./css/footer.css">
		<link rel="stylesheet" href="./css/soccer.css">
		<link rel="shortcut icon" href="./image/soccer/logo/soccer.ico">
	</head>
	<body>
		<div id="container">
			<div id="top">
				<t:insertAttribute name="top"/>
			</div>
			<div id="body">
				<div class="main_section">
					<t:insertAttribute name="body"/>
				</div>
			</div>
		</div>
		<div id="footer">
			<t:insertAttribute name="footer"/>
		</div>
	</body>
</html>
