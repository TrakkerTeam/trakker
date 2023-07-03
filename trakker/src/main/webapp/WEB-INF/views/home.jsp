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
                            <a onclick="start()" class="btn mainstartbutton">시작하기</a>
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
                    <span class="counter" id="routeCnt">146,654</span>
                </h3>
            </div>
            <div class="countboxDiv">
                <h7>여행지</h7>
                <h3>
                    <span class="counter" id="cityCnt">93</span>
                </h3>
            </div>
        </div>
    </div>
    <div class="container cityListMobileWidth">
        <div class="uk-margin-large info-section">
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
                                    <c:set var="randomNumber" value="${Random().nextInt(6) + 1}" />
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
    </div>


</header>
<br>
<a href="${path}/planner/new">플래너 작성</a> /
<a href="${path}/planner/1">플래너 상세(planNum=1)</a> /
<a href="${path}/planner">플래너 목록</a> /
<a href="${path}/planner/modal">모달</a>

<br> <br>

<a href="${path}/planner/test/mapTest">상세 테스트</a> /
<a href="${path}/planner/test/mapSearchTest">검색 테스트</a> /
<a href="${path}/planner/test/simpleTest">심플</a>

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
</script>
</body>
</html>
