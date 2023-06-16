<%--
  Created by IntelliJ IDEA.
  User: drg25
  Date: 2023-06-13
  Time: 오후 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NaverLoginTest</title>
</head>
<style>
    .btn_img{
        width: 70px;
        height: 70px;
        border-radius: 70%;
        overflow: hidden;

    }
    .btnimg{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }


</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<br>
<div style="text-align:center" class="btn_img">
    <a href="${urlNaver}"><img class="btnimg" alt="사진 적용 안됨" src="${path}/img/btn_naver.png"></a>
</div>
<hr>
<div  class="btn_img">
<a class="p-2" href="${urlKakao}">
    <img src="${path}/img/btn_kakao.png" class="btnimg"></a>
</div>
</body>
</html>
