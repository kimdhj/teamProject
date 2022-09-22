<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
     <link href="/css/my_SubPay.css" rel="stylesheet" />
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
    <div class="row" id="main_wrapper">
      <div class="col-2" id="left_blank"></div>
      <div class="col-8" id="middle_contents">
        <div class="row border-bottom border-2 border-dark">
          <h1 class="col-4">구독 결제</h1>
          <div class="col"></div>
        </div>
        <div class="row" id="formoondolyer">
          <div><br /></div>
          <div class="col-4 fs-4" id="big_big">매월 결제 금액</div>
          <div class="col-4 d-flex flex-row align-items-center"></div>
          <div class="col-4 d-flex flex-row align-items-center text-end">
            <div class="col"></div>
            <div class="col-auto p-0" id="myMileage_have">30,000</div>
            <div class="col-auto p-0">원</div>
          </div>
          <div><br /></div>
        </div>
        <!-- formoondolyer -->
        <div class="row" id="formoondolyer">
          
        </div>
        <!-- formoondolyer -->
        
        <!-- formoondolyer -->

        <div><br /></div>
        <div class="row">
          <div class="col-4 fs-4" id="big_big">최종 결제 금액</div>
          <div class="col-5"></div>
          <div class="col-3 text-end me-0">
            <div><span id="sumsumsum">30,000</span>원</div>
          </div>
          <div><br /></div>
        </div>
        <div class="row border-bottom border-2 border-dark"></div>
        <div class="row">
          <div><br /></div>
          <ul id="whisper">
            <li>
              본사는 이미 결제된 요금은 환불 되지 않습니다.
            </li>
            <li>
              혹시나 실수로 인한 결제시 환불이 불가함에 유감의 말씀을
              전합니다.
            </li>
            <li>
              위와 같은 경우가 발생한다면 조속히 고객센터로 연락 바랍니다.
            </li>
          </ul>
        </div>
        <div><br /><br /></div>
        <div class="row">
          <div class="col-2" id="big_big">결제 정보</div>
          <form class="col">
            <input
              type="radio"
              name="orders_cache_tools"
              value="카드"
              checked
            />카드
            <input type="radio" name="orders_cache_tools" value="카카오 페이" />카카오 페이
          
         
          </form>
        </div>
        <div><br /><br /></div>
        <div class="row">
          <div class="col-4"></div>
          <div class="col">
            <input type="button" id="paystart" name="payAccess" value="결제" />
          </div>
        
        </div>
        <div><br /><br /></div>
      </div>
      <div class="col-2" id="right_blank"></div>
    </div>
	   <input type="hidden" id="user_id" value="${user.user_id}"/>
	   <input type="hidden" id="user_login_day" value="${user.user_login_day}"/>
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- iamport.payment.js -->
  <script type="text/javascript"
    src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
           <!-- 여기에 js관련  -->
           <script src="/js/jquery.number.min.js"></script>
        <script src="/js/my_SubPay.js"></script>
	<!-- Footer End -->
</body>
</html>