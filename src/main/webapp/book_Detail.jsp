<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Common head include -->
        <jsp:include page="commonjsp/common_head.jsp"></jsp:include>
        <!-- 여기에 css 관련  -->
        <link href="./css/book_Detail.css" rel="stylesheet">
    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->


        <!-- Page Header End -->
        <!-- 여기서부터 바디 작업 하면됨 -->
        <div id="detail_wrapper" class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <!-- 상단 -->
                <div id="top_total" class="row">
                    <div class="col-3" id="img_box">
                        <img src="./img/book.jpg" height="100%" class="img-fluid" alt="...">
                    </div>
                    <div class="col-9" id="top_content">
                        <div class="row" id="star_box">
                            <div class="col-10" id="star_solo">
                                <form name="myform" id="myform" method="post" action="./save">
                                    <fieldset>
                                        <input disabled type="radio" name="rating" value="5" id="rate1"><label
                                            for="rate1">⭐</label>
                                        <input checked type="radio" name="rating" value="4" id="rate2"><label
                                            for="rate2">⭐</label>
                                        <input disabled type="radio" name="rating" value="3" id="rate3"><label
                                            for="rate3">⭐</label>
                                        <input disabled type="radio" name="rating" value="2" id="rate4"><label
                                            for="rate4">⭐</label>
                                        <input disabled type="radio" name="rating" value="1" id="rate5"><label
                                            for="rate5">⭐</label>
                                    </fieldset>
                                </form>
                            </div>

                        </div>
                        <div id="main_title" class="row">
                            제목
                        </div>
                        <div class="row" id="main_price">
                            <div id="price ">1,9000</div>
                            <div id="unit">원</div>
                        </div>
                        <div class="row" id="main_info">
                            이시카와 가즈오 저 / 김하경 역 | 홍익출판사 | 2015년 11월 25일
                        </div>
                        <div class="row" id="cash_btn">
                            <div class="col-3 " id="cash_button"><button type="button"
                                    class="btn btn-info font-weight-bold rounded-pill">결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
                            </div>
                            <div class="col"></div>
                            <div class="col-7" id="add_cart">
                                <button type="button" class="btn btn-info rounded-pill">장바구니 추가</button>
                            </div>
                            <div class="col-7 hide" id="add_cartCheck">
                                <button type="button" class="btn btn-info border-0 bg-gray rounded-pill">장바구니
                                    삭제</button>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- 하단 -->
                <div id="btns_boxWrwapper" class="row">
                    <div id="btns_box" class="col-sm-7  col-md-5 col-lg-4">
                        <div id="review_btnBox">
                            <button type="button" class="btn btn-success">리뷰</button>
                        </div>

                        <div id="item_btnBox">
                            <button type="button" class="btn btn-success">상세정보</button>
                        </div>
                    </div>


                </div>
                <div id="bottom_detail" class="row">

                    <!-- 리뷰 -->
                    <div class="row" id="reviews">
                        <div class="row" id="review">
                            <div class=" col-3">
                                <img height="100%" src="./img/book.jpg" class="img-fluid" alt="...">
                            </div>
                            <div class="col-9">

                                <div id="review_id" class="row">
                                    <div class="col-8">
                                        아이디
                                    </div>
                                    <div class="col-4" id="heart_box">
                                        <i class="bi bi-heart"></i>
                                    </div>
                                </div>
                                <div class="row" id="review_starBox">
                                    <div class="col-8" id="review_starSolo">
                                        <div class="col-10" id="star_solo">
                                            <form name="myform1" id="myform" method="post" action="./save">
                                                <fieldset>
                                                    <input disabled type="radio" name="rating1" value="5"
                                                        id="rate1"><label for="rate1">⭐</label>
                                                    <input checked type="radio" name="rating1" value="4"
                                                        id="rate2"><label for="rate2">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="3"
                                                        id="rate3"><label for="rate3">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="2"
                                                        id="rate4"><label for="rate4">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="1"
                                                        id="rate5"><label for="rate5">⭐</label>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="thumb_count" class="col-4">
                                        좋아요9999
                                    </div>
                                </div>
                                <div id="review_textBox" class="row">
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                </div>
                            </div>
                        </div>
                        <div class="row" id="review">
                            <div class=" col-3">
                                <img height="100%" src="./img/book.jpg" class="img-fluid" alt="...">
                            </div>
                            <div class="col-9">

                                <div id="review_id" class="row">
                                    <div class="col-8">
                                        아이디
                                    </div>
                                    <div class="col-4" id="heart_box">
                                        <i class="bi bi-heart"></i>
                                    </div>
                                </div>
                                <div class="row" id="review_starBox">
                                    <div class="col-8" id="review_starSolo">
                                        <div class="col-10" id="star_solo">
                                            <form name="myform1" id="myform" method="post" action="./save">
                                                <fieldset>
                                                    <input disabled type="radio" name="rating1" value="5"
                                                        id="rate1"><label for="rate1">⭐</label>
                                                    <input checked type="radio" name="rating1" value="4"
                                                        id="rate2"><label for="rate2">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="3"
                                                        id="rate3"><label for="rate3">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="2"
                                                        id="rate4"><label for="rate4">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="1"
                                                        id="rate5"><label for="rate5">⭐</label>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="thumb_count" class="col-4">
                                        좋아요9999
                                    </div>
                                </div>
                                <div id="review_textBox" class="row">
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                </div>
                            </div>
                        </div>
                        <div class="row" id="review">
                            <div class=" col-3">
                                <img height="100%" src="./img/book.jpg" class="img-fluid" alt="...">
                            </div>
                            <div class="col-9">

                                <div id="review_id" class="row">
                                    <div class="col-8">
                                        아이디
                                    </div>
                                    <div class="col-4" id="heart_box">
                                        <i class="bi bi-heart"></i>
                                    </div>
                                </div>
                                <div class="row" id="review_starBox">
                                    <div class="col-8" id="review_starSolo">
                                        <div class="col-10" id="star_solo">
                                            <form name="myform1" id="myform" method="post" action="./save">
                                                <fieldset>
                                                    <input disabled type="radio" name="rating1" value="5"
                                                        id="rate1"><label for="rate1">⭐</label>
                                                    <input checked type="radio" name="rating1" value="4"
                                                        id="rate2"><label for="rate2">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="3"
                                                        id="rate3"><label for="rate3">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="2"
                                                        id="rate4"><label for="rate4">⭐</label>
                                                    <input disabled type="radio" name="rating1" value="1"
                                                        id="rate5"><label for="rate5">⭐</label>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="thumb_count" class="col-4">
                                        좋아요9999
                                    </div>
                                </div>
                                <div id="review_textBox" class="row">
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                    리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당리뷰입니당
                                </div>
                            </div>
                        </div>
                        <div class="row" id="review_pageNation">

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
                    <!-- 상품정보 -->
                    <div class="row  hide" id="item_detail">
                        <div id="item_imgBox" class="row">
                            <img src="./img/book.jpg" class="img-fluid" alt="...">
                        </div>
                        <div id="item_detailText" class="row">
                            이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이
                            일거야되이책은 정말
                            좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고
                            읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고
                            읽어보면
                            좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되이책은 정말 좋고 읽어보면 좋고 나같은 사람이 일거야되
                        </div>
                    </div>
                </div>
                <!-- 중단 -->
                <div id="middle_recommend" class="row">
                    <div class="row g-0 gx-5 align-items-end">
                        <div class="col-lg-6">
                            <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s"
                                style="max-width: 500px;">
                                <h1 class="display-5 mb-3">추천 상품</h1>

                            </div>
                        </div>

                    </div>
                    <div class="tab-content row">
                        <!-- 탭1 시작 -->
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-1.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-2.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-3.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-4.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-5.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-6.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-7.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                                    <div class="product-item">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100" src="img/product1-8.jpg" alt="">
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
                                                        class="fa fa-shopping-bag text-primary me-2"></i>Add to
                                                    cart</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 탭1 끝 -->
                        <!-- 추가 버튼 -->


                    </div>
                </div>
            </div>
        </div>





        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="commonjsp/common_footer.jsp"></jsp:include>
        <!-- 여기에 js관련  -->
        <script src="js/book_Detail.js"></script>
        <!-- Footer End -->
    </body>

    </html>