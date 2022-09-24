<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_QnaUpdate.css" rel="stylesheet" />
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
				<div class="col-3 mb-2" style="padding-left: 0px;">${ask.ask_seq }
                  <input type="hidden" value="${ask.ask_seq }" id="ask_seq" />
                  <input type="hidden" value="${svo.seq }"  id="seq"/>
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
          <div class="row col-5"></div>
            <div class="row col-5">
              <button class="col-auto bg-white border-1 askdel">문의삭제</button>
              <button class="col-auto bg-white border-1 qnalist">목록</button>
            </div>
            <div class="row col-2"></div>
		</div>
          
		<!-- 문의 답변 작성란 -->
        <form class="p-0" action="/QnaUpdate.mdo" name="update" method="post" id="form" enctype="multipart/form-data">
          <div class="mb-0 mt-5 p-0 form1">
            <button type="button" id="all" class="select p-2" >답변 수정하기</button>
          </div>
      
          <div id="all_box" class="bg-white w-100 form1">
            <div class="row d-flex align-items-center mt-2" id="input_line_top">
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;margin-left: 1%;">번호</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">${askReply.ask_seq }
                <input type="hidden" id="ask_reply_seq" name="ask_seq" value="${askReply.ask_seq }" />
              </div>
              
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px;">작성자</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">${admin }
                <input type="hidden" id="ask_reply_writer" name="ask_reply_writer"/>
              </div>
              
              <div class="row"></div>
              <div class="col-1 mb-2 qnaDetail_font" style="padding-right: 0px; margin-left: 1%;">등록일자</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">
                <fmt:formatDate value="${askReply.ask_reply_date }" pattern="yyyy-MM-dd"/>
              </div>
              
              <div class="col-1 qnaDetail_font mb-2" style="padding-right: 0px;">파일첨부</div>
              <div class="col-3 mb-2" style="padding-left: 0px;">${askReply.ask_reply_file }
                <input type="file" name="ask_reply_uploadFile" value="${askReply.ask_reply_file }" id="ask_reply_file">
              </div>
            </div>
          </div>
      
          <div id="all_box" class="bg-white w-100 form1">
            <div class="row d-flex align-items-center" id="input_line_top">
              <div class="row"></div>
              <div class="summernote">${askReply.ask_reply_content }</div>
              <input type="hidden" id="content1" name="ask_reply_content"/>
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
              <button class="col-auto bg-white border-1 answerupdate" type="button">등록</button>
              <button class="col-auto bg-white border-1 qnalist">목록</button>
            </div>
            <div class="col-3"></div>
          </div>
          
    
        </form>
	</div>

<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/js/admin_post_QnaUpdate.js"></script>
</body>
</html>