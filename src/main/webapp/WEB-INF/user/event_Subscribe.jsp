<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.romance.user.event.EventVO" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/event_Subscribe.css" rel="stylesheet" />
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
            ${event_event.event_title }
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
            ${event_event.event_cnt }
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
            <fmt:formatDate value="${event_event.event_start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event_event.event_end_date }" pattern="yyyy-MM-dd"/>
          </div>
        </div>
        <div class="row" id="Content">
          <div class="col-2"></div>
          <div class="col-8 text-center">
            <div id="brbrbrbr"><br /></div>
            <div id="br_under_content">
              ${event_event.event_content }
            </div>
            <div class="d-flex justify-content-center">
              <input
                type="button"
                id="1month_sub"
                value="1달 구독"
                href="subscribePay.html"
              />
            </div>
            <div class="row d-flex justify-content-center">
              <div class="col-auto pe-0" id="subscribe_Price_oneMonth">30000</div>
              <div class="col-auto ps-0"> 원</div>
            </div>
            <div id="br_under_content">
              <ul></ul>
                <li>
                  롬복쓰는 이유가 @Setter , @Getter, @ToString 세개 쓸려고
                  쓰는거야
                </li>
                <li>
                  클래스랑 같은 이름의 테이블을 자동으로 찾는데 @Table()로 다른
                  이름 테이블 명시가능
                </li>
                <li>
                  < , > 뒤에꺼는 시퀀스의 '자료형'! 5강 4p 표 6,8,9번째 row
                  바뀐거 주의
                </li>
                <li>Crud를 상속받으면 메서드랑 그런거 다 만들어주는거야</li>
                <li>
                  시험 5개씩 정보처리기준 실기는 게시판 만들기 내일 양식
                  주는대로 보고서를 써야해
                </li>
                <li>
                  화면 설계 화면 구현 네트워크 프로그래밍 구현 애플리케이션
                  테스트 수행 애플리케이션 배포
                </li>
              </ul>
            </div>
            <div><br></div>
            <div class="d-flex justify-content-center">
              <input
                type="button"
                id="1year_sub"
                value="1년 구독"
                href="subscribePay.html"
              />
            </div>
            <div class="row d-flex justify-content-center">
              <div class="col-auto pe-0" id="subscribe_Price_oneYear">360000</div>
              <div class="col-auto ps-0"> 원</div>
            </div>
            <div class="hide" id="subPrice">30000</div>
          </div>
          <div class="col-2"></div>
          <div></div>
        </div>
        <div class="row d-flex justify-content-end bg-gray back-to-top" id="endPoint">
          맨위로<i class="bi bi-caret-up-fill col-auto"></i>
        </div>
        <div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
		<a href="/getEventList.do">
          <button class="col-auto bg-white border-1">목록</button>
		</a>
        </div>
      </div>
      <div class="col-2"></div>
    </div>
	   
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
        <script src="/js/event_Subscribe.js"></script>
	<!-- Footer End -->
</body>
</html>