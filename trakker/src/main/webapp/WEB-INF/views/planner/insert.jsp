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
        .place-title , .road , .jibun , .tel {
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;color:#5c636a;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <nav class="navbar navbar-expand-sm navbar-inverse navbar-fixed-top navbar-white p-0" style="z-index:1;">
        <div class="container-fluid p-3">
            <a class="navbar-brand" href="${path}"><img src="${path}/resources/images/logo.png" style="width: 60px;" height="30px;"></a>
            <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        ${title} <c:if test="${memo}!=null"> - <i>"${memo}"</i></c:if>
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
                        <button type="button" class="btn btn-success" id="submit">플래너 작성</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</head>
<body>
<%--날짜 사이드바--%>
<div class="d-flex flex-column flex-shrink-0 bg-light h-100" style="width:60px; position: fixed;z-index:5;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <c:forEach var="day" begin="1" end="${days}">
            <li class="day-list"><a href="javascript:void(0)" onclick="plansChange(${day})" class="day-text nav-link py-3 border-bottom rounded-0 text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right"><strong>${day}</strong></a></li>
        </c:forEach>
    </ul>
</div>
<%--세부일정 사이드바--%>
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white overflow-auto" style="padding-left:60px;width:330px;height:90%;position:fixed;z-index:4;">
        <c:forEach var="day" begin="1" end="${days}">
        <div class="list-group list-group-flush border-bottom day-plans" data-date="${day}">
            <form>
<%--form 안에 세부일정 추가되도록 코드 수정할 것!!--%>
                <div class="list-group-item py-3 lh-sm" style="background-color: #dff0d8">
                    <div class="d-flex w-100 align-items-center">
                        <strong class="mb-1">DAY ${day} 세부일정</strong>
                        <input hidden name="sDay" value="${day}">
                    </div>
                </div>
            </form>
        </div>
        </c:forEach>
</div>

<%--검색 영역--%>
<div class="d-flex flex-column flex-shrink-0" id="menu_wrap" style="padding-left:330px;width:550px;height:90%;position:fixed;z-index:3;">
    <div class="option">
        <form onsubmit="searchPlaces(); return false;" class="m-0">
            <input type="text" value="${kName} 여행" id="keyword" class="ms-3 my-3 rounded-3 border-1" style="width:130px;">
            <button type="submit" class="rounded-3 border-1">검색</button>
        </form>
    </div>
    <ul class="list-unstyled p-2" id="placesList" style="height:80%!important;"></ul>
    <div id="pagination"></div>
</div>

<%--맵 영역--%>
<div class="d-flex flex-column" id="map" style="margin-left:550px;width:65%!important;height:90%!important;position:fixed;"></div>


<div class="alert fade alert-info" role="alert" tabindex="-1" aria-hidden="false">
    일자 별 세부 일정을 1개 이상 등록해야 합니다!
</div>

<%--div 영역에 맵 띄우는 js코드--%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703&libraries=services"></script>
<script>
    // 마커를 담을 배열입니다
    var markers = [];
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    // 키워드로 장소를 검색합니다
    searchPlaces();
    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {
        var keyword = document.getElementById('keyword').value;
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB,  { size: 5 });
    }
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);
            // 페이지 번호를 표출합니다
            displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }
    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {
        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);
        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        for ( var i=0; i<places.length; i++ ) {
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때 해당 장소에 인포윈도우에 장소명을 표시합니다. mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };
                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);
            fragment.appendChild(itemEl);
        }
        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }
    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {
        var el = document.createElement('li'),
            itemStr = '<div class="d-flex w-100">' + '<div class="markerbg marker_' + (index+1) + '">'+(index+1)+'</div>' +
                '<small class="m-0 mx-2 place-title w-75"><strong>' + places.place_name + '</strong></small>';
            itemStr += '<button class="rounded-3 bg-white border-1" onclick="scheduleInsert(\'' + places.place_name + '\',\'' + places.y + '\',\'' + places.x +  '\')">+</button></div>';
        if (places.road_address_name) {
            itemStr += '<small class="road text-muted ms-2">' + places.road_address_name + '</small>' +
                '<small class="jibun gray text-muted ms-2">' +  places.address_name  + '</small>';
        } else {
            itemStr += '<small class="text-muted ms-2">' +  places.address_name  + '</small>';
        }
        if(places.phone) itemStr += '<small class="tel text-muted ms-2">' + 'tel: ' + places.phone + '</small>';

        el.innerHTML = itemStr;
        el.className = 'item mb-3';
        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });
        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다
        return marker;
    }
    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }
    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;
        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }
        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "javascript:void(0)";
            el.innerHTML = i;
            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }
            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }
    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="width:100%;padding:5px;z-index:1;">' + title +'   .'+ '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }


//세부일정 날짜 변경
    var planslide = document.querySelectorAll('.day-plans');
    function plansChange(day) {
        day -=1;
        var background = document.querySelectorAll('.day-list');
        var color = document.querySelectorAll('.day-text ');
        for(var i=0;i<planslide.length;i++){
            planslide[i].style.display = "none";
            background[i].style.background = "#dff0d8";
            color[i].style.color = '#198754';
        }
        planslide[day].style.display = "block";
        background[day].style.background = "#198754";
        color[day].style.color = '#ffffff';
    }
    //페이지 첫 로드 시 DAY 1의 세부일정 띄우는 함수
    plansChange(1);
//--세부일정 날짜 변경


//세부일정 장소 추가
    function scheduleInsert(place_name, place_y, place_x){
        var parent =  $('.day-plans[style*="display: block"]');
        var num = parent.children().length; // 하위 엘리먼트이므로 "세부 일정" 영역도 포함
        if(num<6){ // 일정은 5개까지만 추가 가능
            parent.append(getHtml(place_name,place_y,place_x,num));
        }else{
            alert("일정은 최대 5개로 제한됩니다.");
        }
    }
    //planNum
    //sDay -
    function getHtml(place_name,place_y,place_x,num){
        var div = "<div class='list-group-item list-group-item-action py-3 lh-sm' " +
            "onclick=\"planClick("+ place_y + "," + place_x + ",\'" + place_name + "\')\">" +
            "<div class='d-flex w-100 align-items-center justify-content-between'>" +
            "<i class='me-2 text-muted'>"+num+"</i>" +
            "<div class='text-decoration-none text-black w-75'>" +
            "<strong class='mb-1 place-title'>"+place_name+"</strong>" +
            "<input type='hidden' name='sNum' value='"+num+"'>" +
            "<input type='hidden' name='sPoint' value='"+place_name+"'>" +
            "<input type='hidden' name='y' value='"+place_y+"'>" +
            "<input type='hidden' name='x' value='"+place_x+"'>" +
            "</div>" +
            "<small><button class='btn-outline-success rounded-3 border-1' onclick=\"planDelete(\'" + num + "\')\">삭제</button></small>" +
            "</div>" +
            "<input class='col-10 w-100 m-0 mt-2 small' name='sMemo' style='resize:none;' placeholder='일정 메모'/>" +
            "</div>";
        return div;
    }
    function planClick(y,x, title) {
        map.setCenter(new kakao.maps.LatLng(y, x));
        var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(y, x)
        });
        marker.setMap(map)

        var content = '<div style="width:100%;padding:5px;z-index:1;">' + title +'   .'+ '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    function planDelete(num){
        var parent =  $('.day-plans[style*="display: block"]');
        var kid = parent.children().eq(num); // 일정 부분에 세부일정 영역도 자식에 포함되기에 index +1
        var next_kids = kid.nextAll();

        kid.remove(); //선택한 문서를 제거합니다.

        next_kids.each(function (index, element){
            $(this).find('i').text(num); //세부 일정 넘버링 변경

            //세부 일정 삭제 js코드 num 변경
            var btn = "planDelete(" + num + ")";
            $(this).find('button').attr("onclick", btn);
            ++ num;
        });
    }
//--세부일정 장소 추가


//작성완료 버튼
    function planSubmit(){

    }
//--작성완료 버튼
</script>
</body>
</html>