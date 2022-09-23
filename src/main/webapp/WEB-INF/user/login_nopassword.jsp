<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/login_changepassword.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->



	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div id="mainwrapper"
		class="d-flex col-12 flex-column justify-content-center align-items-center">

		<div class="col-6">


			<div class=" mb-3  col-auto">
				<h1>입력하신 정보가 일치하지 않습니다. 다시 시도해주세요</h1>
			</div>
			
			<div
						class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
						<button  class="change me-5" onclick="location.href='/findaccount.do'">아이디/비밀번호 찾기</button>
						<input type="hidden" name="user_id" value="${id}"/>
						<button  class="cancel" onclick="location.href='/index.do'">메인 화면</button>
					</div>
	


		</div>
	</div>

	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="/js/login_changepassword.js"></script>

	<!-- Footer End -->
</body>
</html>