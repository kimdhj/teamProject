<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="./header.jsp"></jsp:include>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="./css/mypage_PurchaseReview.css" rel="stylesheet">
<link href="./css/star_style.css" rel="stylesheet">
<!-- include summernote css/js-->
</head>
<!-- Page Header Start -->
<div class="container-fluid page-header wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
		<nav aria-label="breadcrumb animated slideInDown">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
				<li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
				<li class="breadcrumb-item text-dark active" aria-current="page">Contact
					Us</li>
			</ol>
		</nav>
	</div>
</div>S
<!-- Page Header End -->

<!-- Contact Start -->
<div class="container-xxl py-6">
	<div class="container">
		<div class="section-header text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 500px;">
			<h1 class="display-5 mb-3">My Page</h1>
			<p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum
				diam justo sed rebum vero dolor duo.</p>
		</div>
		<!-- 마이페이지 메인 헤더 -->
		<div class="row g-5 justify-content-center">
			<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
				<div
					class="bg-light text-black d-flex flex-column justify-content-center h-100 p-3">

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
				</div>
			</div>
		</div>
		<!-- 마이페이지 메인 헤더 끝 -->

		<!-- 마이페이지 메인 바디 -->
		<div class="row g-5 justify-content-center">
			<div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
				<div
					class="bg-light text-black d-flex flex-column justify-content-center h-100 p-5">

					<!-- Split dropend button -->
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">주문관리</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">주문/배송조회</button></li>
							<li><button class="dropdown-item" type="button">취소/교환/반품조회</button></li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">나의지갑</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">할인쿠폰/마일리지</button></li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">나의콘텐츠</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">관심작가</button></li>
							<li><button class="dropdown-item" type="button">나의리뷰</button></li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">문의내역</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">나의문의</button></li>
							<li><button class="dropdown-item" type="button">문의하기</button></li>
						</ul>
					</div>
					<br>
					<br>
					<br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">회원정보관리</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">회원정보
									수정</button></li>
							<li><button class="dropdown-item" type="button">비밀번호
									변경</button></li>
							<li><button class="dropdown-item" type="button">나의
									주소록</button></li>
							<li><button class="dropdown-item" type="button">회원탈퇴</button></li>
						</ul>
					</div>
					<br>
					<!-- 슬립 드롭다운 끝 -->
				</div>
			</div>
			<!-- 우측하단 시작 -->
			<div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
				<!-- 여기 삽입 -->
				<!-- 리뷰 작성 페이지 -->
				<div class="row">
					<div class="col-11">
						<div class="row mb-2">
							<h3 id="review_name">my Review</h3>
						</div>
						<div class="row review_box">
							<div class="col-2 review_img">
								<img width="100%" src="./img/product1-8.jpg">
							</div>
							<div class="col-7">
								<div class="row mt-3">
									<h4 id="review_title">해리포터</h4>
								</div>
								<div class="row">
									<div class="col-12">저자</div>
								</div>
								<div class="row">
									<div class="col-12">출판사</div>
								</div>
								<div class="row">
									<div class="col-12">출판일자</div>
								</div>
								<div class="row">
									<div class="col-12">
										<form name="myform" id="myform" method="post" action="./save"> 별점
											<fieldset>
												<input type="radio" name="rating" value="5" id="rate1">
													<label for="rate1">⭐</label>
												<input type="radio" name="rating" value="4" id="rate2">
													<label for="rate2">⭐</label>
												<input type="radio" name="rating" value="3" id="rate3">
													<label for="rate3">⭐</label>
												<input type="radio" name="rating" value="2" id="rate4">
													<label for="rate4">⭐</label>
												<input type="radio" name="rating" value="1" id="rate5">
													<label for="rate5">⭐</label>
											</fieldset>
										</form>
									</div>
								</div>
								<div class="row">
									<div class="col-12">가격</div>
								</div>
							</div>
							<div class="col-3">
								<div class="row mt-3">
									<a href="#">다른 리뷰 보러가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 리뷰 작성 칸 -->
				<div class="row">
					<div class="col-11">
						<div class="row">
							<h3 id="review_name2">리뷰 작성</h3>
							<div class="col-12 review_hr"></div>
						</div>
						<div class="row" id="review_textarea">
							<div class="summernote"></div>
						</div>
					</div>
					<div col="col-1"></div>
				</div>
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6"></div>
					<div class="col-2" id="review_btn">
						<button>등록</button>
						<button>취소</button>
					</div>
				</div>
			</div>
			<!-- 우측하단 끝 -->
		</div>
		<!-- 마이페이지 메인 바디 끝 -->
	</div>
</div>

<jsp:include page="./footer.jsp"></jsp:include>
