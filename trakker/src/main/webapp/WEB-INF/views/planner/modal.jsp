<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>모달</title>
    <%@ include file="../header.jspf" %>
</head>
<body>
<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-success m-3" data-bs-toggle="modal" data-bs-target="#plan_c">--%>
<%--    메인 지역버튼 - 달력--%>
<%--</button>--%>
<!-- Modal -->
<%--<div class="modal fade" id="plan_c" tabindex="-1" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header m-2">--%>
<%--                <h1 class="modal-title fs-5">플래너 작성하기 - 달력</h1>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <form class="modal-body">--%>
<%--                <div class="modal-dialog-centered m-4 me-5">--%>
<%--                    <span class="fw-normal">제목</span><input type="text" class="rounded-3 ms-4 w-75" required>--%>
<%--                </div>--%>
<%--                <div class="modal-dialog-centered m-4 me-5">--%>
<%--                    <span class="fw-normal">일정</span><input type="date" name="fDate" class="rounded-3 ms-4 me-2" required>--%>
<%--                    <span>~</span><input type="date" name="lDate" class="rounded-3 ms-2" required>--%>
<%--                </div>--%>
<%--                <div class="modal-dialog-centered m-4 me-5">--%>
<%--                    <span class="fw-normal">메모</span><input type="text" class="rounded-3 ms-4 w-75">--%>
<%--                </div>--%>
<%--                <div class="text-end mx-3 mt-5 mb-3">--%>
<%--                    <button type="button" class="btn btn-success">확인</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%-- 날짜를 픽하지 말고 1~5로 여행 기간만 설정하게 구현 --%>

<!-- Button trigger modal -->
<button type="button" class="btn btn-success m-3" data-bs-toggle="modal" data-bs-target="#plan_d">
    메인 지역버튼 - 일정
</button>

<!-- Modal -->
<div class="modal fade" id="plan_d" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header m-2">
                <h1 class="modal-title fs-5">플래너 작성하기 - 일정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="modal-body m-0 p-0">
                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">기간</span>
                    <select class="rounded-3 ms-3 border-2" required>
                        <option>1일</option>
                        <option>2일</option>
                        <option>3일</option>
                        <option>4일</option>
                        <option>5일</option>
                    </select>
                </div>
                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">제목</span>
                    <input type="text" class="rounded-3 ms-3" style="width:85%!important;" required>
                </div>

                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">메모</span>
                    <input type="text" class="rounded-3 ms-3" style="width:85%!important;">
                </div>
                <div class="text-end m-4">
                    <button type="button" class="btn btn-success">확인</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
