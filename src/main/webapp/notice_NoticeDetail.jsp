<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Common head include -->
        <jsp:include page="commonjsp/common_head.jsp"></jsp:include>
        <!-- 여기에 css 관련  -->
        <link href="./css/notice_NoticeDetail.css" rel="stylesheet">
    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->


        <!-- Page Header End -->
        <!-- 여기서부터 바디 작업 하면됨 -->

        <div class="row" id="inner_box">
            <div class="col-3"></div>
            <div class="col">
                <div class="row d-flex align-items-end fs-2" id="main_title">
                    공지사항<div class="col-auto m-0  h1" id="subtitle">낭만서점의 새로운 소식과 공지사항을 알려드립니다.</div>
                </div>
                <div class="row mt-2 " id="table_titleLine">
                    <div class="col-3 fs-3 bg-gray border-2 border-top border-dark m-0 p-3 text-center align-items-center"
                        id="title">제목
                    </div>
                    <div class="col d-flex align-items-center fs-3 border-2 border-top border-dark " id="content">어쩌고
                        저쩌고
                    </div>
                </div>
                <div class="row" id="table">
                    <div class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom  text-center align-items-center "
                        id="title">지점
                    </div>
                    <div class="col d-flex align-items-center border-2 border-top border-gray border-bottom"
                        id="content">
                        관리자
                    </div>
                    <div class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom  text-center align-items-center  "
                        id="title">등록일
                    </div>
                    <div class="col d-flex align-items-center border-2 border-top border-gray
                                border-bottom" id="content">2022-08-02</div>
                </div>
                <div class="row" id="Content"></div>
                <div class="row d-flex justify-content-end bg-gray" id="endPoint">
                    맨위로<i class="bi bi-caret-up-fill col-auto"></i>
                </div>
                <div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
                    <button class="col-auto bg-white border-1">
                        목록
                    </button>
                    <button class="col-auto bg-white border-1">
                        <i class="bi bi-caret-right-fill"></i>
                    </button>

                </div>
            </div>
            <div class="col-2"></div>
        </div>



        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="commonjsp/common_footer.jsp"></jsp:include>
        <!-- 여기에 js관련  -->

        <!-- Footer End -->
    </body>

    </html>