$(document)
		.ready(
				function() {
					// 상단 탭 버튼
					$('#all').click(function() {

						$('#all').removeClass("unselect");
						$('#all').addClass("select");
						$('#category').removeClass("select");
						$('#category').addClass("unselect");

						$('#cate_box').hide();
						$('#all_box').show();
					});
					$('#category').click(function() {

						$('#category').removeClass("unselect");
						$('#category').addClass("select");
						$('#all').removeClass("select");
						$('#all').addClass("unselect");
						$('#all_box').hide();
						$('#cate_box').show();
					});
					
					// 상단 모든 카테고리 코드
					// 클릭해서 삭제
					$(document).on("click", ".del", function(e){
						Swal.fire({
							text: "해당 QnA 를 삭제하시겠습니까?",
							icon: 'warning',
							showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '예',
				            cancelButtonText: '아니오'
						}).then((result) => {
							if(result.isConfirmed){
								Swal.fire({
									text: "삭제되었습니다.",
					            	icon: "success",
					            	showConfirmButton: false,
					            	timer: 1500,
								}).then(function(){
									console.log("삭제1 ",$(e.target).parents('tr').children("td:eq(1)").children('p').html());
									var seq = Number($(e.target).parents('tr').children("td:eq(1)").children('input').val());
									var seq1 = Number($(e.target).parents('tr').children("td:eq(1)").children('p').val());
									console.log("삭제2", seq);
									location.href="/AskDelete.mdo?ask_seq=" + seq;
								})
							}else if(result.isDismissed){
								return false;
							}
						})
					})					
					
					// 선택 된 요소 삭제
					$(".chkbox").click(function(e){
					});
					$(".seldel").click(function() {
						var chk_arr = [];
						Swal.fire({
							text: "선택한 QnA 를 삭제하시겠습니까?",
							icon: 'warning',
							showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '예',
				            cancelButtonText: '아니오'
						}).then((result)=>{
							if(result.isConfirmed){
								$("input[name='chkbox']:checked").map((ine,el)=>{
					    			// .text() -> .children("input").val();
									console.log($(el).parents("tr").children("td:eq(1)").children("input").val());
									var seq =$(el).parents("tr").children("td:eq(1)").children("input").val();
									chk_arr.push(seq);
									console.log(chk_arr);
								})
								
								$.ajax({
									url: "/qnaChkbox.mdo",
									type: "GET",
									async: false,
									data: {"ask_seq" : chk_arr},
									success: function(data){
										$('.delche:checked').parents('tr').remove();
										$('.allche').removeAttr('checked');
									}
								})
								Swal.fire({
									text: "삭제되었습니다.",
				                	icon: "success",
				                	showConfirmButton: false,
				                	timer: 1500,
								}).then(function(){
									$('.delche:checked').parents('tr').remove();
									$('.allche').removeAttr('checked');
									location.href="/QnaList.mdo";
								})
							}else if(result.isDismissed){
								return false;
							}
						})
					});					
					
					// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
					$('.delche:checked')
							.click(
									function() {
										// 해제시 전체 클릭 비활성화
										$('.allche').prop("checked", false);
										// 모두 클릭되면 전체 클릭 활성화
										if ($('#all_box tbody>tr').length == $('.delche:checked').length) {
											$('.allche').prop("checked", true);
										}
									});
					// 전체 클릭 클릭시 전체온오프
					$('.allche').click(function() {
						if ($('.allche').is(':checked')) {
							$('.delche').prop("checked", true);
						} else {
							$('.delche').prop("checked", false);
						}
					})
					// checked 초기화
					$('.delche').prop("checked", false);
					$('.allche').prop("checked", false);
					// 하단에 있는 카테고리 홍보 코드
					// 리셋 버튼 코드 초기화
					$('.reset').click(
							function(e) {
								$(this).parents('tr').children('td:eq(3)')
										.children().text('default');
								$(this).parents('tr').children('td:eq(3)')
										.children().attr("data-default",
												"default");
							})
					// 코드 변화 감지에 따른 행동
					observer = new MutationObserver(function(mutations) {
						mutations.forEach(function(mutation) {
							console.log();
							$(mutation.target).parents('tr').children(
									'td:eq(1)').children().text('default')
						});
					});
					const num = document.getElementsByClassName('num');
					for (let i = 0; i < num.length; i++) {
						observer.observe(
								document.getElementsByClassName('num')[i], {
									childList : true
								});
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

//페이지 네이션 화면 이동
$(document).on('click', '#all_box #page a', makeDisplay);
//검색
$("#all_box #search_btn").click(function(e) {
	$("#all_box #seqche").val(0);
	$("#all_box #pageche").val(1);
	$("#all_box #titleche").val(null);
	$("#all_box #userche").val(null);
	$("#all_box #statusche").val(null);
	$("#all_box #startDateche").val(null);
	$("#all_box #endDateche").val(null);
	
	console.log(isNaN($("#pageche")));
	
	$("#all_box #startDateche").val($("#all_box #start_date").val());
	$("#all_box #endDateche").val($("#all_box #end_date").val());
	console.log($("#all_box #startDateche").val());
	console.log($("#all_box #endDateche").val());
	
	// 정규표현식
	let check = /^[0-9]+$/;

	console.log($("#all_box #seqche").val($("#search").val()));
	
	console.log($("#level").val());
	if($("#level").val() == "제목"){
		console.log($("#all_box #titleche"));
		$("#all_box #titleche").val($("#search").val());
		
	}else if($("#level").val() == "작성자"){
		$("#all_box #userche").val($("#search").val());
		console.log($("#all_box #userche"));
		
	}else if($("#level").val() == "답변여부"){
		$("#all_box #statusche").val($("#search").val())
		
		if($("#search").val() == "답변 완료"){
			$("#all_box #statusche").val($("#search").val("답변 완료"));
		}else if($("#search").val() == "답변 대기" || $("#search").val() == ""){
			$("#all_box #statusche").val($("#search").val("답변 대기"));
		}
		
		console.log($("#search").val());
		console.log($("#all_box #statusche").val($("#search").val()));
	}
	
	if($("#all_box #start_date").val() != null){
		$("#all_box #startDateche").val($("#all_box #start_date").val());
	}if($("#all_box #end_date").val() != null){
		$("#all_box #endDateche").val($("#all_box #end_date").val());
	}
	
	// Date 에 값을 안넣어줄 경우, if 문에 null 값일 때 값 안넘어가도록 진행
//	$("#all_box #titleche").val($("#all_box #title").val());
//	$("#all_box #nameche").val($("#all_box #name").val());
	// Number($("#all_box #category_btn").val()) != 0 : 해당 id 값을 숫자로 바꿔서 0 이 아닐 경우 -> 진행
//	if (Number($("#all_box #category_btn").val()) != 0 && Number($("#all_box #level").val()) != 0) {
//		$("#all_box #numche").val(Number($("#all_box #category_btn").val()) + Number($("#all_box #level").val()));
//	}
	make();
});

//화면 구성
function makeDisplay(e) {
	if ($(e.target).text().trim() == "<") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
	} else if ($(e.target).text() == ">") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) + 1);
	} else {
		$("#all_box #pageche").val($(e.target).text());
	}
	make();
}

//내용변경
function make() {
	let count = 0;
	$.ajax({
		url: "/qnaCount.mdo",
		method: "get",
		dataType: 'json',
		async: false,
		data: {
			title: $("#all_box #titleche").val(),
			user: $("#all_box #userche").val(),
			status: $("#all_box #statusche").val(),
			startDate: $("#all_box #startDateche").val(),
			endDate: $("#all_box #endDateche").val(),
			date: $("#all_box #dateche").val(),
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {
			console.log("re1", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			count = re;
			count = 1 + ($("#all_box #pageche").val() - 1) * 5;
			console.log(count);
			
			// 한 페이지당 몇 개의 게시글을 나오게 할 것인지 출력 (<)
			let pa = "";
			if (Number($("#all_box #pageche").val()) > 1) {
				pa += `<li class="page-item "><a class="page-link">
								<</a></li>`;
			}
			if (re % 5 == 0) {
				re--;
			}
			console.log("re2", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			console.log(Number($("#all_box #pageche").val()), re / 5 + 1)
			
			if (Number($("#all_box #pageche").val()) > re / 5 + 1) {
				$("#all_box #pageche").val(Number($("#all_box #pageche").val())-1);
			}
			
			// 총 페이지 수 구하고, 한 화면에 몇 개의 쪽수를 나오게 할지
			let page = Number($("#all_box #pageche").val());
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
				if (Number($("#all_box #pageche").val()) != i) {
					pa += `<li class="page-item"><a class="page-link" href="#">${i} </a></li>`;
				}
				if (Number($("#all_box #pageche").val()) == i) {
					pa += `<li class="page-item active" aria-current="page"><a href="#" class="page-link">${i}</a></li>`;
				}
			}
			if (Number($("#all_box #pageche").val()) < re / 5) {
				pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
			}
			$("#all_box .pagination").html(pa);
//			console.log("번호 : " + $("#all_box .pagination").html());
		}
	});
	$.ajax({
		url: "/qnaList.mdo",
		method: "GET",
		dataType: 'json',
		async: false,
		data: {
			title: $("#all_box #titleche").val(),
			user: $("#all_box #userche").val(),
			status: $("#all_box #statusche").val(),
			startDate: $("#all_box #startDateche").val(),
			endDate: $("#all_box #endDateche").val(),
			date: $("#all_box #dateche").val(),
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {
			console.log("ListRe", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 데이터List)
			let con = "";
			re.map((ask) => {
				con += `
							<tr>
								<td><input class="form-check-input border-1 border-dark delche" type="checkbox" name="chkbox" id="flexCheckChecked">
								</td>
								<td>
									<p id="seq">${count}</p>
									<input type="hidden" value="${ask.ask_seq }" />
								</td>
								<td>
									<p class="rowColumn" id="title">`
										if(ask.ask_status == "답변 완료"){
											con += `<a href="/qnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${count}">
								                        ${ask.ask_title }
								                     </a>`
										}else{
											con += `<a href="/QnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${count}">
								                        ${ask.ask_title }
								                      </a>`
										}
							con +=	`</p>
								</td>
								<td>
									<p class="selectColumn">${ask.user_id }</p>
								</td>
								<td>
									<p class="rowColumn">${ask.ask_date } </p>
								</td>
								<td>`
									if(ask.ask_status == "답변 완료"){
										con += `<button class="btn btn-outline-primary rounded-pill" name="ask_status">
											답변 완료
										</button>`
									}else{
										con += `<button class="btn btn-success rounded-pill" type="button" name="ask_status" onclick="location.href='/QnaDetail.mdo?ask_seq=${ask.ask_seq }&seq=${count}'">
											답변 대기
										</button>
										`
									}
							
					con += `
							<input type="hidden" value="${ask.ask_status }"  id="ask_status2" />
							</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>
						`;
				count++;
			});
//			console.log($("#all_box tbody").html());
//			console.log(con);
			
			$("#all_box tbody").html(con);
//			console.log("con: " + con);
//			console.log("공지사항 목록 : " + $("#all_box tbody").html());
		}
	});
}