<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_realchat_admin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	  <div class="chat_wrap col m-0 p-0">
      <div class="header col-12 m-0 p-0">
        CHAT
      </div>
      <div class="chat">
        <div class="contents">
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
          <textarea placeholder="Press Enter for send message."></textarea>
        </div>


        <!-- format -->

        <div class="chat format">
          <ul>
            <li>
              <div class="sender">
                <span></span>
              </div>
              <div class="message">
                <span></span>
              </div>
            </li>
          </ul>
        </div>
      </div>


    </div>


	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>