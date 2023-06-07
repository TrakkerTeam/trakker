<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    .card:hover  {
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
    .heart {
        background-color: transparent;
        border: none;
    }
</style>
<script>
    $(window).on('load', function() {
        //url의 query값을 따와서 tag의 value값이 있을 경우 #d-search에 클래스 show를 추가
        const urlParams = new URL(location.href).searchParams;
        const area = urlParams.get('area'); // <- query에 area가 있으면 콜랩스가 펼쳐짐
        const sort = urlParams.get('sort'); // <- query에 sort가 있으면 콜랩스가 펼쳐짐
        if (area || sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });
</script>
<body>
<div class="container pt-5">
<%--    <div class="container">--%>
        <div class="row">
            <div class="col-sm-8"><h2 class="ps-5 mt-5">플래너게시판</h2></div>
            <div class="col-sm-4">
                <form class="d-flex pe-5 mt-5" role="search">
                    <select class="border-success rounded-3">
                        <option>제목</option>
                        <option>내용</option>
                        <option>작성자</option>
                    </select>
                    <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
        <div class="pe-5 text-end">
            <a class="text-muted text-decoration-none" data-bs-toggle="collapse" data-bs-target="#d-search">
                <small class="bi bi-caret-down-fill">옵션</small>
            </a>
            <div class="collapse" id="d-search">
                <div class="mt-2">
                    <small>
                        <a href="#" class="text-muted">인기순</a>
                        <a href="#" class="text-muted"><strong><i>최신순</i></strong></a>
                    </small>
                </div>
                <div class="mt-1">
                    <small>
                        <a href="#" class="text-muted">서울</a>
                        <a href="#" class="text-muted">경기</a>
                        <a href="#" class="text-muted">인천</a>
                        <a href="#" class="text-muted">강원</a>
                        <a href="#" class="text-muted">충북</a>
                        <a href="#" class="text-muted">충남</a>
                        <a href="#" class="text-muted">대전</a>
                        <a href="#" class="text-muted">경북</a>
                        <a href="#" class="text-muted">경남</a>
                        <a href="#" class="text-muted">대구</a>
                        <a href="#" class="text-muted">울산</a>
                        <a href="#" class="text-muted">부산</a>
                        <a href="#" class="text-muted">전북</a>
                        <a href="#" class="text-muted">전남</a>
                        <a href="#" class="text-muted">광주</a>
                        <a href="#" class="text-muted">제주</a>
                    </small>
                </div>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                        <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                            20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2"> 134</h5>
                                    <a href="${path}" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="${path}/planner/detail" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--    </div>--%>
    <div class="d-flex justify-content-center align-items-center py-4 my-5 h5">
        <a class="ms-3 text-muted" href=""><i class="bi bi-chevron-double-left"></i></a>
        <a class="ms-3 text-muted" href=""><i class="bi bi-chevron-left"></i></a>
        <a class="ms-3 text-muted" href="">1</a>
        <a class="ms-3 text-muted" href="">2</a>
        <a class="ms-3 text-muted" href="">3</a>
        <a class="ms-3 text-muted" href="">4</a>
        <a class="ms-3 text-muted" href="">5</a>
        <a class="ms-3 text-muted" href=""><strong><u>6</u></strong></a>
        <a class="ms-3 text-muted" href="">7</a>
        <a class="ms-3 text-muted" href="">8</a>
        <a class="ms-3 text-muted" href="">9</a>
        <a class="ms-3 text-muted" href="">10</a>
        <a class="ms-3 text-muted" href=""><i class="bi bi-chevron-right"></i></a>
        <a class="ms-3 text-muted" href=""><i class="bi bi-chevron-double-right"></i></a>
    </div>
    <%@ include file="../footer.jspf" %>
</div>
</body>

</html>
