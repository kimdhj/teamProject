<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_AddReadCancel.css" rel="stylesheet">

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
							<div id="item_title" class="col-4 ">구독</div>

						</div>
						<div class="row" id="subtitle">월 결제 금액:${sub.sub_info_price }원</div>
						<div class="row" id="itemtText">
							${sub.sub_info_pre_string }
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div id="personal_info" class="row">
					<div class="align-items-center" id="months">
						<div id="months_name">${user_name }&nbsp;님</div>
						<div id="months_count">${user_sub_count }</div>
						<div id="months_etc">개월 째 이용 중 입니다.</div>
					</div>
					<div class="align-items-center" id="money">
						<div id="money_title">지금 까지 결제 금액:</div>
						<div id="money_count">${user_sub_pay_before}&nbsp;원</div>

					</div>
					<div class="align-items-center" id="nowBook">
						<div id="nowBook_title">현재 대여책:</div>
						<div id="nowBook_content">오늘도 놀고 싶다</div>
					</div>

					<div class="align-items-center" id="selectType">
						<div id="selectType_title">선택된 장르:</div>
						<div id="selectType_content">무협,소설,로맨스</div>
					</div>
				</div>
				<div id="cancel_box" class="row gy-4">
					<div id="cancelText" class="row">${user_name }&nbsp;님 정말 구독 취소 하시겠습니까?</div>
					<div id="canceInput">
						<div id="inputText">비밀 번호:</div>
						<div id="inputBox">
							<div class="input-group mb-3">
								<input type="text" class="form-control"
									placeholder="Recipient's username"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2"> <span
									class="input-group-text" id="basic-addon2">취소 하기</span>
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