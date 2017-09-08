<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관광지 상세 정보</title>
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
				<div class='ui inverted olive segment'>
					<font size="5">관광지 상세 정보</font>
				</div>
			</div>
			<div class='row'>
				<div class='sixteen wide column'>
				<div class="ui segment">
				<h3 id='title'></h3>
				</div>
				</div>
			</div>
						<div class='row'>
				<div class='six wide column'>
					<div class="ui segment" style='padding:5px;'>
						<div id="map" style="width: 100%; height:300px;"></div>
					</div>
				</div>
				<div class='ten wide column'>
				<div class="ui segment" id='overview' style='padding:5px;'>
				<div class="ui segment">
				<div class="ui header"><div class="ui big basic olive label" style='margin-top:5px;'>개요</div></div>
			
				
					
				</div>
				</div>
				</div>
			</div>
			<div class='row'>
					
				<div class='ten wide column'>
				<div class='ui segment' style='padding:5px;'>
					
					<div class="ui fluid middle aligned divided big animated selection menu list" id='smallImageList' style="height: 80px; overflow-y: hidden; overflow-x: auto; padding: 0px;">
						<!-- <img class="ui tiny image" id='smallImg' src="http://tong.visitkorea.or.kr/cms/resource/71/1807971_image2_1.jpg" style='margin-top:0px; padding:3px;'>-->					</div>
					<div class='ui segment' >
					<img class="ui image" id='bigImg' src="https://www.moderndaymystic.com/wp-content/themes/laneluxury//assets/images/no-image-1280x800.jpg" style='margin-top:0px;'>
					
					</div>
				</div>


	

				

				</div>
				
				<div class='six wide column'>
				<div class="ui segment" style='padding:5px;'>
				<div class="ui segment" style='padding:5px;'>
				
					<div class="ui top attached tabular menu">
					  <a class="active item" data-tab="common">기본정보</a>
					  <a class="item" data-tab="intro">이용안내</a>
					  <a class="item" data-tab="info">상세정보</a>
					</div>
					<div class="ui bottom attached active tab segment" id='commonTab' data-tab="common">
					  
					</div>
					<div class="ui bottom attached tab segment" id='introTab' data-tab="intro">
					  
					</div>
					<div class="ui bottom attached tab segment" id='infoTab' data-tab="info">
					  
					</div>
					</div>
				
				</div>
				</div>
			</div>
	<div class="ui divider"></div>
			<div class='row'>
				<div class='sixteen wide column'>
					<div class='ui right floated content'>
						<a class="ui icon olive right floated button" href="${path}/travel/sightRough.do">목록으로</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
	
	var get = getRequest();
	var contentId = get['contentId'];
	var paramTitle = get['title'];
	var position = naver.maps.LatLng(37.5666805, 126.9784147);
	var map = new naver.maps.Map('map', {
		center : position,
		zoom : 1,
		mapTypeId : naver.maps.MapTypeId.NORMAL
	});
	var marker = new naver.maps.Marker({
	    position: position,
	    map: map
	});
	
	
	//get방식으로 받아온 파라미터를 자바스크립트에서 사용할 수 있게 바꿔주는 함수
	function getRequest() {
	    if(location.search.length > 1) {
	        var get = new Object();
	        var ret = location.search.substr(1).split('&');
	        for(var i = 0; i < ret.length; i++) {
	            var r = ret[i].split('=');
	            get[r[0]] = r[1];
	        }
	        return get;
	    }else{
	        return false;
	    }
	}


	
	
	$(document).ready(
			$('.menu .item')
			  .tab()
	);
	
	$(document).on('click', '#smallImg', function(){
		
			console.log($(this).attr('src'));
			var imgUrl = $(this).attr('src');
			$('#bigImg').attr('src', imgUrl);
		});
	
	
	function getDetailCommonAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
			data : "&MobileOS=ETC"
				+"&MobileApp=AppTest"
				+"&contentId="+contentId
				+"&contentTypeId="
				+"&defaultYN=Y"
				+"&firstImageYN=Y"
				+"&areacodeYN=Y"
				+"&catcodeYN=Y"
				+"&addrinfoYN=Y"
				+"&mapinfoYN=Y"
				+"&overviewYN=Y",
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				console.log(JSON.stringify(result.response.body.items.item));

					var mapX = result.response.body.items.item.mapx;
					var mapY = result.response.body.items.item.mapy;
					var mLevel = result.response.body.items.item.mlevel;
					var overview = result.response.body.items.item.overview;
					var addr1 = result.response.body.items.item.addr1;
					var addr2 = result.response.body.items.item.addr2;
					var tel = result.response.body.items.item.tel;
					var telName = result.response.body.items.item.telname;
					var homepage = result.response.body.items.item.homepage;
					var contentId = result.response.body.items.item.contentid;
					var contentTypeId = result.response.body.items.item.contenttypeid;
					

					position = new naver.maps.LatLng(mapY, mapX);
					marker.setPosition(position);
					map.morph(position, mLevel, 'duration:5000');
					$('#overview').append("<div class='ui segment'><span style='font-size:16px;'>"+overview+"</div></div>");
					$('#title').append(telName);
					if(addr1!=null||addr2!=null){
						$('#commonTab').append("<span>주 소 : </span>");
					if(addr1!=null){
						$('#commonTab').append("<span>"+addr1+"</span>")};
					if(addr2!=null){
						$('#commonTab').append(" <span>"+addr2+"</span>")};
					};
					if(tel!=null){$('#commonTab').append("<br><br><span> 전화번호 : "+tel+"</span>")}
					if(homepage!=null){$('#commonTab').append("<br><br>홈페이지 : <a href='"+homepage+"' target='_blank'>"+homepage+"</span>")}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	};
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function getDetailIntroAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
			data : "&arrange=A"
				+"&MobileOS=ETC"
				+"&pageNo="+page,
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				
				
				$.each(result.response.body.items.item, function(index, value){
					var galContentId = result.response.body.items.item[index].galContentId;
					var galContentTypeId = result.response.body.items.item[index].galContentTypeId;
				
					$('#galleryCards').append();
				})
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	};
	function getDetailInfoAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
			data : "&arrange=A"
				+"&MobileOS=ETC"
				+"&pageNo="+page,
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				
				
				$.each(result.response.body.items.item, function(index, value){
					var galContentId = result.response.body.items.item[index].galContentId;
					var galContentTypeId = result.response.body.items.item[index].galContentTypeId;
				
					$('#galleryCards').append();
				})
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	};
	function getDetailImageAjax(){
		$.ajax({
			type : "get",
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'text/plain'
			},
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D",
			data : "&MobileOS=ETC"
				+"&MobileApp=AppTesting"
				+"&contentId="+contentId
				+"&imageYN=Y",
			dataType : "json",
			processData : false,
			contentType : "application/json;charset=UTF-8",
			cache : false,
			async : true,
			success : function(result) {
				console.log(JSON.stringify(result.response.body.items));
				$.each(result.response.body.items.item, function(index, value){
					var contentId = result.response.body.items.item[index].contentid;
					var imageName = result.response.body.items.item[index].imagename;
					var originimgurl = result.response.body.items.item[index].originimgurl;
					var serialnum = result.response.body.items.item[index].serialnum;
					var smallimageurl = result.response.body.items.item[index].smallimageurl;
					$('#smallImageList').append(
							"<img class='ui tiny image' id='smallImg' src='"+originimgurl+"' style='margin-top:0px; padding:3px;'>"
					);
					
				})
				if(result.response.body.items.item!=null){
					$('#bigImg').attr('src', result.response.body.items.item[0].originimgurl);
				}else{
					$('#bigImg').attr('src', 'https://www.moderndaymystic.com/wp-content/themes/laneluxury//assets/images/no-image-1280x800.jpg');
				}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
	};
	
	getDetailCommonAjax();
	getDetailImageAjax();
	</script>
</body>
</html>