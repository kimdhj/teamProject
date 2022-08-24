<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_post_QnaDetail.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">문의 상세보기</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1 mt-2 mb-2 qnaDetail_font">제목</div>
				<div class="col-3" style="padding-left: 0px;">문의 드립니다.</div>
				<div class="row"></div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">31394</div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">qjawns</div>
				<div class="col-1 mb-2 qnaDetail_font"
					style="padding-right: 0px; margin-left: 5%;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;">2018.08.14</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row" id="Content">이거 왜 안되는지 모르겠는데요... 어쩌구 저쩌구</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1">비밀번호</div>
				<div class="col">
					<input type="password">
				</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<button class="col-auto bg-white border-1"
				style="border: 1px solid black;">
				<i class="bi bi-caret-left-fill"></i>
			</button>
			<div class="row col-auto">
				<button class="col-auto bg-white border-1 answer_insert">답변
					등록하기</button>
				<button class="col-auto bg-white border-1 qna_del">문의삭제</button>
				<button class="col-auto bg-white border-1">목록</button>
			</div>
			<button class="col-auto bg-white border-1"
				style="border: 1px solid black;">
				<i class="bi bi-caret-right-fill"></i>
			</button>
		</div>

		<!-- 문의 답변 작성란 -->
		<div class="mb-0 p-0 form1 hide">
			<button id="all" class="select p-2">문의 답변하기</button>
		</div>

		<div id="all_box" class="bg-white w-100 form1 hide">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1 mt-2 mb-2 qnaDetail_font">제목</div>
				<div class="col-3" style="padding-left: 0px;">[답변완료]문의드립니다.</div>
				<div class="col-1 qnaDetail_font" style="padding-right: 0px;">파일첨부</div>
				<div class="col-3" style="padding-left: 0px;">
					<input type="file">
				</div>
				<div class="row"></div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">31394</div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">관리자</div>
				<div class="col-1 mb-2 qnaDetail_font"
					style="padding-right: 0px; margin-left: 5%;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;">2018.08.14</div>
			</div>
		</div>

		<div id="all_box" class="bg-white w-100 hide form1">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row"></div>
				<div class="summernote"></div>
			</div>
		</div>

		<div id="all_box" class="bg-white w-100 hide form1">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1">비밀번호</div>
				<div class="col">
					<input type="password">
				</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2 hide form1"
			id="buttons">
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1 answer_add ">등록</button>
				<button class="col-auto bg-white border-1 answer_del">삭제</button>
				<button class="col-auto bg-white border-1 qna_list">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/js/admin_post_QnaDetail.js"></script>
</body>
</html>