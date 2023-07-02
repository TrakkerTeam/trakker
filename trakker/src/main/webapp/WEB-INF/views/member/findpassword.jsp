<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jspf"%>
<script>
	$(function(){
        $("#findpassbtn").click(function(){
            const mem_email = $('#mem_email').val();
            console.log('완성된 이메일: ' + mem_email);

            // 이메일 유효성 검사
            if (!/^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,4}$/.test(mem_email)) {
                alert('유효한 이메일 주소를 입력해주세요');
                return;
            }

            $.ajax({
                url: "${path}/member/findpass",
                type: "POST",
                data: {
                    mem_email: $("#mem_email").val()
                },
                success: function(response) {
                    console.log("response: " + response);
                    if (response === "success") {
                        alert("임시 비밀번호 발급완료");
                        document.form1.submit();
                        window.location.href = "${path}/member/home.do";
                    } else {
                        alert("이메일이 존재하지 않습니다.");
                        window.location.href = "${path}/member/findpassword.do";
                    }
                },
                error: function(xhr, status, error) {
                    console.log("임시 비밀번호 발급 실패: " + error);
                    window.location.href = "${path}/member/findpassword.do";
                }
            })
        });
    });


</script>


<style>
body {
  font-family: Arial, sans-serif;

}
h2 {
        padding:20px;
            text-align: center;
            color: #333;
        }

  form{
            padding:10px;
        }

table {
            width: 400px;
            margin: 0 auto;
            border-collapse: collapse;
}
 table td {
            padding: 12px;
        }

input[type="email"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
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

button:hover {
  background-color: #0056b3;
}

small {
  color: #777;
}

</style>
</head>
<body>

	<h2>비밀번호 찾기</h2>
	<form name="form1" method="post">
		<table  width="400px">
			<tr>
            	<td>
            	<div class="form-floating mb-1">
                                      <%--@declare id="floatinginput"--%><input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="name@example.com">
                                      <label for="floatingInput">Email address</label>
                            </div></td>
            </tr>
			<tr>
				<td>회원가입시 등록하셨던 이메일 주소를 입력해주시면 임시 비밀번호를 발급해드립니다.</td>
			</tr>
			<tr>
				<td  align="center">
					<button type="button" id="findpassbtn">발급받기</button>
				</td>
			</tr>
			<tr>
			    <td>* 메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.</td>
			</tr>
			<tr>
                <td>  * 스팸 메일함으로 발송될 수 있으니 체크바랍니다.</td>
			</tr>

			<tr>
            	<td  align="center">
            			<button type="button" id="back">뒤로가기</button>
            	</td>
            </tr>
		</table>
	</form>
<%@ include file="../footer.jspf" %>
</body>
</html>