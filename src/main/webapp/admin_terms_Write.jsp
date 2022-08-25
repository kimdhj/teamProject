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
			<div class="col-md-12">
				<form>
					<div class="card border-light">
						<div class="card-header">약관제목</div>
						<div class="card-body">
							<div class="mb-3">
								<textarea class="form-control" id="" rows="10"></textarea>
							</div>
						</div>
						<div class="card-footer">
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;">목록</button>
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;">등록</button>								
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>