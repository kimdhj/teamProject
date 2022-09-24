console.log("rate" + Number(6) - Number($("#star").val()));
let star = "rate" + (Number(6) - Number($("#star").val())); // jsp 에서 star 의 값(value) 구해와서 6 에서 차감해주고,
star = "#" + star; // rate 랑 합쳐서 문자열로 만들어줌(jsp 에서 id="rateN" 형식)
$(star).attr("checked", "true"); // star 에 chcekd 속성을 추가 (true : 추가, false : 추가안함)


function delmyre(g){
	console.log($(g).parents("#table_item").children("div:eq(3)").children("input").val());
	let reseq = $(g).parents("#table_item").children("div:eq(3)").children("input").val();
	
	$.ajax({
		    				url : "/ajax_delmyre.do",
		    				type : 'POST',
							async : false,
							data : {
								reply_seq : reseq
							},
							success: function(res) {
								alert("선택하신 리뷰가 삭제 되었습니다!");
							},
							error: function(jqXHR, textStatus, errorThrown) {
								console.log('error while post');
								}
							});
	
	location.href="/movingReview.do";
	
}

//페이징 메소드
$(document).on('click', '#table_bottom .pagination a', viewview);

function viewview(e){
	console.log($(e.target).text().trim());
	
	$.ajax({
		url: "/ajax_recount.mdo",
		method: "POST",
		dataType: "JSON",
		async: false,
		data:{
			Hpage: Number($("#Hpage").val()),
		},
		success: function(co){
			
		}
	});
	
}




//게시글수 세오고 페이징 갱신
function countt() {
	$.ajax({
		url: "/ajax_recount.mdo",
		method: "POST",
		dataType: "JSON",
		async: false,
		data:{
			Hpage: Number($("#Hpage").val()),
		},
		success: function(co){
		
			console.log("count 결과값"+co);
			
			//게시글 수
			let count = co;
			
			//현재 페이지
			let page = $("#Hpage").val();
			//최대 페이지
			let fullpage = 0;
			if(count%20 ==0) {
				fullpage=parseInt(count/20);
			}else if(count%20 !=0) {
				fullpage=parseInt(count/20) +1;
			}
			//최대페이지 나누기 10
			let wherepage = parseInt((page-1)/10);
			// 현재 시작 페이지
			let startpage = wherepage*10 +1;
			// 현재 끝 페이지
			let endpage = wherepage*10 +10;
			// 현재 최대 끝 페이지
			if(endpage>fullpage) {
				endpage=fullpage;
			}
			
			let go = "";
			
			console.log("page : "+ page);
			console.log("startpage : "+ startpage);
			console.log("endpage : "+ endpage);
			console.log("fullpage : "+ fullpage);
			console.log("wherepage : "+ wherepage);
			console.log("count : "+ count);
			
			if(startpage != 1){
				go += `<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a></li>`;
			}
			for(let k=startpage; k<=endpage; k++ ){
				if(page == k){
					go += `<li class="page-item active"><a class="page-link" href="#" id="now">${k}</a></li>`;
					}else if(page != k){
					go += `<li class="page-item"><a class="page-link" href="#">${k}</a></li>`;
					}
			}
			if(endpage != fullpage){
				go += `<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>`;
			}
			
			
			$(".pagination").html(go);
			
		}
	});
}
