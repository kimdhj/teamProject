<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/commonjsp/common_head.jsp"></jsp:include>


</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>


	<!-- 여기 삽입 -->
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-warning me-md-2" type="button">고객문의 바로가기</button>
	</div>

	<!-- 문의글 시작 -->
	<form>
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th scope="col-3">QnA</th>
						<th scope="col-7">제목내용(예치금은 어떻게넣나요?)</th>
						<th scope="col-2">이승재</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" colspan="3">예치금넣는거 알려줘어어어어어어어</th>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th scope="col-3">Re</th>
						<th scope="col-7"></th>
						<th scope="col-2">관리자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" colspan="3">안알랴줌</th>
					</tr>
				</tbody>
				<thead>
					<tr>
						<th scope="col-3">Re</th>
						<th scope="col-7"></th>
						<th scope="col-2">이승재</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" colspan="3">알려줘어어어어어어어</th>
					</tr>
				</tbody>
			</table>
			<!-- 문의글 끝 -->
			
			<!-- 답글작성 시작 -->
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">답글 작성</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea><form>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary me-md-2" type="button">등록하기</button>
				<button class="btn btn-primary" type="button">목록으로</button>
			</div>
			<!-- 답글작성 끝 -->
		</div>
	</form>


	<!-- 공통 마이페이지 바텀 -->
	<jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>
	<!-- 공통 마이페이지 바텀 끝 -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>

	<!-- Footer End -->

</body>

</html>