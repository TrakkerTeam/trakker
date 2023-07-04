<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>ADMIN</title>

</head>
<script type="text/javascript">
	function openModal(modalId) {
		document.getElementById(modalId).style.display = "block";
	}

	function closeModal(modalId) {
		document.getElementById(modalId).style.display = "none";
	}

	function memberList() {
		location.href="${path}/admin/admin_listPage?num=1";
	}
	function reviewList(){
		location.href = "${path}/review/list?num=1";
	}
	function faqList(){
		location.href = "${path}/faq/listPage?num=1";
	}
	function tripList(){
		location.href = "${path}/trip/trip_list_admin?num=1";
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
		gap: 25px;
		align-items: center;
		border-right: 1px solid #000000;
		padding-top: 50px;
		background-color: #20c997;
	}

	div a.menubar {
		text-decoration: none;
		display: flex;
		color: #000;
		padding: 25px 25px 25px 25px;
		font-weight: bold;
		color: rgba(255, 255, 255, 0.55);
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
<%@ include file="../header.jspf" %>

<div id="container">
	<div style="display: flex; height: auto;">
		<div id="category" class="menu" style="width:10%; height:auto;">
			<a class="menubar" href="${path}/admin/admin_listPage?num=1"><i class="bi bi-person-fill">회원관리</i></a>
			<a class="menubar" href="${path}/trip/trip_list_admin?num=1"><i class="bi bi-airplane">관광명소 관리</i></a>
			<a class="menubar" href="${path}/review/list?num=1" ><i class="bi bi-file-earmark-richtext">리뷰리스트 관리</i></a>
			<a class="menubar" href="${path}/faq/listPage?num=1"><i class="bi bi-quora">FAQ</i></a>
		</div>

		<div class="container" style="padding-left: 50px; padding-right: 50px;">
			<div id="result" style="display: flex; width:100%; flex-direction: column;">

				<div class="content">
					<div class="header" style="display:flex; height:auto; padding-top: 50px;">
						<div class="container" style="flex-basis: 50%;">
							<div class="container">
								<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
									<h3>회원관리</h3>
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
									<c:forEach var="dto" items="${memberList}" varStatus="status">
										<c:choose>
										<c:when test="${status.index < 4}">
									<tr>
										<td>${dto.mem_email}</td>
										<td><a href="${path}/admin/view.do?mem_num=${dto.mem_num}">${dto.mem_name}</a></td>
										<td>${dto.mem_address1}</td>
										<td><fmt:formatDate value="${dto.mem_join_date}" pattern="yyyy-MM-dd"/></td>
									</tr>
										</c:when>
										</c:choose>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="container" style="flex-basis: 50%;">
							<div class="container">
								<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
									<h3>리뷰페이지</h3>
									<button class="btn" type="button" onclick="reviewList()" style="float:right;">
										<i class="bi bi-plus-lg"></i>
									</button>
								</div>
								<table class="table table-hover">
									<thead>
									<tr>
										<th style="width: 10%;">번호</th>
										<th style="width: 55%;">제목</th>
										<th style="width: 20%;">작성일자</th>
										<th style="width: 15%;">조회수</th>
									</tr>
									</thead>

									<tbody>
									<c:forEach var="dto" items="${reivewList}" varStatus="status">
										<c:choose>
											<c:when test="${status.index < 4}">
												<tr>
													<td>${dto.review_num}</td>
													<td><a href="${path}//review/detail?review_num=${dto.review_num}">${dto.title}</a></td>
													<td><fmt:formatDate value="${dto.review_date}" pattern="yyyy-MM-dd"/></td>
													<td>${dto.readcount}</td>
												</tr>
											</c:when>
										</c:choose>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="footer" style="display:flex; height:auto; margin-top: 20px;">
						<div class="container" style="flex-basis: 50%; ">
							<div class="container">
								<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
									<h3>FAQ</h3>
									<button class="btn" type="button" onclick="faqList()"
											style="float: right;">
										<i class="bi bi-plus-lg"></i>
									</button>
								</div>

								<table class="table table-hover">
									<thead>
									<tr>
										<th style="width: 10%">번호</th>
										<th style="width: 55%">제목</th>
										<th style="width: 20%">작성일자</th>
										<th style="width: 15%">조회수</th>
									</tr>
									</thead>
									<tbody>
									<c:set var="list" value="${list.subList(0, 4)}"/>
									<c:forEach var="faq" items="${list}">
										<tr>
											<td>${faq.faq_num}</td>
											<td>
												<a href="${path}/faq/view.do?faq_num=${faq.faq_num}">${faq.faq_subject}</a>
											</td>
											<td><fmt:formatDate value="${faq.faq_reg_date}"
																pattern="yyyy-MM-dd"/></td>
											<td>${faq.readcount}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="container" style="flex-basis: 50%;">
							<div class="container">
								<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
									<h3>관광지</h3>

									<button class="btn" type="button" onclick="tripList()"
											style="float: right;">
										<i class="bi bi-plus-lg"></i>
									</button>
								</div>
								<table class="table table-hover">
									<thead>
									<tr>
										<th style="width: 8%">번호</th>
										<th style="width: 20%">관광명소</th>
										<th style="width: 57%">내용</th>
										<th style="width: 15%">작성일자</th>
									</tr>
									</thead>
									<tbody>
									<c:set var="lists" value="${lists.subList(0, 3)}"/>
									<c:forEach var="trip" items="${lists}">
										<tr>
											<td>${trip.t_num}</td>
											<td><a href="#" onclick="openModal('myModal${trip.t_num}')">${trip.t_subject}</a></td>
											<td>${trip.content}</td>
											<td><fmt:formatDate value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></td>
										</tr>
										<div id="myModal${trip.t_num}" class="modal">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">${trip.t_subject}</h4>
													<div class="ml-auto">
														<a href="${path}/trip/view.do?t_num=${trip.t_num}" class="btn btn-outline-success">글수정</a>
														<button type="button" class="btn-close" aria-label="Close"
																onclick="closeModal('myModal${trip.t_num}')" data-dismiss="modal"></button>
													</div>
												</div>
												<div class="modal-body" style="display: flex;">
													<div style="flex: 1;">
														<img src="${path}/resources/images/hanook.png"
															 alt="이미지" style="width: 100%; height: auto;">
													</div>
													<div style="flex: 1; padding-left: 10px;">
														<p style="float:right;">${trip.content}</p>
													</div>
												</div>
												<div class="modal-footer d-flex">
													<div style="flex: 1;" class="d-flex justify-content-end align-items-center">
														<small class="text-muted" style="margin-right: 10px;">작성일:<fmt:formatDate
																value="${trip.t_regdate}" pattern="yyyy-MM-dd"/></small>
														<button class="btn btn-outline-success" onclick="redirectToPage()">플래너
														</button>
													</div>
												</div>
											</div>
										</div>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jspf" %>
</div>

</body>
</html>