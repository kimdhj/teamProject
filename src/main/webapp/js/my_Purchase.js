$(document).on("change", $("#stateche"), function(){
	if($("#stateche").val() == "orders_status"){ // orders_status 를 선택했을 때만
		$(".inputbox").addClass("hide");
		$(".dbstatus").removeClass("hide");
		
		if($("#dbstatus2").val() == "ready"){
			$(".purchasestatus").val("ready");
			$("#search").val("ready");

			console.log($("#search").val());
			console.log("결제대기",$(".purchasestatus").val());
			
		}else if($("#dbstatus2").val() == "paid"){
			$(".purchasestatus").val("paid");
			$("#search").val("paid");

			console.log($("#search").val());
			console.log("결제완료",$(".purchasestatus").val());
			
		}else if($("#dbstatus2").val() == "delivery"){
			$(".purchasestatus").val("delivery");
			$("#search").val("delivery");
			
		}else if($("#dbstatus2").val() == "finish"){
			$(".purchasestatus").val("finish");
			$("#search").val("finish");
			
		}else if($("#dbstatus2").val() == "cancelallwait"){
			$(".purchasestatus").val("cancelallwait");
			$("#search").val("cancelallwait");
			
		}else if($("#dbstatus2").val() == "cancelallfinish"){
			$(".purchasestatus").val("cancelallfinish");
			$("#search").val("cancelallfinish");
		}
		
	}else{ // 그 외 값들을 선택했을 때
		$(".inputbox").removeClass("hide");
		$(".dbstatus").addClass("hide");
	}
})

$(function() {
	// datepicker 한국어로 사용하기 위한 언어설정
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	// 시작일(start_date)은 종료일(end_date) 이후 날짜 선택 불가
	// 종료일(end_date)은 시작일(start_date) 이전 날짜 선택 불가

	// 시작일.
	$('#start_date').datepicker({
		showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
		buttonImage : "/img/calendar.png", // 버튼 이미지
		buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
		buttonText : "날짜선택", // 버튼의 대체 텍스트
		dateFormat : "yy-mm-dd", // 날짜의 형식
		changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
		// minDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
		maxDate : 0,
		onClose : function(selectedDate) {
			// 시작일(fromDate) datepicker가 닫힐때
			// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			$("#end_date").datepicker("option", "minDate", selectedDate);
		}
	});

	// 종료일
	$('#end_date').datepicker({
		showOn : "both",
		buttonImage : "/img/calendar.png",
		buttonImageOnly : true,
		buttonText : "날짜선택",
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		// minDate: 0, // 오늘 이전 날짜 선택 불가
		maxDate : 0,
		onClose : function(selectedDate) {
			// 종료일(toDate) datepicker가 닫힐때
			// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
			$("#start_date").datepicker("option", "maxDate", selectedDate);
		}
	});
});

// 기간조회
function searchDateOneWeek() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_day = -7; // 일주일전
	d.setDate(d.getDate() + sel_day);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("start_date").value = dt;
	document.getElementById("end_date").value = today;
}
function searchDateOneMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -1;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("start_date").value = dt;
	document.getElementById("end_date").value = today;
}
function searchDateThreeMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -3;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("start_date").value = dt;
	document.getElementById("end_date").value = today;
}
function searchDateSixMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -6;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("start_date").value = dt;
	document.getElementById("end_date").value = today;
}

$("#start_date").val(null); // 시작날짜 null 값 띄우기
$("#end_date").val(null); // 마지막 날짜 null 값 띄우기
console.log($("#start_date").val());
console.log($("#end_date").val());

// 검색할 때 숫자 or String 
// search : 검색, stateche : select id 의미
$(document).on("propertychange change paste input keyUp keyDown", "#search, #stateche",function(){
	// 숫자바꾸기
	if($("#stateche").val().trim()=="orders_seq"){
		$("#search").val($("#search").val().replace(/[^0-9]/g,'')) ; 
	}
	
	if($("#stateche").val().trim()=="orders_seq"){
	  $('#search').prop("type", "number");
	  
	  if($("#search").val() == ""){
		  $('#search').prop("type", "text");
	  }
	}else{
	 $('#search').prop("type", "text");
	}
})

//페이지 네이션 화면 이동
$(document).on('click', '#purchasebox #pageche a', makeDisplay);

//화면 구성
function makeDisplay(e) {
	if ($(e.target).text().trim() == "<") {
		$("#purchasebox #page").val(Number($("#purchasebox #page").val()) - 1);
	} else if ($(e.target).text() == ">") {
		$("#purchasebox #page").val(Number($("#purchasebox #page").val()) + 1);
	} else {
		$("#purchasebox #page").val($(e.target).text());
	}
	make();
}

// 검색할 값들 추가
$(document).on("click", ".search_btn", function(){
	
	$("#searchkeyword").val($("#stateche").val().trim());
	$("#searchcontent").val($("#search").val().trim());
	$("#startDateche").val($("#start_date").val());
	$("#endDateche").val($("#end_date").val());
	$("#page").val(Number(1));
	
	console.log($("#searchkeyword").val());
	console.log($("#searchcontent").val());
	console.log($("#search").val());
	
//	console.log($("#startDateche").val());
//	console.log($("#endDateche").val());
	
	make();
})

//내용변경
function make() {
	let count = 0;
	$.ajax({
		url: "/purchaseCount.do",
		method: "GET",
		dataType: 'json',
		async: false,
		data: {
			startDate : $("#startDateche").val(),
			endDate : $("#endDateche").val(),
			searchkeyword: $("#searchkeyword").val(),
			searchcontent: $("#searchcontent").val()
		},
		success: function(re) {
			console.log("re1", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			count = re;
			count = 1 + ($("#purchasebox #page").val() - 1) * 5;
			console.log(count);
			
			// 한 페이지당 몇 개의 게시글을 나오게 할 것인지 출력 (<)
			let pa = "";
			if (Number($("#purchasebox #page").val()) > 1) {
				pa += `<li class="page-item "><a class="page-link">
								<</a></li>`;
			}
			if (re % 5 == 0) {
				re--;
			}
			console.log("re2", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			console.log(Number($("#purchasebox #page").val()), re / 5 + 1)
			
			if (Number($("#purchasebox #page").val()) > re / 5 + 1) {
				$("#purchasebox #page").val(Number($("#purchasebox #page").val())-1);
			}
			
			// 총 페이지 수 구하고, 한 화면에 몇 개의 쪽수를 나오게 할지
			let page = Number($("#purchasebox #page").val());
			let startpage = 0;
			let endpage = 0;
			
			if(page < 3){
				startpage = 1;
			}else{
				startpage = page - 2;
			}
			
			if (page + 2 > re / 5 + 1) {
				endpage = re / 5 + 1;
			} else {
				endpage = page + 2;
			}
			
			for (let i = startpage; i <= endpage; i++) {
				if (Number($("#purchasebox #page").val()) != i) {
					pa += `<li class="page-item"><a class="page-link">${i} </a></li>`;
				}
				if (Number($("#purchasebox #page").val()) == i) {
					pa += `<li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>`;
				}
			}
			if (Number($("#purchasebox #page").val()) < re / 5) {
				pa += `<li class="page-item"><a class="page-link">></a></li>`;
			}
			$("#purchasebox .pagination").html(pa);
//			console.log("번호 : " + $("#all_box .pagination").html());
		}
	});
	$.ajax({
		url: "/purchaseList.do",
		method: "GET",
		dataType: 'json',
		async: false,
		data: {
			page:Number($("#page").val()),
			startDate : $("#startDateche").val(),
			endDate : $("#endDateche").val(),
			searchkeyword: $("#searchkeyword").val(),
			searchcontent: $("#searchcontent").val()
		},
		success: function(re) {
			console.log("ListRe", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 데이터List)
			let con = "";
			re.map((purchase) => {
				con += `
						    <div class="row purchaseList_box mt-5">
						    
						      <div class="col-2 purchaseList_img">
						        <img width="100%" src="${purchase.book_bigimgURL }">
						      </div>
						      
						      <div class="col-9 bookBox">
						        <div class="row">
						          <div class="col-8" style="font-size: large; font-weight: bolder;" id="purchaseList_title">${purchase.book_title }</div>
						          <div class="col-2" style="margin-top: 3%;">수량: ${purchase.order_bookList_count }개</div>
						        </div>
						        
						        <div class="row">
						          <div class="col-8">${purchase.book_author } | ${purchase.orders_order_day }
						          </div>
						        </div>
						        
						        <div class="row">`
									if(purchase.orders_status == "ready"){
										con += `<div class="col-7 purchasestatus">결제 대기</div>`;
									}else if(purchase.orders_status == "paid"){
										con += `<div class="col-7 purchasestatus">결제 완료</div>`;
									}else if(purchase.orders_status == "delivery"){
										con += `<div class="col-7 purchasestatus">배송중</div>`;
									}else if(purchase.orders_status == "finish"){
										con += `<div class="col-7 purchasestatus">배송 완료</div>`;
									}else if(purchase.orders_status == "cancelallwait"){
										con += `<div class="col-7 purchasestatus">환불/교환/반품대기</div>`;
									}else if(purchase.orders_status == "cancelallfinish"){
										con += `<div class="col-7 purchasestatus">환불/교환/반품완료</div>`;
									}
					con +=  `</div>
						        
						        <div class="row">
						          <div class="col-12 purchaseList_hr"></div>
						        </div>
						        
						        <div class="row">
									<div class="col-2 purchaseList_btns">
										<button onclick="location.href='/myPurchaseDetail.do?orders_seq=${purchase.orders_seq}'">구매상세</button>
									</div>
									
						            <div class="col-2 purchaseList_btns">`
						
						if(purchase.orders_status == "ready" || purchase.orders_status == "paid"){
							con += `<button class="purchaseCancel" type="button">구매취소</button>`;
						}
					con += `</div>
					 <div class="col-2 purchaseList_btns">
					`;
						
						if(purchase.orders_status == "finish" && purchase.order_bookList_review_complete == false){
							con += `<button onclick="location.href='/myreviewInsert.do?book_seq=${purchase.book_seq}&order_bookList_seq=${purchase.order_bookList_seq }'">리뷰작성</button>`;
						}else if(purchase.order_bookList_review_complete == true){
							con += ` <button onclick="location.href='/myreviewUpdate.do?book_seq=${purchase.book_seq}&order_bookList_seq=${purchase.order_bookList_seq }'">리뷰수정</button>`;
						}
						
						   con +=     `</div>
						      </div>
						      </div>
						    </div>
						`;
			});
//			console.log($("#all_box tbody").html());
//			console.log(con);
			
			$(".hellobox").html(con);
//			console.log("con: " + con);
//			console.log("공지사항 목록 : " + $("#all_box tbody").html());
		}
	});
}


$(document).ready(function () {
    $(".purchaseCancel").click(function (e) {
    	console.log($(e.target).parents('div:eq(3)').children('input').val());
    	
        Swal.fire({
            text: "구매를 취소하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
            	$.ajax({
            		url: "/purchaseCancel.do",
            		method: "get",
            		dataType: "JSON",
            		async: false,
            		data:{
            			orders_seq : Number($(e.target).parents('div:eq(3)').children('input').val())
            		},
            		// 컨트롤러에서 return 없으면 success 사용불가 -> 대체를 위해 complete 사용 가능
            	})
                Swal.fire({
                	html: "구매를 취소하셨습니다. <br>자세한 내용은 취소/교환/반품 조회 페이지에서 <br> 확인해주세요.",
					icon: "success",
					showConfirmButton: true
                }).then(function(){
                	location.href="/myPurchase.do";
                })
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});