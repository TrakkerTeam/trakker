<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%@ include file="../header.jspf" %>
</head>
<style>
    .card .card-img-overlay {
        overflow: hidden;
        display: none;
    }
    .card {
        transition: all 0.3s ease-in-out;
    }
    .card:hover  {
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
<body>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-sm-8"><h2 class="ps-5 mt-5">리뷰게시판</h2></div>
            <div class="col-sm-4">
                <form class="d-flex pe-5 mt-5" role="search">
                    <select>
                        <option>제목</option>
                        <option>내용</option>
                        <option>작성자</option>
                    </select>
                    <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col p-5">
                <div class="card rounded-3 shadow-sm">
                    <a href="${path}/review/detail" style="text-decoration-line:none;">
                        <img src="${path}/resources/images/7_5.jpg" class="card-img-top w-100">
                        <div class="card-body rounded-3 p-0 w-100">
                            <h6 class="text-muted ms-3 mt-3">닉네임</h6>
                            <p class="card-text m-3">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스
                                20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>

                        </div>
                        <div class="card-img-overlay rounded-3 p-0">
                            <div class="card-body align-text-top text-end p-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="text-muted">지역</h6>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <i class="bi bi-star-fill me-1"></i>
                                        <h5 class="mt-2"> 8.1</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</html>
