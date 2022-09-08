<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="com.romance.admin.icon.IconVO" %>
<%@ page import="com.romance.admin.icon.BannerVO" %> --%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_Icon.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div class="row d-flex w-100" id="main_wrapper">
      <div class="col" id="icon_content">
      <form action="updateIcon.mdo" method="POST" id="uploadIcon" name="uploadIcon"  enctype="multipart/form-data">
        <div class="row d-flex">
          <div class="col-1"></div>
          <div class="col">
            <!-- 이 안에 내용 -->
            <div id="icon_name_frame">아이콘</div>
            <div class="border-2 border-top border-dark"><br /></div>
            <div class="row d-flex">
              <div class="col-3" id="icon_thumbnail">
                <img
                  width="139"
                  height="56"
                  id="icon_show"
                  src="${icon.icon_file}"
                />
              </div>
              <div class="col-2" id="icon_size">139x56&nbsp;&nbsp;</div>
	          <div class="col-2 d-flex"><input type="text" class="text-center" id="icon_name" name="icon_name" value="${icon.icon_name }"></div>
              <div class="col" id="icon_file_frame">
                <input
                  type="file"
                  id="iconFile"
                  name="iconFile"
                  accept="/image/*"
                  onchange="setThumbnail(event);"
                />
              </div>
            </div>
            <div class="border-2 border-bottom border-dark"><br /></div>
            <div><br /></div>
            <div id="banner_thumbnail_one">
              <img width="" />
            </div>
            <div id="icon_name_frame">배너</div>
            <div class="border-2 border-top border-dark"><br /></div>
            <!-- 배너 -->
            <div id="bannerFor">
            	<c:forEach var="ban" items="${bannerList }" >
            		<div id="can_del">
            			<div id="banner_thumbnail"><img width="100%" height="20%" id="banner_show1" src="${ban.banner_file }"/></div>
            			<div class="row d-flex">
            				<div class="col"><input type="file" id="bannerFile" name="bannerFile" accept="/image/*" onchange="setBannerThumbnail(event);"/></div>
            				<div class="col align-self-center" id="banner_name_wrap"><div class="d-flex justify-content-end">배너 이름 : </div></div>
            				<div class="col align-self-center"><input type="text" id="banner_name" name="banner_name" value="${ban.banner_name }"></div>
							<div class="col-2"><button type="button" class="btn btn-light" onclick="minus_banner(this);">배너 삭제</button></div>           
            			</div>
            			<div><br /></div>
            		</div>
            		</c:forEach>
            </div>
            <!-- 배너 -->
            <div class="container">
          <div class="row">
            <div class="col-8"></div>
            <div class="col-2">
            <button type="button" class="btn btn-primary" onclick="plus_banner();">
                      배너 추가
                    </button>
            </div>
            <div class="col-2">
              <button type="submit" class="btn btn-primary">수정</button>
            </div>
          </div>
        </div>
            <!-- 이 안에 내용 끝 100%xauto-->
          </div>
          <div class="col-1"></div>
        </div>
        </form>
      </div>
    </div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
<script src="/js/admin_marketing_Icon.js"></script>
</body>
</html>