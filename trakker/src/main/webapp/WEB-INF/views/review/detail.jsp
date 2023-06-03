<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@ include file="../header.jspf" %>
</head>
<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    .commentbox1 {
        margin: 12px 0 29px;
        padding: 16px 10px 10px 18px;
        border: 1px solid #999999;
        border-radius: 6px;
        box-sizing: border-box;
    }
    textarea {
        border: none;
        resize: none;
        outline: none;
        overflow: hidden;
        overflow-wrap: break-word;
        width: 100%;
    }

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

    .bi-star-fill {
        color: #ffca2c;
    }

    #btn1 {
        border-color: #20c997;
        color: #20c997;
        border-radius: 12px;
    }
</style>
<script>
    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (25 + obj.scrollHeight) + 'px';
    }
    // $('document').ready(function () {
    //     $('textarea').keyup(function (e) {
    //         $(this).css('height', 'auto');
    //         $(this).height(this.scrollHeight);
    //     });
    // });
</script>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mt-5 mb-5">
        <div class="justify-content-md-start">
            <button type="button" class="btn btn-light start-0">수정</button>
            <button type="button" class="btn btn-light start-0">삭제</button>
        </div>
        <div class="justify-content-md-end">
            <button type="button" class="btn btn-light end-0">이전글</button>
            <button type="button" class="btn btn-light end-0">다음글</button>
            <button type="button" class="btn btn-success end-0">목록</button>
        </div>
    </div>
    <div class="mx-5">
        <div class="d-flex justify-content-between align-items-center ">
            <div>
                <a href="${path}/review/list?area=지역"><p class="mb-0 mt-4 text-success"><small>지역</small></p></a>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <div class="col-md-4 d-flex align-items-center">
                <p class="mb-0 h3">청주에서 서울까지</p>
            </div>
        </div>
        <div>
            <p class="mb-0 h6"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">이학동</p>
            <div>
                <small class="opacity-50 mb-0 text-nowrap">2023.06.02 20:23</small>
                <small class="opacity-50 mb-0 ms-2 text-nowrap">조회 80</small>
            </div>
        </div>
        <hr>
        <div>
            <p class="mb-1">확장이전하고나서 두번째 방문인데 전에도 맛본 통갈치구이코스는
                손자 채운이도 이제는 먹성이 좋아져 맛있게 잘먹어주고..!!
                변함이없는 다양한 메뉴구성과 실장님의 정성스런 서비스와 친절에
                행복한 가족외식시간을 보냈습니다..!!
                이제 여름철을 맞이해 시원한 물회가 생각나시거나 통갈치구이맛을 보고
                싶으시면 수원 인계동 달인의횟집 바다예찬을 방문하셔서
                바다내음 물씬풍기는 스폐셜코스를 맛보시기 바랍니다..!!
                [출처] [수원 인계동 달인의횟집]바다예찬|작성자 임꺽정확장이전하고나서 두번째 방문인데 전에도 맛본 통갈치구이코스는
                손자 채운이도 이제는 먹성이 좋아져 맛있게 잘먹어주고..!!
                변함이없는 다양한 메뉴구성과 실장님의 정성스런 서비스와 친절에
                행복한 가족외식시간을 보냈습니다..!!
                이제 여름철을 맞이해 시원한 물회가 생각나시거나 통갈치구이맛을 보고
                싶으시면 수원 인계동 달인의횟집 바다예찬을 방문하셔서
                바다내음 물씬풍기는 스폐셜코스를 맛보시기 바랍니다..!!
                [출처] [수원 인계동 달인의횟집]바다예찬|작성자 임꺽정</p>
        </div>
        <hr>
        <div class="text-center border-bottom mt-3">
            <h6>별점을 등록하세요</h6>
            <div class="d-flex justify-content-center align-items-center">
                <fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9"
                                                                                    title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7"
                                                                                    title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5"
                                                                                    title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3"
                                                                                    title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1"
                                                                                    title="0.5점"></label>
                </fieldset>
                <button class="btn btn-outline-success">등록</button>
                <h3 class="mt-2 ps-2 pe-2 text-muted">/</h3>
                <i class="bi bi-star-fill me-1"></i>
                <h3 class="mt-2"> 8.1</h3>
            </div>
        </div>
        <div>
            <div>
                <h6 class="mb-2 mt-2">작성자
                    <button type="button" class="btn btn-sm" id="btn1" disabled>작성자</button>
                </h6>
                <p class="mb-2 opacity-70">[출처] [수원 인계동 달인의횟집]바다예찬|작성자 임꺽정확장이전하고나서 두번째 방문인데 전에도 맛본 통갈치구이코스는
                    손자 채운이도 이제는 먹성이 좋아져 맛있게 잘먹어주고..!!
                    변함이없는 다양한 메뉴구성과 실장님의 정성스런 서비스와 친절에
                    행복한 가족외식시간을 보냈습니다..!!
                    이제 여름철을 맞이해 시원한 물회가 생각나시거나 통갈치구이맛을 보고
                    싶으시면 수원 인계동 달인의횟집 바다예찬을 방문하셔서
                    바다내음 물씬풍기는 스폐셜코스를 맛보시기 바랍니다..!!
                    [출처] [수원 인계동 달인의횟집]바다예찬|작성자 임꺽정 </p>
                <small class="text-muted text-nowrap">작성일자(수정됨)<a class="ms-2 text-muted" href="javascript:void(0);" onclick="addComment()">답글달기</a></small>
            </div>
            <hr>

                <div class="commentbox1">
                    <div class="d-flex row">
                        <div class="col-sm-11">
                        <textarea onkeydown="resize(this)" onkeyup="resize(this)" placeholder="댓글을 남겨보세요" rows="1"></textarea>
                        </div>
                        <div class="col-sm-1 align-self-end">
                        <button class="btn btn-outline-success">등록</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="d-flex justify-content-between align-items-center mt-5 mb-4">
        <div class="justify-content-md-start">
            <button type="button" class="btn btn-light start-0">수정</button>
            <button type="button" class="btn btn-light start-0">삭제</button>
        </div>
        <div class="justify-content-md-end">
            <button type="button" class="btn btn-light end-0"><i class="bi bi-caret-up-fill"></i>TOP</button>
            <button type="button" class="btn btn-success end-0">목록</button>
        </div>
    </div>
</div>
<%@ include file="../footer.jspf" %>
</body>
</html>
