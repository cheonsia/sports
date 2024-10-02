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
	<h1>파일을 로드하는데 시간이 걸릴 수 있습니다 :)</h1>
		<c:choose>
		<c:when test="${name=='KIA'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCKp8knO8a6tSI1oaLjfd9XA&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='KT'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCvScyjGkBUx2CJDMNAi9Twg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='LG'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCL6QZZxb-HR4hCh_eFAnQWA&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='NC'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UC8_FRgynMX8wlGsU6Jh3zKg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='SSG'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCt8iRtgjVqm5rJHNl1TUojg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='두산'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCsebzRfMhwYfjeBIxNX1brg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='롯데'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCAZQZdSY5_YrziMPqXi-Zfw&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='삼성'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCMWAku3a3h65QpLm63Jf2pw&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='키움'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UC_MA8-XEaVmvyayPzG66IKg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
		<c:when test="${name=='한화'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCdq4Ji3772xudYRUatdzRrg&type=video&key=key값 입력",
			            contentType : "application/json",
			            success : function(data) {
			                data.items.forEach(function(element, index) {
			                    $('.main_section').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			                });
			            },
			            complete : function(data) {
			            },
			            error : function(xhr, status, error) {
			                console.log("유튜브 요청 에러: "+error);
			            }
			        });
			    });
			</script>
		</c:when>
			<c:when test="${name=='한화'}">
				<script type="text/javascript">
					var 채널아이디 = 'UCdq4Ji3772xudYRUatdzRrg';
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
					<iframe width="560" height="315" src="https://www.youtube.com/embed/s3l_SS_WRCs?si=XGOn1Lun4rqSXTxk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/bHTxR7isans?si=rsIrDcgEp3vstOq3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/K9RkIveMUH8?si=zK34uamiMHRha_o-" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/MYuinBa--hY?si=EyWfYq0VgTHcWMaa" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>