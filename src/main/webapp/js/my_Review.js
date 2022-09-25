console.log("rate" + Number(6) - Number($("#star").val()));
$(".star").map((ind,el)=>{
	let star = "rate" + (Number(6) - Number($(el).val()));// jsp 에서 star 의 값(value) 구해와서 6 에서 차감해주고,
	
	star = "#" + star; // rate 랑 합쳐서 문자열로 만들어줌(jsp 에서 id="rateN" 형식)
	console.log($(el).next());
	$(el).next().children(star).attr("checked", "true"); // star 에 chcekd 속성을 추가 (true : 추가, false : 추가안함)

});

// ajax 별점 변화 감지
function reloadstar(){
	console.log("아무거나 : ");
	$(".star").map((ind,el)=>{
		let star = "rate" + (Number(6) - Number($(el).val()));// jsp 에서 star 의 값(value) 구해와서 6 에서 차감해주고,
		
		star = "#" + star; // rate 랑 합쳐서 문자열로 만들어줌(jsp 에서 id="rateN" 형식)
		$(el).next().children(star).attr("checked", "true"); // star 에 chcekd 속성을 추가 (true : 추가, false : 추가안함)
	});
	console.log("아무거나 : ");
}




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
								console.log(jqXHR+"아"+ textStatus+"아"+ errorThrown);
								}
							});
	
	location.href="/movingReview.do";
	
}

//페이징 메소드
$(document).on('click', '#table_bottom .pagination a', viewview);

function viewview(e){
	console.log($(e.target).text().trim());
	//이동 전 현재 페이지
	let st = $("#st").val();
	console.log("전 페이지"+st);
	//클릭 한 a태그 값
	let pst = $(e.target).text().trim();
	//이동 할 페이지
	let nst = 0;
	if(pst=="«"){
		nst = (parseInt((st-1)/5))*5;
	}else if(pst=="»"){
		nst = (parseInt((st-1)/5)+2)*5-4;
	}else{
		nst = pst;
		console.log("숫자클릭"+nst+"pst"+pst);
	}
	console.log("숫자클릭익"+nst+"pst"+pst);
	//이동 할 페이지의 게시글 범위
	let cst = parseInt((nst-1)*5);
	console.log("클릭후 게시글 범위"+cst);
	$.ajax({
		url: "/ajax_rerecount.do",
		method: "POST",
		dataType: "JSON",
		async: false,
		data:{
			user_id: $("#user_id").val(),
			st: cst,
		},
		success: function(data){
			let con="";
			data.map((rev) => {
			con+=
				`<div id="table_item" class="row">
							<div class="col-2">${rev.reply_date }
								<input type="hidden" value="${rev.order_bookList_seq }"> 
							</div>
							<div class="col-2">${rev.book_title }</div>
							<div class="col"><a href="/myreviewUpdate.do?book_seq=${rev.book_seq }&order_bookList_seq=${rev.order_bookList_seq}">${rev.reply_cotent }</a></div>
							<div class="col-1"><input type="hidden" value="${rev.reply_seq }"></div>
							<div id="starBox" class="col-1">
								<form name="myform" id="myform" method="post" action="./save">
              					  <b>별점</b><input type="number" class="hide star" value="${rev.reply_point }" id="star" name="reply_point" />
              					  <fieldset>
               					   <input type="radio" name="rating" value="5" id="rate1"> <label for="rate1">⭐</label>
             					     <input type="radio" name="rating" value="4" id="rate2"> <label for="rate2">⭐</label>
             					     <input type="radio" name="rating" value="3" id="rate3"> <label for="rate3">⭐</label>
             					     <input type="radio" name="rating" value="2" id="rate4"> <label for="rate4">⭐</label> 
           					       <input type="radio" name="rating" value="1" id="rate5"> <label for="rate5">⭐</label>
        					        </fieldset>
       					       </form>
							</div>
							<div class="col-1"><button type="button" class="btn-close" aria-label="Close" onclick="delmyre(this);"></button></div>
						</div>
				`;
			});
			$("#fordol").html(con);
			//별점 반응 시킬 메소드 추가
			reloadstar();
			let startpage = parseInt((nst-1)/5)*5+1;
			console.log("포시작"+startpage);
			let endpage = parseInt((nst-1)/5)*5+5;
			console.log("포끝"+endpage);
			let fullpage = $("#fullpage").val();
			if(endpage>fullpage){
				endpage=fullpage;
			}
			let go = "";
			
			if(startpage != 1){
				go += `<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a></li>`;
			}
			for(let k=startpage; k<=endpage; k++ ){
				if(nst == k){
					go += `<li class="page-item active"><a class="page-link" href="#" id="now">${k}</a></li>`;
					}else if(nst != k){
					go += `<li class="page-item"><a class="page-link" href="#">${k}</a></li>`;
					}
			}
			if(endpage != fullpage){
				go += `<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>`;
			}
			
			
			$(".pagination").html(go);
			

			
			$("#st").val(nst);
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error while post');
			}
	});
	
}


