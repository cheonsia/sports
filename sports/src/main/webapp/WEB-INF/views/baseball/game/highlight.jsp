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
			<c:when test="${name=='KIA'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCKp8knO8a6tSI1oaLjfd9XA';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/AIdEpLU9qXM?si=f9Hgl3Mfti7nWWrs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/9rncQpQtaDI?si=IVQANbrspEQtXvWn" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/8sDKXawNh4Y?si=RV0tw4UEbKkXSzPb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/7vQZGLx85V8?si=XmZTSx1-9ZRixCvz" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='KT'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCvScyjGkBUx2CJDMNAi9Twg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/iI4PZ04XL-0?si=c3CbGsbi0C2gR9O2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/BgBYTtjq_CA?si=u9839rOxGr1FGFEH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/jwD7OsLKk7Q?si=teRoRA44AaUsu-kJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/4JwkGNPhve4?si=qJdTreWdVdSnPfYq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='LG'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCL6QZZxb-HR4hCh_eFAnQWA';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/_YQQ_SU70Co?si=lN7g_mFKXeTpCzii" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/1v6yttPfz0A?si=mENE17h5o_BCKh43" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/-PZDRFP5GM0?si=0dvBsk_WanLZmPvS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/I46agg-5GLY?si=xcacJc7gdAX_YQO4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='NC'}">
				<script type="text/javascript">
					var 채널아이디 = 'UC8_FRgynMX8wlGsU6Jh3zKg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/ksjgnvgEZrE?si=rsXyZn-bsPCMOnRK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/FA-sPJAuEhk?si=w-xaE91zCeEeOzK3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/mAtkRgMt9AA?si=L1cNcD3CJc3SB-wm" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/dvfPQ1zraBM?si=TNsrqGxC5PFkZWQb" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='SSG'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCt8iRtgjVqm5rJHNl1TUojg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/20Ti9TUC5s4?si=2DpVz_lERstmhUWk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/5LhJHaTQrk4?si=w7a3FYAl--nVbZUF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/1kDZiugKO_o?si=3DAYv2lkUkdvHF-b" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/fS6hTgWPsFQ?si=FpQf5saLDOMM4K1s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='두산'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCsebzRfMhwYfjeBIxNX1brg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/fQ5gTyHJOgo?si=GnuvH2FhGcyr6izt" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/931pT_TvHgU?si=_aKOv6RinX5yThii" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/igPggbPRMac?si=p_quEzgHBU4gumOV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/RyUoPoo0v2A?si=mIqEU3Cz-OjaZ6Id" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='롯데'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCAZQZdSY5_YrziMPqXi-Zfw';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/-tAfgnql03E?si=caUDgPdVi8qZSdlD" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/SwMfneFFnfM?si=RwHuE_y8yQDgBKx8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/y52Xo0BUEeY?si=J0fFfJY8V2EbfzUQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/SdQ5O8rUdG0?si=GayKIHWX_335qlVH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='삼성'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCMWAku3a3h65QpLm63Jf2pw';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/9baqEioj3gc?si=_otntSS9KYmlYNXl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/wOPJ-Hi0SqA?si=JGzZwUb19REo2XKH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/dbUTMFWPVno?si=VLUf9FlfgXp_2dGl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/pXy-DjJym10?si=IcKZqf03fBIWn_ib" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='키움'}">
				<script type="text/javascript">
					var 채널아이디 = 'UC_MA8-XEaVmvyayPzG66IKg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/OHIW9gexjVk?si=wzDSQU06IoN0TYtr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/q5Zua0Zg13g?si=ZHvOWoVejptVkPCY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/LirnMBATwQc?si=H-u_hUX4dRWBqdkP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/_5L756os9Hw?si=7I0t1ih7rnwC4atu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='한화'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCdq4Ji3772xudYRUatdzRrg';
					var 키 = 'key입력';	
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/s3l_SS_WRCs?si=XGOn1Lun4rqSXTxk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/bHTxR7isans?si=rsIrDcgEp3vstOq3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/K9RkIveMUH8?si=zK34uamiMHRha_o-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/MYuinBa--hY?si=EyWfYq0VgTHcWMaa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
			<c:when test="${name=='jeonbuk'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCKxMSkJHBIpn5b4vUQHYliQ';
					var 키 = 'key입력';	
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
					var 키 = 'key입력';	
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
					var 키 = 'key입력';	
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