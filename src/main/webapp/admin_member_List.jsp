<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<!-- <div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav class="navbar navbar-dark bg-info">
					<div class="container-fluid">
						<a class="navbar-brand">ADMIN</a>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</div>
	</div> -->
	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-2">
				<select class="form-select form-select mb-3"
					aria-label=".form-select-lg example">
					<option selected>이름</option>
					<option value="1">아이디</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="" placeholder="입력하세요">
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-light btn-outline-dark">검색</button>
			</div>
			<div class="col-md-5">
				<div class="btn-group" role="group"
					aria-label="Basic mixed styles example">
					<button type="button" class="btn btn-danger">구독</button>
					<button type="button" class="btn btn-warning">일반</button>
					<button type="button" class="btn btn-dark">블랙</button>
					<button type="button" class="btn btn-success">전체</button>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row">
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">구분</th>
						<th scope="col">생년월일</th>
						<th scope="col">연락처</th>
						<th scope="col">Email</th>
						<th scope="col">마일리지</th>
						<th scope="col">보유쿠폰</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">112344</td>
						<td>홍길동</td>
						<td>tommy</td>
						<td>구독</td>
						<td>2023-01-23</td>
						<td>010-2313-1323</td>
						<td>tommy@hanmail.net</td>
						<td>233,312,123</td>
						<td>32</td>
						<td><button type="button"
								class="btn btn-light btn-outline-dark">조회</button></td>
					</tr>
					<tr>
						<td scope="row">412544</td>
						<td>강감찬</td>
						<td>tommy</td>
						<td>블랙</td>
						<td>1023-01-23</td>
						<td>010-9313-1323</td>
						<td>tommy@hanmail.net</td>
						<td>233,312,123</td>
						<td>32</td>
						<td><button type="button"
								class="btn btn-light btn-outline-dark">조회</button></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
						<a class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a>
					</ul>
				</nav>
			</div>
		</div>
	</div>









	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>