<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
    </style>
<body>

<div class="container">

    <h2>유저 목록</h2>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <table class="table table-hover">
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
                <td><a href="#" onclick="userview()">${row.mem_name}</a></td>
                <td>${row.mem_address1}</td>
                <td><fmt:formatDate value="${row.mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div id="result" style="display: flex;"></div>
<script>
    function userview() {
        $.ajax({
            type: "post",
            url: "${path}/admin/view.do",
            success: function (result) {
                $("#result").html(result);
            }
        });
    }
</script>
</body>
</html>
