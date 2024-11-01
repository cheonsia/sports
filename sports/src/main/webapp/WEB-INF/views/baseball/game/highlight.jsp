<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>하이라이트</title>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
      <p style="text-align: center;">영상은 최신 순으로 50개만 보여집니다.</p>
      <h1>파일을 로드하는데 시간이 걸릴 수 있습니다 :)</h1>
      <div class="iframe_whole"></div>
      <script type="text/javascript">
         $(document).ready(function() {
            var win_pname = decodeURI(window.location.search);
            var win_bname = win_pname.split('&');
            var team = win_bname[0].slice(6);
            teamEng = (team == '두산') ? 'DOOSAN' : (team == '삼성') ? 'SAMSUNG' : (team == '롯데') ? 'LOTTE' : (team == '키움') ? 'KIWOOM' : (team == '한화') ? 'HANHWA' : team;
            $('.header_logo_inner a').removeClass('clicked_on');
            $('#baseball_'+teamEng).addClass('clicked_on');
            var 키 = '키입력';
            if(`${name}`=='ALL') {
               var 채널아이디 = 'UCoVz66yWHzVsXAFG8WhJK9g';
            }else if(`${name}`=='KIA') {
               var 채널아이디 = 'UCKp8knO8a6tSI1oaLjfd9XA';
            } else if (`${name}`=='KT') {
               var 채널아이디 = 'UCvScyjGkBUx2CJDMNAi9Twg';
            } else if (`${name}`=='LG') {
               var 채널아이디 = 'UCL6QZZxb-HR4hCh_eFAnQWA';
            } else if (`${name}`=='NC') {
               var 채널아이디 = 'UC8_FRgynMX8wlGsU6Jh3zKg';
            } else if (`${name}`=='SSG') {
               var 채널아이디 = 'UCt8iRtgjVqm5rJHNl1TUojg';
            } else if (`${name}`=='두산' || `${name}`=='DOOSAN') {
               var 채널아이디 = 'UCsebzRfMhwYfjeBIxNX1brg';
            } else if (`${name}`=='롯데' || `${name}`=='LOTTE') {
               var 채널아이디 = 'UCAZQZdSY5_YrziMPqXi-Zfw';
            } else if (`${name}`=='삼성' || `${name}`=='SAMSUNG') {
               var 채널아이디 = 'UCMWAku3a3h65QpLm63Jf2pw';
            } else if (`${name}`=='키움' || `${name}`=='KIWOOM') {
               var 채널아이디 = 'UC_MA8-XEaVmvyayPzG66IKg';
            } else if (`${name}`=='한화' || `${name}`=='HANHWA') {
               var 채널아이디 = 'UCdq4Ji3772xudYRUatdzRrg';
            }
            $.ajax({
               type : "GET",
               dataType : "json",
               url : "https://www.googleapis.com/youtube/v3/search?part=id&channelId="+채널아이디+"&maxResults=50&order=date&key="+키,
               success : function(data) {
                  data.items.forEach(function(element, index) {
                  $('.iframe_whole').append('<iframe height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');});
               },
               complete : function(data) {},
               error : function(xhr, status, error) {} 
            });
         });
      </script>
   </body>
</html>