<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
        <link href="/css/my_AddReadInfo.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

        <jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

        <!-- 여기 삽입 -->
        <div id="main_wrapper" class="row">
            <div class="col">
                <div id="top_info" class="row">
                    <div id="img_box" class="col-2">
                        <img src="/서점로고.ico" width="100%" height="100%" alt="" id="item_img" />
                    </div>
                    <div class="col" id="text">
                        <div class="row" id="title">
                            <div id="item_title" class="col-5 row  ">구독상품 이름</div>
                            <div id="btn_box" class="col-7 row gy-1">
                                <div class="col-lg col-sm-12" id="cancel_btn"><button type="button"
                                        class="btn btn-danger">구독
                                        취소</button>
                                </div>
                                <div class="col-lg col-sm-12" id="modify_btn"><button type="button"
                                        class="btn btn-info">구독
                                        정보
                                        변경</button></div>
                            </div>
                        </div>
                        <div class="row" id="subtitle">월 결제 금액:20000원</div>
                        <div class="row" id="itemtText">
                            상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <div id="personal_info" class="row">
                    <div id="months">
                        <div id="months_name">이승재님</div>
                        <div id="months_count">10</div>
                        <div id="months_etc">개월 째 이용 중 입니다.</div>
                    </div>
                    <div id="money">
                        <div id="money_title">지금 까지 결제 금액:</div>
                        <div id="money_count">20000 원</div>

                    </div>
                    <div id="nowBook">
                        <div id="nowBook_title">현재 대여책:</div>
                        <div id="nowBook_content">오늘도 놀고 싶다</div>
                    </div>
                    <div id="nextBook">
                        <div id="nowBook_title">현재 대여책:</div>
                        <div id="nowBook_content">오늘도 놀고 싶다</div>
                    </div>
                    <div id="selectType">
                        <div id="selectType_title">선택된 장르:</div>
                        <div id="selectType_content">무협,소설,로맨스</div>
                    </div>
                </div>
                <div id="rec_book" class="row">
                    <div class="row g-0 gx-5 align-items-end">
                        <div class="col-lg-6">
                            <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s"
                                style="max-width: 500px;">
                                <h1 class="display-5 mb-3">신작</h1>
                                <p>도서목록</p>
                            </div>
                        </div>

                    </div>
                    <div class="tab-content">
                        <!-- 탭1 시작 -->
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="/img/product1-1.jpg" alt="">
                                            <div
                                                class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                                월간</div>
                                        </div>
                                        <div class="text-center p-4">
                                            <a class="d-block h5 mb-2" href="">역행자</a>
                                            <span class="text-primary me-1">15,750</span>
                                            <span class="text-body text-decoration-line-through">17,500</span>
                                        </div>
                                        <div class="d-flex border-top">
                                            <small class="w-50 text-center border-end py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                            </small>
                                            <small class="w-50 text-center py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add
                                                    to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="/img/product1-2.jpg" alt="">
                                            <div
                                                class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                                New</div>
                                        </div>
                                        <div class="text-center p-4">
                                            <a class="d-block h5 mb-2" href="">Fresh Tomato</a>
                                            <span class="text-primary me-1">$19.00</span>
                                            <span class="text-body text-decoration-line-through">$29.00</span>
                                        </div>
                                        <div class="d-flex border-top">
                                            <small class="w-50 text-center border-end py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-eye text-primary me-2"></i>View
                                                    detail</a>
                                            </small>
                                            <small class="w-50 text-center py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add
                                                    to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6  wow fadeInUp" data-wow-delay="0.5s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="/img/product1-3.jpg" alt="">
                                            <div
                                                class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                                New</div>
                                        </div>
                                        <div class="text-center p-4">
                                            <a class="d-block h5 mb-2" href="">Fresh Tomato</a>
                                            <span class="text-primary me-1">$19.00</span>
                                            <span class="text-body text-decoration-line-through">$29.00</span>
                                        </div>
                                        <div class="d-flex border-top">
                                            <small class="w-50 text-center border-end py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-eye text-primary me-2"></i>View
                                                    detail</a>
                                            </small>
                                            <small class="w-50 text-center py-2">
                                                <a class="text-body" href=""><i
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add
                                                    to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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