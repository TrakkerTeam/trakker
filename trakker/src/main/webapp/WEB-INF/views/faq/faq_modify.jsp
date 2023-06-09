<!--faq를 수정하는 페이지입니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@include file="../itemfile.jspf"%>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnModify").click(function () {
                document.form3.submit();
            });
            $("#btnDelete").click(function () {
                if(confirm("삭제하시겠습니까?")){
                    document.form3.action="${path}/faq/delete.do";
                    document.form3.submit();
                }
            });
            $(".List").click(function() {
                location.href="${path}/admin/adminPage.do";
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
    <form id="form3" name="form3" method="post" action="${path}/faq/update.do">
        <input type="hidden" name="faq_num" value="${faq.faq_num}">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-5 justify-content-md-end text-end">
            <div>
                <button type="button" class="btn btn-light end-0">이전글</button>
                <button type="button" class="btn btn-light end-0">다음글</button>
                <button type="button" class="btn List btn-success end-0">목록</button>
            </div>
        </div>
        <hr>
        <input class="form-control" type="text" id="faq_subject" name="faq_subject" value="${faq.faq_subject}" aria-label="default input example">
        <hr>
        <textarea class="summernote" id="content" name="content">${faq.content}</textarea>

        <script>
            $('.summernote').summernote({

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
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                stickyToolbar: {
                    enabled: true, // enable/disable sticky toolbar
                    offset: 0, //y offset from top
                    zIndex: 9999 //z-index of the toolbar
                }
            });
        </script>
        <hr>
        <div name="filename" value="이미지 이름">logo.png</div> <br><br>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <div class="btn-group m-3" role="group" aria-label="First group">
                <button type="button" id="btnModify" class="btn btn-success btn-lg">수정</button>
                <button type="button" id="btnDelete" class="btn btn-danger btn-lg">삭제</button>
            </div>
        </div>

        <br>
        <%@include file="../footer.jspf"%>
    </form>
</div>
</body>
</html>
