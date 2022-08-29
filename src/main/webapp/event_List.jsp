<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ page import="com.romance.event.board.BoardVO"%>
<%@ page import="java.util.List"%> --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <div
              class="section-header text-center mx-auto mb-5 wow fadeInUp"
              data-wow-delay="0.1s"
              style="max-width: 100%"
            >
              <h1 class="display-5 mb-3">이벤트</h1>
              <p id="bottomRow">
                낭만서점에서만 만날 수 있는 특별하고 조촐하고 아름다운 혜택
              </p>
            </div>

            <div class="row g-4">
            	<c:forEach var="top_event_list" items="${eventList }" >
              <div
                class="col-lg-4 col-md-6 wow fadeInUp"
                id="imgsize"
                data-wow-delay="0.1s"
              >
                <a href="">
                  <img class="img-fluid" src="${event.thumbnail }" alt="" />
                </a>
                <div class="bg-light p-4">
                  <div class="text-muted border-top pt-4">
                    <small class="me-3"
                      ><i class="fa fa-map-marker-alt text-primary me-2"></i
                      >${event_title }</small
                    ><br />
                    <small class="me-3"
                      ><i class="fa fa-calendar text-primary me-2"></i><fmt:formatDate value="${event.start_date }" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${event.end_date }" pattern="yyyy-MM-dd"/></small
                    >
                  </div>
                </div>
              </div>
              </c:forEach>
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
            <c:forEach var="bottom_event_list" items="${eventList }" >
            <li>
              <div style="float: left">
                <a href="#">
                  <img id="southImg" src="${event.thumbnail }" />
                </a>
              </div>
              <div style="float: left; width: 440px">
                <div style="line-height: 19px">
                  <div></div>
                  &nbsp;
                  <strong
                    ><a href="#">${event.title }</a></strong
                  ><br />
                </div>
                <div style="height: 40px; margin: 3px 0 0 10px" id="southFont">
                  ${event.target }<br /><fmt:formatDate value="${event.start_date }" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${event.end_date }" pattern="yyyy-MM-dd"/>
                </div>
                <div style="margin: 3px 0 0 10px" id="southFont">
                  ${event.content }
                </div>
              </div>
              <br />
            </li>
            </c:forEach>
          </ul>
        </div>

        <!-- 하위 이벤트 끝 -->

        </div>
      <div class="col-2"></div>
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