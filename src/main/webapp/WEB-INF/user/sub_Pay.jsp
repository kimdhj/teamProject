<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/sub_Pay.css" rel="stylesheet" />
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
    <div class="row" id="main_wrapper">
      <div class="col-2"></div>
      <div class="col-8">
        <h1>구독 결제</h1>
        <div>
          <div class="row" id="top_border_bottom">
            <div class="col-8" id="big_big">상품 정보</div>
            <div class="col text-end me-3" id="big_big">금액</div>
          </div>
          <div class="align-items-center row" id="top_border_bottom">
            <div class="col-4" id="big_big">구독</div>
            <div class="col-4">
              <div class="row">
                <input class="col-2" type="button" id="minus" value="-" />
                <div class="col-1"></div>
                <input
                  class="col"
                  type="text"
                  name="howmuchsub"
                  id="howmuchsub"
                  value="1"
                  style="text-align: center"
                />
                <div class="col-1"></div>
                <input class="col-2" type="button" id="plus" value="+" />
              </div>
            </div>
            <div class="col-4 align-items-center text-end pe-4">
              <span id="subPriceResult">30,000</span><span>원</span>
            </div>
          </div>
          <div class="row" id="top_border">
            <div class="col-4" id="big_big">할인</div>
            <div class="col-4 ps-0">
              <input
                type="text"
                name="usePoint"
                id="usePoint"
                placeholder="포인트 입력"
                style="text-align: center"
              />
            </div>
            <div class="col-4 text-end pe-4">
              - <span class="pe-1" id="usePointResult">0</span>P
            </div>
          </div>
        </div>
        <div class="row" id="usable_point">
          <div class="col-4"></div>
          <p class="col-4 ps-0">
            가용 포인트 : <span id="myPoint">5000000</span>P
          </p>
          <div class="col-4"></div>
        </div>
        <div class="row" id="whysoclose">
          <div class="col-4"></div>
          <div class="col ps-0">
            <select id="input_text_size">
              <option>쿠폰을 선택하세요</option>
              <option value="30000" id="new_user_coupon">신규 유저 쿠폰</option>
              <option value="40000" id="my_friend_coupon">추천인 특별 쿠폰</option>
              <option value="50000" id="roulette_coupon">룰렛 5등 당첨 쿠폰</option>
            </select>
          </div>
          <div class="col-4 text-end me-1">
            <div>- <span id="coupon_result">0</span>원</div>
          </div>
        </div>
        <div class="row" id="top_border_bottom">
          <div class="col-4 p-0">
            <div id="big_big">합계</div>
          </div>
          <div class="col-4"></div>
          <div class="col-4 text-end me-0">
            <div><span id="sumsumsum">0</span>원</div>
          </div>
        </div>
        <div class="row" id="top_border">
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

        <div class="row" id="top_border">
          <div class="col-2" id="big_big">배송지 입력</div>
          <p class="col-2" id="deliver">수령인</p>
          <input type="text" class="col-4" value="이름을 입력해주세요" />
          <div class="col-2"></div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 3%">
          <div class="col-2"></div>
          <p class="col-2" id="deliver">연락처</p>
          <div class="col-6">
            <div class="row">
              <select class="col-3">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
              </select>
              &nbsp;-&nbsp;<input type="text" class="col" /> &nbsp;-&nbsp;<input
                type="text"
                class="col"
              />
            </div>
          </div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 3%">
          <div class="col-2"></div>
          <p class="col-2" id="deliver">배송지명</p>
          <div class="col-6">
            <div class="row">
              <select id="home" class="col">
                <option value="">우리집</option>
                <option value="">우리집앞집</option>
              </select>
              <div class="col-1"></div>
              <button type="button" id="addhome" name="addhome" class="col">
                배송지 추가
              </button>
            </div>
          </div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 3%">
          <div class="col-2"></div>
          <p class="col-2" id="deliver">주&nbsp;&nbsp;소</p>
          <div class="col-6">
            <div class="row">
              <input type="text" class="col" />
              <div class="col-1"></div>
              <button type="button" id="zipcode" name="zipcode" class="col">
                우편번호
              </button>
            </div>
          </div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 2%">
          <div class="col-4"></div>
          <div class="col p-0">
            <input type="text" id="input_text_size" />
          </div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 3%">
          <div class="col-2"></div>
          <p class="col-2" id="deliver">상세주소</p>
          <div class="col-6 p-0">
            <input type="text" id="input_text_size" />
          </div>
          <div class="col-2"></div>
        </div>
        <div class="row" style="margin-top: 3%">
          <div class="col-2"></div>
          <p class="col-2" id="deliver">배달 요청사항</p>
          <div class="col-6 p-0">
            <input type="text" id="input_text_size" />
          </div>
          <div class="col-2"></div>
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
      <!-- 구독가격, 쿠폰가격 하이딩 -->
      <div class="col-2">
        <div class="hide" id="subPrice">30000</div>
        <div class="hide" id="new_user_coupon">30000</div>
        <div class="hide" id="my_friend_coupon">40000</div>
        <div class="hide" id="roulette_coupon">50000</div>
      </div>

      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"
      ></script>
    </div>
	   
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
        <script src="/js/jquery.number.min.js"></script>
        <script src="/js/sub_Pay.js"></script>
	<!-- Footer End -->
</body>
</html>