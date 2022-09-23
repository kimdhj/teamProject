<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_Review.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
	

		<!-- 여기 삽입 -->
		<div class="row" id="main_wrapper">
			<div class="row" id="under_menu">
				<div class="row" id="writerBox">
					<div id="under_topText">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                        </svg>
						나의 리뷰
					</div>
					<div class="row" id="table">
						<div id="table_title" class="row">
							<div class="col-2">일자</div>
							<div class="col-3">책</div>
							<div class="col">내용</div>
							<div class="col-1">별점</div>
						</div>
						<div id="table_item" class="row">
							<div class="col-2">2022-11-17</div>
							<div class="col-3">호모나 이타다기</div>
							<div class="col">오늘도 맛있는 이타다기</div>
							<div id="starBox" class="col-1">
								<form class="row" name="myform" id="myform" method="post"
									action="/save">
									<fieldset>
										<input disabled type="radio" class="col" name="rating"
											value="5" id="rate1"><label for="rate1">⭐</label> <input
											class="col" checked type="radio" name="rating" value="4"
											id="rate2"><label for="rate2">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="3"
											id="rate3"><label for="rate3">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="2"
											id="rate4"><label for="rate4">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="1"
											id="rate5"><label for="rate5">⭐</label>
									</fieldset>
								</form>
							</div>
						</div>
						<div id="table_item" class="row">
							<div class="col-2">2022-11-17</div>
							<div class="col-3">호모나 이타다기</div>
							<div class="col">오늘도 맛있는 이타다기</div>
							<div id="starBox" class="col-1">
								<form class="row" name="myform" id="myform" method="post"
									action="/save">
									<fieldset>
										<input disabled type="radio" class="col" name="rating"
											value="5" id="rate1"><label for="rate1">⭐</label> <input
											class="col" checked type="radio" name="rating" value="4"
											id="rate2"><label for="rate2">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="3"
											id="rate3"><label for="rate3">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="2"
											id="rate4"><label for="rate4">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="1"
											id="rate5"><label for="rate5">⭐</label>
									</fieldset>
								</form>
							</div>
						</div>
						<div id="table_item" class="row">
							<div class="col-2">2022-11-17</div>
							<div class="col-3">호모나 이타다기</div>
							<div class="col">오늘도 맛있는 이타다기</div>
							<div id="starBox" class="col-1">
								<form class="row" name="myform" id="myform" method="post"
									action="/save">
									<fieldset>
										<input disabled type="radio" class="col" name="rating"
											value="5" id="rate1"><label for="rate1">⭐</label> <input
											class="col" checked type="radio" name="rating" value="4"
											id="rate2"><label for="rate2">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="3"
											id="rate3"><label for="rate3">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="2"
											id="rate4"><label for="rate4">⭐</label> <input
											class="col" disabled type="radio" name="rating" value="1"
											id="rate5"><label for="rate5">⭐</label>
									</fieldset>
								</form>
							</div>
						</div>
						<div id="table_bottom" class="row">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>

					</div>



				</div>

			</div>


		</div>

		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
</body>

</html>