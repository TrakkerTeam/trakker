<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>faq_detail</title>
    <%@ include file="../header.jspf" %>
</head>
<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    .commentbox1 {
        margin: 12px 0 29px;
        padding: 16px 10px 10px 18px;
        border: 1px solid #999999;
        border-radius: 6px;
        box-sizing: border-box;
    }
    #textarea1 {
        border: none;
        resize: none;
        outline: none;
        overflow: hidden;
        overflow-wrap: break-word;
        width: 100%;
    }

    #btn1 {
        border-color: #20c997;
        color: #20c997;
        border-radius: 12px;
    }
</style>
<script>

    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (22 + obj.scrollHeight) + 'px';
    }
    $(function() {
        $(".List").click(function() {
            location.href="${path}/admin/adminPage.do";
        });
    });

</script>
<body>
<div class="container">
    <input type="hidden" name="faq_num" value="${faq.faq_num}">
    <div class="d-flex justify-content-between align-items-center mt-5 mb-5 justify-content-md-end text-end">
        <div>
            <button type="button" class="btn btn-light end-0">이전글</button>
            <button type="button" class="btn btn-light end-0">다음글</button>
            <button type="button" class="btn List btn-success end-0">목록</button>
        </div>
    </div>
    <div class="mx-5">
        <div class="d-flex justify-content-between align-items-center">
            <div class="col-md-4 d-flex align-items-center">
                <p class="mb-0 h3">${faq.faq_subject}</p>
            </div>
        </div>
        <hr>
        <div>
            <p class="mb-1">${faq.content}</p>
        </div>
        <hr>

    </div>
    <div class="d-flex justify-content-between align-items-center mt-5 mb-4 justify-content-md-end">
        <div>
            <button type="button" class="btn btn-light end-0"><i class="bi bi-caret-up-fill"></i>TOP</button>
            <button type="button" class="btn List btn-success end-0">목록</button>
        </div>
    </div>
    <%@ include file="../footer.jspf" %>
</div>
</body>
</html>