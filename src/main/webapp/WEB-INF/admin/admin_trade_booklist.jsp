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
          <img width="100" height="100" class="w-100" src="/img/check.jpg" />
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_seq" class="form-label border-1 border-dark">주문 번호</label> <input type="number" class="form-control   border-1 border-dark" id="orders_seq" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="order_bookList_count" class="form-label">책 수량</label> <input type="number" class="form-control   border-1 border-dark" id="order_bookList_count">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_status" class="form-label border-1 border-dark">주문 상태</label>
            <select readonly class="form-select" aria-label="Default select example">
             
              <option value="ready">결제 대기</option>
              <option value="paid">결제 완료</option>
              <option value="delivery">배송중</option>
              <option value="finish">배송완료</option>
              <option value="cancelwait">취소대기</option>
              <option value="cancelFinish">취소완료</option>
            </select>
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="sum" class="form-label border-1 border-dark">주문 총합</label> <input type="number" class="form-control   border-1 border-dark" id="sum" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="book_title" class="form-label">책 제목</label> <input type="number" class="form-control   border-1 border-dark" id="book_title">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col">
          
        </div>
        <div class="col-3">
          <div class="mb-3">
              <button id="add_btn" class="btn bg-blue text-white rounded-pill col">수정</button>
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <button id="add_btn" class="btn bg-danger text-white rounded-pill col">삭제</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
  <!-- 여기서부터 JS 추가 -->
  <script src="/js/admin_marketing_Coupon.js"></script>
</body>
</html>