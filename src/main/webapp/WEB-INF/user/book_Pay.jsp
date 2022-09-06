<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/book_Pay.css" rel="stylesheet" />
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div class="row" id="main_wrapper">
		<div class="col-2" id="left_blank"></div>
		<div class="col-8" id="middle_contents">
			<div class="row border-bottom border-2 border-dark">
				<h1 class="col-4">도서 결제</h1>
				<div class="col"></div>
			</div>
			<div class="row border-bottom border-2 border-dark">
				<div class="col-2">주문 일자 :</div>
				<div class="col" id="order_date">주문 일자 입니다.</div>

			</div>
			<div class="row border-bottom border-2 border-dark">
				<div class="col-4 fs-4">상품 정보</div>
				<div class="col"></div>
				<div class="col-2 fs-4 text-end">수량</div>
				<div class="col-2 fs-4 text-end me-4">금액</div>
			</div>
			<div id="items">
				<c:forEach var="li" items="${list}">
					<div id="item">

						<div class="row border-bottom border-2 border-dark"
							id="formoondolyer">
							<div class="col-2">
								<img id="bookimg" src="${li.book_bigimgURL}" />
							</div>
							<div class="col d-flex flex-column">
								<div class="col-12">&nbsp;</div>
								<div class="col-12">&nbsp;</div>
								<div class="col-12 d-flex">
									도서 번호 :
									<div id="bookNumber">${li.book_isbn}</div>
								</div>
								<div class="col-12 d-flex">
									도서 제목 :
									<div id="bookName">${li.book_title}</div>
								</div>
								<div class="col-12 d-flex">
									저 자 :
									<div id="bookMaker">${li.book_author}</div>
								</div>
							</div>
							<div class="col-2 d-flex flex-row align-items-center">
								<div class="row">
									<input type="number" class="border-0 book_count" disabled
										name="book_count" id="book_count"
										value="${li.order_bookList_count}" style="text-align: center" />
									<input type="hidden" class="border-0 book_seq" disabled
										name="book_seq" id="book_seq" value="${li.book_seq}"
										style="text-align: center" />
								</div>
							</div>
							<div class="col-2 d-flex flex-row align-items-center text-end">
								<div class="col"></div>

								<div class="col-auto p-0 bookPrices" id="bookPrices">
									
           								<fmt:formatNumber value="${li.book_price}" pattern="#,###" />
         							
									
        
									
									
								</div>
								<div class="col-auto p-0">원</div>
							</div>
						</div>
						<!-- formoondolyer -->
						<div>
							<br />
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-4 fs-4" id="big_big">할인</div>
				<div class="col-4 ps-0">
					<input type="text" name="usePoint" id="usePoint"
						placeholder="포인트 입력" style="text-align: center" />
				</div>
				<div class="col-4 text-end pe-4">
					- <span class="pe-1" id="usePointResult">0</span>P
				</div>
			</div>
			<div class="row" id="usable_point">
				<div class="col-4"></div>
				<p class="col-4 ps-0">
					가용 포인트 : <span id="myPoint">${user.user_point}</span>P
				</p>
				<div class="col-4"></div>
			</div>
			<div class="row" id="whysoclose">
				<div class="col-4"></div>
				<div class="col ps-0">
					<select name="orders_coupon_effect" id="coupon">
						<option>쿠폰을 선택하세요</option>
						<option value="20" id="new_user_coupon">신규 유저 쿠폰</option>
						<option value="50" id="my_friend_coupon">추천인 특별 쿠폰</option>
						<option value="100" id="roulette_coupon">룰렛 5등 당첨 쿠폰</option>
					</select>
				</div>
				<div class="col-4 text-end me-1">
					<div>
						- <span id="coupon_result">0</span>%
					</div>
				</div>
			</div>
			<div class="row border-bottom border-2 border-dark">
				<br />
			</div>
			<div>
				<br />
			</div>
			<div class="row">
				<div class="col-4">
					<div class="fs-4" id="big_big">합계</div>
				</div>
				<div class="col-4">
					<div id="deliveryPrice1">배송비</div>
				</div>
				<div class="col-4 text-end me-0">
					<div>
						- <span id="deliveryPrice2">3,000</span> 원
					</div>
				</div>
			</div>
			<div>
				<br />
			</div>
			<div class="row border-bottom border-2 border-dark">
				<div class="col-4"></div>
				<div class="col-4">
					<div>최종 결제 금액</div>
				</div>
				<div class="col-4 text-end me-0">
					<div>
						<span id="sumsumsum">0</span>원
					</div>
				</div>
				<div>
					<br />
				</div>
			</div>
			<div>
				<br />
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
					<div>구매 적립금</div>
				</div>
				<div class="col-4 text-end me-0">
					<div>
						<span id="addPoint">30</span> P
					</div>
				</div>
			</div>
			<div>
				<br />

			</div>

			<div class="row">
				<ul id="whisper">
					<li>본사는 회원님의 실수로 적용되지 않은 할인은 적용시켜드리지 못합니다.</li>
					<li>혹시나 잘 못 적용해서 혜택을 보지 못하셨다면 유감의 말씀을 전합니다.</li>
					<li>위와 같은 경우가 발생한다면 김동현 조장님께서 한 잔의 커피를 사드립니다.</li>
				</ul>
			</div>
			<div class="row border-bottom border-2 border-dark">
				<br />
			</div>
			<div>
				<br />
			</div>
			<div class="row">
				<div class="col-2" id="big_big">배송지 입력</div>
				<p class="col-2" id="deliver">수령인</p>
				<input type="text" name="orders_name" class="col-4"
					value="${user.user_name}" />
				<div class="col-2"></div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-2"></div>
				<p class="col-2" id="deliver">연락처</p>
				<div class="col-6">
					<div class="row">
						<select id="phone0" class="col-3">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> &nbsp;-&nbsp;<input type="text" id="phone1"
							value="${fn:substring(user.user_phone,3,7)}" class="col" />
						&nbsp;-&nbsp;<input type="text" id="phone2"
							value="${fn:substring(user.user_phone,7,11)}" class="col" /> <input
							type="hidden" name="orders_phone" value="${user.user_phone}" />
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-2"></div>
				<p class="col-2" id="deliver">배송지명</p>
				<div class="col-6">
					<div class="row">
						<select id="home" class="col">
							<option value="">우리집</option>
							<option value="">우리집앞집</option>
						</select>
						<div class="col-1"></div>
						<button type="button" id="addhome" name="addhome" class="col">
							배송지 추가</button>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-2"></div>
				<p class="col-2" id="deliver">주&nbsp;&nbsp;소</p>
				<div class="col-6">
					<div class="row">
						<input type="text" id="zipcode" name="zipcode"
							name="orders_zipcode" value="${user.user_zipcode}" class="col" />
						<div class="col-1"></div>
						<button type="button" id="adbtn" class="col">우편번호</button>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 2%">
				<div class="col-4"></div>
				<div class="col p-0">
					<input type="text" class="w-100" name="orders_address"
						value="${user.user_address}" id="orders_address" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-2"></div>
				<p class="col-2" id="deliver">상세주소</p>
				<div class="col-6 p-0">
					<input type="text" class="w-100" name="orders_remainaddress"
						value="${user.user_remain_address}" id="orders_remainaddress" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-2"></div>
				<p class="col-2" id="deliver">배달 요청사항</p>
				<div class="col-6 p-0">
					<input type="text" name="orders_recommend" id="input_text_size" />
				</div>
				<div class="col-2"></div>
			</div>
			<div>
				<br /> <br />
			</div>
			<div class="row">
				<div class="col-2" id="big_big">결제 정보</div>
				<form class="col">
					<input type="radio" name="orders_cache_tool" value="신용카드" checked />신용카드
					<input type="radio" value="실시간 계좌이체" />실시간 계좌이체 <input
						type="radio" value="무통장 입금" />무통장 입금 <input type="radio"
						value="PAYCO" />PAYCO <input type="radio" value="네이버페이" />네이버페이
				</form>
			</div>
			<div>
				<br /> <br />
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col">
					<input type="submit" name="payAccess" value="결제" />
				</div>
				<div class="col">
					<input type="button" name="payCancel" value="취소" />
				</div>
			</div>
			<div>
				<br /> <br />
			</div>
		</div>
		<!-- 구독가격, 쿠폰가격 하이딩 -->
		<div class="col-2" id="right_blank">
			<div class="hide" id="subPrice">30000</div>
			<div class="hide" id="new_user_coupon_val">30000</div>
			<div class="hide" id="my_friend_coupon_val">40000</div>
			<div class="hide" id="roulette_coupon_val">50000</div>
			<div class="hide" id="bookPrice">20000</div>
		</div>
	</div>




	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<!--다음 주소  -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/jquery.number.min.js"></script>
	<script src="/js/import_cache.js"></script>
	<script src="/js/book_Pay.js"></script>
	<!-- Footer End -->
</body>
</html>