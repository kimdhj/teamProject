<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
        <link href="/css/my_ConcertWriter.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

     <!-- 여기서부터 원래헤더 대신 삽입 common_mypage_header.jsp 이거 한줄 대신 넣는거 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_newheader.jsp"></jsp:include>
	<!-- 요기서부터 동적 헤더 -->
	<!-- 메인페이지 헤더 내용 -->
	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="row col-9">
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-4 text-dark">이승재 님 </a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">할인쿠폰</a>&nbsp;&nbsp;<a href=""
									class="">22</a>장
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-md-auto align-self-center">
								<a class="fs-6 text-dark">마일리지</a>&nbsp;&nbsp;<a href=""
									class="">223,421,123</a>P
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인페이지 헤더 내용 끝 -->
	<!-- 요기까지 동적헤더 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_sidebar.jsp"></jsp:include>
	<!-- 우측하단 시작 -->
	<div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
		<br>
		<p class="mb-4 fs-5 fw-bold">
			<img src="img/mypage_mainbtn.png" class="rounded float-start"
				alt="...">&nbsp;마이 페이지
			<button type="button" class="btn btn-secondary btn-sm float-end">구독취소</button>
		</p>
	<!-- 여기까지 원래헤더대신 삽입 끝 -->

        <!-- 여기 삽입 -->

        <div class="row" id="main_wrapper">
            <div class="row" id="under_menu">
                <div class="row" id="writerBox">
                    <div id="under_topText">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-book-half" viewBox="0 0 16 16">
                            <path
                                d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
                        </svg>
                        관심 작가
                    </div>
                    <div class="row" id="table">
                        <div id="table_title" class="row">
                            <div class="col-3">관심 등록일</div>
                            <div class="col-3">작가</div>
                            <div class="col">랜덤 책 제목</div>
                            <div class="col-1">선택</div>

                        </div>

                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">호모나 이타다기</div>
                            <div class="col">오늘도 맛있는 이타다기</div>
                            <div class="col-1"><input class="form-check-input" type="checkbox" value=""
                                    id="flexCheckDefault">
                            </div>
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">호모나 이타다기</div>
                            <div class="col">오늘도 맛있는 이타다기</div>
                            <div class="col-1"><input class="form-check-input" type="checkbox" value=""
                                    id="flexCheckDefault">
                            </div>
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">호모나 이타다기</div>
                            <div class="col">오늘도 맛있는 이타다기</div>
                            <div class="col-1"><input class="form-check-input" type="checkbox" value=""
                                    id="flexCheckDefault">
                            </div>
                        </div>
                        <div id="table_bottom" class="row">
                            <nav aria-label="Page     navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                    <div class="row" id="btn_box">
                        <div class="col"></div>
                        <button type="button" class="btn btn-secondary rounded-pill col-auto">작가 삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

        <!-- Footer End -->

    </body>

    </html>