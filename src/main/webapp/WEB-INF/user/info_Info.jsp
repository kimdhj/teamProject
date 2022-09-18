<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/info_Info.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
</head>
<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
<div class="row">
	<div class="col-2"></div>
	<div class="col-8">
		<!-- 이미지 : 클릭하면 메인 혹은 소개 페이지로 이동하도록 넣어봤슈... -->
		<div class="row">
			<div id="img">
				<a href="#" onclick="location.reload();"><img src="/img/info_info2.png" style="display: block;" width="100%;" /></a>
			</div>
		</div>

		<!-- 낭만서점 소개 -->
		<div class="row">
			<h3 id="info_name" style="margin-bottom: 0px;">낭만서점</h3>
		</div>
		<div class="row">
			<div class="col">
				<div class="col info_hr"></div>
			</div>
		</div>
		<div class="row">
			<p>
                 삭막한 서울 도심 속, 험난한 나날에 치이며 살아도<br>
                 우리는 꿋꿋하게 낭만을 가슴 속에 간직하는 것이 짧은 인생을 풍요로이 할 것이라 믿는
                  <b><a href="/booklist.do">낭만서점</a></b> 으로 놀러오세요 😊 <br>
                 따뜻한 낭만서점이 당신의 감정과 감성을 치유해드립니다. 🤗
			</p>
		</div>
		<div class="row">
			<div class="col">
				<div class="col info_hr mt-1"></div>
			</div>
			<div id="info_description2" data-aos="fade-down" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<div class="row">
					<div class="col-12" id="info_description3">낭만 서점에서만 느낄 수 있는
						특별한 세 가지 경험</div>
					<div class="col-12">
						<div class="col info_hr"></div>
					</div>
					<div class="row">
						<div class="col-4">
							<a href="#"><img src="/img/info_subscribe.png" width="100%;" /></a>
						</div>
						<div class="col-4">
							<a href="#"><img src="/img/info_author.png" width="100%;" /></a>
						</div>
						<div class="col-4">
							<a href="#"><img src="/img/info_shop.png" width="100%;" /></a>
						</div>
					</div>
					<div class="row">
						<div class="col" id="info_sub1">
							월 30,000원으로 책을 즐겨보세요.<br>
                          <a href="event_Sub.do">구독</a>하러 가기
						</div>
						<div class="col" id="info_sub2">
                            관심 작가들의 작품을 한번에 즐겨보세요.<br>
                        </div>
						<div class="col" id="info_sub3">
                           낭만적인 오프라인 매장으로 놀러오세요.
                        </div>
					</div>
					<div class="col-12 info_hr mt-4"></div>
				</div>
			</div>
		</div>

		<!-- 지도 API -->
		<div data-aos="fade-down" data-aos-easing="ease-out-cubic" data-aos-duration="2000">
		<div class="row">
			<div class="col-12" id="info_location">오시는 길</div>
		</div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8" id="map">
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
		</div>
		</div>
	</div>
	<div class="col-2"></div>
</div>
<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=851667534908448237cc0539bd8004d6"></script>
<script src="/js/info_Info.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
AOS.init();
</script>
</body>
</html>