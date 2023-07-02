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
    <%@ include file="../header.jspf" %>
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
                <input type="hidden" name="num" value="${page.pageNum}">
                <select class="border-success rounded-3" name="searchType">
                    <option value="faq_subject" <c:if test="${search == 'faq_subject'}">selected</c:if>>제목</option>
                    <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                    <option value="all" <c:if test="${search == 'all'}">selected</c:if>>제목+내용</option>
                </select>
                <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search" aria-label="Search" value="${keyword}">
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
            <c:forEach var="faq" items="${list}">
                <tr>
                    <td>${faq.faq_num}</td>
                    <td><a href="${path}/faq/view.do?faq_num=${faq.faq_num}">${faq.faq_subject}</a></td>
                    <td><fmt:formatDate value="${faq.faq_reg_date}" pattern="yyyy-MM-dd"/></td>
                    <td>${faq.readcount}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <button class="btn btn-outline-success" type="submit" id="btnWrite" style="float:right;">글쓰기</button>
        <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5">

            <span>
                  <c:if test="${page.pageNum > 2}">
                      <c:set var="firstPageNum" value="1" />
                      <a class="ms-3 text-muted" href="${path}/faq/listPage?num=${firstPageNum}">
                        <i class="bi bi-chevron-double-left"></i>
                      </a>
                  </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/faq/listPage?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

            <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted" href="${path}/faq/listPage?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
            </c:forEach>

            <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="ms-3 text-muted" href="${path}/faq/listPage?num=${page.pageNum + 1}">
                    <i class="bi bi-chevron-right"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum != page.lastPageNum}">
                    <a class="ms-3 text-muted" href="${path}/faq/listPage?num=${page.lastPageNum}">
                        <i class="bi bi-chevron-double-right"></i>
                    </a>
                </c:if>
            </span>
        </div>
        <%@include file="../footer.jspf" %>
    </div>
</div>
</body>
</html>
