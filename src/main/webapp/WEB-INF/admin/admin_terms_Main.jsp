<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_terms.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container" id="search">
		<div class="terms_header">
			<div class="card border-light">
				<div class="card-header">
					<div class="d-flex flex-row">
						<div class="col-md-6" id="terms_header"><a id="terms_home" onclick="location.reload();" class="select p-2">약관 목록</a></div>
						<div class="col-md-6">
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;"
								onclick="location.href='admin_terms_Write.mdo' ">조항 추가</button>
						</div>
					</div>
				</div>


				<div class="search">
				<div id="search_part">
					<input type="text" id="search_content" placeholder="검색할 약관 항목 입력">
					<button id="search_btn" >검색</button>
				</div>
				</div>

				<div class="card-body">
					<div class="d-flex flex-row">
						<table class="table">
							<thead class="table-dark">
								<tr>
									<th width="70" scope="col">번호</th>
									<th width="70" scope="col">조항</th>
									<th width="150" scope="col">약관제목</th>
									<th width="70" scope="col">등록일</th>
									<th width="70" scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="terms" items="${termsList}">
									<tr>
										<td scope="row">${count}</td>

										<td>제 ${terms.terms_article_number}조</td>
										<td><a
											href="/admin_terms_Read.mdo?terms_seq=${terms.terms_seq}&count=${count}">${terms.terms_title}</a></td>
										<td><fmt:formatDate value="${terms.terms_date }"
												pattern="yyyy-MM-dd" /></td>
										<td><c:choose>
												<c:when test="${terms.terms_state == true }">공개</c:when>
												<c:otherwise>비공개</c:otherwise>
											</c:choose></td>

										<c:set var="count" value="${count - 1}" />
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="d-flex flex-row" id="paging">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm" id="reload">
						<c:if test="${currentpage ne 1} ">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="tr">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage}">
							<c:if test="${currentpage eq i }">
								<li class="page-item active"><a class="page-link" href="#"
									id="now">${i}</a></li>
							</c:if>
							<c:if test="${currentpage ne i }">
								<li class="page-item"><a href="#" class="page-link">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${currentpage ne page}">
							<li class="page-item"><a class="page-link" href="#">다음</a></li>
							<a class="page-link" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</ul>
				</nav>
			</div>
			<input type="number" class="hide" value="${currentpage}" id="page">
			<input type="number" class="hide" value="${page}" id="count">
			<input type="hidden" value="${svo.title}" id="title">
		</div>
	</div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_terms_Main.js"></script>
</body>
</html>