/**
 * 	관광공사 API에서 정보 가져오기
 */

$(document).ready(function() {
     jQuery.ajax({
           type:"GET",
           url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D&contentTypeId=&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=10&pageNo=1&_type=json",	   
           dataType:"json", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
           success : function(data) {
                alert("자바스크립트 객체 불러오기 성공");
                var jsondata = JSON.stringify(data);
                alert(jsondata);
                alert("자바스크립트 객체를 json으로 변환 성공");
                var rejson = JSON.parse(jsondata);
                alert(rejson);
                alert(rejson.response.header.resultCode);
                alert(rejson.response.body.items.item[5].title);
                $("#api").append(data.response.body.items.item[5].title);


           },
           complete : function(data) {
        	   alert(data);
        	   var jsondata = JSON.stringify(data);
                alert(jsondata);
                alert("자바스크립트 객체를 json으로 변환 성공");
                var rejson = JSON.parse(jsondata);
        	   alert("완료");
           },
           error : function(xhr, status, error) {
                 alert("에러발생");
           }
     });
});