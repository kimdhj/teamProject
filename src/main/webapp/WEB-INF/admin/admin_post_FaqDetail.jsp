<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_FaqDetail.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">FAQ 상세보기</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1"></div>
				<div class="col-2 me-2 mt-3">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level1" name="level1" aria-label="Default select example">
							<option class="fs-5" value="">${faq.FAQ_bigsort }</option>
						</select>
					</div>
				</div>

				<!-- 주문/결제 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select1">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level2" name="level2" aria-label="Default select example">
							<option class="fs-5" value="">${faq.FAQ_smallsort }</option>
						</select>
					</div>
				</div>
				
				<div class="row"></div>
					<div class="col-1" style="font-weight: bolder; font-size: 1.2vw; margin-left: 8%; margin-bottom: 1%; padding-left: 0; padding-right: 0;">FAQ 제목</div>
					<div class="col-6" style="padding-left: 0;  margin-bottom: 1%; font-size: 1.2vw; font-weight: light;">
						<input id="input" class="col-6" type="text" style="text-align: center; width: 100%;" value="${faq.FAQ_ask }" readonly/>
					</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row" id="content">${faq.FAQ_answer }</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1" onclick="location.href='/admin_post_FaqUpdate.mdo?Faq_seq=${faq.FAQ_seq}&seq=${svo.seq }'">수정</button>
				<button class="col-auto bg-white border-1 faqlist">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
		
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<!-- 알림창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_FaqDetail.js"></script>
</body>
</html>