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
      document.getElementById("mem_address1").value = extraAddr;
     } else {
      document.getElementById("mem_address2").value = '';
     }
     document.getElementById('mem_zipcode').value = data.zonecode;
     document.getElementById("mem_address1").value = addr;
     document.getElementById("mem_address2").focus();
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

  #member{
   background-color: #333;
  }

  .button-container button {
   width: 48%;
  }
  #container {
   display: flex;
   height: 100%;
   width: 100%;
   flex-direction: column;
  }

  #category {
   display: flex;
   flex-direction: column;
   height: 100%;
   width: 15%;
   gap: 25px;
   align-items: center;
   border-right: 1px solid #000000;
   padding-top: 50px;
  }
  div a.menubar {
   text-decoration: none;
   display: flex;
   color: #000;
   padding: 25px 25px 25px 25px;
   font-weight: bold;
  }
  .menu > a:hover {
   background-color: #333;
   color: #fff;
  }
 </style>
</head>
<body>
<%@ include file="../header.jspf" %>

<div id="container">
 <div style="display: flex; height: auto;">
  <div id="category" class="menu" style="width:10%; height:auto;">
          <a class="menubar w-100" id="member" href="${path}/admin/admin_listPage?num=1"><i class="bi bi-person-fill">회원관리</i></a>
            <a class="menubar w-100" id="trip" href="${path}/trip/trip_list_admin?num=1"><i class="bi bi-file-earmark-image">관광명소 관리</i></a>
            <a class="menubar" id="review" href="${path}/admin/Review_listPage?num=1" ><i class="bi bi-file-earmark-richtext">리뷰리스트 관리</i></a>
            <a class="menubar w-100" id="faq" href="${path}/faq/listPage?num=1"><i class="bi bi-chat-right-text">FAQ</i></a>
  </div>

<h2 style="font-size: 20px; margin-left: 100px;">프로필 수정</h2>
<form name="form1" id="form1" method="post" style="text-align: left; padding-left: 100px; margin-top: 80px; " enctype="multipart/form-data">
 <table  width="600px" >
  <div style="text-align: center;">
      <label for="file-input">
          <img id="previewImage" style="width: 200px; height: 200px; cursor: pointer;" src="${picture_url}" class="img-thumbnail rounded-circle">
      </label>
          <input id="file-input" type="file" name="file" style="display: none;">
  </div>
  <tr>
   <td>이메일</td>
   <td>이름</td>
  </tr>
  <tr>
   <td><input type="email" id="mem_email" name="mem_email" value="${dto.mem_email}" readonly></td>
   <td><input type="text" id="mem_name" name="mem_name" value="${dto.mem_name}"></td>
  </tr>

  <tr>
   <td>비밀번호</td>
   <td >비밀번호 확인</td>
  </tr>
  <tr>
   <td><input type="password" id="mem_pass" name="mem_pass" value="${dto.mem_pass}" readonly></td>
   <td><input type="password" id="passwd_ck" name="passwd_ck" value="${dto.mem_pass}"  readonly></td>

  <tr>
   <td>닉네임</td>
   <td>전화번호</td>
  </tr>
  <tr>
   <td><input type="text" id="mem_nickname" name="mem_nickname" value="${dto.mem_nickname}" readonly></td>
   <td><input type="text" id="mem_phone" name="mem_phone" value="${dto.mem_phone}"></td>
  </tr>
  <tr>
   <td style="text-align:center;">우편번호</td>
   <td><input type="text" id="mem_zipcode" name="mem_zipcode" onclick="daumZipCode()" value="${dto.mem_zipcode}" placeholder="우편번호 찾기" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="mem_address1" name="mem_address1" value="${dto.mem_address1}" readonly></td>
  </tr>
  <tr>
   <td colspan="2"><input type="text" id="mem_address2" name="mem_address2" value="${dto.mem_address2}" placeholder="상세주소를 입력해주세요."></td>
  </tr>
     <tr>
      <td colspan="2">
       <input type="hidden" name="mem_num" value="${dto.mem_num}">
        <button type="button" id="userUpdate">수정하기</button>
      </td>
     </tr>
  <tr>
   <td colspan="2"><button type="button" id="logback" name="logback">목록</button>
    <div style="color: red;">${message}</div></td>
  </tr>

 </table>
</form>
 </div>
 <%@include file="../footer.jspf" %>
<script>
 $("#logback").click(function (){
  history.back();

 });


 $("#userUpdate").click(function (){

  var mem_name = $("#mem_name").val();
  var mem_nickname = $("#mem_nickname").val();
  var mem_phone = $("#mem_phone").val();
  var mem_zipcode = $("#mem_zipcode").val();
  var mem_address1 = $("#mem_address1").val();
  var mem_address2 = $("#mem_address2").val();


  if(mem_name == ""){
   alert("이름은 필수입니다.");
   $("#mem_name").focus();
   return;
  }
  if(mem_nickname == ""){
   alert("닉네임을 입력하세요.");
   $("#mem_nickname").focus();
   return;
  }
  if(mem_phone == ""){
   alert("번호를 입력하세요.");
   $("#mem_phone").focus();
   return;
  }
  if(mem_zipcode == ""){
   alert("우편번호를 입력하세요.");
   $("#mem_zipcode").focus();
   return;
  }
  if(mem_address2 == ""){
   alert("상세주소를 입력하세요.");
   $("#mem_address2").focus();
   return;
  }

  if(confirm("정보 수정 완료")){

   document.form1.action="${path}/admin/userUpdate";
   document.form1.submit();
  }

 });

 const fileInput = document.getElementById('file-input');
 const previewImage = document.getElementById('previewImage');

 fileInput.addEventListener('change', function(event) {
  const file = event.target.files[0];
  const reader = new FileReader();

  reader.onload = function(e) {
   previewImage.src = e.target.result;
  };

  reader.readAsDataURL(file);
 });


 function back() {
  history.back();
 }

</script>

</div>
</body>
</html>