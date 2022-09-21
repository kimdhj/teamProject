<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<link href="/css/my_Purchase.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
  <!-- 여기 삽입 -->
  <!-- 구매 목록 -->
  <div id="purchasebox">
  <div class="row">
    <div class="col-12">
      <div class="row">
        <h3 id="purchaseList_name">구매 목록</h3>
      </div>
    </div>
  </div>
  
  <!-- 날짜 조회할 수 있는 칸 -->
  <div class="row" id="middle_menu">
    <div class="row" id="day_find">
      <div class="col-4" id="day_title">기간 조회</div>
      <div class="col-8" id="day_select">
        <div id="day_calendar" class="col-5">
          <input class="col-5" placeholder="시작날짜" type="text" id="start_date" style="text-align: center;" />~<input class="col-5" placeholder="마지막 날짜" type="text" id="end_date" style="text-align: center;" />
        </div>
        <div id="day_btn" class="col-7">
          <div id="dayAdd" class="btn-group me-2" role="group" aria-label="Second group">
            <button type="button" class="btn btn-secondary week">1주일</button>
            <button type="button" class="btn btn-secondary month">1개월</button>
            <button type="button" class="btn btn-secondary threemonth">3개월</button>
            <button type="button" class="btn btn-secondary sixmonth">6개월</button>
            <button type="button" class="btn btn-secondary year">1년</button>
          </div>
        </div>
      </div>
    </div>
    <div class="row" id="option_find">
      <div class="col-4" id="option_title">조건 검색</div>
      <div class="col-8" id="option_select">
        <div class="col-4" id="option_dropdown">
          <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="stateche" style="height: 37px; margin-top: 2px;">
            <option value="book_title" selected>책제목</option>
            <option value="book_author">작가</option>
            <option value="orders_seq">주문번호</option>
            <option value="orders_status">배송현황</option>
          </select>
        </div>
        &nbsp;
        <div class="col" id="option_input">
          <div class="input-group mb-3 ">
            <input type="text" id="search" class="form-control" aria-describedby="basic-addon2"> <button class="input-group-text search_btn" id="basic-addon2">검색</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 구매한 도서 목록 리스트 -->
      <c:set var="status" value="결제 완료"/>
  <div class="row hellobox">
      <c:forEach items="${purchaseList }" var="purchase" begin="0" end="4">
    <div class="row purchaseList_box mt-5">
    
      <div class="col-2 purchaseList_img">
        <img width="100%" src="${purchase.book_bigimgURL }">
      </div>
      
      <div class="col-9 bookBox">
        <div class="row">
          <div class="col-8" style="font-size: large; font-weight: bolder;" id="purchaseList_title">${purchase.book_title }</div>
          <div class="col-2" style="margin-top: 3%;">수량: ${purchase.order_bookList_count }개</div>
        </div>
        
        <div class="row">
          <div class="col-8">${purchase.book_author } | ${purchase.orders_order_day }
          </div>
        </div>
        
        <div class="row">
          <c:if test="${purchase.orders_status eq 'ready'}">
            <div class="col-7 purchasestatus">결제 대기</div>
          </c:if>
          <c:if test="${purchase.orders_status eq 'paid'}">
            <div class="col-7 purchasestatus">결제 완료</div>
          </c:if>
          <c:if test="${purchase.orders_status eq 'delivery'}">
            <div class="col-7 purchasestatus">배송중</div>
          </c:if>
          <c:if test="${purchase.orders_status eq 'finish'}">
            <div class="col-7 purchasestatus">배송 완료</div>
          </c:if>
          <c:if test="${purchase.orders_status eq 'cancelallwait'}">
            <div class="col-7 purchasestatus">환불/교환/반품대기</div>
          </c:if>
          <c:if test="${purchase.orders_status eq 'cancelallfinish'}">
            <div class="col-7 purchasestatus">환불/교환/반품완료</div>
          </c:if>
        </div>
        
        <div class="row">
          <div class="col-12 purchaseList_hr"></div>
        </div>
        
        <div class="row">
            <div class="col-2 purchaseList_btns">
              <button onclick="#">배송조회</button>
          </div>
            <div class="col-2 purchaseList_btns">
              <button onclick="/myreviewInsert.do">리뷰작성</button>
          </div>
            <div class="col-2 purchaseList_btns">
              <button onclick="/mypurchaseDetail.do">구매상세</button>
          </div>
            <div class="col-2 purchaseList_btns">
              <button class="purchaseCancel" onclick="#">구매취소</button>
          </div>
        </div>
      </div>
      
    </div>
      </c:forEach>
  </div>
  <!-- 요런 식으로 도서 리스트 계속 띄우기 -->
  
  
  <!-- 페이징 -->
    <div id="pageche" class="row justify-content-center d-flex mt-4 mb-5">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            <c:if test="${allPage ne 1}">
              <li class="page-item">
              <a class="page-link"><
              </a></li>
            </c:if>
            <c:forEach var="i" begin="${startpage }" end="${endpage}">
              <c:if test="${allPage ne i}">
                <li class="page-item"><a class="page-link">${i}
                </a></li>
              </c:if>

              <c:if test="${allPage eq i}">
                <li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>
              </c:if>
            </c:forEach>
             
            <c:if test="${allPage lt allCount/5}">
            <li class="page-item"><a class="page-link">></a></li>
            </c:if>
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      
      <input type="hidden" value="${allSvo.page }" id="page"/>
      <input type="hidden" value="${allSvo.startDate }" id="startDateche"/>
      <input type="hidden" value="${allSvo.endDate }" id="endDateche"/>
      <input type="hidden" value="${allSvo.searchkeyword}" id="searchkeyword"/>
      <input type="hidden" value="${allSvo.searchcontent}" id="searchcontent"/>
      
      </div>
  
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
  <!-- Contact End -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <!-- alert 창 예쁘게 -->
  <script src="/datepicker/js/datepicker.js"></script>
  <script src="/datepicker/js/datepicker.ko.js"></script>
  <script src="/js/my_Purchase.js"></script>
</body>
</html>