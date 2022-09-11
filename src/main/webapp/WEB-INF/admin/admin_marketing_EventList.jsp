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
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_EventList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	 <!-- 수정가능 테이블 -->
      <div class="row d-flex w-100" id="main_wrapper">
        <div class="col" id="icon_content">
          <div class="row d-flex">
            <div class="col-1"></div>
            <div class="col">
              <!-- 이 안에 내용 -->
        <table class="table">
          <thead>
            <tr>
              <th>제목</th>
              <th>기간</th>
              <th>대상</th>
              <th>내용</th>
              <th></th>
              <th>순서</th>
            </tr>
          </thead>
          <tbody>
			<c:forEach var="top" items="${top_eventList }" >
            <tr class="toptop">
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${top.event_title }">${top.event_title }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="<fmt:formatDate value="${top.event_end_date }" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${top.event_end_date }" pattern="yyyy-MM-dd"/></div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${top.event_target }">${top.event_target }</div>
                </td>
                <td>
                  <a href="/getEvent.mdo?event_seq=${top.event_seq }">
                 <button onclick="detailUpdate()">수정</button>
                  </a>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                  <input type="hidden" class="listNum" value="${top.event_seq }" />
                  <input type="hidden" value="${top.event_title }" />
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>
            </c:forEach>
			<c:forEach var="bottom" items="${bottom_eventList }" >
            <tr class="botbot">
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${bottom.event_title }">${bottom.event_title }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="<fmt:formatDate value="${bottom.event_end_date }" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${bottom.event_end_date }" pattern="yyyy-MM-dd"/></div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${bottom.event_target }">${bottom.event_target }</div>
                </td>
                <td>
                  <a href="/getEvent.mdo?event_seq=${bottom.event_seq }">
                 <button onclick="detailUpdate()">수정</button>
                  </a>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                  <input type="hidden" class="listNum" value="${bottom.event_seq }" />
                  <input type="hidden" value="${bottom.event_title }" />
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>
              </c:forEach>
              
        </tbody>
      </table>
      <!-- 수정가능 테이블 끝 -->
      
      <div class="container">
        <div class="row d-flex">
          <div class="col-9">※ 3번째 항목까지는 상단에 크게 위치하구 4번째 항목부터는 하단에 간략하게 출력됩니다.</div>
          <div class="col-1">
            <a href="/moveInsert.mdo">
            <button type="button" class="btn btn-success">추가</button>
            </a>
          </div>
          <div class="col-1">
            <button type="submit" class="btn btn-primary" id="listChange">수정</button>
          </div>
          <div class="col-1">
          <a href="getEventList.mdo">
            <button type="button" class="btn btn-info">초기화</button>
          </a>
          </div>
        </div>
      </div>

 <!-- 이 안에 내용 끝 100%xauto-->
</div>
<div class="col-1"></div>
</div>
</div>
</div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_marketing_EventList.js"></script>
</body>
</html>