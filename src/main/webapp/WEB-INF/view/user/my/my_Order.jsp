<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Common head include -->
    <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
    
    <!-- DatePicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/css/style.css">
  	
</head>

<body>
    <!-- Common header include -->
    <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
	
	<jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

    
                    <!-- 여기 삽입 -->
                    <!-- 배송정보 시작 -->
	   	            <div class="container">
					  <div class="row justify-content-center">
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_1.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_7.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_2.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_7.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_3.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_7.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_4.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_7.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_5.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_7.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto align-self-center">
					      	<img src="img/mypage_delivery_6.png" class="rounded" alt="...">
					    </div>
					    <div class="col-md-auto">
					      	<ul class="list-group list-group-flush">
							  <li class="list-group-item">-취소</li>
							  <li class="list-group-item">-교환</li>
							  <li class="list-group-item">-반품</li>
							</ul>
					    </div>
					  </div>
					</div>
                    <!-- 배송정보 끝 -->
                    
                    <!-- 배송조회 -->
                    <select id="select_logistics" name = "Appia">
			          <option id = "delivery_post" class="logistics" value = "post" selected>우체국택배</option>
			          <option id = "delivery_cj" class="logistics" value = "cj">CJ대한통운</option>
			          <option id = "delivery_logen" class="logistics" value = "logen">로젠택배</option>
					</select>
                    <input id='deliveryNumber' placeholder="운송장번호입력" onkeyup=''/>
                    <button type="button" onclick="deliveryTracking()">조회</button>
					<!-- 배송조회 끝 -->
                    
                    <!-- 기간조회 및 조건검색 -->
                    
                    
                    <table class="table">
					  <thead>
					   						    
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row" class="bg-light align-middle">기간조회</th>
					      <td>
					      	<div class="btn btn-group" role="group" aria-label="Basic example">
							  <button type="button" class="btn btn-dark btn-sm" name="filterDate" id="oneWeek" value="1" onclick="searchDateOneWeek()">1주일</button>
							  <button type="button" class="btn btn-dark btn-sm" name="filterDate" id="oneMonth" value="2" onclick="searchDateOneMonth()">1개월</button>
							  <button type="button" class="btn btn-dark btn-sm" name="filterDate" id="threeMonth" value="3" onclick="searchDateThreeMonth()">3개월</button>
							  <button type="button" class="btn btn-dark btn-sm" name="filterDate" id="sixMonth" value="4" onclick="searchDateSixMonth()">6개월</button>
							</div>
					      	<div>
					      		오늘 날짜 : <span id="today"></span>
						        <form>
						          <input type="text" name="fromDate" id="fromDate">
						          ~
						          <input type="text" name="toDate" id="toDate">
						        </form>
							</div>
					      </td>
					      <td rowspan="2" class="align-middle">
					      	<button type="button" class="btn btn-secondary">조회</button>
					      </td>
					    </tr>
					    <tr>
					      <th scope="row" class="bg-light align-middle">조건검색</th>
					      <td> 
					      	<select name = "Appia">
					          <option value = "Python" selected>상품명</option>
					          <option value = "MATLAB">주문번호</option>
					          <option value = "HTML">받는분 이름</option>
					       </select>
					       
							  
							  <input type="text" class="form-control" id="" placeholder="">
							
					     </td>
					    </tr>
					    
					  </tbody>
					</table>
                    
					
                    <!-- 기간조회 및 조건검색 끝 -->
                                       
                    <!-- 나의 최근 주문현황 -->
                    <br>
                    2022-06-29 ~ 2022-07-28 까지의 주문 총 <a>0</a>건
                    <div class="table-responsive">
					  <table class="table ">
					    <thead>
						    <tr>
						      <th scope="col">주문번호</th>
						      <th scope="col">주문금액</th>
						      <th scope="col">상품정보</th>
						      <th scope="col">수량</th>
						      <th scope="col">주문상태</th>
						      <th scope="col">주문변경</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">1230</th>
						      <td>500,000원</td>
						      <td>이것이 우분투 리눅스다 - 한빛미디어 (우재남 지음)</td>
						      <td>1</td>
						      <td>배송중</td>
						      <td>변경하기</td>
						    </tr>
						    <tr>
						      <th scope="row">2</th>
						      <td>Jacob</td>
						      <td>Thornton</td>
						      <td>@fat</td>
						      <td>@fat</td>
						      <td>@fat</td>
						    </tr>
						    <tr>
						      <th scope="row">3</th>
						      <td colspan="2">Larry the Bird</td>
						      <td>@twitter</td>
						      <td>@twitter</td>
						      <td>@twitter</td>
						    </tr>
						  </tbody>
					  </table>
					</div>
					<!-- 페이징 -->
					<div class="container">
					  	<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li class="page-item disabled">
						      <a class="page-link">Previous</a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#">Next</a>
						    </li>
						  </ul>
						</nav>
					</div>
					<!-- 페이징 끝 -->
					<br><br>
                    <!-- 나의 최근 주문현황 끝 -->

                
            <!-- 공통 마이페이지 바텀 -->
            <jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>
            <!-- 공통 마이페이지 바텀 끝 -->
            
    <!-- Contact End -->


    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
        
	<!-- Footer End -->
	<!-- js -->
	<!-- DatePicker -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script>
        $(function() {
            
        
            //오늘 날짜를 출력
            $("#today").text(new Date().toLocaleDateString());

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            
            // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
            // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

            //시작일.
            $('#fromDate').datepicker({
                showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                buttonImage: "img/calendar.png", 	// 버튼 이미지
                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                buttonText: "날짜선택",             // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",             // 날짜의 형식
                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                maxDate: 0,
                onClose: function( selectedDate ) {    
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#toDate").datepicker( "option", "minDate", selectedDate );
                }                
            });

            //종료일
            $('#toDate').datepicker({
                showOn: "both", 
                buttonImage: "img/calendar.png", 
                buttonImageOnly : true,
                buttonText: "날짜선택",
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                maxDate: 0,
                onClose: function( selectedDate ) {
                    // 종료일(toDate) datepicker가 닫힐때
                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                }                
            });
        });
       
     
     
    </script>
    
    <script>
    	//운송장번호로 배송 조회
	    //let target = document.getElementById("select_logistics");
		//alert('선택된 옵션 text 값=' + target.options[target.selectedIndex].text);     // 옵션 text 값
	    //alert('선택된 옵션 value 값=' + target.options[target.selectedIndex].value);     // 옵션 value 값
    	//송장번호 입력
    	function deliveryTracking()  {
	    	const deliveryNumber = document.getElementById("deliveryNumber").value; //입력받은 운송장번호
    		let target = document.getElementById("select_logistics");//선택한 택배회사
    		let logistics = target.options[target.selectedIndex].text;//택배회사이름
    		let link = "https://tracker.delivery/#/";
    		
    		if(logistics === "우체국택배") {
    			alert("우체국택배");
    			link += "kr.epost/"
    			console.log(link);
    			console.log(deliveryNumber);
    		} else if(logistics === "CJ대한통운") {
    			alert("CJ대한통운");
    			link += "kr.cjlogistics/"
    		} else if(logistics === "로젠택배") {
    			alert("로젠택배");
    			link += "kr.logen/"
    		}
    		link += deliveryNumber;
    		location.href = link;
    	}
    	
    </script>
    <script>
    	//기간조회
     	function searchDateOneWeek() {
    		let d = new Date();
    		const yearNow = d.getFullYear();
    		const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
    		const dayNow = ('0' + d.getDate()).slice(-2);
    		const today = yearNow + "-" + monthNow + "-" + dayNow;
    		
    		let sel_day = -7; //일주일전
    		d.setDate(d.getDate() + sel_day );

    		let year    = d.getFullYear();
    		let month   = ('0' + (d.getMonth() +  1 )).slice(-2);
    		let day     = ('0' + d.getDate()).slice(-2);
    		dt = year+"-"+month+"-"+day;
    		console.log(dt);
    		document.getElementById("fromDate").value = dt;
    		document.getElementById("toDate").value = today;
    	} 
    	
    	function searchDateOneMonth() {
    		let d = new Date();
    		const yearNow = d.getFullYear();
    		const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
    		const dayNow = ('0' + d.getDate()).slice(-2);
    		const today = yearNow + "-" + monthNow + "-" + dayNow;
    		    		
    		let sel_month = -1;
    		d.setMonth(d.getMonth() + sel_month);
    		
    		let year    = d.getFullYear();
    		let month   = ('0' + (d.getMonth() +  1 )).slice(-2);
    		let day     = ('0' + d.getDate()).slice(-2);
    		dt = year+"-"+month+"-"+day;
    		console.log(dt);
    		document.getElementById("fromDate").value = dt;
    		document.getElementById("toDate").value = today;
    	}
    	
    	function searchDateThreeMonth() {
    		let d = new Date();
    		const yearNow = d.getFullYear();
    		const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
    		const dayNow = ('0' + d.getDate()).slice(-2);
    		const today = yearNow + "-" + monthNow + "-" + dayNow;
    		
    		let sel_month = -3;
    		d.setMonth(d.getMonth() + sel_month);
    		
    		let year    = d.getFullYear();
    		let month   = ('0' + (d.getMonth() +  1 )).slice(-2);
    		let day     = ('0' + d.getDate()).slice(-2);
    		dt = year+"-"+month+"-"+day;
    		console.log(dt);
    		document.getElementById("fromDate").value = dt;
    		document.getElementById("toDate").value = today;
    	}
    	
    	function searchDateSixMonth() {
    		let d = new Date();
    		const yearNow = d.getFullYear();
    		const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
    		const dayNow = ('0' + d.getDate()).slice(-2);
    		const today = yearNow + "-" + monthNow + "-" + dayNow;
    		
    		let sel_month = -6;
    		d.setMonth(d.getMonth() + sel_month);
    		
    		let year    = d.getFullYear();
    		let month   = ('0' + (d.getMonth() +  1 )).slice(-2);
    		let day     = ('0' + d.getDate()).slice(-2);
    		dt = year+"-"+month+"-"+day;
    		console.log(dt);
    		document.getElementById("fromDate").value = dt;
    		document.getElementById("toDate").value = today;
    	}
    </script>
</body>

</html>