<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container">
		<div class="d-flex flex-row align-items-center">
			<div class="col-md-12">
				<!-- 수정가능 테이블 -->
				<table class="table">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>구분</th>
							<th>생년월일</th>
							<th>연락처</th>
							<th>Email</th>
							<th>마일리지</th>
							<th>보유쿠폰</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="도원경">${getUserDetail.user_name}</p>
							</td>
							<td>
								<p class="" contenteditable="false" data-default="sosohan">${getUserDetail.user_id}</p>
							</td>
							<td><select class="form-select form-select-sm"
								aria-label=".form-select-sm example">
									<option selected>구독</option>
									<option value="1">일반</option>
									<option value="2">블랙</option>
							</select></td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="2020-01-21">${getUserDetail.user_birth}</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="010-3212-1345">${getUserDetail.user_phone}</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="tommy@hanmail.net">${getUserDetail.user_email}</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="123,414,223p">${getUserDetail.user_point}p</p>
							</td>
							<td>
								<div class="d-flex justify-content-center">
									<p class="rowColumn" contenteditable="false" data-default="22">${getUserDetail.user_coupon_cnt}</p>
									<p>장</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 수정가능 테이블 끝 -->
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<%-- <button type="button" class="btn btn-light btn-outline-dark btn-sm"
					style="float: right;" onclick="location.href='getAdmin_member_List.mdo?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}';">목록</button> --%>
				<button type="button" class="btn btn-light btn-outline-dark btn-sm"	style="float: right;" id="returnListBtn">목록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-light btn-outline-dark btn-sm"
					style="float: right;">수정</button>
					
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-6">
				<form>
					<div class="card border-light">
						<div class="card-header">쪽지</div>
						<div class="card-body">
							<div class="mb-3">
								<textarea class="form-control" id="" rows="10"></textarea>
							</div>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-light btn-outline-dark btn-sm" style="float: right;">전송</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>
	
	<form name="detailForm" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" />
		<input type="hidden" id="searchCondition" name="searchCondition" value="${criteria.searchCondition}" />
		<input type="hidden" id="searchKeyword" name="searchKeyword" value="${criteria.searchKeyword}" />
	</form>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<!-- 테이블 내부 값 수정 input타입 -->
	<script src="/js/admin_member_Detail.js"></script>
	<script>
	<!-- List 페이지로 돌아갈때 페이지 유지 -->
	$("#returnListBtn").click(function(){
		let url = "getAdmin_member_List.mdo?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}";
		/* let url = "getAdmin_member_List.mdo"; */
		location.href = url;
	});

	</script>

</body>
</html>