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
<link href="/css/my_AddReadModify.css" rel="stylesheet">

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
							<div id="item_title" class="col-4 ">구독</div>

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
					<div id="money">
						<div id="money_title" class="align-self-center">지금 까지 결제 금액 : </div>
						<div id="money_count"><fmt:formatNumber value="${sub.sub_info_price }" type="number" />&nbsp;원</div>

					</div>
					<div id="nowBook">
						<div id="nowBook_title" class="align-self-center">현재 대여책 : </div>
						<div id="nowBook_content">오늘도 놀고 싶다</div>
					</div>
					<div id="nowBook">
						<div id="nowBook_title" class="align-self-center">대여 수 : </div>
						<div id="nowBook_content">
							<input type="number" id="book_count" name="book_count" /> 권
						</div>
					</div>


					<form id="zipCode" class="row g-3">
						<div class="row" id="zipcode_line">
							<div class="col-auto" id="nowBook_title">주소 :</div>
							<div class="col-auto">
								<input readonly type="text" class="form-control" id="zipCodeIn"
									placeholder="우편번호">
							</div>
							<div class="col-auto">
								<button type="button" id="add_find" class="btn btn-primary mb-3">주소 찾기</button>
							</div>
						</div>
						<div class="row" id="address_line">
							<div class="col-1"></div>
							<div class="col-6 ">
								<input readonly type="text" class="form-control" id="address"
									placeholder="주소">
							</div>
						</div>
						<div class="row" id="addressEtc_line">
							<div class="col-1"></div>
							<div class="col-6 ">
								<input type="text" class="form-control" id="etc"
									placeholder="추가 주소">
							</div>
						</div>
					</form>

					<div id="selectType">
						<div id="selectType_title">선택된 장르</div>
						<div id="selectType_content">
							<div class="row" id="select_items">
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckIndeterminate"> <label
											class="form-check-label" for="flexCheckIndeterminate">
											무협 </label>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="row g-2" id="btn_sumBox">
						<button type="button" class="btn btn-success col-3">정보 수정</button>
						<div class="col-1"></div>
						<a class="col-3" href="my_cancelSub.do">
						<button type="button" class="btn btn-danger">구독 취소</button>
						</a>
					</div>
				</div>


			</div>

		</div>

		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<script
			src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/js/my_AddReadModify.js"></script>
		<!-- Footer End -->
</body>

</html>