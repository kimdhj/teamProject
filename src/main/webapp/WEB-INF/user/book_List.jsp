<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/book_List.css" rel="stylesheet" />

</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
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
							<img width="100%" class="img-fluid" src="img/carousel-1.jpg"
								alt="Image">
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
						<div class="btn" style="width: 45px; height: 45px;">
							<span class="carousel-control-prev-icon mb-n2"></span>
						</div>
					</a> <a class="carousel-control-next" href="#header-carousel"
						data-slide="next">
						<div class="btn " style="width: 45px; height: 45px;">
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
						<c:forEach var="bo" items="${list}">
							<div class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${bo.book_price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
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
						</c:forEach>
						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${startpage}" end="${endpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link" href="#">${i}
										</a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											href="#" class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt maxpage}">
									<li class="page-item"><a class="page-link" href="#">></a></li>
								</c:if>
							</ul>
						</nav>
						<input type="hidden" value="${vo.title}" id="booktitle" /> <input
							value="${vo.page}" type="hidden"
							id="bookpage" />
					</div>
					<div class="tab-pane fade best" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<c:forEach var="bo" items="${bestlist}">
							<div class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${bo.book_price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
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
						</c:forEach>
						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${beststartpage}" end="${bestendpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link" href="#">${i}
										</a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											href="#" class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt bestmaxpage}">
									<li class="page-item"><a class="page-link" href="#">></a></li>
								</c:if>
							</ul>
						</nav>
						<input type="hidden" value="${vo.title}" id=" besttitle" /> <input
							value="${vo.page}" type="hidden"
							id="bestpage" />

					</div>
					<div class="tab-pane fade new" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<c:forEach var="bo" items="${newlist}">
							<div class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${bo.book_price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
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
						</c:forEach>
						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${newstartpage}" end="${newendpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link" href="#">${i}
										</a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											href="#" class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt newmaxpage}">
									<li class="page-item"><a class="page-link" href="#">></a></li>
								</c:if>
							</ul>
						</nav>
						<input type="hidden" value="${vo.title}" id="newtitle" /> <input
							value="${vo.page}" type="hidden"
							id="newpage" />


					</div>
				</div>

				<hr>

				<!--  상단 베스트/신간 이동 바 -->

				<div></div>

			</div>

			<!--  cols 9 여분 바 -->
		</div>
	</div>
	<!--End -->

	<!-- Back to Top -->
	<!-- footer 포함. -->

	<!-- Footer End -->


	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- JavaScript Libraries -->





	<!-- Template Javascript -->

	<script src="/js/book_List.js"></script>

</body>
</html>