 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-6">
				<div class="col-md-12">
					<form action="updateUserAccount.mdo" method="post"
						id="accountCheckForm" onsubmit="return adminAccountCheck()">
						<!-- <form action="/insertAdminAccount.mdo" method="post" name="adminAccountInsertForm"> -->
						<input type="hidden" id ="user_id" name="user_id" value="${getUserDetail.user_id}" />
						<input type="hidden" id="searchCondition" name="searchCondition" value="${criteria.searchCondition}" /> 
						<input type="hidden" id="searchKeyword" name="searchKeyword" value="${criteria.searchKeyword}" /> 
						<input type="hidden" id="selectCondition" name="selectCondition" value="${criteria.selectCondition}" />
						<table class="table text-center">
							<thead class="table-dark">
								<tr>
									<th colspan=3>회원정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>이름</th>
									<td>${getUserDetail.user_name}</td>
									<td></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>${getUserDetail.user_id}</td>
									<td></td>
								</tr>
								<tr>
									<th>구분</th>
									<td colspan=2><select class="form-select form-select-sm"
									aria-label=".form-select-sm example" name="user_sub">
										
										<c:if test="${getUserDetail.user_sub eq '1'}">
											<c:set var="selectedSub" value="selected" />
										</c:if>
										<c:if test="${getUserDetail.user_sub eq '0'}">
											<c:set var="selectedNormal" value="selected" />
										</c:if>
										<option value="1" ${selectedSub}>구독회원</option>
										<option value="0" ${selectedNormal}>일반회원</option>
								</select></td>
								
								</tr>
								<tr>
									<th>상태</th>
									<td colspan=2><select class="form-select form-select-sm"
									aria-label=".form-select-sm example" name="user_state">
										<c:if test="${getUserDetail.user_state eq 0}">
											<c:set var="selectedNormalUser" value="selected" />
										</c:if>
										<c:if test="${getUserDetail.user_state eq 1}">
											<c:set var="selectedBlackUser" value="selected" />
										</c:if>
										<c:if test="${getUserDetail.user_state eq 2}">
											<c:set var="selectedWithdrawalUser" value="selected" />
										</c:if>
										<option value="0" ${selectedNormalUser}>정상회원</option>
										<option value="1" ${selectedBlackUser}>블랙회원</option>
										<option value="2" ${selectedWithdrawalUser}>탈퇴회원</option>	
								</select></td>
								
								</tr>
								<tr>
									<td colspan='2'><h6 style="color: red;" id="id_check"></h6></td>
									<td></td>
								</tr>
								<tr>
									<th>새 비밀번호</th>
									<td colspan=2><input class="form-control" type="password"
										name="user_password" onkeyup="passwordCheckFunction()"
										id="user_password" style="float: left;"
										placeholder="비밀번호를 입력하세요" value="" /></td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td colspan=2><input class="form-control" type="password"
										onkeyup="passwordCheckFunction()" id="user_passwordCheck"
										style="float: left;" placeholder="비밀번호 확인" value="" /></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td colspan=2><input class="form-control" type="text"
										id="user_phone" name="user_phone" maxlength="11"
										style="float: left;" placeholder="전화번호를 입력하세요"
										value="${getUserDetail.user_phone}" /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td colspan=2><input class="form-control" type="email"
										id="user_email" name="user_email" style="float: left;"
										placeholder="이메일을 입력하세요" value="${getUserDetail.user_email}" /></td>
								</tr>
								<tr>
									<th>포인트</th>
									<td colspan=2><input class="form-control" type="number"
										id="user_point" name="user_point" style="float: left;"
										placeholder="포인트입력란" value="${getUserDetail.user_point}" /></td>
								</tr>
								<tr>
									<th>쿠폰</th>
									<td>${getUserDetail.user_coupon_cnt}장</td>
									<td></td>
								</tr>
								<tr>
									<td colspan=2><h6 style="color: red;"
											id="passwordCheckMessage"></h6></td>
									<td><button type="submit"
											class="btn btn-light btn-outline-dark" style="float: right;">수정</button>
										<button type="button"
									class="btn btn-light btn-outline-dark"
									style="float: right;" id="returnListBtn">목록</button>
									</td>

								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<div class="col-md-12">
					<form>
						<div class="card border-light">
							<div class="card-header">쿠폰</div>
							<div class="card-body">
								<div class="mb-3">
									<table class="table text-center">
										<!-- <thead></thead> -->
										<tbody>
											<tr>
												<th style="width:25%">지급가능</th>
												<td>
													<select class="form-select form-select mb-3"
														aria-label=".form-select-lg example" id="giveCouponList" name="giveCouponList">
														<c:if test="${couponVOListSize ne 0}">
															<c:forEach items="${couponVOList}" var="giveCoupon">
																<option value="${giveCoupon.coupon_seq}">${giveCoupon.coupon_name}</option>
															</c:forEach>
														</c:if>
														<c:if test="${couponVOListSize <= 0}">
															<option value="0">지급가능 쿠폰 없음</option>
														</c:if>
													</select>
												</td>
												<td>
													<button type="button" class="btn btn-outline-dark btn-sm" onclick="giveCoupon()">지급</button>
												</td>
											</tr>
											<tr>
												<th>보유쿠폰</th>
												<td>
													<select class="form-select form-select mb-3"
														aria-label=".form-select-lg example" id="myCouponMap" name="myCouponMap">
														<c:forEach items="${myCouponMap}" var="couponMap">
															<option value="${couponMap.key}">${couponMap.value}</option>
														</c:forEach>
													</select>
												</td>
												<td>
													<button type="button" class="btn btn-outline-dark btn-sm" onclick="couponDelete()">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- <div class="card-footer">
								<button type="button"
									class="btn btn-light btn-outline-dark btn-sm"
									style="float: right;">수정</button>
							</div> -->
						</div>
					</form>
					<hr/>
					<form>
						<div class="card border-light">
							<div class="card-header">마일리지</div>
							<div class="card-body">
								<div class="mb-3">
									<table class="table text-center">
										<!-- <thead></thead> -->
										<tbody>
											<tr><td>123</td></tr>
											<tr><td>123</td></tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer">
								<button type="button"
									class="btn btn-light btn-outline-dark btn-sm"
									style="float: right;">수정</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<form name="detailForm" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" /> 
		<input type="hidden" id="searchCondition" name="searchCondition" value="${criteria.searchCondition}" /> 
		<input type="hidden" id="searchKeyword" name="searchKeyword" value="${criteria.searchKeyword}" /> 
		<input type="hidden" id="selectCondition" name="selectCondition" value="${criteria.selectCondition}" /> 
		<input type="hidden" id="user_sub" name="user_sub" value="${getUserDetail.user_sub}" />
	</form>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<!-- 테이블 내부 값 수정 input타입 -->
	<script src="/js/admin_member_Detail.js"></script>
	<script>
	<!-- List 페이지로 돌아갈때 페이지 유지 -->
		$("#returnListBtn")
				.click(
						function() {
							let url = "getAdmin_member_List.mdo?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&selectCondition=${criteria.selectCondition}";
							/* let url = "getAdmin_member_List.mdo"; */
							location.href = url;
						});
	</script>
</body>
</html>