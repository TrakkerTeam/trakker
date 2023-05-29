<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>플래너</title>
    <%@ include file="../itemfile.jspf" %>
    <%@ include file="../header.jspf" %>
    </head>
    <style>
        body {
            padding-top: 80px;
        }
    </style>
<body>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="col-sm-3">
            <form class="d-flex" role="search">
                <select>
                    <option>제목</option>
                    <option>내용</option>
                    <option>작성자</option>
                </select>
                <input class="form-control ms-2 me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="div1">
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.레트로 감성 핫플레이스 20대 남녀노소 다 좋아할만한 코스들만 모아서 다녀왔습니다.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">리뷰보기</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">글수정</button>
                            </div>
                            <small class="text-muted">평점@@@@@</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <p class="card-text text-truncate">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            </div>
                            <small class="text-muted">9 mins</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../footer.jspf" %>
</body>
</html>

