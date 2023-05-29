<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>플래너</title>
    <%@ include file="../header.jspf" %>
    <style>
        #map {
            width: 400px;
            height: 400px;
            background: #e7f1ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 상단 제목 영역 -->
        <div class="row row-cols-1 pt-5 mb-4">
            <div class='col-sm-8 ms-3'>
                <h4>플래너 제목</h4>
            </div>
            <div class='col-sm-3 text-muted text-end'>
                2023. 00. 00.
            </div>
        </div>

        <div class="row">
            <!-- 하루 일정영역, c:forEach로 1~5개 생성 -->
            <div class='col-sm-6 mt-5'>
                <div class="col me-5 mb-4">
                    <div class="card mb-4 rounded-3 shadow-sm">
                        <div class="card-header py-3">
                            <h5 class="my-0 fw-normal">Day 1
                                <small class="fw-light text-muted">mm월 dd일 N요일</small>
                            </h5>
                        </div>
                        <div class="card-body ms-2">
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col me-5 mb-4">
                    <div class="card mb-4 rounded-3 shadow-sm">
                        <div class="card-header py-3">
                            <h5 class="my-0 fw-normal">Day 1
                                <small class="fw-light text-muted">mm월 dd일 N요일</small>
                            </h5>
                        </div>
                        <div class="card-body ms-2">
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col me-5 mb-4">
                    <div class="card mb-4 rounded-3 shadow-sm">
                        <div class="card-header py-3">
                            <h5 class="my-0 fw-normal">Day 1
                                <small class="fw-light text-muted">mm월 dd일 N요일</small>
                            </h5>
                        </div>
                        <div class="card-body ms-2">
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                            <h6 class="card-title">일정명
                                <small class="fw-light text-muted">오후 1:00</small>
                            </h6>
                            <ul class="list-unstyled mb-3">
                                <li>일정 메모 작성 공간입니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class='col-sm-1'></div>
            <!-- 지도영역, 스크롤 시 따라가게 -->
            <div class='col-sm-4'>
                <div class="position-fixed" id="map">
                    지도영역입니다.
                </div>
            </div>
            <div class='col-sm-1'></div>
        </div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703"></script>
    <script>
        var mapContainer= $("#map")[0];
        var mapOptions = {
            center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
            level: 7
        };
        var map = new kakao.maps.Map(mapContainer, mapOptions);
    </script>
</body>
</html>
