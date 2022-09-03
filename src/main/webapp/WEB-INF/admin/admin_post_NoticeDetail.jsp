<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_NoticeDetail.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">공지사항 상세보기</button>
		</div>
		
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1 mt-2 mb-2 notice_font" style="text-align: center;">제목</div>
				<div class="col-3" style="padding-left: 0px;">
					${notice.notice_title }
				</div>
				<div class="col-1 notice_font" style="padding-right: 0px; text-align: center;" >파일첨부</div>
				<div class="col-3 " style="padding-left: 0px;">
					${notice.notice_fileName }
				</div>
				<div class="col-1 notice_font" style="padding-right: 0px; text-align: center;" >작성자</div>
				<div class="col-3 " style="padding-left: 0px;">
					${notice.notice_writer }
				</div>
				<div class="row"></div>
				<div class="col-1 mb-2 notice_font" style="text-align: center;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;" id="test">${notice.notice_seq }</div>
				<div class="col-1 mb-2 notice_font" style="text-align: center;">지점</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">
					${notice.notice_location }
				</div>
				<div class="col-1 mb-2 notice_font" style="padding-right: 0px; text-align: center;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;" >
					<fmt:formatDate value="${notice.notice_date }" pattern="yyyy-MM-dd"/>
				</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row"></div>
				<div class="row" id="content">${notice.notice_content }</div>
			</div>
		</div>
		
		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1" onclick="location.href='/admin_post_NoticeUpdate.mdo?notice_seq=${notice.notice_seq}'">수정</button>
				<button class="col-auto bg-white border-1 noticelist" id="list">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
		
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_NoticeDetail.js"></script>
</body>
</html>