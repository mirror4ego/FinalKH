<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script   src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <script>
     function aa(){
    	 document.frm.travel_name.value = $(".selected").html();
     }
     
   </script>
</head>
<body>
<form action="travelInsert.do" name="frm">
<h2>여행의 이름을 선택하세요</h2>

<div class="ui floating dropdown labeled search icon button">
  <i class="plane icon"></i>
  <span class="text">Select travel</span>
  <div class="menu">
  <c:forEach var = "travel" items="${travelnamelist}">
  <div class ="item">${travel.title }</div>
  
  
  </c:forEach>
  </div>
</div>

   <input type="hidden" name="id" value=${id }>
    <input type= "hidden" name="travel_name"  >
   <input class="ui button" type="submit" value="입력" onclick="aa()">
   </form>
   <script>
   $('.ui.dropdown')
  .dropdown();

   </script>


</body>
</html>