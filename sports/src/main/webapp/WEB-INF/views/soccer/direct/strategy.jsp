<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>코치 캘린더</title>
		<style type="text/css">
		
		</style>
	</head>
	<body>
		<h1>전략</h1>
		<p class="common_subtitle_txt">
			선수 이미지를 옮겨 전략을 구성해보세요.
			<br/>
			이미지 저장을 누르시면 자동으로 캘린더에 저장됩니다.
		</p>
		<c:choose>
			<c:when test="${areaset}">
				<input type="hidden" value="${area.area_eng}" id="area_eng" name="area_eng">
			</c:when>
		</c:choose>
	</body>
</html>