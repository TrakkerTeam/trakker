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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(5px);
        }
        .modal-content {
            display: block;
            margin: 15% auto;
            max-width: 900px;
            padding: 20px;
            border-radius: 5px;
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
        .limited-lines {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        div a.menubar {
            text-decoration: none;
            display: flex;
            color: #000;
            padding: 25px 25px 25px 25px;
            font-weight: bold;
            color: rgba(255, 255, 255, 0.55);
        }
        #trip{
            background-color: #333;
        }
        .menu > a:hover {
            background-color: #333;
            color: #fff;
        }
        .bi-star-fill {
            color: #ffca2c;
        }
    </style>

</head>

<script type="text/javascript">
    $(function () {
        $("#btnModify").click(function () {
            location.href = "${path}/trip/view.do";
        });
    });

    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }


    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }


</script>

<body>


<div id="container">
    <div style="display: flex; height: auto;">
        <div id="category" class="menu" style="width:10%; height:auto;">
            <a class="menubar w-100" id="member" href="${path}/admin/admin_listPage?num=1"><i class="bi bi-person-fill">회원관리</i></a>
            <a class="menubar w-100" id="trip" href="${path}/trip/trip_list_admin?num=1"><i class="bi bi-file-earmark-image">관광명소 관리</i></a>
            <a class="menubar w-100" id= "review" href="${path}/review/list?num=1" ><i class="bi bi-file-earmark-richtext">리뷰리스트 관리</i></a>
            <a class="menubar w-100" id="faq" href="${path}/faq/listPage?num=1"><i class="bi bi-chat-right-text">FAQ</i></a>
        </div>

        <div class="container">

            <div class="col-sm-3">
                <h3>관광지</h3>
                <form class="d-flex" role="search">
                    <input type="hidden" name="num" value="${page.pageNum}">
                    <select class="border-success rounded-3" name="searchType">
                        <option value="t_subject" <c:if test="${search == 't_subject'}">selected</c:if>>관광명소</option>
                        <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                        <option value="all" <c:if test="${search == 'all'}">selected</c:if>>관광명소+내용</option>
                    </select>
                    <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search"
                           aria-label="Search" value="${keyword}">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                &nbsp;
            </div>
            <c:choose>
            <c:when test="${lists eq [] and param.searchType ne null}">
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
                    <th style="width: 5%">번호</th>
                    <th style="width: 18%">관광명소</th>
                    <th style="width: 57%">내용</th>
                    <th style="width: 20%">작성일자</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach var="trip" items="${lists}">
                    <td>${trip.t_num}</td>
                    <td><a href="#" onclick="openModal('myModal${trip.t_num}')">${trip.t_subject}</a></td>
                    <td class="limited-lines">
                        <div style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                                ${trip.content}
                        </div>
                    </td>
                    <td><fmt:formatDate value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <div id="myModal${trip.t_num}" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">${trip.t_subject}</h4>
                            <div class="ml-auto">
                                <a href="${path}/trip/view.do?t_num=${trip.t_num}"
                                   class="btn btn-outline-success">글수정</a>
                                <button type="button" class="btn-close" aria-label="Close"
                                        onclick="closeModal('myModal${trip.t_num}')" data-dismiss="modal"></button>
                            </div>
                        </div>
                        <div class="modal-body" style="display: flex;">
                            <div style="flex: 1;">
                                <c:set var="img" value="${trip.t_subject}"/>
                                                                <img src="${path}/resources/images/trip/${img}.jpg" onerror="this.src='${path}/resources/images/trip/${img}.png'" class="card-img-top"
                                                                     style="width: 100%; height: 225px;">
                            </div>
                            <div style="flex: 1; padding-left: 10px;">
                                <p style="float:right;">${trip.content}</p>
                            </div>
                        </div>
                        <div class="modal-footer d-flex">
                            <div style="flex: 1;" class="d-flex justify-content-between align-items-center">
                                <div style="display: flex; align-items: center;">
                                    <i class="bi bi-star-fill me-1" style="margin-right: 5px;"></i>
                                    <div id="result" style="text-align: left;">
                                        <h3 class="mt-2" style="margin: 0;">
                                            <fmt:formatNumber value="${trip.rating.ratingAvg}" pattern="0.0"/>
                                        </h3>
                                    </div>
                                </div>
                                <small class="text-muted" style="margin-left: auto;">작성일:<fmt:formatDate
                                        value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></small>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>


            <c:if test="${not removePaginationIcons}">
                <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5" style="padding-left: 25%">
            <span>
                <c:if test="${page.pageNum  > 2}">
                    <c:set var="firstPageNum" value="1"/>
                    <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${firstPageNum}">
                <i class="bi bi-chevron-double-left"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/trip/trip_list_admin?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

                    <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted"
                                                      href="${path}/trip/trip_list_admin?num=${num}">${num}</a></c:if>
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
            </c:if>
        </div>
    </div>
    <%@ include file="../footer.jspf" %>
</div>
</body>
</html>
