<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="itemfile.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<style>
 .navbar {
  background-color: #20c997;
  position: fixed;
  color: white;
  width: 100%;
  height: 80px;
  top: 0;
  z-index:1;
 }
 .navbar-nav > li,.navbar-text {
  font-size: 20px;
  font-weight: bolder;
 }
 .btn-group:hover .dropdown-menu {
  display: block;
  margin-top: 45px;
  left: -100%;
 }
 body{
  padding-top: 80px;
 }
</style>
<nav class="navbar navbar-expand-sm navbar-inverse navbar-fixed-top navbar-dark">
 <div class="container-fluid">
  <a class="navbar-brand" href="${path}"><img src="${pageContext.request.contextPath}/resources/images/trakker1.png" style="width: 110px;" height="60;"></a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
   <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
   <ul class="navbar-nav">
    <li class="nav-item">
     <a class="nav-link" href="#"><i class="bi bi-calendar-range"></i>플래너</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="${path}/review/list"><i class="bi bi-file-earmark-richtext"></i>리뷰게시판</a>
    </li>
   </ul>
   <div class="navbar-nav">
    <span class="navbar-text">이학동</span>
    <li class="nav-item">
     <a class="nav-link" href="#"><i class="bi bi-person-add"></i>회원가입</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="#"><i class="bi bi-door-closed"></i>로그인</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="${path}/admin/adminPage.do"><i class="bi bi-person-gear"></i>관리자페이지</a>
    </li>
    <span class="navbar-text">${sessionScope.name}</span>
    <div class="btn-group">
     <button disabled class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
      <i class="bi bi-person-circle"></i>
     </button>
     <ul class="dropdown-menu dropdown-menu-lg-end">
      <li><a class="dropdown-item" href="#"><i class="bi bi-person-video2"></i> 마이페이지</a></li>
      <li><a class="dropdown-item" href="#"><i class="bi bi-door-open"></i> 로그아웃</a></li>
     </ul>
    </div>
    </ul>
   </div>
  </div>
 </div>
</nav>