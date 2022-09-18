



//상품 수정 페이지 이동
function upd_product(upd){
	console.log($(upd).parents("tr").children("td:eq(1)").children("p").text().trim());
	
	$.ajax({
			url: "/product_Update.mdo",
			method: "POST",
			data: {
				book_seq : $(upd).parents("tr").children("td:eq(1)").children("p").text().trim()
			},
			success: function(e) {

				
			},
			error: function(e) {


			}
		});
	

}
	



//체크된 항목 삭제
function del_pick() {
	let codelist = [];
		$(".del_chk").map((che, el) => {

			if ($(el).is(':checked')) {
				console.log($(el).parents("tr").children('td:eq(1)').children('p').text().trim());
				codelist.push($(el).parents("tr").children('td:eq(1)').children('p').text().trim());
			}

		});
		console.log(codelist);
		$.ajax({
			url: "/del_chk.mdo",
			method: "POST",
			data: {
				codelist
			},
			success: function(e) {

				location.href = "/getProductList.mdo";
			},
			error: function(e) {


			}
		});
}

//전체 선택
function selectAll(selectAll){
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

// 상품 삭제
function del_product(obj) {

	console.log($(obj).parents("tr").children("td:eq(1)").children("p").text());
	let cq = $(obj).parents("tr").children("td:eq(1)").children("p").text();

	$.ajax({
			url: "/del_product.mdo",
			type: 'POST',
			data: {
				book_seq: Number(cq)
			},
			success: function(data) {
				
				location.href = "/getProductList.mdo";
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});

}
		
		
//검색버튼클릭시 - 테이블갱신 - 페이징 갱신		
$("#search_btn").click(function(e){
	 
	 console.log($("#Hpage").val());
	 console.log($("#sort").val());
	 console.log($("#searchThing").val());
	 
	 $("#Hpage").val(1);
	 

	 
	 
	 
	$.ajax({
			url: "/ajax_search.mdo",
			type: 'POST',
			data: {
				Hpage: Number($("#Hpage").val()),
				Hsort: $("#sort").val(),
				Hthing: $("#searchThing").val()
			},
			success: function(data) {
				console.log("검색버튼 결과"+data);
				let con="";
				data.map((pro) => {
				con+=
				`<tr>
								<td><input type="checkbox" class="del_chk" name="del_chk"></td>
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
									<button type="button" id="upd_product" name="upd_product" onclick="upd_product(this)">수정</button>
								</td>
								<td>
									<button type="button" id="del_one" name="del_one" onclick="del_product(this)">삭제</button>
								</td>
							</tr>
				`;

				});
				$("tbody").html(con);
				
				
				console.log($("#now").text());
				console.log($("#sort").val());
				console.log($("#searchThing").val());
				
				$("#Hsort").val($("#sort").val());
				$("#Hthing").val($("#searchThing").val());
				
				countt();
				
				$("#Hpage").val($("#now").text());
				
				//검색했는데 유지되어있는 전체 선택 체크박스 해제
				console.log($("#all_pick").is(":checked"));
					if ($("#all_pick").is(":checked")) {
						$("#all_pick").prop("checked",false);
					}
				
				
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
				console.log($("#sort").val());
				console.log($("#Hpage").val());
				console.log($("#searchThing").val());
				
				if($(v.target).text()=="«"){
				$("#Hpage").val(parseInt(($("#Hpage").val()-1)/10)*10);
				}else if($(v.target).text()=="»"){
				$("#Hpage").val((parseInt(($("#Hpage").val()-1)/10)+1)*10+1);				
				}else{
				$("#Hpage").val($(v.target).text());
				}
				
				$("#Hsort").val($("#sort").val());
				$("#Hthing").val($("#searchThing").val());
				
				countt();
				
	$.ajax({
			url: "/ajax_search.mdo",
			type: 'POST',
			data: {
				Hpage: Number($("#Hpage").val()),
				Hsort: $("#Hsort").val(),
				Hthing: $("#Hthing").val()
			},
			success: function(data) {
				console.log("뷰뷰 결과"+data);
				let con="";
				data.map((pro) => {
				con+=
				`<tr>
								<td><input type="checkbox" class="del_chk" name="del_chk"></td>
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
									<button type="button" id="upd_product" name="upd_product" onclick="upd_product(this)">수정</button>
								</td>
								<td>
									<button type="button" id="del_one" name="del_one" onclick="del_product(this)">삭제</button>
								</td>
							</tr>
				`;

				});
				$("tbody").html(con);
				
				//검색했는데 유지되어있는 전체 선택 체크박스 해제
				console.log($("#all_pick").is(":checked"));
					if ($("#all_pick").is(":checked")) {
						$("#all_pick").prop("checked",false);
					}
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});

}


//게시글수 세오고 페이징 갱신
function countt() {
	$.ajax({
		url: "/ajax_count.mdo",
		method: "POST",
		dataType: "JSON",
		async: false,
		data:{
			Hpage: Number($("#Hpage").val()),
			Hsort: $("#Hsort").val(),
			Hthing: $("#Hthing").val()
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

		