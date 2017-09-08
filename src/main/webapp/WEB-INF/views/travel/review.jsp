<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기</title>
<!-- Semantic Ui  -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<style>
#view{padding:60px;}
</style>
<body>
<header>
	<div class="ui fluid container">
		<div class="ui segment">
			<p><%@ include file="../include/headerTravel.jsp"%>
	<%@ include file="../include/menuTravel.jsp"%></p>
		</div>
	</div>
</header>
<section>
	<div class="ui fluid container">
    <div class="ui grid" id="view">
	<c:choose>
		<c:when test="${dto.show == 'y'}">
		<!-- show가 y면 -->	
			<!-- 게시물 상세보기 영역 -->		
          <div class="left floated center aligned ten wide column">
            <h2 class="ui dividing header">${dto.subject}</h2>
          </div>
          <div class="right floated left aligend six wide column">
          	<h5 class="ui left floated dividing header" >${dto.writer}</h5>
            <h5 class="ui left floated dividing header"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/> </h5>
          </div>
          
          <div class="sixteen wide column" >${dto.content}</div>
                 
			<div class="sixteen wide column" style="width:650px; text-align: center;">
				<a ><i class="big red heart icon"></i></a>
				<!-- 게시물번호를 hidden으로 처리 -->
				<input type="hidden" name="boardnum" value="${dto.boardnum}">
				<c:if test="${sessionScope.email == dto.email}">
				<button type="button" class="ui small button" onclick="location.href='${path}/reviewUpdate.do?boardnum=${dto.boardnum}'" >수정</button>
				<button type="button" class="ui small button" onclick="location.href='${path}/reviewDelete.do?boardnum=${dto.boardnum}'" >삭제</button>
				</c:if>			
				<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
				<a class="ui small button" href="${path}/reviewList.do" >목록</a>
			</div>
			<!-- 게시물 상세보기 영역 -->						
			</c:when>
	</c:choose>
	
    </div> <!--  grid -->
  </div><!-- container -->
</section>
<footer>
	<div class="ui fluid container">
		<div class="ui grid">
			<p><%@ include file="../include/footerMain.jsp"%></p>
		</div>
	</div>
</footer>
</body>
</html>