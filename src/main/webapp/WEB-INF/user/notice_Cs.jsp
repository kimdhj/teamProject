<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/notice_Cs.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
  <div class="row cs_top">
    <div class="col-2"></div>
    <div id="all_box" class="col-8">
      <!-- FAQ : 고정 -->
      <div>
      <div class="row">
        <div class="col-8" id="cs_name">FAQ</div>
      </div>
      <div class="row" id="cs_line">
        <div class="col-12 row" id="cs_faq">
          <div class="col">
            <img src="./img/cs_online-payment.png" width="50%"> <a href="#"
              id="img_payment">주문/결제</a>
          </div>
          <div class="col">
            <img src="./img/cs_delivery.png" width="50%"> <a href="#"
              id="img_delivery">배송/수령일 안내</a>
          </div>
          <div class="col">
            <img src="./img/cs_product-return.png" width="50%"> <a href="#"
              id="img_exchange">반품/교환/환불</a>
          </div>
          <div class="col">
            <img src="./img/cs_programmer.png" width="50%"> <a href="#"
              id="img_user">회원</a>
          </div>
        </div>
      </div>

      <!-- FAQ 내용 : 내용 변함 -->
      <!-- 주문/결제 -->
      <div id="form-select1" class="hide">
      <div class="col cs_input mt-3 mb-2" >
        <div style="font-weight: bold" id="faqname1"></div> &nbsp;&nbsp;
        <select aria-label="Default select example" id="level2">
          <!-- notice.Cj.js 에서의 con 값이 들어가는 부분 -->
        </select>
        </div>
        
        <div class="table" id="table_payment">
          <div class="row" id="table_payment_height">
            <div class="col-4">번호</div>
            <div class="col-8">제목</div>
          </div>
          
          <div id="FAAQ">
          <div class="row" id="table_payment_content">
            <div class="col-4" >${FAQ_seq }
            </div>
                        
            <div class="col-8 switch1">
              <a href="#" id="faqtitle">${FAQ_ask }</a>
            </div>
          </div>
          
          <div class="row hide faqalt" id="table_payment_content">
          <div class="content">
            <div class="col" id="faqanswer">
              <c:if test="${not empty FAQ_fileName}">
                <img src="${FAQ_fileName }" id="img"/>
              </c:if>
                ${FAQ_answer }
            </div>
          </div>
          </div>
          </div>
        
      </div>
      
      
      </div>
     </div>
        
        <!-- 페이징 -->
        <div id="page1" class="row justify-content-center d-flex">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      
      <input type="hidden" id="smallsortche"/>
      <input type="hidden" id="bigsortche">
      <input type="hidden" value="1" id="pageche">
      <input type="hidden" id="contentche" />
      <input type="hidden" id="seqche" />
      
      </div>


      <!-- QnA : 고정 -->
      <div class="row">
        <div class="col-2"></div>
      <div id="qna_box" class="col-8">
      <div class="row cs_qna form">
        <div class="col-2 m-0" id="cs_name2">QnA</div>
        <div class="col-2" id="option_dropdown" style="align-items: center; display: flex;">
          <select class="form-select form-select-sm" id="level3" aria-label=".form-select-sm example" style="height: 37px; margin-top: 2px;">
            <option value="" selected>전체</option>
            <option value="제목">제목</option>
            <option value="작성자">작성자</option>
          </select>
        </div>
        <div class="col-6" id="option_input" style="align-items: center; display: flex;">
          <div class="input-group">
            <input type="text" id="search" class="form-control" aria-describedby="basic-addon2">
            <button class="input-group-text search_btn" id="basic-addon2" type="button">조회</button>
          </div>
        </div>
        <div class="col m-0 align-items-center" style="align-items: center; display: flex;">
          <button class="input-group-text" id="basic-addon2" type="button" onclick="location.href='/myRequestWrite.do'">문의하기</button>
        </div>
      </div>
      <div class="table" id="table_table2">
        <div class="row" id="table_height2">
          <div class="col-2">번호</div>
          <div class="col-3">제목</div>
          <div class="col-2">작성자</div>
          <div class="col-3">등록일자</div>
          <div class="col-2">답변여부</div>
        </div>
        
        <c:set var="allCount" value="1"/>
        <c:set var="status" value="답변완료"/>
        <div class="row QNNA" id="table_content2">
         <c:forEach items="${askList }" var="ask" begin="0" end="4">
          
          <div class="col-2 mt-2 " id="seq">
            ${allCount }
          </div>
          
          <div class="col-3 mt-2 " id="title">
          
          <c:if test="${ask.ask_status eq  '답변 완료'}">
            <a href="/csDetail.do?ask_seq=${ask.ask_seq }&seq=${allCount}">
            	<c:choose>
                                    <c:when test="${fn:length(ask.ask_title) gt 15 }">
                                      <c:out value="${fn:substring(ask.ask_title, 0, 14) }..."></c:out>
                                    </c:when>
                                    <c:otherwise>
                                    <c:out value="${ask.ask_title }"/>
                                    </c:otherwise>
                </c:choose>
                
               <c:choose>
            <c:when test="${fn:length(ask.ask_title) gt 10 }">
              <c:out value="${fn:substring(ask.ask_title, 0, 9) }..."></c:out>
            </c:when>
            <c:otherwise>
            <c:out value="${ask.ask_title }"/>
            </c:otherwise>
          </c:choose>
            </a>
          </c:if>
          <c:if test="${ask.ask_status eq  '답변 대기'}">
            <a href="/csDetail.do?ask_seq=${ask.ask_seq }&seq=${allCount}">
                <c:choose>
                                    <c:when test="${fn:length(ask.ask_title) gt 15 }">
                                      <c:out value="${fn:substring(ask.ask_title, 0, 14) }..."></c:out>
                                    </c:when>
                                    <c:otherwise>
                                    <c:out value="${ask.ask_title }"/>
                                    </c:otherwise>
                </c:choose>
               <c:choose>
            <c:when test="${fn:length(ask.ask_title) gt 10 }">
              <c:out value="${fn:substring(ask.ask_title, 0, 9) }..."></c:out>
            </c:when>
            <c:otherwise>
            <c:out value="${ask.ask_title }"/>
            </c:otherwise>
          </c:choose>
            </a>
          </c:if>
          </div>
          <c:set var="allCount" value="${allCount + 1 }"/>
          
          <div class="col-2 mt-2 " id="user">${ask.user_id }</div>
          <div class="col-3 mt-2 ">
            <fmt:formatDate value="${ask.ask_date }" pattern="yyyy-MM-dd"/>
          </div>
          
          <div class="col-2 mt-2">
            <c:if test="${ask.ask_status eq  '답변 완료'}">
              <b>답변 완료</b>
            </c:if>
            <c:if test="${ask.ask_status ne  '답변 완료'}">
              답변 대기
            </c:if>
          </div>
        </c:forEach>
        </div>
        
      </div>
    
    <!-- QNA 페이징 -->
    <div id="page" class="row justify-content-center d-flex mt-4 mb-5">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            <c:if test="${allPage ne 1}">
              <li class="page-item"><a class="page-link"><</a></li>
            </c:if>
            <c:forEach var="i" begin="${startpage }" end="${endpage}">
              <c:if test="${allPage ne i}">
                <li class="page-item"><a class="page-link">${i}
                </a></li>
              </c:if>

              <c:if test="${allPage eq i}">
                <li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>
              </c:if>
            </c:forEach>
             
            <c:if test="${allPage lt endpage}">
            <li class="page-item"><a class="page-link">></a></li>
            </c:if>
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      
      <input type="hidden" value="${allSvo.seq }" id="qnaseq"/>
      <input type="hidden" value="${allSvo.page }" id="qnapage"/>
      <input type="hidden" value="${allSvo.title }" id="qnatitle"/>
      <input type="hidden" value="${allSvo.user }" id="qnauser"/>
      
    </div>
      </div>

    
    </div>

<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
<script src="/js/notice_Cs.js"></script>
</body>
</html>