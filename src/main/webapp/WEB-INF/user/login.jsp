<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link rel="stylesheet" href="/css/login_IdLogin.css">

</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<form action="/loginend.do" method="post">
	<div id="container" class="row flex-column align-items-center p-0 m-0">


		<div class="col-auto col-6">
			<img id="logologin" src="img/img_slidecontents03.png"
				alt="NangmanBooks" />
		</div>

		<div class="row justify-content-center p-0" id="warning"><div class="row justify-content-center mb-4 mt-4" id="warning">${warning}</div></div>

		<div class="input-field mt-5 row justify-content-center">
			<div class="col-1">ID</div>
			<div class="col-auto">
				<input type="text" name="user_id" id="u_id" required>
			</div>
		</div>

		<div class="input-field mt-2 row align-items-center justify-content-center">
			<div class="col-1">Password</div>
			<div class="col-auto">
				<input type="password" name="user_password" id="pwd" required>
			</div>
		</div>

		<div class="button-field mt-4">
			<button type="submit" class="myButton">
				로그인</button>
		</div>
		<div class="button-field mt-4">
			 <button class="kakaologin" onclick="kakaoLogin()"><i class="bi bi-chat-fill me-2"></i>카카오 로그인</button>
		</div>
		

		<div class="add-info row flex-column">

			<a href="findaccount.do">아이디/비밀번호 찾기</a> <a href="join.do">회원가입</a>

		</div>

	</div>
	<!-- //login-wrap -->

	</form>
	







	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->


	<script src="/js/common.js"></script>
	<script src="/js/jquery.smooth-scroll.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<script>

		//카카오 로그인
		 

		 function kakaoLogin() {

			    $.ajax({
			        url: '/kakaologin.do',
			        type: 'get',
			        async: false,
			        dataType: 'text',
			        success: function (res) {
			            location.href = res;
			        }
			    });

			  }
	</script>

	<!-- Footer End -->
</body>
</html>