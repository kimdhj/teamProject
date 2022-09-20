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
<link href="/css/my_AddReadCancel.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>

	<form action="/cancelSubs.do" method="post">
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
					<div class="align-items-center" id="months">
						<div id="months_name">${user_name }&nbsp;님</div>
						<div id="months_count">${user_sub_count }</div>
						<div id="months_etc">개월 째 이용 중 입니다.</div>
					</div>
					<div class="align-items-center" id="money">
						<div id="money_title">지금 까지 결제 금액 : </div>
						<div id="money_count"><fmt:formatNumber value="${user_sub_pay_before}" type="number" />&nbsp;원</div>

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
				<div id="cancel_box" class="row gy-4">
					<div id="cancelText" class="row">&nbsp;&nbsp;${user_name }&nbsp;님 정말 구독 취소 하시겠습니까?</div>
					<div></div>
					<div id="canceInput" class="row d-flex">
						<div id="inputText" class="col-2">비밀 번호 : </div>
						<div id="inputBox" class="col-4">
							<div class="input-group">
								<input type="password" class="form-control" name="user_password"
									placeholder="비밀번호 확인"
									aria-label="비밀번호 확인"
									aria-describedby="basic-addon2"> <span
									class="input-group-text" id="basic-addon2" onclick="cancelsubs();">취소 하기</span>
							</div>
						</div>
						<div class="col"></div>
					</div>
				</div>

			</div>

		</div>
		</form>
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

		<!-- Footer End -->
</body>

</html>