<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_FaqInsert.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">FAQ 추가</button>
		</div>

		<form class="p-0" action="FaqInsert.mdo" name="insert" method="post" id="form" enctype="multipart/form-data">
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
			<div class="col-1"></div>
				<div class="col-2 me-2 mt-3" style="margin-left: 2%;">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level1" name="level1" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5 " value="주문/결제">주문/결제</option>
							<option class="fs-5 " value="배송/수령일 안내">배송/수령일 안내</option>
							<option class="fs-5 " value="반품/교환/환불">반품/교환/환불</option>
							<option class="fs-5 " value="회원">회원</option>
						</select>
					</div>
				</div>

				<!-- 주문/결제 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select1 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level2" name="level2" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="주문">주문</option>
							<option class="fs-5" value="결제">결제</option>
							<option class="fs-5" value="포인트">포인트</option>
							<option class="fs-5" value="쿠폰">쿠폰</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 배송 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select2 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level3" name="level3" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="배송료">배송료</option>
							<option class="fs-5" value="배송안내">배송안내</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 교환/환불 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select3 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level4" name="level4" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="주문취소/변경">주문취소/변경</option>
							<option class="fs-5" value="반품/교환/환불">반품/교환/환불</option>
							<option class="fs-5" value="주의사항">주의사항</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 회원 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select4 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level5" name="level5" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="회원가입/탈퇴">회원가입/탈퇴</option>
							<option class="fs-5" value="회원정보 확인/변경">회원정보 확인/변경</option>
							<option class="fs-5" value="개인정보 유효기간제">개인정보 유효기간제</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				
				<div class="row"></div>
				<div class="col-1"></div>
				<div class="col-1" style="font-weight: bolder; font-size: 1.3vw; margin-left: 2%; margin-bottom: 1%; padding-left: 0; padding-right: 0; margin-right: 1%;">FAQ 제목</div>
				<div class="col-4" style="padding-left: 0;">
					<input id="title" name="FAQ_ask" class="col-6 mb-2" type="text" style="text-align: center; width: 100%; font-size: 1.3vw" />
				</div>
				
				<div class="col-1" style="font-weight: bolder; font-size: 1.3vw; padding-right: 0px; text-align: center; margin-right: 1%; " >파일첨부</div>
				<div class="col-2 " style="padding-left: 0px;">
					<input type="file" name="FAQ_file" style="margin-top: 2%; margin-bottom: 2%;" id="fileName">
				</div>
				
			</div>
		</div>
		
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row"></div>
				<div class="summernote">
				</div>
					<input type="hidden" id="content" name="FAQ_answer"/>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1" style="text-align: center; font-weight: bolder; font-size: 1vw;">비밀번호</div>
				<div class="col">
					<input type="password" id="password" name="FAQ_passwd">
				</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1" type="button" id="register">등록</button>
				<button class="col-auto bg-white border-1 faqlist" type="button">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
		
			<input type="hidden" name="FAQ_bigsort" id="bigsort">
			<input type="hidden" name="FAQ_smallsort" id="smallsort">
		
		</form>
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 알림창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_FaqInsert.js"></script>
</body>
</html>