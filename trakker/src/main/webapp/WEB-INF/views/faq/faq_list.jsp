<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function(){
		location.href="${path}/faq/write.do";
	});
});
</script>
<style>
    p{
        text-align: center;
    }
    body {
        padding-top: 80px;
    }
</style>
</head>
<body>
<p class="h2">FAQ</p>

    <div class="col-sm-3">
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


<button type="submit" class="btn text-white" id="btnWrite" style="float:right; background-color: #20c997">글쓰기</button>

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
        <td>${row.faq_subject}</td>
        <td><fmt:formatDate value="${row.faq_reg_date }"
                             pattern= "yyyy-MM-dd"/></td>

    </tr>
    </c:forEach>
    </tbody>
</table>
<%@ include file="../footer.jsp" %>
</body>
</html>