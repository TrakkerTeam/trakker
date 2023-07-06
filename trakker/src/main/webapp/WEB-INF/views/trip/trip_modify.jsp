<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@include file="../itemfile.jspf" %>
    <script src="${path}/include/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
    <script type="text/javascript">


        $(function () {
            $(".List").click(function () {
                location.href = "${path}/trip/trip_list_admin?num=1";
            });
            $(".prev").click(function() {
                var prev = "${trip.prev}";

                if (prev == -1) {
                    alert("이전글이 존재하지 않습니다.");
                } else {
                    location.href = "${path}/trip/view.do?t_num=" + prev;
                }
            });

            $(".next").click(function() {
                var next = "${trip.next}";

                if (next == -1) {
                    alert("다음글이 존재하지 않습니다.");
                } else {
                    location.href = "${path}/trip/view.do?t_num=" + next;
                }
            });
            $("#btnModify").click(function () {
                document.form3.action = "${path}/trip/update.do";
                document.form3.submit();
            });
            $("#btnDelete").click(function () {
                if (confirm("삭제하시겠습니까?")) {
                    document.form3.action = "${path}/trip/delete.do";
                    document.form3.submit();
                }
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
        <input type="hidden" name="t_num" value="${trip.t_num}">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-5 justify-content-md-end text-end">
            <div>
                <button type="button" class="btn btn-light end-0 prev">이전글</button>
                <button type="button" class="btn btn-light end-0 next">다음글</button>
                <button type="button" class="btn List btn-success end-0">목록</button>
            </div>
        </div>
        <hr>
        <input class="form-control" type="text" id="t_subject" name="t_subject" value="${trip.t_subject}"
               aria-label="default input example">
        <hr>
        <textarea class="summernote" id="content" name="content">${trip.content}</textarea>
        <script>
            $('.summernote').summernote({

                height: 200,
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
                    enabled: true,
                    offset: 0,
                    zIndex: 9999
                }
            });
        </script>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <div class="btn-group m-3" role="group" aria-label="First group">
                <button type="button" id="btnDelete" class="btn btn-danger btn-lg">삭제</button>
                <button type="button" id="btnModify" class="btn btn-success btn-lg">수정</button>
            </div>
        </div>
        <br>
        <%@include file="../footer.jspf" %>
    </form>
</div>
</body>
</html>
