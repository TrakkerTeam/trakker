<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>모달</title>
    <%@ include file="../header.jspf" %>
</head>
<body>

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
            <form class="modal-body m-0 p-0" action="${path}/planner/new" method="post">
                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">기간</span>
                    <select class="rounded-3 ms-3 border-2" name="planner-days" required>
                        <option value="1">1일</option>
                        <option value="2">2일</option>
                        <option value="3">3일</option>
                        <option value="4">4일</option>
                        <option value="5">5일</option>
                    </select>
                </div>
                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">제목</span>
                    <input type="text" class="rounded-3 ms-3" name="planner-title" style="width:85%!important;" required>
                </div>

                <div class="modal-dialog-centered m-4 me-5">
                    <span class="fw-normal ms-2">메모</span>
                    <input type="text" class="rounded-3 ms-3" name="planner-memo" style="width:85%!important;">
                </div>
                <div class="text-end m-4">
                    <input hidden name="planner-local" value="1">
                    <button type="submit" class="btn btn-success">확인</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
