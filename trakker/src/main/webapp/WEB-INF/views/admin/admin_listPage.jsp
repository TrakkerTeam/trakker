<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/include/js/bootstrap.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">
<script src="${path}/include/jquery-3.6.3.min.js"></script>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }


        table {
            width: 700px;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        div a.menubar {
            text-decoration: none;
            display: flex;
            color: #000;
            padding: 25px 25px 25px 25px;
            font-weight: bold;
        }
        .menu > a:hover {
            background-color: #333;
            color: #fff;
        }
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
            gap: 25px;
            align-items: center;
            border-right: 1px solid #000000;
            padding-top: 50px;
        }
        .searchView{
            width: 100%;
            flex-direction: row-reverse;
        }
    </style>
<body>
<%@ include file="../header.jspf" %>

<div id="container">
    <div style="display: flex; height: auto;">
        <div id="category" class="menu" style="width:10%; height:auto;">
            <a class="menubar" href="${path}/admin/admin_listPage?num=1">회원관리</a>
            <a class="menubar" href="${path}/trip/trip_list_admin?num=1">관광명소 관리</a>
            <a class="menubar" href="${path}/review/list?num=1" >리뷰리스트 관리</a>
            <a class="menubar" href="${path}/faq/listPage?num=1">FAQ</a>
        </div>

        <div class="container" >
            <h2>유저 목록</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <%-- 검색 기능 추가--%>
            <div class="col-xl-3">
                <form class="d-flex" role="search">
                    <input type="hidden" name="num" value="${page.pageNum}">
                    <select class="border-success rounded-3" name="searchType">
                        <option value="mem_name" <c:if test="${search == 'mem_name'}">selected</c:if>>이름</option>
                        <option value="mem_email" <c:if test="${search == 'mem_email'}">selected</c:if>>이메일</option>
                        <option value="all" <c:if test="${search == 'all'}">selected</c:if>>이름+이메일</option>
                    </select>
                    <input class="form-control ms-2 me-2" type="text" name="keyword" placeholder="Search" aria-label="Search" value="${keyword}">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
            <table class="table table-hover">


                <thead>


                <tr>
                    <th>회원번호</th>

                    <th>이메일</th>


                    <th>이름</th>


                    <th>주소</th>


                    <th>가입일자</th>
                </tr>


                </thead>


                <tbody>




                <c:forEach var="row" items="${list}">
                    <tr>
                        <td>${row.mem_num}</td>

                        <td>${row.mem_email}</td>



                        <td><%-- 클릭 시 상세페이지 호출--%>
                            <input type="hidden" id="mem_num" name="mem_num" value="${row.mem_num}">
                            <a href="${path}/admin/view.do?mem_num=${row.mem_num}">${row.mem_name}</a>
                        </td>


                        <td>${row.mem_address1}</td>


                        <td><fmt:formatDate value="${row.mem_join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>


                    </tr>


                </c:forEach>


                </tbody>


            </table>
            <%--페이지 네이션 추가--%>
            <div class="d-flex justify-content-center align-items-center pt-4 my-5 h5" style="padding-left: 35%">


            <span>
                  <c:if test="${page.pageNum > 2}">
                      <c:set var="firstPageNum" value="1" />
                      <a class="ms-3 text-muted" href="${path}/admin/admin_listPage?num=${firstPageNum}">
                        <i class="bi bi-chevron-double-left"></i>
                      </a>
                  </c:if>
                <c:if test="${page.pageNum  > 1}">
                <a class="ms-3 text-muted" href="${path}/admin/admin_listPage?num=${page.pageNum - 1}">
                <i class="bi bi-chevron-left"></i></a>
                </c:if>
            </span>

                <c:forEach begin="1" end="${page.lastPageNum}" var="num">
                <span class="ms-3 text-muted">
                    <c:if test="${select != num}"> <a class="ms-3 text-muted" href="${path}/admin/admin_listPage?num=${num}">${num}</a></c:if>
                    <c:if test="${select == num}"><b class="ms-3 text-muted">${num}</b></c:if>
                </span>
                </c:forEach>

                <span>
                <c:if test="${page.pageNum != page.lastPageNum }">
                <a class="ms-3 text-muted" href="${path}/admin/admin_listPage?num=${page.pageNum + 1}">
                    <i class="bi bi-chevron-right"></i>
                </a>
                </c:if>
                <c:if test="${page.pageNum != page.lastPageNum}">
                    <a class="ms-3 text-muted" href="${path}/admin/admin_listPage?num=${page.lastPageNum}">
                        <i class="bi bi-chevron-double-right"></i>
                    </a>

                </c:if>

            </span>
            </div>

    </div>
</div>
    <%@include file="../footer.jspf" %>
</div>
</body>
</html>