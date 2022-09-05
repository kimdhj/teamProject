<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
    <!DOCTYPE html>
    <html>

    <head>
        <!-- Common head include -->
        <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
        <!-- 여기에 css 관련  -->
    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->


        <!-- Page Header End -->
        <!-- 여기서부터 바디 작업 하면됨 -->
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="/img/carousel-1.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Reading Is Always Good For Us
                                        </h1>
                                        <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href=""
                                            class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="/img/carousel-2.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Reading id always good for mind
                                        </h1>
                                        <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                        <a href=""
                                            class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

		   <div class="container-xxl py-5">
        <div class="container">
            <!-- 탭1제목 -->
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
                    <c:forEach var="neb" items="${newlist}">
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_bigimgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        new</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="bookdetail.do?book_seq=${neb.book_seq}" >${neb.book_title}</a>
                                    <span class="text-primary me-1"><fmt:formatNumber value="${neb.book_price}" pattern="#,###" />원</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="bookdetail.do?book_seq=${neb.book_seq}"><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                       
                    
                    </c:forEach>
                    </div>
                </div>

                <!-- 탭1 끝 -->
                <!-- 추가 버튼 -->
                <div id="book_addbtn" class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                    <p id="book_addbtnmain" class="btn btn-primary rounded-pill py-3 px-5">Browse More Products</p>
                </div>

            </div>
            <!-- 탭2 제목 -->
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s"
                        style="max-width: 500px;">
                        <h1 class="display-5 mb-3">베스트</h1>
                        <p>도서목록</p>
                    </div>
                </div>

            </div>
            <div class="tab-content">
                <!-- 탭2 시작 -->
                <div id="tab-2" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                    	
                        <c:forEach var="neb" items="${bestlist}">
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_bigimgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        best</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="bookdetail.do?book_seq=${neb.book_seq}" >${neb.book_title}</a>
                                    <span class="text-primary me-1"><fmt:formatNumber value="${neb.book_price}" pattern="#,###" />원</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="bookdetail.do?book_seq=${neb.book_seq}"><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                       
                    
                    </c:forEach>
                       
                    </div>
                </div>

                <!-- 탭2끝 -->
                <!-- 추가 버튼 -->
                <div id="book_addbtn2" class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                    <p id="book_addbtnmain2" class="btn btn-primary rounded-pill py-3 px-5">Browse More Products</p>
                </div>

            </div>
        </div>
    </div>
    <!-- Product End -->


        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
        <!-- 여기에 js관련  -->

        <!-- Footer End -->
    </body>

    </html>