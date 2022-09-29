function make() {
		let count = 0;
		$.ajax({
			url: "/admintrademaincount.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data:{
			
				searchkeyword: $("#searchkeyword").val(),
				searchcontent: $("#searchcontent").val(),},
			success: function(re) {
				console.log(re);
				console.log(re);
				console.log(Number($("input#page").val()), re / 5 + 1)
				if (Number($("input#page").val()) > re / 5 + 1) {
					$("#page").val(Number($("input#page").val()) - 1);
				}
				console.log("chd", $("input#page").val());
				count = re;
				count = count - (Number($("#page").val()) - 1) * 5;
				page = Number($("input#page").val());
				let pa = '';
				if (Number($("input#page").val()) > 1) {
					pa += ` <li class="page-item "><a class="page-link"> < </a></li>`;
				}


				let startpage = 0;
				let endpage = 0;
				if (page < 3) {
					startpage = 1;
				} else {
					startpage = page - 2;
				}
				if (page + 2 > re / 5 + 1) {
					endpage = re / 5 + 1;
				} else {
					endpage = page + 2;
				}
				for (let i = startpage; i <= endpage; i++) {
					if (Number($("input#page").val()) != i) {

						pa += `<li class="page-item"><a class="page-link">${i} </a></li>`;
					}
					if (Number($("input#page").val()) == i) {

						pa += `                  <li class="page-item active" aria-current="page"><a  class="page-link">${i}</a></li>`;
					}




				}
				if (Number($("input#page").val()) < re / 5) {
					pa += ` <li class="page-item"><a class="page-link">></a></li>
                `;
				}
				console.log(pa);
				console.log($(".pagination"));
				$(".pagination").html(pa);
			},
			error: function(er) {
				console.log(er);
			}
		});
		$.ajax({
			url: "/admintrademainlist.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				page:Number($("input#page").val()),
				searchkeyword: $("#searchkeyword").val(),
				searchcontent: $("#searchcontent").val(),
			},
			success: function(re) {
	console.log(re);
				let con = "";
				re.map((it) => {

					con += `<tr>
               <td>
                  <p><a href="tradeordersdetail.mdo?orders_seq=${it.orders_seq}">${it.orders_seq}</a></p>
                </td>
                <td>
                  <p >${it.user_id}</p>
                </td>
                <td>
                  <p>${it.orders_order_day}</p>
                </td>
                <td>
                  <p >${it.book_title}</p>
                </td>
                <td>
                  <p>${it.sum.toLocaleString('ko-KR')}</p>
                </td>
                <td>
                  <p><a href="admintradebooklist.mdo?order_bookList_seq=${it.order_bookList_seq}">${it.orders_status}</a></p>
                </td>
              </tr>`;
					count--;


				});
				console.log($("tbody"));
				$("tbody").html(con);

			}
		});
	}
	//숫자만
	// contentche : 검색, stateche : select id 임
	$(document).on("propertychange change paste input keyUp keyDown","#contentche,#stateche",function(){
	var datetime_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; 

	if($("#stateche").val().trim()=="orders_seq"||$("#stateche").val().trim()=="checksum"){
		$("#contentche").val($("#contentche").val().replace(/[^0-9]/g,'')) ; 
	}
	
	// 숫자바꾸기
	if($("#stateche").val().trim()=="orders_order_day"){
	  $('#contentche').prop("type", "date");
	}else{
	 $('#contentche').prop("type", "text");
	}

	})
	
	$(document).on('click', '.page-link', makeDisplay);
	//태그 클릭에 따른 제한
	function makeDisplay(e) {
	
			console.log("pagef",$("input#page").val());
		

		if ($(e.target).text().trim() == "<") {
			$("input#page").val(Number($("input#page").val()) - 1);
		} else if ($(e.target).text().trim() == ">") {
			$("input#page").val(Number($("input#page").val()) + 1);
		} else {
			$("input#page").val(Number($(e.target).text()));
		}
	console.log("input#page",$("input#page").val());
		make();
	}
	$(document).on("click","#search_btn",function(){
	$("#searchkeyword").val($("#stateche").val().trim());
	$("#searchcontent").val($("#contentche").val().trim());
	$("input#page").val(Number(1));
	console.log($("#searchkeyword").val(),$("#searchcontent").val())

	make();
	})
	