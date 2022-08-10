<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foody - Organic Food Website Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
    rel="stylesheet">

  <!-- Icon Font Stylesheet -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/event_List.css" rel="stylesheet">

</head>

<body>
  <!-- Spinner Start -->
  <div id="spinner"
    class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" role="status"></div>
  </div>
  <!-- Spinner End -->


  <!-- Navbar Start -->
  <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
    <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
      <div class="col-lg-6 px-5 text-start">
        <small><i class="fa fa-map-marker-alt me-2"></i>123 Street, New York, USA</small>
        <small class="ms-4"><i class="fa fa-envelope me-2"></i>info@example.com</small>
      </div>
      <div class="col-lg-6 px-5 text-end">
        <small>Follow us:</small>
        <a class="text-body ms-3" href=""><i class="fab fa-facebook-f"></i></a>
        <a class="text-body ms-3" href=""><i class="fab fa-twitter"></i></a>
        <a class="text-body ms-3" href=""><i class="fab fa-linkedin-in"></i></a>
        <a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
      </div>

    </div>

    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
      <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
        <h1 class="fw-bold text-primary m-0">낭<span class="text-secondary">만</span>서점</h1>
      </a>
      <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">


          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공지사항</a>
            <div class="dropdown-menu m-0">
              <a href="blog.html" class="dropdown-item">소개</a>
              <a href="feature.html" class="dropdown-item">공지사항</a>
              <a href="testimonial.html" class="dropdown-item">Q&A</a>

            </div>
          </div>
          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">국내 도서</a>
            <div class="dropdown-menu m-0">
              <a href="blog.html" class="dropdown-item">아동 서적</a>
              <a href="feature.html" class="dropdown-item">무협 서적</a>
              <a href="testimonial.html" class="dropdown-item">SF소설</a>
              <a href="404.html" class="dropdown-item">수필</a>
              <a href="404.html" class="dropdown-item">참고서</a>
              <a href="404.html" class="dropdown-item">문제집</a>
            </div>
          </div>
          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">외국도서</a>
            <div class="dropdown-menu m-0">
              <a href="blog.html" class="dropdown-item">아동 서적</a>
              <a href="feature.html" class="dropdown-item">무협 서적</a>
              <a href="testimonial.html" class="dropdown-item">SF소설</a>
              <a href="404.html" class="dropdown-item">수필</a>
              <a href="404.html" class="dropdown-item">참고서</a>
              <a href="404.html" class="dropdown-item">문제집</a>
            </div>
          </div>
          <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">신간</a>
            <div class="dropdown-menu m-0">
              <a href="blog.html" class="dropdown-item">아동 서적</a>
              <a href="feature.html" class="dropdown-item">무협 서적</a>
              <a href="testimonial.html" class="dropdown-item">SF소설</a>
              <a href="404.html" class="dropdown-item">수필</a>
              <a href="404.html" class="dropdown-item">참고서</a>
              <a href="404.html" class="dropdown-item">문제집</a>
            </div>
          </div>
          <a href="product.html" class="nav-item nav-link">이벤트</a>


        </div>
        <div class="d-none d-lg-flex ms-2">
          <p id="search_btn" class="btn-sm-square bg-white rounded-circle ms-3" href="">
            <small class="fa fa-search text-body"></small>
          </p>
          <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
            <small class="fa fa-user text-body"></small>
          </a>
          <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
            <small class="fa fa-shopping-bag text-body"></small>
          </a>
        </div>
      </div>
    </nav>
    <form id="main_search" class="row g-3 hide">
      <div class="col"></div>
      <div class="col-auto">
        <label for="inputPassword2" class="visually-hidden">Password</label>
        <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-primary mb-3">검색</button>
      </div>
    </form>
  </div>
  <!-- Navbar End -->

  <!-- 내용 start -->

  <div class="row" id="main_wrapper">
    <div class="col-2"></div>
    <!-- Blog Start -->
    <div class="col">


      <div class="container-xxl py-5">
        <div class="container">
          <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s"
            style="max-width: 100%;">
            <h1 class="display-5 mb-3">이벤트</h1>
            <p id="bottomRow">낭만서점에서만 만날 수 있는 특별하고 조촐하고 아름다운 혜택</p>
          </div>


          <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.1s">
              <a href="">
                <img class="img-fluid" src="img/check.jpg" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>10월 출석
                    체크!</small><br>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                    30
                    Oct, 2022</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.3s">
              <a href="">
                <img class="img-fluid" src="img/getReady.png" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>두근두근 뭐가
                    생길까?</small>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                  </small>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.5s">
              <a href="">
                <img class="img-fluid" src="img/getReady.png" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>세근세근 뭐가
                    생길까?</small>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                  </small>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Blog End -->

      <!-- border -->
      <span>
        <p id="dmz"></p>
      </span>
      <!-- border -->

      <!-- 하위 이벤트 -->
      <div class="event_con">
        <ul>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="img/subscribe.JPG">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">낭만서점 회원들만의 구독 서비스!</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">매달 관심인기서적 랜덤 배송!<br>장기 구독시 할인 혜택까지!!</div>
            </div>
            <br>
          </li>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="img/rullet.jpg">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">돌려돌려 돌림판</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">매일 돌림판 돌리고 포인트 받자!<br>낮은 확률로 대박 당첨의 기회를!!
              </div>
            </div>
          </li>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="img/helper.JPG">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">친구야 여기 어때?</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">신규 회원 추천인 기입시 포인트 지급!<br>매달 최고의 추천인에게 추가
                포인트를!
              </div>
            </div>
          </li>
        </ul>

      </div>


      <!-- 하위 이벤트 끝 -->

      <!-- 페이지네이션 -->
      <div class="row" id="goMiddle">


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
        <!-- 페이지네이션 끝 -->
      </div>
    </div>
    <div class="col-2"></div>
  </div>

  <!-- 내용 end -->


  <!-- Footer Start -->
  <div id="footer" class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
    <div id="footer_row" class=" row container py-5">
      <div id="footer_des" class=" g-5">
        <div id="foot_address" class=" col-lg-3 col-md-6">
          <h4 class="text-light mb-4 col-3">Address</h4>
          <p><i class="fa fa-map-marker-alt me-3"></i>&nbsp&nbsp 123 Street, New York, USA</p>
          <p><i class="fa fa-phone-alt me-3"></i>&nbsp +012 345 67890</p>
          <p><i class="fa fa-envelope me-3"></i>&nbsp info@example.com</p>
        </div>



        <div class="row">
          <div class="col-md-4 text-center text-md-start mb-4 mb-md-0">
            <h1 class="fw-bold text-primary mb-4">낭<span class="text-secondary">만</span>서점
            </h1>
          </div>
          <div class="col-md-4 text-center text-md-center mb-4 mb-md-0">
            <p>Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et
              lorem
              et sit, sed
              stet lorem sit clita</p>
          </div>
          <div id="sns_footer" class="col-md-4 text-md-end mb-4 mb-md-0">

            <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-twitter"></i></a>
            <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i
                class="fab fa-facebook-f"></i></a>
            <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-youtube"></i></a>
            <a class="btn btn-square btn-outline-light rounded-circle me-0" href=""><i
                class="fab fa-linkedin-in"></i></a>
          </div>
        </div>




      </div>
    </div>
    <div class="container-fluid copyright">
      <div class="container">
        <div class="row">
          <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
            &copy; <a href="#">Your Site Name</a>, All Right Reserved.
          </div>
          <div class="col-md-6 text-center text-md-end">

            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
            <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer End -->
  <div class="fix">

    <!-- 실시간 -->
    <div class="col-4" id="real_chatSum">
      <div id="real_chat" class="col-12 hide">
        <div class="row" id="real_nav">
          <div class="col-2" id="nav_ico"><i class="bi bi-person-fill"></i></div>
          <div class="col" id="nav_text">
            <div id="text_title">독립서점</div>
            <div id="text_subtitle">응답하는중</div>
          </div>
        </div>
        <div id="real_chatItems">
          <div class="row" id="chat_left">
            <div class="row">

              <div id="item_ico" class="col-2 justify-content-end"><i class="bi bi-person-circle"></i>
              </div>
              <div class="col-10"></div>
            </div>

            <div class="row">

              <div class="col-9" id="content_box">

                <div id="item_content">
                  dfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddd
                </div>
              </div>
              <div class="col-3"></div>
            </div>

          </div>
          <div class="row" id="chat_right">
            <div class="row">
              <div class="col-10"></div>
              <div id="item_ico" class="col-2"><i class="bi bi-person-circle"></i></div>
            </div>

            <div class="row">
              <div class="col-3"></div>
              <div class="col-9" id="content_box">

                <div id="item_content">
                  dfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddd
                </div>
              </div>
            </div>

          </div>


        </div>
        <div class="row" id="real_input">
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username"
              aria-describedby="button-addon2">
            <button class="btn btn-secondary" type="button" id="button-addon2">Button</button>
          </div>
        </div>
      </div>
      <div class="row" id="button_box">

        <button class="btn btn-info" id="chat_button"> 실시간 채팅</button>
      </div>


    </div>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
        class="bi bi-arrow-up"></i></a>
  </div>

  <!-- JavaScript Libraries -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <!-- Template Javascript -->
  <script src="js/main.js"></script>
  <script type="text/javascript">
    $(function () {
      $("#chat_button").click(function () {

        $("#real_chat").toggleClass("hide");
      });
      $("#book_addbtnmain").click(function () {
        var yellow_circle = `<div class="row g-4">
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>`;
        $("#tab-1").append(yellow_circle);
        $("#book_addbtn").remove();
      });
      $("#book_addbtnmain2").click(function () {
        var yellow_circle = `<div class="row g-4">
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
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
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>View
                                            detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>`;
        $("#tab-2").append(yellow_circle);
        $("#book_addbtn2").remove();
      });
      $("#search_btn").click(function () {

        $("#main_search").toggleClass("hide");
      });
      search_btn
    });


  </script>

</body>
</html>