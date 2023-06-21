<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jspf"%>
<style>
        body {
            font-family: Arial, sans-serif;
            padding-top:80px;
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
			//폼 내부의 데이터를 전송할 주소
			document.form1.action = "${path}/member/login_check.do";
			document.form1.submit();
		});
	});
</script>

</head>
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


	<%@ include file="../footer.jspf" %>
</body>
</html>