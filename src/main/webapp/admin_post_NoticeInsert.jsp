<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_post_NoticeInsert.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">공지사항 작성 및 수정</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1 mt-2 mb-2 notice_font">제목</div>
				<div class="col-3" style="padding-left: 0px;">
					<input type="text"
						style="width: 90%; margin-top: 2%; margin-bottom: 2%;">
				</div>
				<div class="col-1 notice_font" style="padding-right: 0px;">파일첨부</div>
				<div class="col-3 " style="padding-left: 0px;">
					<input type="file" style="margin-top: 2%; margin-bottom: 2%;">
				</div>
				<div class="row"></div>
				<div class="col-1 mb-2 notice_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">31394</div>
				<div class="col-1 mb-2 notice_font" style="padding-right: 0px;">지점</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">관리자</div>
				<div class="col-1 mb-2 notice_font"
					style="padding-right: 0px; margin-left: 5%;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;">2018.08.14</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row"></div>
				<div class="summernote"></div>
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
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1">등록</button>
				<button class="col-auto bg-white border-1 noticedel">삭제</button>
				<button class="col-auto bg-white border-1 noticelist">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_NoticeInsert.js"></script>
</body>
</html>