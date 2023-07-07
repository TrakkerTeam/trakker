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
    <title>Review Admin</title>
    <%@ include file="../header.jspf" %>
    <style>
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
            background-color: #20c997;
        }
        div a.menubar {
            text-decoration: none;
            display: flex;
            color: #000;
            padding: 25px 25px 25px 25px;
            font-weight: bold;
            color: rgba(255, 255, 255, 0.55);
        }
        .container {
            padding-top: 40px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        div a.menubar {
            text-decoration: none;
            display: flex;
            color: #000;
            padding: 25px 25px 25px 25px;
            font-weight: bold;
            color: rgba(255, 255, 255, 0.55);
        }
        #review{
            background-color: #333;
        }
        .menu > a:hover {
            background-color: #333;
            color: #fff;
        }
        .btn-write {
            margin-left: auto;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#btnWrite").click(function () {
                location.href = "${path}/review/write";
            });
        });

    </script>
</head>
<body>

<div id="container">
    <div style="display: flex; height: auto;">
        <div id="category" class="menu" style="width:10%; height:auto;">
            <a class="menubar w-100" id="member" href="${path}/admin/admin_listPage?num=1"><i class="bi bi-person-fill">회원관리</i></a>
            <a class="menubar w-100" id="trip" href="${path}/trip/trip_list_admin?num=1"><i class="bi bi-file-earmark-image">관광명소 관리</i></a>
            <a class="menubar w-100" id="review" href="${path}/admin/Review_listPage?num=1" ><i class="bi bi-file-earmark-richtext">리뷰리스트 관리</i></a>
            <a class="menubar w-100" id="faq" href="${path}/faq/listPage?num=1"><i class="bi bi-chat-right-text">FAQ</i></a>
        </div>
        <div class="container">
            <div class="col-xl-3">
                <h3>리뷰글 관리</h3>
                <form class="d-flex" role="search">
                    <input type="hidden" name="num" value="${page.pageNum}">
                                           <select class="border-success rounded-3" name="searchType">
                                               <option value="title" <c:if test="${search == 'title'}">selected</c:if>>제목</option>
                                               <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                                               <option value="mem_nickname" <c:if test="${search == 'mem_nickname'}">selected</c:if>>작성자
                                               </option>
                                           </select>
                                           <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search"
                                                  aria-label="Search" value="${keyword}">
                                           <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
            <c:choose>
            <c:when test="${faq eq [] and param.searchType ne null}">
                <div class="center mt-5 mb-5 pb-5 text-center">
                    <h1><i class="bi bi-search"></i></h1>
                    <h3 class="pb-3" style="margin-left: 200px;">검색조건과 일치하는 글이 없습니다.</h3>
                </div>
                <c:set var="removePaginationIcons" value="true"/>
            </c:when>
            <c:otherwise>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th style="width: 10%">번호</th>
                    <th style="width: 60%">제목</th>
                    <th style="width: 20%">작성자</th>
                    <th style="width: 10%">작성일자</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${list}">
                    <tr>
                        <td>${dto.review_num}</td>
                        <td><a href="${path}/admin/review_view.do?review_num=${dto.review_num}">${dto.title}</a></td>
                        <td>${dto.member.mem_nickname}</td>
                        <td>
                         <c:choose>
                                                <c:when test="${dto.edit_date == null}">
                                                    <fmt:formatDate value="${dto.review_date}" pattern="yyyy-MM-dd"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatDate value="${dto.edit_date}" pattern="yyyy-MM-dd"/>
                                                </c:otherwise>
                                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>
            <button class="btn btn-outline-success btn-write" type="submit" id="btnWrite" style="float:right;">글쓰기
            </button>

            <c:if test="${not removePaginationIcons}">
                <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5" style="padding-left: 35%">

            <span>
                  <c:if test="${page.pageNum > 2}">
                      <c:set var="firstPageNum" value="1"/>
                      <a class="ms-3 text-muted" href="${path}/admin/Review_listPage?num=${firstPageNum}">
                        <i class="bi bi-chevron-double-left"></i>
                      </a>
                  </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/admin/Review_listPage?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

                    <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted"
                                                      href="${path}/admin/Review_listPage?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
                    </c:forEach>

                    <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="ms-3 text-muted" href="${path}/admin/Review_listPage?num=${page.pageNum + 1}">
                    <i class="bi bi-chevron-right"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum != page.lastPageNum}">
                    <a class="ms-3 text-muted" href="${path}/admin/Review_listPage?num=${page.lastPageNum}">
                        <i class="bi bi-chevron-double-right"></i>
                    </a>
                </c:if>
            </span>
                </div>
            </c:if>
        </div>
    </div>
    <%@include file="../footer.jspf" %>
</div>

</body>
</html>
