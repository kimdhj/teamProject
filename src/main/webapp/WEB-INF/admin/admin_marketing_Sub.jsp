<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_Sub.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div class="row d-flex w-100" id="main_wrapper">
      <div class="col-1" id="side_bar"></div>
      <div class="col" id="sub_content">
        <!-- 내용 시작 -->
        <div id="main_name">구독 가격</div>
        <div><br /></div>
        <div class="border-2 border-top border-dark"><br /></div>
        <div class="row d-flex">
          <div class="col-3">
            <input type="text" id="sub_Price" value="30000" />
          </div>
          <div class="col-1">원</div>
          <div class="col"></div>
        </div>
        <div><br /><br /><br /></div>
        <div id="main_name">구독 안내 1</div>
        <div><br /></div>
        <div class="border-2 border-top border-dark"><br /></div>
        <div>
          <textarea id="sub_Guide1" value="가져와야하지"></textarea>
        </div>
        <div><br /><br /><br /></div>
        <div id="main_name">구독 안내 2</div>
        <div><br /></div>
        <div class="border-2 border-top border-dark"><br /></div>
        <div>
          <textarea id="sub_Guide2" value="가져와야한다"></textarea>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-8"></div>
            <div class="col-2">
              <button type="submit" class="btn btn-primary">수정</button>
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-light">취소</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-1"></div>
    </div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
    <script src="/js/admin_marketing_Icon.js"></script>
</body>
</html>