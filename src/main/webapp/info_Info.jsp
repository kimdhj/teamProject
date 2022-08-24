<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/info_Info.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
</head>
<jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
<div class="row">
	<div class="col-2"></div>
	<div class="col-8">
		<!-- 이미지 : 클릭하면 메인 혹은 소개 페이지로 이동하도록 넣어봤슈... -->
		<div class="row">
			<div id="img">
				<a href="info_Info.jsp"><img src="/img/info_info2.png"
					style="display: block;" width="100%;" /></a>
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
				낭만서점은 이 각박한 세상 속에서 지친 여러분들의 마음을 달래주는 공간입니다.<br> 따뜻한 낭만서점으로
				놀러오슈~<br> 바보멍청이<br>바보<br>알류<br>머라공<br>
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
						<div class="col-1"></div>
						<div class="col-3">
							<a href="#"><img src="/img/info_subscribe.png" width="100%;" /></a>
						</div>
						<div class="col-1"></div>
						<div class="col-3">
							<a href="#"><img src="/img/info_author.png" width="100%;" /></a>
						</div>
						<div class="col-1"></div>
						<div class="col-3">
							<a href="#"><img src="/img/info_shop.png" width="100%;" /></a>
						</div>
					</div>
					<div class="row">
						<div class="col" id="info_sub1">
							구독 월 999,000원에 모십니다.<br> 여러분이 원하는 책 다 있습니다.<br> 구독만 해
							^^ 돈 내놔<br>
						</div>
						<div class="col" id="info_sub2">관심 작가</div>
						<div class="col" id="info_sub3">오프라인 매장</div>
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
<jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=851667534908448237cc0539bd8004d6"></script>
<script src="/js/info_Info.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<script>
AOS.init();
</script>
</body>
</html>