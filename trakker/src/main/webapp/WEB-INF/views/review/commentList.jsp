<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="../itemfile.jspf" %>
</head>
<script>

    $(function() {
        $(".editDiv").click(function() {
            var con = $(this).closest('.edit_view');
            var comment_num = $(this).data("comment_num");
            var review_num = $(this).data("review_num");
            var mem_num = $(this).data("mem_num");
            var l_num = $(this).data("l_num");
            var content = $(this).data("content");

            if (!con.find('.commentbox2').length) {
                con.append(getHtml(comment_num, review_num, mem_num, l_num, content));
                textareaHeight();
            }
        });

        $(document).on("click", ".cancel", function() {
            $(this).closest('.commentbox2').remove();
            $(this).closest('.commentbox3').remove();
        });

        function getHtml(comment_num, review_num, mem_num, l_num, content) {

            var div = "<div class='commentbox2 mt-3'>" +
                "<div class='d-flex row'>" +
                "<input type='hidden' name='comment_num' value='" + comment_num + "'>" +
                "<input type='hidden' name='l_num' value='" + l_num + "'>" +
                "<input type='hidden' name='mem_num' value='" + mem_num + "'>" +
                "<input type='hidden' name='review_num' value='" + review_num + "'>" +
                "<div class='col-sm-11'>" +
                "<textarea id='editContent' name='editContent' oninput='textareaHeight()' onkeydown='resize(this)' onkeyup='resize(this)'>" + content + "</textarea>" +
                "</div>" +
                "<div class='col-sm-1 align-self-end'>" +
                "<button class='btn btn-outline-success' type='button' id='commentEdit'>수정</button>" +
                "<button class='btn btn-outline-success mt-3 cancel' type='button'>취소</button>" +
                "</div>" +
                "</div>" +
                "</div>";
            return div;
        }

        $(".addComment").click(function() {
            var con = $(this).closest('.edit_view');
            var comment_num = $(this).data("comment_num");

            if (!con.find('.commentbox3').length) {
                con.append(getAdd(comment_num));
            }
        });

        function getAdd(comment_num) {

            var add = "<div class='commentbox3 mt-3'>" +
                "<div class='d-flex row'>" +
                "<input type='hidden' name='comment_num' value='" + comment_num + "'>" +
                "<div class='col-sm-11'>" +
                "<textarea id='addContent' name='addContent' onkeydown='resize(this)' onkeyup='resize(this)'></textarea>" +
                "</div>" +
                "<div class='col-sm-1 align-self-end'>" +
                "<button class='btn btn-outline-success' type='button' id='addInsert'>등록</button>" +
                "<button class='btn btn-outline-success mt-3 cancel' type='button'>취소</button>" +
                "</div>" +
                "</div>" +
                "</div>";
            return add;
        }

        function textareaHeight() {
            var textarea = document.getElementById("editContent");
            textarea.style.height = "0px";
            textarea.style.height = textarea.scrollHeight + "px";
        }

    });
</script>
<body>
<div class="container">
        <% pageContext.setAttribute("newLineChar", "\n"); %>
    <c:forEach var="row" items="${list}">
        <c:set var="str" value="${fn:replace(row.content, '<', '&lt;') }" />
        <c:set var="str" value="${fn:replace(str, '>', '&gt;') }" />
        <c:set var="str" value="${fn:replace(str, '  ', '&nbsp;&nbsp;') }" />
        <c:set var="str" value="${fn:replace(str, newLineChar, '<br>') }" />
    <div class="d-flex row edit_view">
        <c:choose>
        <c:when test="${row.comment_p > 1}">
        <div class="col-sm-11 ps-5">
            </c:when>
            <c:otherwise>
            <div class="col-sm-11">
                </c:otherwise>
                </c:choose>
                <c:if test="${row.com_delete == '0'}">
                    <h6><strong>${row.member.mem_nickname}</strong>
                        <button type="button" class="btn btn-sm" id="btn1" disabled>작성자</button>
                    </h6>
                </c:if>
                <p class="mb-2 opacity-70">
                    <c:choose>
                        <c:when test="${row.comment_p > 1}">
                            <c:if test="${row.com_delete == '0'}">
                                <strong class="pe-2" style="color: #A3A3A3">${row.parent_comment_nickname}</strong> ${str}
                            </c:if>
                            <c:if test="${row.com_delete == '1'}">
                                삭제된 댓글입니다.
                            </c:if>
                        </c:when>
                        <c:when test="${row.com_delete == '1'}">
                            삭제된 댓글입니다.
                        </c:when>
                        <c:otherwise>
                            ${str}
                        </c:otherwise>
                    </c:choose>
                </p>
                <c:if test="${row.com_delete == '0'}">
                    <small class="text-muted text-nowrap"><fmt:formatDate value="${row.com_date}" pattern="yyyy-MM-dd a HH:mm:ss" />
                        <c:if test="${row.com_update eq '1'}">(수정됨)</c:if>
                        <a class="ms-2 text-muted addComment" data-comment_num="${row.comment_num}">답글달기</a></small>
                </c:if>
            </div>
            <div class="col-sm-1 align-self-end">
                <input type="hidden" name="comment_num" value="${row.comment_num}">
                <c:if test="${row.com_delete == '0'}">
                    <button class="btn btn-outline-success editDiv" type="button" data-comment_num="${row.comment_num}" data-review_num="${row.review_num}" data-mem_num="${row.mem_num}" data-l_num="${row.l_num}" data-content="${row.content}">수정</button>
                    <button class="btn btn-outline-success mt-3" type="button" onclick="commentDelete(${row.comment_num})">삭제</button>
                </c:if>
            </div>
            <hr class="mt-2">
        </div>
        </c:forEach>
    </div>
</body>
</html>