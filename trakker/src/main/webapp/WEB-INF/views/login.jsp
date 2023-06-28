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
<h2>Login</h2>
<div class="container" style="width:30% !important">
    <form name="form1" method="post">
        <table  width="400px">
            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" id="email" name="mem_email"placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" id="passwd" name="mem_pass"placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>

            <div>
                <a href="${path}/member/findpassword.do">비밀번호를 잊으셨나요?</a>
            </div>

            <div>
                <button class="w-100 btn btn-lg" style="background-color: #4CAF50; color: #fff;" id="btnLogin">Login</button>
                <c:if
                        test="${message == 'error'}">
                    <div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                </c:if>
                <c:if test="${message == 'logout'}">
                    <div style="color: red;">로그아웃되었습니다.</div>
                </c:if>
            </div>
            <div> <p>회원이 아니세요? <a href="${path}/member/signup.do">회원가입하기</a></p></div>
        </table>
    </form>
</div>

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
