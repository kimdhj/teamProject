<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/event_Roulette.css" rel="stylesheet" />
    <link href="/css/style_roulette.css" rel="stylesheet" />
    <link href="/css/style2_roulette.css" rel="stylesheet" />

    <script type="text/javascript" src="/js/Winwheel.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 --> 
    <div class="row" id="inner_box">
      <div class="col-3"></div>
      <div class="col">
        <div class="row d-flex align-items-end fs-2" id="main_title">
          이벤트
          <div class="col-auto m-0 h1" id="subtitle">
            낭만서점 회원들을 위한 다양한 이벤트를 준비했습니다!
          </div>
        </div>
        <div class="row mt-2" id="table_titleLine">
          <div
            class="col-3 fs-3 bg-gray border-2 border-top border-dark m-0 p-3 text-center align-items-center"
            id="title"
          >
            제목
          </div>
          <div
            class="col d-flex align-items-center fs-3 border-2 border-top border-dark"
            id="content"
          >
            매일매일 출석 돌림판
          </div>
        </div>
        <div class="row" id="table">
          <div
            class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center"
            id="title"
          >
            조회수
          </div>
          <div
            class="col d-flex align-items-center border-2 border-top border-gray border-bottom"
            id="content"
          >
            5,231,543
            <div>명</div>
          </div>
          <div
            class="col-3 fs-4 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center"
            id="title"
          >
            이벤트 기간
          </div>
          <div
            class="col d-flex align-items-center border-2 border-top border-gray border-bottom"
            id="content"
          >
            2022-08-02 ~ 2022-09-30
          </div>
        </div>
        <div class="row" id="Content">
          <div id="bull" class="row">
            <div class="col">
              <div
                class="row the_wheel justify-content-center fs-1"
                align="center"
                valign="center"
              >
                <i class="bi bi-arrow-down fs-1"></i>
              </div>
              <div
                class="row the_wheel justify-content-center"
                align="center"
                valign="center"
              >
                <canvas width="500" height="500" class="col-auto" id="canvas">
                </canvas>
              </div>
              <div class="row power_controls mt-5 justify-content-center">
                <img
                  class="col-auto"
                  id="spin_button"
                  src="img/spin_off.png"
                  alt="Spin"
                  onClick="startSpin();"
                />
              </div>
              <div>매일매일 돌림판을 돌려서 마일리지 얻자!</div>
              <ul>
                <li>매일 00:00 기준입니다.</li>
                <li>완전히 돌아갈때까지 기다려주세요!</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-end bg-gray" id="endPoint">
          맨위로<i class="bi bi-caret-up-fill col-auto"></i>
        </div>
        <div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
          <button class="col-auto bg-white border-1">목록</button>
          <button class="col-auto bg-white border-1">
            <i class="bi bi-caret-right-fill"></i>
          </button>
        </div>
      </div>
      <div class="col-2"></div>
    </div>
	   
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
        <script src="/js/event_Roulette.js"></script>
	<!-- Footer End -->
</body>
</html>