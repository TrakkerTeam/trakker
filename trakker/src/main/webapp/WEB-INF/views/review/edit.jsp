<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@ include file="../header.jspf" %>
    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <style>
        body {
            padding-top: 100px;
        }
        textarea {
            display: flex;
            width: 100%;
            border: none;
            resize: none;
        }
        .form-control, input {
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <select class="form-select" aria-label="Default select example">
        <option selected>지역</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
    </select>
    <hr>
    <input class="form-control" type="text" placeholder="제목을 입력하세요" aria-label="default input example">
    <hr>
    <textarea class="summernote"></textarea>
    <script>
        $('.summernote').summernote({
            placeholder: '여행리뷰를 입력해주세요.',
            height: 750,
            lang: "ko-KR",
            minHeight: null,
            maxHeight: null,
            focus: true,
            fontNames: ['Nanum Gothic','sans-serif','돋움','Dotum','Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica', 'Impact', 'Tahoma', 'Times New Roman', 'Verdana', 'Roboto'],
            defaultFontName: 'Nanum Gothic',
            fontSizes: ['8', '9', '10', '11', '12', '14', '18'],
        });
    </script>
    <hr>
    <input name="filename" value="이미지 이름"> <br><br>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <div class="btn-group" role="group" aria-label="First group">
            <button type="button" class="btn btn-danger btn-lg">삭제</button>
        </div>
        <div class="btn-group" role="group" aria-label="First group">
            <button type="button" class="btn btn-success btn-lg">수정</button>
        </div>
    </div>
    <br>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
