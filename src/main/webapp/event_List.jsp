<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/event_List.css" rel="stylesheet">
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
    <div class="row" id="main_wrapper">
    <div class="col-2"></div>
    <!-- Blog Start -->
    <div class="col">


      <div class="container-xxl py-5">
        <div class="container">
          <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s"
            style="max-width: 100%;">
            <h1 class="display-5 mb-3">이벤트</h1>
            <p id="bottomRow">낭만서점에서만 만날 수 있는 특별하고 조촐하고 아름다운 혜택</p>
          </div>


          <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.1s">
              <a href="">
                <img class="img-fluid" src="/img/check.jpg" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>10월 출석
                    체크!</small><br>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                    30
                    Oct, 2022</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.3s">
              <a href="">
                <img class="img-fluid" src="/img/getReady.png" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>두근두근 뭐가
                    생길까?</small>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                  </small>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" id="imgsize" data-wow-delay="0.5s">
              <a href="">
                <img class="img-fluid" src="/img/getReady.png" alt="">
              </a>
              <div class="bg-light p-4">
                <div class="text-muted border-top pt-4">
                  <small class="me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>세근세근 뭐가
                    생길까?</small>
                  <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>30 Sep, 2022 ~
                  </small>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Blog End -->

      <!-- border -->
      <span>
        <p id="dmz"></p>
      </span>
      <!-- border -->

      <!-- 하위 이벤트 -->
      <div class="event_con">
        <ul>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="/img/subscribe.JPG">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">낭만서점 회원들만의 구독 서비스!</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">매달 관심인기서적 랜덤 배송!<br>장기 구독시 할인 혜택까지!!</div>
            </div>
            <br>
          </li>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="/img/rullet.jpg">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">돌려돌려 돌림판</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">매일 돌림판 돌리고 포인트 받자!<br>낮은 확률로 대박 당첨의 기회를!!
              </div>
            </div>
          </li>
          <li>
            <div style="float: left;">
              <a href="#">
                <img id="southImg" src="/img/helper.JPG">
              </a>
            </div>
            <div style="float:left ; width:440px">
              <div style="line-height:19px;">
                <div></div>&nbsp;
                <strong><a href="#">친구야 여기 어때?</a></strong><br>
              </div>
              <div style="height:40px; margin:3px 0 0 10px;" id="southFont">모든 회원<br>365일</div>
              <div style="margin:3px 0 0 10px;" id="southFont">신규 회원 추천인 기입시 포인트 지급!<br>매달 최고의 추천인에게 추가
                포인트를!
              </div>
            </div>
          </li>
        </ul>

      </div>


      <!-- 하위 이벤트 끝 -->

      <!-- 페이지네이션 -->
      <div class="row" id="goMiddle">


        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- 페이지네이션 끝 -->
      </div>
    </div>
    <div class="col-2"></div>
  </div>
	   
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
        
	<!-- Footer End -->
</body>
</html>