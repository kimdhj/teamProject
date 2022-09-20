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
      <div class="row d-flex align-items-center mt-2 mb-2" id="input_line_top">
        <div class="col-auto  me-2  d-flex align-items-center">
          <div  class="input-group">
           <select id="stateche">
           <option value="orders_seq">주문번호</option>
           <option value="user_id">유저ID</option>
           <option value="orders_order_day">주문날짜</option>
           <option  value="book_title">책 이름</option>
          
           <option  value="checksum">총 가격</option>
            <option  value="orders_state">결제상태</option>
           </select>
          </div>
        </div>
        <div class="col  me-2  d-flex align-items-center">
          <div class="input-group   ">
            <input class="fs-5 w-100" type="text" id="contentche" name="searchcontent" placeholder="검색어 입력" >
          </div>
        </div>
      
        <div class="col-auto d-flex align-items-center ">
          <div class="input-group p-0   col">
            <button id="search_btn" class="btn bg-blue text-white rounded-pill col">검색</button>
          </div>
        </div>
      </div>
      <div class="row d-flex m-1" id="table_box">
        <table class="table " id="table">
          <thead>
            <tr>     
              <th>주문번호</th>
              <th>유저ID</th>
              <th>주문날짜</th>
              <th>책 이름</th>
              <th>총 가격</th>
              <th>결제상태</th>         
            </tr>
          </thead>
          <tbody>
           
            <c:forEach var="it" items="${list}">
              <tr>
               <td>
                  <p><a href="tradeordersdetail.mdo?orders_seq=${it.orders_seq}">${it.orders_seq}</a></p>
                </td>
                <td>
                  <p >${it.user_id}</p>
                </td>
                <td>
                  <p>${it.orders_order_day}</p>
                </td>
                <td>
                  <p >${it.book_title}</p>
                </td>
                <td>
                  <p><fmt:formatNumber value="${it.sum}" pattern="#,###" /></p>
                </td>
                <td>
                  <p><a href="admintradebooklist.mdo?order_bookList_seq=${it.order_bookList_seq}">${it.orders_status}</a></p>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <div id="page" class="row justify-content-center d-flex">
          <div class="col"></div>
          <nav class="col d-flex justify-content-center" aria-label="...">
            <ul class="pagination">
              <c:if test="${vo.page ne 1}">
                <li class="page-item "><a class="page-link"> < </a></li>
              </c:if>
              <c:forEach var="i" begin="${startpage}" end="${endpage}">
                <c:if test="${vo.page ne i}">
                  <li class="page-item"><a class="page-link" href="#">${i} </a></li>
                </c:if>
                <c:if test="${vo.page eq i}">
                  <li class="page-item active" aria-current="page"><a href="#" class="page-link">${i}</a></li>
                </c:if>
              </c:forEach>
              <c:if test="${vo.page lt maxpage}">
                <li class="page-item"><a class="page-link" href="#">></a></li>
              </c:if>
            </ul>
          </nav>
          <div class="col"></div>
        </div>
        <input type="number" value="${vo.page}" class="hide" id="page"/>
        <input type="hidden" value="${vo.searchkeyword}"  class="hide" id="searchkeyword"/>
        <input type="hidden" value="${vo.searchcontent}"  class="hide" id="searchcontent"/>
      </div>
    </div>
   
  </div>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
  <!-- 여기서부터 JS 추가 -->
  <script src="/js/admin_trade_cancel.js"></script>
</body>
</html>