<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원정보 수정</h2>
<form name="form1" method="post">
<table border="1" style="width: 400px;">
 <tr>
  <td>이메일</td>
  <td><input name="userid" value="${dto.mem_email}" readonly></td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd"></td>
 </tr>
 <tr>
  <td>이름</td>
  <td><input name="name" value="${dto.mem_name}"></td>
 </tr>
 <tr>
  <td>닉네임</td>
  <td><input name="email" value="${dto.mem_nickname}"></td>
 </tr>
 <tr>
  <td>회원가입일자</td>
  <td>
	  <c:if test="${mem_join_date != null}">
	   <fmt:formatDate value="${mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss" />
	  </c:if>
	  <fmt:formatDate value="${dto.mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss" />
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="수정" id="btnUpdate">
   <input type="button" value="삭제" id="btnDelete">
   <div style="color: red;">${message}</div>
 </tr>
</table>
</form>


</body>
</html>