<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션 사용 옵션 -->
<%@ page session="true" %>

<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>

</head>
<body>
<%@include file="header.jsp"%>
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
</header>

</body>
</html>
