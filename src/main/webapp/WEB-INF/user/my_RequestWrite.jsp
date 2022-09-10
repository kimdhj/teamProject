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
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
	

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