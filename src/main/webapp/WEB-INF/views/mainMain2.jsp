<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 플래너</title>
<link rel="shortcut icon" type="image/x-icon" href="http://cfile7.uf.tistory.com/image/22127B4153F2F8DF333327" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.js"></script>

<style>
.fileDrop {
	width: 600px;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<style>
/* reset.css */

html,body{width:100%;height:100%;}
body,div,dl,dt,dd,ul,li,ol,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td,table{margin:0;padding:0;}
table{border-collapse:collapse;}
img,fieldset{border:none;}
address,caption,cite,code,em,strong,th{font-style:normal;font-weight:normal;}
ol,ul{list-style:none;}
caption,th{text-align:left;}
h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
q:after,q:before{content:"";}/* 인용표시 없애기 */
abbr,acronym{border:none;}
img,li,input{vertical-align:middle;}/*버티컬 얼라인 기본값은 바톰.*/
hr{display:none;}


table {
	border-collapse: collapse;
}

img, fieldset {
	border: none;
}

address, caption, cite, code, em, strong, th {
	font-style: normal;
	font-weight: normal;
}

ol, ul {
	list-style: none;
}


#article1, #article2{padding-left:150px;}
#article1{padding-top:100px;}
#article1{padding-bottom:70px;}
.logo{padding-left:50px;}


h1, h2, h3, h4, h5, h6 {
	font-weight: normal;
	font-size: 100%;
}

q:after, q:before {
	content: "";
} /* 인용표시 없애기 */
abbr, acronym {
	border: none;
}

img, li, input {
	vertical-align: middle;
} /*버티컬 얼라인 기본값은 바톰.*/
hr {
	display: none;
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

#article1, #article2 {
	padding-left: 150px;
}

#article1 {
	padding-top: 50px;
}

#article1 {
	padding-bottom: 100px;
}

.logo {
	padding-left: 50px;
}


.center {
	text-align: center;
}
.cycle-slideshow, .cycle-slideshow * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.cycle-slideshow {
	width: 45%;
	min-width: 200px;
	max-width: 500px;
	margin: 10px auto;
	padding: 0;
	position: relative;
	background: url(http://malsup.github.com/images/spinner.gif) 50% 50%
		no-repeat;
}
 .cycle-slideshow img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	display: block;

}

.info {
	position: absolute;
	padding-left: 250px;
	padding-top: 10px;
	position: relative;
	right: 50px;
}

.info li {
	float: left;
	padding-right: 20px;
}

.addres strong {
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>

<%@ include file="include/headerTravel.jsp"%>
<body >
	<%@ include file="include/menuTravel.jsp"%>
	<div id="wrap">
		<div id="section">
			<div id="article1" >
				<h2 class="center">국내 여행지</h2>
				
				<div class="cycle-slideshow" 
					data-cycle-fx="scrollHorz"
					data-cycle-timeout="0"
					data-cycle-prev="#prev"
					data-cycle-next="#next">
			
					<c:forEach var="list" items = "${list}">
						<img src="${list.areaimage}" width="250px" heigth="250px"/>
					</c:forEach>
			
				</div>
				<div class="center">
					<a href="#" id="prev">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="next">&gt;&gt;</a>
				</div>
				
				
				
				
			</div><!-- //article1 -->
			
			<div id="article2">
				<h2 class="center">추천 여행지</h2>
				
				<div class="cycle-slideshow" 
					data-cycle-fx="scrollHorz"
					data-cycle-timeout="0"
					data-cycle-prev="#prev2"
					data-cycle-next="#next2">
			
					<c:forEach var="list" items = "${list}">
						<img src="${list.areaimage}" width="250px" heigth="250px"/>
					</c:forEach>
			
				</div>
				<div class="center">
					<a href="#" id="prev2">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="next2">&gt;&gt;</a>
				</div>

			</div><!-- //article2 -->
		
		</div><!-- //section -->
		

		<%@include file="include/footerMain.jsp" %>

		
	</div><!-- //wrap -->

</body>
</html>