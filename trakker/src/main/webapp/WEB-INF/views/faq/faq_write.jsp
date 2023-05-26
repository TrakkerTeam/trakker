<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
 <meta charset="UTF-8">
 <title>insert</title>
 <%@ include file="../header.jsp" %>
 <!-- 서머노트를 위해 추가해야할 부분 -->
 <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
 <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
 <script type="text/javascript">
  $(function() {
   $("#btnSave").click(function(){
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

 </style>
</head>
<body>
<div class="container">
 <form id="form2" name="form2" method="post" action="${path}/faq/insert.do">
 <input class="form-control" type="text" placeholder="제목을 입력하세요" aria-label="default input example">
 <hr>
 <textarea class="summernote"></textarea>
 <script>
  $('.summernote').summernote({
   placeholder: '내용을 입력해주세요.',
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
   <button type="button" id="btnSave" class="btn btn-success btn-lg">등록</button>
  </div>
 </div>
 <br>
</div>
</form>
<%@ include file="../footer.jsp" %>
</body>
</html>
