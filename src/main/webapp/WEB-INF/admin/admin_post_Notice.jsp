<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Notice.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">전체 공지사항</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<!-- 기간 조회 -->
				<div class="col-2"></div>
				<div class="col-10" id="day_select">
					<div id="day_calendar" class="col-5" style="margin-top: 1%;">
						<input class="col-4" placeholder="시작날짜" type="text"
							id="start_date" style="height: 50px; margin-top: 2%; text-align:center;" />
						<div class="notice_font">~</div>
						<input class="col-4" placeholder="마지막 날짜" type="text"
							id="end_date" style="height: 50px; margin-top: 2%; text-align:center;" />
						<div id="day_btn" class="col-7">
							<div id="dayAdd" class="btn-group me-2" role="group"
								aria-label="Second group">
								<button type="button" class="btn btn-secondary week">1주일</button>
								<button type="button" class="btn btn-secondary month">1개월</button>
								<button type="button" class="btn btn-secondary threemonth">3개월</button>
								<button type="button" class="btn btn-secondary sixmonth">6개월</button>
								<button type="button" class="btn btn-secondary year">1년</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
				<div class="col-1 me-2 mt-3" style="padding-left: 0px;">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example"
							style="margin-left: 3%;">
							<option class="fs-5" value="1">번호</option>
							<option class="fs-5" value="2">제목</option>
							<option class="fs-5" value="3">내용</option>
						</select>
					</div>
				</div>
				<div class="col-3  me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" type="text" placeholder="검색할 내용 입력">
					</div>
				</div>
				<div class="col-auto ">
					<div class="input-group p-0 mt-2  col">
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
						&nbsp;&nbsp;
						<button id="add_btn" class="btn bg-blue text-white rounded-pill col" onclick="location.href='/admin_post_NoticeInsert.jsp'">추가</button>
					</div>

				</div>
				<div class="row d-flex m-1" id="table_box">
					<table class="table" id="table">
						<thead>
							<tr>
								<th><input
									class="form-check-input border-1 border-dark allche"
									type="checkbox" value="" id="flexCheckChecked" checked></th>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일자</th>
								<th><button class="btn btn-warning rounded-pill seldel">선택 삭제</button></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList }" var="notice">
							<tr>
								<td><input class="form-check-input border-1 border-dark delche" type="checkbox" value="" id="flexCheckChecked" checked></td>
								<td>
									<p>${notice.notice_seq }</p>
								</td>
								<td>
									<p class="rowColumn">
									<a href="/admin_post_NoticeDetail.mdo?notice_seq=${notice.notice_seq}">
									${notice.notice_title }
									</a>
									</p>
								</td>
								<td>
									<p class="selectColumn">${notice.notice_writer }</p>
								</td>
								<td>
									<p class="rowColumn">
										<fmt:formatDate value="${notice.notice_date }" pattern="yyyy-MM-dd"/>
									</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del" onclick="del(${notice.notice_seq})">삭제</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script>
<!-- 알림창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_Notice.js"></script>

</body>
</html>