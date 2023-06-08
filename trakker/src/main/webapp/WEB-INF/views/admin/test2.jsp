<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션 사용 옵션 -->
<%@ page session="true" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        .wide-spacing{
            letter-spacing: 3px;
            display: none;
        }
        .main-top-container{
            display: none;
            height: 100vh;
        }
        .uk-grid{
            margin-left: -30px;
            display: flex;
            flex-wrap: wrap;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        [class *='uk-width']{
            box-sizing: border-box;
            width: 100%;
            max-width: 100%;
        }
        .uk-grid-item-match, .uk-grid-match > *{
            display: flex;
            flex-wrap: wrap;
        }
        .uk-grid-item-match > :not([class*='uk-width']){
            box-sizing: border-box;
            width: 100%;
            flex: auto;
        }
        .uk-grid > * > :last-child{
            margin-bottom: 0;
        }
        .main-left-container{
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .maintitleTextdiv{
            display: flex;
        }
        .mainsubtitle{
            font-size: 2rem;
        }
        .maintitletrakker{
            font-size: 2.4rem;
            text-align: center;
            margin: 4px;
            font-family: 'Montserrat' !important;
            line-height: 1;
            font-weight: 500;
        }
        #startbutton{
            display: flex;
            justify-content: center;
        }
        #startbutton a{
            background-color: #98dde3 !important;
            letter-spacing: 2px;
            height: 85px;
            line-height: 85px;
            padding: 0 !important;
            text-align: center;
        }
        canvas, img, video{
            max-width: 100%;
            height: auto;
            box-sizing: border-box;
        }
        audio, canvas, iframe, img, svg, video{
            vertical-align: middle;
        }
        audio, video{
            display: inline-block;
        }
        :root{
            --uk-position-margin-offset: 0px;
        }
        :root{
            --uk-leader-fill-content: '.';
        }
        :root{
            --uk-breakpoint-s: 640px;
            --uk-breakpoint-m: 960px;
            --uk-breakpoint-l: 1200px;
            --uk-breakpoint-xl: 1600px;
        }
        h7{ font-size: 13px;}
        .row{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 20px;
        }
        .row .col.s12{
            width: 100%;
        }
        .row .col{
            float: left;
            box-sizing: border-box;
            min-height: 1px;
        }
        .uk-h4, h4{
            font-size: 1.25rem;
            line-height: 1.4;
        }
        h4{
            display: block;
            margin-block-start: 1.33em;
            margin-block-end: 1.33em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }
        b, strong{ font-weight: bolder}
        @media (max-width: 375px) {
            .countcon {
                top: 160px;
                width: 100%;
            }
        }
        @media (max-width: 600px) {
            .countcon{
                top: 185px;
                width: 100%;
                display: none;
            }
        }
        .countcon{
            clear: both;
            position: absolute;
            top: 90%;
            vertical-align: middle;
            text-align: center;
            width: 95%;
            color: #fff;
            cursor: default;
            margin: 0 auto;
            z-index: 3;
        }

        @media (max-width: 600px) {
            .countbox{
                justify-content: space-around;
            }
        }
        .countbox{
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            margin: 10px;
        }

        @media (max-width: 600px) {
            .countboxDiv{
                display: block;
            }
        }
        .countboxDiv{
            display: flex;
            margin: 0px 10px;
        }

        @media (max-width: 600px) {
            .countcon h7{
                font-size: 9px !important;
            }
        }
        .uk-h3, h3{
            font-size: 1.5rem;
            line-height: 1.4;
        }
        .counter{
            animation-duration: 1s;
            animation-delay: 0s;
            color: #fff;
            font-family: 'Montserrat';
            font-weight: 900;
        }
    </style>
</head>
<body>
<h1>안녕하세요?</h1>
<div class="wide-spacing" id="home">
    <div class="main-top-container">
        <div class="uk-grid-match uk-grid uk-grid-stack" uk-grid>
            <div style="margin: 0; padding: 0;" class="uk-width-2-5@m uk-first-column">
                <div class="main-left-container">
                    <div>
                        <div class="maintitleTextdiv" style="justify-content: center">
                            <div>
                                <h2 class="mainsubtitle">
                                    " 여행 스케줄링 플래너"
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
                            <source type="video/mp4" src="../resources/include/trakker_video/trakkerMainVideo.mp4">
                        </video>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-grid-match main-bottom-container uk-grid uk-grid-stack" uk-grid>
        <div style="margin: 0px; padding: 0px; transform: translateX(-100px) translateY(100px) scale(0.5);
opacity: 0;" class="uk-width-2-5@m uk-first-column" uk-parallax="opacity:0,1,1; y:100,0,0; x:-100,-100,0; scale:0.5,1,1; viewport:0.5;">
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
</div>

</body>
</html>
