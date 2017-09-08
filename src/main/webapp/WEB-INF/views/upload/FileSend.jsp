<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>파일 업로드 테스트(SpringMVC Annotation)</h1>
		<form action="upload.file" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mode" value="uploadOk"> 
			파일첨부:<input type="file" name="upload"><br> 
			파일설명:<input type="text" name="content"><br> 
			<input type="submit" value="전송">
		</form>
	</div>


</body>
</html>