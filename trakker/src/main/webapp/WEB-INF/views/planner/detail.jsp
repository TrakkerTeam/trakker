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
        #routeBtn {
            position: fixed;
            width: 80px;
            height: 30px;
            right: 15%;
            bottom: 3%;
            background-color: #ffffff;
        }
        #map.fix {
            position: absolute;
            width: 350px;
            height: 350px;
            right: 10%;
            bottom: 350px;
        }
        #routeBtn.fix {
            z-index: 99;
            position: absolute;
            right: 10%;
            bottom: 350px;
        }
        .card-title:hover, .card-header:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container position-relative pb-0">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-3">
            <div class="justify-content-md-start">
<%--                <c:when test="${eq sessionScope.memName == p.mem_num}">--%>
                        <button type="button" class="btn btn-light start-0" data-bs-toggle="modal" data-bs-target="#plan_u">수정</button>
                        <%--삭제 버튼 확인 창 & 삭제 기능 구현--%>
                        <button type="button" class="btn btn-light start-0" onclick="location.href='${path}/planner/list'">삭제</button>
<%--                </c:when>--%>
            </div>
            <div class="justify-content-md-end">
<%--                <c:when test="${not empty p.prev_planner}">--%>
                        <button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/detail?no=${p.plan_num-1}'">이전글</button>
<%--                </c:when>--%>
<%--                <c:when test="${not empty p.next_planner}">--%>
                        <button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/detail?no=${p.plan_num+1}'">다음글</button>
<%--                </c:when>--%>
                <button type="button" class="btn btn-success end-0" onclick="location.href='${path}/planner/list'">목록</button>
            </div>
        </div>

    <!-- 상단 제목 영역 -->
        <div class="mx-5">
            <div class="d-flex justify-content-between align-items-center">
                <a href="${path}/planner/list?area=${p.l_num}" style="text-decoration-line:none;"><small class="mb-0 mt-4 text-success">지역 ></small></a>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="col-md-4 d-flex align-items-center">
                    <p class="mb-0 h3 ps-1">${p.title}제목</p>
                </div>
            </div>
            <div>
                <p class="mb-0 h6"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">${m.mem_nickname}작성자</p>
                <div>
                    <small class="opacity-50 mb-0 text-nowrap">${p.regdate}등록일자</small>
                    <small class="opacity-50 mb-0 ms-2 text-nowrap">${p.read}조회수</small>
                </div>
            </div>
            <hr>
            <!-- 하루 일정영역, c:forEach로 1~5개 생성 -->
            <div class="row mb-4">
                    <div class="col-sm-12 ms-2 mb-2 text-muted">
                        <%--띄어쓰기 포함 총 오십글자 작성가능한 메모공간입니다.--%>
                        <i class="h5"><c:if test="${p.memo}">${p.memo}</c:if></i>
                    </div>
<%--                <c:forEach items="${dates}" var="date" varStatus="status">--%>
                    <div class='col-sm-6 my-3 mx-3'>
                        <div class="col me-5 my-3">
                            <div class="card mb-4 rounded-3 shadow-sm">
                                <div class="card-header py-3">
                                    <div class="my-0 fw-normal h5" onclick="showDayRoute()">DAY ${s_num}</div>
                                </div>
                                <div class="card-body ms-2">
<%--                                <c:forEach items="${list}" var="point">--%>
                                        <div class="card-title h6" onclick="setLatlng(35.15848671520119, 129.15967813714465)">${s_point}해운대</div>
                                        <div class="mb-3 ms-2">${s_memo}일정 메모 작성 공간입니다.</div>
<%--                                </c:forEach>--%>
                                        <div class="card-title h6" onclick="setLatlng(35.15314988453495, 129.11898374593787)">${s_point}광안리</div>
                                        <div class="mb-3 ms-2">${s_memo}일정 메모 작성 공간입니다.</div>
                                        <div class="card-title h6" onclick="setLatlng(35.15775436406519, 129.05892753345753)">${s_point}서면역</div>
                                        <div class="mb-3 ms-2">${s_memo}일정 메모 작성 공간입니다.</div>
                                        <div class="card-title h6" onclick="setLatlng(35.098881201608755, 129.028464770832)">${s_point}국제시장</div>
                                        <div class="mb-3 ms-2">${s_memo}일정 메모 작성 공간입니다.</div>
                                        <div class="card-title h6" onclick="setLatlng(35.09628773494323, 129.00941485711115)">${s_point}감천문화마을</div>
                                        <div class="mb-3 ms-2">${s_memo}일정 메모 작성 공간입니다.</div>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                </c:forEach>--%>
                <div class='col-sm-1 my-3'></div>
            </div>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="justify-content-md-start">
<%--                    <c:when test="${eq sessionScope.memName == p.mem_num}">--%>
                        <button type="button" class="btn btn-light start-0" data-bs-toggle="modal" data-bs-target="#plan_u">수정</button>
                    <%--삭제 버튼 확인 창 & 삭제 기능 구현--%>
                        <button type="button" class="btn btn-light start-0" onclick="location.href='${path}/planner/list'">삭제</button>
<%--                    </c:when>--%>
                </div>
                <div class="justify-content-md-end">
                    <button type="button" class="btn btn-light end-0" id="topBtn"><i class="bi bi-caret-up-fill"></i>TOP</button>
                    <button type="button" class="btn btn-success end-0" onclick="location.href='${path}/planner/list'">목록</button>
                </div>
            </div>
        </div>

        <!-- 수정 Modal -->
        <div class="modal fade" id="plan_u" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header m-2">
                        <h1 class="modal-title fs-5">플래너 수정</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form class="modal-body m-0 p-0">
                        <div class="modal-dialog-centered m-4 me-5">
                            <span class="fw-normal ms-2">기간</span>
                            <select class="rounded-3 ms-3 border-2" required>
                                <option>1일</option>
                                <option>2일</option>
                                <option>3일</option>
                                <option>4일</option>
                                <option>5일</option>
                            </select>
                        </div>
                        <div class="modal-dialog-centered m-4 me-5">
                            <span class="fw-normal ms-2">제목</span>
                            <input type="text" class="rounded-3 ms-3" style="width:85%!important;" required>
                        </div>

                        <div class="modal-dialog-centered m-4 me-5">
                            <span class="fw-normal ms-2">메모</span>
                            <input type="text" class="rounded-3 ms-3" style="width:85%!important;">
                        </div>
                        <div class="text-end m-4">
                            <button type="button" class="btn btn-success" onclick="location.href='${path}/planner/edit?no=${p.plan_num}'">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 지도영역, 스크롤 시 따라가게 -->
        <div id="map"></div>
        <button class="border-0" type="button" id="routeBtn" onclick="showAllRoute()">전체일정</button>

        <%@ include file="../footer.jspf" %>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703"></script>
    <script>
        //카카오 맵
        const mapContainer= $("#map")[0];
        const mapOptions = {
            center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
            level: 7
        };
        let map = new kakao.maps.Map(mapContainer, mapOptions);

        //스크롤 시 지도 이동, 푸터 만나면 이동멈춤
        $(window).on('load', function() {
            const footerHei = $('footer').outerHeight()*2;
            const scrollMap = $('#map');
            const scrollBtn = $('#routeBtn');
            $(window).on('scroll', function() {
                //sT는 현재 스크롤 위치입니다.
                const sT = $(window).scrollTop();
                //vH는 배너(맵)이 움직일 수 있는 영역입니다.
                const vH = $(document).height() - window.innerHeight - footerHei;

                //sT가 vH보다 크거나 같으면(=현재 스크롤 위치가 배너(맵)이 이동할 수 있는 전체 높이보다 더 내려가서 푸터를 만나면) addClass('on')메서드를 통해 클래스 fix가 추가됩니다.
                //false인 경우 즉 아직 스크롤을 다 내리지 않아서 배너(맵)이 푸터를 만나기 전이므로 removeClass()메서드를 통해 클래스 fix가 제거됩니다.
                if (sT >= vH) {
                    scrollMap.addClass('fix')
                    scrollBtn.addClass('fix')
                }
                else {
                    scrollMap.removeClass('fix')
                    scrollBtn.removeClass('fix')
                }
            });
        });

        //top버튼 클릭 시 페이지 상단 이동
        $('#topBtn').click(function (){
            window.scrollTo({ top: 0, behavior: "smooth" });
        });

        //세부 일정 클릭 시 지도 좌표 변경
        function setLatlng(x,y) {
            map.setCenter(new kakao.maps.LatLng(x, y));
            map.setLevel(5);
        };

        //일정 title 클릭 시 지도 경로 표시 - 작성중
        function setRoute(x,y) {
            map.setCenter(new kakao.maps.LatLng(x, y));
            map.setLevel(7);
        };

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

        <c:forEach items="${plans}" var="plan" varStatus="plan_status">
            var markerPosition  = new kakao.maps.LatLng(${plan.y}, ${plan.x});
            var marker = new kakao.maps.Marker({
                    position: markerPosition, // 마커의 위치
                });
            marker.setMap(map);

            /* 서울역 경로 추가  */
            var point =  new kakao.maps.LatLng(${plan.y}, ${plan.x});
            var path = polyline.getPath();
            path.push(point);
            polyline.setPath(path);

            ++a;
        </c:forEach>

        //카카오 맵 전체경로 버튼
        function showAllRoute() {

        }

    </script>
</body>
</html>
