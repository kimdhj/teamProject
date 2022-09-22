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
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_seq" class="form-label border-1 border-dark">주문 번호</label> <input type="number" class="form-control   border-1 border-dark" id="orders_seq" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_coupon_effect" class="form-label border-1 border-dark">사용 쿠폰 효과</label> <input type="number" class="form-control   border-1 border-dark" id="orders_coupon_effect" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_point" class="form-label">사용 포인트</label> 
            <input type="number" class="form-control   border-1 border-dark" id="orders_point">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_status" class="form-label border-1 border-dark">주문 상태</label>
            <select class="form-select" aria-label="Default select example">
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
            <label for="orders_delivery" class="form-label border-1 border-dark">택배번호</label> 
            <input type="number" class="form-control   border-1 border-dark" id="orders_delivery" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_delivery_company" class="form-label">택배회사 코드</label> 
            <input type="number" class="form-control   border-1 border-dark" id="orders_delivery_company">
          </div>
        </div>
      </div>
          <div class="row d-flex justify-content-around">
         <div class="col-3">
          <div class="mb-3">
            <label for="orders_email" class="form-label border-1 border-dark">이메일</label> 
            <input type="email" class="form-control   border-1 border-dark" id="orders_email" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_name" class="form-label border-1 border-dark">이름</label> 
            <input type="text" class="form-control   border-1 border-dark" id="orders_name" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_order_day" class="form-label">주문날짜</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_order_day">
          </div>
        </div>
      </div>
        <div class="row d-flex justify-content-around">
         <div class="col-3">
          <div class="mb-3">
            <label for="orders_email" class="form-label border-1 border-dark">이메일</label> 
            <input type="email" class="form-control   border-1 border-dark" id="orders_email" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_phone" class="form-label border-1 border-dark">핸드폰 번호</label> 
            <input type="text" class="form-control   border-1 border-dark" id="orders_phone" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_title" class="form-label">주문 제목</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_title">
          </div>
        </div>
      </div>
           <div class="row d-flex justify-content-around">
         <div class="col-3">
          <div class="mb-3">
            <label for="orders_email" class="form-label border-1 border-dark">이메일</label> 
            <input type="email" class="form-control   border-1 border-dark" id="orders_email" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_phone" class="form-label border-1 border-dark">핸드폰 번호</label> 
            <input type="text" class="form-control   border-1 border-dark" id="orders_phone" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_title" class="form-label">주문 제목</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_title">
          </div>
        </div>
      </div>
      
        <div class="row d-flex justify-content-around">
         <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_Date" class="form-label border-1 border-dark">가상계좌 날짜</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_vbank_Date" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_name" class="form-label border-1 border-dark">가상계좌 은행</label> 
            <input type="text" class="form-control   border-1 border-dark" id="orders_vbank_name" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_num" class="form-label">가상계좌 번호</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_vbank_num">
          </div>
        </div>
      </div>
      
      <div class="row d-flex justify-content-around">
         <div class="col-3">
          <div class="mb-3">
            <label for="orders_zipcode" class="form-label border-1 border-dark">우편번호</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_zipcode" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_address" class="form-label border-1 border-dark">주소</label> 
            <input type="text" class="form-control   border-1 border-dark" id="orders_address" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_remainaddress" class="form-label">나머지 주소</label> 
            <input type="date" class="form-control   border-1 border-dark" id="orders_remainaddress">
          </div>
        </div>
      </div>
      
      
      
      
      
      
      
      
      
      <div class="row d-flex justify-content-around">
           <div class="col-3">
          <div class="mb-3">
            <button id="add_btn" class="btn bg-blue text-white rounded-pill col">주소지 등록</button>
          </div>
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