<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_AddReadModify.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->

	<!-- 여기서부터 원래헤더 대신 삽입 common_mypage_header.jsp 이거 한줄 대신 넣는거 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_newheader.jsp"></jsp:include>
	<!-- 요기서부터 동적 헤더 -->
	<!-- 메인페이지 헤더 내용 -->
	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="row col-9">
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-4 text-dark">이승재 님 </a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">할인쿠폰</a>&nbsp;&nbsp;<a href=""
									class="">22</a>장
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">마일리지</a>&nbsp;&nbsp;<a href=""
									class="">223,421,123</a>P
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인페이지 헤더 내용 끝 -->
	<!-- 요기까지 동적헤더 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_sidebar.jsp"></jsp:include>
	<!-- 우측하단 시작 -->
	<div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
		<br>
		<p class="mb-4 fs-5 fw-bold">
			<img src="img/mypage_mainbtn.png" class="rounded float-start"
				alt="...">&nbsp;마이 페이지
			<button type="button" class="btn btn-secondary btn-sm float-end">구독취소</button>
		</p>
		<!-- 여기까지 원래헤더대신 삽입 끝 -->

		<!-- 여기 삽입 -->
		<div id="main_wrapper" class="row">

			<div class="col">
				<div id="top_info" class="row">
					<div id="img_box" class="col-2">
						<img src="/서점로고.ico" width="100%" height="100%" alt=""
							id="item_img" />
					</div>
					<div class="col" id="text">
						<div class="row" id="title">
							<div id="item_title" class="col-4 ">구독상품 이름</div>

						</div>
						<div class="row" id="subtitle">월 결제 금액:20000원</div>
						<div class="row" id="itemtText">
							상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div id="personal_info" class="row">
					<div id="months">
						<div id="months_name">이승재님</div>
						<div id="months_count">10</div>
						<div id="months_etc">개월 째 이용 중 입니다.</div>
					</div>
					<div id="money">
						<div id="money_title">지금 까지 결제 금액:</div>
						<div id="money_count">20000 원</div>

					</div>
					<div id="nowBook">
						<div id="nowBook_title">현재 대여책:</div>
						<div id="nowBook_content">오늘도 놀고 싶다</div>
					</div>
					<div id="nowBook">
						<div id="nowBook_title">대여 수:</div>
						<div id="nowBook_content">
							<input type="number" id="book_count" name="book_count" />권
						</div>
					</div>


					<form id="zipCode" class="row g-3">
						<div class="row" id="zipcode_line">
							<div class="col-auto" id="nowBook_title">주소:</div>
							<div class="col-auto">
								<input readonly type="text" class="form-control" id="zipCodeIn"
									placeholder="우편번호">
							</div>
							<div class="col-auto">
								<button type="button" id="add_find" class="btn btn-primary mb-3">주소
									찾기</button>
							</div>
						</div>
						<div class="row" id="address_line">
							<div class="col-1"></div>
							<div class="col-6 ">
								<input readonly type="text" class="form-control" id="address"
									placeholder="주소">
							</div>
						</div>
						<div class="row" id="addressEtc_line">
							<div class="col-1"></div>
							<div class="col-6 ">
								<input type="text" class="form-control" id="etc"
									placeholder="추가 주소">
							</div>
						</div>
					</form>

					<div id="selectType">
						<div id="selectType_title">선택된 장르</div>
						<div id="selectType_content">
							<div class="row" id="select_items">
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="row g-2" id="btn_sumBox">
						<button type="button" class="btn btn-success col-3">정보 수정</button>
						<div class="col-1"></div>
						<button type="button" class="btn btn-danger col-3">구독 취소</button>
					</div>
				</div>


			</div>

		</div>

		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<script
			src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/js/my_AddReadModify.js"></script>
		<!-- Footer End -->
</body>

</html>