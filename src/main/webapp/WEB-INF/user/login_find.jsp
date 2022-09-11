<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
	<link rel="stylesheet" href="/css/login_find.css" />
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->



	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->


	<div id="container" class="col-12 flex-column align-items-center">


		<div class="col-auto  d-flex justify-content-center">
			<img id="logologin" src="img/img_slidecontents03.png"
				alt="NangmanBooks" />
		</div>
		<form action="/findid.do"  id="idform" method="post">
			<div id="idfind"
				class="d-flex col-12 flex-column justify-content-center align-items-center">

				<div class="col-6">
					<div class="mb-3  col-auto">
						<label for="staticEmail" class="col-4 col-form-label">이름</label>
						<div class="col-auto">
							<input required name="user_name" type="text"
								placeholder="이름을 입력해주세요" class="form-control" id="name">

						</div>
						<span class="war" id="nameword"></span>
					</div>
					<div id="emailbox">
						<div class="mb-3  col-auto">
							<label for="staticEmail" class="col-4 col-form-label">이메일</label>
							<div class="col-auto d-flex">
								<input  name="user_email" type="email"
									placeholder="이메일을 입력해주세요" class="form-control me-5 col-auto"
									id="email">
								<button type="button" disabled id="emailchestart"
									class="col-auto">인증</button>
							</div>
							<span class="war" id="emailword"></span>
						</div>
						<div class="mb-3 col-auto">
							<div class="col-auto d-flex">
								<input type="text"  disabled class="me-5" required
									id="cheemail" class="form-control" />
								<button id="emailche" disabled type="button" class="col-auto">인증
									확인</button>
							</div>
							<div class="war" id="emailtime"></div>
							<div class="war" id="emailchword"></div>
						</div>
					</div>
					<div class="hide" id="phonebox">
						<div class="mb-3 col-auto">
							<label for="staticEmail" class="col-4 col-form-label">핸드폰
								번호</label>
							<div class="col-auto d-flex">
								<input  type="text" name="user_phone" id="phone"
									class="form-control me-5 col-auto" />
								<button type="button" id="phchestart" disabled class="col-auto">인증</button>
							</div>
							<span class="war" id="phword"></span>
						</div>
						<div class="mb-3 col-auto">
							<div class="col-auto d-flex">
								<input type="text"  disabled class="me-5" required
									id="chenum" class="form-control" />
								<button id="phche" disabled type="button" class="col-auto">인증
									확인</button>
							</div>
							<div class="war" id="time"></div>
							<div class="war" id="chword"></div>
						</div>
					</div>
					<div id="togglebox"
						class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
						<div class="wrap">
							<button type="button" class="button">핸드폰/이메일 전환</button>
						</div>
					</div>

					<div
						class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
						<button id="fin" class="find_id">아이디 찾기</button>
					</div>
				</div>
			</div>
		</form>
		<form action="/findpassword.do" id="passwordform" method="post">
			<div id="passwordfind"
				class="d-flex col-12 flex-column justify-content-center align-items-center">

				<div class="col-6">

					<div class="mb-3  col-auto">
						<label for="staticEmail" class="col-4 col-form-label">이름</label>
						<div class="col-auto">
							<input required name="user_name" type="text"
								placeholder="이름을 입력해주세요" class="form-control" id="name">

						</div>
						<span class="war" id="nameword"></span>
					</div>
					<div class="mb-3  col-auto">
						<label for="staticEmail" class="col-4 col-form-label">아이디</label>
						<div class="col-auto">
							<input name="user_id" required type="text"
								placeholder="아이디를 입력해주세요" class="form-control" id="id">
						</div>
						<span class="war" id="idword"></span>
					</div>
					<div id="emailbox">
						<div class="mb-3  col-auto">
							<label for="staticEmail" class="col-4 col-form-label">이메일</label>
							<div class="col-auto d-flex">
								<input  name="user_email" type="email"
									placeholder="이메일을 입력해주세요" class="form-control me-5 col-auto"
									id="email">
								<button type="button" disabled id="emailchestart"
									class="col-auto">인증</button>
							</div>
							<span class="war" id="emailword"></span>
						</div>
						<div class="mb-3 col-auto">
							<div class="col-auto d-flex">
								<input type="text"  disabled class="me-5" required
									id="cheemail" class="form-control" />
								<button id="emailche" disabled type="button" class="col-auto">인증
									확인</button>
							</div>
							<div class="war" id="emailtime"></div>
							<div class="war" id="emailchword"></div>
						</div>
					</div>

					<div class="hide" id="phonebox">
						<div class="mb-3 col-auto">
							<label for="staticEmail" class="col-4 col-form-label">핸드폰
								번호</label>
							<div class="col-auto d-flex">
								<input  type="text" name="user_phone" id="phone"
									class="form-control me-5 col-auto" />
								<button type="button" disabled id="phchestart" class="col-auto">인증</button>
							</div>
							<span class="war" id="phword"></span>
						</div>
						<div class="mb-3 col-auto">
							<div class="col-auto d-flex">
								<input type="text"  disabled class="me-5" required
									id="chenum" class="form-control" />
								<button id="phche" disabled type="button" class="col-auto">인증
									확인</button>
							</div>
							<div class="war" id="time"></div>
							<div class="war" id="chword"></div>
						</div>
					</div>
					<div id="togglebox"
						class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
						<div class="wrap">
							<button type="button" class="button">핸드폰/이메일 전환</button>
						</div>
					</div>
					<div
						class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
						<button id="fin" class="find_id">비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</form>
	</div>










	</div>
	<!-- //login-wrap -->

	</div>


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="/js/login_find.js"></script>
	<!-- Footer End -->
</body>
</html>