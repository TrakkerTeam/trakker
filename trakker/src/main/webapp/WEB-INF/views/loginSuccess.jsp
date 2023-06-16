<%--
  Created by IntelliJ IDEA.
  User: drg25
  Date: 2023-06-16
  Time: 오전 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="itemfile.jspf"></jsp:include>
<body>
<section class="bg-light">
    <div class="container py-4">
        <div class="row align-items-center justify-content-between">
            <a class="navbar-brand h1 text-center" href="${path}/admin/adminPage.do">
                <span class="text-primary h4">TRAKKER</span>
            </a>
        </div>
        <div>
            <h1 class="text-dark text-center">환영합니다!</h1>
            <p class="text-center">
                <span>${name}</span>님의 로그인 성공<br> 이메일 주소는 <strong>${email}</strong>입니다.
            </p>
        </div>
        <div class="d-grid gap-2">
            <button type="button" class="btn btn-primary btn-lg" onclick="location.href='home.jsp'"></button>
        </div>
    </div>

</section>

</body>
</html>
