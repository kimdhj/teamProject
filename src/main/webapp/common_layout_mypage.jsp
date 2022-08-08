
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="commonjsp/common_head.jsp"></jsp:include>


</head>

<body>
	<!-- Common header include -->
	<jsp:include page="commonjsp/common_header.jsp"></jsp:include>
<script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script>
<link href="./datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<link href="./css/purchaseList_style.css" rel="stylesheet">
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script><!-- alert 창 예쁘게 -->
</head>
<!-- Page Header Start -->
<div class="container-fluid page-header wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
		<nav aria-label="breadcrumb animated slideInDown">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
				<li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
				<li class="breadcrumb-item text-dark active" aria-current="page">Contact
					Us</li>
			</ol>
		</nav>
	</div>
</div>
<!-- Page Header End -->

<!-- Contact Start -->
<div class="container-xxl py-6">
	<div class="container">
		<div class="section-header text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 500px;">
			<h1 class="display-5 mb-3">My Page</h1>
			<p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum
				diam justo sed rebum vero dolor duo.</p>
		</div>
		<!-- 마이페이지 메인 헤더 -->
		<div class="row g-5 justify-content-center">
			<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
				<div
					class="bg-light text-black d-flex flex-column justify-content-center h-100 p-3">

					<!-- 메인페이지 헤더 내용 -->
					<div class="container">
						<div class="row">
							<div class="col-3"></div>
							<div class="row col-9">
								<div class="col-4">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-md-auto align-self-center">
												<a class="fs-4 text-dark">이승재 님 </a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-md-auto align-self-center">
												<a class="fs-6 text-dark">할인쿠폰</a>&nbsp;&nbsp;<a href=""
													class="">22</a>장
											</div>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-md-auto align-self-center">
												<a class="fs-6 text-dark">마일리지</a>&nbsp;&nbsp;<a href=""
													class="">223,421,123</a>P
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 메인페이지 헤더 내용 끝 -->
				</div>
			</div>
		</div>
		<!-- 마이페이지 메인 헤더 끝 -->

		<!-- 마이페이지 메인 바디 -->
		<div class="row g-5 justify-content-center">
			<div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.1s">
				<div
					class="bg-light text-black d-flex flex-column justify-content-center h-100 p-5">

					<!-- Split dropend button -->
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">주문관리</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">
									<a href="purchaseList.jsp">주문/배송조회</a>
								</button></li>
							<li><button class="dropdown-item" type="button">취소/교환/반품조회</button></li>
						</ul>
					</div>
					<br> <br> <br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">나의지갑</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">할인쿠폰/마일리지</button></li>
						</ul>
					</div>
					<br> <br> <br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">나의콘텐츠</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">관심작가</button></li>
							<li><button class="dropdown-item" type="button">나의리뷰</button></li>
						</ul>
					</div>
					<br> <br> <br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">문의내역</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">나의문의</button></li>
							<li><button class="dropdown-item" type="button">문의하기</button></li>
						</ul>
					</div>
					<br> <br> <br>
					<div class="btn-group dropend">
						<button type="button" class="btn btn-secondary">회원정보관리</button>
						<button type="button"
							class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
							data-bs-toggle="dropdown" aria-expanded="false">
							<span class="visually-hidden">Toggle Dropright</span>
						</button>
						<ul class="dropdown-menu">
							<!-- Dropdown menu links -->
							<li><button class="dropdown-item" type="button">회원정보
									수정</button></li>
							<li><button class="dropdown-item" type="button">비밀번호
									변경</button></li>
							<li><button class="dropdown-item" type="button">나의
									주소록</button></li>
							<li><button class="dropdown-item" type="button">회원탈퇴</button></li>
						</ul>
					</div>
					<br>
					<!-- 슬립 드롭다운 끝 -->
				</div>
			</div>
			<!-- 우측하단 시작 -->
			<div class="col-lg-9 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
				<!-- 여기 삽입 -->
				<!-- 구매 목록 -->
				<div class="row">
					<div class="col-11">
						<div class="row">
							<h3 id="purchaseList_name">구매 목록</h3>
							<div class="col-12 purchaseList_hr"></div>
						</div>
					</div>
				</div>

				<!-- 날짜 조회할 수 있는 칸 -->
				<div class="row">
					<div class="col-11">
						<!-- 날짜 선택가능(연속달력으로 변경) -->
						<div id="purchaseList_calendar">
							<div>
								<input type="text" id="datepicker1"> - <input
									type="text" id="datepicker2">
								<button id="purchaseList_bt">조회</button>
							</div>
						</div>
						<div class="row">
							<div class="col-12 purchaseList_hr"></div>
						</div>
					</div>
				</div>

				<!-- 구매한 도서 목록 리스트 -->
				<div class="row">
					<div class="col-11">
						<div class="row">
							<div class="col-12 purchaseList_hr"></div>
						</div>
						<div class="row">
							<div class="col-2 purchaseList_img">
								<img width="100%" src="./img/product1-8.jpg">
							</div>
							<div class="col-8">
								<h4 id="purchaseList_title">해리포터</h4>
								<div class="row">
									<div class="col-8">바보 | 2022.07.23</div>
								</div>
								<div class="row">
									<div class="col-7">발송완료</div>
									<div class="col-2">수량: 1개</div>
								</div>
								<div class="row">
									<div class="col-12">
										<hr>
									</div>
								</div>
								<div class="row">
									<div class="col-11">상품은 잘 받아보셨나요? 확인하시고 구매 확정 진행해주세요!</div>
								</div>
							</div>
							<div class="col-2" id="purchaseList_btns">
								<a href="./purchaseDetail.jsp"><button>배송조회</button></a>
								<a href="./review.jsp"><button>리뷰작성</button></a>
								<a href="./purchaseDetail.jsp"><button>구매상세</button></a>
								<a href="#"><button class="purchaseCancel">구매취소</button></a>
							</div>
						</div>
						<div class="row">
							<div class="col-12 purchaseList_hr"></div>
						</div>
					</div>
				</div>
				<!-- 요런 식으로 도서 리스트 계속 띄우기 -->
				<!-- 구매한 도서 목록 리스트 -->
				<div class="row">
					<div class="col-11">
						<div class="row">
							<div class="col-12 purchaseList_hr"></div>
						</div>
						<div class="row">
							<div class="col-2 purchaseList_img">
								<img width="100%" src="./img/product1-8.jpg">
							</div>
							<div class="col-8">
								<h4 id="purchaseList_title">해리포터</h4>
								<div class="row">
									<div class="col-8">바보 | 2022.07.23</div>
								</div>
								<div class="row">
									<div class="col-7">발송완료</div>
									<div class="col-2">수량: 1개</div>
								</div>
								<div class="row">
									<div class="col-12">
										<hr>
									</div>
								</div>
								<div class="row">
									<div class="col-11">상품은 잘 받아보셨나요? 확인하시고 구매 확정 진행해주세요!</div>
								</div>
							</div>
							<div class="col-2" id="purchaseList_btns">
								<a href="./purchaseDetail.jsp"><button>배송조회</button></a>
								<a href="./review.jsp"><button>리뷰작성</button></a>
								<a href="./purchaseDetail.jsp"><button>구매상세</button></a>
								<a href="#"><button class="purchaseCancel">구매취소</button></a>
							</div>
						</div>
						<div class="row">
							<div class="col-12 purchaseList_hr"></div>
						</div>
					</div>
				</div>
				
				<!-- 페이징 -->
				<div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- 우측하단 끝 -->
		</div>
		<!-- 마이페이지 메인 바디 끝 -->
	</div>
</div>
<!-- Contact End -->
<script type="text/javascript">
	datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
	/*
	 * 달력 생성기
	 * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
	 * @example   datePickerSet($("#datepicker"));
	 * 
	 * 
	 * @param sDate, 
	 * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
	 * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
	 */

	function datePickerSet(sDate, eDate, flag) {

		//시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
				&& eDate.length > 0) {
			var sDay = sDate.val();
			var eDay = eDate.val();

			if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

				var edp = eDate.datepicker().data("datepicker");
				edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(eDay)) {
				sDate.datepicker({
					maxDate : new Date(eDay.replace(/-/g, "/"))
				});
			}
			sDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(sDay)) {
				eDate.datepicker({
					minDate : new Date(sDay.replace(/-/g, "/"))
				});
			}
			eDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
			var sDay = sDate.val();
			if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			sDate.datepicker({
				language : 'ko',
				autoClose : true
			});
		}

		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	}
	 
	 $().ready(function () {
		    $(".purchaseCancel").click(function () {
		        Swal.fire({
		            title: '구매를 취소하시겠습니까?',
		            text: "취소하시면 상품을 받아볼 수 없습니다. 🥺",
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '예',
		            cancelButtonText: '아니오'
		        }).then((result) => {
		            if (result.isConfirmed) {
		                Swal.fire(
		                    '구매가 취소되었습니다.',
		                    '즐거운 쇼핑되세요 😊',
		                )
		            }
		        })
		    });
		});
</script>

<!-- Footer Start -->
<!-- Common Footer include -->
<jsp:include page="commonjsp/common_footer.jsp"></jsp:include>

<!-- Footer End -->

</body>

</html> --%>