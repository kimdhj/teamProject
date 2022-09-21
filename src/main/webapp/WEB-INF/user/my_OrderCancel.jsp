<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>

<!-- DatePicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/style.css">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>

		<!-- 여기 삽입 -->

		<!-- 기간조회 및 조건검색 -->

		<div class="container">
			<form action="/myOrderCancel.do" method="get">
				<div class="d-flex flex-row">
					<div class="col-md-12">
						<table class="table">
							<thead>
				
							</thead>
							<tbody>
								<tr>
									<th scope="row" class="bg-light align-middle">기간조회</th>
									<td>
										<div class="btn btn-group" role="group" aria-label="Basic example">
											<button type="button" class="btn btn-dark btn-sm"
												name="filterDate" id="oneWeek" value="1"
												onclick="searchDateOneWeek()">1주일</button>
											<button type="button" class="btn btn-dark btn-sm"
												name="filterDate" id="oneMonth" value="2"
												onclick="searchDateOneMonth()">1개월</button>
											<button type="button" class="btn btn-dark btn-sm"
												name="filterDate" id="threeMonth" value="3"
												onclick="searchDateThreeMonth()">3개월</button>
											<button type="button" class="btn btn-dark btn-sm"
												name="filterDate" id="sixMonth" value="4"
												onclick="searchDateSixMonth()">6개월</button>
										</div>
										<div>
											오늘 날짜 : <span id="today"></span>
											
												<input type="text" name="fromDate" id="fromDate" value="">
												~ 
												<input type="text" name="toDate" id="toDate" value="">
											
										</div>
									</td>
									<td class="align-middle">
										<!-- <button type="button" class="btn btn-secondary">조회</button> -->
									</td>
								</tr>
								<tr>
									<th scope="row" class="bg-light align-middle">조건검색</th>
									<td>
									<select class="form-select form-select mb-3"
										aria-label=".form-select-lg example" name="searchCondition">
										<c:forEach items="${conditionMap}" var="option">
											<option value="${option.value}">${option.key}</option>
										</c:forEach>
									</select> 
									<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="">
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="d-flex flex-row">
					<div class="col-md-12">
						<button type="submit" class="btn btn-secondary" id="orderSearchBtn" onclick="" style="float:right;">검색</button>
					</div>
				</div>
			</form>
		</div>

		<!-- 기간조회 및 조건검색 끝 -->

		<!-- 나의 최근 주문현황 -->
		<br>
		<div class="d-flex flex-row">
			<p style="color:red;">${pagination.criteria.pageNum}/${pagination.endPage}페이지</p>
			<p style="color:black;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				2022-06-29 ~ 2022-07-28 까지의 주문 총
			<a>0</a>건</p>
		</div>
		<div class="table-responsive">
			<table class="table ">
				<thead>
					<tr>
						<th scope="col">주문번호</th>
						<th scope="col">상품정보</th>
						<th scope="col">받는이</th>
						<th scope="col">주문일</th>
						<th scope="col">주문상태</th>
						<th scope="col">주문상세</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="myOrder" items="${myOrderList}">
						<tr>
							<th scope="row">${myOrder.orders_seq}</th>
							<td>${myOrder.orders_title}</td>
							<td>${myOrder.orders_name}</td>
							<td>
								<fmt:formatDate value="${myOrder.orders_order_day}" pattern="yyyy-MM-dd" />
							</td>
							<td>
								<c:if test="${myOrder.orders_status eq 'cancelallwait'}">취소/교환/반품대기</c:if>
								<c:if test="${myOrder.orders_status eq 'cancelallfinish'}">취소/교환/반품완료</c:if>
								
							</td>
							<td>
								<a href="/myOrderCancelDetail.do?orders_seq=${myOrder.orders_seq}&pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&fromDate=${criteria.fromDate}&toDate=${criteria.toDate}">
									<button type="button" class="btn btn-warning" id="checkArrival" name="checkArrival">조회</button>
								</a>
								
							</td>
						</tr>
						<input type="hidden" id="orders_seq" name="orders_seq" value="${myOrder.orders_seq}" />
						<input type="hidden" id="orders_delivery" name="orders_delivery" value="${myOrder.orders_delivery}" />
						<input type="hidden" id="orders_delivery_company" name="orders_delivery_company" value="${myOrder.orders_delivery_company}" />
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 페이징 -->
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<!-- <li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li> -->
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myOrderCancel.do?searchCondition=${criteria.getSearchCondition() }&searchKeyword=${criteria.getSearchKeyword() }&pageNum=${startPage - 1 }" />">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="pageNum">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myOrderCancel.do?searchCondition=${criteria.getSearchCondition() }&searchKeyword=${criteria.getSearchKeyword() }&pageNum=${pageNum}&fromDate=${criteria.fromDate}&toDate=${criteria.toDate}" />">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pagination.next && pagination.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myOrderCancel.do?searchCondition=${criteria.getSearchCondition() }&searchKeyword=${criteria.getSearchKeyword() }&pageNum=${pagination.endPage + 1 }" />">다음</a></li>
						</c:if>
						<!-- <a class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a> -->
					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 끝 -->
		<br>
		<br>
		<!-- 나의 최근 주문현황 끝 -->
		

		<!-- 공통 마이페이지 바텀 -->
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
		<!-- 공통 마이페이지 바텀 끝 -->

		<!-- Contact End -->


		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
		<!-- js -->
		<!-- DatePicker -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
		<script src="/js/my_OrderCancel.js"></script>
</body>

</html>