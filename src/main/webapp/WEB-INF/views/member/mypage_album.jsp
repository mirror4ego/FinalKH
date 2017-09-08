<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/menuTravel.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#divv1 {
	width: 100%;
	height: 100%;
	padding-left:100px;
}

.btn1{
	padding-left:680px;
	padding-bottom:50px;
}

#divv {
	text-align: center;
	width: 300px;
	heigh: 300px;
	padding: 20px 20px 20px 20px;
	float: left;
	margin-bottom:50px;
}

#picture {
	width: 150px;
	height: 150px;
}

a {
	float: right;
	text-decoration: none;
	color: black;
}
#wrap{
	width:1400px;
	margin:0 auto;
	padding-top:100px;
}
</style>
<script language="javascript">
	function showPopup() {
		var id = document.frm.id.value;
		var travel_name = document.frm.travel_name.value;
		var album = "albumWrite.do?id=" + id + "&travel_name=" + travel_name;
		window.open(album, "사진 등록", "width=400, height=300, left=100, top=50");
	}
	function showPopup2() {
		var id = document.frm.id.value;
		var travel_name = document.frm.travel_name.value;
		var albumSlide = "albumSlide.do?id=" + id + "&travel_name="
				+ travel_name;
		window.open(albumSlide, "슬라이드",
				"width=1000, height=1000, left=100, top=50");
	}
</script>

</head>
<body>
	<div id="wrap">
		<!-- <input type="button" value="사진 등록" onclick="showPopup()" /> -->
		<div class="btn1">
			<button class="ui grey button" onclick="showPopup()">사진 등록</button>
		</div>
		<div id="divv1">
			<c:forEach var="album" items="${Albumlist}">
				<div id="divv">
					<%-- <a href="showPopup2()"><img id="picture"src="upload/${album.albumpath }">  </a> --%>
					<a><img id="picture" src="../images/mypage/${album.albumpath}" onclick="showPopup2();"></a>
					<a href="albumDelete.do?albumpath=${album.albumpath}&id=${album.id}&travel_name=${album.travel_name}">삭제</a>
				</div>
			</c:forEach>
	
			<!-- for문이 돌면 사진 여러개라 name이 중복되서 못가져와서 따로빼놓음 id와 travel_name을 가져오기 위해  -->
			<form name="frm">
				<input type="hidden" value="${id}" name="id" /> <input type="hidden"
					value="${travel_name}" name="travel_name" />
			</form>
		</div>
	</div>




</body>
</html>

