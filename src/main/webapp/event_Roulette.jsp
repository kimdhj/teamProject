<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foody - Organic Food Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/event_Roulette.css" rel="stylesheet" />
    <link href="css/style_roulette.css" rel="stylesheet" />
    <link href="css/style2_roulette.css" rel="stylesheet" />

    <script type="text/javascript" src="js/Winwheel.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
  </head>

  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-border text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar Start -->
    <div
      class="container-fluid fixed-top px-0 wow fadeIn"
      data-wow-delay="0.1s"
    >
      <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
        <div class="col-lg-6 px-5 text-start">
          <small
            ><i class="fa fa-map-marker-alt me-2"></i>123 Street, New York,
            USA</small
          >
          <small class="ms-4"
            ><i class="fa fa-envelope me-2"></i>info@example.com</small
          >
        </div>
        <div class="col-lg-6 px-5 text-end">
          <small>Follow us:</small>
          <a class="text-body ms-3" href=""
            ><i class="fab fa-facebook-f"></i
          ></a>
          <a class="text-body ms-3" href=""><i class="fab fa-twitter"></i></a>
          <a class="text-body ms-3" href=""
            ><i class="fab fa-linkedin-in"></i
          ></a>
          <a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
        </div>
      </div>

      <nav
        class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn"
        data-wow-delay="0.1s"
      >
        <a href="index.html" class="navbar-brand ms-4 ms-lg-0">
          <h1 class="fw-bold text-primary m-0">
            낭<span class="text-secondary">만</span>서점
          </h1>
        </a>
        <button
          type="button"
          class="navbar-toggler me-4"
          data-bs-toggle="collapse"
          data-bs-target="#navbarCollapse"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <div class="navbar-nav ms-auto p-4 p-lg-0">
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                >공지사항</a
              >
              <div class="dropdown-menu m-0">
                <a href="blog.html" class="dropdown-item">소개</a>
                <a href="feature.html" class="dropdown-item">공지사항</a>
                <a href="testimonial.html" class="dropdown-item">Q&A</a>
              </div>
            </div>
            <div class="nav-item dropdown">
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                >국내 도서</a
              >
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
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                >외국도서</a
              >
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
              <a
                href="#"
                class="nav-link dropdown-toggle"
                data-bs-toggle="dropdown"
                >신간</a
              >
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
            <p
              id="search_btn"
              class="btn-sm-square bg-white rounded-circle ms-3"
              href=""
            >
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
          <input
            type="password"
            class="form-control"
            id="inputPassword2"
            placeholder="Password"
          />
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary mb-3">검색</button>
        </div>
      </form>
    </div>
    <!-- Navbar End -->
    <div class="row" id="inner_box">
      <div class="col-3"></div>
      <div class="col">
        <div class="row d-flex align-items-end fs-2" id="main_title">
          이벤트
          <div class="col-auto m-0 h1" id="subtitle">
            낭만서점 회원들을 위한 다양한 이벤트를 준비했습니다!
          </div>
        </div>
        <div class="row mt-2" id="table_titleLine">
          <div
            class="col-3 fs-3 bg-gray border-2 border-top border-dark m-0 p-3 text-center align-items-center"
            id="title"
          >
            제목
          </div>
          <div
            class="col d-flex align-items-center fs-3 border-2 border-top border-dark"
            id="content"
          >
            매일매일 출석 돌림판
          </div>
        </div>
        <div class="row" id="table">
          <div
            class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center"
            id="title"
          >
            조회수
          </div>
          <div
            class="col d-flex align-items-center border-2 border-top border-gray border-bottom"
            id="content"
          >
            5,231,543
            <div>명</div>
          </div>
          <div
            class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center"
            id="title"
          >
            이벤트 기간
          </div>
          <div
            class="col d-flex align-items-center border-2 border-top border-gray border-bottom"
            id="content"
          >
            2022-08-02 ~ 2022-09-30
          </div>
        </div>
        <div class="row" id="Content">
          <div id="bull" class="row">
            <div class="col">
              <div
                class="row the_wheel justify-content-center fs-1"
                align="center"
                valign="center"
              >
                <i class="bi bi-arrow-down fs-1"></i>
              </div>
              <div
                class="row the_wheel justify-content-center"
                align="center"
                valign="center"
              >
                <canvas width="500" height="500" class="col-auto" id="canvas">
                </canvas>
              </div>
              <div class="row power_controls mt-5 justify-content-center">
                <img
                  class="col-auto"
                  id="spin_button"
                  src="img/spin_off.png"
                  alt="Spin"
                  onClick="startSpin();"
                />
              </div>
              <div>매일매일 돌림판을 돌려서 마일리지 얻자!</div>
              <ul>
                <li>매일 00:00 기준입니다.</li>
                <li>완전히 돌아갈때까지 기다려주세요!</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-end bg-gray" id="endPoint">
          맨위로<i class="bi bi-caret-up-fill col-auto"></i>
        </div>
        <div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
          <button class="col-auto bg-white border-1">목록</button>
          <button class="col-auto bg-white border-1">
            <i class="bi bi-caret-right-fill"></i>
          </button>
        </div>
      </div>
      <div class="col-2"></div>
    </div>
    <!-- Footer Start -->
    <div
      id="footer"
      class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn"
      data-wow-delay="0.1s"
    >
      <div id="footer_row" class="row container py-5">
        <div id="footer_des" class="g-5">
          <div id="foot_address" class="col-lg-3 col-md-6">
            <h4 class="text-light mb-4 col-3">Address</h4>
            <p>
              <i class="fa fa-map-marker-alt me-3"></i>&nbsp&nbsp 123 Street,
              New York, USA
            </p>
            <p><i class="fa fa-phone-alt me-3"></i>&nbsp +012 345 67890</p>
            <p><i class="fa fa-envelope me-3"></i>&nbsp info@example.com</p>
          </div>

          <div class="row">
            <div class="col-md-4 text-center text-md-start mb-4 mb-md-0">
              <h1 class="fw-bold text-primary mb-4">
                낭<span class="text-secondary">만</span>서점
              </h1>
            </div>
            <div class="col-md-4 text-center text-md-center mb-4 mb-md-0">
              <p>
                Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita
                erat ipsum et lorem et sit, sed stet lorem sit clita
              </p>
            </div>
            <div id="sns_footer" class="col-md-4 text-md-end mb-4 mb-md-0">
              <a
                class="btn btn-square btn-outline-light rounded-circle me-1"
                href=""
                ><i class="fab fa-twitter"></i
              ></a>
              <a
                class="btn btn-square btn-outline-light rounded-circle me-1"
                href=""
                ><i class="fab fa-facebook-f"></i
              ></a>
              <a
                class="btn btn-square btn-outline-light rounded-circle me-1"
                href=""
                ><i class="fab fa-youtube"></i
              ></a>
              <a
                class="btn btn-square btn-outline-light rounded-circle me-0"
                href=""
                ><i class="fab fa-linkedin-in"></i
              ></a>
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
              <br />Distributed By:
              <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
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
            <div class="col-2" id="nav_ico">
              <i class="bi bi-person-fill"></i>
            </div>
            <div class="col" id="nav_text">
              <div id="text_title">독립서점</div>
              <div id="text_subtitle">응답하는중</div>
            </div>
          </div>
          <div id="real_chatItems">
            <div class="row" id="chat_left">
              <div class="row">
                <div id="item_ico" class="col-2 justify-content-end">
                  <i class="bi bi-person-circle"></i>
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
                <div id="item_ico" class="col-2">
                  <i class="bi bi-person-circle"></i>
                </div>
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
              <input
                type="text"
                class="form-control"
                placeholder="Recipient's username"
                aria-label="Recipient's username"
                aria-describedby="button-addon2"
              />
              <button
                class="btn btn-secondary"
                type="button"
                id="button-addon2"
              >
                Button
              </button>
            </div>
          </div>
        </div>
        <div class="row" id="button_box">
          <button class="btn btn-info" id="chat_button">실시간 채팅</button>
        </div>
      </div>
      <!-- Back to Top -->
      <a
        href="#"
        class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"
        ><i class="bi bi-arrow-up"></i
      ></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/event_Roulette.js"></script>
    <script type="text/javascript">
      $(function () {
        $("#chat_button").click(function () {
          $("#real_chat").toggleClass("hide");
        });

        $("#search_btn").click(function () {
          $("#main_search").toggleClass("hide");
        });
      });
    </script>
    <script type="text/javascript">
      $(function () {
        $("#endPoint").click(function () {
          $("html").scrollTop("0");
        });
      });
    </script>
  </body>
</html>