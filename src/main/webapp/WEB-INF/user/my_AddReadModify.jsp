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
<form action="subupdate.do" method="post" >
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
						<div id="months_count" class="align-self-center">${user_sub_count}</div>
						<div id="months_etc" class="align-self-center">개월 째 이용 중 입니다.</div>
					</div>
					<div id="money">
						<div id="money_title" class="align-self-center">지금 까지 결제 금액 : </div>
						<div id="money_count"><fmt:formatNumber value="${user_sub_count*30000 }" type="number" />&nbsp;원</div>

					</div>
					<div id="nowBook">
						<div id="nowBook_title" class="align-self-center">현재 대여책 : </div>
						<div id="nowBook_content">${mybook}</div>
					</div>
					
					<div id="selectType">
						<div class="m-2 fs-1" id="selectType_title">선택 장르</div>
						<div id="selectType_content">
							<div class="row" id="select_items">
              <c:forEach var="ca" items="${catelist}">
								<div class="col-4" id="item_select">
									<div class="form-check">
										<input name="category_num" class="form-check-input" type="checkbox" value="${ca.category_num}"
											id="${ca.category_num}"> <label
											class="form-check-label" for="${ca.category_name}${ca.category_num}">
											${ca.category_name}</label>
									</div>
								</div>
                </c:forEach>
								
							<c:forEach var="ct" items="${catemy}">
                <input type="number" class="hide myca" value="${ct}"/>
                </c:forEach>

							</div>
						</div>
					</div>
					<div class="row g-2" id="btn_sumBox">
						<button  class="btn btn-success col-3">정보 수정</button>
						<div class="col-1"></div>
						<a class="col-3" href="my_cancelSub.do">
						<button type="button" onclick="location.href='/my_cancelSub.do'" class="btn btn-danger">구독 취소</button>
						</a>
					</div>
				</div>


			</div>

		</div>
</form>
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