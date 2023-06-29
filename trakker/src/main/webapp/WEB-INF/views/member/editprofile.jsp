<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jspf"%>
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

  function btnUpdate() {
    window.location.href = "${path}/member/mem_update.do";
    document.form1.submit();
  }
  function edit_passPage(){
  window.location.href = "${path}/member/editpass.do";
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
    .profile-btn-area{
             text-align: center;
    }

    </style>
</head>
<body>

    <h2>프로필 수정</h2>
    	<form name="form1" method="post" style="text-align: left;" action="${path}/member/mem_update.do" enctype="multipart/form-data">
        		<table  width="600px" >

        		<div class="profile-btn-area" >
                  <input type="file" name="uploadImage" id="input-image" accept="image/*" style="display: none;">
                  <label for="input-image" class="btn-select-image">
                    <img id="previewImage" style="width:200px; height:200px; cursor: pointer;" src="../resources/images/hanook.png" class="img-thumbnail rounded-circle">
                  </label>
                </div>


                <!--     <tr>
                         <td colspan="2" id="profileimg">
                            <a href=""> <img  style="width:200px; height:200px;"  src="../resources/images/hanook.png" class="img-thumbnail rounded-circle"></a>
                         </td>
        		    </tr> -->

        			<tr>
        				<td>이메일</td>
        				<td>이름</td>
        			</tr>
        			<tr>
                    	<td><input type="email" id="mem_email" name="mem_email" value="${sessionScope.mem_email}" readonly></td>
                    	<td><input type="text" id="mem_name" name="mem_name" value="${sessionScope.mem_name}"></td>
                    </tr>

        			<tr>
        				<td>비밀번호</td>
        				<td>비밀번호 변경</td>
        			</tr>
        			<tr>
        				<td><input type="password" id="mem_pass" name="mem_pass" value="${sessionScope.mem_pass}"></td>
        				<td><button type="button" id="edit_pass" name="edit_pass" onclick="edit_passPage()">비밀번호 변경</button></td>

                    <tr>
                        <td>닉네임</td>
                        <td>전화번호</td>
                    </tr>
                    <tr>
                         <td><input type="text" id="mem_nickname" name="mem_nickname" value="${sessionScope.mem_nickname}"></td>
                         <td><input type="text" id="mem_phone" name="mem_phone" value="${sessionScope.mem_phone}"></td>
                    </tr>
                        <tr>
                             <td style="text-align:center;">우편번호</td>
                             <td><input type="text" id="mem_zipcode" name="mem_zipcode" onclick="daumZipCode()" value="${sessionScope.mem_zipcode}" placeholder="우편번호 찾기" readonly></td>
                        </tr>
                        <tr>
                             <td colspan="2"><input type="text" id="mem_address1" name="mem_address1" value="${sessionScope.mem_address1}" readonly></td>
                        </tr>
                        <tr>
                             <td colspan="2"><input type="text" id="mem_address2" name="mem_address2" value="${sessionScope.mem_address2}" placeholder="상세주소를 입력해주세요."></td>
                        </tr>

                         <tr>
                             <td colspan="2"><button type="button" id="mem_update" name="mem_update" onclick="btnUpdate()" >수정하기</button></td>
                         </tr>
                         <tr>
                             <td colspan="2"><button type="button" id="logback" name="logback">취소하기</button>
                             <div style="color: red;">${message}</div></td>
                         </tr>
        		</table>
        	</form>
<script>
  document.getElementById("input-image").addEventListener("change", function(e) {
    var reader = new FileReader();
    reader.onload = function(event) {
      document.getElementById("previewImage").src = event.target.result;
    };
    reader.readAsDataURL(e.target.files[0]);
  });
</script>
	<%@ include file="../footer.jspf" %>
</body>
</html>