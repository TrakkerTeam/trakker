<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../itemfile.jsp" %>
	<style>

#container{
	display: flex;
	height: 100%;
	width: 100%;
	flex-direction: column;
}
#category{
	display: flex;
	flex-direction: column;
	height: 100%;
	width: 15%;
	gap: 10px;
	align-items: center;
	background-color: darkseagreen;
	justify-content: space-around;
}
#content1{
	display: flex;
	width: 50%;
	height: 50%;
	border: 1px solid;
	justify-content: flex-start;

}
#content2{
	display: flex;
	width: 50%;
	height: 50%;
	border: 1px solid;

}
#content3{
	display: flex;
	flex-wrap: wrap;
	border: 1px solid;
	width: 100%;
	height: 100%;
}
div a{
	text-decoration: none;
	display: flex;
	color: #000;
	padding: 8px 15px 8px 15px;
	font-weight: bold;
}
div a.menu{
	background-color: blanchedalmond;
	color: #fff;
}
.menu > a:hover{
	background-color: #333;
	color: #fff;
}
	</style>
<body id="maincon">
<%@ include file="../header.jsp" %>
<div id="container">

	<div style="display: flex; height: 500px;">
		<div id="category" class="menu">
			<a href="${path}/admin/memberList" >회원관리</a>
			<a href="#">관광명소 관리</a>
			<a href="#">문의 게시판</a>
		</div>
		<div id="result" style="display: flex; width:100%;"></div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>