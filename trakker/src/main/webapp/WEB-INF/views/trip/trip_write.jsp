<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script type="text/javascript">
        $(function () {
            $("#btnSave").click(function () {
                if ($("#t_subject").val() == "") {
                    alert("관광명소를 입력하세요");
                    $("#t_subject").focus();
                    return;
                }
                if ($("#content").val() == "") {
                    alert("설명을 입력하세요");
                    $("#content").focus();
                    return;
                }
                document.form3.submit();
            });
        });
    </script>
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
        .btn-group {
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <form id="form3" name="form3" method="post" action="${path}/trip/insert.do">
    <input class="form-control" name="t_subject" id="t_subject" type="text" placeholder="관광지 이름을 입력하세요" aria-label="default input example">
    <hr>
    <textarea class="summernote" name="content" id="content"></textarea>
    <script>
        $('.summernote').summernote({
            placeholder: '설명을 입력해주세요.',
            height: 750,
            lang: "ko-KR",
            minHeight: null,
            maxHeight: null,
            focus: true,
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert',['picture','link','video']],
                ['view', ['fullscreen', 'help']]
            ],
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
            <button type="button" id="btnSave" class="btn btn-success btn-lg">등록</button>
        </div>
    </div>
    <br>
    </form>
</div>
</body>
</html>
