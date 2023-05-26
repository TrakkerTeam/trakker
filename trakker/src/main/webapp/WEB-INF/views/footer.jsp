<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>footer</title>
</head>
<body>

<div style="width:100%">
    <div style="width:100%;float:left;">
        <style type="text/css">
            #footer_top{ background: #fff; text-align: left;}
            #footer_top .footer-top { border-top: 1px solid #e9e9e9; padding: 40px 0 35px; display: inline-block; width: 100%;}
            #footer_top .comm-w {width: 1260px;margin: 0 auto;}
            #footer_top .group h4 { margin-bottom: 24px;color: #666; font-size: 14px;font-weight: 600;}
            #footer_top .cs {width: 38%;float: left; border-right: 1px solid #e9e9e9;}
            #footer_top .cs p.call {color: #2e2b2d; font-size: 36px; line-height: 30px; font-weight: 500;font-family: 'Lato'; padding-bottom: 18px;}
            #footer_top .cs p {line-height: 22px;font-size: 14px; color: #888;}
            #footer_top .bank {width: 42%;float: left;border-right: 1px solid #e9e9e9; margin-left: 5%;}
            #footer_top .bank p.call {color: #2e2b2d; font-size: 36px; line-height: 30px; font-weight: 500;font-family: 'Lato'; padding-bottom: 18px;}
            #footer_top .bank p {line-height: 22px;font-size: 14px; color: #888;}
            #footer_top .board {width: 9%;float: left; margin-left: 5%;}
            #footer_top .board ul li {line-height: 22px; float: none;  width: 100%; margin-bottom: 0;}
            #footer_top .board ul li a {font-size:14px;color:#666;}
            #footer_top .board ul li a:hover {color:#000;}
            #y_footer { width:100%; background-color:#f9f9f9; height: 210px; position:relative; border-top: 1px solid #e9e9e9; }
            #y_footer .wrap { width:1260px; margin:0 auto; position:relative;  }
            #y_footer img { position:absolute; top:55px; left:0; }
            #y_footer address { position:absolute; left:100px; text-align:left; margin:50px 100px; font-style:normal; font-size:14px; line-height:1.6; color:#999; box-sizing:border-box; }
            #y_footer address .ad_ti {font-weight: 600; color:#666;}
            #y_footer .escro_foot { position:absolute; right: 270px; top:0px; }
            #y_footer .escro_foot img {  height:80px; width:auto; }
        </style>



        <div id="footer_top">
            <div class="footer-top">
                <div class="comm-w clear dpi_wrap">

                    <!-- CS CENTER -->
                    <div class="group cs">
                        <h4>CS CENTER</h4>
                        <div class="con">
                            <p class="call">010-0000-0000</p>
                            <p class="s_txt">
                                10:00 ~ 17:00<br>
                                토/일/공휴일 휴무<br>
                                점심시간 오후 13:00~14:00
                            </p>
                        </div>
                    </div>
                    <!-- CS CENTER -->


                    <!-- BANK ACCOUNT -->

                    <div class="group bank">
                        <h4> 여행 스케줄링 플래너</h4>
                        <div class="con">
                            <p class="call">TRAKKER</p>
                            <p class="s_txt">
                                <br>
                                (주) TRAKKER
                            </p>
                        </div>
                    </div>

                    <div class="group board">
                        <h4>COMMUNITY</h4>
                        <div class="con">
                            <ul>

                                <li><a href="#"><span>문의게시판</span></a></li>
                                <li><a href="#"><span>FAQ</span></a></li>
                                <li><a href="${path}/userAgreements.do" ><span>이용약관</span></a></li>

                            </ul>
                        </div>
                    </div>
                    <!-- BOARD -->

                </div>
            </div>
        </div>




        <footer id="y_footer">
            <div class="footer_wrap">
                <div class="wrap">
                    <!-- <img src="/data/yedda/foot_logo.png"> -->
                    <address>
                        <span style="" class="footCopyrightbtn" onclick="onopen();" valign="absmiddle">사업자정보확인</span> 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층<br>
                        대표자명: Trakker<span class="bar">｜</span>사업자등록번호: 132-81-000000<span class="bar">｜</span>문의전화: 070-7777-7777<span class="bar">｜</span>팩스: 02-1234-1411<span class="bar"><br>
				</span> 통신판매신고: 제2018-서울역삼-0000호 <span class="bar">｜</span> 개인정보관리책임자: Trakker (Trakker@gmail.com)<br>
                        <br>
                        © 2019 <b> TRAKKER </b> ALL RIGHTS RESERVED.
                    </address>

                </div>
            </div>
        </footer>

    </div>
</div>

</body>
</html>