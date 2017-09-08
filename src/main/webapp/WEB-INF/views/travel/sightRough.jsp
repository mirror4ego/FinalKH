<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관광지 리스트</title>
<%@ include file="../include/headerTravel.jsp"%>
</head>
<body>
	<%@ include file="../include/menuTravel.jsp"%>
	<div class='ui main container'>
		<div class='ui grid'>
			<div class='sixteen wide column'>
				<div class='ui segment'></div>
			</div>
			<div class='sixteen wide column'>
				<div class='ui inverted orange segment'>
					<font size="5">관광지 리스트</font>
				</div>
			</div>
			<div class='sixteen wide column'>
				<div class='ui segment'>

					<!-- 아이템들 -->
					<div class="ui divided items" id='items'>
						<!-- 아이템 들어가는 공간-->
						<!-- 아이템 -->
<!-- 						<div class="item" >
							<div class="image">
								<img id='firstImage'
									src="http://tong.visitkorea.or.kr/cms/resource/42/1846542_image3_1.jpg" />
							</div>
							<div class="content">
								<a class="header" id='title'></a>
								<div class="description" id='overview'></div>
								<div class="extra">
									<div class="ui label" id='cat3'></div>
									<div class="ui label">
										<i class="globe icon"></i> <span id='addr1'></span> <span
											id='addr2'></span>
									</div>
									<i class="green check icon"></i> <span id='readCount'></span>View
								</div>
							</div>
						</div> -->
						<!-- 아이템 -->
					</div>
					<!-- 아이템들 -->

				</div>
			</div>
		</div>
	</div>

	<script>
	
	var page = 1;
	
	function getSightInfoAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
	 		data : "&contentTypeId="
	 				+"&areaCode="
	 				+"&sigunguCode="
	 				+"&cat1="
	 				+"&cat2="
	 				+"&cat3="
	 				+"&listYN=Y"
	 				+"&MobileOS=ETC"
	 				+"&MobileApp=TourAPI3.0_Guide"
	 				+"&arrange=A"
	 				+"&numOfRows=20"
	 				+"&pageNo="+page
	 				+"&_type=json",
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				
				
				$.each(result.response.body.items.item, function(index, value){
					var title = result.response.body.items.item[index].title;
					var addr1 = result.response.body.items.item[index].addr1;
					var addr2 = result.response.body.items.item[index].addr2;
					var overview = result.response.body.items.item[index].overview;
					var cat3 = result.response.body.items.item[index].cat3;
					var readcount = result.response.body.items.item[index].readcount;
					var firstimage = result.response.body.items.item[index].firstimage;
					var contentid = result.response.body.items.item[index].contentid;
					if(overview==null){
						overview='';
					}
					if(firstimage==null){
						firstimage = 'http://www.giclove.com/core/images/etc/noimg_main.gif';
					}
					if(addr1==null){
						addr1 = '';
					}
					if(addr2==null){
						addr2 = '';
					}
					$('#items').append(
						"<div class='item' id='contentItem' contentId='"+ contentid +"' title='"+ title +"'>"
							+"<div class='image'>"
							+"<img id='firstImage'"
									+"src='"+firstimage+"' />"
										+"</div>"
							+"<div class='content'>"
							+"<a class='header' id='title'>"+title+"</a>"
								+"<div class='description' id='overview'>"+overview+"</div>"
								+"<div class='extra'>"
								+"<div class='ui basic label' id='cat3'>"+cat3+"</div>"
									+"<div class='ui basic label'>"
									+"<i class='globe icon'></i> <span id='addr1'>"+addr1+"</span> <span"
										+"id='addr2'>"+addr2+"</span>"
											+"</div><br>"
									+"<i class='green check icon'></i> <span id='readCount'>"+readcount+"</span>View"
									+"</div>"
								+"</div>"
						+"</div>"
							
					
					);
				})
				page = page + 1;
				console.log(page);
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	};
		
	getSightInfoAjax();
	
	$(document).ready(function () {
		$(document).scroll(function() {
			
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
	
				if (maxHeight <= currentScroll) {
					getSightInfoAjax();
				}
			
			})
		});
	$(document).on('click', '#contentItem', function(){
		var contentId = $(this).attr('contentId');
		var title = $(this).attr('title');
		location.href = '${path}/travel/sightDetail.do?contentId='+contentId+'&title='+encodeURI(title, "UTF-8")		
	});

	</script>
</body>
</html>