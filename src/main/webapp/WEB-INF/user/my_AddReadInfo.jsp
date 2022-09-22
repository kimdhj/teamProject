<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_AddReadInfo.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>

		<!-- 여기 삽입 -->
		<div id="main_wrapper" class="row">
			<div class="col">
				<div id="top_info" class="row">
					<div id="img_box" class="col-2">
						<img src="${icon.icon_file }" width="100%" height="100%" alt=""
							id="item_img" />
					</div>
					<div class="col" id="text">
						<div class="row" id="title">
							<div id="item_title" class="col-5 row  ">구독</div>
							<div id="btn_box" class="col-7 row gy-1">
								<div class="col-lg col-sm-12" id="cancel_btn">
									<button type="button" class="btn btn-primary">구독 안내</button>
								</div>
								<div class="col-lg col-sm-12" id="modify_btn">
									<a href="my_modifySub.do">
									<button type="button" class="btn btn-info">구독 정보 변경</button>
									</a>
								</div>
							</div>
						</div>
						<div class="row" id="subtitle">월 결제 금액 : <fmt:formatNumber value="${sub.sub_info_price }" type="number" />원</div>
						<div class="row" id="itemtText">
							${sub.sub_info_pre_string }
						</div>
					</div>
					<div class="col-2"></div>
				</div>
				<div id="personal_info" class="row">
					<div id="months">
						<div id="months_name">${user_name }&nbsp;님</div>
						<div id="months_count" class="align-self-center">${user_sub_count }</div>
						<div id="months_etc" class="align-self-center">개월 째 이용 중 입니다.</div>
					</div>
					<div id="money" class="row d-flex">
						<div id="money_title" class="align-self-center col-4">지금 까지 결제 금액 : </div>
						<div id="money_count" class="col"><fmt:formatNumber value="${sub.sub_info_price }" type="number" />&nbsp;원</div>

					</div>
					<div id="nowBook" class="row d-flex">
						<div id="nowBook_title" class="align-self-center col-3">배송 예정 도서 : </div>
						<div id="nowBook_content" class="col">{user_book}</div>
						<div></div>
					</div>
					<div id="selectType" class="row d-flex">
						<div id="selectType_title" class="col-3">선택된 장르 :</div>
						<div id="selectType_content" class="col">
							${cate}
						</div>
					</div>
				</div>
				<div id="rec_book" class="row">
					<div class="row g-0 gx-5 align-items-end">
						<div class="col-lg-6">
							<div class="section-header text-start mb-5 wow fadeInUp"
								data-wow-delay="0.1s" style="max-width: 500px;">
								<h1 class="display-5 mb-3">신작</h1>
								<p>도서목록</p>
							</div>
						</div>

					</div>
					<div class="tab-content">
					<!-- 탭1 시작 -->
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<c:forEach var="newb" items="${mynewlist}">
								<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
									data-wow-delay="0.1s">
									<div class="product-item h-80">
										<input type="hidden" id="seq" value="${newb.book_seq}" />
										<div class="position-relative bg-light h-100 overflow-hidden">
											<img height="100%" class="w-100" src="${newb.book_bigimgURL}"
												alt="">
											<div
												class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">new</div>
										</div>
										<div class="text-center p-4">
											<a class="d-block h5 mb-2"
												href="bookdetail.do?book_seq=${newb.book_seq}">${newb.book_title}</a>
											<span class="text-primary me-1"><fmt:formatNumber
													value="${newb.book_price}" pattern="#,###" />원</span>
										</div>
										<div class="d-flex border-top">
											<small class="w-50 text-center border-end py-2"> <a
												class="text-body"
												href="bookdetail.do?book_seq=${newb.book_seq}"><i
													class="fa fa-eye text-primary me-2"></i>상세보기</a>
											</small> <small class="w-50 text-center py-2"> <a id="cart"
												class="text-body"><i
													class="fa fa-shopping-bag text-primary me-2"></i>Add to
													cart</a>
											</small>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 탭1 끝 -->
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