<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_realchat_admin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	  <div class="chat_wrap col m-0 p-0">
      <div id="title" class="header col-12 m-0 p-0">
        CHAT
      </div>
      <div class="chat">
        <div id="contents" class="contents">
          <!-- 동적 생성 -->
          <div class="chat row  m-0">
            <div class="row">
              <div class="send row col-auto">qq</div>
            </div>
            <div class="row">
              <div class="content row col-auto">qwe</div>
            </div>
          </div>
          <div class="chat row  m-0">
            <div class="row justify-content-end">
              <div class="send row col-auto">qq</div>
            </div>
            <div class="row justify-content-end">
              <div class="content row col-auto">qwe</div>
            </div>
          </div>
        </div>
        <div class="input-div col-12">
          <textarea id="typing" placeholder="Press Enter for send message."></textarea>
        </div>


        <!-- format -->

    
      </div>


    </div>
<input type="hidden" id="userid" value="${userid}"/>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/admin_realChat_user.js"></script>

</body>
</html>