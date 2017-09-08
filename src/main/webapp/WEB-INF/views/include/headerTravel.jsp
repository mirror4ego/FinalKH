<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!-- JSTL 사용 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- 메타 데이터 -->
<meta charset="UTF-8" http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">


<!-- css 라이브러리 설정 -->
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.css">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.css">


<!-- js 라이브러리 설정 -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.js"></script>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
   <script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/locale/ko.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Y8Rh4S_7CD4B0earCnEb"></script>


<!-- 스타일 설정 -->
<style>
@font-face {
   font-family: 'Godo';
   font-style: normal;
   font-weight: 400;
   src:
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2')
      format('woff2'),
      url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff')
      format('woff');
}

* {
   font-family: 'Godo';
}
</style>
