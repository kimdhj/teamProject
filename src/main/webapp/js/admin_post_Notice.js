$(function() {
	$(".week").click(function() {
		let st = new Date($("#start_date").val());
		st.setDate(st.getDate() - 7);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".month").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 1);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".threemonth").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 3);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".sixmonth").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 6);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".year").click(function() {
		let st = new Date($("#start_date").val());
		st.setFullYear(st.getFullYear() - 1);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
});

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
					$(".del").click(function(e) {
				        Swal.fire({
				            text: "해당 공지사항을 삭제하시겠습니까?",
				            icon: 'warning',
				            showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '예',
				            cancelButtonText: '아니오'
				        }).then((result) => {
				            if (result.isConfirmed) {
				                Swal.fire({
				                	text: "삭제되었습니다.",
				                	icon: "success"
				                }).then(function(){
				                	console.log(e.target);
				                	$(e.target).parents('tr').remove();
					                
				                	 var seq = $(e.target).parents('tr').children("td:eq(1)").text().trim();
						             console.log(seq);
						             location.href="/admin_post_NoticeDelete.mdo?notice_seq=" + seq;
						            	 
//				                	$(this).parents('tr').remove();
//				                	var seq = $("#seq").text();
//				                	$(this).parents('tr').children("td:eq(1)").html();
				              //  	location.href="/admin_post_NoticeDelete.mdo?notice_seq=" + seq;
				                })
				            }else if(result.isDismissed){
				            	return false;
				            }
				        })
					})
					
//					$(".del").click(function(e) {
//					//	console.log($(this).parents('tr').children("td:eq(1)").text().trim());
//						var num = $(this).parents('tr').children("td:eq(1)").text().trim();
//						num.remove();
//						
//						var seq = num;
//						location.href="/admin_post_NoticeDelete.mdo?notice_seq=" + seq;
//
//						console.log(num, seq);
//					})
					
//					var chk_arr = [];
//					$("input[name=chkbox]:checked").each(function(){
//						var chk = $(this).val();
//						chk_arr.push(chk);
//						console.log(chk_arr);
//						
//					})
				
						$(".seldel").click(function(){
							var chk_arr = [];
//							var seq = $(e.target).parents('tr').children("td:eq(1)").text().trim();
//							console.log(seq);
//							console.log($("input[name='chkbox']:checked"));
							
							$("input[name='chkbox']:checked").map((ine,el)=>{
								console.log($(el).parents("tr").children("td:eq(1)").text().trim());
								var seq = $(el).parents("tr").children("td:eq(1)").text().trim();
								chk_arr.push(seq);
								console.log(chk_arr);
							})
							
							var allSeq = {"notice_seq" : chk_arr}
							
							$.ajax({
								url: "/admin_post_NoticeChkbox.mdo", // 데이터를 가지고 갈 주소
								type: "GET",
								data: allSeq,
								success: function(data){
									$('.delche:checked').parents('tr').remove(); // 선택된 행 전체 삭제
				                	$('.allche').removeAttr('checked'); // checked 된 속성 값 제거
//									location.href="/admin.post.NoticeDelete.mdo?notice_seq=" + notice_seq;
								},
								error: function(){
									Swal.fire({
										text: "Error",
										icon: "error"
									})
								}
							})
				})
					
				// 선택 된 요소 삭제
				$(".chkbox").click(function(e){
				});
				$(".seldel").click(function() {
					var chk_arr = [];
					Swal.fire({
			            text: "선택한 공지사항을 삭제하시겠습니까?",
			            icon: 'warning',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            cancelButtonColor: '#d33',
			            confirmButtonText: '예',
			            cancelButtonText: '아니오'
			        }).then((result) => {
			        	if (result.isConfirmed) {
			        		$("input[name='chkbox']:checked").map((ine,el)=>{
			        			// .text() -> .children("input").val();
								console.log($(el).parents("tr").children("td:eq(1)").text().trim());
								var seq = $(el).parents("tr").children("td:eq(1)").text().trim();
								chk_arr.push(seq);
								console.log(chk_arr);
							})
							
							var allSeq = {"notice_seq" : chk_arr}
							
							$.ajax({
								url: "/admin_post_NoticeChkbox.mdo", // 데이터를 가지고 갈 주소
								type: "GET",
								data: allSeq,
								success: function(data){
									$('.delche:checked').parents('tr').remove(); // 선택된 행 전체 삭제
				                	$('.allche').removeAttr('checked'); // checked 된 속성 값 제거
//									location.href="/admin.post.NoticeDelete.mdo?notice_seq=" + notice_seq;
								},
								error: function(){
									Swal.fire({
										text: "Error",
										icon: "error"
									})
								}
							})
							
			        		Swal.fire({
			                	text: "삭제되었습니다.",
			                	icon: "success"
			                }).then(function(){
			                	// $('.delche:checked') : 선택된 값
			                	// #('.allche') : 전체 선택
			                	$('.delche:checked').parents('tr').remove(); // 선택된 행 전체 삭제
			                	$('.allche').removeAttr('checked'); // checked 된 속성 값 제거
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
										//  모두 클릭되면 전체 클릭 활성화
										if ($('#all_box tbody>tr').length == $('.delche:checked').length) {
											$('.allche').prop("checked", true);
										}
									});
					//  전체 클릭 클릭시 전체온오프
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

// 날짜 더하기
$("#start_date").val(new Date());
let date = new Date();
date.setMonth(date.getMonth() + 1);

$("#end_date").val(date);
datePickerSet($("#start_date"), $("#end_date"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
// var date2 = $('#start_dat').datepicker('getDate', '+1d');
//     date2.setDate(date2.getDate() + 1);
//     $('.dropoffDate').datepicker('setDate', date2)

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
		let sDay = sDate.val();
		let eDay = eDate.val();

		if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
			let sdp = sDate.datepicker().data("datepicker");
			console.log("flag");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

			let edp = eDate.datepicker().data("datepicker");
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
				console.log("select");
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
		let sDay = sDate.val();
		if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
			let sdp = sDate.datepicker().data("datepicker");
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

/*$().ready(function () {
    $(".del").click(function () {
        Swal.fire({
            text: "해당 공지사항을 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                	'',
                    '삭제되었습니다.'
                )
            }
        })
    });
});*/

//페이지 네이션 화면 이동
$(document).on('click', '#all_box #page a', makeDisplay);
//검색
$("#all_box #search_btn").click(function(e) {
	$("#all_box #titleche").val(null);
	$("#all_box #contentche").val(null);
	$("#all_box #seqche").val(0);
	$("#all_box #pageche").val(1);
	$("#all_box #startche").val();
	$("#all_box #endche").val();
	// Date 에 값을 안넣어줄 경우, if 문에 null 값일 때 값 안넘어가도록 진행
	let count = 0;
//	$("#all_box #nameche").val($("#all_box #name").val());
	// Number($("#all_box #category_btn").val()) != 0 : 해당 id 값을 숫자로 바꿔서 0 이 아닐 경우 -> 진행
//	if (Number($("#all_box #category_btn").val()) != 0 && Number($("#all_box #level").val()) != 0) {
//		$("#all_box #numche").val(Number($("#all_box #category_btn").val()) + Number($("#all_box #level").val()));
//	}
	make();
});

//화면 구성
function makeDisplay(e) {
	if ($(e.target).text() == "<") {
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
	$.ajax({
		url: "/categoryCount.mdo",
		method: "get",
		dataType: 'json',
		async: false,
		data: {
			num: Number($("#all_box #numche").val()),
			name: $("#all_box #nameche").val(),
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {
			count = re;
			count = count - ($("#all_box #pageche").val() - 1) * 5;
			let pa = '';
			if (Number($("#all_box #pageche").val()) > 1) {
				pa += `<li class="page-item "><a class="page-link">
								< </a></li>`;
			}
			if (re % 5 == 0) {
				re--;
			}
			for (let i = 1; i <= re / 5 + 1; i++) {
				if (Number($("#all_box #pageche").val()) != i) {

					pa += `<li class="page-item"><a class="page-link"
								href="#">${i}
							</a></li>`;
				}
				if (Number($("#all_box #pageche").val()) == i) {

					pa += `<li class="page-item active" aria-current="page"><a
								href="#"
								class="page-link">${i}</a></li>`;
				}




			}
			if (Number($("#all_box #pageche").val()) < re / 5) {
				pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
			}
			$("#all_box .pagination").html(pa);
		}
	});
	$.ajax({
		url: "/categoryList.mdo",
		method: "get",
		dataType: 'json',
		async: false,
		data: {
			num: Number($("#all_box #numche").val()),
			name: $("#all_box #nameche").val(),
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {

			let con = "";
			re.map((se) => {

				con += `<tr>
							<td><input
								class="form-check-input border-1 border-dark delche"
								type="checkbox" value="" id="flexCheckChecked" >
							</td>
							<td>
								<p contenteditable="false" data-default="${count}">${count}</p>
								
							</td>
							<td>
								<p class="rowColumn" id="category_name"  contenteditable="true"
									data-default="${se.category_name}">${se.category_name}</p>
							</td>
							<td>
								<p class="rowColumn" id="category_num"  contenteditable="true"
									data-default="${se.category_num}">${se.category_num}</p>
							</td>
							<td class="hide">
								<p class="rowColumn" id="category_num" contenteditable="false"
									data-default="${se.category_seq}">${se.category_seq}</p>
							</td>
							<td>
								<button class="btn btn-danger rounded-pill del">삭제</button>
							</td>
						</tr>`;
				count--;


			});
			$("#all_box tbody").html(con);

		}


	});
	table();
}