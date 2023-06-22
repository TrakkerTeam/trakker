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
    small a {
        color: #6c757d !important;
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
    function detail(num) {
        console.log('click')
        location.href = '/trakker/planner/'+num;
    }
    function checkOptions(option) {
    //구현기능
        //1. 현재 url에서 urlParams를 조회
        //2-1. 옵션값 존재 : 변경 ex) area=1 -> area=2
        //2-2. 옵션값 X : 새로 추가 ex) page=1 -> page=1&area=2
        //3. 선택된 옵션값에 따라 화면 영역에 <strong><i> 태그 추가/삭제

        //옵션으로 들어오는 변수 종류 - reset일 때 urlParams 제거 로직 / ht & add일 때 sort 추가or변경 / 지역값일 때 area 추가or변경
            //ht , add
            //지역값 1~16
            //reset
    }
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
                        <a href="javascript:void(0);" onclick="checkOptions('ht')" class="text-muted">인기순</a>
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
                <div class="mt-1">
                    <small><a href="javascript:void(0);" onclick="checkOptions('reset')" class="text-muted">옵션초기화</a></small>
                </div>
            </div>
        </div>
<%--    <c:forEach items="planner">--%>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <%--게시판 첨부 지역 이미지--%>
                    <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">

                    <div class="card-body rounded-3 p-0 w-100">
                        <h6 class="text-muted ms-3 mt-3">${planner.member.memNickname}닉네임</h6>
                        <p class="card-text m-3">${planner.title}제목</p>
                    </div>
                    <div class="card-img-overlay rounded-3 p-0">
                        <div class="card-body align-text-top text-end p-0">
                            <div class="d-flex justify-content-between align-items-center p-3 pb-0">
                                <h6 class="text-muted">${planner.local.kName}지역</h6>
                                <div class="d-flex justify-content-center align-items-center">
                                    <h5 class="mt-1 me-2">${planner.heart.count}하트수</h5>
                                    <a href="javascript:void(0);" onclick="heartOn()" style="text-decoration-line:none;">
                                        <button class="heart"><i class="bi bi-heart"></i></button>
                                    </a>
                                </div>
                            </div>
                            <a href="javascript:void(0);" onclick="detail(${planner.planNum}+1);" style="text-decoration-line:none;">
                                <div class="w-100" style="height:85%;"></div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--    </c:forEach>--%>
<%--    </div>--%>

<%--페이지네이션--%>
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
<%--//페이지네이션--%>

    <%@ include file="../footer.jspf" %>
</div>
</body>

</html>
