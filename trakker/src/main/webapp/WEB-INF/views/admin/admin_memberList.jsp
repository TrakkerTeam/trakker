<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">
<script src="${path}/include/jquery-3.6.3.min.js"></script>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    .container {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }

    table {
      width: 700px;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid black;
      padding: 8px;
    }
    div a.menubar {
      text-decoration: none;
      display: flex;
      color: #000;
      padding: 25px 25px 25px 25px;
      font-weight: bold;
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
  </style>
<body>
<%@ include file="../header.jspf" %>

<div id="container">
  <div style="display: flex; height: auto;">
    <div id="category" class="menu" style="width:10%; height:auto;">
      <a class="menubar" href="${path}/admin/memberList">회원관리</a>
      <a class="menubar" href="${path}/trip/list_admin.do">관광명소 관리</a>
      <a class="menubar" href="${path}/review/list.do" >리뷰리스트 관리</a>
      <a class="menubar" href="${path}/faq/list.do">FAQ</a>
    </div>

<div class="container" >

  <h2>유저 목록</h2>

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <table class="table table-hover">


    <thead>


    <tr>
      <th>회원번호</th>

      <th>이메일</th>


      <th>이름</th>


      <th>주소</th>


      <th>가입일자</th>
    </tr>


    </thead>


    <tbody>




    <c:forEach var="row" items="${list}">
      <tr>
        <td>${row.mem_num}</td>

        <td>${row.mem_email}</td>



        <td><%-- 클릭 시 상세페이지 호출--%>
          <input type="hidden" id="mem_num" name="mem_num" value="${row.mem_num}">
          <a href="${path}/admin/view.do?mem_num=${row.mem_num}">${row.mem_name}</a>
        </td>


        <td>${row.mem_address1}</td>


        <td><fmt:formatDate value="${row.mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>


      </tr>


    </c:forEach>


    </tbody>


  </table>
</div>
  </div>
</div>
</body>
</html>