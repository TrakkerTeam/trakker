<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
 <meta charset="UTF-8">
 <title>FAQ_write</title>
 <%@include file="../itemfile.jspf" %>
 <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
 <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
 <script src="https://cdn.jsdelivr.net/npm/summernote-sticky-toolbar@1.0.0/summernote-sticky-toolbar.min.js"></script>
 <script type="text/javascript">

  $(document).ready(function () {
   $("#btnSave").click(function () {
    if ($("#faq_subject").val() == "") {
     alert("제목을 입력하세요");
     $("#faq_subject").focus();
     return;
    }
    if ($("#content").val() == "") {
     alert("내용을 입력하세요");
     $("#content").focus();
     return;
    }
    document.form2.submit();
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
 <form id="form2" name="form2" method="post" action="${path}/faq/insert.do">
  <input class="form-control" name="faq_subject" id="faq_subject" type="text" placeholder="제목을 입력하세요"
         aria-label="default input example">
  <hr>
  <textarea class="summernote" name="content" id="content"></textarea>
  <script>
   $('.summernote').summernote({
    placeholder: '내용을 입력해주세요.',
    height: 300,
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
