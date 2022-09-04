<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<li class="breadcrumb-item"><a class="text-body">Home</a></li>
					<li class="breadcrumb-item"><a class="text-body">Pages</a></li>
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
					<h6 class="m-0">카테 고리 목록</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0"
					id="navbar-vertical">
					<div class="navbar-nav w-100">

						<div class="nav-item dropdown">
							<c:forEach var="nav" items="${renav}">
								<a href="/booklist.do?category=${nav.category_num}"
									class="nav-link">${nav.nav_category_name}</a>
							</c:forEach>
						</div>

						<div class="nav-item dropdown">
							<a class="nav-link" data-toggle="dropdown">국내 카테고리<i
								class="fa fa-angle-down float-right mt-1"></i></a>

							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<c:forEach var="nav" items="${konav}">
									<a href="/booklist.do?category=${nav.category_num}"
										class="dropdown-item">${nav.category_name}</a>
								</c:forEach>
							</div>

						</div>
						<div class="nav-item dropdown">
							<a class="nav-link" data-toggle="dropdown">외국 카테고리<i
								class="fa fa-angle-down float-right mt-1"></i></a>

							<div
								class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
								<c:forEach var="nav" items="${ennav}">
									<a href="/booklist.do?category=${nav.category_num}"
										class="dropdown-item">${nav.category_name}</a>
								</c:forEach>
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
						<div class="carousel-item active w-100" style="height: 410px;">
							<a href="" class="btn btn-light py-2 px-3 w-100"> <img width="100%"
								class="img-fluid" src="img/carousel-1.jpg" alt="Image">
								<div
									class="carousel-caption d-flex flex-column align-items-center justify-content-center">
									<div class="p-3" style="max-width: 700px;"></div>
								</div>
							</a>
						</div>
						<div class="carousel-item" style="height: 410px;">
							<a href="" class="btn btn-light py-2 px-3 w-100"> <img
								class="img-fluid" width="100%" src="img/carousel-2.jpg"
								alt="Image">
								<div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
									<div class="p-3" style="max-width: 700px;"></div>
								</div>
							</a>
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
					<div class="tab-pane fade  book show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<c:forEach var="bo" items="${list}">
							<div id="item" class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>
											<fmt:formatNumber value="${bo.book_price}" pattern="#,###" />
											원
										</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>
						</c:forEach>
						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${startpage}" end="${endpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link">${i} </a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt maxpage}">
									<li class="page-item"><a class="page-link">></a></li>
								</c:if>
							</ul>
						</nav>
						<input type="hidden" value="${vo.title}" id="booktitle" /> <input
							value="${vo.page}" type="hidden" id="bookpage" />
					</div>
					<div class="tab-pane fade best" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<c:forEach var="bo" items="${bestlist}">
							<div id="item" class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>
											<fmt:formatNumber value="${bo.book_price}" pattern="#,###" />
											원
										</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>
						</c:forEach>
						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${beststartpage}" end="${bestendpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link">${i} </a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt bestmaxpage}">
									<li class="page-item"><a class="page-link">></a></li>
								</c:if>
							</ul>
						</nav>
						<input type="hidden" value="${vo.title}" id=" besttitle" /> <input
							value="${vo.page}" type="hidden" id="bestpage" />

					</div>
					<div class="tab-pane fade new" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<c:forEach var="bo" items="${newlist}">
							<div id="item" class="row ">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>
											<fmt:formatNumber value="${bo.book_price}" pattern="#,###" />
											원
										</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>
						</c:forEach>

						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${newstartpage}" end="${newendpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link">${i} </a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt newmaxpage}">
									<li class="page-item"><a class="page-link">></a></li>
								</c:if>
							</ul>
						</nav>

						<input type="hidden" value="${vo.title}" id="newtitle" /> <input
							value="${vo.page}" type="hidden" id="newpage" />


					</div>
				</div>

				<hr>

				<!--  상단 베스트/신간 이동 바 -->

				<div></div>

			</div>

			<!--  cols 9 여분 바 -->
		</div>
		<input type="hidden" value="${vo.category}" id="category" />
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
	<script src="/lib/easing/easing.min.js"></script>
	<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- JavaScript Libraries -->





	<!-- Template Javascript -->

	<script src="/js/book_List.js"></script>

</body>
</html>