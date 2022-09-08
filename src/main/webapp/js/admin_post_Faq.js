$(function() {
	$("#level1").change(function() {
		if ($("#level1").val() == "주문/결제") {
			$(".form-select1").removeClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "배송/수령일 안내") {
			$(".form-select2").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "반품/교환/환불") {
			$(".form-select3").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "회원") {
			$(".form-select4").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
		} else if ($("#level1").val() == "") {
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		}
//		console.log($("#level1").val());
	});
});

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
			text: "해당 FAQ 를 삭제하시겠습니까?",
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
					console.log($(e.target).parents('tr').children("td:eq(1)").html());
					var seq = $(e.target).parents('tr').children("td:eq(1)").children('input').val();
					seq = parseInt(seq);
					console.log(seq);
					location.href="/faqDelete.mdo?FAQ_seq=" + seq;
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	})
	
//	$(".del").click(function(e) {
//
//		$(this).parents('tr').remove();
//	})
	
	
	// 선택 된 요소 삭제
	$(".chkbox").click(function(e){
	});
	$(".seldel").click(function() {
		var chk_arr = [];
		Swal.fire({
			text: "선택한 FAQ 를 삭제하시겠습니까?",
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
					url: "/faqChkbox.mdo",
					type: "GET",
					data: {"FAQ_seq" : chk_arr},
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
					location.href="/admin_post_Faq.mdo";
				})
			}else if(result.isDismissed){
				return false;
			}
		})

//		console.log($('.delche:checked'))
//		$('.delche:checked').parents('tr').remove();
//		$('.allche').removeAttr('checked');
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
	// checked 초기화
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
// 페이지 네이션 화면 이동
$(document).on('click', '#all_box #page a', makeDisplay);

// 검색
$("#all_box #search_btn").click(function(e){
	$("#all_box #askche").val(null);
	$("#all_box #seqche").val(0);
	$("#all_box #pageche").val(1);
	$("#all_box #bigsortche").val(null);
	$("#all_box #smallsortche").val(null);
	
//	console.log($("#all_box #level1").val());
	
//	console.log($("#level2").val());
	if($("#all_box #level1").val() == ""){
//		console.log($("#level1").val());
//		console.log($("#bigsortche").val());
//		console.log($("#bigsortche").val($("#all_box #level1").val()));
		
		($("#bigsortche").val());
		$("#askche").val($("#search").val());
		$("#search").val('');
		
//		if($("#smallsortche").val() == ""){
//			$("#askche").val($("#ask").val());
//		}
		
	}else if($("#all_box #level1").val() == "주문/결제"){
		($("#bigsortche").val($("#all_box #level1").val()));
		
		if($("#level2").val() == "주문"){
		}else if($("#level2").val() == "결제"){
		}else if($("#level2").val() == "포인트"){
		}else if($("#level2").val() == "쿠폰"){
		}else if($("#level2").val() == "기타"){
		}else if($("#level2").val() == "전체"){
		}
		
		$("#smallsortche").val($("#all_box #level2").val());
		$("#askche").val($("#search").val());
		$("#search").val('');
		
	}else if($("#all_box #level1").val() == "배송/수령일 안내"){
		($("#bigsortche").val($("#all_box #level1").val()));
		
		if($("#level3").val() == "배송료"){
		}else if($("#level3").val() == "배송안내"){
		}else if($("#level3").val() == "기타"){
		}else if($("#level3").val() == "전체"){
		}
		
		$("#smallsortche").val($("#all_box #level3").val());
		$("#askche").val($("#search").val());
		$("#search").val('');
		
	}else if($("#all_box #level1").val() == "반품/교환/환불"){
		($("#bigsortche").val($("#all_box #level1").val()));
		
		if($("#level4").val() == "주문취소/변경"){
		}else if($("#level4").val() == "반품/교환/환불"){
		}else if($("#level4").val() == "주의사항"){
		}else if($("#level4").val() == "전체"){
		}
		
		$("#smallsortche").val($("#all_box #level4").val());
		$("#askche").val($("#search").val());
		$("#search").val('');
		
	}else if($("#all_box #level1").val() == "회원"){
		($("#bigsortche").val($("#all_box #level1").val()));
		
		if($("#level5").val() == "회원가입/탈퇴"){
		}else if($("#level5").val() == "회원정보 확인/변경"){
		}else if($("#level5").val() == "개인정보 유효기간제"){
		}else if($("#level5").val() == "기타"){
		}else if($("#level5").val() == "전체"){
		}
		
		$("#smallsortche").val($("#all_box #level5").val());
		$("#askche").val($("#search").val());
		$("#search").val('');
	}
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

// 내용 변경
function make(){
	let count = 0;
	$.ajax({
		url: "/faqCount.mdo",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			seq: Number($("#all_box #seqche").val()),
			page: Number($("#all_box #pageche").val()),
			ask: $("#all_box #askche").val(),
			bigsort: $("#all_box #bigsortche").val(),
			smallsort: $("#all_box #smallsortche").val()
		},
		success: function(re){
			console.log("countRE", re);
			count = re;
			
//			count =  count - ($("#all_box #pageche").val()); 
			count = 1 + ($("#all_box #pageche").val() - 1) * 5;
//			console.log(($("#all_box #pageche").val()));
			console.log("count" + count);
			
			let pa = "";
			if(Number($("#all_box #pageche").val()) > 1){
				pa += `<li class="page-item"> <a class="page-link">< </a></li>`;
			}
			
			if(re % 5 == 0){
				re--;
			}
			console.log(Number($("#all_box #pageche").val()), re / 5 + 1);
			
			if(Number($("#all_box #pageche").val()) > re / 5 + 1){
				$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
			}
			
			let page = Number($("#all_box #pageche").val());
			let startpage = 0;
			let endpage = 0;
			
			if(page < 3){
				startpage = 1;
			}else{
				startpage = page - 2;
			}
			
			if(page + 2 > re / 5 + 1){
				endpage = re / 5 + 1;
			}else{
				endpage = page + 2;
			}
			
			for(let i = startpage; i <= endpage; i++){
				if (Number($("#all_box #pageche").val()) != i){
					pa += `<li class="page-item"><a class="page-link" href="#">${i} </a></li>`;
				}
				if(Number($("#all_box #pageche").val()) == i){
					pa += `<li class="page-item active" aria-current="page"><a href="#" class="page-link">${i}</a></li>`;
				}
			}
			if(Number($("#all_box #pageche").val()) < re / 5){
				pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
			}
			$("#all_box .pagination").html(pa);
		}
	});
	console.log($("#all_box #bigsortche").val());
	console.log($("#all_box #smallsortche").val());
	console.log($("#all_box #askche").val());
	$.ajax({
		url: "/faqList.mdo",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			seq: Number($("#all_box #seqche").val()),
			page: Number($("#all_box #pageche").val()),
			ask: $("#all_box #askche").val(),
			bigsort: $("#all_box #bigsortche").val(),
			smallsort: $("#all_box #smallsortche").val()
		},
		success: function(re){
			console.log("listRE", re);
			let con="";
			re.map((faq) => {
				console.log(faq.faq_seq);
				con += 
					`
						<tr>
							<td><input class="form-check-input border-1 border-dark delche" type="checkbox" name="chkbox" id="flexCheckChecked"> </td>
							
							<td>
								<p id="seq"> ${count} </p>
								<input type="hidden" value="${faq.faq_seq }"/>
							</td>
							
							<td>
								<p class="rowColumn" id="ask">
									<a href="/admin_post_FaqDetail.mdo?FAQ_seq=${faq.faq_seq}&seq=${count}">
										${faq.faq_ask}
									</a>
								</p>
							</td>
							
							<td>
								<button class="btn btn-danger rounded-pill del">삭제</button>
							</td>
						</tr>				
					`;
				count++;
			});
//			console.log($("#all_box tbody").html(con));
			$("#all_box tbody").html(con);
		}
	});
}
