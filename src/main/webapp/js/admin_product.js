function tableDelete(obj) {
	var tr = $(obj).parent().parent();
	var del = $(obj).next().val();
	var rs = $(obj).next().next().val();

	var rrs = rs.indexOf('룰렛');
	var srs = rs.indexOf('구독');
	var con = confirm("룰렛, 구독이벤트는 삭제하지 않는것이 좋습니다. 정말 삭제하시겠습니까?");


	if(con == true){

		$.ajax({
			url: "/ajax_del.mdo",
			type: 'POST',
			data: {
				del: del
			},
			success: function(data) {
				console.log(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});
		tr.remove();
					}
}
		
		
//검색버튼클릭시 - 테이블갱신 - 페이징 갱신		
$("#search_btn").click(function(e){
	let count=0;
	 
	$.ajax({
			url: "/ajax_search.mdo",
			type: 'POST',
			data: {
				page: $("#page").val(),
				sort: $("#sort").val(),
				thing: $("#searchThing").val()
			},
			success: function(data) {
				console.log(data);
				let con="";
				data.map((pro) => {
				con+=
				`<tr>
								<td><input type="checkbox" id=""></td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_seq }">${pro.book_seq }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_title }">${pro.book_title }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.author_seq } . ${pro.book_author}">${pro.author_seq } . ${pro.book_author}</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="${pro.book_publish }">${pro.book_publish }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_remain }">${pro.book_remain }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="${pro.book_price.toLocaleString('ko-KR') }원">${pro.book_price.toLocaleString('ko-KR') }원</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.category_num }">${pro.category_num }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_publish_date }">${pro.book_publish_date }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_sellCount }">${pro.book_sellCount }</p>
								</td>
								<td>
									<button type="button" id="del_one">삭제</button>
								</td>
							</tr>
				`;

				});
				$("tbody").html(con);
				
				countt();
				
				
				$("#page").val($("#now").text());
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});
	
	
	
});

//페이징 클릭시 뷰뷰실행
$(document).on('click', '#pppp #reload a', viewview);


//페이징만 이동
function viewview(v){
	console.log($(v.target).text());
			$("#page").val($(v.target).text());
	countt();
}


//게시글수 세오고 페이징 갱신
function countt() {
	let count = 0;
	$.ajax({
		url: "/ajax_count.mdo",
		method: "POST",
		dataType: "JSON",
		async: false,
		data:{
			page: $("#page").val(),
			sort: $("#sort").val(),
			thing: $("#searchThing").val()
		},
		success: function(co){
			//게시글 수
			count = co;
			
			//현재 페이지
			let page = $("#page").val();
			//최대 페이지
			let fullpage = 0;
			if(count%20 ==0) {
				fullpage=count/20;
			}else if(count%20 !=0) {
				fullpage=count/20 +1;
			}
			//최대페이지 나누기 10
			let wherepage = parseInt(page/10);
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

		