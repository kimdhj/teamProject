<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <!-- 리뷰 작성 페이지 -->
  <div class="row">
    <div class="col-11">
      
      <div class="row mb-2">
        <div style="font-size: x-large; font-weight: bolder;" id="review_name">도서 정보</div>
      </div>
      
      <div class="row review_box">
        
        <div class="col-2 review_img">
          <img width="100%" src="${info.book_bigimgURL }">
        </div>
        
        <div class="col-7">
          <div class="row mt-3">
            <div style="font-size: large; font-weight: bolder;" id="review_title">
              ${info.book_title }
            </div>
          </div>
          
          <div class="row">
            <div class="col-12"><b>저자</b>&nbsp;  ${info.book_author }</div>
          </div>
          
          <div class="row">
            <div class="col-12"><b>출판사</b>&nbsp;  ${info.book_publish }</div>
          </div>
          
          <div class="row">
            <div class="col-12"><b>출판일자</b>&nbsp;
                <fmt:formatDate value="${info.book_publish_date }" pattern="yyyy년 MM월 dd일"/>
             </div>
          </div>
          
          <div class="row">
            <div class="col-12"><b>가격</b>&nbsp;
              <fmt:formatNumber value="${info.book_price  }" pattern="#,###"/>
             원</div>
          </div>
          
          <div class="row">
            <div class="col-12">
              <form name="myform" id="myform" method="post" action="./save">
                <b>별점</b>
                <fieldset>
                  <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                  <input type="radio" name="rating" value="4" id="rate2"> <label for="rate2">⭐</label>
                  <input type="radio" name="rating" value="3" id="rate3"> <label for="rate3">⭐</label>
                  <input type="radio" name="rating" value="2" id="rate4"> <label for="rate4">⭐</label> 
                  <input type="radio" name="rating" value="1" id="rate5"> <label for="rate5">⭐</label>
                </fieldset>
              </form>
            </div>
          </div>
          
        </div>
        
        <div class="col-3">
          <div class="row mt-3">
            <a href="/bookdetail.do?book_seq=${info.book_seq }">다른 리뷰 보러가기</a>
          </div>
        </div>
        
      </div>
      
    </div>
  </div>
  
  <!-- 리뷰 작성 칸 reply_cotent, reply_point, book_seq, order_bookList_seq 넘겨줘서 리뷰 완성됐다고 해주기 -->
  <form action="/replyInsert.do" method="POST" name="insert" id="form">
  <div class="row">
    <div class="col-11">
      <div class="row">
        <div style="font-size: x-large; font-weight: bolder;" id="review_name2">나의 리뷰 작성하기</div>
        <div class="col-12 review_hr"></div>
      </div>
      
      <div class="row" id="review_textarea">
        <div class="summernote">
           <input type="hidden" value="${reply_cotent }" name="reply_cotent" id="reply_cotent"/>
        </div>
      </div>
    </div>
    <div class="col-1"></div>
  </div>
  
  <div class="row">
    <div class="col-3"></div>
    <div class="col-6"></div>
    <div class="col-2" id="review_btn">
      <button id="register">등록</button>
      <button onclick="location.href='/movingReview.do'">취소</button>
    </div>
  </div>
  
  <input type="number" class="hide" value="0" id="star" name="reply_point" />
 
  <input type="number" class="hide" value="${bs.order_bookList_seq }" name="order_bookList_seq" id="order_bookList_seq"/>
  <input type="number" class="hide" value="${info.book_seq }" name="book_seq" id="book_seq"/>
  
  
  </form>
  
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script src="/js/my_PurchaseReview.js"></script>
</body>
</html>