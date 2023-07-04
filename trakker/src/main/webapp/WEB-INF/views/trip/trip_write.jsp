<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>insert</title>
    <%@ include file="../itemfile.jspf" %>
    <script src="${path}/include/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function() {
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
                var str="";
                $("#uploadedList .file").each(function(i){
                    console.log(i);
                    str += "<input type='hidden' name='files["+i+"]' value='"
                        + $(this).val()+"'>";
                });
                $("#form3").append(str);
                document.form3.submit();
            });
            $(".fileDrop").on("dragenter dragover", function (e) {
                e.preventDefault();
            });

            $(".fileDrop").on("drop", function (e) {
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;
                var file = files[0];
                var formData = new FormData();
                formData.append("file", file);
                console.log(file);
                $.ajax({
                    url: "${path}/upload/uploadAjax",
                    data: formData,
                    dataType: "text",
                    processData: false,
                    contentType: false,
                    type: "post",
                    success: function (data) {
                        var fileInfo = getFileInfo(data);
                        console.log(fileInfo);
                        var html = "<a href='" + fileInfo.getLink + "'>" + fileInfo.fileName + "</a><br>";
                        html += "<input type='hidden' class='file' value='" + fileInfo.fullName + "'>";
                        $("#uploadedList").append(html);
                        var imgTag = "<img src='" + fileInfo.imgsrc + "' alt='" + fileInfo.fileName + "'>";
                        $("#uploadedImages").append(imgTag);
                    }
                });
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

        #result_card img {
            max-width: 20%;
            height: auto;
            display: block;
            padding: 5px;
            margin-top: 10px;
            margin: auto;
        }

        .fileDrop {
            width: 600px;
            height: 100px;
            border: 1px dotted gray;
            background-color: gray;
        }
    </style>
</head>
<body>
<div class="container">
    <form id="form3" name="form3" method="post" action="${path}/trip/insert.do">
        <input class="form-control" name="t_subject" id="t_subject" type="text" placeholder="관광지 이름을 입력하세요"
               aria-label="default input example">
        <hr>
        <textarea class="summernote" name="content" id="content"></textarea>
        <script>
            $('.summernote').summernote({
                placeholder: '설명을 입력해주세요.',
                height: 250,
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
                stickyToolbar: {
                    enabled: true,
                    offset: 0,
                    zIndex: 9999
                }
            });
        </script>
        <hr>
        <div> 첨부파일을 등록하세요
            <div class="fileDrop"></div>
            <div id="uploadedList"></div>
            <div id="uploadedImages"></div>
        </div>
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
