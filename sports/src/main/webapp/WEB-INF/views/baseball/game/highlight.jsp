<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>하이라이트</title>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	</head>
	<body>
	<h1>파일을 로드하는데 시간이 걸릴 수 있습니다 :)</h1>
	<script type="text/javascript">
		if(`${name}`=='ALL') {
			var 채널아이디 = 'UCoVz66yWHzVsXAFG8WhJK9g';
			var 키 = 'API키 입력';
		}else if(`${name}`=='KIA') {
			var 채널아이디 = 'UCKp8knO8a6tSI1oaLjfd9XA';
			var 키 = 'API키 입력';
		} else if (`${name}`=='KT') {
			var 채널아이디 = 'UCvScyjGkBUx2CJDMNAi9Twg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='LG') {
			var 채널아이디 = 'UCL6QZZxb-HR4hCh_eFAnQWA';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='NC') {
			var 채널아이디 = 'UC8_FRgynMX8wlGsU6Jh3zKg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='SSG') {
			var 채널아이디 = 'UCt8iRtgjVqm5rJHNl1TUojg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='두산' || `${name}`=='DOOSAN') {
			var 채널아이디 = 'UCsebzRfMhwYfjeBIxNX1brg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='롯데' || `${name}`=='LOTTE') {
			var 채널아이디 = 'UCAZQZdSY5_YrziMPqXi-Zfw';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='삼성' || `${name}`=='SAMSUNG') {
			var 채널아이디 = 'UCMWAku3a3h65QpLm63Jf2pw';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='키움' || `${name}`=='KIWOOM') {
			var 채널아이디 = 'UC_MA8-XEaVmvyayPzG66IKg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='한화' || `${name}`=='HANHWA') {
			var 채널아이디 = 'UCdq4Ji3772xudYRUatdzRrg';
			var 키 = 'API키 입력';			
		}
		
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=50&order=date&key="+키,
			success : function(data) {
				data.items.forEach(function(element, index) {
					$('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');});
			},
			complete : function(data) {},
			error : function(xhr, status, error) {} 
	});
	</script>
	</body>
</html>