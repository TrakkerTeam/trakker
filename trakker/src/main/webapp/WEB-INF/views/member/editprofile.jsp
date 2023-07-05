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
    // 비밀번호 체크
    var mem_pass = $("#mem_pass").val();
    var mem_email =$("#mem_email").val();

    if (mem_pass == "") {
      alert("비밀번호를 필수 입력해주세요");
      $("#mem_pass").focus();
      return;
    }

    $.ajax({
      url: "${path}/member/pwcheck.do",
      method: "POST",
      data: { mem_email: mem_email, mem_pass: mem_pass },
      success: function(response) {
        if (response == "success") {
          window.location.href = "${path}/member/mem_update.do";
          document.form1.submit();
        } else if (response == "failure") {
          alert("비밀번호가 일치하지 않습니다");
        } else {
          alert("비밀번호 체크에 실패했습니다");
        }
      },
      error: function(xhr, status, error) {
        console.error(error);
        alert("비밀번호 체크에 실패했습니다");
      }
    });
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
#container {
		height: 100%;
		width: 100%;
		flex-direction: column;
	}
#category {
                    position: fixed;
                    top: 0;
                    left: 0;
                    height: 100%;
                    width: 200px;
                    background-color: #f8f9fa;
                    border-right: 1px solid #dee2e6;
                    padding-top: 50px;
}
#myedit {
                margin-left: 200px;
}

div a.menubar {
                text-decoration: none;
                display: block;
                color: #000;
                padding: 15px;
                font-weight: bold;
}
.menu > a:hover {
		background-color: #333;
		color: #fff;
	}

.bi-plus-lg {
		font-size: 22px;
	}

p.content2 {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1; /* Set the number of lines to display */
		-webkit-box-orient: vertical;
	}
    </style>
</head>
<body>
    <div class="container album pt-5">
<div style="display: flex; height: auto;">
		<div id="category" class="menu center" style="width:10%; margin-top: 70px">
			            <a class="menubar" href="${path}/member/mypageHeart">좋아요한 플래너</a>
            			<a class="menubar" href="${path}/member/mypagePlanner">내가 만든 플래너</a>
            			<a class="menubar" href="${path}/member/r_list?num=1">내가 쓴 리뷰</a>
            			<a class="menubar" href="${path}/member/editprofile.do">프로필수정</a>
		</div>
<div id="myedit"style= "width:80%;">
<div class="container">
<div class="row">
<h2 class="ps-3 mt-5">프로필 수정</h2>
    	<form name="form1" method="post" style="text-align: left;" action="${path}/member/mem_update.do" enctype="multipart/form-data">
        		<table  width="600px" >
                  <div style="text-align: center;">
                  <tr style="text-align:center;"> <td colspan="2">
                    <label for="file-input" >
                      <img id="previewImage" style="width: 200px; height: 200px; cursor: pointer;" src="${picture_url}" class="img-thumbnail rounded-circle">
                    </label>
                    <input id="file-input" type="file" name="file" style="display: none;">
                    </td></tr>
                  </div>
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
        				<td><input type="password" id="mem_pass" name="mem_pass"></td>
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
                             <td colspan="2"><button type="button" id="logback" name="logback" onclick="back();">취소하기</button>
                             <div style="color: red;">${message}</div></td>
                         </tr>
                         <tr>
                         <td colspan="2">
                         <a href="${path}/member/memdelete.do">회원탈퇴</a></td></tr>
        		</table>
        	</form>
        </div>
        </div>
        </div>
        </div>
</div>
<script>
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
	<%@ include file="../footer.jspf" %>
</body>
</html>