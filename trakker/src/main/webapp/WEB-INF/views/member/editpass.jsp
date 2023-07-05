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
        }


        h2 {
            padding: 20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 600px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        table td {
            padding: 8px;
        }

        #profileimg{
             text-align: center;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"]{
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

   .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 16px;
        }

        .button-container button {
            width: 48%;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top:80px;">
    <h2>비밀번호 변경</h2>
    	<form name="form1" id="pwUpdateForm" method="post" style="text-align: left;">
            <table width="600px">
                <input type="hidden" id="mem_email" name="mem_email" value="${sessionScope.mem_email}">
                <tr>
                    <td colspan="2">기존 비밀번호</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="password" name="mem_pass" id="mem_pass" placeholder="현재 비밀번호"></td>
                </tr>
                <tr>
                    <td colspan="2">신규 비밀번호</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="password" name="new_pass" id="new_pass" placeholder="신규 비밀번호"></td>
                </tr>
                <tr>
                    <td colspan="2">비밀번호 확인</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="password" id="new_pass2" name="new_pass2" placeholder="비밀번호 확인"></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="btnpwUpdate" name="btnpwUpdate" onclick="pwUpdate();">변경하기</button></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="logback" name="logback" onclick="back();">취소하기</button>
                        <div style="color: red;">${message}</div>
                    </td>
                </tr>
            </table>
        </form>
        </div>

       <script type="text/javascript">
           function pwUpdate() {
               var mem_email = document.getElementById("mem_email").value;
               var mem_pass = document.getElementById("mem_pass").value;
               var new_pass = document.getElementById("new_pass").value;
               var new_pass2 = document.getElementById("new_pass2").value;
               var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;

               if (mem_pass === "") {
                   alert("현재 비밀번호를 입력해주세요.");
                   return;
               }

               if (new_pass === "") {
                   alert("신규 비밀번호를 입력해주세요.");
                   return;
               }
                if (!pattern.test(new_pass)) {
                   alert("비밀번호는 8~16자의 영문 대소문자, 숫자, 특수문자(~!@#$%^&*()+|=)를 조합해야 합니다.");
                   return;
                 }

               if (new_pass !== new_pass2) {
                   alert("비밀번호가 일치하지 않습니다.");
                   return;
               }

               if (window.confirm("변경하시겠습니까?")) {
                   $.ajax({
                       url: "${path}/member/pwUpdate.do",
                       type: "POST",
                       data: {
                           mem_email: mem_email,
                           mem_pass: mem_pass,
                           new_pass:new_pass,
                           new_pass2:new_pass2
                       },
                       success: function(response) {
                           if (response === "success") {
                               console.log("비밀번호 변경 성공");
                               alert("비밀번호 변경 성공");
                               document.form1.submit();
                               window.location.href = "${path}/member/home.do";
                           } else {
                               console.log("기존 비밀번호가 일치하지 않습니다.");
                               alert("기존 비밀번호가 일치하지 않습니다.");
                           }
                       },
                       error: function(xhr, status, error) {
                           console.log("오류가 발생했습니다. 다시 시도해주세요.");
                           alert("오류가 발생했습니다. 다시 시도해주세요.");
                       }
                   });
               }
           }
             function back() {
                     history.back();
                 }
       </script>
	<%@ include file="../footer.jspf" %>
</body>
</html>