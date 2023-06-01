<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@ include file="../itemfile.jspf" %>
    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
    <style>
        textarea {
            display: flex;
            width: 100%;
            border: none;
            resize: none;
        }

        .form-control, input {
            border: none;
        }

        .btn-group {
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>
<div class="container"><br>
    <select class="form-select w-25" aria-label="Default select example">
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
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                ['color', ['forecolor', 'color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['picture', 'link', 'video']],
                ['view', ['fullscreen', 'help']]

            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
            stickyToolbar: {
                enabled: true, // enable/disable sticky toolbar
                offset: 0, //y offset from top
                zIndex: 9999 //z-index of the toolbar
            }
        });
    </script>
    <hr>
    <input name="filename" value="이미지 이름"> <br><br>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <div class="btn-group m-3" role="group" aria-label="First group">
            <button type="button" class="btn btn-success btn-lg">수정</button>
        </div>
    </div>
    <br>
</div>
</body>
</html>
