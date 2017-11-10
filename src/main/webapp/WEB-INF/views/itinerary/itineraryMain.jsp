<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>여행일정</title>
<head>
<title>사진 갤러리</title>
<%@ include file="../include/headerTravel.jsp"%>
</head>
<body>
	<%@ include file="../include/menuTravel.jsp"%>
	<div class='ui fluid container'>
		<div class='ui grid'>
			<div class='sixteen wide column'>
				<div class='ui segment'></div>
			</div>
			<div class='sixteen wide column'>
				<div class='ui inverted red segment' style='margin:10px;'>
					<font size="5">여행 일정</font>
				</div>
			</div>
			
			<div class='sixteen wide column' id='mainColumn'>
					<div class="ui centered link cards" id='itineraryCards'>
						<!-- 카드 들어가는 공간-->

			
  

	<c:forEach var="iti" items="${list}">
	  <c:set var="src" value="" />
		  <div class="ui card" id='componentColumn' planMainNum='${iti.planMainNum }' style='margin-top:100px;'>
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
				<img src="http://americanconstruction.net/wp-content/uploads/2015/10/upload-empty.png">
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
	</c:forEach>
					</div>
			</div>
			
			
			
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