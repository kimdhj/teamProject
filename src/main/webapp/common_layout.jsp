<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->

	<link rel="stylesheet" href="/css/login_IdLogin.css">

	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->


	<div id="container" class="row flex-column align-items-center">


		<div class="col-auto col-6">
			<img id="logologin" src="img/img_slidecontents03.png" alt="NangmanBooks" />
		</div>



		<div class="input-field row justify-content-center">
			<div class="col-1">ID</div>
			<div class="col-auto">
				<input type="text" id="u_id" required>
			</div>
		</div>

		<div class="input-field row justify-content-center"">
			<div class="col-1">Password</div>
			<div class="col-auto">
				<input type="password" id="pwd" required maxlength="12"
					minlength="8">
			</div>
		</div>

		<div class="button-field">
			<button type="submit" class="myButton">
				로그인</a>
		</div>

		<div class="add-info row flex-column">

			<a href="none.html">아이디/비밀번호 찾기</a> <a href="join.html">회원가입</a>

		</div>

	</div>
	<!-- //login-wrap -->

	</div>


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->

	<!-- Footer End -->
</body>
</html>