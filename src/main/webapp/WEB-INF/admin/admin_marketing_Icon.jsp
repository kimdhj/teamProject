<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        <div class="row d-flex">
          <div class="col-1"></div>
          <div class="col">
            <!-- 이 안에 내용 -->
            <div id="icon_name">아이콘</div>
            <div class="border-2 border-top border-dark"><br /></div>
            <div class="row d-flex">
              <div class="col-3" id="icon_thumbnail">
                <img
                  width="139"
                  height="56"
                  id="icon_show"
                  src="/서점로고.ico"
                />
              </div>
              <div class="col-2" id="icon_size">139x56</div>
              <div class="col" id="icon_file">
                <input
                  type="file"
                  id="icon_image"
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
            <div id="icon_name">배너</div>
            <div class="border-2 border-top border-dark"><br /></div>
            <!-- 배너 -->
            <div id="banner_thumbnail1">
              <img
                width="100%"
                height="20%"
                id="banner_show1"
                src="/img/carousel-1.jpg"
              />
            </div>
            <div class="row d-flex" id="banner_file1">
              <input
                type="file"
                id="banner_image1"
                accept="/image/*"
                onchange="setBannerThumbnail(event);"
              />
            </div>
            <div><br /></div>
            <!-- 배너 -->
            <!-- 배너 -->
            <div id="banner_thumbnail2">
              <img
                width="100%"
                height="20%"
                id="banner_show2"
                src="/img/carousel-1.jpg"
              />
            </div>
            <div class="row d-flex" id="banner_file2">
              <input
                type="file"
                id="banner_image2"
                accept="/image/*"
                onchange="setBannerThumbnail2(event);"
              />
            </div>
            <div><br /></div>
            <!-- 배너 -->
            <!-- 배너 -->
            <div id="banner_thumbnail3">
              <img
                width="100%"
                height="20%"
                id="banner_show3"
                src="/img/carousel-1.jpg"
              />
            </div>
            <div class="row d-flex" id="banner_file3">
              <input
                type="file"
                id="banner_image3"
                accept="/image/*"
                onchange="setBannerThumbnail3(event);"
              />
            </div>
            <div><br /></div>
            <!-- 배너 -->
            <!-- 배너 -->
            <div id="banner_thumbnail4">
              <img
                width="100%"
                height="20%"
                id="banner_show4"
                src="/img/carousel-1.jpg"
              />
            </div>
            <div class="row d-flex" id="banner_file4">
              <input
                type="file"
                id="banner_image4"
                accept="/image/*"
                onchange="setBannerThumbnail4(event);"
              />
            </div>
            <div><br /></div>
            <!-- 배너 -->
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
            <!-- 이 안에 내용 끝 100%xauto-->
          </div>
          <div class="col-1"></div>
        </div>
      </div>
    </div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
<script src="/js/admin_marketing_Icon.js"></script>
</body>
</html>