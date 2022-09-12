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
		
		
		
$("#search_btn").click(function(e){

	$.ajax({
			url: "/ajax_search.mdo",
			type: 'POST',
			data: {
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
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});
	
	
	
});
		