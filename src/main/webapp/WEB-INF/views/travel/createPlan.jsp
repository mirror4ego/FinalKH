<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>여행 도시 선택하기</title>
<%@ include file="../include/headerTravel.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" />
<script type="text/javascript" src="${path}/include/js/calendar.js"></script>

</head>
<body>
	<%@ include file="../include/menuTravel.jsp"%>
	<div class="ui fluid container" style="padding: 0em;">
		<div class="ui grid">
			<div class="sixteen wide fluid column"
				style="height: 89px; margin: -15px;"></div>
			<div class="three wide fluid column" id="left"
				style="margin-top: -15px;">
				<div class="ui fluid aligned divided big animated selection list"
					id="content"
					style="overflow-y: auto; overflow-x: hidden; margin-right: -14px;">
					<div class="ui two top attached buttons">
						<div class="ui blue button" id="toggleButton">${sessionScope.userid}의
							일정</div>
					</div>
					<c:forEach var="row" items="${list}">
						<div class="item">
							<div class="right floated content">
								<div class="ui area icon button" id="${row.areaName}">
									<i class="plus icon"></i>
								</div>
							</div>
							<img class="ui tiny image" src="${row.areaImage}">
							<div class="content">${row.areaName}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="thirteen wide fluid blue column">
				<div class="ui left very sidebar vertical menu" id="sidebar">
					<div class="ui fluid orange button"
						onclick="location.href='javascript:detailForm()'">상세일정 만들기</div>
					<!-- 사용자가 만든 일정이 들어가는 곳 -->
				</div>
				<div class="pusher">
					<div id="map" style="width: 100%; margin: -14px;"></div>
				</div>

			</div>
		</div>
	</div>
	<div class="ui container">
		<div class="ui basic detailForm modal"
			style="width: 450px; text-align: center; margin-left: -250px;">
			<div class="login column">
				<h2 class="ui orange header">
					<div class="content">제목과 출발일 입력</div>
				</h2>
				<div class="ui large title form">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui input">
								<div class="ui basic large label">제목</div>
								<input type="text" id="title" name="title" placeholder="즐거운 여행">
							</div>
						</div>
						<div class="field">
							<div class="ui input">
								<div class="ui basic large label">날짜</div>
								<input type="text" id="datePicker" name="datePicker">
							</div>
						</div>
						<div class="field">
							<button class="ui fluid large orange detailForm button">상세일정 만들기</button>
						</div>
					</div>
					<div class="ui error message"></div>
				</div>
			</div>
		</div>
	</div>




	<script>
		var map = new naver.maps.Map('map', { /* 네이버 지도 객체 초기 생성 */
			center : new naver.maps.LatLng(36.5, 129),
			zoom : 3,
			minZoom : 2, //지도의 최소 줌 레
			maxZoom : 5,
			zoomControl : true, //줌 컨트롤의 표시 여부
			zoomControlOptions : { //줌 컨트롤의 옵션
				position : naver.maps.Position.TOP_RIGHT
			}

		});
		var $window = $(window); /* 윈도우창에 대한 정보를 사용하기 위해 */

		function getMapSize() { /* 윈도우창의 크기를 불러와서  */
			var size = new naver.maps.Size($window.width(),
					$window.height() - 73);
			return size;
		};

		now_select_city_cnt = $('#selected_cities .s_cities').length;
		console.log('now_select_city_cnt:' + now_select_city_cnt);
		if (now_select_city_cnt > 0) {
			$('#select_detail_view_city').show("slide", {
				direction : "left"
			}, 200);
		} else {
			$('#select_detail_view_city').hide("slide", {
				direction : "left"
			}, 200);
		}

		map.setSize(getMapSize()); /* 초기 화면 열었을때 화면 사이즈 만큼 맵도 채우도록 설정 */
		$window.on('resize', function() { /* 화면 사이즈가 바뀔때마다 맵 사이즈 조정 */
			map.setSize(getMapSize());
		});

		$(document).ready(function() {
			resizeContent();
			$(window).resize(function() {
				resizeContent();
				console.log(map.getMapSize());
			});
		});

		function resizeContent() {
			$height = $(window).height() - 87;
			$('body div#content').height($height);
		}

		$(document).ready(function() {
			jQuery.ajax({
				type : "GET",
				url : "http://",
				dataType : "JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
				success : function(data) {
				},
				error : function(xhr, status, error) {
				}
			});
		});

		var markers = [], infoWindows = [];

		<c:forEach var="row" items="${list}">

		var position = new naver.maps.LatLng("${row.areaMapY}",
				"${row.areaMapX}");

		var marker = new naver.maps.Marker({
			map : map,
			position : position,
			title : "${row.areaCode}",
			icon : "http://www.owenscorning.com/images/orange-dot.png",
		});

		var infoWindow = new naver.maps.InfoWindow(
				{
					content : '<div style="text-align:center;padding:10px;"><span style="color:black">${row.areaName}</span></div>'
				});

		markers.push(marker);
		infoWindows.push(infoWindow);

		</c:forEach>
		var polyline = new naver.maps.Polyline({
			map : map,
			path : [],
			strokeColor : '#5347AA',
			strokeWeight : 2
		});
		function getClickHandler(seq) {
			return function(e) {

				var marker = markers[seq], infoWindow = infoWindows[seq];
				if (marker.getIcon() === ('http://www.owenscorning.com/images/orange-dot.png')) {
					marker
							.setIcon({
								url : 'http://www.diacomp.org/omb/images/Google/ltblue.png'
							});
				} else {
					marker.setIcon({

					});
				}

				if (infoWindow.getMap()) {
					infoWindow.open(map, marker);
				} else {
					infoWindow.open(map, marker);
				}

				if (marker.getAnimation() !== null) {
					marker.setAnimation(null);
				} else {
					marker.setAnimation(naver.maps.Animation.BOUNCE);
				}

				var point = e.coord;

				var path = polyline.getPath();
				path.push(point);
			}
		}

		for (var i = 0, ii = markers.length; i < ii; i++) {
			naver.maps.Event.addListener(markers[i], 'click',
					getClickHandler(i));
		}

		$('.ui.sidebar').sidebar({
			context : $('#map'),
			dimPage : false,
			closable : false
		}).sidebar('attach events', '#toggleButton');
		$('.ui.sidebar').sidebar({context : $('#map'),
				dimPage : false,
				closable : false})
		  .sidebar('attach events', '.ui.area.icon.button', 'show')
		;
		function detailForm() {
			$('.ui.detailForm.modal').modal({
				onHide : function() {

				}
			}).modal('show');
		}

		$('.area.button')
				.click(
						function() {
							var $id = $(this).attr('id');
							var $div = $('<div class="item" id="userPickItem"><div class="ui icon tiny buttons"><button class="ui button" id="userDelete"><i class="delete icon"></i></button><button class="ui black disabled button" id="areaName">'
									+ $id
									+ '</button></div><div class="ui icon tiny right floated buttons"><button class="ui button" id="minusButton"><i class="minus icon"></i></button><button class="ui black disabled button"><span id="dateDay">2</span>일</button><button class="ui button" id="plusButton"><i class="plus icon"></i></button></div></div>');
							$('#sidebar').append($div);
							$('.ui.sidebar').show;

						});
		
		
		$(document).on("click", "#userDelete", function() {
			$(this).parent().parent().remove();
		});
		$(document).on("click", "#plusButton", function() {
			var baseVal = $(this).parent().find("#dateDay").text();
			console.log(baseVal);
			$(this).parent().find("#dateDay").empty();
			$(this).parent().find("#dateDay").text(Number(baseVal) + 1);
		});
		$(document).on("click", "#minusButton", function() {
			var baseVal = $(this).parent().find("#dateDay").text();
			if (baseVal >= 2) {
				$(this).parent().find("#dateDay").empty();
				$(this).parent().find("#dateDay").text(baseVal - 1);
			} else {
				console.log("1일보다 작게 할 수는 없습니다");
			}
		});

		/* 		$('#userDelete').click(function() {
		 console.log($(this).parent().parent().parent());
		
		 }); */

		$(function() {
			$("#datePicker")
					.datepicker(
							{

								buttonImage : 'http://www.badmintonasia.org/html/images/material/icon-calendar.png',
								showOn : 'both',
								dateFormat : 'yy-mm-dd',
								dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일',
										'토요일', '일요일' ],
								dayNamesMin : [ '월', '화', '수', '목', '금', '토',
										'일' ],
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ],
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ],
								changeMonth : true,
								changeYear : true,
								nextText : '다음 달',
								prevText : '이전 달'

							});
		});

		$('.ui.form').form({
			fields : {
				title : {
					identifier : 'title',
					rules : [ {
						type : 'empty',
						prompt : '제목을 입력해 주세요'
					} ]
				},
				datePicker : {
					identifier : 'datePicker',
					rules : [ {
						type : 'empty',
						prompt : '날짜를 입력해 주세요'
					} ]
				}
			}
		});
		$('#completionButton').api({
			url : 'http://www.google.com'
		});

		$(document).on("click", "#minusButton", function() {
			var baseVal = $(this).parent().find("#dateDay").text();
			if (baseVal >= 2) {
				$(this).parent().find("#dateDay").empty();
				$(this).parent().find("#dateDay").text(baseVal - 1);
			} else {
				console.log("1일보다 작게 할 수는 없습니다");
			}
		});

		$('.ui.detailForm.button').click(
				function() {
					var jsonArray = new Object();
					jsonArray["title"] = $('#title').val();
					jsonArray["datePicker"] = $('#datePicker').val();
					var j = 1;
					$('#sidebar #userPickItem').each(
							function(index) {

								for(var i=0;i<$(this).find("#dateDay").text();i++,j++){

								var userPickArray = new Object();
								userPickArray.areaName = $(this).find("#areaName").text();
								userPickArray.dateDay = j;
								jsonArray["userPickItem"+j] = userPickArray;
								console.log(j);
								}
							});
					console.log(JSON.stringify(jsonArray));
									
					$.ajax({
					    url : "${path}/travel/insertPlanMainRough.do",
					    type : 'post',
					    data : JSON.stringify(jsonArray),
					    contentType : "application/json;charset=UTF-8",
					    success : function(respBody) {
					    	console.log("성공");
					    	console.log(respBody);
					    	location.href="${path}/travel/makePlan.do?planMainNum="+respBody;
					    	console.log("성공");
					    },
					    error : function(xhr, ajaxoptions, thrownError, status, error) {
					    	console.log(status);
					    }
					}); 
					

				});
	</script>
</body>
</html>