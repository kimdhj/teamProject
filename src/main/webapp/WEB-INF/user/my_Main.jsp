<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- 나의 최근 주문현황 5개만 -->
	<br> 나의 최근 주문목록
	<a>3</a>건
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
				<c:forEach var="myOrder" items="${getMyMainOrders}">
					<tr>
						<th scope="row">${myOrder.orders_seq}</th>
						<td>${myOrder.orders_title}</td>
						<td>${myOrder.orders_name}</td>
						<td><fmt:formatDate value="${myOrder.orders_order_day}"
								pattern="yyyy-MM-dd" /></td>
						<td><c:if test="${myOrder.orders_status eq 'paid'}">결제완료</c:if>
							<c:if test="${myOrder.orders_status eq 'ready'}">배송준비</c:if> <c:if
								test="${myOrder.orders_status eq 'arrival'}">배송완료</c:if></td>
						<td><a
							href="/myOrderDetail.do?orders_seq=${myOrder.orders_seq}">
								<button type="button" class="btn btn-warning" id="checkArrival"
									name="checkArrival">조회</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- 나의 최근 주문현황 끝 -->
	<div class="container">
		<!-- 관심상품 -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="myRecentNoticeTab" data-bs-toggle="tab"
					data-bs-target="#myRecentNotice" type="button" role="tab" aria-controls="myRecentNotice"
					aria-selected="true">공지사항</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myCartTab" data-bs-toggle="tab"
					data-bs-target="#myCart" type="button" role="tab"
					aria-controls="myCart" aria-selected="false">내보관함</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="myRecentRequestTab" data-bs-toggle="tab"
					data-bs-target="#myRecentRequest" type="button" role="tab"
					aria-controls="myRecentRequest" aria-selected="false">최근문의</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="myRecentNotice" role="tabpanel" aria-labelledby="myRecentNoticeTab">
				<!-- 안내테이블 -->
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col"><img src="/img/myRecentNotice.png"
								class="rounded float-first" alt="...">&nbsp;최신 공지사항 :
								${getRecentNotice.notice_title}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea rows=5 style="width: 100%;" readonly>${getRecentNotice.notice_content}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 안내테이블 끝 -->
			</div>
			<div class="tab-pane fade" id="myCart" role="tabpanel" aria-labelledby="myCartTab">
				<!-- 장바구니 테이블 -->
				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>
								<th style="width:20%;">표지</th>
								<th style="width:30%;">제목</th>
								<th style="width:10%;">작가</th>
								<th style="width:10%;">출판사</th>
								<th style="width:20%;">출판일</th>
								<th style="width:10%;">가격</th>
							</tr>
						</thead>
						<tbody id="tbodyCartTab">
						</tbody>
					</table>
				</div>
				<!-- 장바구니 테이블 끝 -->
			</div>
			
			<div class="tab-pane fade" id="myRecentRequest" role="tabpanel" aria-labelledby="myRecentRequestTab">
				<!-- 최근문의 3개 테이블 -->
				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>
								<th style="width:5%;">No</th>
								<th style="width:40%;">문의글 제목</th>
								<th style="width:20%;">답변상태</th>
								<th style="width:30%;">작성날짜</th>
							</tr>
						</thead>
						<tbody id="tbodyRequestTab">
						</tbody>
					</table>
				</div>
				<!-- 최근문의 3개 테이블 끝 -->
			</div>
		</div>
		<input type="hidden" id="user_id" name="user_id" value="${sessionUserId}" />
	</div>
	
	<!-- 모달 -->
	<!-- Button trigger modal -->
	<div class="container" id="modalContainer">
		
	</div>


	<!-- 공통 마이페이지 바텀 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
	<!-- 공통 마이페이지 바텀 끝 -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- Footer End -->
	<script src="/js/my_Main.js"></script>
</body>

</html>