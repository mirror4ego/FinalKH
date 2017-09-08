<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Itinerary(여행계획)</title>
<%@ include file="../include/header.jsp" %>		<!-- header travel 포함 -->
<%@ include file="../include/menuTravel.jsp" %>
  <!-- Standard Meta -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->

  <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script><script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-P4TVZ6N"></script><script src="assets/library/jquery.min.js"></script>
  <script src="assets/library/iframe.js"></script>

  <style type="text/css">
    body > .ui.container {
      margin-top: 3em;
    }
    iframe {
      border: none;
      width: calc(100% + 2em);
      margin: 0em -1em;
      height: 300px;
    }
    iframe html {
      overflow: hidden;
    }
    iframe body {
      padding: 0em;
    }

    .ui.container > h1 {
      font-size: 3em;
      text-align: center;
      font-weight: normal;
    }
    .ui.container > h2.dividing.header {
      font-size: 2em;
      font-weight: normal;
      margin: 2em 0em 5em;
    }
	.column {
	  margin-top: 8em;
	}

    .ui.table {
      table-layout: fixed;
    }
  </style>
</head>
<body>
<div class="ui itinerary container">
  <h1 align="center">인기 여행일정</h1>
  <h2 class="ui dividing header" align="center">다른 여행자들의 일정을 참고해 나만의 여행을 계획해보세요!</h2>
  
  <div class="ui four column very relaxed grid" id='mainColumn'>
	<c:forEach var="iti" items="${list}">
	  <c:set var="src" value="" />
	  <div class="main column" id='componentColumn' planMainNum='${iti.planMainNum }'>
		<div class="ui link cards">
		  <div class="ui card">
		  	<span class="right top">
		  	  ${iti.planMainNum }
		  	</span>
		  	
		  	
			<a class="image">
			  <c:forEach var="ini" items="${list2 }">
				<c:set var="main" value="${iti.planMainNum }" />
				<c:set var="area" value="${ini.planMainNum }" />
				<c:if test="${main eq area }">
				  <c:if test="${empty src }">
					<c:set var="src" value="${ini.areaImage }" />
					<img src="${src }">
				  </c:if>
				</c:if>
			  </c:forEach>
			  <c:if test="${empty src }">
				<img src="http://alhayat-altayba.com/images/empty.png">
			  </c:if>
			</a>
			<div class="content">
			  <a class="header" href="#">${iti.title}</a>
			  <div class="meta">
				<span class="date">
			  	  <c:forEach var="ini" items="${list2 }">
					<c:set var="main" value="${iti.planMainNum }" />
					<c:set var="area" value="${ini.planMainNum }" />
					<c:if test="${main eq area }">
					  ${ini.areaName }
					</c:if>
				  </c:forEach>
				</span>
			  </div>
				<div class="description">
				
				
				
			  </div>
			</div>
			<div class="extra content">
			  
			  <span class="right floated">
        		<fmt:formatDate value="${iti.startDay}" pattern="yyyy.MM.dd" />
    		  </span>
			  <span>
				<i class="user icon"></i>
				${iti.userId}
			  </span>
			</div>
		  </div>
		</div>
	  </div>
	</c:forEach>
  </div>
</div>
<script>
console.log($('#mainColumn').find('#componentColumn').attr('planMainNum'));
$(document).on('click', '#componentColumn', function(){
	var planMainNum = $(this).attr('planMainNum');
	console.log($(this).attr('planMainNum'));
	location.href="${path}/itinerary/showPlan.do?"+"planMainNum="+planMainNum;
});
</script>
</body>
</html>