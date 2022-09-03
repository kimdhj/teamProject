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

    <link
      href="/css/datepicker.min.css"
      rel="stylesheet"
      type="text/css"
      media="all"
      defer
    />
    <link href="/css/my_CancelEtc.css" rel="stylesheet" />
    <link href="/css/admin_marketing_EventInsert.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	 <div class="row d-flex w-100" id="main_wrapper">
      <div class="col-12" id="icon_content">
        <div class="row d-flex">
          <div class="col-1"></div>
          <div class="col">
            <!-- 이 안에 내용 -->
            <div id="bigbig_title" class="bg-light align-left">
              이벤트 추가
            </div>
            <form action="updateEvent.mdo" method="POST" id="upload" name="upload"  enctype="multipart/form-data">
              <table class="table">
                <thead></thead>
                <tbody>
                  <tr>
                    <th scope="row" class="bg-light align-middle text-center">제목</th>
                    <td colspan="3">
                      <div class="form-floating mb-3">
                        <input
                          type="text"
                          class="form-control"
                          id="event_title"
                          name="event_title"
                          placeholder="제목을 입력하세요"
                          value="${event_event.event_title }"
                        />
                        <label for="floatingInput">제목을 입력하세요</label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">대상</th>
                    <td>
                      <input type="text" id="event_target" name="event_target"  value="${event_event.event_target }"/>
                    </td>
                    <th class="bg-light text-center">기간</th>
                    <td>
                      <div class="row d-flex">
                        <div class="col row" id="day_select">
                          <div id="day_calendar" class="col">
                            <input
                              class="col-5"
                              placeholder="시작날짜"
                              type="date"
                              id="event_start_date"
                              name="event_start_date"
                            />~<input
                              class="col-5"
                              placeholder="마지막 날짜"
                              type="date"
                              id="event_end_date"
                              name="event_end_date"
                            />
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light align-middle text-center">간략 내용</th>
                    <td colspan="3">
                      <div class="form-floating">
                        <textarea
                          class="form-control"
                          placeholder="Leave a comment here"
                          id="event_content"
                          name="event_content"
                          style="height: 100px"
                        >${event_event.event_content }</textarea>
                        <label for="floatingTextarea2">내용을 입력하세요</label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">썸네일</th>
                    <td colspan="2">
                      <input
                        type="file"
                        accept="image/*,.txt"
                        name="uploadThumbnail"
                        id="uploadThumbnail"
                      />
                    </td>
                    <td>
                      <input type="button" class="bg-light" id="delFile5" value="삭제" />
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">내용 첨부1</th>
                    <td colspan="2">
                      <input
                        type="file"
                        accept="image/*,.txt"
                        name="uploadFile1"
                        id="uploadFile1"
                      />
                    </td>
                    <td>
                      <input type="button" class="bg-light" id="delFile1" value="삭제" />
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">내용 첨부2</th>
                    <td colspan="2">
                      <input
                        type="file"
                        accept="image/*,.txt"
                        name="uploadFile2"
                        id="uploadFile2"
                      />
                    </td>
                    <td>
                      <input type="button" class="bg-light" id="delFile2" value="삭제" />
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">내용 첨부3</th>
                    <td colspan="2">
                      <input
                        type="file"
                        accept="image/*,.txt"
                        name="uploadFile3"
                        id="uploadFile3"
                      />
                    </td>
                    <td>
                      <input type="button" class="bg-light" id="delFile3" value="삭제" />
                    </td>
                  </tr>
                  <tr>
                    <th class="bg-light text-center">내용 첨부4</th>
                    <td colspan="2">
                      <input
                        type="file"
                        accept="image/*,.txt"
                       name="uploadFile4"
                       id="uploadFile4"
                      />
                    </td>
                    <td>
                      <input type="button" class="bg-light" id="delFile4" value="삭제" />
                    </td>
                  </tr>
                  <tr>
					<td>상단노출</td>
					<td>
					<c:choose>
					<c:when test="${event_event.event_top_event eq true }">
					<input type="checkbox" name="event_top_event"  id="event_top_event"/>
					</c:when>
					<c:when test="${event_event.event_top_event eq false }">
					<input type="checkbox" name="event_top_event"  id="event_top_event" disabled="disabled" />
					</c:when>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td>항시적용</td>
					<td><input type="checkbox" name="event_allday" id="event_allday" /></td>
				</tr>
                </tbody>
              </table>
              <!-- 문의글 끝 -->

              <div class="container row d-flex">
                  <div class="col-8"></div>
                  <div class="col-2">
                    <button type="submit" class="btn btn-primary" onclick="event_writeCheck();">
                      이벤트 수정
                    </button>
                  </div>
                  <div class="col-2">
                  	<a href="/getEventList.mdo">
                    	<button type="button" class="btn btn-light">취소</button>
                    </a>
                  </div>
              </div>
              <input type="hidden" id="event_seq" name="event_seq" value="${event_event.event_seq }" />
            </form>
            <!-- 이 안에 내용 끝 100%xauto-->
          </div>
          <div class="col-1"></div>
        </div>
      </div>
    </div>
    <!-- JavaScript Libraries -->


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/datepicker.js"></script>
	<script src="/js/datepicker.ko.js"></script>
    <script src="/js/admin_marketing_EventInsert.js"></script>
</body>
</html>