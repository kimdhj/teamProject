<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/book_Detail.css" rel="stylesheet">


</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->


	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div id="detail_wrapper" class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<!-- 상단 -->
			<div id="top_total" class="row">
			
				<div class="col-3" id="img_box">
					<img src="${book.book_bigimgURL}" height="100%" id="bookimg" class="img-fluid" alt="...">
				</div>
				<div class="col-9" id="top_content">
					<div class="row" id="star_box">
						<div class="col-10" id="star_solo">
							<div>
								<div class="container p-0">
									<label> Rate Value <input type="number"
										name="ratevalue" value="${point}" step="0.1" min="0" max="5" />
									</label>
									<div class="rating-wrap p-0">
										<div class="rating">
											<div class="overlay"></div>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
					<div id="main_title" class="row">${book.book_title}</div>
					<div class="row" id="main_price">
						<div id="price ">
							<fmt:formatNumber value="${book.book_price}" pattern="#,###" />
						</div>
						<div id="unit">원</div>
					</div>
          <input type="number" class="hide" value="${book.author_seq}" id="author_seq"/>
					<div class="row d-flex" id="main_info "><span class="col-auto p-0" id="authorname">${book.book_author}</span><span class="col-auto p-0">|${book.book_publish}|<fmt:formatDate value="${book.book_publish_date}" pattern="yyyy-MM-dd"/></span></div>
					<div class="row" id="cash_btn">
					<input type="hidden" id="bookseq" value="${book.book_seq}"/>
						<div class="col-3 " id="cash_button">
						<c:if test="${bche!=null}">
						<form action="bookpay.do" method="get">
						<input type="hidden" name="book_seq" id="bookseq" value="${book.book_seq}"/>
						<input type="hidden" name="book_count" id="bookseq" value="1"/>
						<input type="number" class="hide" name="iscart" id="iscart" value="2"/>
							<button 
								class="btn btn-info font-weight-bold rounded-pill">결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
						</form>
						</c:if>
						<c:if test="${bche==null}">
						<button  type="button" id="fin"
								class="btn btn-info font-weight-bold rounded-pill">결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제</button>
						</c:if>
						</div>
						<div class="col"></div>
						<c:if test="${bche!=null}">
						<c:if test="${bche<=0}">
						<div class="col-7" >
							<button id="add_cartCheck" type="button"  class="btn btn-info rounded-pill">장바구니
								추가</button>
						</div>
						</c:if>
						<c:if test="${bche>0}">
						<div class="col-7" >
							<button id="add_cartCheck" disabled type="button"
								class="btn btn-info  rounded-pill bg-gray border-0">장바구니
								추가</button>
						</div>
						
						</c:if>
						</c:if>
						<c:if test="${bche==null}">
							<div class="col-7" >
						<button type="button" id="add_cartCheck"  class="btn btn-info rounded-pill">장바구니
								추가</button>
								</div>
						</c:if>
						
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
			<c:set var="id" value="0"/>
			<div id="bottom_detail" class="row">
			<input type="hidden" id="repage" value="${vo.page}">
				<input type="hidden" id="maxpage" value="${maxpage}">
				<!-- 리뷰 -->
				<div class="row" onchange="star()" id="reviews">
				
				<c:forEach var="re" items="${relist}">
					<div class="row p-0 border-dark border border-1 mt-2" id="review${id}">
					<c:set var="id" value="${id+1}"/>
					<input type="hidden" id="reseq" value="${re.reply_seq}"/>
						<div class="p-0 col-3">
							<img height="100%" src="${book.book_bigimgURL}" class="img-fluid"
								alt="...">
						</div>
						<div class="col-9">

							<div id="review_id" class="row">
								<div class="col-8">${re.user_id}</div>
								<div class="col-4" id="heart_box">
								<c:if test="${re.fine > 0}">
									<i id="heart" class="bi bi-heart-fill"></i>
									</c:if>
									<c:if test="${re.fine <= 0}">
									<i class="bi bi-heart"></i>
									</c:if>
								</div>
							</div>
							<div class="row" id="review_starBox">
								<div class="col-8" id="review_starSolo">
									<div class="col-10" id="star_solo">
										<div>
											<div class="container p-0">
												<label> Rate Value <input type="number"
													name="ratevalue" value="${re.reply_point}" step="0.1" min="0" max="5" />
												</label>
												<div class="rating-wrap p-0">
													<div class="rating">
														<div class="overlay"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="thumb_count" class="col-4">좋아요${re.finecount}</div>
							</div>
							<div id="review_textBox" class="row">
              <c:if test="${re.user_blank==false}">
              ${re.reply_cotent}
              </c:if>
                <c:if test="${re.user_blank!=false}">
              <div id="blankreview">블랙 처리된 리뷰입니다. 고객센터로 문의 주세요</div>
              </c:if>
								</div>
						</div>
					</div>
					</c:forEach>
					
					
					<div class="row mt-3" id="review_pageNation">

						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">
								<c:if test="${vo.page ne 1}">
									<li class="page-item "><a class="page-link"> < </a></li>
								</c:if>

								<c:forEach var="i" begin="${restartpage}" end="${reendpage}">
									<c:if test="${vo.page ne i}">
										<li class="page-item"><a class="page-link">${i} </a></li>
									</c:if>

									<c:if test="${vo.page eq i}">
										<li class="page-item active" aria-current="page"><a
											class="page-link">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${vo.page lt maxpage}">
									<li class="page-item"><a class="page-link">></a></li>
								</c:if>
							</ul>
						</nav>

					</div>

				</div>
				<!-- 상품정보 -->
				<div class="row  hide" id="item_detail">
					<div id="item_imgBox" class="row">
						<img src="${book.book_bigimgURL}" class="img-fluid" alt="...">
					</div>
					<div id="item_detailText" class="row">${book.book_descript}</div>
					<!-- 중단 -->
					
						</div>
	</div>
					<div id="middle_recommend" class="row">
						<div class="row g-0 gx-5 align-items-end">
							<div class="col-lg-6">
								<div class="section-header text-start mb-5 wow fadeInUp"
									data-wow-delay="0.1s" style="max-width: 500px;">
									<h1 class="display-5 mb-3">추천 상품</h1>

								</div>
							</div>

						</div>
						<div class="tab-content row">
							<!-- 탭1 시작 -->
							<div id="tab-1" class="tab-pane fade show p-0 active">
								<div class="row g-4">
								<c:forEach var="neb" items="${chbook}">
								<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
								
                            <div class="product-item h-80">
                                 <input type="hidden" id="seq" value="${neb.book_seq}"/>
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_bigimgURL}" alt="">
                                  
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="bookdetail.do?book_seq=${neb.book_seq}">${neb.book_title}</a>
                                    <span class="text-primary me-1"><fmt:formatNumber value="${neb.book_price}" pattern="#,###" />원</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="bookdetail.do?book_seq=${neb.book_seq}"><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" id="cart"><i
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


						</div>
					</div>
				
				
				</div>
			</div>
	





	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="/js/book_Detail.js"></script>

	<!-- Footer End -->
</body>

</html>