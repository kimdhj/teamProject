<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Review.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">전체 리뷰</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-2"></div>
				<div class="col-10" id="day_select">
					<div id="day_calendar" class="col-5" style="margin-top: 1%;">
						<input class="col-3" placeholder="시작날짜" type="text"
							id="start_date"
							style="height: 40px; margin-top: 3%; text-align: center;" />
						<div class="review_font">~</div>
						<input class="col-3" placeholder="마지막 날짜" type="text"
							id="end_date"
							style="height: 40px; margin-top: 3%; text-align: center;" />
						<div id="day_btn" class="col-7">
							<div id="dayAdd" class="btn-group me-2" role="group"
								aria-label="Second group" style="margin-top: 3%;">
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
				<div class="col-2 me-2 mt-3" style="padding-left: 0px;">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example"
							style="margin-left: 1%;">
							<option class="fs-5" value="1">ID</option>
							<option class="fs-5" value="2">이름</option>
							<option class="fs-5" value="3">생년월일</option>
							<option class="fs-5" value="4">책제목</option>
							<option class="fs-5" value="5">작가</option>
							<option class="fs-5" value="6">내용</option>
							<option class="fs-5" value="7">등급</option>
						</select>
					</div>
				</div>
				<div class="col-4  me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" id="category" type="text"
							name="category" placeholder="검색할 내용 입력" aria-label="category"
							aria-describedby="basic-addon1">
					</div>
				</div>
				<div class="col-auto" style="margin-bottom: 10px;">
					<div class="input-group p-0 mt-2  col">
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
						&nbsp;&nbsp;
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">추가</button>
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
								<th>ID</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>책 제목</th>
								<th>작가</th>
								<th>내용</th>
								<th>등록일자</th>
								<th>등급</th>
								<th><button class="btn btn-warning rounded-pill seldel">블라인드</button></th>
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
									<p class="rowColumn" contenteditable="true"
										data-default="eunxi">eunxi</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="은지">은지</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">1998.12.18</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="해리포터">해리포터 불사조 기사단</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="JK.Rowling">JK.Rowling</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">이거 개씹노잼이네 ㅋㅋ;;</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022.08.14 11:50">2022.08.14 11:50</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="구독자">구독자</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">처리</button>
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
									<p class="rowColumn" contenteditable="true"
										data-default="qjawns">qjawns</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="범준">범준</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">1998.12.18</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="해리포터">해리포터 불사조 기사단</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="JK.Rowling">JK.Rowling</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">이딴걸 파냐 엿먹어라</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022.08.14 11:50">2022.08.14 11:50</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="구독자">구독자</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">처리</button>
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
									<p class="rowColumn" contenteditable="true"
										data-default="dongdong">dongdong</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="동현">동현</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">1998.12.18</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="해리포터">해리포터 불사조 기사단</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="JK.Rowling">JK.Rowling</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">굿~!</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022.08.14 11:50">2022.08.14 11:50</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="일반">일반</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">처리</button>
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
									<p class="rowColumn" contenteditable="true"
										data-default="eunxi">eunxi</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="은지">은지</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">1998.12.18</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="해리포터">해리포터 불사조 기사단</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="JK.Rowling">JK.Rowling</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false">포항항 너무 재미써영</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022.08.14 11:50">2022.08.14 11:50</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="구독자">구독자</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">처리</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script>
<script src="/js/admin_post_Review.js"></script>
</body>
</html>