<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function(){
		location.href="${path}/faq/write.do";
	});
});
</script>
</head>
<body>
<h2>FAQ</h2>
<%@ include file="../include/menu.jsp" %>

<button type="submit" id="btnWrite">글쓰기</button>
<table border="1">
 <tr>
  <th>번호</th>
  <th>제목</th>
  <th>작성자</th>
 </tr>
<c:forEach var="row" items="${list}">  
  <tr>
    <td>${row.faq_num}</td>
    <td>${row.faq_subject}</td>
    <td>${row.faq_writer}</td>
  </tr>
</c:forEach>  
</table>
</body>
</html>