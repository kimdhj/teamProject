<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!-- 요기서부터 마이페이지 새 헤더 -->
 <!-- Page Header Start -->
    <div class="container-fluid page-header wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Contact Us</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Contact Start -->
    <div class="container-xxl py-6">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s"
                style="max-width: 500px;">
                <h1 class="display-5 mb-3">My Page</h1>
                <p>삭막한 서울 도심 속, 험난한 나날에 치이며 살아도 우리는 꿋꿋하게 낭만을 가슴속에 간직하는 것이 우리네 짧은 인생을 풍요로이 할 것이라 믿습니다!</p>
            </div>
            
            <!-- 마이페이지 메인 헤더 -->
            <div class="row g-5 justify-content-center">
                <div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-light text-black d-flex flex-column justify-content-center h-100 p-3">
			<!-- 요기까지 마이페이지 새 헤더 -->
						<!-- 요기서부터 동적 헤더 -->
                        <!-- 메인페이지 헤더 내용 -->
                        <div class="container">
                            <div class="row">
                                <div class="col-2">
									<a href="/myMain.do"><img src="/img/moveMyMain.png" style="cursor:pointer;" /></a>
                                </div>
                                <div class="row col-9">
                                    <div class="col-4">
                                        <div class="container">
                                            <div class="row justify-content-center">
                                                <div class="col-md-auto align-self-center">
                                                    <a id="mypage_name_header" class="fs-4 text-dark">${user_name }&nbsp;님

                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 	컨트롤러에 HttpSession session, JwtUtils util 매개변수 받아 쓰시면 됩니다!
                                    		UserVO userVO = util.getuser(session);
											model.addAttribute("user_name", userVO.getUser_name());
											model.addAttribute("user_point", userVO.getUser_point());
											model.addAttribute("cou", couponService.owncoupon(userVO)); -->
                                    <div class="col-4">
                                        <div class="container">
                                            <div class="row justify-content-center">
                                                <div class="col-md-auto align-self-center">
                                                    <a class="fs-6 text-dark">할인쿠폰</a>&nbsp;&nbsp;<a href=""
                                                        class="" id="mypage_coupon_header">${cou}</a>장
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="container">
                                            <div class="row justify-content-center">
                                                <div class="col-md-auto align-self-center">
                                                    <a class="fs-6 text-dark">마일리지</a>&nbsp;&nbsp;<a href=""
                                                      id="mypage_point_header"  class=""><fmt:formatNumber value="${user_point }" type="number" /></a>P
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 메인페이지 헤더 내용 끝 -->
                        <!-- 요기까지 동적헤더 -->
           	<!-- 요기서부터 사이드바 -->
                    </div>
                </div>
            </div>
            <!-- 마이페이지 메인 헤더 끝 -->

            <!-- 마이페이지 메인 바디 -->
            <div class="row g-5 justify-content-center">
                <div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-light text-black d-flex flex-column justify-content-center h-100 p-sm-5 p-lg-3 p-md-3">

                        <!-- Split dropend button -->
                        <div class="btn-group dropend">
                            <button type="button" class="btn btn-secondary">
                                주문관리
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropright</span>
                            </button>
                            <ul class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <li><a href="/myOrder.do"><button class="dropdown-item" type="button">주문/배송조회</button></a></li>
                                <li><button class="dropdown-item" type="button">취소/교환/반품조회</button></li>
                            </ul>
                        </div><br><br><br>
                        <div class="btn-group dropend">
                            <button type="button" class="btn btn-secondary">
                                나의지갑
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropright</span>
                            </button>
                            <ul class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <li><button class="dropdown-item" type="button" onclick="moveToCuMa();">할인쿠폰/마일리지</button></li>
                            </ul>
                        </div><br><br><br>
                        <div class="btn-group dropend">
                            <button type="button" class="btn btn-secondary">
                                나의콘텐츠
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropright</span>
                            </button>
                            <ul class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <li><button class="dropdown-item" type="button">관심작가</button></li>
                                <li><button class="dropdown-item" type="button">나의리뷰</button></li>
                            </ul>
                        </div><br><br><br>
                        <div class="btn-group dropend">
                            <button type="button" class="btn btn-secondary">
                                문의내역
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropright</span>
                            </button>
                            <ul class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <li><a href="/myRequestList.do"><button class="dropdown-item" type="button">나의문의</button></a></li>
                                <li><a href="/myRequestWrite.do"><button class="dropdown-item" type="button">문의하기</button></a></li>
                            </ul>
                        </div><br><br><br>
                        <div class="btn-group dropend">
                            <button type="button" class="btn btn-secondary">
                                회원정보관리
                            </button>
                            <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropright</span>
                            </button>
                            <ul class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                <li><button class="dropdown-item" type="button">회원정보 수정</button></li>
                                <li><a href="/myTransPassword.do"><button class="dropdown-item" type="button">비밀번호 변경</button></a></li>
                                <li><button class="dropdown-item" type="button">나의 주소록</button></li>
                                <li><a href="/myWithdrawal.do"><button class="dropdown-item" type="button">회원탈퇴</button></a></li>
                            </ul>
                        </div><br>
                        <!-- 슬립 드롭다운 끝 -->
                    </div>
                </div>
                <!-- 요기까지 사이드바 -->
                <!-- 우측하단 시작 -->
                <div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                    <br>
                    <p class="mb-4 fs-5 fw-bold"><img src="img/mypage_mainbtn.png" class="rounded float-start"
                            alt="...">&nbsp;<a href="/myMain.do">마이 페이지</a>
                        <button type="button" class="btn btn-secondary btn-sm float-end" onclick="can_sub();">구독취소</button>
                    </p>