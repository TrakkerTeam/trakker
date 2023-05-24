<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
 .navbar {
  background-color: #20c997;
  position: sticky;
  top: 0;
 }
 .navbar-nav > li,span {
  font-size: 20px;
  font-weight: bolder;
 }
</style>
<nav class="navbar navbar-expand-sm navbar-inverse navbar-fixed-top navbar-dark">
 <div class="container-fluid">
  <a class="navbar-brand" href="${path}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width: 110px;" height="60;"></a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
   <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
   <ul class="navbar-nav">
    <li class="nav-item">
     <a class="nav-link" href="#">플래너</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="#">리뷰게시판</a>
    </li>
   </ul>
   <ul class="navbar-nav">
    <span class="navbar-text">이학동</span>
    <li class="nav-item">
     <a class="nav-link" href="#">회원가입</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="#">로그인</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="#">관리자페이지</a>
    </li>
    <span class="navbar-text">${sessionScope.name}</span>
    <li class="nav-item">
     <a class="nav-link" href="#">마이페이지</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="#">로그아웃</a>
    </li>
   </ul>
  </div>
 </div>
</nav>
