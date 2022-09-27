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
<link href="/css/cart_Cart.css" rel="stylesheet">
</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->

	<div class="row" id="cart_wrapper">
		<div class="col-3 text-center align-items-center  m-5">
			<div class="row">
				<div class="col"></div>
				<div id="img_box" class="col-6 align-items-center  ">
					<img width="100%" height="100%" id="use_img"
						class="rounded-circle border-1 border border-dark"
						src="${list[0].book_bigimgURL}" />

				</div>
				<div class="col"></div>
			</div>
			<div class="row text-center mt-3" id="profile_text">
				<div class="col"></div>
				<div id="text_Box" class="col-auto p-0">${user.user_name}</div>
				<div id="text_unit" class="col-auto p-0">님</div>
				<div class="col"></div>
			</div>
			<div class="row text-center mt-1" id="profile_text">
				<div class="col"></div>
				<div id="text_Box" class="col-auto p-0"><fmt:formatNumber value="${user.user_point}" pattern="#,###" />P</div>
				<div id="text_Box" class="col-auto p-0">|</div>
				<div id="text_unit" class="col-auto p-0">
					<c:if test="${user.user_role =='ROLE_MEMBER'}">
                    회원
                    </c:if>
					<c:if test="${user.user_role =='ROLE_SUB'}">
                    구독자
                    </c:if>
					<c:if test="${user.user_role =='ROLE_ADMIN'}">
                     관리자
                    </c:if>
				</div>
				<div class="col"></div>
			</div>


		</div>
		<div class="col p-0">
			<div class="row" id="title">
				<div class="col-auto fs-2 h2 m-0">장바구니</div>
				<div class="col"></div>
				<div class="col-auto d-flex align-items-center" id="cancel_box">
					<button id="seldel" class="col-auto btn-warning btn rounded-pill  ">선택
						삭제</button>
				</div>
			</div>
	<form action="bookpay.do" method="get">
			<div class="row" id="main_items">
				<c:forEach var="it" items="${list}">
					<div class="row border-2 mt-2 border-top border-gray" id="line"></div>
					<div id="main_item" class="row mt-2 p-0 main_item">
						<input type="hidden" name="book_seq" value="${it.book_seq}"
							id="boseq" /> <input type="hidden" name="book_count" value="1"
							id="bocount" />
						<div class="col-1 align-self-center justify-content-center ">

							<div
								class="row form-check d-flex justify-content-center align-items-center p-0">

								<input class="form-check-input m-0 p-0 " type="checkbox"
									value="" id="flexCheckDefault">

							</div>

						</div>
						<div class="col-3" id="img_line">
							<div class="row" id="img_btns">
								<img src="${it.book_bigimgURL}" width="100%" height="100%" />
							</div>
						</div>
						<div class="col d-flex flex-column justify-content-between"
							id="tex_line">
							<div class="row info_boxs">
								<div id="title" class="row">${it.book_title}</div>
								<div id="writer" class="row">${it.book_author}</div>
							</div>
							<div class="row count_check">
								<div class="col-auto row" id="count_boxs">
									<div class="col-auto" id="minus_box">
										<button type="button" class="minus" id="minus" class="">-</button>
									</div>

									<div class="col-auto align-self-center bookcount" id="text_box">
										1</div>
									<div class="col-auto" id="plus_box">
										<button type="button" class="plus" id="plus">+</button>
									</div>

								</div>
								<div class="col"></div>
								<div class="col-auto row" id="money_count">
									<div class="hide" id="book_solo">
										<fmt:formatNumber value="${it.book_price}" pattern="#,###" />
									</div>
									<div class="col-auto p-0 money">160000</div>
									<div class="col-auto p-0" id="money_unit">원</div>
								</div>
							</div>

						</div>
					</div>

				</c:forEach>
			</div>
			<div class="row mt-5" id="item_sums">
				<div class="row justify-content-between pe-5 me-5 ps-5 ms-5">
					<div id="sumt_title" class="col-auto">제품 합계</div>
					<div id="sumt_money" class="col-auto row">
						<div class="col-auto p-0" id="count">272500</div>
						<div class="col-auto  p-0" id="unit">원</div>
					</div>
				</div>
				<div id="delivery"
					class="row justify-content-between mt-3 mb-5 pe-5 me-5 ps-5 ms-5">
					<div id="sumt_title" class="col-auto">배송비</div>
					<div id="sumt_money" class="col-auto row">
						<div class="col-auto p-0" id="delivery_count">2500</div>
						<div class="col-auto  p-0" id="unit">원</div>
					</div>
				</div>
				<div class="row p-0 border-2 mt-2 border-top border-gray" id="line"></div>
				<div
					class="row justify-content-between mt-5 mb-5 pe-5 me-5 ps-5 ms-5">
					<div id="sumt_title" class="col-auto">결제 금액</div>
					<div id="sumt_money" class="col-auto row">
						<div class="col-auto p-0 count" id="sum_count">270000</div>
						<div class="col-auto  p-0" id="unit">원</div>
					</div>
				</div>
				<div class="row justify-content-end mb-5 p-0">

					<button type="button" onclick="location.href='/booklist.do'"
						class="col-auto p-2 btn rounded-pill border-1 border-gray border p-1 bg-gray me-5">상품
						둘러보기</button>
					<input type="submit"
						class="col-auto p-2 btn rounded-pill border-1 border-gray border p-1 bg-gray" value="결제하기"></input>

				</div>
			</div>
			<input type="number" class="hide" name="iscart" value="1"/> 
			</form>
		</div>
		
		<div class="col-1 p-0"></div>
	</div>




	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="/js/cart_Cart.js"></script>
	<!-- Footer End -->
</body>

</html>