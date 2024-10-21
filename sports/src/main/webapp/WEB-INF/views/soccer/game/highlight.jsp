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
			var 채널아이디 = 'UCak5ZEX4BjijJcf7fdppuIQ';
			var 키 = 'API키 입력';
		} else if (`${name}`=='kangwon') {
			var 채널아이디 = 'UCuLjoid8kKTKITvkUP94kJA';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='gwangju') {
			var 채널아이디 = 'UCPLHmQevKu4uTiOh1UjoL4w';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='gimcheon') {
			var 채널아이디 = 'UCSZ-CvpbBm6JnZnWYmiNrlQ';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='daegu') {
			var 채널아이디 = 'UCI50QJRCvW1NxwbjB57rGVA';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='daejeon') {
			var 채널아이디 = 'UCo2pmNaOCgv26neeCAkLj9w';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='seoul') {
			var 채널아이디 = 'UCXtWUl6qmPtibHVKIXbZlcA';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='suwon') {
			var 채널아이디 = 'UCHPiDeQQyVcYe-nhyUanSWg';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='ulsan') {
			var 채널아이디 = 'UCZ8lUWJ0_vZZf-SiNedia7Q';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='incheon') {
			var 채널아이디 = 'UCGA9gUrYCb4hRk_wHBzB_nQ';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='jeonbuk') {
			var 채널아이디 = 'UCKxMSkJHBIpn5b4vUQHYliQ';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='jeju') {
			var 채널아이디 = 'UCQfQeoiJTN2EVqde4_0PlUA';
			var 키 = 'API키 입력';			
		} else if (`${name}`=='pohang') {
			var 채널아이디 = 'UCOZQIw1I6ixjQZ_va_eCn7w';
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