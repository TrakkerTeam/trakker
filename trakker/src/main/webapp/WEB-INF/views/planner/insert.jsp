<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../itemfile.jspf" %>
<html>
<head>
    <title>플래너 만들기</title>
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
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-inverse navbar-fixed-top navbar-white p-0" style="z-index:1;">
    <a class="navbar-brand mx-2" href="${path}"><img src="${path}/resources/images/logo.png" style="width:120px;"></a>
    <div class="container-fluid p-3">
        <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item" style="font-size:22px;font-family:'Montserrat'">
                    ${title} <c:if test="${empty memo ? false : true}"> - <small style="font-style:italic;"> ${memo}</small></c:if>
                </li>
            </ul>
            <ul class="navbar-nav mt-0">
                <li class="btn-group px-3">
                    <button type="button" class="btn btn-success" onclick="submit()">플래너 만들기</button>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="d-flex flex-column flex-shrink-0 bg-light h-100" style="width:60px; position: fixed;z-index:5;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
        <c:forEach var="day" begin="1" end="${days}">
            <li class="day-list"><a href="javascript:void(0)" onclick="plansChange(${day})" class="day-text nav-link py-3 border-bottom rounded-0 text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right"><strong>${day}</strong></a></li>
        </c:forEach>
    </ul>
</div>
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white overflow-auto" style="padding-left:60px;width:330px;height:90%;position:fixed;z-index:4;">
    <c:forEach var="day" begin="1" end="${days}">
        <div class="list-group list-group-flush border-bottom day-plans" data-date="${day}">
            <div class="list-group-item py-3 lh-sm" style="background-color: #dff0d8">
                <div class="d-flex w-100 align-items-center">
                    <strong class="mb-1">DAY ${day} 세부일정</strong>
                    <input hidden name="sDay" value="${day}">
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div class="d-flex flex-column flex-shrink-0" id="menu_wrap" style="padding-left:330px;width:550px;height:85%;position:fixed;z-index:3;">
    <div class="option">
        <form onsubmit="searchPlaces(); return false;" class="m-0">
            <input type="text" value="${local.kname} 여행" id="keyword" class="ms-3 my-3 rounded-3 border-1" style="width:130px;">
            <button type="submit" class="rounded-3 border-1">검색</button>
        </form>
    </div>
    <ul class="list-unstyled p-2" id="placesList" style="height:80%!important;"></ul>
    <div id="pagination"></div>
</div>
<div class="d-flex flex-column" id="map" style="margin-left:550px;width:65%!important;height:90%!important;position:fixed;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703&libraries=services"></script>
<script>
    "use strict";
    let markers = [],
        clickMarker = [];
    const mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 3
        },
        map = new kakao.maps.Map(mapContainer, mapOption),
        ps = new kakao.maps.services.Places(),
        infowindow = new kakao.maps.InfoWindow({zIndex: 1});

    searchPlaces();
    function searchPlaces() {
        const keyword = document.getElementById('keyword').value;
        if (!keyword.replace(/^\s+|\s+$/g,'')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        ps.keywordSearch( keyword, placesSearchCB,  { size: 5 });
    }
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
            displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }
    function displayPlaces(places) {
        const listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds();
        removeAllChildNodes(listEl);
        removeMarkers();
        for (let i=0; i<places.length; i++ ) {
            const placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]);
            bounds.extend(placePosition);

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
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;
        map.setBounds(bounds);
    }
    function getListItem(index, places) {
        let el = document.createElement('li'),
        itemStr = '<div class="d-flex w-100"><div class="markerbg marker_'+(index + 1)+'">'+(index + 1)+'</div>' +
                '<small class="m-0 mx-2 place-title w-75"><strong>' + places.place_name + '</strong></small>' +
                '<button class="rounded-3 bg-white border-1" onclick="scheduleInsert(\''+places.place_name+'\',\''+ places.y+'\',\''+places.x+'\')">+</button></div>';
        if (places.road_address_name) {
            itemStr += '<small class="road text-muted ms-2">'+places.road_address_name+'</small>' +
                '<small class="jibun gray text-muted ms-2">'+places.address_name+'</small>';
        } else {
            itemStr += '<small class="text-muted ms-2">'+places.address_name+'</small>';
        }
        if(places.phone) itemStr += '<small class="tel text-muted ms-2">'+'tel: '+places.phone+'</small>';
        el.innerHTML = itemStr;
        el.className = 'item mb-3';
        return el;
    }
    function addMarker(position, idx) {
        const imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
            imageSize = new kakao.maps.Size(36, 37),
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691),
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
                offset: new kakao.maps.Point(13, 37)
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position,
                image: markerImage
            });
        marker.setMap(map);
        markers.push(marker);
        return marker;
    }
    function removeMarkers() {
        for (let i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }
    function displayPagination(pagination) {
        let paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }
        for (i=1; i<=pagination.last; i++) {
            const el = document.createElement('a');
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
    function displayInfowindow(marker, title) {
        const content = '<div style="width:100%;padding:5px;z-index:1;">' + title + '   .' + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
    function removeAllChildNodes(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }

    const planslide = document.querySelectorAll('.day-plans');
    function plansChange(day) {
        day -=1;
        const background = document.querySelectorAll('.day-list');
        const color = document.querySelectorAll('.day-text ');
        for(let i=0; i<planslide.length; i++){
            planslide[i].style.display = "none";
            background[i].style.background = "#dff0d8";
            color[i].style.color = '#198754';
        }
        planslide[day].style.display = "block";
        background[day].style.background = "#198754";
        color[day].style.color = '#ffffff';
    }
    plansChange(1);

    function scheduleInsert(place_name, place_y, place_x){
        const parent = $('.day-plans[style*="display: block"]');
        const day = parent.attr('data-date');
        const num = parent.children().length;
        if(num<11){
            parent.append(getHtml(place_name,place_y,place_x,num,day));
        }else{
            alert("일정은 최대 10개로 제한됩니다.");
        }
    }
    function getHtml(place_name,place_y,place_x,num,day){
        const div = "<div class='list-group-item list-group-item-action py-3 lh-sm plans-detail' data-sday='" + day + "' data-y=\"" + place_y + "\" data-x=\"" + place_x + "\"" +
            "onclick=\"planClick(" + place_y + "," + place_x + ",\'" + place_name + "\')\">" +
            "<div class='d-flex w-100 align-items-center justify-content-between'>" +
            "<i class='me-2 text-muted plans-snum'>" + num + "</i>" +
            "<div class='text-decoration-none text-black w-75'>" +
            "<strong class='mb-1 place-title plans-title' data-splace=\"" + place_name + "\" >" + place_name + "</strong>" +
            "</div>" +
            "<small><button class='btn-outline-success rounded-3 border-1' onclick=\"planDelete(\'" + num + "\')\">삭제</button></small>" +
            "</div>" +
            "<input class='col-10 w-100 m-0 mt-2 small plans-memo' style='resize:none;' placeholder='일정 메모' />" +
            "</div>";
        return div;
    }

    function planClick(y,x, title) {
        map.setCenter(new kakao.maps.LatLng(y, x));
        const marker = addOne(new kakao.maps.LatLng(y,x));
        displayInfowindow(marker, title);
    }
    function addOne(position) {
        removeOne(null)
        const marker = new kakao.maps.Marker({
            position : position
        })
        marker.setMap(map);
        clickMarker.push(marker);
        return marker;
    }
    function removeOne(map) {
        for (let i = 0; i < clickMarker.length; i++) {
            clickMarker[i].setMap(map);
        }
    }

    function planDelete(num){
        const parent = $('.day-plans[style*="display: block"]');
        const kid = parent.children().eq(num);
        const next_kids = kid.nextAll();
        kid.remove();
        next_kids.each(function (){
            $(this).find('i').text(num);
            var btn = "planDelete(" + num + ")";
            $(this).find('button').attr("onclick", btn);
            ++ num;
        });
    }

    function submit() {
        const memNum = "${sessionScope.mem_num}"
        const lnum = "${local.lnum}";
        const title = "${title}";
        const memo = "${memo}";
        const days = "${days}";

        const sday = [];
        const snum = [];
        const y = [];
        const x = [];
        const spoint = [];
        const smemo = [];

        let nullCheck = true;
        $('.day-plans').each(function (){
            if($(this).children().length < 4){
                nullCheck = false;
            }
        });
        if(!nullCheck) {
            alert("각 여행일에는 최소 3개의 일정을 추가해주세요.");
        }
        if(memNum == null && nullCheck== true) {
            if(confirm("로그인 후 이용하실 수 있는 기능입니다. 로그인하시겠습니까?")){
                location.href="${path}/login";
            }
        }else if(memNum != null && nullCheck== true) {
            $('.plans-detail').each(function () {
                sday.push($(this).attr("data-sday"));
                y.push($(this).attr("data-y"));
                x.push($(this).attr("data-x"));
            });
            $('.plans-title').each(function () {
                spoint.push($(this).attr("data-splace"));
            });
            $('.plans-memo').each(function () {
                smemo.push($(this).val());
            });
            $('.plans-snum').each(function () {
                snum.push($(this).text());
            });
            $.ajax({
                url:"${path}/planner/insert",
                data: {
                    memNum : memNum,
                    lnum : lnum,
                    title : title,
                    memo : memo,
                    days : days,

                    sday : sday,
                    snum : snum,
                    spoint : spoint,
                    smemo : smemo,
                    y : y,
                    x : x
                },
                type:"post",
                success: function () {
                    location.href = "${path}/planner"
                }
            });
        }
    }
</script>
</body>
</html>