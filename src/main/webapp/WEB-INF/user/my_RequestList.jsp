<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-warning me-md-2" type="button">고객문의
				바로가기</button>
		</div>

		<!-- 문의글 시작 -->
		<form>
			<div class="container">
				<table class="table">
					<thead>
						<tr>
							<th scope="col-3">QnA</th>
							<th scope="col-7">제목내용(예치금은 어떻게넣나요?)</th>
							<th scope="col-2">(2022-08-10)</th>
						</tr>
						<tr>
							<th scope="col-3">QnA</th>
							<th scope="col-7">배송은 얼마나걸리나요</th>
							<th scope="col-2">(2022-08-07)</th>
						</tr>
						<tr>
							<th scope="col-3">QnA</th>
							<th scope="col-7">마일리지는 아무데나 쓸수있나요</th>
							<th scope="col-2">(2022-08-05)</th>
						</tr>
						<tr>
							<th scope="col-3">QnA</th>
							<th scope="col-7">메롱이다</th>
							<th scope="col-2">(2022-08-01)</th>
						</tr>
					</thead>

				</table>
				<!-- 문의글 끝 -->

			</div>
		</form>


		<!-- 공통 마이페이지 바텀 -->
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
		<!-- 공통 마이페이지 바텀 끝 -->

		<!-- Contact End -->


		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
</body>

</html>