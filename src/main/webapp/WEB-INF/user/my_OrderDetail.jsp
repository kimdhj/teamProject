<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
	

		<!-- 여기 삽입 -->
		<div class="container">
			<div class="row">
				<div class="col-8"></div>
				<div class="col-4">
					<!-- <button type="button" class="btn btn-warning">고객문의 바로가기</button> -->
				</div>
			</div>
		</div>

		<!-- 문의글 시작 -->
		<table class="table">
			<thead>

			</thead>
			<tbody>
				<tr>
					<th class="bg-light" style="width:15%;">주문번호</th>
					<td style="width:35%;">${orderDetail.orders_seq}</td>
					<th class="bg-light" style="width:15%;">주문날짜</th>
					<td style="width:35%;">
						<fmt:formatDate value="${orderDetail.orders_order_day}" pattern="yyyy-MM-dd HH:ss" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light align-middle">주문내용</th>
					<td colspan="3">
						<div class="form-floating mb-3">
							${orderDetail.orders_title}
						</div>
					</td>
				</tr>
				<tr>
					<th class="bg-light" style="width:15%;">배송지정보</th>
					<td style="width:35%;">${orderDetail.orders_address}</td>
					<th class="bg-light" style="width:15%;">배송상태</th>
					<td style="width:35%;">
						<c:if test="${orderDetail.orders_status eq 'paid'}">결제완료</c:if>
						<c:if test="${orderDetail.orders_status eq 'ready'}">배송준비중</c:if>
						<c:if test="${orderDetail.orders_status eq 'arrival'}">배송완료</c:if>
					</td>
				</tr>
				<tr>
					<th class="bg-light" style="width:15%;">택배사</th>
					<td style="width:35%;">
						<c:if test="${orderDetail.orders_delivery_company eq 0}">우체국택배</c:if>
						<c:if test="${orderDetail.orders_delivery_company eq 1}">CJ대한통운</c:if>
						<c:if test="${orderDetail.orders_delivery_company eq 2}">로젠택배</c:if>
					</td>
					<th class="bg-light" style="width:15%;">운송장번호</th>
					<td style="width:35%;">${orderDetail.orders_delivery}</td>
				</tr>
				<tr>
					<th scope="row" class="bg-light align-middle">결제금액</th>
					<td colspan="3">
						<div class="form-floating mb-3">
							${orderDetail.orders_cache_sum}
						</div>
					</td>
				</tr>
			
			</tbody>
		</table>
		<!-- 문의글 끝 -->
		
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="myOrder.do?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}">
				<button class="btn btn-primary me-md-2" type="button" id="requestListBtn">목록으로</button>
			</a>
			<button class="btn btn-primary me-md-2" type="button" onclick="checkArrival()">배송조회</button>
		</div>
		<input type="hidden" id="orders_seq" name="orders_seq" value="${orderDetail.orders_seq}" />
		<input type="hidden" id="orders_delivery" name="orders_delivery" value="${orderDetail.orders_delivery}" />	
		<input type="hidden" id="orders_delivery_company" name="orders_delivery_company" value="${orderDetail.orders_delivery_company}" />	
		
		

		<!-- 공통 마이페이지 바텀 -->
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
		<!-- 공통 마이페이지 바텀 끝 -->

		<!-- Contact End -->


		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<!-- Footer End -->
		<script src="/js/my_OrderDetail.js"></script>
		
</body>

</html>