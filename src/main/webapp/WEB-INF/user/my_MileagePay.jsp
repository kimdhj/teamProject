<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
     <link href="/css/my_MileagePay.css" rel="stylesheet" />
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
    <form method="post" action="/pointfinish.do" id="payfin">
    <div class="row" id="main_wrapper">
      <div class="col-2" id="left_blank"></div>
      <div class="col-8" id="middle_contents">
        <div class="row border-bottom border-2 border-dark">
          <h1 class="col-4">마일리지 결제</h1>
          <div class="col"></div>
        </div>
        <div class="row" id="formoondolyer">
          <div><br /></div>
          <div class="col-4 fs-4" id="big_big">결제 이전 마일리지</div>
          <div class="col-4 d-flex flex-row align-items-center"></div>
          <div class="col-4 d-flex flex-row align-items-center text-end">
            <div class="col"></div>
            <div class="col-auto p-0" id="myMileage_have"><fmt:formatNumber value="${mapoint.user_point }" pattern="#,###" /></div>
            <div class="col-auto p-0">P</div>
          </div>
          <div><br /></div>
        </div>
        <!-- formoondolyer -->
        <div class="row" id="formoondolyer">
          <div><br /></div>
          <div class="col-4 fs-4" id="big_big">결제 예정 마일리지</div>
          <div class="col-5 d-flex flex-row align-items-center">
            <input
              type="number"
              name="howmuchmileage"
              id="howmuchmileage"
              value="0"
              style="text-align: center"
            />
          </div>
          <div class="col-3 d-flex flex-row align-items-center text-end">
            <div class="col"></div>
            <div class="col-auto p-0" id="myMileage_pay">0</div>
            <div class="col-auto p-0">P</div>
          </div>
          <div><br /></div>
        </div>
        <!-- formoondolyer -->
        <div class="row border-bottom border-2 border-dark" id="formoondolyer">
          <div><br /></div>
          <div class="col-4 fs-4" id="big_big">결제 이후 마일리지</div>
          <div class="col-5 d-flex flex-row align-items-center"></div>
          <div class="col-3 d-flex flex-row align-items-center text-end">
            <div class="col"></div>
            <div class="col-auto p-0" id="myMileage_sum">${mapoint.user_point }</div>
            <div class="col-auto p-0">P</div>
          </div>
          <div><br /></div>
        </div>
        <!-- formoondolyer -->

        <div><br /></div>
        <div class="row">
          <div class="col-4 fs-4" id="big_big">최종 결제 금액</div>
          <div class="col-5"></div>
          <div class="col-3 text-end me-0">
            <div><span id="sumsumsum">0</span>원</div>
          </div>
          <div><br /></div>
        </div>
        <div class="row border-bottom border-2 border-dark"></div>
        <div class="row">
          <div><br /></div>
          <ul id="whisper">
            <li>
              본사는 회원님의 실수로 적용되지 않은 할인은 적용시켜드리지
              못합니다.
            </li>
            <li>
              혹시나 잘 못 적용해서 혜택을 보지 못하셨다면 유감의 말씀을
              전합니다.
            </li>
            <li>
              위와 같은 경우가 발생한다면 김동현 조장님께서 한 잔의 커피를
              사드립니다.
            </li>
          </ul>
        </div>
        <div><br /><br /></div>
        <div class="row">
				<div class="col-2" id="big_big">결제 정보</div>
				<div class="row d-flex">
					<input class="col-auto" type="radio" name="orders_cache_tools" value="카드" checked />카드
					<input  class="col-auto" type="radio" name="orders_cache_tools" value="계좌이체" />실시간
					계좌이체 <input  class="col-auto" type="radio" name="orders_cache_tools" value="핸드폰결제" />핸드폰
					결제
				</div>
			</div>
        <div>
				<br /> <br />
			</div>
			<div class="row">
				<div class="col-4"></div>
				<div class="col">
					<input type="button" id="paystart" name="payAccess" value="결제" />
				</div>
				<div class="col">
					<input type="button" name="payCancel" value="취소" />
				</div>
			</div>
			<div>
				<br /> <br />
			</div>
      </div>
      <div class="col-2" id="right_blank"></div>
    </div>
	   
	   <!-- 결제 페이지에 필요한 정보 -->
	<input type="hidden" id="orders_title" name="orders_title" value="마일리지" />
	<input type="hidden" id="orders_email" name="orders_email" value="${mapoint.user_email }" />
	<input type="hidden" id="orders_name" name="orders_name" value="${mapoint.user_name }" />
	<input type="hidden" id="phone" name="phone" value="${mapoint.user_phone }" />
	<input type="hidden" id="orders_address" name="orders_address" value="${mapoint.user_address }" />
	<input type="hidden" id="zipcode" name="zipcode" value="${mapoint.user_zipcode }" />
	
	<!-- 결제 이후 받을 정보 -->
	<input type="hidden" name="points_count" id="points_count" />  
	<!-- 결제 금액 -->
	<input type="hidden" name="points_content"  id="points_content" value="마일리지" />
	<input type="hidden" name="orders_status" id="orders_status" /> 
	<input type="hidden" name="orders_cache_tool" value="카드" id="cache_tool" /> 
	
    </form>
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
           <!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<!--다음 주소  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
           <script src="/js/jquery.number.min.js"></script>
        <script src="/js/my_MileagePay.js"></script>
        <script src="/js/import_cache_point.js"></script>
	<!-- Footer End -->
</body>
</html>