<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
        <link href="/css/my_ConcertWriter.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

        <jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

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
        <jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>

        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>

        <!-- Footer End -->

    </body>

    </html>