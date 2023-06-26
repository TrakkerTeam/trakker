<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>detail</title>
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
    #commentContent {
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
        obj.style.height = (22 + obj.scrollHeight) + 'px';
    }

    $(function() {
        commentList();

        //댓글 쓰기
        $("#btnComment").click(function(){
            var commentContent = $(".commentContent").val();
            var review_num = $(".review_num").val();
            var mem_num = $(".mem_num").val();
            var param =  { "commentContent" : commentContent, "review_num" : review_num, "mem_num" : mem_num};
            $.ajax({
                url: "${path}/comment/insert",
                data: param,
                type: "post",
                success: function(data){
                    var result = data;
                    return result;
                    console.log("data:", data);
                    commentList(); //댓글 목록 출력
                }
            });
        });

        $(".List").click(function() {
            location.href="${path}/review/list?num=1";
        });

        $(".Edit").click(function() {
            location.href="${path}/review/edit?review_num=${review.review_num}";
        });

        $(".Delete").click(function() {
            if(confirm("삭제하시겠습니까?")){
                document.form1.action="${path}/review/delete";
                document.form1.submit();
            }
        });

    });

    function commentList(){
        $.ajax({
            type: "get",
            url: "${path}/comment/list?review_num=${review.review_num}",
            success: function(result){
                $("#commentList").html(result);
            }
        });
    }


</script>
<body>
<div class="container">
    <div class="d-flex justify-content-between align-items-center mt-5 mb-5">
        <div class="justify-content-md-start">
<%--            <c:if test="${mem_num == review.member.mem_num}">--%>
            <button type="button" class="btn Edit btn-light start-0">수정</button>
            <button type="button" class="btn Delete btn-light start-0">삭제</button>
<%--            </c:if>--%>
        </div>
        <div class="justify-content-md-end">
            <button type="button" class="btn btn-light end-0">이전글</button>
            <button type="button" class="btn btn-light end-0">다음글</button>
            <button type="button" class="btn List btn-success end-0">목록</button>
        </div>
    </div>
    <div class="mx-5">
        <div class="d-flex justify-content-between align-items-center ">
            <div>
                <a href="${path}/review/list?area=지역"><p class="mb-0 mt-4 text-success"><small>${review.local.k_name}</small></p></a>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <div class="col-md-12 d-flex align-items-center">
                <p class="mb-0 h3">${review.title}</p>
            </div>
        </div>
        <div>
            <p class="mb-0 h6"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="mdo" width="32" height="32" class="rounded-circle">${review.member.mem_nickname}</p>
            <div>
                <small class="opacity-50 mb-0 text-nowrap">
                    <c:choose>
                        <c:when test="${review.edit_date == null}">
                            <fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate value="${review.edit_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </c:otherwise>
                    </c:choose>
                </small>
                <%----%>
                <small class="opacity-50 mb-0 ms-2 text-nowrap">${review.readcount}</small>
            </div>
        </div>
        <hr>
        <div>
            <p class="mb-1">${review.content}</p>
        </div>
        <hr>
        <div class="text-center border-bottom mt-3">
            <h6>별점을 등록하세요</h6>
            <div class="d-flex justify-content-center align-items-center">

                <fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10.0" class="rating"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9.0"  class="rating"><label class="half" for="rating9" title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8.0"  class="rating"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7.0"  class="rating"><label class="half" for="rating7" title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6.0"  class="rating"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5.0"  class="rating"><label class="half" for="rating5" title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4.0"  class="rating"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3.0"  class="rating"><label class="half" for="rating3" title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2.0"  class="rating"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1.0"  class="rating"><label class="half" for="rating1" title="0.5점"></label>
                </fieldset>
<%--                <c:if test="${mem_num != null}">--%>
                <button class="btn rating btn-outline-success" type="button" id="rating_btn">등록</button>
<%--                </c:if>--%>
                <h3 class="mt-2 ps-2 pe-2 text-muted">/</h3>
                <i class="bi bi-star-fill me-1"></i>
                <div id="result"><%--total--%>
                <h3 class="mt-2">
                    <fmt:formatNumber value="${ratingAvg}" pattern="0.0"/>
                  </h3> <%-- total--%>
                </div>
            </div>
        </div>
        <div>
            <div>
                <div id="commentList"></div>
            </div>
            <hr>
                <div class="commentbox1">
                    <div class="d-flex row">
                        <input type="hidden" name="review_num" value="${review.review_num}">
                        <input type="hidden" name=mem_num value="${review.mem_num}">
                        <input type="hidden" name="l_num" value="${review.l_num}">
                        <div class="col-sm-11">
                            <textarea id="commentContent" name="commentContent" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="댓글을 남겨보세요" rows="2"></textarea>
                        </div>
                        <div class="col-sm-1 align-self-end">
                            <button class="btn btn-outline-success" type="button" id="btnComment">등록</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="d-flex justify-content-between align-items-center mt-5 mb-4">
        <div class="justify-content-md-start">
<%--            <c:if test="${mem_num == mem_num}">--%>
            <button type="button" class="btn Edit btn-light start-0">수정</button>
            <button type="button" class="btn Delete btn-light start-0">삭제</button>
<%--            </c:if>--%>
        </div>
        <div class="justify-content-md-end">
            <button type="button" class="btn btn-light end-0"><i class="bi bi-caret-up-fill"></i>TOP</button>
            <button type="button" class="btn List btn-success end-0">목록</button>
        </div>
    </div>
    <%@ include file="../footer.jspf" %>
</div>
<form name="form1" method="post">
    <input type="hidden" name="l_num" value="${review.l_num}">
    <input type="hidden" name="review_num" value="${review.review_num}">
</form>
<script>
    $("#rating_btn").on("click", function () {
        const review_num = ${review.review_num};
        const rating = $(".rating:checked").val();

        console.log("rate = " + rating);
        console.log("review_num = " + review_num);

        const data = {
            review_num: review_num,
            rating: rating
        };

        $.ajax({
            data: data,
            type: 'POST',
            url: "${path}/review/ratinginsert",
            success: function(result){
                if(confirm("별점 등록 완료")){

                    $("#result").html(result);
                }
            }
        });
    });
</script>
</body>
</html>
