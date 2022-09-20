<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/notice_CsDetail.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>

<div class="row" id="inner_box">
  <div class="col-3"></div>

  <div class="col">
    <div class="row d-flex align-items-end fs-2" id="main_title">
      문의 내용
    </div>
    <div class="row mt-2 " id="table_titleLine">
      <div class="col-1 bg-gray border-2 border-top border-dark m-0 p-2 text-center align-items-center title">번호</div>
      <div class="col-3 d-flex align-items-center border-2 border-top border-dark">${svo.seq }</div>

      <div class="col-1 bg-gray border-2 border-top border-dark m-0 p-2 text-center align-items-center title">파일</div>
      <div class="col d-flex align-items-center border-2 border-top border-dark">
        ${ask.ask_file }
      </div>
    </div>
    
    <div class="row" id="table">
      <div class="col-1 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">제목</div>
      <div class="col-3 d-flex align-items-center border-2 border-top border-gray border-bottom">${ask.ask_title }</div>
      
      <div class="col-1 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">작성자</div>
      <div class="col-3 d-flex align-items-center border-2 border-top border-gray border-bottom">${ask.user_id}</div>
      
      <div class="col-2 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">등록일자</div>
      <div class="col-2 d-flex align-items-center border-2 border-top border-gray border-bottom">
        <fmt:formatDate value="${ask.ask_date }" pattern="yyyy-MM-dd" />
      </div>
    </div>
    
    <div class="row" id="content">
      <c:if test="${not empty ask.ask_file }">
        <img src="${ask.ask_file }" id="img" />
      </c:if>
      ${ask.ask_content }
    </div>
    
    <div class="row d-flex justify-content-end bg-gray mb-5" id="endPoint">
    <c:if test="${ask.ask_status ne '답변 완료' }">
      <i class="bi bi-caret-up-fill col-auto">맨 위로</i> 
    </c:if>
    <c:if test="${ask.ask_status eq '답변 완료' }">
      &nbsp;
    </c:if>
    </div>
    
    <!-- 답변 완료 -->
    <c:if test="${ask.ask_status eq '답변 완료' }">
    <div class="col" style="margin-top: 10%;">
        <div class="row d-flex align-items-end fs-2" id="main_title">
          문의 답변
        </div>
        <div class="row mt-2 " id="table_titleLine">
          <div class="col-1 bg-gray border-2 border-top border-dark m-0 p-2 text-center align-items-center title">번호</div>
          <div class="col-3 d-flex align-items-center border-2 border-top border-dark">${svo.seq }</div>
    
          <div class="col-1 bg-gray border-2 border-top border-dark m-0 p-2 text-center align-items-center title">파일</div>
          <div class="col d-flex align-items-center border-2 border-top border-dark">
            ${askReply.ask_reply_file }
          </div>
        </div>
        
        <div class="row" id="table">
          <div class="col-1 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">제목</div>
          <div class="col-3 d-flex align-items-center border-2 border-top border-gray border-bottom">[답변]${ask.ask_title }</div>
          
          <div class="col-1 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">작성자</div>
          <div class="col-3 d-flex align-items-center border-2 border-top border-gray border-bottom">${askReply.ask_reply_writer}</div>
          
          <div class="col-2 bg-gray border-2 border-top m-0 border-gray border-bottom text-center align-items-center title">등록일자</div>
          <div class="col-2 d-flex align-items-center border-2 border-top border-gray border-bottom">
            <fmt:formatDate value="${askReply.ask_reply_date }" pattern="yyyy-MM-dd" />
          </div>
        </div>
        
        
        <div class="row" id="content">
            <c:if test="${not empty askReply.ask_reply_file }">
              <img src="${askReply.ask_reply_file }" id="img"/>
            </c:if>
              ${askReply.ask_reply_content }
            </div>
        
        <div class="row d-flex justify-content-end bg-gray" id="endPoint1">
             <i class="bi bi-caret-up-fill col-auto">맨 위로</i>
        </div>
    </div>
    </c:if>
    
    <div class="row d-flex justify-content-between mt-2 mb-5" id="buttons">
      <div class="col-5"></div>
        <button class="col-1 bg-white border-1 mt-2" type="button" onclick="location.href='/cs.do'">목록</button>
      <div class="col-5"></div>
    </div>
    
  </div>
  
  <div class="col-2"></div>
</div>

<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
<script src="/js/notice_CsDetail.js"></script>
</body>
</html>