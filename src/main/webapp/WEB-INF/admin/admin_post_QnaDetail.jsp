<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_QnaDetail.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">문의 상세보기</button>
		</div>
        
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center contentBox" id="input_line_top">
				<div class="col-1 mt-2 mb-2 qnaDetail_font">제목</div>
				<div class="col-3" style="padding-left: 0px;">${ask.ask_title }</div>
        
                <div class="col-1 mt-2 mb-2 qnaDetail_font">파일</div>
                <div class="col-3" style="padding-left: 0px;">${ask.ask_file }</div>
                
				<div class="row"></div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">${svo.seq }
                  <input type="hidden" value="${svo.seq }" id="seq"/>
                  <input type="hidden" value="${ask.ask_seq }" id="ask_seq" />
                </div>
                
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">${ask.user_id }</div>
				<div class="col-1 mb-2 qnaDetail_font"
					style="padding-right: 0px; margin-left: 5%;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;">
                  <fmt:formatDate value="${ask.ask_date }" pattern="yyyy-MM-dd"/>
                </div>
			</div>
		</div>
    
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row" id="content">
                  <c:if test="${not empty ask.ask_file}">
                    <img src="${ask.ask_file }" id="img"/>
                  </c:if>
                ${ask.ask_content }</div>
			</div>
		</div>
  
		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
        <c:if test="${ask.ask_status eq  '답변 대기'}">
			<div class="row col-4"></div>
			<div class="row col-4">
				<button class="col-auto bg-white border-1 answer">답변하기</button>
				<button class="col-auto bg-white border-1 userdel">문의삭제</button>
				<button class="col-auto bg-white border-1 qnalist">목록</button>
			</div>
			<div class="row col-4"></div>
        </c:if>
        
        <c:if test="${ask.ask_status eq  '답변 완료'}">
          <div class="row col-5"></div>
            <div class="row col-5">
              <button class="col-auto bg-white border-1 askdel">문의삭제</button>
              <button class="col-auto bg-white border-1 qnalist">목록</button>
            </div>
            <div class="row col-2"></div>
        </c:if>
		</div>
          
		<!-- 문의 답변 작성란 -->
        <!-- 답변 완료일 때 -->
        <c:if test="${ask.ask_status eq  '답변 완료'}">
		<div class="mb-0 mt-5 p-0 form1">
			<button type="button" id="all" class="select p-2 answerbtn" >문의 답변</button>
		</div>

		<div id="all_box" class="bg-white w-100 form1">
			<div class="row d-flex align-items-center mt-2" id="input_line_top">
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;" id="ask_reply_seq3">${askReply.ask_seq }
                  <input type="hidden" id="ask_reply_seq" value="${askReply.ask_seq }" />
                </div>
        
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">${admin }</div>
				<div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">등록일자</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">
                  <fmt:formatDate value="${askReply.ask_reply_date }" pattern="yyyy-MM-dd"/>
                </div>
				<div class="row"></div>
				<div class="col-1 qnaDetail_font mb-2" style="padding-right: 0px;">첨부 파일</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">
                    ${askReply.ask_reply_file }
				</div>
			</div>
		</div>

		<div id="all_box" class="bg-white w-100 form1">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row" id="content">
                  <c:if test="${not empty askReply.ask_reply_file}">
                    <img src="${askReply.ask_reply_file }" id="img"/>
                  </c:if>
                  ${askReply.ask_reply_content }
                </div>
			</div>
		</div>

		<div id="all_box" class="bg-white w-100 form1">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1" style="text-align: center; font-weight: bolder; font-size: 1vw;">비밀번호</div>
				<div class="col">
					<input type="password" id="password" name="ask_reply_password">
				</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2 form1" id="buttons">
			<div class="col-5"></div>
			<div class="row col-4">
				<button class="col-auto bg-white border-1 answerupdate" type="button" onclick="location.href='/QnaUpdate.mdo?ask_seq=${askReply.ask_seq}&seq=${svo.seq }'">수정</button>
				<button class="col-auto bg-white border-1 answerdel">삭제</button>
				<button class="col-auto bg-white border-1 qnalist">목록</button>
			</div>
			<div class="col-3"></div>
		</div>
    
        </c:if>
        
        <!-- 답변 대기 일 때 (답변 작성 구간) -->
        <form class="p-0" action="/qnaDetail.mdo" name="detail" method="post" id="form" enctype="multipart/form-data">
        <c:if test="${ask.ask_status eq  '답변 대기'}">
          <div class="mb-0 mt-5 p-0 form1 hide">
            <button type="button" id="all" class="select p-2 answerbtn" >답변 작성하기</button>
          </div>
      
          <div id="all_box" class="bg-white w-100 form1 hide">
            <div class="row d-flex align-items-center mt-2" id="input_line_top">
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;margin-left: 1%;">번호</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">${askReply.ask_seq }
                <input type="hidden" id="ask_reply_seq2" name="ask_seq" value="${askReply.ask_seq }" />
              </div>
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">
                <input type="text" id="ask_reply_writer" name="ask_reply_writer" value="${admin }" readonly />
              </div>
              <div class="row"></div>
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px; margin-left: 1%;">등록일자</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">
                <fmt:formatDate value="${askReply.ask_reply_date }" pattern="yyyy-MM-dd"/>
                <input type="hidden" name="ask_reply_date" value="${askReply.ask_reply_date}"/>
              </div>
              <div class="col-1 qnaDetail_font mb-2" style="padding-right: 0px;">파일첨부</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">
                <input type="file" name="ask_reply_uploadFile" id="ask_reply_file">
              </div>
            </div>
          </div>
      
          <div id="all_box" class="bg-white w-100 hide form1">
            <div class="row d-flex align-items-center" id="input_line_top">
              <div class="row"></div>
              <div class="summernote"></div>
              <input type="hidden" id="content1" name="ask_reply_content"/>
            </div>
          </div>
      
          <div id="all_box" class="bg-white w-100 hide form1">
            <div class="row d-flex align-items-center" id="input_line_top">
              <div class="col-1" style="text-align: center; font-weight: bolder; font-size: 1vw;">비밀번호</div>
              <div class="col">
                <input type="password" id="password" name="ask_reply_password">
              </div>
            </div>
          </div>
      
          <div class="row d-flex justify-content-between mt-2 mb-2 hide form1" id="buttons">
            <div class="col-5"></div>
            <div class="row col-4">
              <button class="col-auto bg-white border-1 answerinsert" type="button">등록</button>
              <button class="col-auto bg-white border-1 qnalist" type="button">목록</button>
            </div>
            <div class="col-3"></div>
          </div>
          
          <input type="hidden" value="${ask.ask_status }" id="status"/>
    
        </c:if>
        </form>
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/js/admin_post_QnaDetail.js"></script>
</body>
</html>