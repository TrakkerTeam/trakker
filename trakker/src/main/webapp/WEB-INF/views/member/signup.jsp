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

        function TermofUse(){
            var popOption ="width = 650xp, height=550px, top=300px, left=300px, scrollbars=yes";
			window.open("${path}/member/termsofuse.do", "개인정보처리방침",popOption);
		}

function check() { //회원가입 버튼눌렀을때 실행됨
	//email 체크
    	var mem_email =$("#mem_email").val();
    	if(mem_email =="") {
    		alert("이메일을 필수 입력해주세요");
    		$("#mem_email").focus();
    		return;
    	}

	//비밀번호 체크
	var mem_pass =$("#passwd").val();
	if(mem_pass =="") {
		alert("비밀번호를 필수 입력해주세요");
		$("#passwd").focus();
		return;
	}

	//이름 체크
	var mem_name =$("#name").val();
	if(mem_name =="") {
		alert("이름을 필수 입력해주세요");
		$("#name").focus();
		return;
	}
	//닉네임 체크
    	var mem_nickname =$("#nickname").val();
    	if(mem_nickname =="") {
    		alert("닉네임을 필수 입력해주세요");
    		$("#nickname").focus();
    		return;
    	}

	//주소체크
	var mem_zipcode =$("#zipcode").val();
	if(mem_zipcode =="") {
		alert("우편번호 찾기를 누르세요");
		$("#zipcode").focus();
		return;
	}

	//체크박스 여부체크
	var checkbox = document.getElementById("checkbox");
        if (!checkbox.checked) {
            alert("이용약관에 동의해야 회원가입이 가능합니다.");
            return;
        }
	document.form1.submit();
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
            padding: 4px;
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

        #mem_email{
           width:130%;
        }

        #mailCheckBtn{
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

        .id_ok{
        color:#008000;
        display: none;
        }

        .id_already{
        color:#ff0000;
        display: none;
        }
    </style>

</head>
<body>
	<h2>SIGN UP</h2>
	<form name="form1" method="post"  action="${path}/member/insertMember.do" >
		<div>
		<table  width="400px">
			<tr>
				<td  colspan="2">이메일</td>
			</tr>
			<tr>
            	<td><input type="email" id="mem_email" name="mem_email" oninput = "checkEmail()"></td>
            	<td id="auth_number"><button  id="mailCheckBtn" name="mailCheckBtn">인증번호 발급</button></td>
            </tr>

            <tr>
            <td colspan="2"> <span class="id_ok">사용 가능한 이메일입니다.</span>
                <span class="id_already">중복된 이메일입니다 다른이메일을 입력해주세요.</span></td>
            </tr>

            <tr>
                 <td colspan="2"><input type="text" class="mail-check-input" id="email_check" name="email_check" placeholder="인증번호 6자리를 입력해주세요." maxlength="6"></td>
            </tr>

            <tr>
                <td colspan="2"><span id="mail-check-warn"></span></td>
            </tr>

			<tr>
				<td colspan="2">비밀번호</td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" id="passwd" name="mem_pass" maxlength="16" oninput = "checkPass()"></td>
			</tr>
			<tr>
			    <td colspan="2"><span id="pass-error" style="color: red;"></span>
			    <span id="pass-ok" style="color: green;"></span>
			    </td>
			</tr>

			<tr>
            	<td colspan="2">비밀번호 확인</td>
            </tr>

            <tr>
            	<td colspan="2"><input type="password" id="passwd_ck" name="passwd_ck"maxlength="16"oninput="checkPassMatch()"></td>
            </tr>

            <tr>
              <td colspan="2"><span id="pass-match-error" style="color: red;"></span>
              <span id="pass-match" style="color: green;"></span></td>
            </tr>

            <tr>
                <td>이름</td>
                <td>닉네임</td>
            </tr>
            <tr>
                 <td><input type="text" id="name" name="mem_name"></td>
                 <td><input type="text" id="nickname" name="mem_nickname"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>성별</td>
            </tr>
            <tr>
                <td><input type="text" id="birth" name="mem_birth"placeholder="생년월일 6자리 입력" maxlength="6"></td>
                <td><input type="text" id="gender" name="mem_gender" placeholder="1~4까지의 숫자만 입력!" maxlength="1"></td>
            </tr>
             <tr>
                	<td colspan="2">전화번호</td>
             </tr>
                <tr>
                	<td colspan="2"><input type="text" id="tel" name="mem_phone" maxlength="13" placeholder=" - 는 생략해주세요"></td>
                </tr>
                <tr>
                     <td>우편번호</td>
                     <td><input type="text" id="zipcode" name="mem_zipcode" onclick="daumZipCode()" placeholder="우편번호 찾기" readonly></td>
                </tr>
                <tr>
                     <td colspan="2"><input type="text" id="address1" name="mem_address1" readonly></td>
                </tr>
                <tr>
                     <td colspan="2"><input type="text" id="address2" name="mem_address2" placeholder="상세주소를 입력해주세요."></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkbox" id="checkbox"> 이용약관 동의 </td>
                    <td><a onclick="TermofUse()">[보기]</a> </td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="signup" name="signup" onclick="check()">회원가입</button></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" id="logback" name="logback">뒤로가기</button></td>
                </tr>
		</table>
		</div>
	</form>
	<%@ include file="../footer.jsp" %>

	<script type="text/javascript">
      $(document).ready(function() {
        $('#mailCheckBtn').click(function(event) {
          event.preventDefault(); // 폼 제출을 막음

          const mem_email = $('#mem_email').val(); // 이메일 주소값 얻어오기!
          console.log('완성된 이메일: ' + mem_email); // 이메일 확인 출력

          // 이메일 유효성 검사
              if (!/^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,4}$/.test(mem_email)) {
                alert('유효한 이메일 주소를 입력해주세요');
                return;
              }

          const checkInput = $('.mail-check-input'); // 인증번호 입력하는 곳

          $.ajax({
            type: 'get',
            url: '${path}/member/mailCheck.do?mem_email=' + mem_email,
            success: function(data) {
              console.log("data: " + data);
              checkInput.attr('disabled', false);
              code = data;
              alert('인증번호가 전송되었습니다.');
            }
          }); // end ajax
        });

        // 인증번호 비교
        $('.mail-check-input').blur(function () {
          const inputCode = $(this).val();
          const $resultMsg = $('#mail-check-warn');

          if (inputCode === code) {
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color', 'green');
            $('#mailCheckBtn').attr('disabled', true);
            $('#mem_email').attr('readonly', true);
          } else {
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color', 'red');
          }
        });
      });

      function checkEmail(){
              var mem_email = $('#mem_email').val();
              $.ajax({
                  url:'${path}/member/emailCheck.do',
                  type:'post', //POST 방식으로 전달
                  data:{mem_email:mem_email},
                  success:function(cnt){
                      if(cnt == 0){//사용가능한 아이디
                          $('.id_ok').css("display","inline-block");
                          $('.id_already').css("display", "none");
                          $('#mailCheckBtn').removeAttr('disabled');
                      } else { //존재하는 아이디
                          $('.id_already').css("display","inline-block");
                          $('.id_ok').css("display", "none");
                          $('#mailCheckBtn').attr('disabled', 'disabled');
                          alert("이메일을 다시 입력해주세요");
                      }
                  },
                  error:function(){
                      alert("에러입니다");
                  }
              });
              };

              function checkPass() { //비밀번호 정규화처리
                var mem_pass = document.getElementById('passwd').value;

                // 비밀번호 정규화 처리 (숫자,문자,특수문자 무조건 1개 이상, 비밀번호 최소 8자에서 최대 16자까지 허용)
                var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;

                if (pattern.test(mem_pass)) {
                  // 정규화 처리에 맞는 경우
                  document.getElementById('pass-error').textContent = '';
                  document.getElementById('pass-ok').textContent = '비밀번호 사용가능!';
                } else {
                  // 정규화 처리에 맞지 않는 경우
                  document.getElementById('pass-error').textContent = '숫자,문자,특수문자를 사용하여 최소 8자이상 16자이하';
                  document.getElementById('pass-ok').textContent = '';
                }
              }

              function checkPassMatch() { //비밀번호 확인
                var password = document.getElementById('passwd').value;
                var confirmPassword = document.getElementById('passwd_ck').value;

                if (password !== confirmPassword) {
                  document.getElementById('pass-match-error').textContent = '비밀번호가 일치하지 않습니다.';
                  document.getElementById('pass-match').textContent = '';
                } else {
                  document.getElementById('pass-match-error').textContent = '';
                  document.getElementById('pass-match').textContent = '비밀번호가 일치합니다.';
                }
              }

    </script>

</body>
</html>
