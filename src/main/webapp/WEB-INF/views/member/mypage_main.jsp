<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/menuTravel.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
}

body, div, dl, dt, dd, ul, li, ol, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, p, blockquote, th, td, table {
	margin: 0;
	padding: 0;
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

caption, th {
	text-align: left;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: normal;
	font-size: 100%
}

q:after, q:before {
	content: ""
}

abbr, acronym {
	border: none;
}

img, li {
	vertical-align: middle;
}

hr {
	display: none;
}

#skipnavi, .blind {
	position: absolute;
	left: 0;
	top: 0;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	overflow: hidden;
	visibility: hidden;
}

body {
	font-size: 12px;
}

a {
	text-decoration: none;
	color: #666;
}

a:hover {
	text-decoration: underline;
	color: #000;
}

strong, th {
	font-weight: bold;
}

#wrap {
	width: 1500px;
	margin: 0 auto;
	margin-bottom:50px;
}

#article1 {
	width: 250px;
	height: 300px;
	float: left;
	margin: 60px;
	padding-top:40px;
}

#article2 {
	width: 75%;
	height: auto;
	border: 1px solid grey;
	float: left;
	padding-left:40px;
	
	
}
.table {
	width: 200px;
	height: 300px;
	border: 1px solid gray;
	float: left;
	margin: 50px;
	padding-top: 10px;
	padding-bottom: 0px;
	text-align:center;
}
.table1 {
	width: 200px;
	height: 300px;
	float: left;
	margin: 50px;
	padding-top: 20px;
	padding-bottom: 50px;
}
.table .button{
	margin-left:0px;
}
.table1 .button{
	margin-left:70px;
}

#section{
	padding-top:250px;
	padding-bottom:200px;
}
#footer{
	padding-top:20px;
}
</style>
<script>
function showPopup12() { 
	  var id = document.frm123.id.value;
	  var travel ="travelWrite.do?id="+id;	  
	  window.open(travel, "여행 등록", "width=400, height=300, left=100, top=50"); 
	  } 
</script>
</head>
<body>
	<div id="wrap">
		<div id="section">

			<div id="article1">
				<div class="ui card">
  <div class="image">
    <img class="imagee" src="../images/mypage/profile.PNG">
  </div>
  <div class="content">
    <a class="header">${id}</a>
    
  </div>
  <div class="extra content">
    <button class="ui button" onclick="location.href='mypageUpdatemember.do?id=${id }'">정보수정</button>
  </div>
</div>

			</div>
			<!-- article1 -->

			
			 
			 <form name=frm123>
				<div id="article2"  class="ui stacked segment">
				<c:forEach var = "travel" items="${Travellist}">
				<!-- <form action="mypageJourney.do"> -->
					<table class="table">
						<tr>
							<td colspan="2"><img src="../images/mypage/map.PNG" alt="지도" width=200px /></td>
						</tr>
						<tr >
							<td colspan="2"><label name="journey_name" width=200px>${travel.travel_name}</label></td>
							
						</tr>
						<tr>
							 <td>
							 	<input class="ui button" type="button" value="플래너 보기" onclick="location.href='mypageJourney.do?id=${travel.id}&travel_name=${travel.travel_name}'" />
							 </td>
							 <td>
							 	<input class="ui button" type="button" value="플래너 삭제" onclick="location.href='travelDelete.do?id=${travel.id}&travel_name=${travel.travel_name}'" />
							 	
							 </td> 
						</tr>
					</table></c:forEach>
					<%-- <form name="frm123"><input type="hidden" name="id" value=${Travellist.id }></form> --%>
					<table class="table1">
						<tr>
							<td>
								<!-- <input type="button" value="여행추가" onclick="showPopup12()"style="width: 200px" /> -->
								<button class="ui button" onclick="showPopup12()">여행추가</button>
							</td>
							<td>
								<input type="hidden" name="id" value=${id }>
							</td> 
						</tr>
					</table>
				</div><!-- article2 -->
				</form>		  	
		</div>
		<!-- section -->
		
		<%@ include file="../include/footerMain.jsp" %>
	</div>
	<!-- wrap -->

</body>
</html>