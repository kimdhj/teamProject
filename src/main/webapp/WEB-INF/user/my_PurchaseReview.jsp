<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="/css/my_PurchaseReview.css" rel="stylesheet">
<link href="/css/star_style.css" rel="stylesheet">
<!-- include summernote css/js-->
</head>
<body>
  <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
  <!-- 우측하단 시작 -->
  <!-- 여기 삽입 -->
  <!-- 리뷰 작성 페이지 -->
  <div class="row">
    <div class="col-11">
      <div class="row mb-2">
        <h3 id="review_name">my Review</h3>
      </div>
      <div class="row review_box">
        <div class="col-2 review_img">
          <img width="100%" src="./img/product1-8.jpg">
        </div>
        <div class="col-7">
          <div class="row mt-3">
            <h4 id="review_title">해리포터</h4>
          </div>
          <div class="row">
            <div class="col-12">저자</div>
          </div>
          <div class="row">
            <div class="col-12">출판사</div>
          </div>
          <div class="row">
            <div class="col-12">출판일자</div>
          </div>
          <div class="row">
            <div class="col-12">
              <form name="myform" id="myform" method="post" action="./save">
                별점
                <fieldset>
                  <input type="radio" name="rating" value="5" id="rate1"> <label for="rate1">⭐</label> <input type="radio" name="rating" value="4" id="rate2"> <label for="rate2">⭐</label> <input type="radio" name="rating" value="3" id="rate3"> <label for="rate3">⭐</label> <input type="radio" name="rating" value="2" id="rate4"> <label for="rate4">⭐</label> <input type="radio" name="rating" value="1" id="rate5"> <label for="rate5">⭐</label>
                </fieldset>
              </form>
            </div>
          </div>
          <div class="row">
            <div class="col-12">가격</div>
          </div>
        </div>
        <div class="col-3">
          <div class="row mt-3">
            <a href="#">다른 리뷰 보러가기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 리뷰 작성 칸 -->
  <div class="row">
    <div class="col-11">
      <div class="row">
        <h3 id="review_name2">리뷰 작성</h3>
        <div class="col-12 review_hr"></div>
      </div>
      <div class="row" id="review_textarea">
        <div class="summernote"></div>
      </div>
    </div>
    <div col="col-1"></div>
  </div>
  <div class="row">
    <div class="col-3"></div>
    <div class="col-6"></div>
    <div class="col-2" id="review_btn">
      <button>등록</button>
      <button>취소</button>
    </div>
  </div>
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <script src="/js/my_PurchaseReview.js"></script>
</body>
</html>