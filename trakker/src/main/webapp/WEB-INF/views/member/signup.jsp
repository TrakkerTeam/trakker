<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function daumZipCode() {
	new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("address1").value = extraAddr;
            } else {
                document.getElementById("address2").value = '';
            }
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            document.getElementById("address2").focus();
        }
    }).open();
}
</script>


<style>
        body {
            font-family: Arial, sans-serif;
            padding-top:80px;
        }

        h2 {
            padding: 20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 400px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        table td {
            padding: 8px;
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

        #email{
           width:130%;
        }

        #authentication_number{
            width :65%;
        }

        #auth_number{
           text-align : right;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
        }

        .checkbox-container input[type="checkbox"] {
            margin-right: 6px;
        }

        .checkbox-container a {
            text-decoration: none;
            color: #333;
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
	<h2>SIGN UP</h2>
	<form name="form1" method="post">
		<table  width="400px">
			<tr>
				<td  colspan="2">이메일</td>
			</tr>
			<tr>
            	<td><input type="email" id="email" name="email"></td>
            	<td id="auth_number"><button type="button" id="authentication_number" name="authentication_number">인증번호 발급</button></td>
            </tr>

            <tr>
                 <td colspan="2"><input type="text" id="emailcheck" name="emailcheck" placeholder="인증번호를 입력해주세요."></td>
            </tr>

			<tr>
				<td colspan="2">비밀번호</td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" id="passwd" name="passwd"></td>
			</tr>

			<tr>
            	<td colspan="2">비밀번호 확인</td>
            </tr>
            <tr>
            	<td colspan="2"><input type="password" id="passwd_ck" name="passwd_ck"></td>
            </tr>

            <tr>
                <td>이름</td>
                <td>닉네임</td>
            </tr>
            <tr>
                 <td><input type="text" id="name" name="name"></td>
                 <td><input type="text" id="nickname" name="nickname"></td>
            </tr>

            <tr>
                <td colspan="2">생년월일</td>
            </tr>
            <tr>
                <td><input type="text" id="birth" name="birth"></td>
                <td><input type="text" id="gender" name="gender"></td>
            </tr>

             <tr>
                	<td colspan="2">전화번호</td>
             </tr>

                <tr>
                	<td colspan="2"><input type="text" id="tel" name="tel"></td>
                </tr>

                <tr>
                     <td>우편번호</td>
                     <td><input type="text" id="zipcode" name="zipcode" onclick="daumZipCode()" placeholder="우편번호 찾기" readonly></td>
                </tr>
                <tr>
                     <td colspan="2"><input type="text" id="address1" name="address1" readonly></td>
                </tr>
                <tr>
                     <td colspan="2"><input type="text" id="address2" name="address2" placeholder="상세주소를 입력해주세요."></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="req"> 이용약관 동의 </td>
                    <td><a href="#">[보기]</a> </td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="signup" name="signup">회원가입</button></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="logback" name="logback">뒤로가기</button></td>
                </tr>

		</table>
	</form>
	<%@ include file="../footer.jsp" %>
</body>
</html>