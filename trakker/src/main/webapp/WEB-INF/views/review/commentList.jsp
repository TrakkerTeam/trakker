<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../itemfile.jspf" %>
</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:forEach var="row" items="${list}">
 <c:set var="str" value="${fn:replace(row.content, '<', '&lt;') }" />
 <c:set var="str" value="${fn:replace(str, '>', '&gt;') }" />
 <c:set var="str" value="${fn:replace(str, '  ', '&nbsp;&nbsp;') }" />
 <c:set var="str" value="${fn:replace(str, newLineChar, '<br>') }" />
   <h6 class="mb-2 mt-2">${row.mem_num}
    <button type="button" class="btn btn-sm" id="btn1" disabled>작성자</button>
   </h6>
   <p class="mb-2 opacity-70">${str} </p>
   <small class="text-muted text-nowrap">(<fmt:formatDate value="${row.com_date}" pattern="yyyy-MM-dd a HH:mm:ss" />)(수정됨)<a class="ms-2 text-muted" href="javascript:void(0);" onclick="addComment()">답글달기</a></small><hr>
</c:forEach>
 

</table>

</body>
</html>