<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/include/jquery-3.6.3.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3 class="mt-2"><fmt:formatNumber value="${dto}" pattern="0.0"/></h3>

<script>
    console.log("dto =" + ${dto});

</script>
</body>
</html>