<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기</title>
<!-- Semantic Ui  -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.11/semantic.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script type="text/javascript" src="./include/ckeditor/ckeditor.js" ></script>
<script type='text/javascript'> 
    window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${file_path}','업로드 완료');
</script>
<style>
#rwrite{padding:60px;}
</style>
</head>
<body>
	<header>
	<div class="ui fluid container">
		<div class="ui purple segment">
			<p><%@ include file="../include/headerTravel.jsp"%>
		<%@ include file="../include/menuTravel.jsp"%></p>
		</div>
	</div>
	</header>
	<section>
	<div class="ui fluid container">
		<div class="ui grid" id="rwrite">
			<!-- 
			<div class="sixteen wide purple column"></div>
			<div class="four wide blue column">
				<div class="ui left inverted segment">일정 만들기</div>
			</div> 일정 -->			
			
			<div class="twelve wide column">
				<div class="ui segment">
					<form name="form" id="form" method="post" action="${path}/reviewInsert.do">
						<div class="twelve wide column">												
							<input type="text" class="ui block header" name="writer" id="writer" value="${sessionScope.userid }" readonly/>													
						</div>
						<div class="four wide column">
							<input type="hidden" name="email" id="email" value="${sessionScope.email }">
						</div>						
						<div class="ui fluid input">
							<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요." />
						</div>
						<div class="field">
						<textarea name="content" id="contents" style="width: 700px; height: 400px;"></textarea>				
						</div>
					<div  align="center">
						<input type="submit" id="ibt" class="ui button" value="확인"/>
						<a class="ui button" href="${path}/reviewList.do" >취소</a>
					</div>
					</form>
					<script type="text/javascript">
					$(function(){
						CKEDITOR.replace( 'contents' ,{
							filebrowserImageUploadUrl : '${path}/upimg.do',
							enterMode:'2',
							shiftEnterMode:'3',
						});
						CKEDITOR.on('dialogDefinition', function( ev ){
				            var dialogName = ev.data.name;
				            var dialogDefinition = ev.data.definition;
				          
				            switch (dialogName) {
				                case 'image': //Image Properties dialog
				                    //dialogDefinition.removeContents('info');
				                    dialogDefinition.removeContents('Link');
				                    dialogDefinition.removeContents('advanced');
				                    break;
				            }
				        });
					});
					</script>
				</div><!-- segment -->
			</div><!-- 후기작성 -->
		</div><!-- grid -->
	</div><!-- ui container --> 
	</section>
	<footer>
	<div class="ui fluid container">
		<div class="ui purple segment">
			<p><%@ include file="../include/footerMain.jsp"%></p>
		</div>
	</div>
	</footer>
</body>
</html>