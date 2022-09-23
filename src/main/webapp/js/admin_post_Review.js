
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



	$(".oneqjawns").map((e, ind) =>{
		$(ind).text($(ind).text().trim().substring(0, 7) + "...");
	})




// document : 현재 html 화면
// on : 동작이 일어날 때
// .contentClick 을 click 할 때 해당 function 이 일어남
// 이걸 처리해줘야 페이징으로 이동했을 때 실행 가능 -> 페이징 처리하는 이벤트 생각하면 쉬움
$(document).on("click", ".qjawnsno",function(){
	
//	$(".form1").removeClass("hide");
	
	console.log($(this).parents('tr').children('td:eq(1)').children('input').val());
	let seq = $(this).parents('tr').children('td:eq(1)').children('input').val();
	let id =  $(this).parents('tr').children('td:eq(2)').children('input').val();
	let name =  $(this).parents('tr').children('td:eq(3)').children('input').val();
	let birth =  $(this).parents('tr').children('td:eq(4)').children('input').val();
	let title =  $(this).parents('tr').children('td:eq(5)').children('input').val();
	
	let content =  $(this).parents('tr').children('td:eq(6)').children("#recontent").html();
	console.log($(this).parents('tr').children('td:eq(6)').children("#recontent"));
	let date =  $(this).parents('tr').children('td:eq(7)').children('p').text();
	let sub =  $(this).parents('tr').children('td:eq(8)').children('p').text();
	
	console.log("여기부터");
	console.log($("#book_title").text());
	console.log(seq);
	console.log(id);
	console.log(name);
	console.log(birth);
	console.log(title);
	console.log(content);
	console.log(date);
	console.log(sub);
	
	if($(".form1").hasClass("hide")){ // hide 가 있으면 
//		$(".form1").toggle();
		$(".form1").removeClass("hide"); // hide 를 지워서 리뷰를 띄운다.
	}else if(seq == $("#reply_seq").text()){ // hide 없고, 값을 받은 seq 랑 jsp 에서의 #reply_seq 의 값이 같다면
		$(".form1").addClass("hide"); // hidd 를 추가해서 리뷰를 지운다.
	} // 받아온 let seq 값과 jsp 에서의 #reply_seq 값이 다를 수 있기 때문에, seq 값을 저장하는 코드 위에서 진행 -> 누르는 seq 값에 따라 설정 가능
	
	$("#reply_seq").text(seq);
	$("#book_title").text(title);
	$("#user_id").text(id);
	$("#user_name").text(name);
	$("#user_birth").text(birth);
	$("#user_sub").text(sub);
	$("#reply_date").text(date);
	$("#book_title").text(title);
	$("#content1").html(content);
	console.log($("#reply_seq").text());
	
//	$(".form1").toggle();
	
	console.log("왜 안되냐");
});
//console.log($(this).parents("#table_user_content").next().hasClass('hide'));
//let ch = $(this).parents("#table_user_content").next().hasClass('hide');
//$(".fold").addClass("hide");
//$(this).parents("#table_user_content").next().toggleClass("hide");
//
//if(!ch){
//	$(this).parents("#table_user_content").next().addClass("hide");
//}



// 날짜 더하기
$("#start_date").val(new Date());
let date = new Date();
date.setMonth(date.getMonth() + 1);

$("#end_date").val(date);
datePickerSet($("#start_date"), $("#end_date"), true); // 다중은 시작하는 달력 먼저, 끝달력
														// 2번째
// var date2 = $('#start_dat').datepicker('getDate', '+1d');
// date2.setDate(date2.getDate() + 1);
// $('.dropoffDate').datepicker('setDate', date2)

/*
 * 달력 생성기 @param sDate 파라미터만 넣으면 1개짜리 달력 생성 @example
 * datePickerSet($("#datepicker"));
 * 
 * 
 * @param sDate, @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음 @example
 * datePickerSet($("#datepicker1"), $("#datepicker2"));
 */
function datePickerSet(sDate, eDate, flag) {

	// 시작 ~ 종료 2개 짜리 달력 datepicker
	if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
			&& eDate.length > 0) {
		let sDay = sDate.val();
		let eDay = eDate.val();

		if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { // 처음 입력 날짜 설정,
																// update...
			let sdp = sDate.datepicker().data("datepicker");
			console.log("flag");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요

			let edp = eDate.datepicker().data("datepicker");
			edp.selectDate(new Date(eDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요
		}

		// 시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
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

		// 종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
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

		// 한개짜리 달력 datepicker
	} else if (!isValidStr(sDate)) {
		let sDay = sDate.val();
		if (flag && !isValidStr(sDay)) { // 처음 입력 날짜 설정, update...
			let sdp = sDate.datepicker().data("datepicker");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요
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

$(document).ready(function() {
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
			text: "해당 리뷰를 삭제하시겠습니까?",
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
					var seq = Number($(e.target).parents('tr').children('td:eq(1)').children('input').val());
					console.log("삭제번호", seq);
					location.href="/ReplyDelete.mdo?reply_seq=" + seq;
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
			text: "선택한 리뷰를 삭제하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
		}).then((result)=>{
			console.log("예예예예예예");
			if(result.isConfirmed){
				console.log("ㅇ아아");
				console.log("되라",$("input"));
				$("input[name='chkbox']:checked").map((ine,el)=>{
	    			// .text() -> .children("input").val();
					var seq = $(el).parents('tr').children('td:eq(1)').children('input').val();
					chk_arr.push(seq);
					console.log(chk_arr);
				})
				console.log("안돼 ", chk_arr);
				$.ajax({
					url: "/replyChkbox.mdo",
					type: "GET",
					async: false,
					data: {"reply_seq" : chk_arr},
					success: function(data){
						$('.delche:checked').parents('tr').remove();
						$('.allche').removeAttr('checked');
						Swal.fire({
							text: "삭제되었습니다.",
		                	icon: "success",
		                	showConfirmButton: false,
		                	timer: 1500,
						}).then(function(){
							location.href="/ReplyList.mdo";
						})
					}
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	});	
	
	// 클릭해서 블라인드
	$(document).on("click", ".blind", function(e){
		Swal.fire({
			text: "해당 리뷰를 블라인드 처리하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
		}).then((result) => {
			if(result.isConfirmed){
				Swal.fire({
					text: "처리되었습니다.",
	            	icon: "success",
	            	showConfirmButton: false,
	            	timer: 1500,
				}).then(function(){
					var seq = Number($(e.target).parents('tr').children('td:eq(1)').children('input').val());
					console.log("블라인드 번호", seq);
					location.href="/ReplyBlind.mdo?reply_seq=" + seq;
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	})
	
	$(document).on("click", ".blindCancel", function(e){
		Swal.fire({
			text: "블라인드 처리를 해제하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
		}).then((result) => {
			if(result.isConfirmed){
				Swal.fire({
					text: "처리되었습니다.",
	            	icon: "success",
	            	showConfirmButton: false,
	            	timer: 1500,
				}).then(function(){
					var seq = Number($(e.target).parents('tr').children('td:eq(1)').children('input').val());
					console.log("블라인드 번호", seq);
					location.href="/ReplyBlindCancel.mdo?reply_seq=" + seq;
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	})
	
	
	// 선택 된 요소 블라인드
	$(".chkbox").click(function(e){
	});
	$(".allblind").click(function() {
		var chk_arr = [];
		Swal.fire({
			text: "선택한 리뷰를 블라인드 처리하시겠습니까?",
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
					var seq = $(el).parents('tr').children('td:eq(1)').children('input').val();
					chk_arr.push(seq);
					console.log(chk_arr);
				})
				$.ajax({
					url: "/chkboxBlind.mdo",
					type: "GET",
					async: false,
					data: {"reply_seq" : chk_arr},
					success: function(data){
						Swal.fire({
							text: "삭제되었습니다.",
		                	icon: "success",
		                	showConfirmButton: false,
		                	timer: 1500,
						}).then(function(){
							location.href="/ReplyList.mdo";
						})
					}
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	});	
	
	$(".chkbox").click(function(e){
	});
	$(".allBlind").click(function() {
		var chk_arr = [];
		Swal.fire({
			text: "선택한 리뷰를 블라인드 처리 해제하시겠습니까?",
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
					var seq = $(el).parents('tr').children('td:eq(1)').children('input').val();
					chk_arr.push(seq);
					console.log(chk_arr);
				})
				$.ajax({
					url: "/chkboxBlindCancel.mdo",
					type: "GET",
					async: false,
					data: {"reply_seq" : chk_arr},
					success: function(data){
						Swal.fire({
							text: "삭제되었습니다.",
							icon: "success",
							showConfirmButton: false,
							timer: 1500,
						}).then(function(){
							location.href="/ReplyList.mdo";
						})
					}
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	});	
	
	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$('.delche:checked').click(function() {
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
	
	// checked 초기화 - 삭제
	$('.delche').prop("checked", false);
	$('.allche').prop("checked", false);
	
	// 하단에 있는 카테고리 홍보 코드
	// 리셋 버튼 코드 초기화
	$('.reset').click(function(e) {
		$(this).parents('tr').children('td:eq(3)').children().text('default');
		$(this).parents('tr').children('td:eq(3)').children().attr("data-default", "default");
	})
	// 코드 변화 감지에 따른 행동
	observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			console.log();
			$(mutation.target).parents('tr').children('td:eq(1)').children().text('default')
		});
	});
	const num = document.getElementsByClassName('num');
	for (let i = 0; i < num.length; i++) {
		observer.observe(document.getElementsByClassName('num')[i], { childList: true });
	}
})

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
	$("#all_box #idche").val(null);
	$("#all_box #nameche").val(null);
	$("#all_box #birthche").val(null);
	$("#all_box #titleche").val(null);
	$("#all_box #contentche").val(null);
	$("#all_box #publishche").val(null);
	$("#all_box #authorche").val(null);
	$("#all_box #subche").val(null);
	$("#all_box #blankche").val(0);
	$("#all_box #startDateche").val(null);
	$("#all_box #endDateche").val(null);
	
	$("#all_box #startDateche").val($("#all_box #start_date").val());
	$("#all_box #endDateche").val($("#all_box #end_date").val());
	console.log($("#all_box #startDateche").val());
	console.log($("#all_box #endDateche").val());
	
	console.log($("#all_box #subche").val());
	
	// 정규표현식
	let check = /^[0-9]+$/;

	
	if($("#level").val() == "ID"){
		$("#all_box #idche").val($("#search").val());
		
		console.log("여기부터");
		console.log($("#level").val());
		console.log($("#all_box #idche").val());
		console.log($("#all_box #idche").val($("#search").val()));
		console.log($("#search").val());
		console.log("여기까지");
		
	}else if($("#level").val() == "이름"){
		$("#all_box #nameche").val($("#search").val());
		
	}else if($("#level").val() == "생년월일"){
		$("#all_box #birthche").val($("#search").val());
		
	}else if($("#level").val() == "책제목"){
		$("#all_box #titleche").val($("#search").val());
		
	}else if($("#level").val() == "내용"){
		$("#all_box #contentche").val($("#search").val());
	
	}else if($("#level").val() == "회원등급"){
		$("#all_box #subche").val($("#search").val());
	
//		if($("#search").val() == "일반" || $("#search").val() == "일"){ // 일반
//			$("#all_box #subche").val($("#search").val("일반"));
//		}else if($("#search").val() == "구독" || $("#search").val() == "구"){ // 구독
//			$("#all_box #subche").val($("#search").val("구독"));
//			
//		}
		
	}else if($("#level").val() == "블라인드 댓글"){
		$("#all_box #blankche").val($("#search").val())
		
		
	}
	
	if($("#all_box #start_date").val() != null){
		$("#all_box #startDateche").val($("#all_box #start_date").val());
	}if($("#all_box #end_date").val() != null){
		$("#all_box #endDateche").val($("#all_box #end_date").val());
	}
	
	make();
});

//화면 구성
function makeDisplay(e) {
	console.log(isNaN($("#pageche")));
	console.log($("#pageche").val());
	
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
	console.log($("#pageche").val())
	let count = 0;
	$.ajax({
		url: "/replyCount.mdo",
		method: "get",
		dataType: 'json',
		async: false,
		data: {
			seq : Number($("#all_box #seqche").val()),
			page : Number($("#all_box #pageche").val()),
			id : $("#all_box #idche").val(),
			name : $("#all_box #nameche").val(),
			birth : $("#all_box #birthche").val(),
			title : $("#all_box #titleche").val(),
			content : $("#all_box #contentche").val(),
			publish : $("#all_box #publishche").val(),
			author : $("#all_box #authorche").val(),
			sub : $("#all_box #subche").val(),
			blank : $("#all_box #blankche").val(), // boolean 값
			startDate : $("#all_box #startDateche").val(),
			endDate : $("#all_box #endDateche").val(),
			date : $("#all_box #dateche").val()
			
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
		url: "/replyList.mdo",
		method: "GET",
		dataType: 'json',
		async: false,
		data: {
			seq : Number($("#all_box #seqche").val()),
			page : Number($("#all_box #pageche").val()),
			id : $("#all_box #idche").val(),
			name : $("#all_box #nameche").val(),
			birth : $("#all_box #birthche").val(),
			title : $("#all_box #titleche").val(),
			content : $("#all_box #contentche").val(),
			publish : $("#all_box #publishche").val(),
			author : $("#all_box #authorche").val(),
			sub : $("#all_box #subche").val(),
			blank : $("#all_box #blankche").val(), // boolean 값
			startDate : $("#all_box #startDateche").val(),
			endDate : $("#all_box #endDateche").val(),
			date : $("#all_box #dateche").val(),
		},
		success: function(re) {
			console.log("ListRe", re);
			let con = "";
			re.map((reply) => {
				con += `
							<tr>
							<td><input class="form-check-input border-1 border-dark delche chkbox" name="chkbox" type="checkbox" id="flexCheckChecked"></td>
								</td>
								<td>
									<p id="seq">${count}</p>
									<input type="hidden" value="${reply.reply_seq }" name="reply_seq"/>
								</td>
								<td>
									<p class="rowColumn" id="id">${reply.user_id }</p>
									<input type="hidden" value="${reply.user_id }" name="user_id"/>
								</td>
								<td>
									<p class="selectColumn" id="name">${reply.user_name }</p>
									<input type="hidden" value="${reply.user_name }" name="user_name"/>
								</td>
								<td>
									<p class="rowColumn" id="birth">${reply.user_birth}</p>
									<input type="hidden" value="${reply.user_birth}" name="user_birth"/>
								</td>
								<td>`
								console.log("1",reply.book_title);
								if(reply.book_title.length > 7){
									title = reply.book_title.substring(0, 6); console.log("2",title);
									con += `<p class="rowColumn" id="title">${title }...</p>`
								}else{
									con += `<p class="rowColumn" id="title">${reply.book_title }</p>`
								}
								con += `
									<input type="hidden" value="${reply.book_title}" name="book_title"/>
								</td>
								<td>
									<p id="content">
                                     <div class="qjawnsno oneqjawns">
                                      ${reply.reply_cotent }
                                    </div>
                                    </p>
                                    
                                    <div class="hide" id="recontent">
                                      ${reply.reply_cotent}
                                    </div>
								</td>
								<td>
									<p class="rowColumn" >${reply.reply_date }
                                    </p>
                                    <input type="hidden" value="${reply.reply_date }" name="reply_date"/>
								</td>
								<td>`
									if(reply.user_sub == "0"){
										con += `<p class="rowColumn" id="sub">일반</p>`
									}else if(reply.user_sub == "1"){
										con += `<p class="rowColumn" id="sub">구독</p>`
									}
							con +=	`
									<input type="hidden" value="${reply.user_sub }" name="user_sub"/>
									<td>`
									if(reply.user_blank == false){
							con +=	`<button class="btn btn-danger rounded-pill blind">처리</button>`
									}else if(reply.user_blank == true){
							con	+=	`<button class="btn btn-outline-danger rounded-pill blindCancel">처리 완료</button>`
									}
						con+=	`</td>
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
			$(".oneqjawns").map((e, ind) =>{
				$(ind).text($(ind).text().trim().substring(0, 7) + "...");
			})
//			console.log("con: " + con);
//			console.log("공지사항 목록 : " + $("#all_box tbody").html());
		}
	});
}