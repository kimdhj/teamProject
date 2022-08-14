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
    <link href="css/event_Subscribe.css" rel="stylesheet" />
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
            어쩌고 저쩌고
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
          <div class="col-2"></div>
          <div class="col-8 text-center">
            <div id="brbrbrbr"><br /></div>
            <div id="br_under_content">
              <ul>
                <li>8월 17일까지는 화면 대부분 완성 되어 있어야한다고</li>
                <li>
                  17~ 빅데이터 시험문제 4문제정도 낼 정도만 ~24일 2문제 낼거야
                </li>
                <li>25일부터 실제적 프로젝트 시작이지 30일 발표가 목적인데</li>
                <li>
                  프로젝트는 결국 실력을 올리기 위한거기 떄문에 책도 많이
                  찾아보고 해봐야지
                </li>
                <li>
                  자기가 작업한거를 다시 해보라 그러면 할수 있어야지 25일까진
                  완성해야한다.
                </li>
                <li>26일부턴 ppt만들고 수료식날 취업특강해도 되잖아</li>
              </ul>
            </div>
            <div class="d-flex justify-content-center">
              <input
                type="button"
                id="1month_sub"
                value="1달 구독"
                href="subscribePay.html"
              />
            </div>
            <div class="row d-flex justify-content-center">
              <div class="col-auto pe-0" id="subscribe_Price_oneMonth">30000</div>
              <div class="col-auto ps-0"> 원</div>
            </div>
            <div id="br_under_content">
              <ul></ul>
                <li>
                  롬복쓰는 이유가 @Setter , @Getter, @ToString 세개 쓸려고
                  쓰는거야
                </li>
                <li>
                  클래스랑 같은 이름의 테이블을 자동으로 찾는데 @Table()로 다른
                  이름 테이블 명시가능
                </li>
                <li>
                  < , > 뒤에꺼는 시퀀스의 '자료형'! 5강 4p 표 6,8,9번째 row
                  바뀐거 주의
                </li>
                <li>Crud를 상속받으면 메서드랑 그런거 다 만들어주는거야</li>
                <li>
                  시험 5개씩 정보처리기준 실기는 게시판 만들기 내일 양식
                  주는대로 보고서를 써야해
                </li>
                <li>
                  화면 설계 화면 구현 네트워크 프로그래밍 구현 애플리케이션
                  테스트 수행 애플리케이션 배포
                </li>
              </ul>
            </div>
            <div><br></div>
            <div class="d-flex justify-content-center">
              <input
                type="button"
                id="1year_sub"
                value="1년 구독"
                href="subscribePay.html"
              />
            </div>
            <div class="row d-flex justify-content-center">
              <div class="col-auto pe-0" id="subscribe_Price_oneYear">360000</div>
              <div class="col-auto ps-0"> 원</div>
            </div>
            <div class="hide" id="subPrice">30000</div>
          </div>
          <div class="col-2"></div>
          <div></div>
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
    <script src="js/event_Subscribe.js"></script>
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