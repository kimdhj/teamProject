<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

					<form method="post" action="/bookfinish.do" id="payfin">
						<!-- Page Header End -->
						<!-- 여기서부터 바디 작업 하면됨 -->
						<div class="row" id="main_wrapper">
							<div class="col-2" id="left_blank"></div>
							<div class="col-8" id="middle_contents">
								<div class="row border-bottom border-2 border-dark">
									<h1 class="col-4">도서 결제</h1>
									<div class="col"></div>
                                    <div class="col-4"></div>
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

											<div class="row border-bottom border-2 border-dark" id="formoondolyer">
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
														<input type="number" class="border-0 book_count"
															name="book_count" id="book_count"
															value="${li.order_bookList_count}"
															style="text-align: center" />
														<input type="hidden" class="border-0 book_seq" name="book_seq"
															id="book_seq" value="${li.book_seq}"
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
										<input type="number" value="0" name="orders_point" id="usePoint"
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
										<input type="number" class="hide" value="0" name="orders_coupon_effect"
											id="orders_coupon_effect" />
										<select id="coupon">
											<option data-seq="0" value="0">쿠폰을 선택하세요</option>
											<c:forEach var="co" items="${coupon}">
												<option data-seq="${co.user_coupon_seq}"
													value="${co.user_coupon_effect}">${co.user_coupon_name}</option>

											</c:forEach>
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
											- <span id="deliveryPrice2">2,500</span> 원
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
											<span id="sumsumsum">0</span>+<span id="delivery">3,000</span>원
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

								<div class="row d-flex">
									<ul class="col-auto" id="whisper">
										<li>본사는 회원님의 실수로 적용되지 않은 할인은 적용시켜드리지 못합니다.</li>
										<li>혹시나 잘 못 적용해서 혜택을 보지 못하셨다면 유감의 말씀을 전합니다.</li>
										<li>환불계좌 입력 실수 시 고객센터로 연락 바랍니다</li>
									</ul>
                  <div class="col"></div>
                  <div class="col-auto">
                        <button id="termsopen"  type="button">약관 보기</button>
                  </div>
            
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
									<input type="text" id="orders_name" name="orders_name" class="col-4"
										value="${user.user_name}" />
									<div class="col-2"></div>
									<div class="col-2"></div>
								</div>
								<div class="row" style="margin-top: 3%">
									<div class="col-2"></div>
									<p class="col-2" id="deliver">연락처</p>
									<div class="col-6">
										<div class="row">

											<input type="text" name="orders_phone" id="phone" value="${user.user_phone}"
												class="col" />
											<span id="phalert"></span>
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
												<option value="0">주소를 선택 해주세요</option>
												<c:forEach var="de" items="${delivery}">
													<option value="${de.my_delivery_seq}">${de.my_delivery_nickname}
													</option>

												</c:forEach>
											</select>
											<div class="col-1"></div>

										</div>
									</div>
									<div class="col-2"></div>
								</div>
								<div class="row" style="margin-top: 3%">
									<div class="col-2"></div>
									<p class="col-2" id="deliver">주&nbsp;&nbsp;소</p>
									<div class="col-6">
										<div class="row">
											<input type="text" id="zipcode" name="orders_zipcode" name="orders_zipcode"
												value="${user.user_zipcode}" class="col" />
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
								<div class="row" style="margin-top: 3%">
									<div class="col-2"></div>
									<p class="col-2" id="deliver">환불 계좌</p>
									<div class="col-6 p-0">
										<input class="w-100" type="text" name="orders_refund_num" id="refund_num" />
									</div>
									<div class="col-2"></div>
								</div>
								<div class="row" style="margin-top: 3%">
									<div class="col-2"></div>
									<p class="col-2" id="deliver">은행 선택</p>
									<div class="col-6">
										<div class="row">
											<select id="refund_bank" name="orders_refund_bank" class="col">
												<option value="0">은행을 선택해주세요</option>
												<option value="04">KB국민은행</option>
												<option value="23">SC제일은행</option>
												<option value="39">경남은행</option>
												<option value="34">광주은행</option>
												<option value="03">기업은행</option>
												<option value="11">농협</option>
												<option value="31">대구은행</option>
												<option value="32">부산은행</option>
												<option value="02">산업은행</option>
												<option value="45">새마을금고</option>
												<option value="07">수협</option>
												<option value="88">신한은행</option>
												<option value="48">신협</option>
												<option value="05">외환은행</option>
												<option value="20">우리은행</option>
												<option value="71">우체국</option>
												<option value="90">카카오뱅크</option>
												<option value="89">케이뱅크</option>
												<option value="16">축협</option>
												<option value="37">전북은행</option>
												<option value="81">하나은행</option>
												<option value="53">한국씨티은행</option>

											</select>
											<div class="col-1"></div>

										</div>
									</div>
									<div class="col-2"></div>
								</div>
								<div>
									<br /> <br />
								</div>
								<div class="row">
									<div class="col-2" id="big_big">결제 정보</div>
									<div class="row d-flex">
										<input class="col-auto" type="radio" name="orders_cache_tools" value="카드"
											checked />카드
										<input class="col-auto" type="radio" name="orders_cache_tools"
											value="계좌이체" />실시간
										계좌이체 <input class="col-auto" type="radio" name="orders_cache_tools"
											value="가상계좌" />무통장
										입금 <input class="col-auto" type="radio" name="orders_cache_tools"
											value="핸드폰결제" />핸드폰
										결제
									</div>

								</div>

								<div>
									<br /> <br />
								</div>
								<div class="row">
									<div class="col-4"></div>
									<div class="col">
										<input type="button" id="paystart" name="payAccess" value="결제" />
									</div>
									<div class="col">
										<input type="button" onclick="window.history.back()" name="payCancel" value="취소" />
									</div>
								</div>
								<div>
									<br /> <br />
								</div>
							</div>

							<input type="hidden" name="orders_email" id="orders_email" value="${user.user_email}" />
							<input type="hidden" name="orders_vbank_name" id="vbank_name" />
							<input type="hidden" name="orders_cache_tool" value="카드" id="cache_tool" />
							<input type="hidden" name="orders_vbank_num" id="orders_vbank_num" />
							<input type="datetime-local" class="hide" name="orders_vbank_Date_String"
								id="orders_vbank_Date" />
							<input type="hidden" name="orders_title" id="orders_title" />
							<input type="hidden" name="orders_cache_uid" id="orders_cache_uid" />
							<input type="hidden" name="orders_cache_sum" id="orders_cache_sum" />
							<input type="hidden" name="orders_status" id="orders_status" />
							<input type="number" value="0" class="hide" name="orders_add_point" id="orders_add_point" />

							<input type="hidden" value="${user.user_id}" name="user_id" id="orders_status" />
							<input type="number" class="hide" value="${iscart}" name="iscart" id="iscart" />

							<input type="number" value="0" class="hide" name="couponselcode" id="couponselcode" />
							<!-- 구독가격, 쿠폰가격 하이딩 -->

						</div>
					</form>



					<!-- Footer Start -->
					<!-- Common Footer include -->
					<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
					<!-- 여기에 js관련  -->
					<!-- iamport.payment.js -->
					<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
					<!--다음 주소  -->
					<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="/js/jquery.number.min.js"></script>

					<script src="/js/book_Pay.js"></script>
					<script src="/js/import_cache.js"></script>
					<!-- Footer End -->
				</body>

				</html>