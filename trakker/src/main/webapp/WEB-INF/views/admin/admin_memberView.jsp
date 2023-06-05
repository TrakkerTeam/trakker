<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
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

<h2>프로필</h2>
<form name="form1" method="post">
 <table  width="400px">
  <tr>
   <td  colspan="2">이메일</td>
  </tr>
  <tr>
   <td colspan="2"> <input type="email" id="email" name="email" value="${sessionScope.mem_email}" readonly></td>
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
   <td><input type="text" id="name" name="name" value="${sessionScope.mem_name}"></td>
   <td><input type="text" id="nickname" name="nickname" value="${sessionScope.mem_nickname}"></td>
  </tr>

  <tr>
   <td colspan="2">전화번호</td>
  </tr>

  <tr>
   <td colspan="2"><input type="text" id="tel" name="tel" value="${sessionScope.mem_phone}"></td>
  </tr>

  <tr>
   <td>우편번호</td>
   <td><input type="text" id="zipcode" name="zipcode" onclick="daumZipCode()" value="${sessionScope.mem_zipcode}" placeholder="우편번호 찾기" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="address1" name="address1" value="${sessionScope.mem_address1}" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="address2" name="address2" value="${sessionScope.mem_address2}" placeholder="상세주소를 입력해주세요."></td>
  </tr>

  <tr>
   <td colspan="2"><button type="button" id="mem_update" name="mem_update">수정하기</button></td>
  </tr>
  <tr>
   <td colspan="2"><button type="button" id="logback" name="logback">취소하기</button>
    <div style="color: red;">${message}</div></td>
  </tr>

 </table>
</form>
</body>
</html>