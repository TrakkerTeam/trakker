<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <%@ include file="../header.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
    $(function() {
        $("#btnWrite").click(function(){
            location.href="${path}/trip/write.do";
        });
    });
</script>
<body>
<div class="album py-5 bg-light">
    <div class="container">
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
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="div1">
            <div class="col">
                <div class="card shadow-sm">
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
                    <img src="${pageContext.request.contextPath}/resources/images/trakker1.png" class="card-img-top" style="width: 100%; height: 225px;">
                    <div class="card-body">
                        <small class="text-muted">관광지</small>
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
        </div>
        <button class="btn btn-outline-success" type="submit" id="btnWrite" style="float:right;">글쓰기</button>
    </div>
</div>
</body>
<%@ include file="../footer.jsp" %>
</body>
</html>
