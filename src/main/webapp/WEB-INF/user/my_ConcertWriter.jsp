<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_ConcertWriter.css" rel="stylesheet">
</head>
<body>
  <!-- Common header include -->
  <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
  <!-- Common header include End -->
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
  <!-- 여기 삽입 -->
  <div class="row" id="main_wrapper">
    <div class="row" id="under_menu">
      <div class="row" id="writerBox">
        <div id="under_topText">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-half" viewBox="0 0 16 16">
                            <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
                        </svg>
          관심 작가
        </div>
        <div class="row" id="table">
          <div id="table_title" class="row">
            <div class="col-1"><input class="form-check-input allche" type="checkbox" value="" id="flexCheckDefault"></div>
            <div class="col-5">작가</div>
            <div class="col">관심 등록일</div>
          </div>
          <div id="table_items">
            <c:forEach var="it" items="${list}">
              <div id="table_item" class="row item">
                <div class="col-1">
                  <input class="form-check-input delche" type="checkbox" value="" id="flexCheckDefault">
                  <input type="number" class="hide" value="${it.author_seq}" id="auth_seq"/>
                </div>
                <div onclick="location.href='/booklist.do/author_seq=${it.author_seq}'" class="col-5">${it.author_name}</div>
                <div class="col">${it.concern_writer_date}</div>
              </div>
            </c:forEach>
          </div>
          <div id="table_bottom" class="row">
            <nav aria-label="Page     navigation example">
              <ul class="pagination">
                <c:if test="${vo.page ne 1}">
                  <li class="page-item"><a class="page-link"  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
                </c:if>
                <c:forEach var="i" begin="${startpage}" end="${endpage}">
                  <c:if test="${vo.page ne i}">
                    <li class="page-item"><a class="page-link" >${i}</a></li>
                  </c:if>
                  <c:if test="${vo.page eq i}">
                    <li class="page-item"><a class="page-link active" >${i}</a></li>
                  </c:if>
                </c:forEach>
                <c:if test="${vo.page lt maxpage}">
                  <li class="page-item"><a class="page-link"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>
        <div class="row" id="btn_box">
          <div class="col"></div>
          <button type="button" id="seldel" class="btn btn-secondary rounded-pill col-auto">작가 삭제</button>
        </div>
      </div>
    </div>
    <input type="number" class="hide" id="page" value="${vo.page}">
  </div>
  <jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
  <!-- Footer Start -->
  <!-- Common Footer include -->
  <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
  <script src="/js/my_ConcertWriter.js"></script>
  <!-- Footer End -->
</body>
</html>