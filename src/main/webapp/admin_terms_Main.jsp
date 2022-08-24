<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container">
		<div class="d-flex flex-row">
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">약관제목</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">112344</td>
						<td>홍길동이 대충 끄적거린 약관</td>
						<td>2090-11-23</td>
					</tr>
					<tr>
						<td scope="row">112344</td>
						<td>강감찬이 열심히 끄적거린 약관</td>
						<td>2090-11-23</td>
					</tr>
					<tr>
						<td scope="row">112344</td>
						<td>고길동이 쓰다만</td>
						<td>2090-11-23</td>
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