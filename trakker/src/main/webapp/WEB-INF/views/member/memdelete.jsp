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

</head>
<body>
    <h2>회원탈퇴</h2>
<form name="form1" method="post" >
    <table width="400px">
        <tr>
            <td colspan="2">
                <div class="form-floating">
                    <input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="Password">
                    <label for="mem_pass">Password</label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" id="mem_email" value="${sessionScope.mem_email}">
            </td>
        </tr>
        <tr>
            <td colspan="2">* 탈퇴 후 모든 데이터는 삭제됩니다.</td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="button" id="mem_delete" name="mem_delete" onclick="removeMember();">탈퇴하기</button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="button" id="logback" name="logback" onclick="back();">취소하기</button>
                <div style="color: red;">${message}</div>
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript">
    function removeMember() {
        var mem_email = document.getElementById("mem_email").value; // 이메일 입력 필드의 값 가져오기
        var mem_pass = document.getElementById("mem_pass").value; // 비밀번호 입력 필드의 값 가져오기

        if (window.confirm("탈퇴하시겠습니까?")) {
            $.ajax({
                url: "${path}/member/removeMember.do",
                type: "POST",
                data: {
                    mem_email: mem_email,
                    mem_pass: mem_pass
                },
                success: function(response) {
                    if (response === "success") { // 비밀번호 일치 여부 확인
                        console.log("회원 탈퇴 성공");
                        alert("회원 탈퇴 성공");
                        window.location.href = "${path}/member/home.do";
                    } else {
                        console.log("회원 탈퇴 실패: 비밀번호가 일치하지 않습니다.");
                        alert("회원 탈퇴 실패: 비밀번호가 일치하지 않습니다.");
                        window.location.href = "${path}/member/memdelete.do";
                    }
                },
                error: function(xhr, status, error) {
                    console.log("회원 탈퇴 실패: " + error);
                    window.location.href = "${path}/member/memdelete.do";
                }
            });
        }
    }

    function back() {
        history.back();
    }
</script>

	<%@ include file="../footer.jsp" %>
</body>
</html>