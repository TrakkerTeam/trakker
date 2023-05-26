<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jsp"%>
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

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
	<form name="form1" method="post">
		<table  width="400px">
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
            	<td><input type="email" id="email" name="mem_email"></td>
            </tr>

			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" id="passwd" name="mem_pass"></td>
			</tr>
			<tr>
			    <td><a href="${path}/member/findpassword.do">비밀번호를 잊으셨나요?</a> </td>
			</tr>
			<tr>
				<td  align="center">
					<button type="button" id="btnLogin">로그인</button>
					 <c:if
						test="${message == 'error'}">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if> <c:if test="${message == 'logout'}">
						<div style="color: red;">로그아웃되었습니다.</div>
					</c:if>
				</td>
			</tr>
			<tr>
			    <td >회원이 아니세요? <a href="${path}/member/signup.do">회원가입하기</a></td>
			</tr>
		</table>
	</form>
	<%@ include file="../footer.jsp" %>
</body>
</html>