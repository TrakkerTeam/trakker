<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">

    <title>Home</title>

</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btnWrite").click(function () {
            location.href = "${path}/trip/write.do";
        });
        $("#btnModify").click(function () {
            location.href = "${path}/trip/view.do";
        });
    });

    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    function redirectToPage() {
        location.href = "${path}/faq/faq_list.jsp";
    }

</script>
<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    .rate {
        display: inline-block;
        border: 0;
        margin-right: 15px;
    }

    .rate > input {
        display: none;
    }

    .rate > label {
        float: right;
        color: #ddd
    }

    .rate > label:before {
        display: inline-block;
        font-size: 2rem;
        padding: .3rem .2rem;
        margin: 0;
        cursor: pointer;
        font-family: FontAwesome;
        content: "\f005 ";
    }

    .rate .half:before {
        content: "\f089 ";
        position: absolute;
        padding-right: 0;
    }

    .rate input:checked ~ label,
    .rate label:hover, .rate label:hover ~ label {
        color: #ffca2c !important;
    }

    .rate input:checked + .rate label:hover,
    .rate input input:checked ~ label:hover,
    .rate input:checked ~ .rate label:hover ~ label,
    .rate label:hover ~ input:checked ~ label {
        color: #ffca2c !important;
    }

    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
    }

    .modal-content {
        display: block;
        margin: 15% auto;
        max-width: 900px;
        padding: 20px;
        border-radius: 5px;
    }

</style>
<body>
<div class="album py-5">
    <div class="container">
        <h3>관광지</h3>
        <div class="col-sm-3">
            <form class="d-flex" role="search">
                <select>
                    <option>관광명소</option>
                    <option>내용</option>
                    <option>관광명소+내용</option>
                </select>
                <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            &nbsp;
        </div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="width: 8%">번호</th>
                <th style="width: 18%">관광명소</th>
                <th style="width: 62%">내용</th>
                <th style="width: 12%">조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>
                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">북촌 한옥마을</h4>
                                <div class="ml-auto">
                                    <button type="button" class="btn btn-outline-success">글수정</button>
                                    <button type="button" class="btn-close" aria-label="Close"
                                            onclick="closeModal('myModal')" data-dismiss="modal"></button>
                                </div>
                            </div>
                            <div class="modal-body" style="display: flex;">
                                <div style="flex: 1;">
                                    <img src="${pageContext.request.contextPath}/resources/images/hanook.png"
                                         alt="이미지" style="width: 100%; height: auto;">
                                </div>
                                <div style="flex: 1; padding-left: 10px;">
                                    <p style="float:right;">Some text in the modal. 안녕하세요 북촌 한옥마을은 서울에 위치한
                                        한옥마을으로 사진찍기도 좋고 예쁜 카페도 많이 있습니다.</p>
                                </div>
                            </div>
                            <div class="modal-footer d-flex">
                                <div style="flex:1;">
                                    <div style="flex:1;"
                                         class="d-flex justify-content-start align-items-center float-left">
                                        <fieldset class="rate">
                                            <input type="radio" id="rating10" name="rating"
                                                   value="10"><label for="rating10" title="5점"></label>
                                            <input type="radio" id="rating9" name="rating" value="9"><label
                                                class="half" for="rating9" title="4.5점"></label>
                                            <input type="radio" id="rating8" name="rating" value="8"><label
                                                for="rating8" title="4점"></label>
                                            <input type="radio" id="rating7" name="rating" value="7"><label
                                                class="half" for="rating7" title="3.5점"></label>
                                            <input type="radio" id="rating6" name="rating" value="6"><label
                                                for="rating6" title="3점"></label>
                                            <input type="radio" id="rating5" name="rating" value="5"><label
                                                class="half" for="rating5" title="2.5점"></label>
                                            <input type="radio" id="rating4" name="rating" value="4"><label
                                                for="rating4" title="2점"></label>
                                            <input type="radio" id="rating3" name="rating" value="3"><label
                                                class="half" for="rating3" title="1.5점"></label>
                                            <input type="radio" id="rating2" name="rating" value="2"><label
                                                for="rating2" title="1점"></label>
                                            <input type="radio" id="rating1" name="rating" value="1"><label
                                                class="half" for="rating1" title="0.5점"></label>
                                        </fieldset>
                                        <button type="button" class="btn btn-outline-success">등록</button>
                                    </div>
                                </div>
                                <div>
                                    <small class="text-muted">조회수:0</small>
                                    <small class="text-muted">작성일: 2023-05-28</small>
                                    <button class="btn btn-outline-success" onclick="redirectToPage()">플래너
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#" onclick="openModal('myModal')">북촌 한옥마을</a></td>
                <td><p class="content2">북촌 한옥마을은 서울에 위치한
                    한옥마을으로 사진찍기도 좋고 예쁜 카페도 많이 있습니다.
                </p>
                </td>
                <td>0</td>
            </tr>
            <tr>
                <td>2</td>
                <td>
                    <div id="myModal2" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">전주 한옥마을</h4>
                                <div class="ml-auto">
                                    <button type="button" class="btn btn-outline-success">글수정</button>
                                    <button type="button" class="btn-close" aria-label="Close"
                                            onclick="closeModal('myModal2')" data-dismiss="modal"></button>
                                </div>
                            </div>
                            <div class="modal-body" style="display: flex;">
                                <div style="flex: 1;">
                                    <img src="${pageContext.request.contextPath}/resources/images/junju.png"
                                         alt="이미지" style="width: 100%; height: auto;">
                                </div>
                                <div style="flex: 1; padding-left: 10px;">
                                    <p style="float:right;">전주한옥마을은 전라북도 전주시 완산구 풍남동에 있는 한옥마을이다. 전주에는 지금으로부터
                                        약 1만 5천년 전부터 사람이 살기 시작했다고 추측되고 있다.
                                        원래 자연부락 형태의 마을들이 산자락에 형성되었었으나, 665년 신라 문무왕 때 완산주(完山州)가 설치되면서 주거지가
                                        평지로 이동했다.
                                        전주사람들의 본격적인 평지에서의 생활은 전주성의 축조와 함께 시작되었다.</p>
                                </div>
                            </div>
                            <div class="modal-footer d-flex">
                                <div style="flex:1;"
                                     class="d-flex justify-content-start align-items-center float-left">
                                    <fieldset class="rate">
                                        <input type="radio" id="rating20" name="rating" value="10"><label
                                            for="rating20" title="5점"></label>
                                        <input type="radio" id="rating19" name="rating" value="9"><label
                                            class="half" for="rating19" title="4.5점"></label>
                                        <input type="radio" id="rating18" name="rating" value="8"><label
                                            for="rating18" title="4점"></label>
                                        <input type="radio" id="rating17" name="rating" value="7"><label
                                            class="half" for="rating17" title="3.5점"></label>
                                        <input type="radio" id="rating16" name="rating" value="6"><label
                                            for="rating16" title="3점"></label>
                                        <input type="radio" id="rating15" name="rating" value="5"><label
                                            class="half" for="rating15" title="2.5점"></label>
                                        <input type="radio" id="rating14" name="rating" value="4"><label
                                            for="rating14" title="2점"></label>
                                        <input type="radio" id="rating13" name="rating" value="3"><label
                                            class="half" for="rating13" title="1.5점"></label>
                                        <input type="radio" id="rating12" name="rating" value="2"><label
                                            for="rating12" title="1점"></label>
                                        <input type="radio" id="rating11" name="rating" value="1"><label
                                            class="half" for="rating11" title="0.5점"></label>
                                    </fieldset>
                                    <button type="button" class="btn btn-outline-success">등록</button>
                                </div>

                                <div>
                                    <small class="text-muted">조회수:0</small>
                                    <small class="text-muted">작성일: 2023-05-28</small>
                                    <button class="btn btn-outline-success" onclick="redirectToPage()">플래너
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#" onclick="openModal('myModal2')">전주 한옥마을</a></td>
                <td>
                    <div id="myModal3" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">경복궁</h4>
                                <div class="ml-auto">
                                    <button type="button" class="btn btn-outline-success" id="btnModify">글수정</button>
                                    <button type="button" class="btn-close" aria-label="Close"
                                            onclick="closeModal('myModal3')" data-dismiss="modal"></button>
                                </div>
                            </div>
                            <div class="modal-body" style="display: flex;">
                                <div style="flex: 1;">
                                    <img src="${pageContext.request.contextPath}/resources/images/gyeongboggung.png"
                                         alt="이미지" style="width: 100%; height: auto;">
                                </div>
                                <div style="flex: 1; padding-left: 10px;">
                                    <p style="float:right;">경복궁은 조선 왕조 제일의 법궁이다. 북으로 북악산을 기대어 자리 잡았고 정문인 광화문
                                        앞으로는 넓은 육조거리(지금의 세종로)가 펼쳐져,
                                        왕도인 한양(서울) 도시 계획의 중심이기도 하다. 1395년 태조 이성계가 창건하였고, 1592년 임진 왜란으로 불타
                                        없어졌다가,
                                        고종 때인 1867년 중건 되었다. 흥선대원군이 주도한 중건 경복궁은 500여 동의 건물들이 미로같이 빼곡히 들어선 웅장한
                                        모습 이었다.</p>
                                </div>
                            </div>
                            <div class="modal-footer d-flex">
                                <div style="flex:1;">
                                    <div class="d-flex justify-content-start align-items-center float-left">
                                        <fieldset class="rate">
                                            <input type="radio" id="rating30" name="rating"
                                                   value="10"><label for="rating30" title="5점"></label>
                                            <input type="radio" id="rating29" name="rating" value="9"><label
                                                class="half" for="rating29" title="4.5점"></label>
                                            <input type="radio" id="rating28" name="rating" value="8"><label
                                                for="rating28" title="4점"></label>
                                            <input type="radio" id="rating27" name="rating" value="7"><label
                                                class="half" for="rating27" title="3.5점"></label>
                                            <input type="radio" id="rating26" name="rating" value="6"><label
                                                for="rating26" title="3점"></label>
                                            <input type="radio" id="rating25" name="rating" value="5"><label
                                                class="half" for="rating25" title="2.5점"></label>
                                            <input type="radio" id="rating24" name="rating" value="4"><label
                                                for="rating24" title="2점"></label>
                                            <input type="radio" id="rating23" name="rating" value="3"><label
                                                class="half" for="rating23" title="1.5점"></label>
                                            <input type="radio" id="rating22" name="rating" value="2"><label
                                                for="rating22" title="1점"></label>
                                            <input type="radio" id="rating21" name="rating" value="1"><label
                                                class="half" for="rating21" title="0.5점"></label>
                                        </fieldset>
                                        <button type="button" class="btn btn-outline-success">등록</button>
                                    </div>
                                </div>
                                <div>
                                    <small class="text-muted">조회수:0</small>
                                    <small class="text-muted">작성일: 2023-05-28</small>
                                    <button class="btn btn-outline-success" onclick="redirectToPage()">플래너
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="content2"> 전주한옥마을은 전라북도 전주시 완산구 풍남동에 있는
                        한옥마을이다.
                        원래 자연부락 형태의 마을들이 산자락에 형성되었었으나, 665년 신라 문무왕 때
                        완산주(完山州)가 설치되면서 주거지가
                        평지로 이동했다.
                    </p>
                </td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#" onclick="openModal('myModal3')">경복궁</a></td>
                <td><p class="content2">경복궁은 조선 왕조 제일의 법궁이다. 북으로
                    북악산을 기대어 자리 잡았고 정문인 광화문
                    앞으로는 넓은 육조거리가 펼쳐져,
                    왕도인 한양(서울) 도시 계획의 중심이기도 하다.
                </p>
                </td>
                <td>25</td>
            </tr>
            </tbody>
        </table>
        <button class="btn btn-outline-success" type="submit" id="btnWrite" style="float:right;">글쓰기</button>
    </div>
</div>


</body>
</html>
