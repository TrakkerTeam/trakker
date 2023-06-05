<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>플래너</title>
    <%@ include file="../header.jspf" %>
    <style>
        #map {
            position: fixed;
            width: 400px;
            height: 400px;
            right: 15%;
            bottom: 3%;
        }
        #map.fix {
            position: absolute;
            width: 400px;
            height: 400px;
            right: 10%;
            bottom: 380px;
        }
    </style>
</head>
<body>
    <div class="container position-relative pb-0">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-3">
            <div class="justify-content-md-start">
                <button type="button" class="btn btn-light start-0">수정</button>
                <button type="button" class="btn btn-light start-0">삭제</button>
            </div>
            <div class="justify-content-md-end">
                <button type="button" class="btn btn-light end-0">이전글</button>
                <button type="button" class="btn btn-light end-0">다음글</button>
                <button type="button" class="btn btn-success end-0">목록</button>
            </div>
        </div>
    <!-- 상단 제목 영역 -->
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <p class="mb-0 mt-4">지역</p>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <div class='justify-content-md-start'>
                <h3 class="ps-1">플래너 제목</h3>
            </div>
            <div class='justify-content-md-end'>
                2023. 00. 00.
            </div>
        </div>
        <hr>

        <!-- 하루 일정영역, c:forEach로 1~5개 생성 -->
        <div class="row mb-4">
            <div class='col-sm-6 my-3 mx-3'>
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
            <div class='col-sm-6 my-3'></div>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div class="justify-content-md-start">
                <button type="button" class="btn btn-light start-0">수정</button>
                <button type="button" class="btn btn-light start-0">삭제</button>
            </div>
            <div class="justify-content-md-end">
                <button type="button" class="btn btn-light end-0"><i class="bi bi-caret-up-fill"></i>TOP</button>
                <button type="button" class="btn btn-success end-0">목록</button>
            </div>
        </div>
        <!-- 지도영역, 스크롤 시 따라가게 -->
        <div id="map">지도영역입니다.</div>
        <%@ include file="../footer.jspf" %>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703"></script>
    <script>
            let mapContainer= $("#map")[0];
            let mapOptions = {
                center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
                level: 7
            };
            let map = new kakao.maps.Map(mapContainer, mapOptions);
    </script>
    <script>
        $(window).on('load', function() {
            var footerHei = $('footer').outerHeight()*2;
            var $map = $('#map');
            $(window).on('scroll', function() {
                //sT는 현재 스크롤 위치입니다.
                var sT = $(window).scrollTop();
                //vH는 배너(맵)이 움직일 수 있는 영역입니다.
                var vH = $(document).height() - window.innerHeight - footerHei;

                //sT가 vH보다 크거나 같으면(=현재 스크롤 위치가 배너(맵)이 이동할 수 있는 전체 높이보다 더 내려가서 푸터를 만나면) addClass('on')메서드를 통해 클래스 fix가 추가됩니다.
                //false인 경우 즉 아직 스크롤을 다 내리지 않아서 배너(맵)이 푸터를 만나기 전이므로 removeClass()메서드를 통해 클래스 fix가 제거됩니다.
                if (sT >= vH)
                    $map.addClass('fix')
                else
                    $map.removeClass('fix')
            });
        });
    </script>
</body>
</html>
