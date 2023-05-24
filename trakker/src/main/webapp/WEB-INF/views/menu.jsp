<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;"> 
 <a href="${path}">Home</a> |
 
 <c:if test="${sessionScope.admin_userid == null}">
 <a href="#">플래너</a> |
 <a href="#">리뷰게시판</a> |
 </c:if>
 
 <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid == null}">
   <!-- 로그인 하지 않은 상태 -->
    <a href="#">회원가입</a> |
    <a href="#">로그인</a> |
    <a href="${path }/admin/adminPage.do">관리자페이지</a> |
   </c:when>
   <c:otherwise>
    <!-- 로그인한 상태 -->
    ${sessionScope.name}님이 로그인중입니다.
    <a href="#">마이페이지</a> |
    <a href="#">로그아웃</a> |
   </c:otherwise>
  </c:choose>
 </div>
</div>
<hr>
