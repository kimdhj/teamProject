<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"
	integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 메인 여기부터 작성 -->

	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-6 col-xl-3">
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
			<div class="col-md-6 col-xl-3">
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
			<div class="col-md-6 col-xl-3">
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
			<div class="col-md-6 col-xl-3">
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
					<div class="card-header">Header</div>
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
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						
					</div>
					<div class="card-footer">footer</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body">
						
					</div>
					<div class="card-footer">footer</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- 차트 끝 -->


	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- js 추가 -->
	<!-- 차트js 시작 -->

	<script>
		let myChartOne = document.getElementById('myChartOne').getContext('2d');
		let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
		let myChartThree = document.getElementById('myChartThree').getContext('2d');
		let myChartFour = document.getElementById('myChartFour').getContext('2d');

		let barChart = new Chart(myChartOne, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '학원', '연구원', '출판사', '미디어사', '위니브' ],
				datasets : [ {
					label : '테스트',
					data : [ 10, 100, 100, 200, 1000 ]

				} ]
			}
		})

		let barChartTwo = new Chart(myChartTwo, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '1월', '3월', '6월', '9월', '12월' ],
				datasets : [ {
					label : '기간별 매출액',
					data : [ 2000, 1000, 1000, 2000, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow',
							'purple' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			}
		})

		let barChartThree = new Chart(myChartThree, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '1월', '3월', '6월', '9월', '12월' ],
				datasets : [ {
					label : '구독자 현황',
					data : [ 200, 100, 100, 200, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow',
							'purple' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			},
			options : {
				plugins : {
					title : {
						display : true,
						text : '바올랩 매출',
						fontSize : 30,
						fontColor : 'red'
					},
					legend : {
						display : true,
						position : 'top'
					},
					tooltip : {
						enabled : true
					}

				},
				layout : {
					padding : {
						left : 80,
						right : 80,
						top : 20,
						bottom : 0
					}
				}

			}
		})

		let barChartFour = new Chart(myChartFour, {
			type : 'doughnut', //pie, line, doughnut, polarArea
			data : {
				labels : [ '10대', '20대', '30대', '40대', '50대이상' ],
				datasets : [ {
					label : '도서 구매량',
					data : [ 230, 110, 90, 300, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow', 'brown' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			},
			options : {
				plugins : {
					title : {
						display : false,
						text : '바올랩 매출',
						fontSize : 30,
						fontColor : 'red'
					},
					legend : {
						display : true,
						position : 'right'
					},
					tooltip : {
						enabled : true
					}

				},
				layout : {
					padding : {
						left : 150,
						right : 150,
						top : 0,
						bottom : 0
					}
				}

			}
		})
	</script>
	<!-- 차트 js 끝 -->
</body>

</html>