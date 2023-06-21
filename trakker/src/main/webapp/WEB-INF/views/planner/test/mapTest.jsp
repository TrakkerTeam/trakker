<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플래너 작성</title>
	<%@ include file="../../itemfile.jspf" %>
	<%@ include file="../../header.jspf" %>
</head>
<body>
<%--	<div id="map"></div>--%>
	<hr>

<%--필요한 데이베이스 정보 리스트--%>

<%--플래너 번호--%>
<%--플래너 지역--%>
<%--플래너 제목--%>
<%--플래너 작성자--%>
<%--플래너 등록일자--%>
<%--플래너 조회수--%>
<%--플래너 날짜수--%>

	<%--상세(foreach)--%>
	<%--세부일정 날짜--%>
	<%--세부일정 장소--%>
	<%--세부일정 메모--%>
	<%--세부일정 좌표--%>


	<c:forEach items="${days}" var="day" varStatus="status">
<%--일정날짜--%>
		<div>day ${status.count}</div>
<%----%>
<%----%>
<%----%>
<%----%>
<%----%>
<%----%>
<%----%>
		<hr>
	</c:forEach>
<div>day 1</div>
	<hr>
<div>day 2</div>
	<hr>
<div>day 3</div>
	<hr>
<div>day 4</div>
	<hr>
<div>day 5</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703&libraries=services,clusterer,drawing"></script>
	<script>

	</script>
</body>
</html>