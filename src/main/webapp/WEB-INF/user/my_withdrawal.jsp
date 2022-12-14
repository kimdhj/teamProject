<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_Password.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>

		<!-- 여기 삽입 -->
		<div class="container">
			<h3 style="color:red; text-align:center">*회원탈퇴*</h3>
		</div>
		<form action="/myWithdrawal.do" method="post" onsubmit="return formCheck()">
			<div class="row" id="middle_menu">
				<div id="under_topText">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
                    <path
							d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
                </svg>
					비밀번호 재확인
				</div>
				<div class="row" id="day_find">
					<div class="col-4" id="day_title">아이디</div>
					<div class="col-8" id="option_select">

						<div class="col" id="option_input">
							<div class="input-group mb-3 ">
								<input type="text" id="user_id" name="user_id"
									class="form-control" placeholder="username"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="option_find">
					<div class="col-4" id="option_title">비밀번호</div>
					<div class="col-8" id="option_select">

						<div class="col" id="option_input">
							<div class="input-group mb-3 ">
								<input type="password" id="user_password" name="user_password"
									class="form-control" placeholder="password"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</div>
						</div>
					</div>
				</div>
				<div id="btn" class="row">
					<div class="col"></div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary rounded-pill">확인</button>
					</div>
				</div>
			</div>
			<input type="hidden" id="session_user_id" name="session_user_id" value="${getSessionUser.user_id}">			
			<%-- <input type="hidden" id="session_user_id" name="session_user_id" value="${getSessionUser.user_password}"> --%>			
		</form>

		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
		<script src="/js/my_withdrawal.js"></script>
</body>

</html>