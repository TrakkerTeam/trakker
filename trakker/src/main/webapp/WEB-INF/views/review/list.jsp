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
    $(window).on('load', function() {
        //url의 query값을 따와서 tag의 value값이 있을 경우 #d-search에 클래스 show를 추가
        const urlParams = new URL(location.href).searchParams;
        const area = urlParams.get('area'); // <- query에 area가 있으면 콜랩스가 펼쳐짐
        const sort = urlParams.get('sort'); // <- query에 sort가 있으면 콜랩스가 펼쳐짐
        console.log(area);
        console.log(sort);
        if (area || sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });

    function checkOptions(option) {
        const urlParams = new URL(location.href).searchParams;
        if(option=="reset") {
            location.href ='/trakker/review/list?num=1';
        }else if(option=="ratingAvg" || option=="add") {
            urlParams.set("sort", option);
            location.href ='/trakker/review/list?'+urlParams;
        }else {
            urlParams.set("area", option);
            location.href ='/trakker/review/list?'+urlParams;
        }
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
                <small><a href="javascript:void(0);" onclick="checkOptions('reset')" class="text-muted">초기화</a></small>
                <div class="mt-2">
                    <small>
                        <a href="javascript:void(0);" onclick="checkOptions('ratingAvg')" class="text-muted">인기순</a>
                        <a href="javascript:void(0);" onclick="checkOptions('add')" class="text-muted"><strong><i>최신순</i></strong></a>
                    </small>
                </div>
                <div class="mt-1">
                    <small class="text-muted">
                        <a href="javascript:void(0);" onclick="checkOptions(1)">서울</a>
                        <a href="javascript:void(0);" onclick="checkOptions(2)">부산</a>
                        <a href="javascript:void(0);" onclick="checkOptions(3)">대구</a>
                        <a href="javascript:void(0);" onclick="checkOptions(4)">인천</a>
                        <a href="javascript:void(0);" onclick="checkOptions(5)">광주</a>
                        <a href="javascript:void(0);" onclick="checkOptions(6)">대전</a>
                        <a href="javascript:void(0);" onclick="checkOptions(7)">울산</a>
                        <a href="javascript:void(0);" onclick="checkOptions(8)">경기</a>
                        <a href="javascript:void(0);" onclick="checkOptions(9)">강원</a>
                        <a href="javascript:void(0);" onclick="checkOptions(10)">충북</a>
                        <a href="javascript:void(0);" onclick="checkOptions(11)">충남</a>
                        <a href="javascript:void(0);" onclick="checkOptions(12)">전북</a>
                        <a href="javascript:void(0);" onclick="checkOptions(13)">전남</a>
                        <a href="javascript:void(0);" onclick="checkOptions(14)">경북</a>
                        <a href="javascript:void(0);" onclick="checkOptions(15)">경남</a>
                        <a href="javascript:void(0);" onclick="checkOptions(16)">제주</a>
                    </small>
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
                            <c:set var="region" value="${review.lnum}" />
                            <img src="${path}/resources/images/local/${region}/${region}-${randomNumber}.jpg" class="card-img-top w-100" style="height: 242px;">
                            <div class="card-body rounded-3 p-0 w-100">
                                <h6 class="text-muted ms-3 mt-3">${review.member.mem_nickname}</h6>
                                <p class="card-text m-3">${review.title}</p>
                            </div>
                            <div class="card-img-overlay rounded-3 p-0">
                                <div class="card-body align-text-top text-end p-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="text-muted">${review.local.kname}</h6>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <i class="bi bi-star-fill me-1 pb-1"></i>
                                            <h5 class="mt-3" style="color: #1B756C"><fmt:formatNumber value="${review.rating.ratingAvg}" pattern="0.0"/></h5>
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
                <c:if test="${page.pageNum  > 2}">
                    <c:set var="firstPageNum" value="1"/>
                    <a class="text-muted" href="${path}/review/list?num=${firstPageNum}">
                    <i class="bi bi-chevron-double-left"></i></a>
                </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="text-muted" href="${path}/review/list?num=${page.pageNum - 1}">
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
                <a class="text-muted ms-3" href="${path}/review/list?num=${page.pageNum + 1}">
                <i class="bi bi-chevron-right "></i></a>
                </c:if>
                 <c:if test="${page.pageNum != page.lastPageNum}">
                        <a class="text-muted" href="${path}/review/list?num=${page.lastPageNum}">
                            <i class="bi bi-chevron-double-right"></i>
                        </a>
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
