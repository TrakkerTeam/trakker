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
        .modal-dialog {
            box-sizing: border-box !important;
            margin: 0 auto !important;
            width: 1200px;
            max-width: calc(100% - 100px) !important;
            background: #fff !important;
        }
    </style>
</head>
<body>
<div class="container position-relative pb-0">
    <div class="mx-5">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-3">
            <div class="justify-content-md-start">
            <c:if test="${sessionScope.mem_num eq planner.memNum}">
                <button type="button" class="btn btn-light start-0" onclick="editPlanner()" data-bs-toggle="modal" data-bs-target="#plan_u">수정</button>
                <button type="button" class="btn btn-light start-0" onclick="deletePlanner(${planner.planNum})">삭제</button>
            </c:if>
            </div>
            <div class="justify-content-md-end">
                <c:if test="${not empty prev}"><button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/${prev}'">이전글</button></c:if>
                <c:if test="${not empty next}"><button type="button" class="btn btn-light end-0" onclick="location.href='${path}/planner/${next}'">다음글</button></c:if>
                <button type="button" class="btn btn-success end-0" onclick="location.href='${path}/planner'">목록</button>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center"><a href="${path}/planner?area=${planner.lnum}" style="text-decoration-line:none;"><small class="mb-0 mt-4 text-success">${planner.local.kname} ></small></a></div>
        <div class="d-flex justify-content-between align-items-center"><div class="col-md-4 d-flex align-items-center"><p class="mb-0 h3 ps-1">${planner.title}</p></div></div>
        <div>
            <p class="mb-0 h6"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">${planner.member.mem_nickname}</p>
            <div>
                <small class="opacity-50 mb-0 text-nowrap">${planner.regdate}</small>
                <small class="opacity-50 mb-0 ms-2 text-nowrap">${planner.hit}</small>
            </div>
        </div>
    <hr>
        <div class="row mb-4">
            <div class="col-sm-12 ms-2 mb-2 text-muted"><i class="h5">${planner.memo}</i></div>
            <c:forEach items="${days}" varStatus="i">
            <div class='col-sm-6 my-3 mx-3'>
                <div class="col me-5 my-3">
                    <div class="card mb-4 rounded-3 shadow-sm">
                        <div class="card-header py-3"><div class="my-0 fw-normal h5" onclick="showDayRoute(${days[i.index]})">DAY ${days[i.index]}</div></div>
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
        </div>

        <div class="row my-5 justify-content-center">
            <button class="btn btn-outline-danger rounded-3" onclick="heartClick(${sessionScope.mem_num})" style="width:6rem!important;height:3rem!important;">
            <c:choose>
                <c:when test="${planner.heart.mh eq 1}">좋아요 <i class="bi bi-heart-fill" id="heartbtn"></i><input hidden id="heartCheck" value="${planner.heart.mh}"></c:when>
                <c:when test="${planner.heart.mh eq 0}">좋아요 <i class="bi bi-heart" id="heartbtn"></i><input hidden id="heartCheck" value="${planner.heart.mh}"></c:when>
            </c:choose>
            </button>
        </div>

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
    </div>

    <c:if test="${sessionScope.mem_num eq planner.memNum}">
        <div class="uk-flex-top modal fade" id="plan_u" tabindex="-1" aria-hidden="true" style="top:8rem;">
            <div class="modal-dialog uk-width-auto uk-margin-auto-vertical">
                <div class="modal-content border-0">
                    <div class="uk-grid-match uk-grid-small uk-grid">
                        <button class="uk-modal-close-full uk-close-large uk-icon uk-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <line fill="none" stroke="#000" stroke-width="1.4" x1="1" y1="1" x2="19" y2="19"></line>
                                <line fill="none" stroke="#000" stroke-width="1.4" x1="19" y1="1" x2="1" y2="19"></line>
                            </svg>
                        </button>
                        <div class="uk-width-1-3@l uk-first-column modal-side">
                            <div class="uk-background-cover" id="modal-img"></div>
                        </div>
                        <form class="modal-body uk-width-2-3@l" id="modal-form" action="${path}/planner/edit/${planner.planNum}" method="post">
                            <div class="uk-padding-large" id="modal-content">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <div id="map"></div>

    <%@ include file="../footer.jspf" %>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703&libraries=services,clusterer,drawing"></script>
<script>
    "use strict";
    $(window).on('load', function() {
        const footerHei = $('footer').outerHeight()*3;
        const scrollMap = $('#map');
        $(window).on('scroll', function() {
            const sT = $(window).scrollTop();
            const vH = $(document).height() - window.innerHeight - footerHei;

            if (sT >= vH) {
                scrollMap.addClass('fix')
            }
            else {
                scrollMap.removeClass('fix')
            }
        });
    });

    $('#topBtn').click(function (){
        window.scrollTo({ top: 0, behavior: "smooth" });
    });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //마커 담을 배열
    let clickMarker = [],
        positions = [];

    const mapContainer = document.getElementById('map'),
        mapOptions = {
            center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
            level: 7
        },
        map = new kakao.maps.Map(mapContainer, mapOptions);

    //마커를 담는 반복문
    <c:forEach items="${days}" varStatus="i"><c:forEach items="${schedules}" var="sc"><c:if test="${days[i.index] eq sc.sday}">
        positions += {
            day: ${days[i.index]},
            num: ${sc.snum},
            letlng: new kakao.maps.LatLng(${sc.y},${sc.x})
        }
    </c:if></c:forEach></c:forEach>

    for (var i = 0; i < positions.length; i ++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: positions[i].latlng
        })
    }


    // 날짜 별 경로 버튼
    function showDayRoute() {
        //1. 기존 마커들 & 선 삭제
        //2. 마커들 출력
        //3. 마커들 배열값으로 선 그리기
    }

    //세부일정 하나 클릭
    function setLatlng(y,x) {
        map.setCenter(new kakao.maps.LatLng(y, x));
        map.setLevel(5);
        addOne(new kakao.maps.LatLng(y,x));
    }
    function addOne(position) {
        removeMarkers(null)
        const marker = new kakao.maps.Marker({
            position : position
        })
        marker.setMap(map);
        clickMarker.push(marker);
        return marker;
    }
    function removeMarkers(map) {
        for (let i = 0; i < clickMarker.length; i++) {
            clickMarker[i].setMap(map);
        }
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////s
    function heartClick(memNum) {
        if(memNum==null || memNum==0) {
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

    function editPlanner() {
        let img = '';
        img += 'url(\'${path}/resources/images/local/${planner.lnum}/${planner.lnum}-2.jpg\')';
        $(".modal-side > #modal-img").css("background-image",img);

        let content = '';
        content += '<h2 style="font-family:\'Montserrat\';font-weight:900;">플래너 수정</h2>' +
            '<div style="font-family:\'Montserrat\';font-size: 1.2rem;padding-bottom:1rem;"><small style="font-style:italic;">여행 기간을 변경하시려면 플래너를 새로 만들어주세요</small></div>' +
            '<div class="fw-normal my-3 pb-1">제목 <input type="text" class="ms-3" name="planner-title" style="width:85%!important;" required value="${planner.title}"></div>' +
            '<div class="fw-normal my-3 pb-1">메모 <input type="text" class="ms-3" name="planner-memo" style="width:85%!important;" value="${planner.memo}"></div>' +
            '<input hidden name="listDays" value="${days}"> <input hidden name="planner-days" value="${planner.days}"> <input hidden name="planner-local" value="${planner.local.kname}">' +
            '<button id="locationForModal" class="uk-button myro-color-button uk-button-large mt-3" style="float:right!important;" type="submit">수정하기</button>';
        $(".modal-body > #modal-content").html(content);
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
