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
	<c:choose>
		<c:when test="${name=='kangwon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCuLjoid8kKTKITvkUP94kJA&type=video&key=key입력",
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
		<c:when test="${name=='gwangju'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCPLHmQevKu4uTiOh1UjoL4w&type=video&key=key입력",
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
		<c:when test="${name=='gimcheon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCSZ-CvpbBm6JnZnWYmiNrlQ&type=video&key=key입력",
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
		<c:when test="${name=='gimcheon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCSZ-CvpbBm6JnZnWYmiNrlQ&type=video&key=key입력",
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
		<c:when test="${name=='gimcheon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCSZ-CvpbBm6JnZnWYmiNrlQ&type=video&key=key입력",
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
		<c:when test="${name=='daegu'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCI50QJRCvW1NxwbjB57rGVA&type=video&key=key입력",
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
		<c:when test="${name=='daejeon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCo2pmNaOCgv26neeCAkLj9w&type=video&key=key입력",
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
		<c:when test="${name=='seoul'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCXtWUl6qmPtibHVKIXbZlcA&type=video&key=key입력",
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
		<c:when test="${name=='suwon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCHPiDeQQyVcYe-nhyUanSWg&type=video&key=key입력",
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
		<c:when test="${name=='ulsan'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCZ8lUWJ0_vZZf-SiNedia7Q&type=video&key=key입력",
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
		<c:when test="${name=='incheon'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCGA9gUrYCb4hRk_wHBzB_nQ&type=video&key=key입력",
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
		<c:when test="${name=='jeonbuk'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCKxMSkJHBIpn5b4vUQHYliQ&type=video&key=key입력",
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
		<c:when test="${name=='jeju'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCQfQeoiJTN2EVqde4_0PlUA&type=video&key=key입력",
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
		<c:when test="${name=='pohang'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            dataType: "json",
			            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UCOZQIw1I6ixjQZ_va_eCn7w&type=video&key=key입력",
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
	</c:choose>
<body>
</body>
	</body>
</html>