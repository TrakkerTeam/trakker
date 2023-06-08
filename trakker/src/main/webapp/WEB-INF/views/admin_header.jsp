<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/include/jquery-3.6.3.min.js"></script>
<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/css/bootstrap.css">
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
    <style>
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f2f2f2;
            padding: 30px;
        }

        a{
            text-decoration: none;
            color: inherit;
            padding: 5px 20px;
        }
        nav{
            text-align: center;
            background-color: #f2f2f2;
            padding: 20px;
        }
        body {
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #f9f9f9;
            color: #919191;
            padding: 20px;
        }
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
</head>
<body>
<header class="admin-header">
    <div class="container mx-auto h-full flex">

        <span class="text-xl-center">Trakker</span>
        <span>MAKE YOUR ROUTE OPTIMZED</span>
    </div>
    <div class="logout">
        <a href="#">로그아웃</a>
    </div>
</header>
<nav>
    <div>
            <a href="${path}/admin/memberList">회원관리</a>
            <a href="${path}/trip/list.do">관광명소 관리</a>
            <a href="${path}/faq/list.do">FAQ</a>
    </div>
</nav>
</body>
</html>


