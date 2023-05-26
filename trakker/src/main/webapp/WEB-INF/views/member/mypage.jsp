<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%@ include file="../header.jsp"%>
<style>
#search1{
padding-top:20px;

}
#div1{
padding-top:50px;
}
</style>

</head>
<body>
<h2>마이페이지</h2>
            <h2> ${sessionScope.mem_name}님</h2>
            <button type="button" id="edit_profile"  onclick="window.location.href='${path}/member/editprofile.do'">프로필수정</button>
            <a href="${path}/member/memdelete.do">회원탈퇴</a>
    <%@ include file="mypagecontent.jsp" %>
	<%@ include file="../footer.jsp" %>
</body>
</html>