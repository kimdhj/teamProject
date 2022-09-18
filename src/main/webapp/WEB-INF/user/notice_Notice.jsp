<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/notice_Notice.css" rel="stylesheet">
</head>	
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
<div class="row">
	<div class="col-2"></div>
	<div class="col-8">
		<!-- 공지사항 -->
			<div id="notice_name">공지사항</div>

			<!-- 공지사항 게시글 -->
			<div id="all_box">
				<div class="table" id="table_table">
					<div class="row" id="table_height">
						<div class="col-2">번호</div>
						<div class="col-3">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-3">등록일자</div>
						<div class="col-2">조회수</div>
					</div>
                    <c:forEach items="${list }" var="notice" begin="0" end="9">
    					<div class="row" id="table_content">
    						<div class="col-2" id="seq">${allCount }
                              <input type="hidden" value="${notice.notice_seq }"/>
                            </div>
    						<div class="col-3" id="title">
                              <a href="/noticeDetail.do?notice_seq=${notice.notice_seq}&seq=${allCount}">
                              <c:choose>
                                <c:when test="${fn:length(notice.notice_title) gt 7 }">
                                  <c:out value="${fn:substring(notice.notice_title, 0, 6) }..."></c:out>
                                </c:when>
                                <c:otherwise>
                                <c:out value="${notice.notice_title }"/>
                                </c:otherwise>
                              </c:choose>
                              </a>
                              <c:set var="allCount" value="${allCount - 1}"/>
                            </div>
    						<div class="col-2">${notice.notice_writer }</div>
    						<div class="col-3">
                              <fmt:formatDate value="${notice.notice_date }" pattern="yyyy-MM-dd"/>
                            </div>
    						<div class="col-2">${notice.notice_cnt }
                              <input type="hidden" value="${notice.notice_cnt }" name="notice_cnt"/>
                            </div>
    					</div>
                    </c:forEach>
				</div>
        
        
            <div id="page" class="row justify-content-center d-flex mb-5">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            <c:if test="${allPage ne 1}">
              <li class="page-item">
              <a class="page-link"><
              </a></li>
            </c:if>
            <c:forEach var="i" begin="${startpage }" end="${endpage}">
              <c:if test="${allPage ne i}">
                <li class="page-item"><a class="page-link" href="#">${i}
                </a></li>
              </c:if>

              <c:if test="${allPage eq i}">
                <li class="page-item active" aria-current="page"><a href="/notice.do?page=${i}" class="page-link">${i}</a></li>
              </c:if>
            </c:forEach>
             
            <c:if test="${allPage lt allCount/10}">
            <li class="page-item"><a class="page-link" href="#">></a></li>
            </c:if>
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      
			<input type="hidden" value="${allSvo.page}" id="pageche"/>
			</div>
		</div>
    
	</div>


<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
<script src="/js/notice.js"></script>
</body>
</html>