<!--faq 리스트를 출력하는 페이지입니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnWrite").click(function () {
                location.href = "${path}/faq/write.do";
            });
        });
    </script>
</head>
<body>
<div class="album py-5">
    <div class="container-xl">
        <div class="col-xl-3">
            <form class="d-flex" role="search">
                <select>
                    <option>제목</option>
                    <option>내용</option>
                    <option>제목+내용</option>
                </select>
                <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>


        <table class="table table-hover">
            <thead>
            <tr>
                <th style="width: 10%">번호</th>
                <th style="width: 60%">제목</th>
                <th style="width: 20%">작성일자</th>
                <th style="width: 10%">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="row" items="${list}">
                <tr>
                    <td>${row.faq_num}</td>
                    <td><a href="${path}/faq/view.do?faq_num=${row.faq_num}">${row.faq_subject}</a></td>
                    <td><fmt:formatDate value="${row.faq_reg_date}"
                                        pattern="yyyy-MM-dd"/></td>
                    <td>${row.readcount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <button class="btn btn-outline-success" type="submit" id="btnWrite" style="float:right;">글쓰기</button>
    </div>
</div>
</body>
</html>