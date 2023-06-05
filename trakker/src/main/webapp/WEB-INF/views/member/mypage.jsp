<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jsp"%>
<style>

#div1{
     padding-top:50px;
     display: flex;
     justify-content: center;
     align-items: center;
}
#sidebar {
    width: 230px;
}

#sidebar ul.nav-pills {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
}

#containerall {
    align-items: center;
}
#li1,#li2,#li3{
    padding-top:20px;
    padding-bottom:20px;
}
#li1.active {
    background-color: #20c997;
}

#li2.active {
    background-color: #20c997;
}

#li3.active {
    background-color: #20c997;
}

.nav-item.active .nav-link {
    color: white !important;
}
 button {
            width: 25%;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
</style>

<script>
function loadPage(pageUrl) {
    $('#contentContainer').load(pageUrl);
}

function setActiveTag(tagId) {
    var tags = document.getElementsByClassName("nav-item");
    for (var i = 0; i < tags.length; i++) {
        tags[i].classList.remove("active");
    }

    var selectedTag = document.getElementById(tagId);
    selectedTag.classList.add("active");
}
</script>

</head>
<body>

<div style="text-align:center;">
<h2>마이페이지</h2>
    <h2> ${sessionScope.mem_name}님</h2>
    <button type="button" id="edit_profile" onclick="window.location.href='${path}/member/editprofile.do'">프로필수정</button>
    </br>
    <a href="${path}/member/memdelete.do">회원탈퇴</a>
</div>

<div class="d-flex" style="display: flex;" id="containerall">
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 230px;" id="sidebar">
        <!-- Sidebar content -->
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item" id="li1" onclick="setActiveTag('li1'); loadPage('${path}/member/mypagecontent.do')">
                <a href="#" class="nav-link link-dark" aria-current="page">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                    좋아요한 플래너
                </a>
            </li>
            <li class="nav-item" id="li2" onclick="setActiveTag('li2'); loadPage('${path}/member/mypagecontent2.do')">
                <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                    좋아요한 게시글
                </a>
            </li>
            <li class="nav-item" id="li3" onclick="setActiveTag('li3'); loadPage('${path}/member/mypagecontent3.do')">
                <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                    내가 단 댓글
                </a>
            </li>
        </ul>
    </div>
    <div id="contentContainer"></div>
</div>

<%@ include file="../footer.jsp" %>

</body>
</html>

