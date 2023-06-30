<!--faq를 수정하는 페이지입니다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@ include file="../header.jspf" %>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".List").click(function() {
                location.href="${path}/faq/faq_list_user?num=1";
            });
        });
    </script>
    <style>
        .form-control, input {
            border: none;
        }
    </style>

</head>
<body>
<div class="container">
        <input type="hidden" name="faq_num" value="${faq.faq_num}">
        <div class="d-flex justify-content-between align-items-center mt-5 mb-5 justify-content-md-end text-end">
            <div>
                <button type="button" class="btn List btn-success end-0">목록</button>
            </div>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <div class="col-md-12 d-flex align-items-center">
              <p class="mb-0 h3">${faq.faq_subject}</p>
            </div>
        </div>

    <div class="d-flex flex-column align-items-end">
        <p class="opacity-50 mb-0 text-nowrap">
            작성일자: <fmt:formatDate value="${faq.faq_reg_date}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
            조회수: ${faq.readcount}
        </p>
    </div>
    <hr>
    <div>
        <p class="mb-1">${faq.content}</p>
    </div>
        <%@include file="../footer.jspf" %>
</div>
</body>
</html>
