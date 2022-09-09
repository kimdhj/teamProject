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
		<div class="container">
			<div class="row">
				<div class="col-8"></div>
				<div class="col-4">
					<!-- <button type="button" class="btn btn-warning">고객문의 바로가기</button> -->
				</div>
			</div>
		</div>

		<!-- 문의글 시작 -->
		<form>
			<table class="table">
				<thead>

				</thead>
				<tbody>
					<tr>
						<th scope="row" class="bg-light align-middle">제목</th>
						<td colspan="3">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput"
									placeholder="제목을 입력하세요"> <label for="floatingInput">제목을
									입력하세요</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="bg-light">이름</th>
						<td>이승재</td>
						<th class="bg-light">이메일</th>
						<td>tommy@hanmail.com</td>
					</tr>
					<tr>
						<th class="bg-light align-middle">내용</th>
						<td colspan="3">
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="floatingTextarea2"
									style="height: 100px"></textarea>
								<label for="floatingTextarea2">내용을 입력하세요</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="bg-light">첨부파일</th>
						<td colspan="2"><input type="file" accept="image/*,.txt"
							multiple required capture='user' onchange='aaa' /></td>
						<td><input type="button" class="bg-light" value="삭제">
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 문의글 끝 -->

			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary me-md-2" type="button">문의접수</button>
				<button class="btn btn-primary" type="button">문의목록</button>
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