<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page Error</title>
<%@ include file="../include/header.jsp" %>      <!-- header travel 포함 -->
<style type="text/css">
body{
  background-image : url(https://www.nasa.gov/sites/default/files/thumbnails/image/hs-2016-32-a-print-crop.jpg);
  color:white
}
.row.page {
  margin-top: 20em;
}
</style>
</head>
<body>
<div class="row">
  <div class="column">
    <div class="ui middle aligned stackable grid container">
      
      <div class="row page">
        <div class="center aligned column">
          <h1><c:out value='${msg }' /></h1>
          <h3>페이지를 표시할 수 없습니다.</h3>
          <p>검색할 페이지는 현재 사용할 수 없습니다. 왜냐면 오류가 났기 때문이죠<br /></p>
          <p>---------------------------------------<br /></p>
          <p>다음을 시도해 보십시오.<br /></p>
          <p>뒤로가기버튼 누르기 또는 <a href="javascript:history.go(-1)">여기</a> 그냥 누르기</p>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>