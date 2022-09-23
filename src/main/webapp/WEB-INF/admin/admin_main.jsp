<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"
	integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 메인 여기부터 작성 -->

	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-3">
				<article class="stat-cards-item">
					<div class="stat-cards-icon primary">
						<i data-feather="bar-chart-2" aria-hidden="true"></i>
					</div>
					<div class="stat-cards-info">
						<p class="stat-cards-info__num">1478 286</p>
						<p class="stat-cards-info__title">Total visits</p>
						<p class="stat-cards-info__progress">
							<span class="stat-cards-info__profit success"> <i
								data-feather="trending-up" aria-hidden="true"></i>4.07%
							</span> Last month
						</p>
					</div>
				</article>
			</div>
			<div class="col-md-3">
				<article class="stat-cards-item">
					<div class="stat-cards-icon warning">
						<i data-feather="file" aria-hidden="true"></i>
					</div>
					<div class="stat-cards-info">
						<p class="stat-cards-info__num">1478 286</p>
						<p class="stat-cards-info__title">Total visits</p>
						<p class="stat-cards-info__progress">
							<span class="stat-cards-info__profit success"> <i
								data-feather="trending-up" aria-hidden="true"></i>0.24%
							</span> Last month
						</p>
					</div>
				</article>
			</div>
			<div class="col-md-3">
				<article class="stat-cards-item">
					<div class="stat-cards-icon purple">
						<i data-feather="file" aria-hidden="true"></i>
					</div>
					<div class="stat-cards-info">
						<p class="stat-cards-info__num">1478 286</p>
						<p class="stat-cards-info__title">Total visits</p>
						<p class="stat-cards-info__progress">
							<span class="stat-cards-info__profit danger"> <i
								data-feather="trending-down" aria-hidden="true"></i>1.64%
							</span> Last month
						</p>
					</div>
				</article>
			</div>
			<div class="col-md-3">
				<article class="stat-cards-item">
					<div class="stat-cards-icon success">
						<i data-feather="feather" aria-hidden="true"></i>
					</div>
					<div class="stat-cards-info">
						<p class="stat-cards-info__num">1478 286</p>
						<p class="stat-cards-info__title">Total visits</p>
						<p class="stat-cards-info__progress">
							<span class="stat-cards-info__profit warning"> <i
								data-feather="trending-up" aria-hidden="true"></i>0.00%
							</span> Last month
						</p>
					</div>
				</article>
			</div>
		</div>
		
		<!-- 차트시작 -->
		<div class="d-flex flex-row">
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">header</div>
					<div class="card-body">
						<canvas id="myChartOne"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						<canvas id="myChartTwo"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						<canvas id="myChartThree"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						<canvas id="myChartFour"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row">
			<div id="donught" class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						
					</div>
					<div class="card-footer">footer</div>
				</div>
			</div>
			<div class="col-md-6">
				<div id="donught2" class="card border-light">
					<div class="card-header">일반회원 ${getSubRatio.normal_cnt}명</div>
					<div class="card-body">
						
					</div>
					<div class="card-footer">구독자 ${getSubRatio.sub_cnt}명</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- 차트 끝 -->


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- js 추가 -->
	<!-- 차트js 시작 -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="/js/admin_main.js"></script>
	<script>
		
	</script>
	<!-- 차트 js 끝 -->
</body>

</html>