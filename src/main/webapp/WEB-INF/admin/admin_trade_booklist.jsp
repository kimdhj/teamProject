<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/admin_marketing_Coupon.css" rel="stylesheet" />
</head>
<body>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
  <!-- 여기서부터 화면 작성 시작 -->
  <div id="main_wrapper" class="m-2  w-100 row">
    <div id="all_box" class="bg-white w-100">
      <div class="row d-flex justify-content-around">
        <div class="col-3 p-3">
        <input type="number" class="hide" id="order_bookList_seq" value=""${voj.order_bookList_seq}/>
       
          <img width="100" height="100" class="w-100" src="${voj.book_bigimgURL}" />
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_seq" readonly class="form-label border-1 border-dark">주문 번호</label> <input type="number" value="${voj.orders_seq }" class="form-control   border-1 border-dark" readonly id="orders_seq" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="order_bookList_count"  class="form-label">책 수량</label> <input readonly type="number" class="form-control border-1 border-dark" value="${voj.order_bookList_count}"   id="order_bookList_count">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_status" class="form-label border-1 border-dark">주문 상태</label>
            <select disabled  class="form-select" id="orders_status" aria-label="Default select example">
             
              <option value="ready">결제 대기</option>
              <option  value="paid">결제 완료</option>
              <option value="delivery">배송중</option>
              <option value="finish">배송완료</option>
              <option value="cancelwait">취소대기</option>
              <option value="cancelFinish">취소완료</option>
              <option value="cancelallwait">환불/교환/반품대기</option>
              <option selected value="cancelallfinish">환불/교환/반품완료</option>
            </select>
            <input type="hidden" id="state" value="${voj.orders_status}" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="sum"  class="form-label border-1 border-dark">주문 총합</label> <input readonly value="${voj.sum}" type="number" class="form-control   border-1 border-dark" id="sum" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="book_title" class="form-label">책 제목</label> <input value="${voj.book_title}" readonly  type="text" class="form-control   border-1 border-dark" id="book_title">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col">
          
        </div>
        
        <div class="col-3">
          <div class="mb-3">
           <a href="delorderbooklist.mdo?orders_seq=${voj.orders_seq }&sum=${voj.sum}&orders_status=${voj.orders_status}&order_bookList_seq=${voj.order_bookList_seq}"><button id="add_btn" class="btn bg-danger text-white rounded-pill col">삭제</button></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
  <!-- 여기서부터 JS 추가 -->
  <script src="/js/admin_trade_booklist.js"></script>
</body>
</html>