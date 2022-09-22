<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Qna.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
  <!-- 여기서부터 화면 작성 시작 -->
  <div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
    <div class="mb-0 p-0">
      <button onclick="location.reload();" id="all" class="select p-2">문의</button>
    </div>

    <div id="all_box" class="bg-white w-100">
      <div class="row d-flex align-items-center" id="input_line_top">
        <div class="col-2"></div>
        <div class="col-10" id="day_select">
          <div id="day_calendar" class="col-5" style="margin-top: 1%;">
            <input class="col-4" placeholder="시작날짜" type="text"
              id="start_date"
              style="height: 50px; margin-top: 2%; text-align: center;" />
            <div class="qna_font">~</div>
            <input class="col-4" placeholder="마지막 날짜" type="text"
              id="end_date"
              style="height: 50px; margin-top: 2%; text-align: center;" />
            <div id="day_btn" class="col-7">
              <div id="dayAdd" class="btn-group me-2" role="group"
                aria-label="Second group">
                <button type="button" class="btn btn-secondary week">1주일</button>
                <button type="button" class="btn btn-secondary month">1개월</button>
                <button type="button" class="btn btn-secondary threemonth">3개월</button>
                <button type="button" class="btn btn-secondary sixmonth">6개월</button>
                <button type="button" class="btn btn-secondary year">1년</button>
              </div>
            </div>
          </div>
        </div>
        <div class="col-2"></div>
        <div class="col-2 me-2 mt-3" style="padding-left: 0px;">
          <div class="input-group mb-3 d-flex">
            <select class="row form-select w-100 fs-5" id="level" name="level"
              id="level" aria-label="Default select example"
              style="margin-left: 1px;">
              <option class="fs-5" value="전체">전체</option>
              <option class="fs-5" value="제목">제목</option>
              <option class="fs-5" value="작성자">작성자</option>
              <option class="fs-5" value="답변여부">답변여부</option>
            </select>
          </div>
        </div>
        <div class="col-4  me-2 mt-3">
          <div class="input-group mb-3 ">
            <input class="fs-5 w-100" type="text" id="search" placeholder="검색할 내용 입력">
          </div>
        </div>
        <div class="col-auto ">
          <div class="input-group p-0 mt-2  col">
            <button id="search_btn"
              class="btn bg-blue text-white rounded-pill col">검색</button>
            &nbsp;&nbsp;
          </div>

        </div>
        <div class="row d-flex m-1" id="table_box">
          <table class="table " id="table">
            <thead>
              <tr>
                <th><input class="form-check-input border-1 border-dark allche" type="checkbox" id="flexCheckChecked" checked></th>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일자</th>
                <th>답변여부</th>
                <th><button class="btn btn-warning rounded-pill seldel">선택 삭제</button></th>
              </tr>
            </thead>
            
            <c:set var="allCount" value="1"/>
            <c:set var="status" value="답변완료"/>
            <tbody>
              <c:forEach items="${askList }" var="ask" begin="0" end="4">
              <tr>
                <td><input class="form-check-input border-1 border-dark delche chkbox" type="checkbox" name="chkbox" id="flexCheckChecked" checked>
                </td>
                <td>
                  <p id="seq">${allCount }</p>
                  <input type="hidden" value="${ask.ask_seq }" />
                </td>
                <td>
                  <p class="rowColumn" id="title">
                    <c:if test="${ask.ask_status eq  '답변 완료'}">
                      <a href="/qnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${allCount}">
                        ${ask.ask_title }
                      </a>
                    </c:if>
                    <!-- 답변 대기일 때, 해당 답변 상세페이지로 이동 -->
                    <c:if test="${ask.ask_status eq  '답변 대기'}">
                      <a href="/QnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${allCount}">
                        ${ask.ask_title }
                      </a>
                    </c:if>
                  </p>
                  <c:set var="allCount" value="${allCount + 1 }"/>
                </td>
                <td>
                  <p class="selectColumn">${ask.user_id }</p>
                </td>
                <td>
                  <p class="rowColumn">
                    <fmt:formatDate value="${ask.ask_date }" pattern="yyyy-MM-dd"/>
                  </p>
                </td>
                <td>
                <input type="hidden" value="${ask.ask_status }"  id="ask_status" />
                  <c:if test="${ask.ask_status eq  '답변 완료'}">
                    <button class="btn btn-outline-primary rounded-pill" name="ask_status">
                      답변 완료
                    </button>
                  </c:if>
                  <!-- 답변 대기일 때, 해당 답변 상세페이지로 이동 -->
                  <c:if test="${ask.ask_status ne  '답변 완료'}">
                    <button class="btn btn-success rounded-pill"  name="ask_status" type="button" onclick="location.href='/QnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${allCount}'">
                      답변 대기
                    </button>
                  </c:if>
                </td>
                <td>
                  <button class="btn btn-danger rounded-pill del" type="button">삭제</button>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      
      <!-- 페이징 -->
      <div id="page" class="row justify-content-center d-flex">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            <c:if test="${allPage ne 1}">
              <li class="page-item"> <a class="page-link">< </a></li>
            </c:if>
            <c:forEach var="i" begin="${startpage }" end="${endpage}">
              <c:if test="${allPage ne i}">
                <li class="page-item"><a class="page-link" href="#">${i} </a></li>
              </c:if>

              <c:if test="${allPage eq i}">
                <li class="page-item active" aria-current="page"><a href="/QnaList.mdo?page=${i}&title=${allSvo.title}&user=${allSvo.user }&status=${allSvo.status }&startDate=${allSvo.startDate}&endDate=${allSvo.endDate}&seq=${allSvo.seq}" class="page-link">${i}</a></li>
              </c:if>
            </c:forEach>
             
            <c:if test="${allPage lt allCount/5}">
            <li class="page-item"><a class="page-link" href="#">></a></li>
            </c:if>
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      
      <input type="hidden" value="${allSvo.seq}" id="seqche"/>
      <input type="hidden" value="${allSvo.page}" id="pageche"/>
      <input type="hidden" value="${allSvo.title}" id="titleche"/>
      <input type="hidden" value="${allSvo.user}" id="userche"/>
      <input type="hidden" value="${allSvo.status}" id="statusche"/>
      <input type="hidden" value="${allSvo.startDate}" id="startDateche"/>
      <input type="hidden" value="${allSvo.endDate}" id="endDateche"/>
      <input type="hidden" value="${allSvo.date}" id="dateche"/>

    </div>
  </div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 여기서부터 JS 추가 -->
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script>
<script src="/js/admin_post_Qna.js"></script>
</body>
</html>