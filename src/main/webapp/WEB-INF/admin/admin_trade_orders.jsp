<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
  type="text/css" media="all" defer>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/admin_marketing_Coupon.css" rel="stylesheet" />
</head>
<body>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
  <!-- 여기서부터 화면 작성 시작 -->
  <form class="col-10" action="adminordersmod.mdo" method="get">
  <div id="main_wrapper" class="m-2  w-100 row">
    <div id="all_box" class="bg-white w-100">
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_seq" class="form-label border-1 border-dark">주문 번호</label> 
            <input type="number" name="orders_seq" readonly value="${vo.orders_seq}" class="form-control   border-1 border-dark" id="orders_seq" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_coupon_effect" class="form-label border-1 border-dark">사용 쿠폰 효과</label> <input type="number" value="${vo.orders_coupon_effect}" readonly class="form-control   border-1 border-dark" id="orders_coupon_effect" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_point" class="form-label">사용 포인트</label> 
            <input type="number" value="${vo.orders_point}" readonly class="form-control   border-1 border-dark" id="orders_point">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_status" class="form-label border-1 border-dark">주문 상태</label>
            <select class="form-select" name="orders_status" id="orders_status" aria-label="Default select example">
              <option value="ready">결제 대기</option>
              <option selected value="paid">결제 완료</option>
              <option value="delivery">배송중</option>
              <option value="finish">배송완료</option>
              <option value="cancelallwait">환불/교환/반품대기</option>
              <option value="cancelallfinish">환불/교환/반품완료</option>
            </select>
          </div>
          <input type="hidden" value="${vo.orders_status}"  id="state"/>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_delivery" class="form-label border-1 border-dark">택배번호</label> 
            <input type="number" value="${vo.orders_delivery}"  name="orders_delivery" class="form-control   border-1 border-dark" id="orders_delivery" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_delivery_company" class="form-label">택배회사 코드</label> 
            <input type="number" name="orders_delivery_company" value="${vo.orders_delivery_company}" class="form-control   border-1 border-dark" id="orders_delivery_company">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_email" class="form-label border-1 border-dark">이메일</label> 
            <input type="email" value="${vo.orders_email}"  name="orders_email" class="form-control   border-1 border-dark" id="orders_email" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_name" class="form-label border-1 border-dark">이름</label>
             <input type="text"  name="orders_name" value="${vo.orders_name}" class="form-control   border-1 border-dark" id="orders_name" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_order_day" class="form-label">주문날짜</label> 
            <input type="text" readonly value="<fmt:formatDate value="${vo.orders_order_day}" pattern="yyyy-MM-dd"/>" readonly class="form-control   border-1 border-dark" id="orders_order_day">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_cache_sum"  class="form-label border-1 border-dark">총금액</label> 
            <input readonly value="${vo.orders_cache_sum}" type="number" class="form-control   border-1 border-dark" id="orders_cache_sum" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_phone" class="form-label border-1 border-dark">핸드폰 번호</label> 
            <input name="orders_phone"  value="${vo.orders_phone}" type="text" class="form-control   border-1 border-dark" id="orders_phone" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_title" class="form-label">주문 제목</label> <input type="text" readonly value="${vo.orders_title}" class="form-control   border-1 border-dark" id="orders_title">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_Date" class="form-label border-1 border-dark">가상계좌 날짜</label> 
            <input type="text" readonly value="<fmt:formatDate value="${vo.orders_vbank_Date}" pattern="yyyy-MM-dd"/>" class="form-control   border-1 border-dark" id="orders_vbank_Date" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_name" class="form-label border-1 border-dark">가상계좌 은행</label> <input type="text" readonly value="${vo.orders_vbank_name}" class="form-control   border-1 border-dark" id="orders_vbank_name" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_vbank_num" class="form-label">가상계좌 번호</label> <input type="text" value="${vo.orders_vbank_num}" readonly class="form-control   border-1 border-dark" id="orders_vbank_num">
          </div>
        </div>
      </div>
      <div class="row d-flex justify-content-around">
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_zipcode" class="form-label border-1 border-dark">우편번호</label>
             <input type="text" name="orders_zipcode"  readonly value="${vo.orders_zipcode}" class="form-control   border-1 border-dark" id="orders_zipcode" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_address"  class="form-label border-1 border-dark">주소</label> 
            <input type="text" name="orders_address" value="${vo.orders_address}" readonly class="form-control   border-1 border-dark" id="orders_address" />
          </div>
        </div>
        <div class="col-3">
          <div class="mb-3">
            <label for="orders_remainaddress" value="${vo.orders_remainaddress}" class="form-label">나머지 주소</label> 
            <input type="text" name="orders_remainaddress" class="form-control   border-1 border-dark" id="orders_remainaddress">
          </div>
        </div>
      </div>
      <div id="bookbox">
      <c:forEach var="book" items="${books}">
        <div id="book" class="row d-flex align-items-center justify-content-around">
          <div class="col-3">
            <div class="mb-3">
              <label for="book_seq" class="form-label border-1 border-dark">책 번호</label> 
              <input type="number" readonly class="form-control   border-1 border-dark" value="${book.book_seq}"  id="book_seq" />
            </div>
          </div>
          <div class="col-3">
            <div class="mb-3">
              <label for="order_bookList_count" class="form-label border-1 border-dark">책 수량</label> 
              <input type="text" readonly class="form-control    border-1 border-dark" value="${book.order_bookList_count}"  id="order_bookList_count" />
            </div>
          </div>
        
        </div>
        </c:forEach>
      </div>
      <div class="row d-flex align-items-center justify-content-around">
        <div class="col-2">
             <div class="mb-3">
           
            <select disabled class="form-select" id="orders_cache_tool" aria-label="Default select example">
              <option value="card">카드</option>
              <option value="point">포인트</option>
              <option value="trans">실시간계좌이체</option>
              <option value="vbank">가상계좌</option>
              <option value="phone">핸드폰번호</option>
              <option value="admin">관리자 입력</option>
            </select>
            <input type="hidden" value="${vo.orders_cache_tool}"  id="tool"/>
          </div>
          </div>
        <div class="col-2">
        <div class="mb-3">
              <button type="button" id="add_book" class="btn bg-primary text-white rounded-pill col">책 추가</button>
            </div>
        
        </div>
            <input type="hidden" name="user_id" value="${vo.user_id}"/>
        <div class="col-2">
          <div class="mb-3">
            <button type="button" id="add_addr" class="btn bg-blue text-white rounded-pill col">주소지 등록</button>
          </div>
        </div>
        <div class="col-2">
          <div class="mb-3">
            <button  id="mod_btn" class="btn bg-blue text-white rounded-pill col">수정</button>
          </div>
        </div>
        <div class="col-2">
          <div class="mb-3">
            <button type="button" onclick="location.href='adminordersdel.mdo?orders_seq=${vo.orders_seq}'" id="add_btn" class="btn bg-danger text-white rounded-pill col">삭제</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
    <script src="/datepicker/js/datepicker.js"></script>
    <!-- Air datepicker js -->
    <script src="/datepicker/js/datepicker.ko.js"></script>
    <!-- 달력 한글 추가를 위해 커스텀 -->
    <!--다음 주소  -->
  <script
    src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/js/jquery.number.min.js"></script>
  <!-- 여기서부터 JS 추가 -->
  <script src="/js/admin_trade_orders.js"></script>
</body>
</html>