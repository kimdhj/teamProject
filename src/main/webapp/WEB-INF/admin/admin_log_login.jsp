<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<!-- <div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav class="navbar navbar-dark bg-info">
					<div class="container-fluid">
						<a class="navbar-brand">ADMIN</a>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</div>
	</div> -->
	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-7">
				<form action="/adminLoginLog.mdo" method="get">
					<div class="d-flex flex-row">
						<div class="col-md-4">
							<select class="form-select form-select mb-3"
								aria-label=".form-select-lg example" name="searchCondition">
								<c:forEach items="${conditionMapVOne}" var="option">
									<option value="${option.value}">${option.key}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id=""
								name="searchKeyword" placeholder="입력하세요">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-light btn-outline-dark">검색</button>
						</div>
					</div>
					<%-- <input type="hidden" name="pageNum" value="${pagination.criteria.getPageNum() }">
					<input type="hidden" name="perPageNum" value="${pagination.criteria.getPerPageNum() }"> --%>
				</form>
				<%-- <select class="form-select form-select mb-3"
					aria-label=".form-select-lg example" name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select> --%>
			</div>
			<!-- <div class="col-md-2">
				<input type="text" class="form-control" id="" name="searchKeyword"
					placeholder="입력하세요">
			</div>
			<div class="col-md-1">
				<button type="submit" class="btn btn-light btn-outline-dark">검색</button>
			</div> -->
			<div class="col-md-12">
				<div class="btn-group" role="group"
					aria-label="Basic mixed styles example">
					<button type="button" class="btn btn-danger" onclick="location.href='/adminLoginLog.mdo'">Login Log</button>
					<button type="button" class="btn btn-warning" onclick="location.href='/adminWorkLog.mdo'">Work Log</button>
					<button type="button" class="btn btn-dark" onclick="location.href='/adminPaymentLog.mdo'">Pay Log</button>					
				</div>
			</div>

		</div>
		<div class="d-flex flex-row">
			<p style="color:blue;">${pagination.criteria.pageNum}페이지</p>
		</div>
		<div class="d-flex flex-row">
			<table class="table text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">ID</th>
						<th scope="col">결과</th>
						<th scope="col">접속주소</th>
						<th scope="col">접속IP</th>
						<th scope="col">Browser</th>
						<th scope="col">접속일</th>
					</tr>
				</thead>		
				<tbody>
					<c:forEach var="loginList" items="${loginLogList}">
						<tr>
							<td>${loginList.login_log_seq}</td>
							<td>${loginList.login_log_id}</td>
							<td>${loginList.login_log_success}</td>
							<td>${loginList.login_log_url}</td>
							<td>${loginList.login_log_ip}</td>
							<td>${loginList.login_log_browser}</td>
							<td>${loginList.login_log_day}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<!-- <li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li> -->
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/adminLoginLog.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.startPage - 1 }&selectCondition=${pagination.criteria.getSelectCondition()}" />">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="pageNum">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/adminLoginLog.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pageNum}&selectCondition=${pagination.criteria.getSelectCondition()}" />">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pagination.next && pagination.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/adminLoginLog.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.endPage + 1 }&selectCondition=${pagination.criteria.getSelectCondition()}" />">다음</a></li>
						</c:if>
						<!-- <a class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a> -->
					</ul>
				</nav>
			</div>
		</div>
	</div>









	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>