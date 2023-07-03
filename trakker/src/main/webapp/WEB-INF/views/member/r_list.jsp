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

    #category {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 200px;
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
            padding-top: 50px;
        }

        #myreview {
            margin-left: 200px;
        }

        div a.menubar {
            text-decoration: none;
            display: block;
            color: #000;
            padding: 15px;
            font-weight: bold;
        }


       .menu > a:hover {
          background-color: #333;
          color: #fff;
       }

       .bi-plus-lg {
          font-size: 22px;
       }

       p.content2 {
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 1; /* Set the number of lines to display */
          -webkit-box-orient: vertical;
       }
    small a {
        color: #6c757d !important;
    }

    .sta , .h6 {
        color: #ffffff;
    }
</style>
<script>
    $(window).on('load', function() {
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
                location.href ='/trakker/member/r_list?num=1';
            }else if(option=="ratingAvg" || option=="add") {
                urlParams.set("sort", option);
                location.href ='/trakker/member/r_list?'+urlParams;
            }else {
                urlParams.set("area", option);
                location.href ='/trakker/member/r_list?'+urlParams;
            }
        }

    $(function () {
        $("#Write").click(function () {
            location.href = "${path}/review/write";
        });
    });

</script>
<body>
<div class="container album py-5 ">
    <div style="display: flex; height: auto;">
         <div id="category" class="menu center" style="width: 10%; margin-top: 70px;">
                                                 <a class="menubar" href="${path}/member/mypageHeart">좋아요한 플래너</a>
                                                 <a class="menubar" href="${path}/member/mypagePlanner">내가 만든 플래너</a>
                                                 <a class="menubar" href="${path}/member/r_list?num=1">내가 쓴 리뷰</a>
                                                 <a class="menubar" href="${path}/member/editprofile.do">프로필수정</a>
            </div>
            <div class="container">
        <div id="myreview" style="width: 80%;">
            <div class="row">
                <div class="col-sm-8"><h2 class="mt-5 ps-5">내가 쓴 리뷰</h2></div>
                <div class="col-sm-4">
                    <div class="d-flex pe-5 mt-5">
                        <form class="d-flex" role="search">
                            <input type="hidden" name="num" value="${page.pageNum}">
                           <select class="border-success rounded-3" name="searchType">
                                                           <option value="title" <c:if test="${search == 'title'}">selected</c:if>>제목</option>
                                                           <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
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
                                        <c:forEach items="${local}" var="l">
                                            <c:choose>
                                                <c:when test="${l.lnum eq area}">
                                                    <a href="javascript:void(0);" onclick="checkOptions(${l.lnum})"><strong><i>${l.kname}</i></strong></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:void(0);" onclick="checkOptions(${l.lnum})">${l.kname}</a>
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
                                <c:set var="randomNumber" value="${Random().nextInt(6) + 1}" />
                                <c:set var="region" value="${review.lnum}" />
                                <img src="${path}/resources/images/local/${region}/${region}-${randomNumber}.jpg" class="card-img-top w-100" >
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
                                                <h5 class="mt-3 sta"><fmt:formatNumber value="${review.rating.ratingAvg}" pattern="0.0"/></h5>
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
        <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5">
            <span>
                <c:if test="${page.pageNum  > 2}">
                    <c:set var="firstPageNum" value="1"/>
                    <a class="text-muted" href="${path}/member/r_list?num=${firstPageNum}">
                    <i class="bi bi-chevron-double-left"></i></a>
                </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="text-muted" href="${path}/member/r_list?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>
        <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted" href="${path}/member/r_list?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
        </c:forEach>
            <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="text-muted ms-3" href="${path}/member/r_list?num=${page.pageNum + 1}">
                <i class="bi bi-chevron-right "></i></a>
                </c:if>
                 <c:if test="${page.pageNum != page.lastPageNum}">
                        <a class="text-muted" href="${path}/member/r_list?num=${page.lastPageNum}">
                            <i class="bi bi-chevron-double-right"></i>
                        </a>
                 </c:if>
            </span>
        </div>
            <%@ include file="../footer.jspf" %>
            </div>
        </div>
    </div>
</div>
</body>
</html>