<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Review.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">리뷰</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-2"></div>
				<div class="col-10" id="day_select">
					<div id="day_calendar" class="col-5" style="margin-top: 1%;">
						<input class="col-3" placeholder="시작날짜" type="text"
							id="start_date"
							style="height: 40px; margin-top: 3%; text-align: center;" />
						<div class="review_font">~</div>
						<input class="col-3" placeholder="마지막 날짜" type="text"
							id="end_date"
							style="height: 40px; margin-top: 3%; text-align: center;" />
						<div id="day_btn" class="col-7">
							<div id="dayAdd" class="btn-group me-2" role="group"
								aria-label="Second group" style="margin-top: 3%;">
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
							style="margin-left: 1%;">
							<option class="fs-5" value="전체">전체</option>
							<option class="fs-5" value="ID">ID</option>
							<option class="fs-5" value="이름">이름</option>
							<option class="fs-5" value="생년월일">생년월일</option>
							<option class="fs-5" value="책제목">책제목</option>
							<option class="fs-5" value="내용">내용</option>
							<option class="fs-5" value="회원등급">회원등급</option>
							<option class="fs-5" value="블라인드">블라인드 댓글</option>
						</select>
					</div>
				</div>
				<div class="col-4  me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" id="search" type="text" placeholder="검색할 내용 입력">
					</div>
				</div>
				<div class="col-auto" style="margin-bottom: 10px;">
					<div class="input-group p-0 mt-2  col">
						<button id="search_btn" class="btn bg-blue text-white rounded-pill col">검색</button>
					</div>
				</div>
        
				<div class="row d-flex m-1" id="table_box">
					<table class="table " id="table">
						<thead>
							<tr>
								<th><input class="form-check-input border-1 border-dark allche" type="checkbox" value="" id="flexCheckChecked" checked></th>
								<th>번호</th>
								<th>ID</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>책 제목</th>
								<th>내용</th>
								<th>등록일자</th>
								<th>등급</th>
								<th><button class="btn btn-warning rounded-pill allblind allBlind">블라인드</button></th>
								<th><button class="btn btn-warning rounded-pill seldel">선택삭제</button></th>
							</tr>
						</thead>
                         
                        <c:set var="allCount" value="1"/>
						<tbody>
                          <c:forEach items="${replyList }" var="reply" begin="0" end="4">
							<tr>
								<td><input class="form-check-input border-1 border-dark delche chkbox" name="chkbox" type="checkbox" id="flexCheckChecked" checked></td>
								<td>
									<p id="seq">${allCount }</p>
                                    <input type="hidden" value="${reply.reply_seq }" name="reply_seq"/>
                                    <c:set var="allCount" value="${allCount + 1 }"/>
								</td>
								<td>
									<p class="rowColumn" id="id">${reply.user_id }</p>
                                    <input type="hidden" value="${reply.user_id }" name="user_id"/>
								</td>
								<td>
									<p class="selectColumn" id="name">${reply.user_name }</p>
                                    <input type="hidden" value="${reply.user_name }" name="user_name"/>
								</td>
								<td>
									<p class="rowColumn" id="birth">${reply.user_birth}</p>
                                      <input type="hidden" value="${reply.user_birth}" name="user_birth"/>
								</td>
								<td>
                                  <p class="rowColumn" id="title">
                                  <c:choose>
                                    <c:when test="${fn:length(reply.book_title) gt 7 }">
                                      <c:out value="${fn:substring(reply.book_title, 0, 6) }..."></c:out>
                                    </c:when>
                                    <c:otherwise>
                                    <c:out value="${reply.book_title }"/>
                                    </c:otherwise>
                                  </c:choose>
                                      </p>
                                    <input type="hidden" value="${reply.book_title}" name="book_title"/>
								</td>
                
								<td>
  									<p id="content">
                                     <div class="qjawnsno oneqjawns">
                                      ${reply.reply_cotent }
                                    </div>
                                    </p>
                                    
                                    <div class="hide" id="recontent">
                                      ${reply.reply_cotent}
                                    </div>
								</td>
                
								<td>
									<p class="rowColumn" >
                                      <fmt:formatDate value="${reply.reply_date }" pattern="yyyy-MM-dd"/>
                                    </p>
                                    <input type="hidden" value="${reply.reply_date }" name="reply_date"/>
								</td>
								<td>
                                    <c:if test="${reply.user_sub eq '0'}" >
							     		<p class="rowColumn" id="sub">일반</p>
                                    </c:if>
                                    <c:if test="${reply.user_sub eq '1'}" >
							     		<p class="rowColumn" id="sub">구독</p>
                                    </c:if>
                                    <input type="hidden" value="${reply.user_sub }" name="user_sub"/>
								</td>
								<td>
                                    <c:if test="${reply.user_blank eq false }">
									 <button class="btn btn-danger rounded-pill blind">처리</button>
                                    </c:if>
                                    
                                    <c:if test="${reply.user_blank eq true }">
									 <button class="btn btn-outline-danger rounded-pill blindCancel">처리 완료</button>
                                    </c:if>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
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
                <li class="page-item"><a class="page-link">< </a></li>
              </c:if>
              <c:forEach var="i" begin="${startpage }" end="${endpage}">
                <c:if test="${allPage ne i}">
                  <li class="page-item"><a class="page-link" href="#">${i} </a></li>
                </c:if>
                <c:if test="${allPage eq i}">
                  <li class="page-item active" aria-current="page">
                    <a href="/ReplyList.mdo?page=${i}&id=${allSvo.id }&name=${allSvo.name }&birth=${allSvo.birth }&title=${allSvo.title}&content=${allSvo.content}&publish=${allSvo.publish}&author=${allSvo.author }&sub=${allSvo.sub}&blank=${allSvo.blank }&seq=${allSvo.seq}" class="page-link">${i}</a>
                  </li>
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
          <input type="hidden" value="${allSvo.id}" id="idche"/>
          <input type="hidden" value="${allSvo.name}" id="nameche"/>
          <input type="hidden" value="${allSvo.birth}" id="birthche"/>
          <input type="hidden" value="${allSvo.title}" id="titleche"/>
          <input type="hidden" value="${allSvo.content}" id="contentche"/>
          <input type="hidden" value="${allSvo.publish}" id="publishche"/>
          <input type="hidden" value="${allSvo.sub}" id="subche"/>
          <input type="hidden" value="${allSvo.author}" id="authorche"/>
          <input type="hidden" value="${allSvo.blank}" id="blankche"/>
          <input type="hidden" value="${allSvo.startDate}" id="startDateche"/>
          <input type="hidden" value="${allSvo.endDate}" id="endDateche"/>
          <input type="hidden" value="${allSvo.date}" id="dateche"/>
        
      </div>
    
        <!-- 리뷰 내용 클릭하면 해당 리뷰 내용 보여주기 -->
          <div class="mb-0 mt-5 p-0 form1 hide replyBox fold">
            <button type="button" id="all" class="select p-2" >리뷰 상세보기</button>
          </div>
      
          <div id="all_box" class="bg-white w-100 form1 hide">
            <div class="row d-flex align-items-center mt-2" id="input_line_top">
              
              <input type="hidden" id="reply_seq" name="reply_seq" value="${reply_seq }"/>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">ID</div>
              <div class="col-1 mb-2" style="padding-left: 0px;" id="user_id"> </div>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">이름</div>
              <div class="col-1 mb-2" id="user_name" style="padding-left: 0px;"></div>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">생년월일</div>
              <div class="col-1 mb-2" id="user_birth" style="padding-left: 0px;"></div>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">등급</div>
              <div class="col-1 mb-2" id="user_sub"  style="padding-left: 0px;"></div>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">등록일자</div>
              <div class="col-1 mb-2" style="padding-left: 0px;" id="reply_date">
              </div>

              <div class="row"></div>
              
              <div class="col-1 mb-2" style="padding-right: 0px; font-weight: bolder">책 제목</div>
              <div class="col-8 mb-2" style="padding-left: 0px;" id="book_title"></div>
              
            </div>
          </div>
      
          <div id="all_box" class="bg-white w-100 hide form1 mb-3 replyBox fold">
            <div class="row d-flex align-items-center" id="input_line_top">
              <div class="row"></div>
              <div class="row" id="content1"></div>
            </div>
          </div>
      
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script>
<script src="/js/admin_post_Review.js"></script>
</body>
</html>