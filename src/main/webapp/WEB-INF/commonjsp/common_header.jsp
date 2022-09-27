<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                <small><i class="fa fa-map-marker-alt me-2"></i>서울특별시 동작구 장승배기로 171 노량진아이비빌딩 3층</small>
                <small class="ms-4"><i class="fa fa-envelope me-2"></i>qjawns0222@naver.com</small>
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
            <a href="index.do" id="logo" class="navbar-brand ms-4 ms-lg-0">
                <img src="./서점로고.ico" alt="">
                <h1 class="fw-bold text-primary m-0">낭<span class="text-secondary">만</span>서점</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">


                <a href="info.do" class="nav-item nav-link">소개</a>
                    <div class="nav-item dropdown">
                        <a href="/booklist.do?country=2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">국내</a>
                        <div id="navko" class="dropdown-menu m-0">
                            <a href="/booklist.do?country=2" class="dropdown-item">국내 서적</a>
                 
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="/booklist.do?country=1" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">외국</a>
                        <div id="navfore" class="dropdown-menu m-0">
                            <a href="/booklist.do?country=1" class="dropdown-item">외국 서적</a>
                            
                        </div>
                    </div>
               
                         <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공지사항</a>
                        <div class="dropdown-menu m-0">
                            <a href="/notice.do" class="dropdown-item">공지사항</a>
                            <a href="/cs.do" class="dropdown-item">Q&A</a>

                        </div>
                    </div>
                    <a href="/getEventList.do" class="nav-item nav-link">이벤트</a>
                    <a href="/event_Sub.do" class="nav-item nav-link">구독</a>


                </div>
                <div class="d-none d-lg-flex ms-2">
                    <p id="search_btn" class="btn-sm-square bg-white rounded-circle ms-3" href="">
                        <small class="fa fa-search text-body"></small>
                    </p>
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="/login.do">
                        <small class="fa fa-user text-body"></small>
                    </a>
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="/cart.do">
                        <small class="fa fa-shopping-bag text-body"></small>
                    </a>
                    <a id="mypage" class="btn-sm-square bg-white rounded-circle ms-3" href="/myMain.do">
                        <i class="bi bi-house-door-fill"></i>
                    </a>
                </div>
            </div>
        </nav>
        <form id="main_search" action="booklist.do" method="get" class="row g-3 hide">
            <div class="col"></div>
            <div class="col-auto">
                <label for="inputPassword2" class="visually-hidden">제목</label>
                <input type="text" name="title" class="form-control" id="inputPassword2" placeholder="책 제목 입력">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-3">검색</button>
            </div>
        </form>
    </div>
    <!-- Navbar End -->