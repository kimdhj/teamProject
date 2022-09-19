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
				console.log(Number($("#page").val()), re / 5 + 1)
				if (Number($("#page").val()) > re / 5 + 1) {
					$("#page").val(Number($("#page").val()) - 1);
				}
				console.log("chd", $("#page").val());
				count = re;
				count = count - (Number($("#page").val()) - 1) * 5;
				page = Number($("#page").val());
				let pa = '';
				if (Number($("#page").val()) > 1) {
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
					if (Number($("#page").val()) != i) {

						pa += `<li class="page-item"><a class="page-link">${i} </a></li>`;
					}
					if (Number($("#page").val()) == i) {

						pa += `                  <li class="page-item active" aria-current="page"><a  class="page-link">${i}</a></li>`;
					}




				}
				if (Number($("#page").val()) < re / 5) {
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
				page:Number($("#page").val()),
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
                  <p><fmt:formatNumber value="${it.sum}" pattern="#,###" /></p>
                </td>
                <td>
                  <p><a href="admintradebooklist.mdo?order_bookList_seq=${it.order_bookList_seq}">${it.orders_status}</a></p>
                </td>
              </tr>`;
					count--;


				});
				$("tbody").html(con);

			}
		});
	}
	//숫자만
	$(document).on("propertychange change paste input keyUp keyDown","#contentche,#stateche",function(){
	var datetime_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; 

	if($("#stateche").val().trim()=="orders_seq"||$("#stateche").val().trim()=="checksum"){
		$("#contentche").val($("#contentche").val().replace(/[^0-9]/g,'')) ; 
	}
	
	if($("#stateche").val().trim()=="orders_order_day"){
	  $('#contentche').prop("type", "date");
	}else{
	 $('#contentche').prop("type", "text");
	}

	})
	$(document).on('click', '.page-link', makeDisplay);
	//태그 클릭에 따른 제한
	function makeDisplay(e) {
	
		console.log($(e.target).text());
		

		if ($(e.target).text().trim() == "<") {
			$("#page").val(Number($("#page").val()) - 1);
		} else if ($(e.target).text().trim() == ">") {
			$("#page").val(Number($("#page").val()) + 1);
		} else {
			$("#page").val(Number($(e.target).text()));
		}
	console.log("page",$("#page").val());
		make();
	}
	$(document).on("click","#search_btn",function(){
	$("#searchkeyword").val($("#stateche").val().trim());
	$("#searchcontent").val($("#contentche").val().trim());
	$("#page").val(Number(1));
	console.log($("#searchkeyword").val(),$("#searchcontent").val())

	make();
	})
	