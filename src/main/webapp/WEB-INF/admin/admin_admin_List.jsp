<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<form>
					<div class="d-flex flex-row">
						<div class="col-md-4">
							<select class="form-select form-select mb-3"
								aria-label=".form-select-lg example" name="searchCondition">
								<c:forEach items="${conditionMap }" var="option">
									<option value="${option.value }">${option.key }</option>
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
			</div>
		</div>
		<div class="d-flex flex-row">
			<p style="color:blue;">${pagination.criteria.pageNum}/${pagination.endPage}페이지</p>
		</div>
		<div class="d-flex flex-row">
			<table class="table text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">구분</th>
						<th scope="col">연락처</th>
						<th scope="col">Email</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="adminAccount" items="${adminListWithPaging}">
						<tr>
							<td>${adminAccount.user_name}</td>
							<td>${adminAccount.user_id}</td>
							<td>${adminAccount.user_role}</td>
							<td>${adminAccount.user_phone}</td>
							<td>${adminAccount.user_email}</td>
							<td><button type="button"
									class="btn btn-light btn-outline-dark">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- <div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</nav>
			</div>
		</div> -->
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<!-- <li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li> -->
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/getAdmin_admin_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.startPage - 1 }" />">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="pageNum">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/getAdmin_admin_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pageNum}" />">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pagination.next && pagination.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/getAdmin_admin_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.endPage + 1 }" />">다음</a></li>
						</c:if>
						<!-- <a class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a> -->
					</ul>
				</nav>
			</div>
		</div>

		<div class="d-flex flex-row">
			<div class="col-md-6">
				<div class="col-md-12">
					<form action="insertAdminAccount.mdo" method="post" id="accountCheckForm" onsubmit="return adminAccountCheck()">
					<!-- <form action="/insertAdminAccount.mdo" method="post" name="adminAccountInsertForm"> -->
						<table class="table text-center">
							<thead class="table-dark">
								<tr>
									<th colspan=3>관리자계정 생성</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>이름</th>
									<td colspan=2><input class="form-control" type="text"
										id="user_name" name="user_name" style="float: left;" placeholder="이름을 입력하세요" /></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input class="form-control" type="text" id="user_id" name="user_id"
										style="float: left;" placeholder="아이디를 입력하세요" /></td>
									<td>
										<button type="button" class="btn btn-light btn-outline-dark"
										id="btnCheck" style="float: right;" onclick="checkId()">중복확인</button>
									</td>
								</tr>
								<tr>
									<td colspan='2'><h6 style="color: red;"
											id="id_check"></h6></td>
									<td></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td colspan=2><input class="form-control" type="password" name="user_password"
										onkeyup="passwordCheckFunction()" id="user_password"
										style="float: left;" placeholder="비밀번호를 입력하세요" /></td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td colspan=2><input class="form-control" type="password"
										onkeyup="passwordCheckFunction()"id="user_passwordCheck"
										style="float: left;" placeholder="비밀번호 확인" /></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan=2><input class="form-control" type="text"
										id="user_phone" name="user_phone" maxlength="11" style="float: left;"
										placeholder="전화번호를 입력하세요" /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td colspan=2><input class="form-control" type="email"
										id="user_email" name="user_email" style="float: left;" placeholder="이메일을 입력하세요" /></td>
								</tr>
								<tr>
									<td colspan=2><h6 style="color: red;"
											id="passwordCheckMessage"></h6></td>
									<td><button type="submit"
											class="btn btn-light btn-outline-dark" style="float: right;">등록</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="col-md-6"></div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/admin_admin_List.js"></script>
	

</body>
</html>