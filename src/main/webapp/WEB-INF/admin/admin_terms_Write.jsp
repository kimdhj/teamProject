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
	<div class="container" id="terms_Write">
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<form id="terms_Insert" method="post" action="admin_terms_insert.mdo">
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
										<td>${getCount+1}</td>
										<!-- <td><input class="form-control" type="text" name="terms_seq"></td>  -->
									</tr>
									<tr>
										<td>조항</td>
										<td><input class="form-control" type="text" id="terms_article_number" name="terms_article_number" placeholder="조항 번호를 적어주세요(숫자만 입력 가능)"></td>
									</tr>
									<tr>
										<td>약관제목</td>
										<td align="left"><input class="form-control" type="text"
											width="200" id="terms_title" name="terms_title" placeholder="약관항목(구독 or 결제 or 회원가입) - 제목 "></td>
									</tr>
								</table>
							</div>

							<div class="mb-3">
								<textarea class="form-control" id="terms_content" name="terms_content" rows="10"
									placeholder="내용을 적어주세요."></textarea>
							</div>
							
							<div align="right">
							<select name="terms_state">
							<option value="1">공개</option>
							<option value="0">비공개</option>
							</select>
							</div>
						</div>
						<div class="card-footer">
							<div align="right">
							<input type="reset" value="다시작성" />
							<input type="button" onclick="terms_Write();" value="추가" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_terms_Write.js"></script>
	
	
</body>
</html>