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
				<form method="post" name="writeTerms" aciton="" onsubmit="return writeSave()">
					<div class="card border-light">
						<div class="card-header">
							<div class="d-flex flex-row">
								<div class="col-md-6">조항 추가</div>
								<div class="col-md-6">
									<button type="button"
										class="btn btn-light btn-outline-dark btn-sm"
										style="float: right;"
										onclick="location.href='admin_terms_Main.mdo' ">조항 목록</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex flex-row">
								<table class="table">
									<tr>
										<td>번호</td>
										<td>게시판 글 번호 가져오기</td>
									</tr>
									<tr>
										<td>조항</td>
										<td>제 +1 조</td>
									</tr>
									<tr>
										<td>약관제목</td>
										<td align="left"><input class="form-control" type="test" width="200" name="content" placeholder="제목을 적어주세요."></td>
									</tr>
								</table>
							</div>

							<div class="mb-3">
								<textarea class="form-control" id="" rows="10" placeholder="내용을 적어주세요."></textarea>
							</div>
						</div>
						<div class="card-footer">
						<div align="right">
						<input type="submit" value="추가" />
						<input type="reset" value="다시작성" />
						</div>
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