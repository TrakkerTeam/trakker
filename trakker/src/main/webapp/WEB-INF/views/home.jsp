<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>

<!-- 세션 사용 옵션 -->
<%@ page session="true" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

</head>
<style>
    .container {
        position: relative;
        text-align: center;
        color: blue;
    }
    .bottom-left {
        position: absolute;
        bottom: 5px;
        left: 12px;
        display: -webkit-box;
        max-width: 400px;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .centered {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .modal-dialog {
        box-sizing: border-box !important;
        margin: 0 auto !important;
        width: 600px;
        max-width: calc(100% - 300px) !important;
        background: #fff !important;
    }
    #modal-img_trip {
        height: 400px;
    }
</style>
<body>
<%@include file="header.jspf"%>

<header class="wide-spacing" id="home">

    <div class="main-top-container">
        <div class="uk-grid-match uk-grid uk-grid-stack" uk-grid>
            <div style="margin: 0; padding: 0;" class="uk-width-2-5@m uk-first-column">
                <div class="main-left-container">
                    <div>
                        <div class="maintitleTextdiv" style="justify-content: center">
                            <div>
                                <h2 class="mainsubtitle">
                                    여행 스케줄링 플래너
                                </h2>

                            </div>

                        </div>
                        <h1 class="maintitletrakker">
                            <b>TRAKKKER</b>
                        </h1>
                        <div class="text-focus-in" id="startbutton">
                            <a onclick="location.href='#city'" class="btn mainstartbutton">시작하기</a>
                        </div>
                    </div>
                </div>
            </div>
            <div style="margin: 0; padding: 0;" class="uk-width-3-5@m uk-grid-margin uk-first-column">
                <div style="background-color: rgb(129,129,145); height: 100vh;">
                    <div>
                        <video muted autoplay loop style="height: 100vh; max-width: none" id="mainVideo">
                            <source type="video/mp4" src="${path}/include/trakker_video/trakkerMainVideo.mp4">
                        </video>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-grid-match main-bottom-container uk-grid" uk-grid>
        <div style="margin: 0px; padding: 0px; opacity: 1; transform: translateX(0px) translateY(0px) scale(1);
        " class="uk-width-2-5@m uk-first-column" uk-parallax="opacity:0,1,1; y:100,0,0; x:-100,-100,0; scale:0.5,1,1; viewport:0.5;">
            <div style="background-color: #fafafa; height: 300px; display: flex; justify-content: center; align-items: center">
                <h7>
                    " 여행 일자, 숙소, 가고 싶은 장소만 "
                    <br>
                    " 선택하면 일정이 자동으로 완성되는 "
                    <br>
                    " 쉽고 간편한 여행 일정 플래너"
                </h7>
            </div>
        </div>
        <div style="margin: 0; padding: 0;" class="uk-width-3-5@m uk-first-column">
            <div>
                <div class="row" style="height: 300px">
                    <div style="margin: 0; padding: 0; display: flex; justify-content: center; align-items: center;
flex-direction: column; background-color: #fff; height: 100%;" class="col s12 m4">
                        <h4 style="font-family: 'Montserrat' !important;">
                            <b>STEP 1</b>
                        </h4>
                        <div>여행지선택</div>
                    </div>
                    <div style="margin: 0; padding: 0; display: flex; justify-content: center;
align-items: center; flex-direction: column; background-color: #fff; height: 100%;" class="col s12 m4">
                        <h4 style="font-family: 'Montserrat' !important;">
                            <b>STEP 2</b>
                        </h4>
                        <div>장소선택</div>
                    </div>
                    <div style="margin: 0; padding: 0; display: flex; justify-content: center;
align-items: center; flex-direction: column; background-color: #fff; height: 100%;" class="col s12 m4">
                        <h4 style="font-family: 'Montserrat' !important;">
                            <b>STEP 3</b>
                        </h4>
                        <div>일정생성</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="countcon">
        <div class="countbox">
            <div class="countboxDiv">
                <h7>이용자수</h7>
                <h3>
                    <span class="counter" id="routeCnt">${memberTotalCount}</span>
                </h3>
            </div>
            <div class="countboxDiv">
                <h7>여행지</h7>
                <h3>
                    <span class="counter" id="cityCnt">${localTotalCount}</span>
                </h3>
            </div>
        </div>
    </div>
</header>
<div class="container cityListMobileWidth">
    <div class="uk-margin-large info-section pb-5">
        <div class="main-section-text-container">
            <div class="main-section-title"><h1>인기 리뷰</h1></div>
        </div>

        <div class="uk-slider-container-offset uk-slider uk-slider-container" uk-slider="">
            <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" id="travelReview">
                <ul class="uk-slider-items uk-child-width-1-2@s uk-grid" style="transform: translate3d(0px, 0px, 0px);">
                    <c:forEach var="review" items="${review}">
                        <li name="getBlog" tabindex="-1" class="" style="">
                            <div class="uk-cover-container" style="cursor: pointer">
                                <a href="${path}/review/detail?review_num=${review.review_num}">
                                    <c:set var="randomNumber" value="${Random().nextInt(5) + 1}" />
                                    <c:set var="region" value="${review.lnum}" />
                                    <img src="${path}/resources/images/local/${region}/${region}-${randomNumber}.jpg" loading="lazy">
                                    <div class="uk-overlay-primary uk-position-cover" style="background: rgba(34, 34, 34, 0.3)"></div>
                                    <div class="card-img-overlay rounded-3 p-0">
                                        <div class="card-body align-text-top text-end p-3">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <h3>${review.local.kname}</h3>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <i class="bi bi-star-fill me-1 pb-1"></i>
                                                    <h3 class="mt-3"><fmt:formatNumber value="${review.rating.ratingAvg}" pattern="0.0"/></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex bottom-left">
                                        <h4>${review.member.mem_nickname}</h4>
                                    </div>
                                    <div class="centered">
                                        <h2>${review.title}</h2>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-icon uk-slidenav-previous uk-slidenav" href="#" uk-slidenav-previous="" uk-slider-item="previous"><svg width="14" height="24" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg"><polyline fill="none" stroke="#000" stroke-width="1.4" points="12.775,1 1.225,12 12.775,23 "></polyline></svg></a>
                <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-icon uk-slidenav-next uk-slidenav" href="#" uk-slidenav-next="" uk-slider-item="next"><svg width="14" height="24" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg"><polyline fill="none" stroke="#000" stroke-width="1.4" points="1.225,23 12.775,12 1.225,1 "></polyline></svg></a>
            </div>
            <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"><li uk-slider-item="0" class=""><a href=""></a></li><li uk-slider-item="1" class=""><a href=""></a></li><li uk-slider-item="2" class=""><a href=""></a></li><li uk-slider-item="3" class=""><a href=""></a></li><li uk-slider-item="4" class=""><a href=""></a></li><li uk-slider-item="5" class=""><a href=""></a></li><li uk-slider-item="6" class=""><a href=""></a></li><li uk-slider-item="7" class="uk-active"><a href=""></a></li><li uk-slider-item="8" class=""><a href=""></a></li><li uk-slider-item="9" class=""><a href=""></a></li></ul>
        </div>
    </div>
    <div class="uk-margin-large info-section">
        <div class="main-section-text-container">
            <div class="main-section-title"><h1>관광명소</h1></div>
        </div>
        <div class="d-flex justify-content-end mb-3">
            <button class="btn btn-outline-success" onclick="redirectToTripPage()">더보기</button>
        </div>
        <div class="uk-position-relative uk-visible-toggle uk-light uk-slider uk-slider-container" tabindex="-1" uk-slider="">
            <ul class="uk-slider-items uk-grid" id="topCityListForWebPage" style="transform: translate3d(0px, 0px, 0px);">
                <c:forEach var="trip" items="${trip}">
                    <a onclick="tripModal(${trip.t_num})" style="color:inherit!important;text-decoration:none!important;" data-bs-toggle="modal" data-bs-target="#trip_a">
                        <div class="uk-panel" style="width: 100%;">
                            <c:set var="img" value="${trip.t_subject}"/>
                            <img src="${path}/resources/images/trip/${img}.jpg" onerror="this.src='${path}/resources/images/trip/${img}.png'" class="card-img-top"
                                 style="width: 100%; height: 225px;">
                            <div class="main-photo-linear"></div>
                            <div class="uk-position-bottom uk-text-center" style="margin-bottom:8px;">
                                <h3>${trip.t_subject}</h3>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </ul>
            <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-icon uk-slidenav-previous uk-slidenav" href="#" uk-slidenav-previous="" uk-slider-item="previous">
                <svg width="14" height="24" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg">
                    <polyline fill="none" stroke="#000" stroke-width="1.4" points="12.775,1 1.225,12 12.775,23 ">
                    </polyline>
                </svg>
            </a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-icon uk-slidenav-next uk-slidenav" href="#" uk-slidenav-next="" uk-slider-item="next">
                <svg width="14" height="24" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg">
                    <polyline fill="none" stroke="#000" stroke-width="1.4" points="1.225,23 12.775,12 1.225,1 ">
                    </polyline>
                </svg>
            </a>
        </div>
    </div>
</div>
<c:set var="t" value="${modal.t_num}" />
<div class="uk-flex-top modal fade" id="trip_a" tabindex="-1" aria-hidden="true" style="top:8rem;">
    <div class="modal-dialog uk-width-auto uk-margin-auto-vertical">
        <div class="trip_modal-content border-0">
            <div class="uk-grid-match uk-grid-small uk-grid">
                <button class="uk-modal-close-full uk-close-large uk-icon uk-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <line fill="none" stroke="#000" stroke-width="1.4" x1="1" y1="1" x2="19" y2="19"></line>
                        <line fill="none" stroke="#000" stroke-width="1.4" x1="19" y1="1" x2="1" y2="19"></line>
                    </svg>
                </button>
                <div class="uk-width-1-3@l uk-first-column modal-side">
                    <div class="uk-background-cover" id="modal-img_trip"></div>
                </div>
                <div class="modal-body uk-width-2-3@l">
                    <div class="uk-padding-large" id="trip_modal-content">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section id="removeani" class="content section">
    <article>
        <div id="city" class="headercont">
            <h2><b>어디로 여행을 떠나시나요?</b></h2>
        </div>
        <div class="row" id="cityList">
            <c:forEach items="${local}" varStatus="i">
                <div class="col s12 m6 l3" style="flex-basis:20rem!important;">
                    <a onclick="plannerModal(${local[i.index].lnum})" style="color:inherit!important;text-decoration:none!important;" data-bs-toggle="modal" data-bs-target="#plan_d">
                        <div class="city-card-style hoverable z-depth-2" style="margin:0;">
                            <div class="card-image imgbox">
                                <img src="${path}/resources/images/local/${local[i.index].lnum}/${local[i.index].lnum}-2.jpg" alt="city" loading="lazy">
                            </div>
                            <div class="city-card-contents-div">
                                <li class="city-card-contents-title">
                                    <div class="citynamefont">
                                        <b>${local[i.index].ename}</b>
                                        <br>
                                        <h6 class="city-card-contents-subtitle">${local[i.index].kname}</h6>
                                    </div>
                                </li>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </article>
</section>
</div>
<div class="row my-5"></div>
<div class="my-5" style="display: flex; justify-content: center">
    <p uk-margin="">
        <button onclick="location.href='#city'" class="uk-button uk-button-default uk-button-large uk-first-column">
            여행지 선택화면으로 돌아가기
        </button>
    </p>
</div>

<c:set var="l" value="${modal.lnum}" />
<div class="uk-flex-top modal fade" id="plan_d" tabindex="-1" aria-hidden="true" style="top:8rem;">
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
                <form class="modal-body uk-width-2-3@l" id="modal-form" action="${path}/planner/new" method="post">
                    <div class="uk-padding-large" id="modal-content">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jspf"%>
</body>
<script>
    const videoFiles = [
        '${path}/include/trakker_video/trakkerMainVideo.mp4',
        '${path}/include/trakker_video/trakkerMainVideo2.mp4',
        '${path}/include/trakker_video/trakkerMainVideo3.mp4',
        '${path}/include/trakker_video/trakkerMainVideo4.mp4'
    ];
    const randomVideo = Math.floor(Math.random() * videoFiles.length);
    const randomVideoFile = videoFiles[randomVideo];
    const videoPlayer = document.getElementById('mainVideo');
    videoPlayer.src = randomVideoFile;

    function plannerModal(num) {
        $.ajax({
            url: "${path}/modal" ,
            data: { lnum : num },
            type: "post",
            dataType: 'json',
            success: function (data) {
                let img = '';
                img += 'url(\'${path}/resources/images/local/'+data.lnum+'/'+data.lnum+'-2.jpg\')';
                $(".modal-side > #modal-img").css("background-image",img);

                let content = '';
                content += '<h2 style="font-family:\'Montserrat\';font-weight: 900;margin-bottom:0;">'+data.ename+'</h2>' +
                    '<div style="font-family:\'Montserrat\';font-size: 1.2rem;padding-bottom:1rem;">'+data.kname+'</div>' +
                    '<div class="fw-normal my-3 pb-1">여행 기간' +
                    '<select class="ms-3" name="planner-days" required> <option value="1">1일</option> <option value="2">2일</option> <option value="3">3일</option> <option value="4">4일</option> <option value="5">5일</option> </select> </div>' +
                    '<div class="fw-normal my-3 pb-1">제목 <input type="text" class="ms-3" name="planner-title" style="width:85%!important;" required></div>' +
                    '<div class="fw-normal my-3 pb-1">메모 <input type="text" class="ms-3" name="planner-memo" style="width:85%!important;"></div>' +
                    '<input hidden name="planner-local" value="'+data.lnum+'">' +
                    '<button id="locationForModal" class="uk-button myro-color-button uk-button-large mt-3" style="float:right!important;" type="submit">일정만들기</button>';
                $(".modal-body > #modal-content").html(content);
            }
        })
    }

    function tripModal(num) {
        $.ajax({
            url: "${path}/modal_trip",
            data: {t_num : num},
            type: "post",
            dataType: 'json',
            success: function (data) {
                let img = '';
                img += 'url(\'${path}/resources/images/trip/'+data.t_subject+'.jpg'+'\')';
                $(".modal-side > #modal-img_trip").css("background-image",img);

                let con = '';
                con += '<h2 style="font-family:\'Montserrat\';font-weight: 900;margin-bottom:0;">'+data.t_subject+'</h2>' +
                    '<div style="font-family:\'Montserrat\';font-size: 1.2rem;padding-bottom:1rem;">'+data.content+'</div>';
                $(".modal-body > #trip_modal-content").html(con);
            }
        })
    }
    function redirectToTripPage() {
        location.href = "${path}/trip/trip_list?num=1";
    }
</script>
</html>
