<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">

    <title>Home</title>
    <%@ include file="../header.jspf" %>
    <style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
        }

        .modal-content {
            display: block;
            margin: 15% auto;
            max-width: 900px;
            padding: 20px;
            border-radius: 5px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>

</head>

<script type="text/javascript">
    $(function () {
        $("#btnWrite").click(function () {
            location.href = "${path}/trip/write.do";
        });
        $("#btnModify").click(function () {
            location.href = "${path}/trip/view.do";
        });
    });

    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    function redirectToPage() {
        location.href = "${path}/plan/list.jsp";
    }

</script>

<body>
<div class="album py-5">
    <div class="container">
        <h3>관광지</h3>
        <div class="col-sm-3">
            <form class="d-flex" role="search">
                <input type="hidden" name="num" value="${page.pageNum}">
                <select class="border-success rounded-3" name="searchType">
                    <option value="t_subject" <c:if test="${search == 't_subject'}">selected</c:if>>관광명소</option>
                    <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                    <option value="all" <c:if test="${search == 'all'}">selected</c:if>>관광명소+내용</option>
                </select>
                <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search" aria-label="Search" value="${keyword}">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            &nbsp;
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="width: 8%">번호</th>
                <th style="width: 20%">관광명소</th>
                <th style="width: 50%">내용</th>
                <th style="width: 10%">작성일자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <c:forEach var="trip" items="${lists}">
                <td>${trip.t_num}</td>
                <td><a href="#" onclick="openModal('myModal${trip.t_num}')">${trip.t_subject}</a></td>
                <td>${trip.content}</td>
                <td><fmt:formatDate value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <div id="myModal${trip.t_num}" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">${trip.t_subject}</h4>
                        <div class="ml-auto">
                            <a href="${path}/trip/view.do?t_num=${trip.t_num}" class="btn btn-outline-success">글수정</a>
                            <button type="button" class="btn-close" aria-label="Close"
                                    onclick="closeModal('myModal${trip.t_num}')" data-dismiss="modal"></button>
                        </div>
                    </div>
                    <div class="modal-body" style="display: flex;">
                        <div style="flex: 1;">
                            <img src="${path}/resources/images/hanook.png"
                                 alt="이미지" style="width: 100%; height: auto;">
                        </div>
                        <div style="flex: 1; padding-left: 10px;">
                            <p style="float:right;">${trip.content}</p>
                        </div>
                    </div>
                    <div class="modal-footer d-flex">
                        <div style="flex: 1;" class="d-flex justify-content-end align-items-center">
                            <small class="text-muted" style="margin-right: 15px;">작성일:<fmt:formatDate
                                    value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></small>
                            <button class="btn btn-outline-success" onclick="redirectToPage()">플래너
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>

            </tbody>
        </table>
        <button class="btn btn-outline-success" type="submit" id="btnWrite" style="float:right;">글쓰기</button>
        <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5">
            <span>
                <c:if test="${page.pageNum  > 2}">
                    <c:set var="firstPageNum" value="1" />
                <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${firstPageNum}">
                <i class="bi bi-chevron-left"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/trip/listPage?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

            <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
            </c:forEach>

            <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${page.pageNum + 1}">
                    <i class="bi bi-chevron-right"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum != page.lastPageNum}">
                    <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${page.lastPageNum}">
                        <i class="bi bi-chevron-double-right"></i>
                    </a>
                </c:if>
            </span>
        </div>
        <%@ include file="../footer.jspf" %>
    </div>
</div>
</body>
</html>
