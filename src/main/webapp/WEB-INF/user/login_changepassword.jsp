<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/login_changepassword.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


<form id="pass" method="post" action="/login_change_password.do">
	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div id="mainwrapper"
		class="d-flex col-12 flex-column justify-content-center align-items-center">

		<div class="col-6">


			<div class=" mb-3  col-auto">
				<label for="inputPassword" class="col-4 col-form-label">새 비밀
					번호</label>
				<div class="col-auto">
					<input required name="user_password" type="password"
						placeholder="비밀번호를 입력해주세요" class="form-control" id="password">
					<span class="war" id="pasword"></span>
				</div>
			</div>
			<div class=" mb-3  col-auto">
				<label for="inputPassword" class="col-4 col-form-label">비밀
					번호 확인</label>
				<div class="col-auto">
					<input required  type="password"
						placeholder="비밀번호를 입력해주세요" class="form-control" id="passwordche">
					<span class="war" id="paswordche"></span>
				</div>
			</div>
			<div
				class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
				<button type="button" id="fin" class="change me-5">비밀번호 변경</button>
				<input type="hidden" name="user_id" value="${id}" /> <a
					href="login.do"><button class="cancel">취소</button></a>
			</div>
			



		</div>
	</div>
</form>
	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="/js/login_changepassword.js"></script>

	<!-- Footer End -->
</body>
</html>