<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_PurchaseDetail.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
  <!-- 여기 삽입 -->
  <!-- 구매 상세 페이지 -->
  <div>
    <div class="row">
      <div class="col-11">
        <h3 id="purchaseDetail_name">구매 상세</h3>
        <div class="col-12" id="purchaseDetail_box">
          <div class="row">
            <div class="col-3">주문일자</div>
            <div class="col-3 purchaseDetail_content1">2022.07.23</div>
            <div class="col-3">주문번호</div>
            <div class="col-3 purchaseDetail_content1">2022072312345678</div>
          </div>
        </div>
        <div class="col-12 purchaseDetail_hr mt-1"></div>
        <div class="row purcahseDetail_content2 mt-2 mb-2">
          <div class="col-3">상품주문번호</div>
          <div class="col-5 text-start">상품정보</div>
          <div class="col-2">상품금액(수량)</div>
          <div class="col-2">진행상태</div>
        </div>
        <div class="col-12 purchaseDetail_hr mb-2"></div>
        <div class="row purcahseDetail_content3">
          <div class="col-3">2022072312345678</div>
          <div class="col-2">
            <img width="100%" src="./img/product1-8.jpg">
          </div>
          <div class="col-3 purchaseDetail_productinfo">
            <div class="row">
              <div class="col text-start p-0">제목</div>
              <div class="col">해리포터</div>
            </div>
            <div class="row">
              <div class="col text-start p-0">저자</div>
              <div class="col">은지</div>
            </div>
            <div class="row">
              <div class="col text-start p-0">출판사</div>
              <div class="col">KG</div>
            </div>
            <div class="row">
              <div class="col text-start p-0">출판일자</div>
              <div class="col">2015.07.28</div>
            </div>
          </div>
          <div class="col-2">1</div>
          <div class="col-2">
            <div class="row">
              <div class="col">
                <button>배송현황</button>
              </div>
            </div>
            <!-- 발송완료가 될 경우에만 발송완료라고 출력되게 만들기 -->
            <div class="row text-center">
              <div class="col mt-1">발송완료</div>
            </div>
          </div>
        </div>
        <div class="col-12 purchaseDetail_hr mt-2"></div>
      </div>
    </div>
  </div>
  <!-- 최초 주문금액(4) | 결제상세(4) | 주문금액(4) -->
  <div>
    <div class="row">
      <div class="col-11">
        <h6 class="mt-3">주문/결제 금액 정보</h6>
        <div class="col-12 purchaseDetail_hr mt-1"></div>
      </div>
      <div class="col-11">
        <div class="row">
          <div class="col-4 purchaseDetail_box2">
            <h6 class="purchaseDetail_name2">최소 주문금액</h6>
            <div class="row purchaseDetail_font">
              <div class="col-5">상품금액</div>
              <div class="col text-end">180,000원</div>
            </div>
            <div class="row purchaseDetail_font">
              <div class="col-5">배송비</div>
              <div class="col text-end">0원</div>
            </div>
            <div class="row purchaseDetail_font">
              <div class="col-5">할인</div>
              <div class="col text-end">0원</div>
            </div>
          </div>
          <div class="col-4">
            <h6 class="purchaseDetail_name2">결제 상세</h6>
            <div class="row purchaseDetail_font">
              <div class="col-5">결제 방법</div>
              <div class="col text-end">180,000원</div>
            </div>
            <div class="row purchaseDetail_font">
              <div class="col-5">할인 가격</div>
              <div class="col text-end">0원</div>
            </div>
          </div>
          <div class="col purchaseDetail_order">
            <!-- 주문 금액 확인 창 -->
            <div class="row purchaseDetail_name3">
              <div class="col">
                <h6>주문금액</h6>
              </div>
              <div class="col text-end">
                <h6>180,000원</h6>
              </div>
            </div>
            <div class="row purchaseDetail_font">
              <div class="col-5">카드</div>
              <div class="col text-end">100,000원</div>
            </div>
            <div class="row purchaseDetail_font">
              <div class="col-5">무통장 입금</div>
              <div class="col text-end">80,000원</div>
            </div>
          </div>
        </div>
        <div class="col-12 purchaseDetail_hr"></div>
      </div>
      <!-- 포인트 혜택 -->
      <div class="col-11">
        <h6 class="purchaseDetail_name3">포인트 혜택</h6>
        <div class="col-12 purchaseDetail_hr"></div>
      </div>
      <div class="row">
        <div class="col-11 purchaseDetail_font">
          <div class="row purchaseDetail_font2">
            <div class="col text-start">구매적립</div>
            <div class="col text-end">총 200원</div>
          </div>
          <div class="row purchaseDetail_font1">
            <div class="col text-start">기본적립</div>
            <div class="col text-end">200원</div>
          </div>
          <div class="row">
            <div style="color: grey">* 동일 상품의 상품리뷰 적립은 최대 500원으로, 각각 1회로 제한됩니다.</div>
          </div>
        </div>
      </div>
      <div class="col-11">
        <div class="col-12 purchaseDetail_hr mt-1"></div>
        <div class="row">
          <div class="col-2 purchaseDetail_font4">카드 간편 결제</div>
          <div class="col purchaseDetail_font5">우리BC카드 - 일시불 (2022.07.03.18:06)</div>
          <div class="row">
            <div class="col text-start purchaseDetail_font3 mt-1" style="color: grey">
              <!-- 카드 설명 -->
              법인(개인사업자 법인 포함)카드는 할부/무이자 혜택 적용 불가<br> 카드에 BC마크가 없는 경우 무이자 할부 적용 불가<br> 무이자 적용 여부는 카드사로 문의하시면 정확하게 확인할 수 있습니다.
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 수신자 정보 -->
  <div>
    <div class="row">
      <div class="col-11">
        <div class="col-12 purchaseDetail_hr mt-1 mb-1"></div>
        <h6 id="purchaseDetail_name4">수신자 정보</h6>
        <div class="col-12 purchaseDetail_hr mt-1"></div>
      </div>
      <div class="col-11">
        <div class="d-flex">
          <div class="col-2 purchaseDetail_recipientInfo">받는 사람</div>
          <div class="col purchaseDetail_font6 border-bottom-0">고은지</div>
          <div class="col-7"></div>
          <div class="col-2 purchaseDetail_orderer">
            <div>주문자 정보</div>
          </div>
        </div>
        <div class="d-flex">
          <div class="col-2 purchaseDetail_recipientInfo">휴대폰</div>
          <div class="col purchaseDetail_font6 border-bottom-0">010-1111-1111</div>
          <div class="col"></div>
          <div class="col-2 purchaseDetail_orderer2 border-black border-bottom-0">춘식이</div>
        </div>
        <div class="d-flex">
          <div class="col-2 purchaseDetail_recipientInfo" id="purchaseDetail_box4">기타메모</div>
          <div class="col purchaseDetail_font6">집 앞 배송 부탁드립니다.</div>
          <div class="col-4 purchaseDetail_box3"></div>
          <div class="col-2 purchaseDetail_orderer2 border-top-0">010-4837-3856</div>
        </div>
      </div>
    </div>
  </div>
  <!-- 우측하단 끝 -->
  <!-- 마이페이지 메인 바디 끝 -->
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
</body>
</html>