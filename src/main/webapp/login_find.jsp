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

	<link rel="stylesheet" href="/css/login_find.css">

	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->


	<div id="container" class="col-12 flex-column align-items-center">


		<div class="col-auto  d-flex justify-content-center">
			<img id="logologin" src="img/img_slidecontents03.png" alt="NangmanBooks" />
		</div>



		

		<div class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
			<button class="find_id">아이디 찾기</button>
		</div>
		<div class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
			<button class="find_id">비밀번호 찾기</button>
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