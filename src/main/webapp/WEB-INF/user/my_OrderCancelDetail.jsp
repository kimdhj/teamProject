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
						<fmt:formatDate value="${orderDetail.orders_order_day}" pattern="yyyy-MM-dd HH:mm:ss" />
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
					<th class="bg-light" style="width:15%;">결제수단</th>
					<td style="width:35%;">
						<c:if test="${orderDetail.orders_cache_tool eq 'vbank'}">
							(가상계좌)${orderDetail.orders_vbank_name}
						</c:if>
						<c:if test="${orderDetail.orders_cache_tool eq 'trans'}">실시간계좌이체</c:if>
						<c:if test="${orderDetail.orders_cache_tool eq 'card'}">카드</c:if>
					</td>
					<th class="bg-light" style="width:15%;">환불은행</th>
					<td style="width:35%;">
						<c:if test="${orderDetail.orders_refund_bank eq 04}">
							KB국민은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 23}">
							SC제일은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 39}">
							경남은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 34}">
							광주은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 03}">
							기업은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 11}">
							농협
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 31}">
							대구은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 32}">
							부산은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 02}">
							산업은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 45}">
							새마을금고
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 07}">
							수협
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 88}">
							신한은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 48}">
							신협
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 05}">
							외환은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 20}">
							우리은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 71}">
							우체국
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 90}">
							카카오뱅크
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 89}">
							케이뱅크
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 16}">
							축협
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 37}">
							전북은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 81}">
							하나은행
						</c:if>						
						<c:if test="${orderDetail.orders_refund_bank eq 53}">
							한국씨티은행
						</c:if>						
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
					<td>
						<div class="form-floating mb-3">
							${orderDetail.orders_cache_sum}
						</div>
					</td>
					<th class="bg-light" style="width:15%;">취소상태</th>
					<td style="width:35%;">
						<c:if test="${orderDetail.orders_status eq 'cancelallwait'}">취소/교환/반품대기</c:if>
						<c:if test="${orderDetail.orders_status eq 'cancelallfinish'}">취소/교환/반품완료</c:if>
					</td>
				</tr>
			
			</tbody>
		</table>
		<!-- 문의글 끝 -->
		
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="myOrderCancel.do?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&fromDate=${criteria.fromDate}&toDate=${criteria.toDate}">
				<button class="btn btn-primary me-md-2" type="button" id="requestListBtn">목록으로</button>
			</a>
			<!-- <button class="btn btn-primary me-md-2" type="button" onclick="checkArrival()">배송조회</button> -->
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
		<script src="/js/my_OrderCancleDetail.js"></script>
		
</body>

</html>