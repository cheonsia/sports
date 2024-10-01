<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>하이라이트</title>
	</head>
	<body>
	<!-- 전북 -->
		<c:choose>
			<c:when test="${name=='kangwon'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCuLjoid8kKTKITvkUP94kJA';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/B6pnXcc-u48?si=xeSB3lIUgzmyFqdY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/XjzLlafaYS8?si=DMZBqP3cYqXe1ilZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/RVSZi2tVwFo?si=70X_8uEmFZkNVua-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/sqBKg0Avg_U?si=Rnmn0stWS4dGb7c4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='gwangju'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCPLHmQevKu4uTiOh1UjoL4w';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/BT-K1mH09m0?si=XsbFA2tfVqAFJazg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/fb7l_7T187Q?si=dYh_P4B77m2MPtTE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/QnxxUBm68js?si=RhJbGLWF1FWHBGtT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/Dv0e_N9j2f4?si=B3Ha0RACw_R4OaKj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='gimcheon'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCSZ-CvpbBm6JnZnWYmiNrlQ';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/sQYK03t8HVA?si=YYovlc5vFhQOCGHD" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/RzZVBY89Z9s?si=ekyEfAOm3EhJX8Nk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/TEfo3H10d_k?si=n--g9Kzybw_aOMNJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/t0M22V7ONYw?si=qT28OkmgWrY6MAMo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='daegu'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCI50QJRCvW1NxwbjB57rGVA';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/Cpqj3AKNUIc?si=7eVMap-Knhcz7hUY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/De9AIYxHkAE?si=nyKPMvo7Zw4JzCOK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/AQXFV3gHZ9E?si=bV1JPzTn0dIhqQ6O" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/q9aAYm2Np4s?si=tIw1Ua1e6f6XX6QN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='jeonbuk'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCKxMSkJHBIpn5b4vUQHYliQ';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/qQAH8IjkNnY?si=FhzqiBQm2ynMAvaL" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/HZTBG-R4a4w?si=_d40HT8IiL6NyYw-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/1wm6wXN2YYs?si=oU4csrPCbL_68tK8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/ue7PgsbRxtU?si=a4rcKNqIB3Dj65qa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='daejeon'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCo2pmNaOCgv26neeCAkLj9w';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/oVSb6TDd2Rw?si=LRQ-Jfe4IF1dUoix" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/Sd3hMAjKkkA?si=Vtz4E65-eC7WcPSJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/llvljSGeTUs?si=fkjsuMCP9fKhtrAK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/3eZ2b2RatLg?si=EfLUeRJV13Z46gYJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='seoul'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCXtWUl6qmPtibHVKIXbZlcA';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/mxl2VNbmtvg?si=8Ce0N5lceJM-TYVl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/SQ8kGP2laiM?si=-jcAFjVx8xr4AToR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/fLmDB7S7zpE?si=tQU_199e9Wb_V37K" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/hlLY0ulD_cU?si=-N9QglklgGr3tu-l" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='suwon'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCHPiDeQQyVcYe-nhyUanSWg';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/UnovBf6KNhs?si=d7W2IaYvlRhsxWHD" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/UEWIPHW-ZGk?si=P5bhYKEZIAq1IVtP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/LBbwE6kvbss?si=SJ0QbPFa0YBvTbCx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/Rbxaq0vrrxc?si=V5XjB8dlcHz5zkh2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='ulsan'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCZ8lUWJ0_vZZf-SiNedia7Q';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/hAb6LncolBs?si=jeJk3ppHBf-km32H" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/BDTt1NpIQv4?si=cS2iDvPBgDw1S1oz" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/m4XcRrvkoGo?si=Vicu6JQ6jAB56AA6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/bZHejA1-S-Y?si=aEsY9rHFZT7iGM6N" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='incheon'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCGA9gUrYCb4hRk_wHBzB_nQ';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/4bYnfZHeThA?si=9LFR9LHaVJoj29Bv" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/jogLTp1wAr8?si=XDVDFJ4heXTI297Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/l9BRadA0OCA?si=uqfMxi1_bZ5-r1XA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/QhXTEu64iCw?si=HktSMqbej5MOYLke" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='jeonbuk'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCKxMSkJHBIpn5b4vUQHYliQ';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/qQAH8IjkNnY?si=FhzqiBQm2ynMAvaL" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/HZTBG-R4a4w?si=_d40HT8IiL6NyYw-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/1wm6wXN2YYs?si=oU4csrPCbL_68tK8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/ue7PgsbRxtU?si=a4rcKNqIB3Dj65qa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='jeju'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCQfQeoiJTN2EVqde4_0PlUA';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/voddXnrPGiM?si=jYmJzViK6aEuxh1_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/flZ7BQFFcc4?si=ckV8ESEvIAJLWo_B" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/sFec2N4aJg0?si=AHDB5ivzAQ7sYKrg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/9l4_tDmNCVY?si=d6FhOHpYIt3EnFO-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='pohang'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCOZQIw1I6ixjQZ_va_eCn7w';
					var 키 = 'AIzaSyBS60Akd3NsIblBL--MaopBa3_HheVXyqE';	
					$.ajax({
							type : "GET",
							dataType : "json",
							url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=4&order=date&type=video&key="+키,
							success : function(data) {},
							complete : function(data) {},
							error : function(xhr, status, error) {} 
						});
				</script>
				<div>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/XcNegyYB1h8?si=sySnbhrmBBzVx_Ef" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/17phQHbi2sw?si=WJOP2qzEMqKjgHNF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/gYQdPemaLro?si=3hYOS9QV_67rVCuW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/0RcoUFenLlU?si=_CSzZhXK4pJg0baa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>