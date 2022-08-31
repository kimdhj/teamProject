<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/notice_NoticeDetail.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>

<div class="row" id="inner_box">
	<div class="col-3"></div>
	<div class="col">
		<div class="row d-flex align-items-end fs-2" id="main_title">
			공지사항
			<div class="col-auto m-0  h1" id="subtitle">낭만서점의 새로운 소식과 공지사항을
				알려드립니다.</div>
		</div>
		<div class="row mt-2 " id="table_titleLine">
			<div class="col-2 bg-gray border-2 border-top border-dark m-0 p-2 text-center align-items-center title">제목</div>
			<div class="col d-flex align-items-center border-2 border-top border-dark">느끼한 까르보나라</div>
		</div>
		<div class="row" id="table">
			<div class="col-2 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">번호</div>
			<div class="col-2 d-flex align-items-center border-2 border-top border-gray border-bottom">12384</div>
			<div class="col-2 bg-gray border-2 border-top m-0 border-gray border-bottom  text-center align-items-center title">지점</div>
			<div class="col-2 d-flex align-items-center border-2 border-top border-gray border-bottom">관리자</div>
			<div class="col-2 bg-gray border-2 border-top m-0 border-gray border-bottom  text-center align-items-center title">등록일자</div>
			<div class="col-2 d-flex align-items-center border-2 border-top border-gray border-bottom">2029.12.28</div>
		</div>
		<div class="row" id="Content"></div>
		<div class="row d-flex justify-content-end bg-gray" id="endPoint">
			맨위로<i class="bi bi-caret-up-fill col-auto"></i>
		</div>
		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<button class="col-auto bg-white border-1">
				<i class="bi bi-caret-left-fill"></i>
			</button>
			<button class="col-auto bg-white border-1">목록</button>
			<button class="col-auto bg-white border-1">
				<i class="bi bi-caret-right-fill"></i>
			</button>
		</div>
	</div>
	<div class="col-2"></div>
</div>
<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
<script src="/js/notice_NoticeDetail.js"></script>
</body>
</html>
