<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/resources/include/style.css">
<script src="${path}/resources/include/jquery-3.6.3.min.js"></script>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>adminList</title>
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
<h2>프로필 수정</h2>
<form name="form1" id="form1" method="post" style="text-align: left;">
 <table  width="600px" >
  <tr>
   <td colspan="2" id="profileimg">
    <img  style="width:200px; height:200px;"  src="../resources/images/car.gif" class="img-thumbnail rounded-circle">
   </td>
  </tr>

  <tr>
   <td>이메일</td>
   <td>이름</td>
  </tr>
  <tr>
   <td><input type="email" id="email" name="email" value="${dto.mem_email}" readonly></td>
   <td><input type="text" id="name" name="name" value="${dto.mem_name}"></td>
  </tr>

  <tr>
   <td>비밀번호</td>
   <td >비밀번호 확인</td>
  </tr>
  <tr>
   <td><input type="password" id="passwd" name="passwd" value="${dto.mem_pass}" readonly></td>
   <td><input type="password" id="passwd_ck" name="passwd_ck" value="${dto.mem_pass}"  readonly></td>

  <tr>
   <td>닉네임</td>
   <td>전화번호</td>
  </tr>
  <tr>
   <td><input type="text" id="nickname" name="nickname" value="${dto.mem_nickname}"></td>
   <td><input type="text" id="tel" name="tel" value="${dto.mem_phone}"></td>
  </tr>
  <tr>
   <td style="text-align:center;">우편번호</td>
   <td><input type="text" id="zipcode" name="zipcode" onclick="daumZipCode()" value="${dto.mem_zipcode}" placeholder="우편번호 찾기" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="address1" name="address1" value="${dto.mem_address1}" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="address2" name="address2" value="${dto.mem_address2}" placeholder="상세주소를 입력해주세요."></td>
  </tr>
     <tr>
      <td colspan="2">
        <button type="button" id="userUpdate">수정하기</button>
      </td>
     </tr>
  <tr>
   <td colspan="2"><button type="button" id="logback" name="logback">목록</button>
    <div style="color: red;">${message}</div></td>
  </tr>

 </table>
</form>
<script>
 console.log("회원 번호 :" + ${dto.mem_num});

 $("#userUpdate").click(function (){

  if(confirm("정보 수정 완료")){

   document.form1.action="${path}/admin/userUpdate";
   document.form1.submit();
  }

 });
</script>

</body>
</html>