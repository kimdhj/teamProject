<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_AddReadInfo.css" rel="stylesheet">

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
								<a class="fs-4 text-dark">${user_name }&nbsp;님 </a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">할인쿠폰</a>&nbsp;&nbsp;<a href=""
									class="">${cou}</a>장
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">마일리지</a>&nbsp;&nbsp;<a href=""
									class="">${user_point }</a>P
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
				<a href="my_cancelSub.do">
			<button type="button" class="btn btn-secondary btn-sm float-end" >구독취소</button>
				</a>
		</p>
		<!-- 여기까지 원래헤더대신 삽입 끝 -->

		<!-- 여기 삽입 -->
		<div id="main_wrapper" class="row">
			<div class="col">
				<div id="top_info" class="row">
					<div id="img_box" class="col-2">
						<img src="${icon.icon_file }" width="100%" height="100%" alt=""
							id="item_img" />
					</div>
					<div class="col" id="text">
						<div class="row" id="title">
							<div id="item_title" class="col-5 row  ">구독</div>
							<div id="btn_box" class="col-7 row gy-1">
								<div class="col-lg col-sm-12" id="cancel_btn">
									<button type="button" class="btn btn-primary">구독 안내</button>
								</div>
								<div class="col-lg col-sm-12" id="modify_btn">
									<a href="my_modifySub.do">
									<button type="button" class="btn btn-info">구독 정보 변경</button>
									</a>
								</div>
							</div>
						</div>
						<div class="row" id="subtitle">월 결제 금액:${sub.sub_info_price }원</div>
						<div class="row" id="itemtText">
							${sub.sub_info_pre_string }
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div id="personal_info" class="row">
					<div id="months">
						<div id="months_name">${user_name }&nbsp;님</div>
						<div id="months_count">${user_sub_count }</div>
						<div id="months_etc">개월 째 이용 중 입니다.</div>
					</div>
					<div id="money">
						<div id="money_title">지금 까지 결제 금액:</div>
						<div id="money_count">${sub.sub_info_price }&nbsp;원</div>

					</div>
					<div id="nowBook">
						<div id="nowBook_title">현재 대여책:</div>
						<div id="nowBook_content">오늘도 놀고 싶다</div>
					</div>
					<div id="nextBook">
						<div id="nowBook_title">현재 대여책:</div>
						<div id="nowBook_content">오늘도 놀고 싶다</div>
					</div>
					<div id="selectType">
						<div id="selectType_title">선택된 장르:</div>
						<div id="selectType_content">무협,소설,로맨스</div>
					</div>
				</div>
				<div id="rec_book" class="row">
					<div class="row g-0 gx-5 align-items-end">
						<div class="col-lg-6">
							<div class="section-header text-start mb-5 wow fadeInUp"
								data-wow-delay="0.1s" style="max-width: 500px;">
								<h1 class="display-5 mb-3">신작</h1>
								<p>도서목록</p>
							</div>
						</div>

					</div>
					<div class="tab-content">
						<!-- 탭1 시작 -->
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<div class="row g-4">
								<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp"
									data-wow-delay="0.1s">
									<div class="product-item">
										<div class="position-relative bg-light overflow-hidden">
											<img class="img-fluid w-100" src="/img/product1-1.jpg" alt="">
											<div
												class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
												월간</div>
										</div>
										<div class="text-center p-4">
											<a class="d-block h5 mb-2" href="">역행자</a> <span
												class="text-primary me-1">15,750</span> <span
												class="text-body text-decoration-line-through">17,500</span>
										</div>
										<div class="d-flex border-top">
											<small class="w-50 text-center border-end py-2"> <a
												class="text-body" href=""><i
													class="fa fa-eye text-primary me-2"></i>상세보기</a>
											</small> <small class="w-50 text-center py-2"> <a
												class="text-body" href=""><i
													class="fa fa-shopping-bag text-primary me-2"></i>Add to
													cart</a>
											</small>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp"
									data-wow-delay="0.3s">
									<div class="product-item">
										<div class="position-relative bg-light overflow-hidden">
											<img class="img-fluid w-100" src="/img/product1-2.jpg" alt="">
											<div
												class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
												New</div>
										</div>
										<div class="text-center p-4">
											<a class="d-block h5 mb-2" href="">Fresh Tomato</a> <span
												class="text-primary me-1">$19.00</span> <span
												class="text-body text-decoration-line-through">$29.00</span>
										</div>
										<div class="d-flex border-top">
											<small class="w-50 text-center border-end py-2"> <a
												class="text-body" href=""><i
													class="fa fa-eye text-primary me-2"></i>View detail</a>
											</small> <small class="w-50 text-center py-2"> <a
												class="text-body" href=""><i
													class="fa fa-shopping-bag text-primary me-2"></i>Add to
													cart</a>
											</small>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp"
									data-wow-delay="0.5s">
									<div class="product-item">
										<div class="position-relative bg-light overflow-hidden">
											<img class="img-fluid w-100" src="/img/product1-3.jpg" alt="">
											<div
												class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
												New</div>
										</div>
										<div class="text-center p-4">
											<a class="d-block h5 mb-2" href="">Fresh Tomato</a> <span
												class="text-primary me-1">$19.00</span> <span
												class="text-body text-decoration-line-through">$29.00</span>
										</div>
										<div class="d-flex border-top">
											<small class="w-50 text-center border-end py-2"> <a
												class="text-body" href=""><i
													class="fa fa-eye text-primary me-2"></i>View detail</a>
											</small> <small class="w-50 text-center py-2"> <a
												class="text-body" href=""><i
													class="fa fa-shopping-bag text-primary me-2"></i>Add to
													cart</a>
											</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>


		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
</body>

</html>