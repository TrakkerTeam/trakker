<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jspf"%>
<style>

 #edit_profile {
            width: 25%;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
         .btn-group-* button {
           border-radius: 0;
         }
         .btn{
         background-color: #4CAF50;
         color: #fff;
         cursor: pointer;
         }
</style>

</head>
<body>
<div class="container "style="margin-top:80px;">
<div style="text-align:center; ">
<div>
    <h2>${sessionScope.mem_name}</h2>
</div>
    <div style="text-align: center;">
                        <label for="file-input">
                          <img id="previewImage" style="width: 200px; height: 200px; cursor: pointer;" src="${picture_url}" class="img-thumbnail rounded-circle">
                        </label>
    </div>
    <div>
    <button type="button" id="edit_profile" onclick="window.location.href='${path}/member/editprofile.do'" style="margin-top:20px;">프로필수정</button>
    </div>
    <div class="btn-group-*" role="group" style="margin:40px;">
      <button type="button" class="btn "style="width:100px;height:100px"onclick="mypageHeart()">좋아요한 플래너</button>
      <button type="button" class="btn "style="width:100px;height:100px"onclick="mypagePlanner()">내가 만든 플래너</button>
      <button type="button" class="btn "style="width:100px;height:100px"onclick="r_list()">내가 쓴 리뷰</button>
    </div>

</div>
</div>
<script>
 function mypageHeart() {
     location.href ="${path}/member/mypageHeart"
}
function mypagePlanner() {
     location.href ="${path}/member/mypagePlanner"
}
function r_list() {
     location.href ="${path}/member/r_list?num=1"
}
</script>
<%@ include file="../footer.jspf" %>

</body>
</html>

