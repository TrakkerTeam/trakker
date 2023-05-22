<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션 사용 옵션 -->
<%@ page session="true" %>

<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<%@ include file="include/header.jsp" %>	
</head>
<body>
<%@ include file="include/menu.jsp" %>
<c:if test="${sessionScope.mem_email != null}">
 <h2>
  ${sessionScope.mem_name}(${sessionScope.mem_email})님의 방문을 환영합니다. 테스트용
 </h2>
</c:if>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<!-- 실제로 서비스되는 디렉토리(배포 디렉토리) -->
<%= application.getRealPath("/resources/images/") %>

</body>
</html>
