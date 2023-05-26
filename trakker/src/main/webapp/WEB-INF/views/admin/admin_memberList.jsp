<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <%@ include file="../itemfile.jsp" %>
<style>
.container {
display: flex;
flex-direction: column;
align-items: center;
}

table {
width: 700px;
border-collapse: collapse;
}

th, td {
border: 1px solid black;
padding: 8px;
}
</style>
<body>
<%@ include file="../header.jsp" %>
<div class="container">

  <h2>회원목록</h2>
  <input type="button" value="회원등록" onclick="location.href='${path}/member/write.do'">


  <table>


    <thead>


    <tr>


      <th>이메일</th>


      <th>이름</th>


      <th>주소</th>


      <th>가입일자</th>
    </tr>


    </thead>


    <tbody>




    <c:forEach var="row" items="${list}">
      <tr>


        <td>${row.mem_email}</td>




        <td><a href="${path}/admin/view.do?mem_num=${row.mem_num}">${row.mem_name}</a></td>


        <td>${row.mem_address1}</td>


        <td><fmt:formatDate value="${row.mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>


      </tr>


    </c:forEach>


    </tbody>


  </table>
</div>

</body>
</html>
