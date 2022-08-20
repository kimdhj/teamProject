<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
        <link href="/css/my_Coupon.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

        <jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

        <!-- 여기 삽입 -->

        <div class="row" id="main_wrapper">
            <div class="row" id="under_menu">
                <div class="row" id="discount">
                    <div class="row" id="top_sum">
                        <div class="col-auto" id="under_topText">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-ticket-perforated-fill" viewBox="0 0 16 16">
                                <path
                                    d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5V6a.5.5 0 0 1-.5.5 1.5 1.5 0 0 0 0 3 .5.5 0 0 1 .5.5v1.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 11.5V10a.5.5 0 0 1 .5-.5 1.5 1.5 0 1 0 0-3A.5.5 0 0 1 0 6V4.5Zm4-1v1h1v-1H4Zm1 3v-1H4v1h1Zm7 0v-1h-1v1h1Zm-1-2h1v-1h-1v1Zm-6 3H4v1h1v-1Zm7 1v-1h-1v1h1Zm-7 1H4v1h1v-1Zm7 1v-1h-1v1h1Zm-8 1v1h1v-1H4Zm7 1h1v-1h-1v1Z" />
                            </svg>
                            할인쿠폰
                        </div>
                        <div class="col"></div>
                        <div class="col-auto">
                            <button id="coupon_add" type="button" class="btn btn-warning rounded-pill">쿠폰
                                추가</button>
                        </div>
                    </div>

                    <div class="row" id="table">
                        <div id="table_title" class="row">
                            <div class="col-4">발행일</div>
                            <div class="col">쿠폰명</div>
                            <div class="col">할인</div>
                          

                        </div>

                        <div id="table_item" class="row">
                            <div class="col-4">2022-11-17</div>
                            <div class="col">잘생김 주의</div>
                            <div class="col">101%</div>
                        
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-4">2022-11-17</div>
                            <div class="col">잘생김 주의</div>
                            <div class="col">101%</div>
                           
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-4">2022-11-17</div>
                            <div class="col">잘생김 주의</div>
                            <div class="col">101%</div>
                            
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
                <div class="row ps-5 pe-5 hide" id="coupon_popUp">
                    <div class="row bg-secondary p-2 border-dark border-top border-start border-end border-solid border-1 "
                        id="close_popUP">
                        <div class="col"></div>
                        <div class="col-auto">
                            <button id="popup_close" type="button" class="btn-close" aria-label="Close"></button>
                        </div>
                    </div>
                    <div id="body_popUp"
                        class="row bg-body border-dark border-bottom border-start border-end border-solid border-1 ">
                        <div class="col-auto mt-2" id="under_topText">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-ticket-perforated-fill" viewBox="0 0 16 16">
                                <path
                                    d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5V6a.5.5 0 0 1-.5.5 1.5 1.5 0 0 0 0 3 .5.5 0 0 1 .5.5v1.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 11.5V10a.5.5 0 0 1 .5-.5 1.5 1.5 0 1 0 0-3A.5.5 0 0 1 0 6V4.5Zm4-1v1h1v-1H4Zm1 3v-1H4v1h1Zm7 0v-1h-1v1h1Zm-1-2h1v-1h-1v1Zm-6 3H4v1h1v-1Zm7 1v-1h-1v1h1Zm-7 1H4v1h1v-1Zm7 1v-1h-1v1h1Zm-8 1v1h1v-1H4Zm7 1h1v-1h-1v1Z" />
                            </svg>
                            할인쿠폰
                        </div>
                        <div class="row mt-4" id="input_line">
                            <div class="col-1"></div>
                            <div class="col row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing-default">
                                        </di>
                                    </div>
                                </div>
                                <div class="col-auto mt-2 align-items-center">
                                    <button id="coupon_insert" class="bg-primary rounded-pill border-0 text-center">쿠폰
                                        등록</button>
                                </div>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row mt-4" id="text_box">
                            <div class="align-items-center" id="popup_textTitle">
                                안내
                                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                    class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                                </svg>
                            </div>
                            <div class="row mt-2 mb-4" id="popup_alert">
                                등록하신 할인 쿠폰은 사용할 수 없습니다.
                            </div>
                        </div>
                    </div>


                </div>

                <div class="row" id="pointMoney">

                    <div class="row" id="top_sum">
                        <div class="col-auto" id="under_topText">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-cash-coin" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                                <path
                                    d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                                <path
                                    d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                                <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                            </svg>
                            마일리지
                        </div>
                        <div class="col"></div>
                        <div class="col-auto">
                            <button id="coupon_add" type="button" class="btn btn-warning rounded-pill">마일리지
                                충전</button>
                        </div>
                    </div>
                    <div class="row mt-2" id="select_cash">
                        <div class="col-auto align-self-center" id="text">조회 기간</div>
                        <div class="col-auto align-self-center m-0" id="day_select">
                            <select class="form-select form-select-lg" aria-label=".form-select-lg example">

                                <option value="1">1개월</option>
                                <option value="3">3개월</option>
                                <option value="6">6개월</option>
                                <option value="12">1년</option>
                            </select>
                        </div>
                        <div class="col"></div>
                        <div class="col-auto row p-0" id="btn_box">
                            <button type="button"
                                class="border-0 bg-success col-auto me-2 rounded-pill text-white">전체</button>
                            <button type="button"
                                class="bg-success border-0 rounded-pill col-auto me-2 rounded-pill text-white">적립</button>
                            <button type="button"
                                class="bg-success border-0 rounded-pill col-auto me-2 rounded-pill text-white">사용</button>
                        </div>
                    </div>
                    <div class="row" id="table">
                        <div id="table_title" class="row">
                            <div class="col-3">일자</div>
                            <div class="col-3">내용</div>
                            <div class="col-3">적립금액</div>
                            <div class="col-3">사용금액</div>
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">책 구매 사용</div>
                            <div class="col-3">12,500P</div>
                            <div class="col-3">-12,500P</div>
                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">책 구매 사용</div>
                            <div class="col-3">12,500P</div>
                            <div class="col-3">-12,500P</div>

                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">책 구매 사용</div>
                            <div class="col-3">12,500P</div>
                            <div class="col-3">-12,500P</div>

                        </div>
                        <div id="table_item" class="row">
                            <div class="col-3">2022-11-17</div>
                            <div class="col-3">책 구매 사용</div>
                            <div class="col-3">12,500P</div>
                            <div class="col-3">-12,500P</div>

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

            </div>




        </div>
        <jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>

        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
        <script src="js/my_Coupon.js"></script>
        < !--Footer End-->

    </body>

    </html>