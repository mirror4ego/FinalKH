<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>


<title>여행 계획 작성하기</title>
<%@ include file="../include/headerTravel.jsp"%>

</head>
<body>

	<%@ include file="../include/menuTravel.jsp"%>
	<!-- 헤더 정보 공간 -->
	<div class="ui fluid container">
		<div class="ui segment" style="height: 43px;"></div>
	</div>
	<div class="ui fluid container" id="context1"
		style="margin: 10px; border: 0px;">
		<div class="ui grid">
			<div class="two wide fluid column" >
				<div class="ui bound top sticky" id="day"
					style="margin: 0px; padding: 0px;">
					<div class="ui fluid tertiary inverted blue segment" 
						style="height: 610px;">
						<div class="ui fluid container"
							style="margin: 0px; padding: 0px; border: 0px;">
							<div class="ui segment" style="margin: 0px; padding: 2px;">
								<button class="ui icon blue fluid button">
									<div class="edit date text">09.07~09.08</div>
									<i class="setting icon"></i>EDIT
								</button>
								<button class="ui black fluid button" id="totalItinerary">전체일정보기</button>
							</div>
							<div class="ui segment">
								<div class="ui divided animated selection itinerary list"
									style="height: 365px; overflow-y: auto; overflow-x: hidden;">

								</div>
							</div>
							<div class="ui segment" style="margin: 0px; padding: 2px;">
								<button class="ui fluid blue button">DAY 추가</button>
								<button class="ui fluid black button">이용 방법</button>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="three wide column" style="padding: 0px;" id='dropSpace'>
				<div class="ui bound top sticky" id="user" style="height: 400px;">
					<div class="ui tertiary inverted blue segment"
						style="height: 610px;">
						<div class="ui fluid container">

							<div class="grid">
								<div class="ui fluid segment" style="margin: 0px; padding: 3px;">
									<div class="sixteen wide red fluid column">

										<div class="ui segment" style="margin: 0px; padding: 0px;">
											<div class="ui two buttons">
												<button class="ui black temporary save button">임시저장
													후 닫기</button>
												<button class="ui orange completion button">완료</button>
											</div>
										</div>

									</div>
									<div class="row">
										<div class="ui center aligned fluid segment">
											<div class="ui fluid divided grid">
												<div class="four wide middle aligned fluid column">
													DAY<a class="current pick day">6</a>
												</div>
												<div class="nine wide middle aligned fluid column">
													<div class="ui current pick date text">17.09.06</div>
												</div>
												<div class="three wide middle aligned fluid column">
													<div class="ui circular basic refresh tiny icon button"
														id="userPickAllDelete">
														<i class="refresh icon"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">

										<div class="ui icon fluid blue labeled button">
											<i class="compass big icon"></i> 일정 최적화
										</div>

									</div>

								</div>
								<div class="ui segment" style="padding: 10px;">
									<div class="sixteen wide blue column">
										<div class="ui padded red grid">

											<div class="ui left very vertical divided black fluid list"
												id="userPick"
												style="height: 345px; width: 300px; padding: 0px; overflow-y: auto; overflow-x: hidden;">

												<!-- 사용자가 만든 일정이 들어가는 곳 -->
											</div>
										</div>
									</div>
								</div>
								<div class="sixteen wide column">
									<div class="ui segment" style="margin: 0px; padding: 3px;">
										<div class="ui two buttons">
											<div class="ui black button">내 장소 +</div>
											<div class="ui orange button">교통 추가</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eleven wide column">


				<div class="ui tertiary inverted blue segment">
					<div class="ui segment">
						<div class="ui fluid container">

							<div class="ui stackable grid">
								<div class="two wide stackable column">
									<div class="ui fluid segment">
										<div class="row">
											<div class="ui padded grid">


												<div class="middle aligned row">
													<div class="middle aligned grid">지역</div>
												</div>
												<div class="row">
													<button class="ui basic fluid button">변경</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="seven wide stackable column">
									<div class="ui fluid segment">
										<div class="row">
											<div class="ui padded grid">
												<div class="fluid column">
													<div class="ui icon fluid input">
														<input type="text" name="searchField" placeholder="Search">
														<i class="search icon"></i>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="ui padded grid">
												<div class="fluid column">
													<div class="ui fluid form">
														<div class="inline  fluid fields">
															<div class="field">
																<div class="ui radio fluid checkbox">
																	<input type="radio" id="locOption" name="loc"
																		value="city" checked> <label>도시내 검색</label>
																</div>
															</div>
															<div class="field">
																<div class="ui radio fluid checkbox">
																	<input type="radio" id="locOption" name="loc" value="">
																	<label>전체 검색</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="seven wide stackable column">

									<div class="ui fluid segment">
										<div class="row">
											<div class="ui icon five item fluid menu"
												id="classificationMenu">
												<a class="active item" id="basicPlace"><i
													class="circular photo large icon"> </i></a> <a class="item"
													id="food"><i class="circular food large icon"></i></a> <a
													class="item" id="shop"><i
													class="circular shopping bag large icon"></i></a> <a
													class="item" id="accommodation"><i
													class="circular building large icon"></i></a> <a class="item"
													id="userPlace"><i class="circular tag large icon"></i></a>
											</div>

										</div>
										<div class="row">
											<div class="ui padded grid">
												<div class="fluid column">
													<select class="ui fluid dropdown" id="tagDropdown">
														<option value='12' contentTypeId='12'>관광지</option>
														<option value='14' contentTypeId='14'>문화시설</option>
														<option value='15' contentTypeId='15'>축제/공연/행사</option>
														<option value='25' contentTypeId='25'>여행코스</option>
														<option value='28' contentTypeId='28'>레포츠</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
						</div>
					</div>

					<div class="ui fluid container" style="padding: 5px;">
						<div
							class="ui fluid middle aligned divided big animated selection menu list"
							id="contentInMap"
							style="height: 150px; overflow-y: hidden; overflow-x: auto; padding: 0px;"></div>
					</div>

				</div>
				<div class="ui segment">
					<div id="map" style="width: 100%; height: 900px;"></div>
				</div>
								<div class="ui segment">
					<div id="calendar"></div>
				</div>
				<div class="ui fluid container">
					<div class="ui fulid grid">
						<div class="eight wide column">
							<div class="ui fluid segment">
															<div class="ui fluid comments" style="max-width: 100%">
									<h3 class="ui dividing header">블로그</h3>
									<!-- 블로그 목록 영역 -->
									<div class="ui segment" id="listBlog"></div>
									
								</div>
							</div>
						</div>
						<div class="eight wide column">
							<div class="ui fluid segment">
								<div class="ui fluid comments" style="max-width: 100%">
									<h3 class="ui dividing header">댓글</h3>


									<!-- 댓글 목록 영역 -->
									<div id="listReply">

									</div>
									<!-- 댓글 목록 영역 -->


									<!-- 댓글 작성 영역 -->

									<div class="ui segment" id="replySegment"></div>

									<!-- 댓글 작성 영역 -->


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="ui container"></div>



	<!-- 풋터 공간 -->
	<div class="ui fluid container" style='margin-top:20px;'>
		<div class="ui inverted segment">
			<div class="ui inverted vertical footer segment">
				<div class="ui center aligned container">
					<div class="ui stackable inverted divided grid">
						<div class="three wide column">
							<h4 class="ui inverted header">Group 1</h4>
							<div class="ui inverted link list">
								<a href="#" class="item">Link One</a> <a href="#" class="item">Link
									Two</a> <a href="#" class="item">Link Three</a> <a href="#"
									class="item">Link Four</a>
							</div>
						</div>
						<div class="three wide column">
							<h4 class="ui inverted header">Group 2</h4>
							<div class="ui inverted link list">
								<a href="#" class="item">Link One</a> <a href="#" class="item">Link
									Two</a> <a href="#" class="item">Link Three</a> <a href="#"
									class="item">Link Four</a>
							</div>
						</div>
						<div class="three wide column">
							<h4 class="ui inverted header">Group 3</h4>
							<div class="ui inverted link list">
								<a href="#" class="item">Link One</a> <a href="#" class="item">Link
									Two</a> <a href="#" class="item">Link Three</a> <a href="#"
									class="item">Link Four</a>
							</div>
						</div>
						<div class="seven wide column">
							<h4 class="ui inverted header">Footer Header</h4>
							<p>Extra space for a call to action inside the footer that
								could help re-engage users.</p>
						</div>
					</div>
					<div class="ui inverted section divider"></div>
					<div class="ui horizontal inverted small divided link list">
						<a class="item" href="#">Site Map</a> <a class="item" href="#">Contact
							Us</a> <a class="item" href="#">Terms and Conditions</a> <a
							class="item" href="#">Privacy Policy</a>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="ui container">
		<div class="ui basic overViewForm modal"
			style="width: 450px; text-align: center; margin-left: -250px;">
			

			<div class="login column">

				<h2 class="ui orange header">
					<div class="content" id="placeTitle">관광지</div>
				</h2>
			
							<div class="ui orange tertiary inverted segment" style="padding:5px">
			<div class="ui warning message">
		    <ul class="red list" id="placeOverView">
		      <li>Please enter your first name</li>
		      <li>Please enter your last name</li>
		    </ul>
		  </div>
		  	</div>
				
<!-- 				<div class="ui large blue title form">
					<div class="ui stacked inverted blue segment">
						<div class="field">
							<div class="ui content">
								<div class="ui basic large label" id="placeTitle"></div>
							</div>
						</div>
						<div class="field">
							<div class="ui content">
								<textarea id="placeOverView" readonly></textarea>
							</div>
						</div>
					</div>
					
				</div> -->
			</div>
		</div>
	</div>


	<!-- 스크립트 태그 -->

	<script>
		var listJson = '${list}';
		list = parseJSON(listJson);
		var completion = list.planMain.completion;
		console.log(completion);
		

		
			 var events = [];
		
			var listDetailJson = '${listDetail}'
				console.log(listDetailJson);
			
			if(listDetailJson!=''){
			listDetail = parseJSON(listDetailJson);
			for(var i=0;i<listDetail.planDetail.length;i++){
				console.log(listDetail.planDetail[i].contentId);
				
				console.log(listDetail.planDetail[i].mapX);
				var $mapX = listDetail.planDetail[i].mapX;
				var $mapY = listDetail.planDetail[i].mapY;
				var $contentId = listDetail.planDetail[i].contentId;
				var $title = listDetail.planDetail[i].title;
				var $startTime = listDetail.planDetail[i].startTime;
				var $endTime = listDetail.planDetail[i].endTime;
				var $firstImage = listDetail.planDetail[i].firstImage;
				
				events.push({
					start: $.trim($startTime),
					end: $.trim($endTime),
					title : $.trim($title),
					id : 'event' + (Math.random().toString(36)+'00000000000000000').slice(2, 10),
					firstImage : $.trim($firstImage),
					contentId : $.trim($contentId),
					mapX : $.trim($mapX),
					mapY : $.trim($mapY),
					stick : true
               });

			};
			console.log(events);
			}else{
				
			}

		
		
		var userMarkers=[];
		var userInfoWindows=[];
		var userPolyline = new naver.maps.Polyline({
			map : map,
			path : [],
			strokeColor : '#127EDF',
			strokeWeight : 2
		});
		
		var sortBy = (function () {

			  //cached privated objects
			  var _toString = Object.prototype.toString,
			      //the default parser function
			      _parser = function (x) { return x; },
			      //gets the item to be sorted
			      _getItem = function (x) {
			        return this.parser((x !== null && typeof x === "object" && x[this.prop]) || x);
			      };

			  // Creates a method for sorting the Array
			  // @array: the Array of elements
			  // @o.prop: property name (if it is an Array of objects)
			  // @o.desc: determines whether the sort is descending
			  // @o.parser: function to parse the items to expected type
			  return function (array, o) {
			    if (!(array instanceof Array) || !array.length)
			      return [];
			    if (_toString.call(o) !== "[object Object]")
			      o = {};
			    if (typeof o.parser !== "function")
			      o.parser = _parser;
			    o.desc = !!o.desc ? -1 : 1;
			    return array.sort(function (a, b) {
			      a = _getItem.call(o, a);
			      b = _getItem.call(o, b);
			      return o.desc * (a < b ? -1 : +(a > b));
			    });
			  };

			}());
		
		$('#calendar').fullCalendar('renderEvents');
		$('.ui.bound.top.sticky#user').sticky({
			context : '#context1',
			offset : 80,
			type : 'push'
		});

		$('.ui.bound.top.sticky#day').sticky({
			context : '#context1',
			offset : 80,
			type : 'push'
		});

		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.5666805, 126.9784147),
			zoom : 2,
			mapTypeId : naver.maps.MapTypeId.NORMAL
		}), markers = [], infoWindows = [];

		//맵을 이동할때 검색조건을로 맵 안에 있는 장소 표시해주는 메소드
		naver.maps.Event.addListener(map, 'idle',
				function() {
					var contentTypeIdOption = $('#tagDropdown').find(
							':selected').val();
					console.log(contentTypeIdOption);
					var areaCodeOption = $("input:radio[name=loc]:checked")
							.val();

					if (($("input:radio[name=loc]:checked").val()) == "") {
						var areaCodeOption = $("input:radio[name=loc]:checked")
								.val()

					} else {
						var areaCodeOption = ($('.ui.itinerary.list').find(
								'.active.item').attr('areaCode'));
					}
					;
					console.log(areaCodeOption);
					var titleOption = $('input[name=searchField]').val();
					console.log(titleOption);

					bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
							titleOption)
				});
		
		var contentTypeIdOption = $('#tagDropdown').find(
		':selected').val();
console.log(contentTypeIdOption);

var areaCodeOption = $("input:radio[name=loc]:checked")
		.val();

if (($("input:radio[name=loc]:checked").val()) == "") {
	var areaCodeOption = $("input:radio[name=loc]:checked")
			.val()

} else {
	var areaCodeOption = ($('.ui.itinerary.list').find(
			'.active.item').attr('areaCode'));
}
;
console.log(areaCodeOption);
console.log(areaCodeOption);
var titleOption = $('input[name=searchField]').val();
console.log(titleOption);

bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
		titleOption)


		function deleteAllInMap() {
			marker.setMap(null);
		}

		function parseJSON(data) {
			return window.JSON && window.JSON.parse ? window.JSON.parse(data)
					: (new Function("return " + data))();
		}

		$('.ui.fluid.itinerary.menu.list')
				.append(
						"<div class='item'><img class='ui image'><div class='content'>가마목</div><div class='right floated content'><div class='ui icon button' id='userPickDeleteButton'><i class='delete icon'></i></div></div></div>");


		function getClickHandler(seq) {
			return function(e) {

				var marker = markers[seq], infoWindow = infoWindows[seq];
				if (marker.getIcon() === ('http://www.owenscorning.com/images/orange-dot.png')) {
					/* marker
							.setIcon({
								url : 'http://www.diacomp.org/omb/images/Google/ltblue.png'
							}); */
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

		function onMouseOver(e) {
			var marker = e.overlay, seq = marker.get('seq');

			marker
					.setIcon({
						url : 'https://mt.googleapis.com/vt/icon/name=icons/onion/22-blue-dot.png'
					});
		}

		function onMouseOut(e) {
			var marker = e.overlay, seq = marker.get('seq');

			marker.setIcon({
				url : 'http://www.diacomp.org/omb/images/Google/ltblue.png'
			});
		}
		
/* 		var polyline = new naver.maps.Polyline({
			map : map,
			path : [],
			strokeColor : '#5347AA',
			strokeWeight : 2
		}); */

		$(document).on("click", "#userPickDeleteButton", function() {
			$(this).parent().parent().remove();
		});

		$(document)
				.on(
						"click",
						"#pickItem",
						function(e) {

							var contentId = $(this).attr('contentId');
							console.log(contentId);
							if (!$(e.target).is('#pickButton')
									&& !$(e.target).is('.plus.icon')) {
								//do some stuff
								var data = {}, bounds = map.getBounds();
								data["eastBP"] = bounds.getNE().lng();
								data["westBP"] = bounds.getSW().lng();
								data["southBP"] = bounds.getSW().lat();
								data["northBP"] = bounds.getNE().lat();

								$
										.ajax({
											type : "get",
											headers : {
												'Accept' : 'application/json',
												'Content-Type' : 'text/plain'
											},
											url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
											data : "&contentId="
													+ contentId
													+ "&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json",
											dataType : "json",
											processData : false,
											contentType : "application/json;charset=UTF-8",
											cache : false,
											async : true,
											success : function(result) {
												var overViewRaw = JSON.stringify(result.response.body.items.item.overview);
												var titleRaw = JSON.stringify(result.response.body.items.item.title);
												overViewRaw = overViewRaw.replace(/\n/g, "<br />");
												titleRaw = titleRaw.replace(/\n/g, "<br />");
												console.log(overViewRaw);
												console.log(titleRaw);
												
												$('#placeOverView').empty();
												$('#placeTitle').empty();
												$('#placeOverView').append("<h3>"+overViewRaw+"</h3>");
												$('#placeOverView').text().replace("\n", "<br />", "g");
												$('#placeTitle').append("<h1>"+titleRaw+"</h1>");
												$('#placeTitle').text().replace("\n", "<br />", "g");
												$('.ui.overViewForm.modal').modal({
													onHide : function() {

													}
												}).modal('show');

											},
											error : function(xhr, status, error) {
												console.log(error);
											}
										});
							}
							;

						});
		
		
		$(document).on("click", "#totalItinerary", function(){
			$(".fc-month-button").trigger("click");
		});
		$(document).on(
				"click",
				"#itineraryItem",
				function() {
					$(this).parent().children().removeClass("active");
					$(this).addClass("active");
					$(".fc-agendaDay-button").trigger("click");
					var attrNum = $(this).attr("planDay") - 1;

					var currentDay = new Date(list.planMain.startDay);

					currentDay.setDate(currentDay.getDate()
							+ (($(this).attr("planDay")) * 1 - 1));
					var currentDayPlus = new Date();

					$('.ui.pick.date.text').empty();
					$('.ui.pick.date.text').append(
							$.datepicker.formatDate('y년 MM d일', currentDay));
					$('.current.pick.day').empty();
					$('.current.pick.day').append(
							list.planRough[attrNum].planDay);

					var json = JSON.stringify($("#calendar").fullCalendar(
							"clientEvents").map(function(e) {
						var rv = {};
						Object.keys(e).filter(function(k) {
							return k != "source" && !k.startsWith("_");
						}).forEach(function(k) {
							rv[k] = e[k];
						});

						return rv;
					}));
					console.log(json);
					$('#calendar').fullCalendar('gotoDate', currentDay);

					$('#userPick').children().remove();
					
					var planRoughObjectArray = new Array();

					var planRoughDetailObject = new Object();
					console.log($('#itineraryItem').length);
					$($('.itinerary.list').children()).each(
							function(index, value) {
								var planRoughObject = new Object();
								planRoughObject.planRoughNum = $(this)
										.attr('planRoughNum');
								planRoughObject.planMainNum = $(this)
										.attr('planMainNum');
								planRoughObject.areaCode = $(this)
										.attr('areaCode');
								planRoughObject.planDay = $(this).attr(
										'planDay');
								planRoughObject.firstImage = $(this).attr(
										'firstImage');
								planRoughObjectArray
										.push(planRoughObject);
							});
					
					var contentTypeIdOption = $('#tagDropdown').find(
					':selected').val();
			console.log(contentTypeIdOption);
			var areaCodeOption = $("input:radio[name=loc]:checked")
					.val();

			if (($("input:radio[name=loc]:checked").val()) == "") {
				var areaCodeOption = $("input:radio[name=loc]:checked")
						.val()

			} else {
				var areaCodeOption = ($('.ui.itinerary.list').find(
						'.active.item').attr('areaCode'));
			}
			;
			console.log(areaCodeOption);
			var titleOption = $('input[name=searchField]').val();
			console.log(titleOption);

			bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
					titleOption)

				});
		$(document).on("click", "#userPickAllDelete", function() {
			$('#userPick').children().remove();
		});
		$('.ui.menu').on(
				'click',
				'.item',
				function() {
					if (!$(this).hasClass('dropdown')) {
						$(this).addClass('active').siblings('.item')
								.removeClass('active');
					}
				});

		$(document)
				.on(
						"click",
						".ui.completion.button",
						function() {
							var planRoughObjectArray = new Array();

							var planRoughDetailObject = new Object();
							console.log($('#itineraryItem').length);
							$($('.itinerary.list').children()).each(
									function(index, value) {
										var planRoughObject = new Object();
										planRoughObject.planRoughNum = $(this)
												.attr('planRoughNum');
										planRoughObject.planMainNum = $(this)
												.attr('planMainNum');
										planRoughObject.areaCode = $(this)
												.attr('areaCode');
										planRoughObject.planDay = $(this).attr(
												'planDay');
										planRoughObjectArray
												.push(planRoughObject);
									});

							var planDetailObjectArray = JSON
									.stringify($("#calendar")
											.fullCalendar("clientEvents")
											.map(
													function(e) {
														return {
															planMainNum : list.planRough[0].planMainNum,
															contentId : e.contentId,
															firstImage : e.firstImage,
															startTime : e.start,
															endTime : e.end

														};
													}));
							console.log(planDetailObjectArray);

							planRoughDetailObject.planRoughObjectArray = (planRoughObjectArray);
							planRoughDetailObject.planDetailObjectArray = (planDetailObjectArray);

							console.log(planRoughObjectArray);
							console.log(planDetailObjectArray);
							console.log(planRoughDetailObject);
							$
									.ajax({
										url : "${path}/travel/insertPlanRoughDetail.do",
										type : 'post',
										data : JSON
												.stringify(planRoughDetailObject),
										contentType : "application/json;charset=UTF-8",
										success : function(respBody) {
											console.log("성공");
											console.log(respBody);
											location.href = "${path}/itinerary/list.do";
											console.log("성공");
										},
										error : function(xhr, ajaxoptions,
												thrownError, status, error) {
											console.log(status);
										}
									});

						});
		$(document)
				.on(
						"click",
						".ui.temporary.save.button",
						function() {
							var planRoughObjectArray = new Array();

							var planRoughDetailObject = new Object();
							console.log($('#itineraryItem').length);
							$($('.itinerary.list').children()).each(
									function(index, value) {
										var planRoughObject = new Object();
										planRoughObject.planRoughNum = $(this)
												.attr('planRoughNum');
										planRoughObject.planMainNum = $(this)
												.attr('planMainNum');
										planRoughObject.areaCode = $(this)
												.attr('areaCode');
										planRoughObject.planDay = $(this).attr(
												'planDay');
										planRoughObjectArray
												.push(planRoughObject);
									});

							var planDetailObjectArray = JSON
									.stringify($("#calendar")
											.fullCalendar("clientEvents")
											.map(
													function(e) {
														return {
															planMainNum : list.planRough[0].planMainNum,
															contentId : e.contentId,
															firstImage : e.firstImage,
															startTime : e.start,
															endTime : e.end

														};
													}));
							console.log(planDetailObjectArray);

							planRoughDetailObject.planRoughObjectArray = (planRoughObjectArray);
							planRoughDetailObject.planDetailObjectArray = (planDetailObjectArray);

							console.log(planRoughObjectArray);
							console.log(planDetailObjectArray);
							console.log(planRoughDetailObject);
							$
									.ajax({
										url : "${path}/travel/insertPlanRoughDetail.do",
										type : 'post',
										data : JSON
												.stringify(planRoughDetailObject),
										contentType : "application/json;charset=UTF-8",
										success : function(respBody) {
											console.log("성공");
											console.log(respBody);
											location.href = "${path}/itinerary/list.do";
											console.log("성공");
										},
										error : function(xhr, ajaxoptions,
												thrownError, status, error) {
											console.log(status);
										}
									});

						});

		$(document)
				.on(
						'click',
						'#classificationMenu',
						function() {
							$('#tagDropdown').empty();
							switch ($('#classificationMenu').find('.active')
									.attr('id')) {
							case 'basicPlace':
								console.log('basicPlace');
								$('#tagDropdown')
										.append(
												"<option value='12' contentTypeId='12'>관광지</option>"
														+ "<option value='14' contentTypeId='14'>문화시설</option>"
														+ "<option value='15' contentTypeId='15'>축제/공연/행사</option>"
														+ "<option value='25' contentTypeId='25'>여행코스</option>"
														+ "<option value='28' contentTypeId='28'>레포츠</option>")
								break;
							case 'food':
								console.log('food');
								$('#tagDropdown')
										.append(
												"<option value='39' contentTypeId='39'>음식점</option>")
								break;
							case 'shop':
								$('#tagDropdown')
										.append(
												"<option value='38' contentTypeId='38'>쇼핑</option>")
								break;
							case 'accommodation':
								$('#tagDropdown')
										.append(
												"<option value='32' contentTypeId='32'>숙박시설</option>")
								break;
							case 'userPlace':
								$('#tagDropdown')
										.append(
												"<option value='' contentTypeId=''>전체 보기</option>"
												+"<option value='99' contentTypeId='99'>사용자 추가 장소</option>")
								break;
							default:
								console.log('분류 아무것도 선택되지 않음');
							}

							console.log('dropdown');
							var contentTypeIdOption = $('#tagDropdown').find(
									':selected').val();
							console.log(contentTypeIdOption);
							var areaCodeOption = $(
									"input:radio[name=loc]:checked").val();

							if (($("input:radio[name=loc]:checked").val()) == "") {
								var areaCodeOption = $(
										"input:radio[name=loc]:checked").val()

							} else {
								var areaCodeOption = ($('.ui.itinerary.list')
										.find('.active.item').attr('areaCode'));
							}
							;
							console.log(areaCodeOption);
							var titleOption = $('input[name=searchField]')
									.val();
							console.log(titleOption);

							bringPlaceOnMap(contentTypeIdOption,
									areaCodeOption, titleOption)
							bringPlaceOnMap(contentTypeIdOption,
									areaCodeOption, titleOption);
							console.log(1);

						});

		$('#tagDropdown').on(
				'change',
				(function() {
					console.log('dropdown');
					var contentTypeIdOption = $('#tagDropdown').find(
							':selected').val();
					console.log(contentTypeIdOption);
					var areaCodeOption = $("input:radio[name=loc]:checked")
							.val();

					if (($("input:radio[name=loc]:checked").val()) == "") {
						var areaCodeOption = $("input:radio[name=loc]:checked")
								.val()

					} else {
						var areaCodeOption = ($('.ui.itinerary.list').find(
								'.active.item').attr('areaCode'));
					}
					;
					console.log(areaCodeOption);
					var titleOption = $('input[name=searchField]').val();
					console.log(titleOption);

					bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
							titleOption)
					bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
							titleOption);
					console.log(1);

				}));
		
		
		$('input:radio').on(
				'click',
				(function() {
					console.log('radio');
					var contentTypeIdOption = $('#tagDropdown').find(
							':selected').val();
					console.log(contentTypeIdOption);
					var areaCodeOption = $("input:radio[name=loc]:checked")
							.val();

					if (($("input:radio[name=loc]:checked").val()) == "") {
						var areaCodeOption = $("input:radio[name=loc]:checked")
								.val()

					} else {
						var areaCodeOption = ($('.ui.itinerary.list').find(
								'.active.item').attr('areaCode'));
					}
					;
					console.log(areaCodeOption);
					var titleOption = $('input[name=searchField]').val();
					console.log(titleOption);

					bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
							titleOption)

				}));
		$('input[name=searchField]').on(
				'change',
				(function() {
					console.log('search');
					var contentTypeIdOption = $('#tagDropdown').find(
							':selected').val();
					console.log(contentTypeIdOption);
					var areaCodeOption = $("input:radio[name=loc]:checked")
							.val();

					if (($("input:radio[name=loc]:checked").val()) == "") {
						var areaCodeOption = $("input:radio[name=loc]:checked")
								.val()

					} else {
						var areaCodeOption = ($('.ui.itinerary.list').find(
								'.active.item').attr('areaCode'));
					}
					;
					console.log(areaCodeOption);
					var titleOption = $('input[name=searchField]').val();
					console.log(titleOption);

					bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
							titleOption)

				}));

		function bringPlaceOnMap(contentTypeIdOption, areaCodeOption,
				titleOption) {

			var data = {}, bounds = map.getBounds();
			data["eastBP"] = bounds.getNE().lng();
			data["westBP"] = bounds.getSW().lng();
			data["southBP"] = bounds.getSW().lat();
			data["northBP"] = bounds.getNE().lat();
			data["areaCodeOption"] = areaCodeOption;
			data["contentTypeIdOption"] = contentTypeIdOption;
			data["titleOption"] = titleOption;
			console.log(JSON.stringify(data))
			console.log($('.ui.itinerary.list').find('.active.item').attr(
					'areaCode'));
			console.log(JSON.stringify(data));
			$
					.ajax({
						type : "post",
						url : "${path}/travel/bringPlaceOnMap.do",
						dataType : "json",
						data : JSON.stringify(data),
						processData : false,
						contentType : "application/json;charset=UTF-8",
						async : true,
						success : function(result) {
							console.log(result);
							for (var i = 0, ii = markers.length; i < ii; i++) {
								markers.pop().setMap(null)

							}
							;
							markers = [];
							infoWindows = [];
							$('#contentInMap').empty();
							$
									.each(
											result,
											function(key, value) {
												var position = new naver.maps.LatLng(
														value.mapY, value.mapX);

												var marker = new naver.maps.Marker(
														{
															map : map,
															position : position,
															title : value.contentId,
															icon : "http://www.owenscorning.com/images/orange-dot.png",
														});

												var infoWindow = new naver.maps.InfoWindow(
														{
															content : '<div style="text-align:center;padding:10px;"><span style="color:black">'
																	+ value.title
																	+ '</span></div>'
														});

												
												
												markers.push(marker);
												infoWindows.push(infoWindow);
												var $div = $('	<div class="item" id="pickItem" style="width:300px;"'
														+ 'firstImage='
														+ value.firstImage
														+ '" title="'
														+ value.title
														+ '"contentId="'
														+ value.contentId
														+ '"mapX="'
														+ value.mapX
														+ '"mapY="'
														+ value.mapY
														+ '">'
														+ '<img class="ui image" src="'
														+ value.firstImage
														+ '" style="height: 100px; width:150px"><div class="content">'
														+ value.title
														+ '</div><div class="right floated content"><div class="ui pick icon button" id="pickButton"><i class="plus icon"></i></div></div></div>');
												$('#contentInMap').append($div);
											});
							for (var i = 0, ii = markers.length; i < ii; i++) {
								naver.maps.Event.addListener(markers[i],
										'click', getClickHandler(i));
							}
							$('.pick.button')
									.on(
											'click',
											function() {
												var $title = $(this).parent()
														.parent().attr('title');
												var $firstImage = $(this)
														.parent().parent()
														.attr('firstImage');
												var $contentId = $(this)
														.parent().parent()
														.attr('contentId');
												var $mapX = $(this)
														.parent().parent()
														.attr('mapX');
												var $mapY = $(this)
														.parent().parent()
														.attr('mapY');
												console.log($contentId);
												console.log($title);
												var $div = $('<div class="fluid draggable item" id="userPickItem" contentId='
														+ $contentId
														+ '>'
														+ '<img class="ui image" src="'
														+ $firstImage
														+ '" style="height: 50px; width:50px">'
														+ '<div class="content">'
														+ $title
														+ '</div>'
														+ '<div class="right floated content">'
														+ '<div class="ui icon button" id="userPickDeleteButton">'
														+ '<i class="delete icon"></i>'
														+ '</div>'
														+ '</div>'
														+ '</div>');
												$('#userPick').append($div);
												$('#userPick .draggable:last-child')
														.data(
																'event',
																{
																	title : $.trim($title),
																	id : 'event' + (Math.random().toString(36)+'00000000000000000').slice(2, 10),
																	firstImage : $.trim($firstImage),
																	contentId : $.trim($contentId),
																	mapX : $.trim($mapX),
																	mapY : $.trim($mapY),
																	stick : true
																})
																
														.draggable(
																{
																	zIndex : 999,
																	revert : true,
																	revertDuration : 0,
																	appendTo : 'body',
																	containment : 'window',
																	scroll : false,
																	helper : 'clone',
																	cursor : 'move'
																});
												
											});

						},
						error : function(xhr, status, error) {
							console.log('error');
						}
					});
		};
		

		var email = "<%=(String) session.getAttribute("email")%>"


		$(document)
				.ready(
						function() {
							if (email != null) {
								$('#replySegment')
										.append(

												"<form class='ui reply form'>"
														+ "<div class='field'>"
														+ "<textarea id='replytext' placeholder='댓글을 작성해주세요'></textarea>"
														+ "</div>"
														+ "<div class='right float content'>"
														+ "<div class='ui blue labeled submit icon button'"
						+"id='btnReply'>"
														+ "<i class='icon edit'></i> 댓글 작성"
														+ "</div>"
														+ "<div class='ui right floated checkbox' style='float:right;'><input type='checkbox' id='secretReply'><label>비밀 댓글</label></div"
														+ "</div>" + "</form>");
							}
							;
						});

		$(document).ready(function() {
			//댓글 관련 script

			/* --------------- 댓글 관련 -------------- */
			// 1. 댓글 입력
			$("#btnReply").click(function() {
				console.log("댓글입력 시작!");

				//reply(); // 폼데이터 형식으로 입력
				replyJson(); // json 형식으로 입력
			});
			listReplyRest();
		});

		// 댓글 입력 함수(json방식)
		function replyJson() {
			var content = $("#replytext").val();
			var planMainNum = list.planRough[0].planMainNum;
			// 비밀댓글 체크여부
			var secretReply = "0";
			console.log(secretReply);
			// 태그.is(":속성") 체크여부 true/false
			if ($("#secretReply").is(":checked")) {
				secretReply = "1";
			}
			console.log(content);
			console.log(planMainNum);
			console.log(secretReply);
			$.ajax({
				type : "post",
				url : "${path}/travel/insertPlanReplyRest.do",
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "json",
				data : JSON.stringify({
					planMainNum : planMainNum,
					content : content,
					secretReply : secretReply
				}),
				success : function() {
					alert("댓글이 등록되었습니다.");
					listReplyRest();
				}
			});
		}

		// 댓글 목록 - RestController를 이용 json형식으로 리턴
		function listReplyRest() {
			console.log("댓글 로드시작.");
			console.log(list.planRough[0].planMainNum);
			$
					.ajax({
						type : "get",
						//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
						url : "${path}/travel/planReplyList.do?planMainNum="
								+ list.planRough[0].planMainNum,
						success : function(result) {
							
							console.log(result);
							var output = null;
							$("#listReply").empty();
							for ( var i in result) {
								output = "<div class='comment'>"
										+ "<a class='avatar'> <img"
								+ "	src='http://image.auction.co.kr/itemimage/8b/e0/90/8be090466.jpg'>"
										+ "</a>" + "<div class='content'>"
										+ "	<a class='author'>"
										+ result[i].email + "</a>"
										+ "	<div class='metadata'>"
										+ "		<span class='date'>"
										+ result[i].regDate + "</span>"
										+ "	</div>" + "	<div class='text'>"
										+ result[i].content +"</div>"
										+ "<div class='actions'>"
										+ "	<a class='reply'>답글</a>" + "</div>"
										+ "</div>" + "</div>"

										console.log('반복횟수');
								$("#listReply").append(output);
							}
							
							
							console.log("댓글이 로드되었습니다.");
							;
						}
					});
		}

		// 댓글 수정화면 생성 함수
		function showReplyModify(rno) {
			$.ajax({
				type : "get",
				url : "${path}/reply/detail/" + rno,
				success : function(result) {
					$("#modifyReply").html(result);
					// 태그.css("속성", "값")
					$("#modifyReply").css("visibility", "visible");
				}
			})
		}
		
	/* 	function loadEvent(){
			var listDetailJson = '${listDetail}'
				console.log(listDetailJson);
			listDetail = parseJSON(listDetailJson);
			for(var i=0;i<listDetail.planDetail.length;i++){
				console.log(listDetail.planDetail[i].contentId);
				
				console.log(listDetail.planDetail[i].mapX);
				var $mapX = listDetail.planDetail[i].mapX;
				var $mapY = listDetail.planDetail[i].mapY;
				var $contentId = listDetail.planDetail[i].contentId;
				var $title = listDetail.planDetail[i].title;
				var $startTime = listDetail.planDetail[i].startTime;
				var $endTime = listDetail.planDetail[i].endTime;
				alert(1);
				return {
						start: $.trim($startTime),
						end: $.trim($endTime),
						title : $.trim($title),
						id : $.trim($contentId),
						contentId : $.trim($contentId),
						mapX : $.trim($mapX),
						mapY : $.trim($mapY),
						stick : true
				}
				alert(JSON.stringify(loadEvent));
				alert(loadEvent);
			};
			console.log(listDetail);
		}
 */
 
 $(document)
	.ready(
			function() {

				$
						.each(
								list.planRough,
								function(index, value) {
									$('.ui.itinerary.list')
											.append(
													"<div class='item' id='itineraryItem' planRoughNum="+list.planRough[index].planRoughNum+" planMainNum="+list.planRough[index].planMainNum+" areaCode="+list.planRough[index].areaCode+" planDay="+list.planRough[index].planDay+">"
															+ "<img class='ui avatar image' src="+list.planRough[index].areaImage+">"
															+ "<div class='content'>"
															+ "DAY"
															+ list.planRough[index].planDay
															+ "</div>"
															+ "<div class='right floated content'>"
															+ list.planRough[index].areaName
															+ "</div>"
															+ "</div>");
									a = list.planRough[index].planDay

								});
				($('.ui.itinerary.list').find('.item').first())
						.addClass("active");

				var startDate = new Date(list.planMain.startDay);
				var endDate = new Date(startDate);
				endDate.setDate(endDate.getDate() + (a * 1 - 1));
				$('.ui.pick.date.text').empty();
				$('.ui.pick.date.text').append(
						$.datepicker.formatDate('y년 MM d일',
								startDate));
				$('.current.pick.day').empty();
				$('.current.pick.day').append(
						list.planRough[0].planDay);
				$('.edit.date.text').empty();
				$('.edit.date.text').append(
						$.datepicker.formatDate('MM d일 ~ ',
								startDate));
				$('.edit.date.text').append(
						$.datepicker.formatDate('MM d일', endDate));

				endDate.setDate(endDate.getDate() + 1);
				startDate.setDate(startDate.getDate() + 1);
				$('#calendar').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay'
					},
					defaultView : 'agendaDay',
					defaultDate : list.planMain.startDay,
					validRange : {
						start : list.planMain.startDay,
						end : endDate

					},
					//events : loadEvent(),
					events: events,
				
			           eventDragStop: function( event, jsEvent, ui, view ) {
			                
			                if(isEventOverDiv(jsEvent.clientX, jsEvent.clientY)) {
			                    $('#calendar').fullCalendar('removeEvents', event.id);
			                    
			                	var $div = $('<div class="fluid draggable item" id="userPickItem" eventId="'+event.id+'" contentId='
										+ event.contentId
										+ '>'
										+ '<img class="ui image" src="'
										+ event.firstImage
										+ '" style="height: 50px; width:50px">'
										+ '<div class="content">'
										+ event.title
										+ '</div>'
										+ '<div class="right floated content">'
										+ '<div class="ui icon button" id="userPickDeleteButton">'
										+ '<i class="delete icon"></i>'
										+ '</div>'
										+ '</div>'
										+ '</div>');
			                	$('#userPick').append($div);
			                    
			                    
			                	$div.draggable({
			                      zIndex: 999,
			                      revert: true, 
			                      revertDuration: 0 
			                    });
			                	$div.data('event', { title: event.title, id :event.id, contentId : event.contentId, firstImage : event.firstImage, mapX : event.mapX, mapY : event.mapY, stick: true });
			                }
			            },
					
					eventAfterAllRender: function( view ) { 
						console.log("이벤트 변화");
						userPolyline.setMap(null);
						var planDetailObjectArrayJson = JSON
						.stringify($("#calendar")
								.fullCalendar("clientEvents")
								.map(
										function(e) {
											return {
												planMainNum : list.planRough[0].planMainNum,
												contentId : e.conTentId,
												firstImage : e.firstImage,
												startTime : e.start,
												endTime : e.end,
												mapX : e.mapX,
												mapY : e.mapY,

											};
										}));

						var parsePlanDetailObjectArray = parseJSON(planDetailObjectArrayJson);
		
						console.log(planDetailObjectArrayJson);
						console.log(JSON.stringify(parsePlanDetailObjectArray));
						sortBy(parsePlanDetailObjectArray, { 
							prop: "startTime",
							parser: function (item) {
						        return new Date(item);
						    }
						});

						console.log(JSON.stringify(parsePlanDetailObjectArray));
						for (var i = 0;i<userMarkers.length; i++) {
							console.log(userMarkers[i]);
							userMarkers[i].setMap(null);
							

						};
						userMarkers=[];
						userInfoWindows=[];

						if(planDetailObjectArrayJson==="[]"){
							console.log("null");
						}else{
							var path = [];

							userPolyline.setPath(path);
							for(var i=0;i<parsePlanDetailObjectArray.length;i++){
								console.log(parsePlanDetailObjectArray[i].mapX);
								var position = new naver.maps.LatLng(
										parsePlanDetailObjectArray[i].mapY, parsePlanDetailObjectArray[i].mapX);
								var userMarker = new naver.maps.Marker(
										{
											map : map,
											position : position,
											title : parsePlanDetailObjectArray[i].contentId,
											icon : "http://www.diacomp.org/omb/images/Google/ltblue.png",
											zIndex : 1000
										});
								userMarker.setAnimation(naver.maps.Animation.BOUNCE);
								var userInfoWindow = new naver.maps.InfoWindow(
										{
											content : '<div style="text-align:center;padding:10px;"><span style="color:black">'
													+ parsePlanDetailObjectArray[i].title
													+ '</span></div>'
										});
								userMarkers.push(userMarker);
								userInfoWindows.push(userInfoWindow);
								
								path.push(position);
								console.log(userMarkers);
								console.log(JSON.stringify(path));
								console.log(position);
							};
							userPolyline.setPath(path);

							userPolyline.setMap(map);
							
						}
						


					},
					/* 								visibleRange : {
					 start : list.planMain.startDay,
					 end : endDate
					 }, */
					editable : true,
					droppable : true, // this allows things to be dropped onto the calendar
					drop : function() {
						// is the "remove after drop" checkbox checked?
						/* if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove();
						} */
						$(this).remove();
					}
				});
		        var isEventOverDiv = function(x, y) {

		            var external_events = $( '#dropSpace' );
		            var offset = external_events.offset();
		            offset.right = external_events.width() + offset.left;
		            offset.bottom = external_events.height() + offset.top;

		            // Compare
		            if (x >= offset.left
		                && y >= offset.top
		                && x <= offset.right
		                && y <= offset .bottom) { return true; }
		            return false;

		        }
			});

	</script>

</body>
</html>

