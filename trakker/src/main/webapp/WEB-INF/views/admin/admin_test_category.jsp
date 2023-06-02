<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/trip_style.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        $(function () {
            $("#btnModify").click(function () {
                location.href = "${path}/faq/view.do";
            });
        });

        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }

        function redirectToPage() {
            location.href = "${path}/faq/faq_list.jsp";
        }

        function memberList() {
            $.ajax({
                type: "post",
                url: "${path}/admin/memberList",
                success: function (result) {
                    $("#result").html(result);
                }
            });
        }

        function tripList() {
            $.ajax({
                type: "get",
                url: "${path}/trip/list.do",
                success: function (result) {
                    $("#result").html(result);
                }
            });
        }

        function faqList() {
            $.ajax({
                type: "get",
                url: "${path}/faq/list.do",
                success: function (result) {
                    $("#result").html(result);
                }
            });
        }

        function adminList() {
            $.ajax({
                type: "get",
                url: "${path}/admin/list.do",
                success: function (result) {
                    $("#result").html(result);
                }
            });
        }

        function reviewList() {
            $.ajax({
                type: "get",
                url: "${path}/review/list.do",
                success: function (result) {
                    $("#result").html(result);
                }
            });
        }
    </script>
    <style>
        #container {
            display: flex;
            height: 100%;
            width: 100%;
            flex-direction: column;
        }

        #category {
            display: flex;
            flex-direction: column;
            height: 100%;
            width: 15%;
            gap: 10px;
            align-items: center;
            justify-content: space-around;
            border-right: 1px solid #000000;
        }

        div a.menubar {
            text-decoration: none;
            display: flex;
            color: #000;
            padding: 8px 15px 8px 15px;
            font-weight: bold;
        }

        div a.menu {
            background-color: blanchedalmond;
            color: #fff;
        }

        .menu > a:hover {
            background-color: #333;
            color: #fff;
        }

        .bi-plus-lg {
            font-size: 22px;
        }

        p.content2 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* Set the number of lines to display */
            -webkit-box-orient: vertical;
        }
    </style>
<body>
<%@ include file="../header.jsp" %>

<div id="container">
    <div style="display: flex; height: 700px;">
        <div id="category" class="menu" style="width:10%;">
<%--            <a class="menubar" href="#" onclick="adminList()">관리자 정보</a>--%>
            <a class="menubar" href="#" onclick="memberList()">회원관리</a>
            <a class="menubar" href="#" onclick="tripList()">관광명소 관리</a>
            <a class="menubar" href="#" onclick="reviewList()">리뷰리스트 관리</a>
            <a class="menubar" href="#" onclick="faqList()">FAQ</a>
        </div>
        <div class="container" style="padding-left: 50px; padding-right: 50px;">
            <div id="result" style="display: flex; width:100%; flex-direction: column;">
                <div class="content">
                    <div class="header" style="display:flex; height:auto;">
                        <div class="container" style="flex-basis: 50%;">
                            <h3>회원관리</h3>
                            <div>
                                <button class="btn" type="button" onclick="memberList()" style="float:right;">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>이메일</th>
                                    <th>이름</th>
                                    <th>주소</th>
                                    <th>가입일자</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>dkjfwk@naver.com</td>
                                    <td><a href="#" onclick="memberList()">홍길동</a></td>
                                    <td>서울시 강남구</td>
                                    <td>2023년 5월 31일</td>
                                </tr>
                                <tr>
                                    <td>ddwwwd@naver.com</td>
                                    <td><a href="#" onclick="memberList()">이순신</a></td>
                                    <td>서울시 용산구</td>
                                    <td>2023년 5월 3일</td>
                                </tr>
                                <tr>
                                    <td>daaaewe@naver.com</td>
                                    <td><a href="#" onclick="memberList()">김김김</a></td>
                                    <td>서울시 종로구</td>
                                    <td>2023년 5월 1일</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="container" style="flex-basis: 50%;">
                            <h3>리뷰페이지</h3>
                            <div>
                                <button class="btn" type="button" onclick="memberList()" style="float:right;">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>이메일</th>
                                    <th>이름</th>
                                    <th>주소</th>
                                    <th>가입일자</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>dkjfwk@naver.com</td>
                                    <td><a href="#" onclick="memberList()">홍길동</a></td>
                                    <td>서울시 강남구</td>
                                    <td>2023년 5월 31일</td>
                                </tr>
                                <tr>
                                    <td>ddwwwd@naver.com</td>
                                    <td><a href="#" onclick="memberList()">이순신</a></td>
                                    <td>서울시 용산구</td>
                                    <td>2023년 5월 3일</td>
                                </tr>
                                <tr>
                                    <td>daaaewe@naver.com</td>
                                    <td><a href="#" onclick="memberList()">김김김</a></td>
                                    <td>서울시 종로구</td>
                                    <td>2023년 5월 1일</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="footer" style="display:flex; height:auto;">
                        <div class="container" style="flex-basis: 50%;">
                            <div class="container">
                                <div class="col-sm-3">
                                    <h3>FAQ</h3>
                                    <form class="d-flex" role="search">
                                        <select>
                                            <option>제목</option>
                                            <option>내용</option>
                                            <option>제목+내용</option>
                                        </select>
                                        <input class="form-control ms-2 me-2" type="search" placeholder="Search"
                                               aria-label="Search">
                                        <button class="btn btn-outline-success" type="submit">Search</button>
                                    </form>
                                    <div style="display: flex; flex-direction: column; width: 403%;">
                                        <div style="margin-left: auto;">
                                            <button class="btn" type="button" onclick="faqList()" style="float: right;">
                                                <i class="bi bi-plus-lg"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th style="width: 10%">번호</th>
                                        <th style="width: 60%">제목</th>
                                        <th style="width: 20%">작성일자</th>
                                        <th style="width: 10%">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="recentList" value="${list.subList(0, 5)}"/>
                                    <c:forEach var="row" items="${recentList}">
                                        <tr>
                                            <td>${row.faq_num}</td>
                                            <td>
                                                <a href="${path}/faq/view.do?faq_num=${row.faq_num}">${row.faq_subject}</a>
                                            </td>
                                            <td><fmt:formatDate value="${row.faq_reg_date}" pattern="yyyy-MM-dd"/></td>
                                            <td>${row.readcount}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container" style="flex-basis: 50%;">
                            <div class="content" style="display:flex; height:450px; flex-direction: column;">
                                <div class="container">
                '                    <div class="col-sm-3">
                                        <h3>관광지</h3>
                                        <form class="d-flex" role="search">
                                            <select>
                                                <option>관광명소</option>
                                                <option>내용</option>
                                                <option>관광명소+내용</option>
                                            </select>
                                            <input class="form-control ms-2 me-2" type="search" placeholder="Search"
                                                   aria-label="Search">
                                            <button class="btn btn-outline-success" type="submit">Search</button>
                                        </form>
                                        <div style="display: flex; flex-direction: column; width: 399%;">
                                            <div style="margin-left: auto;">
                                                <button class="btn" type="button" onclick="tripList()"
                                                        style="float: right;">
                                                    <i class="bi bi-plus-lg"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th style="width: 8%">번호</th>
                                            <th style="width: 18%">관광명소</th>
                                            <th style="width: 62%">내용</th>
                                            <th style="width: 12%">조회수</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="#" onclick="openModal('myModal3')">북촌 한옥마을</a></td>
                                            <td><p class="content2">북촌 한옥마을은 서울에 위치한
                                                한옥마을으로 사진찍기도 좋고 예쁜 카페도 많이 있습니다.
                                            </p>
                                            </td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><a href="#" onclick="openModal('myModal3')">전주 한옥마을</a></td>
                                            <td><p class="content2"> 전주한옥마을은 전라북도 전주시 완산구 풍남동에 있는
                                                한옥마을이다.
                                                원래 자연부락 형태의 마을들이 산자락에 형성되었었으나, 665년 신라 문무왕 때
                                                완산주(完山州)가 설치되면서 주거지가
                                                평지로 이동했다.
                                            </p>
                                            </td>
                                            <td>1</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><a href="#" onclick="openModal('myModal3')">경복궁</a></td>
                                            <td><p class="content2">경복궁은 조선 왕조 제일의 법궁이다. 북으로
                                                북악산을 기대어 자리 잡았고 정문인 광화문
                                                앞으로는 넓은 육조거리가 펼쳐져,
                                                왕도인 한양(서울) 도시 계획의 중심이기도 하다.
                                            </p>
                                            </td>
                                            <td>25</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<%@include file="../footer.jsp" %>--%>
</div>

<script>

</script>
<%@include file="../footer.jsp" %>
</body>
</html>