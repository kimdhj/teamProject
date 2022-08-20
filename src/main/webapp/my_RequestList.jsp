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
	<jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>
	<!-- 공통 마이페이지 바텀 끝 -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>

	<!-- Footer End -->

</body>

</html>