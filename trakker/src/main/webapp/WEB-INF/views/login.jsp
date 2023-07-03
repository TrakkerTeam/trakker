<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>NaverLoginTest</title>
    <%@ include file="header.jspf" %>
</head>
<style>
       .btn_img {
            display: inline-block;
            margin: 10px;
            text-align: center;
            width: 70px;
            height: 70px;
            border-radius: 50%;
            overflow: hidden;
        }

        .btnimg {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
body {
            font-family: Arial, sans-serif;
        }

        h2 {
        padding:20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 400px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        table td {
            padding: 12px;
        }


        form{
            padding:10px;
        }

        button {
        width:100%;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .error-message {
            color: red;
            text-align: center;
        }
        div{
        margin:10px;
        }

        .hr-with-text {
                position: relative;
                margin: 20px 0;
                border: none;
                height: 1px;
                background-color: #333;
            }
            .hr-with-text::after {
                content: "or";
                position: absolute;
                top: -10px;
                left: 50%;
                transform: translateX(-50%);
                padding: 0 10px;
                background-color: #fff;
                color: #333;
                font-size: 14px;
            }

</style>
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var mem_email = $("#email").val();
			var mem_pass = $("#passwd").val();
			if (mem_email == "") {
				alert("이메일을 입력하세요");
				$("#email").focus();
				return;
			}
			if (mem_pass == "") {
				alert("비밀번호를 입력하세요");
				$("#passwd").focus();
				return;
			}
			document.form1.action = "${path}/member/login_check.do";
			document.form1.submit();

			let mem_num ='<%=session.getAttribute("mem_num")%>';
			cosole.log(typeof mem_num);

		});
	});
</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<div class="container" style="margin-top:80px;">
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

<hr class="hr-with-text">
<div style="text-align:center">
<div style="text-align:center" class="btn_img">
    <a href="${urlNaver}"><img class="btnimg" alt="사진 적용 안됨" src="${path}/img/btn_naver.png"></a>
</div>

<div  class="btn_img">
<a  href="${urlKakao}"><img src="${path}/img/btn_kakao.png" class="btnimg"></a>
</div>
</div>
  </table>
  </form>
</div>

</div>

<%@ include file="footer.jspf" %>
</body>
</html>
