<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_terms.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container">
		<div class="terms_header">
			<div class="card border-light">
				<div class="card-header">
					<div class="d-flex flex-row">
						<div class="col-md-6" id="terms_header">약관 목록</div>
						<div class="col-md-6">
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;"
								onclick="location.href='admin_terms_Write.mdo' "
								>조항 추가</button>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="d-flex flex-row">
						<table class="table">
							<thead class="table-dark">
								<tr>
									<th width="70" scope="col">번호</th>
									<th width="70" scope="col">조항</th>
									<th width="150" scope="col">약관제목</th>
									<th width="70" scope="col">등록일</th>
									<th width="70" scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row">1번</td>
									<td>제 1조</td>
									<td><a href="/admin_terms_Read.mdo">목적</a></td>
									<td>2090-11-23</td>
									<td>Y</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
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


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>