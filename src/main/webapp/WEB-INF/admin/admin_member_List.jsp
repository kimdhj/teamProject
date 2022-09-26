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
				<form action="/getAdmin_member_List.mdo" method="get">
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
			<form action="/getAdmin_member_List.mdo" method="get">
				<div class="col-md-12">
					<div class="btn-group" role="group"
						aria-label="Basic mixed styles example">
						<button type="submit" class="btn btn-danger" name="selectCondition" value="user_sub">구독</button>
						<button type="submit" class="btn btn-warning" name="selectCondition" value="user_normal">일반</button>
						<button type="submit" class="btn btn-dark" name="selectCondition" value="user_black">블랙</button>
						<button type="submit" class="btn btn-secondary" name="selectCondition" value="user_withdrawal">탈퇴</button>
						<button type="submit" class="btn btn-success" name="selectCondition" value="user_all">전체</button>
						<input type="hidden" id="searchCondition" name="searchCondition" value="${criteria.searchCondition}"/>
						<input type="hidden" id="searchKeyword" name="searchKeyword" value="${criteria.searchKeyword}"/>
						<!-- <button type="submit" class="btn btn-success" name="sortCondition" value="sort">정렬</button> -->
					</div>
				</div>
			</form>
		</div>
		<div class="d-flex flex-row">
			<p style="color:blue;">${pagination.criteria.pageNum}페이지</p>
		</div>
		<div class="d-flex flex-row">
			<table class="table text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">이름</th>
						<th scope="col">
							<img src="/img/up.png" style="cursor:pointer" onclick="location.href='/getAdmin_member_List.mdo?pageNum=${pagination.criteria.getPageNum()}&sortConditionUp=clicked&selectCondition=${pagination.criteria.getSelectCondition()}&searchKeyword=${pagination.criteria.getSearchKeyword()}&searchCondition=${pagination.criteria.getSearchCondition()}'" />
								아이디
							<img src="/img/down.png" style="cursor:pointer" onclick="location.href='/getAdmin_member_List.mdo?pageNum=${pagination.criteria.getPageNum()}&sortConditionDown=clicked&selectCondition=${pagination.criteria.getSelectCondition()}&searchKeyword=${pagination.criteria.getSearchKeyword()}&searchCondition=${pagination.criteria.getSearchCondition()}'" />
						</th>
						<th scope="col">구분</th>
						<th scope="col">상태</th>
						<th scope="col">생년월일</th>
						<th scope="col">연락처</th>
						<th scope="col">Email</th>
						<th scope="col">마일리지</th>
						<th scope="col">보유쿠폰</th>
						<th scope="col">조회</th>
					</tr>
				</thead>		
				<tbody>
					<c:forEach var="adminAccount" items="${adminUserListWithPaging }">
							<tr>
								<td>${adminAccount.user_name }</td>
								<td>${adminAccount.user_id }</td>
								<c:if test="${adminAccount.user_sub == 0}">
									<td>일반</td>
								</c:if>
								<c:if test="${adminAccount.user_sub == 1}">
									<td>구독</td>
								</c:if>
								<c:if test="${adminAccount.user_sub == 2}">
									<td>관리자</td>
								</c:if>
								<c:if test="${adminAccount.user_state == 0}">
									<td>정상</td>
								</c:if>
								<c:if test="${adminAccount.user_state == 1}">
									<td>블랙</td>
								</c:if>
								<c:if test="${adminAccount.user_state == 2}">
									<td>탈퇴</td>
								</c:if>
								<td>${adminAccount.user_birth }</td>
								<td>${adminAccount.user_phone }</td>
								<td>${adminAccount.user_email }</td>
								<td><fmt:formatNumber value="${adminAccount.user_point }" pattern="#,###"/>P</td>
								<td>${adminAccount.user_coupon_cnt } 장</td>
								<td>
									<a href="getAdmin_member_Detail.mdo?user_id=${adminAccount.user_id}&pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&selectCondition=${criteria.selectCondition}&sortConditionUp=${criteria.sortConditionUp}&sortConditionDown=${criteria.sortConditionDown}">
										<button type="button" class="btn btn-light btn-outline-dark" id="searchDetailBtn">조회</button>
									</a>
								</td>
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
								href="<c:url value="/getAdmin_member_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.startPage - 1 }&selectCondition=${pagination.criteria.getSelectCondition()}&sortConditionUp=${pagination.criteria.getSortConditionUp()}&sortConditionDown=${pagination.criteria.getSortConditionDown()}" />">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="pageNum">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/getAdmin_member_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pageNum}&selectCondition=${pagination.criteria.getSelectCondition()}&sortConditionUp=${pagination.criteria.getSortConditionUp()}&sortConditionDown=${pagination.criteria.getSortConditionDown()}" />">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pagination.next && pagination.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/getAdmin_member_List.mdo?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.endPage + 1 }&selectCondition=${pagination.criteria.getSelectCondition()}&sortConditionUp=${pagination.criteria.getSortConditionUp()}&sortConditionDown=${pagination.criteria.getSortConditionDown()}" />">다음</a></li>
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