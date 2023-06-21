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

</style>
<script>
    $(window).on('load', function () {
        //url의 query값을 따와서 tag의 value값이 있을 경우 #d-search의 클래스 show를 추가해준다.
        const urlParams = new URL(location.href).searchParams;
        const area = urlParams.get('area');
        const sort = urlParams.get('sort');
        if (area || sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });

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
            <div class="col-sm-8"><h2 class="ps-5 mt-5">리뷰게시판</h2></div>
            <div class="col-sm-4">
                <div class="d-flex pe-5 mt-5">
                    <form class="d-flex" role="search">
                    <input type="hidden" name="num" value="${page.pageNum}">
                    <select class="border-success rounded-3" name="searchType">
                        <option value="title" <c:if test="${search == 'title'}">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                        <option value="mem_nickname" <c:if test="${search == 'mem_nickname'}">selected</c:if>>작성자</option>
                    </select>
                    <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search" aria-label="Search" value="${keyword}">
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
                <div class="mt-2">
                    <a href="#" class="text-muted"><strong><u>별점순</u></strong></a>
                    <a href="#" class="text-muted">최신순</a>
                </div>
                <div class="mt-1">
                    <a href="#" class="text-muted">서울</a>
                    <a href="#" class="text-muted">부산</a>
                    <a href="#" class="text-muted">대구</a>
                    <a href="#" class="text-muted">인천</a>
                    <a href="#" class="text-muted">광주</a>
                    <a href="#" class="text-muted">대전</a>
                    <a href="#" class="text-muted">울산</a>
                    <a href="#" class="text-muted">경기</a>
                    <a href="#" class="text-muted">강원</a>
                    <a href="#" class="text-muted">충북</a>
                    <a href="#" class="text-muted">충남</a>
                    <a href="#" class="text-muted">전북</a>
                    <a href="#" class="text-muted">전남</a>
                    <a href="#" class="text-muted">경북</a>
                    <a href="#" class="text-muted">경남</a>
                    <a href="#" class="text-muted">제주</a>
                </div>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach var="review" items="${list}">
                <div class="col p-5">
                    <div class="card rounded-3 shadow-sm">
                        <a href="${path}/review/detail?review_num=${review.review_num}"
                           style="text-decoration-line:none;">
                            <c:set var="randomNumber" value="${Random().nextInt(6) + 1}" />
                            <c:set var="region" value="${review.l_num}" />
                            <img src="${path}/resources/images/local/${region}/${region}-${randomNumber}.jpg" class="card-img-top w-100" style="height: 242px;">
                            <div class="card-body rounded-3 p-0 w-100">
                                <h6 class="text-muted ms-3 mt-3">${review.member.mem_nickname}</h6>
                                <p class="card-text m-3">${review.title}</p>
                            </div>
                            <div class="card-img-overlay rounded-3 p-0">
                                <div class="card-body align-text-top text-end p-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="text-muted">${review.local.k_name}</h6>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <i class="bi bi-star-fill me-1"></i>
                                            <h5 class="mt-2"> 8.1</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5">
            <span>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/review/list?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>
        <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted" href="${path}/review/list?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
        </c:forEach>
            <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="ms-3 text-muted" href="${path}/review/list?num=${page.pageNum + 1}">
                    <i class="bi bi-chevron-right"></i>
                </a>
                </c:if>
            </span>
        </div>
        <c:if test="${mem_email != null}">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <div class="btn-group m-3" role="group" aria-label="First group">
                    <button type="button" class="btn btn-success" id="Write">글쓰기</button>
                </div>
            </div>
        </c:if>
        <%@ include file="../footer.jspf" %>
    </div>
</div>
</body>
</html>
