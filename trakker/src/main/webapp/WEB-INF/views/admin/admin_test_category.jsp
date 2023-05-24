<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jsp" %>
</head>
<body>
<%@ include file="../menu.jsp" %>

<div style="text-align: center;">
 	<a href="${path }/">main</a>
	<a href="${path }/gugu.do">구구단</a>
	<a href="${path }/test.do">테스트</a>
	<a href="${path }/admin/memberList">회원관리</a>
	<a href="${path }/dept/list.do">부서관리</a>
</div>
</body>
</html>