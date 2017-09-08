<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 헤더 메뉴 공간 -->
<div class="ui fluid container">

	<div class="ui violet inverted segment">
		<div class="ui labeled icon fixed menu">
				<a class="item" href="${path}/"><img src="${path}/images/logo.jpg" alt="logo"/><!-- <i class="skyatlas big icon"></i>메인 --></a>
				<a class="item" href="${path}/travel/howToUse.do"><i class="help circle icon"></i>이용방법</a>
				<a class="item" href="${path}/travel/sightRough.do"><i class="camera retro icon"></i>관광지</a>
				<a class="item" href="${path}/travel/gallery.do"><i class="image icon"></i>갤러리</a>
				<a class="item" href="${path}/travel/travelTip.do"><i class="book icon"></i>여행팁</a>
				<a class="item" 
	            <c:choose>
	               <c:when test="${sessionScope.userid == null }">
	                  href="javascript:loginForm()"
	               </c:when>
	               <c:when test="${sessionScope.userid != null }">
	                  href="${path}/travel/createPlan.do"
	               </c:when>
	            </c:choose>
	            ><i class="map icon"></i>여행플랜</a>
				<a class="item" href="${path}/itinerary/list.do"><i class="map signs icon"></i>여행일정</a>
				<a class="item" href="${path}/reviewList.do"><i class="book icon"></i>여행후기</a>
				
			<div class="right menu">
				<a class="item" href="${path}/sample/sample.do"><i class="cube orange icon"></i>예제</a>				
	<c:choose>
                <c:when test="${sessionScope.userid == null}">
                   <a class="item" href="javascript:loginForm()"><i class="sign in red icon"></i>로그인</a>
                </c:when>
                <c:when test="${sessionScope.userid != null and sessionScope.gradename == '관리자' }">
                   <a class="item" href="${path}/member/mypageMain.do?id=${sessionScope.email }"><i class="spy black icon"></i>관리자님!</a>
                   <a class="item" href="${path}/member/logout_test.do"><i class="sign out red icon"></i>로그아웃</a>

                </c:when>
                <c:when test="${sessionScope.userid != null and sessionScope.gradename == '일반' }">
                   <a class="item" href="${path}/member/mypageMain.do?id=${sessionScope.email }"><i class="user circle blue icon"></i>${sessionScope.userid }님!</a>
                   <a class="item" href="${path}/member/logout_test.do"><i class="sign out red icon"></i> 로그아웃</a>
                </c:when>
             </c:choose>
				
				
				
				
			</div>
		</div>
	</div>

</div>
<!-- DIMMER 처리된 회원가입 페이지  -->
<div class="ui container">
   <div class="ui basic loginForm modal" style="width:450px; text-align:center; margin-left:-250px;">
         <%@ include file="../include/include-loginForm.jsp"%>
   </div>
</div>
<script>
function loginForm() {
   $('.ui.loginForm.modal')
     .modal({
        onHide : function(){
           document.getElementById("email").value = "";
           document.getElementById("password").value = "";
        }
     })
     .modal('show');
}
</script>
<c:if test="${msg =='failure' }">
   <script>$('.ui.loginForm.modal').modal('show');
   alert("It is wrong about your E-mail or Password");
   </script>
   
</c:if>