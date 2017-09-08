<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.min.js"></script>
<meta name="description" content="SlidesJS is a simple slideshow plugin for jQuery. Packed with a useful set of features to help novice and advanced developers alike create elegant and user-friendly slideshows.">
<meta name="author" content="Nathan Searles">
<title>Insert title here</title>
  <!-- SlidesJS Required (if responsive): Sets the page width to the device width. -->
  <meta name="viewport" content="width=device-width">
  <!-- End SlidesJS Required -->

  <!-- SlidesJS Required: These styles are required if you'd like a responsive slideshow -->
  <style>
    /* Prevent the slideshow from flashing on load */
    #slides {
      display: none
    }

    /* Center the slideshow */
    .container {
      margin: 0 auto
    }

    /* Show active item in the pagination */
    .slidesjs-pagination .active {
      color:red;
    }

    /* Media quires for a responsive layout */

    /* For tablets & smart phones */
    @media (max-width: 767px) {
      body {
        padding-left: 10px;
        padding-right: 10px;
      }
      .container {
        width: auto
      }
    }

    /* For smartphones */
    @media (max-width: 480px) {
      .container {
        width: auto
      }
    }

    /* For smaller displays like laptops */
    @media (min-width: 768px) and (max-width: 979px) {
      .container {
        width: 724px
      }
    }

    /* For larger displays */
    @media (min-width: 1200px) {
      .container {
        width: 1170px
      }
    }
  </style>
  <!-- SlidesJS Required: -->
</head>
</head>
<body>
 <div class="container">
    <div id="slides">
    <c:forEach var = "album" items="${Albumlist}">
         <div><img id="picture"src="../images/mypage/${album.albumpath }">               
         </div> 
    </c:forEach>
    </div>
    <div id="slidesjs-log">Slide <span class="slidesjs-slide-number"></span></div>
  </div>
  <script src="../js/jquery.slides.min.js"></script>
  <script>
    $(function() {
      $('#slides').slidesjs({
        width: 940,
        height: 528,
        callback: {
          loaded: function(number) {
            // Use your browser console to view log
            console.log('SlidesJS: Loaded with slide #' + number);

            // Show start slide in log
            $('#slidesjs-log .slidesjs-slide-number').text(number);
          },
          start: function(number) {
            // Use your browser console to view log
            console.log('SlidesJS: Start Animation on slide #' + number);
          },
          complete: function(number) {
            // Use your browser console to view log
            console.log('SlidesJS: Animation Complete. Current slide is #' + number);

            // Change slide number on animation complete
            $('#slidesjs-log .slidesjs-slide-number').text(number);
          }
        }
      });
    });
  </script>
  <button onclick="window.close()">닫기</button>
</body>
</html>