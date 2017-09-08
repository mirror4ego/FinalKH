<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<%@ include file="include/header.jsp" %>	<!-- header travel 포함 -->
</head>
<body>
<%@ include file="include/menu.jsp" %>	<!-- menu travel 포함 -->
<h2>회원가입은 이메일 형식으로 하셔야 하며, 비밀번호는 8자리 이상 이여야 합니다.</h2>
<h2>등록된 관리자 계정 : kh@kh.com 비번='1'열번 누르면 됨</h2>
	<c:if test="${msg == 'success'}">
	<h2>${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h2>
	</c:if>
	<c:if test="${msg == 'success'}">
    <h2>${sessionScope.userid}(${sessionScope.email})님 환영합니다.</h2>
    </c:if>
	${result}
</body>
</html>
