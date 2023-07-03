<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>플래너</title>
    <%@ include file="../header.jspf" %>
    <style>
        #map {
            position: fixed;
            width: 350px;
            height: 350px;
            right: 15%;
            bottom: 3%;
        }
        #map.fix {
            position: absolute;
            width: 350px;
            height: 350px;
            right: 10%;
            bottom: 450px;
        }
        .card-title:hover, .card-header:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container position-relative pb-0">
        <div class="mx-5">
            <%--상단 버튼 바--%>
            <div class="d-flex justify-content-between align-items-center mt-5 mb-3">
                <div class="justify-content-md-start">
                    <c:if test="${sessionScope.mem_num eq planner.memNum}">
                        <button type="button" class="btn btn-light start-0" data-bs-toggle="modal" data-bs-target="#plan_u">수정</button>
                        <button type="button" class="btn btn-light start-0" onclick="deletePlanner(${planner.planNum})">삭제</button>
                    </c:if>
                </div>
                <div class="justify-content-md-end">
                    <c:if test="${not empty prev}">
                        <button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/${prev}'">이전글</button>
                    </c:if>
                    <c:if test="${not empty next}">
                        <button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/${next}'">다음글</button>
                    </c:if>
                    <button type="button" class="btn btn-success end-0" onclick="location.href='${path}/planner'">목록</button>
                </div>
        </div>
            <%--//상단 버튼 바--%>

            <%--상단 플래너 제목 바--%>
            <div class="d-flex justify-content-between align-items-center">
                <a href="${path}/planner?area=${planner.lnum}" style="text-decoration-line:none;"><small class="mb-0 mt-4 text-success">${planner.local.kname} ></small></a>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="col-md-4 d-flex align-items-center">
                    <p class="mb-0 h3 ps-1">${planner.title}</p>
                </div>
            </div>
            <div>
                <p class="mb-0 h6"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">${planner.member.mem_nickname}</p>
                <div>
                    <small class="opacity-50 mb-0 text-nowrap">${planner.regdate} !! 날짜 형식 변환 오류 !!</small>
                    <small class="opacity-50 mb-0 ms-2 text-nowrap">${planner.hit}</small>
                </div>
            </div>
            <%--//상단 플래너 제목 바--%>
            <hr>

            <div class="row mb-4">
                <%--플래너 메모--%>
                <div class="col-sm-12 ms-2 mb-2 text-muted">
                    <i class="h5">${planner.memo}</i>
                </div>
                <%--//플래너 메모--%>

                <%--플래너 세부 일정--%>
                <c:forEach items="${days}" varStatus="i">
                    <div class='col-sm-6 my-3 mx-3'>
                        <div class="col me-5 my-3">
                            <div class="card mb-4 rounded-3 shadow-sm">
                                <div class="card-header py-3">
                                    <div class="my-0 fw-normal h5" onclick="showDayRoute(${days[i.index]})">DAY ${days[i.index]}</div>
                                </div>
                                <div class="card-body ms-2">
                                    <c:forEach items="${schedules}" var="sc">
                                        <c:if test="${days[i.index] eq sc.sday}">
                                            <div class="card-title h6" onclick="setLatlng(${sc.y}, ${sc.x})">${sc.spoint}</div>
                                            <div class="mb-4 ms-4">${sc.smemo}</div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <%--//플래너 세부 일정--%>
            </div>

            <%--좋아요 버튼--%>
            <div class="row my-5 justify-content-center">
                <button class="btn btn-outline-danger rounded-3" onclick="heartClick()" style="width:6rem!important;height:3rem!important;">
                <c:choose>
                    <c:when test="${planner.heart.mh eq 1}">
                        좋아요 <i class="bi bi-heart-fill" id="heartbtn"></i>
                        <input hidden id="heartCheck" value="${planner.heart.mh}">
                    </c:when>
                    <c:when test="${planner.heart.mh eq 0}">
                        좋아요 <i class="bi bi-heart" id="heartbtn"></i>
                        <input hidden id="heartCheck" value="${planner.heart.mh}">
                    </c:when>
                </c:choose>
                </button>
            </div>
            <%--//좋아요 버튼--%>

            <%--하단 버튼 바--%>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="justify-content-md-start">
                    <c:if test="${sessionScope.mem_num eq planner.memNum}">
                        <button type="button" class="btn btn-light start-0" data-bs-toggle="modal" data-bs-target="#plan_u">수정</button>
                        <button type="button" class="btn btn-light start-0" onclick="deletePlanner(${planner.planNum})">삭제</button>
                    </c:if>
                </div>
                <div class="justify-content-md-end">
                    <button type="button" class="btn btn-light end-0" id="topBtn"><i class="bi bi-caret-up-fill"></i>TOP</button>
                    <button type="button" class="btn btn-success end-0" onclick="location.href='${path}/planner'">목록</button>
                </div>
            </div>
            <%--//하단 버튼 바--%>
        </div>

        <%--수정 modal--%>
        <c:if test="${sessionScope.mem_num eq planner.memNum}">
        <div class="modal fade" id="plan_u" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header m-2">
                        <h1 class="modal-title fs-5">수정하기</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="${path}/planner/edit/${planner.planNum}" method="post">
                        <div class="modal-dialog-centered mt-5 m-4 me-5">
                            <span class="fw-normal ms-2">제목</span>
                            <input type="text" class="rounded-3 ms-3" name="planner-title" style="width:85%!important;" required value="${planner.title}">
                        </div>
                        <input hidden name="listDays" value="${days}">
                        <input hidden name="planner-days" value="${planner.days}">
                        <input hidden name="planner-local" value="${planner.local.kname}">
                        <div class="modal-dialog-centered m-4 me-5">
                            <span class="fw-normal ms-2">메모</span>
                            <input type="text" class="rounded-3 ms-3" name="planner-memo" style="width:85%!important;" required value="${planner.memo}">
                        </div>
                        <div class="text-end m-4">
                            <button type="submit" class="btn btn-success">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </c:if>
        <%--//수정 modal--%>

        <%--지도--%>
        <div id="map"></div>
        <%--//지도--%>

        <%@ include file="../footer.jspf" %>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703"></script>
    <script>
        "use strict";

        //스크롤 시 지도 이동, 푸터 만나면 이동멈춤
        $(window).on('load', function() {
            const footerHei = $('footer').outerHeight()*3;
            const scrollMap = $('#map');
            $(window).on('scroll', function() {
                //sT는 현재 스크롤 위치입니다.
                const sT = $(window).scrollTop();
                //vH는 배너(맵)이 움직일 수 있는 영역입니다.
                const vH = $(document).height() - window.innerHeight - footerHei;

                //sT가 vH보다 크거나 같으면(=현재 스크롤 위치가 배너(맵)이 이동할 수 있는 전체 높이보다 더 내려가서 푸터를 만나면 addClass('on')메서드를 통해 클래스 fix가 추가됩니다.
                //false인 경우 즉 아직 스크롤을 다 내리지 않아서 배너(맵)이 푸터를 만나기 전이므로 removeClass()메서드를 통해 클래스 fix가 제거됩니다.
                if (sT >= vH) {
                    scrollMap.addClass('fix')
                }
                else {
                    scrollMap.removeClass('fix')
                }
            });
        });

        //top버튼 클릭 시 페이지 상단 이동
        $('#topBtn').click(function (){
            window.scrollTo({ top: 0, behavior: "smooth" });
        });


        //카카오 맵
        const mapContainer= $("#map")[0];
        const mapOptions = {
            center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
            level: 7
        };
        let map = new kakao.maps.Map(mapContainer, mapOptions);

        //여러개의 마커 표시하기
        let positions = [
            {latlng: new kakao.maps.LatLng(35.15848671520119, 129.15967813714465)},
            {latlng: new kakao.maps.LatLng(35.15314988453495, 129.11898374593787)},
            {latlng: new kakao.maps.LatLng(35.15775436406519, 129.05892753345753)},
            {latlng: new kakao.maps.LatLng(35.098881201608755, 129.028464770832)},
            {latlng: new kakao.maps.LatLng(35.09628773494323, 129.00941485711115)}
        ];
        for (var i = 0; i < positions.length; i ++) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
            });
        }

        //
        function addMarker(positions) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: positions
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            // 생성된 마커를 배열에 추가합니다
            markers.push(marker);
        }
        // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
        function setMarkers(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }
        // 날짜 별 경로 버튼
        function showDayRoute() {
            setMarkers(map)
        }

        //세부 일정 클릭 시 지도 좌표 변경 - 구현완료 그런데 마커는 구현안한
        function setLatlng(y,x) {
            map.setCenter(new kakao.maps.LatLng(y, x));
            map.setLevel(5);
        };

        //일정 DAY 클릭 시 지도 경로 표시 - 작성중
        function setRoute(y,x) {
            map.setCenter(new kakao.maps.LatLng(y, x));
            map.setLevel(7);
        };

        function heartClick() {
            let memNum = sessionStorage.getItem('mem_num');
            if(memNum==null) {
                if(confirm("로그인 후 이용하실 수 있는 기능입니다. 로그인하시겠습니까?")){
                    location.href="${path}/login";
                }
            }else if(memNum!=null) {
                const mh = $('#heartCheck').val();
                $.ajax({
                    url: "${path}/planner/${planNum}" ,
                    data: {
                        planNum : ${planNum},
                        memNum : memNum,
                        mh : mh
                    },
                    type: "post",
                    success: function () {
                        if(mh == 1) {
                            $('#heartCheck').val(0);
                            $('#heartbtn').attr('class','bi bi-heart');
                        }else if(mh == 0) {
                            $('#heartCheck').val(1);
                            $('#heartbtn').attr('class','bi bi-heart-fill');
                        }
                    }
                })
            }
        }

        function deletePlanner() {
            if(confirm("플래너를 삭제하시겠습니까?")){
                $.ajax({
                    url: "${path}/planner/delete/${planNum}",
                    data: ${planNum},
                    type: "post",
                    success: function () {
                        location.href="${path}/planner"
                    }
                })
            }
        }
    </script>
</body>
</html>
