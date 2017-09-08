<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
				<div class='ui inverted blue segment' style='margin:10px;'>
					<font size="5">관광지 사진</font>
				</div>
			</div>
			<div class='sixteen wide column'>


					<!-- 카드들 -->
					<div class="ui centered cards" id='galleryCards'>
						<!-- 카드 들어가는 공간-->
<!-- 						  <div class="card">
						    <div class="image">
						      <img src="/images/avatar/large/elliot.jpg">
						    </div>
						  </div> -->
					</div>
					<!-- 카드들 -->


			</div>
		</div>
	</div>
	
	
	

	<script>
	
	var page = 1;
	
	function getPhotoGalleryAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?ServiceKey=cbFiEQk%2FbfjsErq0XKgDF3990ILxrAuoE7Zd4GWjEdceZ5aShgd59vrS097mD1POhj02QJ9EcB9vI%2F%2BN47iw6w%3D%3D",
			data : "&arrange=A"
				+"&MobileOS=ETC"
				+"&pageNo="+page
				+"&numOfRows=20"
				+"&MobileApp=AppTest"
				+"&_type=json",
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				
				
				$.each(result.response.body.items.item, function(index, value){
					var galContentId = result.response.body.items.item[index].galContentId;
					var galContentTypeId = result.response.body.items.item[index].galContentTypeId;
					var galTitle = result.response.body.items.item[index].galTitle;
					var galWebImageUrl = result.response.body.items.item[index].galWebImageUrl;
					var galCreatedtime = result.response.body.items.item[index].galCreatedtime;
					var galModifiedtime = result.response.body.items.item[index].galModifiedtime;
					var galPhotographyMonth = result.response.body.items.item[index].galPhotographyMonth;
					var galPhotographyLocation = result.response.body.items.item[index].galPhotographyLocation;
					var galPhotographer = result.response.body.items.item[index].galPhotographer;
					var galSearchKeyword = result.response.body.items.item[index].galSearchKeyword;
					var galViewCount = result.response.body.items.item[index].galViewCount;

					$('#galleryCards').append(
							  "<div class='card' style='margin-top:100px;'>"
							    +"<a class='image' href='"+galWebImageUrl+"' target=_blank>"
							    +"<img src='"+galWebImageUrl+"'>"
							    +"</a>"
							    +"<div class='content'>"
							    +"<div class='header'>"+galTitle+"</div>"
							    +"<div class='meta'>"
							    +"<a>"+galPhotographer+"</a>"
							    +"</div>"
							    +"<div class='description'>"
							    +"<div class='ui basic right floated label'>"
							    +galPhotographyLocation
							    +"</div>"
							    +"</div>"
							    +"</div>"
							    +"<div class='extra content'>"
							    +"<span class='right floated'>"
							    +galPhotographyMonth
							    +"</span>"
							    +"<span>"
							    +"<i class='hand pointer icon'></i>"+galViewCount+" View"
							    +"</span>"
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
	
	getPhotoGalleryAjax();
	
	$(document).ready(function () {
		$(document).scroll(function() {
			
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
	
				if (maxHeight <= currentScroll) {
					getPhotoGalleryAjax();
				}
			
			})
		});
	
	function clickImage(galWebImageUrl) {
		window.open(galWebImageUrl, '_blank'); 
	};

	</script>
</body>
</html>