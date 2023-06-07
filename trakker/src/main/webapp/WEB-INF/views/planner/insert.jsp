<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../itemfile.jspf" %>
<html>
<head>
    <title>플래너 작성 영역테스트</title>
    <style>
        .col-10 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    /*  DAY 각 날짜 onclick속성으로 배경색&글자색 반전 주기 -> ajax구현  */
    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <nav class="navbar navbar-expand-sm navbar-inverse navbar-fixed-top navbar-white p-0" style="z-index:1;">
        <div class="container-fluid p-3">
            <a class="navbar-brand" href="${path}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width: 60px;" height="30px;"></a>
            <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        플래너 제목 출력 공간입니다.
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="btn-group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="true">
                            <i class="bi bi-person-circle"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            <li><span class="dropdown-item">${sessionScope.name}닉네임</span></li>
                            <li><a class="dropdown-item" href="#">회원가입</a></li>
                            <li><a class="dropdown-item" href="#">로그인</a></li>
                            <li><a class="dropdown-item" href="#">관리자페이지</a></li>
                            <li><a class="dropdown-item" href="#">마이페이지</a></li>
                            <li><a class="dropdown-item" href="#">로그아웃</a></li>
                        </ul>
                    </li>
                    <li class="btn-group px-3">
                        <button type="button" class="btn btn-success">플래너 작성</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</head>
<body>
<%--날짜 사이드바--%>
<div class="d-flex flex-column flex-shrink-0 bg-light h-100" style="width: 4.5rem; position: fixed;z-index:2;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <li class="nav-item">
            <strong class="nav-link active py-3 border-bottom rounded-0" style="background-color: #dff0d8; color: #198754;">DAY</strong>
        </li>
        <li>
            <a href="#" class="nav-link py-3 border-bottom rounded-0" data-bs-toggle="tooltip" data-bs-placement="right" style="color: #198754;">1일</a>
        </li>
        <li>
            <a href="#" class="nav-link py-3 border-bottom rounded-0" data-bs-toggle="tooltip" data-bs-placement="right" style="color: #198754;">2일</a>
        </li>
        <li>
            <a href="#" class="nav-link py-3 border-bottom rounded-0" data-bs-toggle="tooltip" data-bs-placement="right" style="color: #198754;">3일</a>
        </li>
        <li>
            <a href="#" class="nav-link py-3 border-bottom rounded-0" data-bs-toggle="tooltip" data-bs-placement="right" style="color: #198754;">4일</a>
        </li>
        <li>
            <a href="#" class="nav-link py-3 border-bottom rounded-0" data-bs-toggle="tooltip" data-bs-placement="right" style="color: #198754;">5일</a>
        </li>
    </ul>
</div>
<%--세부일정 사이드바--%>
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white overflow-auto" style="padding-left:4.5rem;width:380px;height:90%;position:fixed;">
    <div class="list-group list-group-flush border-bottom scrollarea">
        <div class="list-group-item py-3 lh-sm" style="background-color: #dff0d8">
            <div class="d-flex w-100 align-items-center">
                <strong class="mb-1">세부 일정</strong>
            </div>
        </div>
        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
            <div class="d-flex w-100 align-items-center justify-content-between">
                <strong class="mb-1">일정 장소 제목</strong>
                <small><button class="btn-outline-success rounded-3">삭제</button> </small>
            </div>
            <div class="col-10 w-100 m-0 mt-2 small">일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. </div>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
            <div class="d-flex w-100 align-items-center justify-content-between">
                <strong class="mb-1">일정 장소 제목</strong>
                <small><button class="btn-outline-success rounded-3">삭제</button> </small>
            </div>
            <div class="col-10 w-100 m-0 mt-2 small">일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. </div>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
            <div class="d-flex w-100 align-items-center justify-content-between">
                <strong class="mb-1">일정 장소 제목</strong>
                <small><button class="btn-outline-success rounded-3">삭제</button> </small>
            </div>
            <div class="col-10 w-100 m-0 mt-2 small">일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. </div>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
            <div class="d-flex w-100 align-items-center justify-content-between">
                <strong class="mb-1">일정 장소 제목</strong>
                <small><button class="btn-outline-success rounded-3">삭제</button> </small>
            </div>
            <div class="col-10 w-100 m-0 mt-2 small">일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. </div>
        </a>
        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
            <div class="d-flex w-100 align-items-center justify-content-between">
                <strong class="mb-1">일정 장소 제목</strong>
                <small><button class="btn-outline-success rounded-3">삭제</button> </small>
            </div>
            <div class="col-10 w-100 m-0 mt-2 small">일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. 일정 장소 간략한 메모 공간 입니다. </div>
        </a>
    </div>
</div>

<%--맵 영역--%>
<div class="d-flex flex-column w-100 h-100" id="map" style="margin-left:380px;position:fixed;"></div>


<div class="alert fade alert-info" role="alert" tabindex="-1" aria-hidden="false">
    일자 별 세부 일정을 1개 이상 등록해야 합니다!
</div>

<%--div 영역에 맵 띄우는 js코드--%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703&libraries=services"></script>
<script>
    const mapContainer= $("#map")[0];
    const mapOptions = {
        center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
        level: 6
    };
    const map = new kakao.maps.Map(mapContainer, mapOptions);
</script>
</body>
</html>