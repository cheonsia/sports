<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>하이라이트</title>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
      <style type="text/css">
         h1{
            margin-top: 0px;
            word-break: auto-phrase;
         }
         .iframe_whole{
            width: 100%;
            max-width: 1120px;
            height: auto;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: start;
            align-items: start;
         }
         .iframe_whole iframe{
            width: 100%;
            margin: 20px 0 0 20px;
         }
         @media (min-width: 768px){
            .iframe_whole iframe{
               width: calc(50% - 30px);
            }
            .iframe_whole iframe:nth-child(2n){
               margin-right: 20px;
            }
         }
         @media (min-width: 1024px){
            .iframe_whole iframe{
               width: calc(33.3% - 26.4px);
            }
            .iframe_whole iframe:nth-child(2n){
               margin-right: 0;
            }
            .iframe_whole iframe:nth-child(3n){
               margin-right: 20px;
            }
         }
         @media (min-width: 1300px){
            .iframe_whole iframe{
               width: calc(25% - 25px);
            }
            .iframe_whole iframe:nth-child(3n){
               margin-right: 0;
            }
            .iframe_whole iframe:nth-child(4n){
               margin-right: 20px;
            }
         }
      </style>
   </head>
   <body>
   <input type="hidden" id="name" value="${name}">
   <p style="text-align: center;">영상은 최신 순으로 50개만 보여집니다.</p>
   <h1>파일을 로드하는데 시간이 걸릴 수 있습니다 :)</h1>
   <div class="iframe_whole"></div>
   <script type="text/javascript">
   $(document).ready(function() {
      var name =$('#name').val()
      var 키 = '키 입력';
      if(name=='ALL') {
         var 채널아이디 = 'UCak5ZEX4BjijJcf7fdppuIQ';
      }else if(name=='kangwon') {
         var 채널아이디 = 'UCuLjoid8kKTKITvkUP94kJA';
      } else if (name=='gwangju') {
         var 채널아이디 = 'UCPLHmQevKu4uTiOh1UjoL4w';
      } else if (name=='gimcheon') {
         var 채널아이디 = 'UCSZ-CvpbBm6JnZnWYmiNrlQ';
      } else if (name=='daegu') {
         var 채널아이디 = 'UCI50QJRCvW1NxwbjB57rGVA';
      } else if (name=='daejeon') {
         var 채널아이디 = 'UCo2pmNaOCgv26neeCAkLj9w';
      } else if (name=='seoul') {
         var 채널아이디 = 'UCXtWUl6qmPtibHVKIXbZlcA';
      } else if (name=='suwon') {
         var 채널아이디 = 'UCHPiDeQQyVcYe-nhyUanSWg';
      } else if (name=='ulsan') {
         var 채널아이디 = 'UCZ8lUWJ0_vZZf-SiNedia7Q';
      } else if (name=='incheon') {
         var 채널아이디 = 'UCGA9gUrYCb4hRk_wHBzB_nQ';
      } else if (name=='jeonbuk') {
         var 채널아이디 = 'UCKxMSkJHBIpn5b4vUQHYliQ';
      } else if (name=='jeju') {
         var 채널아이디 = 'UCQfQeoiJTN2EVqde4_0PlUA';
      } else if (name=='pohang') {
         var 채널아이디 = 'UCOZQIw1I6ixjQZ_va_eCn7w';
      }
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "https://www.googleapis.com/youtube/v3/search?part=id&maxResults=50&order=date&channelId="+채널아이디+"&type=video&key="+키,
            contentType : "application/json",
            success : function(data) {
                data.items.forEach(function(element, index) {
                    $('.iframe_whole').append('<iframe height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
                });
            },
            complete : function(data) {},
            error : function(xhr, status, error) {}
        });
   });
   </script>
   </body>
</html>