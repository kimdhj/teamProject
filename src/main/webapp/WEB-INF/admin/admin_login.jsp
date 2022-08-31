<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card bg-dark text-white">
		<img src="/img/admin_login_bg.jpg" class="card-img" alt="...">
		<div class="card-img-overlay">

			<div class="fixed-top text-center">
				<h1>ADMIN</h1>
			</div>
			<div class="container fixed-bottom"></div>


			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-2"></div>

					<!-- <div class="col-2"></div> -->
					<div class="col-4 text-center">
						<form class="" action="admin_login.mdo" method="post">
							<div class="card" style="padding: 8px">
								<h4>Reset Password</h4>
								<div class="input-group flex-nowrap" style="padding: 8px">
									<div class="input-group-prepend">
										<span class="input-group-text" id="addon-wrapping">&nbsp;아이디&nbsp;</span>
									</div>
									<input type="text" name="user_id" id="user_id"
										class="form-control" placeholder="" required
										aria-label="Username" aria-describedby="addon-wrapping"
										value="${adminUserVO.user_id }" />
								</div>
								<div class="input-group flex-nowrap" style="padding: 8px">
									<div class="input-group-prepend">
										<span class="input-group-text" id="addon-wrapping">비밀번호</span>
									</div>
									<input type="password" name="user_password" id="user_password"
										class="form-control" placeholder="" required
										aria-label="Username" aria-describedby="addon-wrapping"
										value="${adminUserVO.user_password }" />
								</div>
								<button type="submit" style="margin: 8px"
									class="btn btn-outline-info" name="button">로그인</button>
							</div>
						</form>
					</div>


					<div class="col-2"></div>
				</div>
				<!-- END OF ROW -->
			</div>




			<h5 class="card-title"></h5>
			<p class="card-text"></p>
			<p class="card-text"></p>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>