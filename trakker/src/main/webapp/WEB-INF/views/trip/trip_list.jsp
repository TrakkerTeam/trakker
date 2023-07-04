<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="imgpath" value="/upload/displayFile?fileName="/>
<html>
<head>
    <meta charset="UTF-8">

    <title>Home</title>
    <%@ include file="../header.jspf" %>
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

        .bi-star-fill {
            color: #ffca2c;
        }

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

        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .card .card-img-overlay {
            overflow: hidden;
            display: none;
        }

        .card {
            transition: all 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card:hover .card-img-overlay {
            display: block;
        }

        .card-text {
            display: -webkit-box;
            max-width: 400px;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

    </style>

</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">


    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
        document.body.style.overflow = "hidden";
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
        document.body.style.overflow = "auto";
    }

    $(function () {
        $("#top").click(function () {
            window.scrollTo(0, 0);
        });
    });
    $(window).on('load', function() {
        const urlParams = new URL(location.href).searchParams;
        const sort = urlParams.get('sort');
        console.log(sort);
        if (sort) $('#d-search').addClass('show')
        else $('#d-search').removeClass('show')
    });
    function checkOptions(option) {
        const urlParams = new URL(location.href).searchParams;
        if(option=="reset") {
            location.href ='/trakker/trip/trip_list?num=1';
        }else if(option=="ratingAvg" || option=="add") {
            urlParams.set("sort", option);
            location.href ='/trakker/trip/trip_list?'+urlParams;
        }
    }
</script>
<body>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="col-sm-3">
            <h3>관광지</h3>
            <form class="d-flex" role="search">
                <input type="hidden" name="num" value="${page.pageNum}">
                <select class="border-success rounded-3" name="searchType">
                    <option value="t_subject" <c:if test="${search == 't_subject'}">selected</c:if>>관광명소</option>
                    <option value="content" <c:if test="${search == 'content'}">selected</c:if>>내용</option>
                    <option value="all" <c:if test="${search == 'all'}">selected</c:if>>관광명소+내용</option>
                </select>
                <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search"
                       aria-label="Search" value="${keyword}">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        &nbsp;
        <div class="pe-5 text-end">
            <a class="text-muted text-decoration-none" data-bs-toggle="collapse" data-bs-target="#d-search">
                <small class="bi bi-caret-down-fill">옵션</small>
            </a>

            <div class="collapse" id="d-search">
                <small><a href="javascript:void(0);" onclick="checkOptions('reset')" class="text-muted">초기화</a></small>
                <div class="mt-2">
                    <small>
                        <a href="javascript:void(0);" onclick="checkOptions('ratingAvg')" class="text-muted">인기순</a>
                        <a href="javascript:void(0);" onclick="checkOptions('add')" class="text-muted"><strong><i>최신순</i></strong></a>
                    </small>
                </div>
            </div>
        </div>
        <c:choose>
        <c:when test="${triplist eq []}">
            <div class="center mt-5 mb-5 pb-5">
                <h1><i class="bi bi-search"></i></h1>
                <h3 class="pb-3">검색조건과 일치하는 관광지가 없습니다.</h3>
            </div>
            <c:set var="removePaginationIcons" value="true"/>
        </c:when>
        <c:otherwise>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach var="trip" items="${triplist}">
                <div id="triprate">
                    <div class="col p-4">
                        <div class="card rounded-3 shadow-sm">
                            <input type="hidden" name="num" id="num" value="${trip.t_num}">
                            <a onclick="openModal('myModal${trip.t_num}')"
                               style="text-decoration-line:none;">
                                <img src="${path}/${imgpath}${trip.attach.fullName}" class="card-img-top"
                                     style="width: 100%; height: 225px;">
                                <div class="card-body rounded-3 p-0 w-100">
                                    <h6 class="text-muted ms-3 mt-3">${trip.t_subject}
                                        <p class="mt-2" style="float: right; margin-right: 10px;">
                                            <i class="bi bi-star-fill me-1 pb-1"></i>
                                            <fmt:formatNumber value="${trip.rating.ratingAvg}" pattern="0.0"/>
                                        </p>
                                    </h6>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div id="myModal${trip.t_num}" class="modal">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">${trip.t_subject}</h4>
                                <div class="ml-auto">
                                    <button type="button" class="btn-close" aria-label="Close"
                                            onclick="closeModal('myModal${trip.t_num}')"
                                            data-dismiss="modal"></button>
                                </div>
                            </div>
                            <div class="modal-body" style="display: flex;">
                                <div style="flex: 1;">
                                    <img src="${path}/${imgpath}${trip.attach.fullName}" class="card-img-top"
                                         style="width: 100%; height: 200px;">
                                </div>
                                <div style="flex: 1; padding-left: 10px;">
                                    <p style="float:right;">${trip.content}</p>
                                </div>
                            </div>
                            <div class="modal-footer d-flex">
                                <div style="flex:1;">
                                    <div class="d-flex justify-content-start align-items-center float-left">
                                        <div class="text-center border-bottom mt-3">
                                            <h6>별점을 등록하세요</h6>
                                            <div class="d-flex justify-content-center align-items-center">
                                                <fieldset class="rate">
                                                    <input type="radio" id="rating${trip.t_num}_10" name="rating"
                                                           value="10.0" class="rating">
                                                    <label for="rating${trip.t_num}_10" title="5점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_9" name="rating"
                                                           value="9.0" class="rating">
                                                    <label class="half" for="rating${trip.t_num}_9"
                                                           title="4.5점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_8" name="rating"
                                                           value="8.0" class="rating">
                                                    <label for="rating${trip.t_num}_8" title="4점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_7" name="rating"
                                                           value="7.0" class="rating">
                                                    <label class="half" for="rating${trip.t_num}_7"
                                                           title="3.5점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_6" name="rating"
                                                           value="6.0" class="rating">
                                                    <label for="rating${trip.t_num}_6" title="3점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_5" name="rating"
                                                           value="5.0" class="rating">
                                                    <label class="half" for="rating${trip.t_num}_5"
                                                           title="2.5점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_4" name="rating"
                                                           value="4.0" class="rating">
                                                    <label for="rating${trip.t_num}_4" title="2점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_3" name="rating"
                                                           value="3.0" class="rating">
                                                    <label class="half" for="rating${trip.t_num}_3"
                                                           title="1.5점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_2" name="rating"
                                                           value="2.0" class="rating">
                                                    <label for="rating${trip.t_num}_2" title="1점"></label>

                                                    <input type="radio" id="rating${trip.t_num}_1" name="rating"
                                                           value="1.0" class="rating">
                                                    <label class="half" for="rating${trip.t_num}_1"
                                                           title="0.5점"></label>
                                                </fieldset>

                                                    <%--                <c:if test="${mem_num != null}">--%>
                                                <button class="btn rating btn-outline-success" type="button"
                                                        name="rating_btn">등록
                                                </button>
                                                    <%--                </c:if>--%>
                                                <h3 class="mt-2 ps-2 pe-2 text-muted">/</h3>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <small class="text-muted"
                                           style="margin-right: 15px;">작성일:<fmt:formatDate
                                            value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${not removePaginationIcons}">
            <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5">
            <span>
                <c:if test="${page.pageNum  > 2}">
                    <c:set var="firstPageNum" value="1"/>
                    <a class="ms-3 text-muted" href="${path}/trip/trip_list?num=${firstPageNum}">
                <i class="bi bi-chevron-double-left"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/trip/trip_list?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>
                <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted "
                                                      href="${path}/trip/trip_list?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
                </c:forEach>

                <span>
                 <c:if test="${page.pageNum != page.lastPageNum}">
                    <a class="ms-3 text-muted" href="${path}/trip/trip_list?num=${page.pageNum + 1}">
                        <i class="bi bi-chevron-right"></i>
                    </a>
                 </c:if>
                    <c:if test="${page.pageNum != page.lastPageNum}">
                        <a class="ms-3 text-muted" href="${path}/trip/trip_list?num=${page.lastPageNum}">
                            <i class="bi bi-chevron-double-right ms-lg-3"></i>
                        </a>
                    </c:if>
            </span>
            </div>
        </c:if>
        <div class="justify-content-md-end d-flex justify-content-end">
            <button type="button" class="btn btn-light btn-end-0" id="top">
                <i class="bi bi-caret-up-fill"></i>TOP
            </button>
        </div>
        <%@ include file="../footer.jspf" %>
    </div>
</div>
<script>
    $('[name="rating_btn"]').on("click", function () {
        var t_num = $(this).closest('#triprate').find('[name="num"]').val();
        var rating = $(this).closest('#triprate').find(".rating:checked").val();

        console.log("rate = " + rating);
        console.log("t_num = " + t_num);

        const data = {
            t_num: t_num,
            rating: rating
        };

        $.ajax({
            data: data,
            type: 'POST',
            url: "${path}/trip/ratinginsert",
            success: function (result) {
                if (confirm("별점 등록 완료")) {
                    $("#result").html(result);
                }
            }
        });
    });
</script>
</body>
</html>