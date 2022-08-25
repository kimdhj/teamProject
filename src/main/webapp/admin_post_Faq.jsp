<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Faq.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">전체 FAQ</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1"></div>
				<div class="col-2 me-2 mt-3">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5">상위 카테고리</option>
							<option class="fs-5 " value="1">주문/결제</option>
							<option class="fs-5 " value="2">배송/수령일 안내</option>
							<option class="fs-5 " value="3">반품/교환/환불</option>
							<option class="fs-5 " value="4">회원</option>
						</select>
					</div>
				</div>

				<!-- 주문/결제 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select1 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">주문</option>
							<option class="fs-5" value="2">결제</option>
							<option class="fs-5" value="3">포인트</option>
							<option class="fs-5" value="4">쿠폰</option>
							<option class="fs-5" value="5">기타</option>
						</select>
					</div>
				</div>
				<!-- 배송 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select2 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">배송료</option>
							<option class="fs-5" value="2">배송안내</option>
							<option class="fs-5" value="3">기타</option>
						</select>
					</div>
				</div>
				<!-- 교환/환불 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select3 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">주문취소/변경</option>
							<option class="fs-5" value="2">반품/교환/환불</option>
							<option class="fs-5" value="3">주의사항</option>
							<option class="fs-5" value="4">기타</option>
						</select>
					</div>
				</div>
				<!-- 회원 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select4 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">회원가입/탈퇴</option>
							<option class="fs-5" value="2">회원정보 확인/변경</option>
							<option class="fs-5" value="3">개인정보 유효기간제</option>
							<option class="fs-5" value="4">기타</option>
						</select>
					</div>
				</div>

				<div class="col-3 me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" type="text" placeholder="검색할 내용 입력">
					</div>
				</div>
				<div class="col-auto ">
					<div class="input-group p-0 mt-2  col">
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
						&nbsp;&nbsp;
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">추가</button>
					</div>
				</div>
			</div>
			<div class="row d-flex m-1" id="table_box">
				<table class="table " id="table">
					<thead>
						<tr>
							<th><input
								class="form-check-input border-1 border-dark allche"
								type="checkbox" value="" id="flexCheckChecked" checked></th>
							<th>번호</th>
							<th>내용</th>
							<th><button class="btn btn-warning rounded-pill seldel">선택
									삭제</button></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input
								class="form-check-input border-1 border-dark delche"
								type="checkbox" value="" id="flexCheckChecked" checked>
							</td>
							<td>
								<p contenteditable="false" data-default="1">1</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="해리포터">해리포터
									불사조 기사단</p>
							</td>
							<td>
								<button class="btn btn-danger rounded-pill del">삭제</button>
							</td>
						</tr>

						<tr>
							<td><input
								class="form-check-input border-1 border-dark delche"
								type="checkbox" value="" id="flexCheckChecked" checked>
							</td>
							<td>
								<p contenteditable="false" data-default="1">1</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="해리포터">해리포터
									불사조 기사단</p>
							</td>
							<td>
								<button class="btn btn-danger rounded-pill del">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<script src="/js/admin_post_Faq.js"></script>
</body>
</html>