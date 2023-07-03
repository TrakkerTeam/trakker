<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Random" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%@ include file="../header.jspf" %>
</head>
<style>
    .card .card-img-overlay {
        overflow: hidden;
        display: none;
    }

    .card {
        transition: all 0.3s ease-in-out;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card:hover .card-img-overlay {
        display: block;
    }

    .card-text {
        display: -webkit-box;
        max-width: 400px;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    h2 a, h2 a:hover, small a {
        color: #6c757d !important;
        text-decoration-line: none;
    }

    .sta, .h6 {
        color: #ffffff;
    }

</style>
<script>
    $(window).on('load', function () {
        const urlParams = new URL(location.href).searchParams;
        const area = urlParams.get('area');
        const sort = urlParams.get('sort');
        if (area || sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });

    function optionChange(type, param) {
        const urlParams = new URLSearchParams(location.search);
        switch (type) {
            case 'resetTag':
                urlParams.delete("sort");
                urlParams.delete("area");
                break;
            case 'sortTag':
                urlParams.set("sort", param);
                break;
            case 'areaTag':
                urlParams.set("area", param);
                break;
            case 'num':
                urlParams.set("num", param);
                break;
            case 'search':
                const type = document.getElementById('searchType').value;
                const keyword = document.getElementById('keyword').value;
                urlParams.delete("num");
                urlParams.set("searchType", type);
                urlParams.set("keyword", keyword);
        }
        location.href = '${path}/review/list?' + urlParams.toString();
    }

    $(function () {
        $("#Write").click(function () {
            location.href = "${path}/review/write";
        });
    });

</script>
<body>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-sm-8"><h2 class="ps-5 mt-5"><a href="${path}/review/list?num=1">리뷰게시판</a></h2></div>
            <div class="col-sm-4">
                <div class="d-flex pe-5 mt-5">
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
            </div>
        </div>
        <div class="pe-5 text-end">
            <a class="text-muted text-decoration-none" data-bs-toggle="collapse" data-bs-target="#d-search">
                <small class="bi bi-caret-down-fill">옵션</small>
            </a>
            <div class="collapse" id="d-search">
                <small><a href="javascript:void(0);" onclick="optionChange('resetTag', 'reset')">초기화</a></small>
                <div class="mt-2">
                    <small>
                        <c:choose>
                            <c:when test="${sort == 'ratingAvg'}">
                                <strong><i>인기순</i></strong>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0);" onclick="optionChange('sortTag', 'ratingAvg')">인기순</a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${sort == 'add'}">
                                <strong><i>최신순</i></strong>
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:void(0);" onclick="optionChange('sortTag', 'add')">최신순</a>
                            </c:otherwise>
                        </c:choose>
                    </small>
                </div>
                <div class="mt-1">
                    <small class="text-muted">
                        <c:forEach items="${local}" var="l">
                            <c:choose>
                                <c:when test="${l.lnum eq area}">
                                    <strong><i>${l.kname}</i></strong>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0);"
                                       onclick="optionChange('areaTag', ${l.lnum})">${l.kname}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </small>
                </div>
            </div>
        </div>
        <c:choose>
        <c:when test="${list eq []}">
            <div class="center mt-5 mb-5 pb-5">
                <h1><i class="bi bi-search"></i></h1>
                <h3 class="pb-3">검색조건과 일치하는 리뷰글이 없습니다.</h3>
            </div>
        </c:when>
        <c:otherwise>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach var="review" items="${list}">

                <div class="col p-5">
                    <div class="card rounded-3 shadow-sm">
                        <a href="${path}/review/detail?review_num=${review.review_num}"
                           style="text-decoration-line:none;">
                            <c:set var="randomNumber" value="${Random().nextInt(6) + 1}"/>
                            <c:set var="region" value="${review.lnum}"/>
                            <img src="${path}/resources/images/local/${region}/${region}-${randomNumber}.jpg"
                                 class="card-img-top w-100" style="height: 242px;">
                            <div class="card-body rounded-3 p-0 w-100">
                                <h6 class="text-muted ms-3 mt-3">${review.member.mem_nickname}</h6>
                                <p class="card-text m-3">${review.title}</p>
                            </div>
                            <div class="card-img-overlay rounded-3 p-0">
                                <div class="card-body align-text-top text-end p-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="h6">${review.local.kname}</h6>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <i class="bi bi-star-fill me-1 pb-1 sta"></i>
                                            <h5 class="mt-3 sta"><fmt:formatNumber value="${review.rating.ratingAvg}"
                                                                                   pattern="0.0"/></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
            </c:otherwise>
            </c:choose>
        </div>
        <div class="d-flex justify-content-center align-items-center py-4 my-5 h5">
        <span>
            <c:if test="${page.pageNum > 2}">
                <a class="ms-3 text-muted" onclick="optionChange('num', 1)"><i
                        class="bi bi-chevron-double-left"></i></a>
            </c:if>
            <c:if test="${page.pageNum > 1}">
                <a class="ms-3 text-muted" onclick="optionChange('num', ${page.pageNum - 1})"><i
                        class="bi bi-chevron-left"></i></a>
            </c:if>
        </span>
            <c:forEach begin="1" end="${page.lastPageNum}" var="num">
        <span class="ms-3 text-muted">
            <c:choose>
                <c:when test="${select == num}">
                    <b class="ms-3 text-muted">${num}</b>
                </c:when>
                <c:otherwise>
                    <a class="ms-3 text-muted" onclick="optionChange('num', ${num})">${num}</a>
                </c:otherwise>
            </c:choose>
        </span>
            </c:forEach>
            <span>
            <c:if test="${page.pageNum != page.lastPageNum and (page.lastPageNum ne 0)}">
                <a class="ms-3 text-muted" onclick="optionChange('num', ${page.pageNum + 1})"><i
                        class="bi bi-chevron-right"></i></a>
            </c:if>
            <c:if test="${page.pageNum != page.lastPageNum and (page.lastPageNum ne 0)}">
                <a class="ms-3 text-muted" onclick="optionChange('num', ${page.lastPageNum})"><i
                        class="bi bi-chevron-double-right"></i></a>
            </c:if>
        </span>
        </div>
        <c:if test="${sessionScope.mem_nickname != null}">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="btn-group" role="group" aria-label="First group">
                    <button type="button" class="btn btn-success" id="Write">글쓰기</button>
                </div>
            </div>
        </c:if>
        <%@ include file="../footer.jspf" %>
    </div>
</div>
</body>
</html>
