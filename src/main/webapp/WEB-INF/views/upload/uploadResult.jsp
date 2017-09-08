<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%//@ include file="../include/menu.jsp" %>
	파일이 업로드 되었습니다.<br>
	파일명 : ${savedName}
	<img src="../../upload${savedName}"/>
	<img src="img/94a94058-dc14-4ee0-aa55-de51e5cdc32a_001.jpg"/>
	
<script>
	var result = "${savedName}";
	/* 파일명을 부모페이지로 전달 */
	parent.addFilePath(result);
</script>
</body>
</html>