<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/menuTravel.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>
<script src='fullcalendar/fullcalendar.js'></script>
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

h1, h2, h4, h5, h6 {
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
/* main.css */
/* common */
body {
	font-size: 12px;
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

a {
	text-decoration:none;
	color: #666;
}

a:hover {
	text-decoration: underline;
	color: #000;
}

strong, th {
	font-weight: bold;
}

h3 {
	font-size: 25px;
	color:rgb(140,140,140);
}

#article1 {
	width: 410px;
	height: 500px;
	margin: 70px;
	float: left;
	margin-right: 200px;
}

#article2 {
	width: 410px;
	height: 500px;
	margin: 70px;
	float: left;
	padding-right: 0px;
}

#calendar {
	width: 500px;
	height: 500px;
}

#article2:after {
	content: "";
	display: block;
	clear: both;
}

#article3 {
	width: 410px;
	height: 600px;
	margin: 70px;
	float: left;
	margin-right: 200px;
}

#article4 {
	width: 410px;
	height: 600px;
	margin: 70px;
	float: left;
}
#article4 .imgview{
	margin-left:20px;
}

#article4:after {
	content: "";
	display: block;
	clear: both;
}

.map {
	width: 400px;
	height: 400px;
}

.schedule {
	width: 1154px;
	height: 368px
}
#section{
	margin-top:50px;
}
.table1{
	
}
.table1 .aa{
	padding-top:10px;
}
#article5{
	margin-left:80px;
}
.bb{
	padding-bottom:15px;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js">
</script>
<script>
function showPopup_chartUpdate() {
	  var id = document.form1.id.value;
	  var travel_name = document.form1.travel_name.value;
	  var travel ="chartUpdate.do?id="+id+"&travel_name="+travel_name;	  
	  window.open(travel, "여행 등록", "width=400, height=300, left=100, top=50"); 
	  } 
</script>
</head>
<body>
	<div id="wrap">

		<div id="section">
			<div id="article1">
				<table class="table1">
					<tr>
						<th class="bb">
							<!-- <h3>여행루트</h3> -->
							<label class="ui tag label"><h3>여행루트</h3></label>
						</th>
						
					</tr>
					<tr>
						<td><img class="map" src="../images/mypage/map.PNG" alt="루트맵" /></td>
					</tr>
					<tr>
						<td class="aa"><input class="ui button" type="button" value="자세히" onclick="#" style="width: 400px" /></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</div>
			<!-- article1 -->
			<div id="article2" style="border-left: 1px dotted black; padding-left: 200px;">
				<table class="table2">
					<tr>
						<th class="bb">
							<!-- <h3>여행일정</h3> -->
							<label class="ui tag label"><h3>여행일정</h3></label>
						</th>
					</tr>
					<tr>
				
						<td><div id="calendar"></div>
							<!-- 캘린더 자바스크립트 --> 
							<script>
							/* <c:forEach var="cal" items="${cal }">
							  <input type="text" value=${cal.title }>
							</c:forEach> */
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2017-09-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				<c:forEach var="cal" items="${cal }">
				{
					title:' ${cal.title }',
					start:  '${cal.startTime }'
				},</c:forEach>
			]
		});
		
	});
</script></td>
					</tr>
				</table>
			</div>
			<!-- article2 -->
			<form name="form1" >
			<div id="article3">
				<table class="table3">
					<tr>
						  <td><input type="hidden"  value=${chart.id } name="id"></td>
						  <td><input type="hidden"  value=${chart.travel_name } name="travel_name"></td>
					</tr>
					<tr>
						<th class="bb">
							<!-- <h3>예약정보</h3> -->
							<label class="ui tag label"><h3>예약정보</h3></label>
						</th>
					</tr>
					<tr>
						<td>
							<div id="donutchart" style="width: 400px; height: 400px;"></div>
							<script type="text/javascript">
								      google.charts.load("current", {packages:["corechart"]});
								      google.charts.setOnLoadCallback(drawChart);
								      function drawChart() {
								
								    	  var data = google.visualization.arrayToDataTable([
								         	 ['Item', 'cost'],
								              ['항공권:'+${chart.flight}+'만원', ${chart.flight}],
								              ['교통:'+${chart.transfer}+'만원',    ${chart.transfer}],
								              ['숙소:'+${chart.hotel}+'만원',  ${chart.hotel}],
								    	      ['식비:'+${chart.meal}+'만원',${chart.meal}],
								              ['투어/티켓:'+${chart.tour}+'만원', ${chart.tour}]
								            ]);
								        var sum = 0;
								        sum=${chart.flight}+ ${chart.transfer}+ ${chart.hotel}+ ${chart.meal}+ ${chart.tour};
								       
								        var options = {
								   
								          title:' 비용(1인기준) :'+sum+'만원',
								          pieHole: 0.4,
									colors: ['#00A0B0', '#6A4A3C', '#CC333F', '#EB6841', '#EDC951']
								
								        };
								
								
								        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
								        chart.draw(data, options);
								      }
    						</script>

						</td>
					</tr>
					<tr>
					  <td>
					   <button class="ui button" onclick="showPopup_chartUpdate()">수정하기</button>
					  </td>
					</tr>
				</table>
				
			</div>
			</form>
			<!-- article3 -->


			<div id="article4" style="border-left: 1px dotted black; padding-left: 210px;">
				<c:forEach var="id" items="${id}">
					<input type="hidden" value="${id}" name="id" />
					<c:forEach var="travel_name" items="${travel_name}">
						<input type="hidden" value="${travel_name}" name="travel_name" />

						<table class="table4">
							<tr>
								<th class="bb">
									<!-- <h3>앨범</h3> -->
									<label class="ui tag label"><h3>앨범</h3></label>	
								</th>
							</tr>
							<tr>
								<td><img class="map" src="../images/mypage/album.PNG"
									alt="표" /></td>
							</tr>
							<tr>
								<td>
									<input class="ui button imgview" type="button" value="사진보기" onclick="location.href='album.do?id=${id}&travel_name=${travel_name}'" />
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:forEach>
			</div>
			<!-- article4 -->
		</div>
		
		<!-- section -->
		<%@ include file="../include/footerMain.jsp"%>
	</div>
	<!-- wrap -->
</body>
</html>