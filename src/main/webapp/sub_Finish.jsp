<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Common head include -->
        <jsp:include page="commonjsp/common_head.jsp"></jsp:include>
        <!-- 여기에 css 관련  -->
        <link href="./css/sub_Finish.css" rel="stylesheet">
    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->


        <!-- Page Header End -->
        <!-- 여기서부터 바디 작업 하면됨 -->

        <div class="row" id="fin_wrapper">
            <div class="col-2"></div>
            <div id="main_box" class="col p-5 mb-5 rounded">
                <div id="main_title" class="row fs-2 justify-content-center">구독을 환영합니다.</div>
                <div class="row mt-5 justify-content-between" id="main_day">
                    <div class="col-auto fs-4" id="day_title">기간</div>
                    <div class="col-auto fs-4" id="day_content">2022년 07월 25일 ~ 2023년 07월 25일</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_sub">
                    <div class="col-auto fs-4" id="sub_title">구독 갱신료</div>
                    <div class="col-auto row fs-4" id="sub_content">
                        <div class="col-auto p-0 fs-4" id="sub_pre">월(연)</div>
                        <div class="col-auto p-0 fs-4" id="sub_mid">284,000</div>
                        <div class="col-auto p-0 fs-4" id="sub_suf">원</div>
                    </div>
                </div>
                <div class="row mt-5 mb-5 justify-content-center" id="main_btns">
                    <div class="col-auto fs-4 " id="btn_my"><button type="button"
                            class="bg-gray fs-4  border text-white border-gray rounded-pill p-3">마이페이지</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-auto fs-4 " id="btn_main"><button type="button"
                            class="bg-dark fs-4  text-white rounded-pill p-3">메인페이지</button></div>
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