<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
        <link href="/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all" defer>
        <link href="/css/my_CancelEtc.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

        <jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

        <!-- 여기 삽입 -->

        <hr>

        <div id="main_wrapper" class="row">
            <div class="row" id="top_menu">

                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_1.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <img class="row" class="img-fluid" src="/img/mypage_delivery_7.png">
                    </div>
                </div>
                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_2.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <img class="row" class="img-fluid" src="/img/mypage_delivery_7.png">
                    </div>
                </div>
                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_3.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <img class="row" class="img-fluid" src="/img/mypage_delivery_7.png">
                    </div>
                </div>
                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_4.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <img class="row" class="img-fluid" src="/img/mypage_delivery_7.png">
                    </div>
                </div>
                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_5.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <img class="row" class="img-fluid" src="/img/mypage_delivery_7.png">
                    </div>
                </div>
                <div class="col" id="order">
                    <div class="col-8 align-self-center" id="main_icon">
                        <div class="row justify-content-center">주문접수0</div>
                        <div id="img" class="row">
                            <img src="/img/mypage_delivery_6.png" class="img-fluid" />
                        </div>
                    </div>
                    <div id="arrowimg" class="col-4 align-self-center justify-content-center">
                        <div id="top_row"></div>
                    </div>
                </div>
                <div class="col" id="top_total">
                    <div id="total_cancel" class="row">
                        <div class="col">취소</div>
                        <div id="top_totalCount" class="col">0 건</div>
                    </div>
                    <div id="total_trade" class="row">
                        <div class="col">교환</div>
                        <div id="top_totalCount" class="col">100건</div>
                    </div>
                    <div id="total_again" class="row">
                        <div class="col">반품</div>
                        <div id="top_totalCount" class="col">0 건</div>
                    </div>
                </div>
                <hr>
            </div>
            <div class="row" id="middle_menu">
                <div class="row" id="day_find">
                    <div class="col-4" id="day_title">기간 조회</div>
                    <div class="col-8 row" id="day_select">
                        <div id="day_calendar" class="col-5">
                            <input class="col-5" placeholder="시작날짜" type="text" id="start_date" />~<input class="col-5"
                                placeholder="마지막 날짜" type="text" id="end_date" />
                        </div>
                        <div id="day_btn" class="col-7">
                            <div id="dayAdd" class="btn-group me-2" role="group" aria-label="Second group">
                                <button type="button" class="btn btn-secondary week">1주일</button>
                                <button type="button" class="btn btn-secondary month">1개월</button>
                                <button type="button" class="btn btn-secondary threemonth">3개월</button>
                                <button type="button" class="btn btn-secondary sixmonth">6개월</button>
                                <button type="button" class="btn btn-secondary year">1년</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row" id="option_find">
                    <div class="col-4" id="option_title">조건 검색</div>
                    <div class="col-8" id="option_select">
                        <div class="col-4" id="option_dropdown"><select class="form-select form-select-sm"
                                aria-label=".form-select-sm example">
                                <option selected>상품명</option>
                                <option value="1">가격</option>
                                <option value="2">장르</option>
                            </select></div>
                        <div class="col" id="option_input">
                            <div class="input-group mb-3 ">
                                <input type="text" class="form-control" placeholder="Recipient's username"
                                    aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <span class="input-group-text" id="basic-addon2">조회</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" id="under_menu">
                <div id="under_topText">
                    <div id="day_start">2022-06-28&nbsp;</div>
                    <div>&nbsp; ~&nbsp;</div>
                    <div id="day_end">2022-07-28&nbsp;</div>
                    <div> 까지의 주문 총</div>
                    <div id="day_count">&nbsp; 0</div>
                    <div> 건</div>
                </div>
                <div class="row" id="table">
                    <div id="table_title" class="row">
                        <div class="col-2">주문 번호</div>
                        <div class="col-2">주문 금액</div>
                        <div class="col-4">상품 정보</div>
                        <div class="col-1">수량</div>
                        <div class="col">주문 상태</div>
                        <div class="col">주문 변경</div>
                    </div>

                    <div id="table_item" class="row">
                        <div class="col-2">213798</div>
                        <div class="col-2">40,000</div>
                        <div class="col-4">재밋고 신나는 마법 천잦문</div>
                        <div class="col-1">1</div>
                        <div class="col">주문 완료</div>
                        <div class="col"><button>변경</button></div>
                    </div>
                    <div id="table_item" class="row">
                        <div class="col-2">213798</div>
                        <div class="col-2">40,000</div>
                        <div class="col-4">재밋고 신나는 마법 천잦문</div>
                        <div class="col-1">1</div>
                        <div class="col">주문 완료</div>
                        <div class="col"><button>변경</button></div>
                    </div>
                    <div id="table_item" class="row">
                        <div class="col-2">213798</div>
                        <div class="col-2">40,000</div>
                        <div class="col-4">재밋고 신나는 마법 천잦문</div>
                        <div class="col-1">1</div>
                        <div class="col">주문 완료</div>
                        <div class="col"><button>변경</button></div>
                    </div>
                    <div id="table_bottom" class="row">
                        <nav aria-label="Page navigation example">
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
            </div>


            <!-- 우측하단 끝 -->
        </div>
        <jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>

        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
        <script src="/datepicker/js/datepicker.js"></script> <!-- Air datepicker js -->
        <script src="/datepicker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
        <script src="/js/my_CancelEtc.js"></script>
        <!-- Footer End -->

    </body>

    </html>