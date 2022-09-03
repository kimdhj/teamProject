<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<form>
					<div class="card border-light">
						<div class="card-header">
							<div class="d-flex flex-row">
								<div class="col-md-6">제 1조 목적</div>
								<div class="col-md-6">
									<button type="button"
										class="btn btn-light btn-outline-dark btn-sm"
										style="float: right;">약관선택</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex flex-row">
								<table class="table">
									<tr>
										<td>번호</td>
										<td>1번</td>
									</tr>
									<tr>
										<td>조항</td>
										<td>제 1조</td>
									</tr>
									<tr>
										<td>약관제목</td>
										<td>수직</td>
									</tr>
									<tr>
										<td>등록일</td>
										<td>수직</td>
									</tr>

								</table>
							</div>

							<div class="mb-3">
								<textarea class="form-control" id="" rows="10">본 약관은 낭만서점 사이트(이하 "당 사이트")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
								</textarea>
							</div>
						</div>
						<div class="card-footer">
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;">삭제</button>
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;"
								onclick="location.href='admin_terms_Main.mdo' ">목록</button>
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>