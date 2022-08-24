<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
     <link href="/css/my_MileagePay.css" rel="stylesheet" />
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
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
            <div class="col-auto p-0" id="myMileage_have">5,000,000</div>
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
              type="text"
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
            <div class="col-auto p-0" id="myMileage_sum">5,000,000</div>
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
          <form class="col">
            <input
              type="radio"
              name="howPay"
              value="신용카드"
              checked
            />신용카드
            <input type="radio" name="howPay" value="실시간 계좌이체" />실시간
            계좌이체
            <input type="radio" name="howPay" value="무통장 입금" />무통장 입금
            <input type="radio" name="howPay" value="PAYCO" />PAYCO
            <input type="radio" name="howPay" value="네이버페이" />네이버페이
          </form>
        </div>
        <div><br /><br /></div>
        <div class="row">
          <div class="col-4"></div>
          <div class="col">
            <input type="submit" name="payAccess" value="결제" />
          </div>
          <div class="col">
            <input type="submit" name="payCancel" value="취소" />
          </div>
        </div>
        <div><br /><br /></div>
      </div>
      <div class="col-2" id="right_blank"></div>
    </div>
	   
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
           <script src="/js/jquery.number.min.js"></script>
        <script src="/js/my_MileagePay.js"></script>
	<!-- Footer End -->
</body>
</html>