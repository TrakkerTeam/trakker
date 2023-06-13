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
    <table  width="400px">
    <tr>
        <td colspan="2" >
        <div class="form-floating" >
              <input type="password" class="form-control"  id="floatingPassword" name="mem_pass" placeholder="Password" >
              <label for="floatingPassword">Password</label>
        </div></td>
    </tr>

    <tr>
        <td colspan="2">* 탈퇴후 모든데이터는 삭제됩니다.</td>
    </tr>

    <tr>
        <td colspan="2"><button type="button" id="mem_delete" name="mem_delete" onclick="removeMember();">탈퇴하기</button></td>
    </tr>

    <tr>
        <td colspan="2"><button type="button" id="logback" name="logback">취소하기</button>
        <div style="color: red;">${message}</div></td>
    </tr>
    </table>
</form>

<script type="text/javascript">
function removeMember() {
	if(window.confirm("탈퇴하시겠습니까?")){
	location.href="${path}/member/removeMember.do";
	}

}
</script>

	<%@ include file="../footer.jsp" %>
</body>
</html>