<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Common head include -->
        <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
        <!-- 여기에 css 관련  -->
        <link href="/css/book_Finish.css" rel="stylesheet">
    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->


        <!-- Page Header End -->
        <!-- 여기서부터 바디 작업 하면됨 -->
        <div class="row" id="fin_wrapper">
            <div class="col-2"></div>
            <div id="main_box" class="col p-5 mb-5 rounded">
                <div id="main_title" class="row fs-2 justify-content-center">결제가 완료되었습니다..</div>
                <div class="row mt-5 justify-content-between" id="main_num">
                    <div class="col-auto fs-4" id="num_title">주문번호</div>
                    <div class="col-auto fs-4" id="num_content">2213324212</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_day">
                    <div class="col-auto fs-4" id="day_title">주문날짜</div>
                    <div class="col-auto fs-4" id="day_content">2022년 07월 25일</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_delivery">
                    <div class="col-auto fs-4" id="delivery_title">배송지</div>
                    <div class="col-auto fs-4" id="delivery_content">경북 구미시 인동가산로 436 123번지</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_book">
                    <div class="col-auto fs-4" id="book_title">책 제목</div>
                    <div class="col-auto fs-4" id="book_content">마법 천자문 오늘도 놀자</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_cash">
                    <div class="col-auto fs-4" id="cash_title">총 결제 금액</div>
                    <div class="col-auto row fs-4" id="cash_content">

                        <div class="col-auto p-0 fs-4" id="cash_mid">284,000</div>
                        <div class="col-auto p-0 fs-4" id="cash_suf">원</div>
                    </div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_tool">
                    <div class="col-auto fs-4" id="tool_title">결제 수단</div>
                    <div class="col-auto fs-4" id="tool_content">네이버페이</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_count">
                    <div class="col-auto fs-4" id="count_title">입금 계좌번호</div>
                    <div class="col-auto fs-4" id="count_content">2321-524324-2313-52</div>
                </div>
                <div class="row mt-5 justify-content-between" id="main_bank">
                    <div class="col-auto fs-4" id="bank_title">입금 은행</div>
                    <div class="col-auto fs-4" id="bank_content">신한 은행</div>
                </div>
                <div class="row mt-5 mb-5 justify-content-center" id="main_btns">
                    <div class="col-auto " id="btn_my"><button type="button"
                            class="bg-gray fs-4 border text-white border-gray rounded-pill mb-3 p-3">마이페이지</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-auto " id="btn_main"><button type="button"
                            class="bg-dark fs-4 text-white rounded-pill mb-3 p-3">메인페이지</button></div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>





        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
        <!-- 여기에 js관련  -->

        <!-- Footer End -->
    </body>

    </html>