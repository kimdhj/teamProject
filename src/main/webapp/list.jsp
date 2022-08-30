<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="commonjsp/common_head.jsp"></jsp:include>
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->

	<!-- Page Header Start -->
	<!-- 아래 텍스트는 수정가능 My page, Home, Pages, Contact Us 는 각 페이지마다 다를 수 있으므로-->
	<div class="container-fluid page-header wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container">
			<h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
					<li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
					<li class="breadcrumb-item text-dark active" aria-current="page">Contact
						Us</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->

	<div class="container-fluid mb-5">
		<div class="row border-top px-xl-5" id="list_book">

			<!-- 사이드 바  -->
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0">국내 도서 목록</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0"
					id="navbar-vertical">
					<div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">아동<i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">아아동</a> <a href=""
									class="dropdown-item">아아아동</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">무협<i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">1</a> <a href=""
									class="dropdown-item">2</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">교육<i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">1</a> <a href=""
									class="dropdown-item">2</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">시리즈물<i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">1</a> <a href=""
									class="dropdown-item">2</a>
							</div>
						</div>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link" data-toggle="dropdown">소설<i
								class="fa fa-angle-down float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<a href="" class="dropdown-item">1</a> <a href=""
									class="dropdown-item">2</a>
							</div>
						</div>

					</div>
				</nav>
			</div>
			<!--  사이드바      -->

			<!--  cols 9 여분 바 -->

			<div class="col-lg-9">

				<!--  추천이미지 상세  -->

				<div id="header-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" style="height: 410px;">
							<img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">책</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">저렴</h3>
									<a href="" class="btn btn-light py-2 px-3">구매</a>
								</div>
							</div>
						</div>
						<div class="carousel-item" style="height: 410px;">
							<img class="img-fluid" src="img/carousel-2.jpg" alt="Image">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h4 class="text-light text-uppercase font-weight-medium mb-3">책</h4>
									<h3 class="display-4 text-white font-weight-semi-bold mb-4">저렴</h3>
									<a href="" class="btn btn-light py-2 px-3">구매</a>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#header-carousel"
						data-slide="prev">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-prev-icon mb-n2"></span>
						</div>
					</a> <a class="carousel-control-next" href="#header-carousel"
						data-slide="next">
						<div class="btn btn-dark" style="width: 45px; height: 45px;">
							<span class="carousel-control-next-icon mb-n2"></span>
						</div>
					</a>
				</div>

				<!--  추천이미지 상세  -->

				<hr>

				<!--  상단 베스트/신간 이동 바 -->

				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">홈</button>
						<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false">베스트</button>
						<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
							data-bs-target="#nav-contact" type="button" role="tab"
							aria-controls="nav-contact" aria-selected="false">신간</button>
					</div>

				</nav>

				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row">
							<div class="col-2">
								<a><img width="100%" class="img_booklist_kr"
									src="img/h1.png" /></a>
							</div>
							<div class="col-7">
								<h4>해리포터 1편</h4>
							</div>
							<div class="col-3">
								<div id="purchase01" class="row">
									<button class="btnSubmit">
										<a>구매하기</a>
									</button>
									<br>
								</div>
								<div id="purchase02" class="row">
									<button class="btnSubmit">
										<a>리뷰보기</a>
									</button>
								</div>
							</div>
						</div>

						<hr>

						<div class="row">
							<div class="col-2">
								<a><img width="100%" class="img_booklist_kr"
									src="img/h1.png" /></a>
							</div>
							<div class="col-7">
								<div class="row">
									<h4>해리포터 1편</h4>
								</div>
								<div id="best_price" class="row">
									<h5>10,000원</h5>
								</div>
								<div id="best_context" class="row">
									설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명</div>
							</div>
							<div class="col-3">
								<div id="purchase01" class="row">
									<button class="btnSubmit">
										<a>구매하기</a>
									</button>
									<br>
								</div>
								<div id="purchase02" class="row">
									<button class="btnSubmit">
										<a>리뷰보기</a>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">...</div>
					<div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">...</div>
				</div>

				<!--
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="menu_bar" class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.html" class="nav-item nav-link active">베스트</a>
                            <a href="shop.html" class="nav-item nav-link">신간</a>
                        </div>
                    </div>
                </nav>
                 -->


				<hr>

				<!--  상단 베스트/신간 이동 바 -->

				<div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>

			</div>

			<!--  cols 9 여분 바 -->
		</div>
	</div>
	<!--End -->

	<!-- Back to Top -->
	<!-- footer 포함. -->


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="commonjsp/common_footer.jsp"></jsp:include>

	<!-- Footer End -->

</body>
</html>