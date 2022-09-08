<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/book_Finish.css" rel="stylesheet">
</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div class="row" id="fin_wrapper">
		<div class="col-2"></div>
		<div id="main_box" class="col p-5 mb-5 rounded">
			<div id="main_title" class="row fs-2 justify-content-center">결제가
				완료되었습니다.</div>
			<div class="row mt-5 justify-content-between" id="main_num">
				<div class="col-auto fs-4" id="num_title">주문번호</div>
				<div class="col-auto fs-4" id="num_content">${result.orders_seq}</div>
			</div>
			<div class="row mt-5 justify-content-between" id="main_day">
				<div class="col-auto fs-4" id="day_title">주문날짜</div>
				<div class="col-auto fs-4" id="day_content">
					<fmt:formatDate value="${result.orders_order_day}"
						pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="row mt-5 justify-content-between" id="main_delivery">
				<div class="col-auto fs-4" id="delivery_title">배송지</div>
				<div class="col-auto fs-4" id="delivery_content">${result.orders_address}
					${result.orders_remainaddress}</div>
			</div>
			<div class="row mt-5 justify-content-between" id="main_book">
				<div class="col-auto fs-4" id="book_title">책 제목</div>
				<div class="col-auto fs-4" id="book_content">${result.orders_title}</div>
			</div>
			<div class="row mt-5 justify-content-between" id="main_cash">
				<div class="col-auto fs-4" id="cash_title">총 결제 금액</div>
				<div class="col-auto row fs-4" id="cash_content">

					<div class="col-auto p-0 fs-4" id="cash_mid">
						<fmt:formatNumber value="${result.orders_cache_sum}"
							pattern="#,###" />
					</div>
					<div class="col-auto p-0 fs-4" id="cash_suf">원</div>
				</div>
			</div>
			<div class="row mt-5 justify-content-between" id="main_tool">
				<div class="col-auto fs-4" id="tool_title">결제 수단</div>
				<div class="col-auto fs-4" id="tool_content">
					<c:if test="${result.orders_cache_tool=='vbank'}">
                    	가상계좌
                    </c:if>
					<c:if test="${result.orders_cache_tool=='card'}">
                    	카드
                    </c:if>
					<c:if test="${result.orders_cache_tool=='trans'}">
                    	실시간 계좌 이체
                    </c:if>
					<c:if test="${result.orders_cache_tool=='phone'}">
                    	핸드폰 결제
                    </c:if>
					<c:if test="${result.orders_cache_tool=='point'}">
                    	포인트 결제
                    </c:if>

				</div>
			</div>
			<c:if test="${result.orders_cache_tool=='vbank'}">
				<div class="row mt-5 justify-content-between" id="main_count">
					<div class="col-auto fs-4" id="count_title">입금 계좌번호</div>
					<div class="col-auto fs-4" id="count_content">${result.orders_vbank_num}</div>
				</div>
				<div class="row mt-5 justify-content-between" id="main_bank">
					<div class="col-auto fs-4" id="bank_title">입금 은행</div>
					<div class="col-auto fs-4" id="bank_content">${result.orders_vbank_name}</div>
				</div>
				<div class="row mt-5 justify-content-between" id="main_bank">
					<div class="col-auto fs-4" id="bank_title">입금 기한</div>
					<div class="col-auto fs-4" id="bank_content"><fmt:formatDate value="${result.orders_vbank_Date}"
						pattern="yyyy-MM-dd" /></div>
				</div>
			</c:if>
			<div class="row mt-5 mb-5 justify-content-center" id="main_btns">
				<div class="col-auto " id="btn_my">
					<button type="button"
						class="bg-gray fs-4 border text-white border-gray rounded-pill mb-3 p-3">마이페이지</button>
				</div>
				<div class="col-1"></div>
				<div class="col-auto " id="btn_main">
					<a href="/index.do"><button type="button"
							class="bg-dark fs-4 text-white rounded-pill mb-3 p-3">메인페이지</button></a>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>





	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
<script>
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
	history.go(1); 
}

</script>
	<!-- Footer End -->
</body>

</html>