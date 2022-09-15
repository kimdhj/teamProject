$(document).ready(function() {
	let count = 0;
	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$(".delche:checked").click(function() {
		// 해제시 전체 클릭 비활성화
		$(".allche").prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($(".item").length == $(".delche:checked").length) {
			$(".allche").prop("checked", true);
		}
	});
	//  전체 클릭 클릭시 전체온오프
	$(".allche").click(function() {
		if ($(".allche").is(":checked")) {
			$(".delche").prop("checked", true);
		} else {
			$(".delche").prop("checked", false);
		}
	});
	// checked 초기화
	$(".delche").prop("checked", false);
	$(".allche").prop("checked", false);
	// 상단 탭 버튼





	//클릭된거 전체 삭제
	$(document).on('click', '#seldel', function() {

		let codelist = [];
		$(".delche").map((che, el) => {

			if ($(el).is(':checked')) {
				codelist.push(Number($(el).next().val()));

			}

		});
	console.log("author-seq"+codelist);
		$.ajax({
			url: "/concerndel.do",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				author_seq: codelist
			},
			success: function(e) {

				make();
			},
			error: function(e) {
make();

			}
		});
	});
	function make() {
		let count = 0;
		$.ajax({
			url: "/concerncount.do",
			method: "get",
			dataType: 'json',
			async: false,
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
					pa += ` <li class="page-item"><a class="page-link"  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>`;
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

						pa += `<li class="page-item"><a class="page-link" >${i}</a></li>`;
					}
					if (Number($("#page").val()) == i) {

						pa += `<li class="page-item"><a class="page-link active" >${i}</a></li>`;
					}




				}
				if (Number($("#page").val()) < re / 5) {
					pa += `<li class="page-item"><a class="page-link"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>`;
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
			url: "/concernlist.do",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				page: $("#page").val(),
			},
			success: function(re) {
	console.log(re);
				let con = "";
				re.map((it) => {

					con += `<div id="table_item" class="row item">
                <div class="col-1">
                  <input class="form-check-input delche" type="checkbox" value="" id="flexCheckDefault">
                  <input type="number" class="hide" value="${it.author_seq}" id="author_seq"/>
                </div>
                <div onclick="location.href='/booklist.do/author_seq=${it.author_seq}'" class="col-5">${it.author_name}</div>
                <div class="col">${it.concern_writer_date}</div>
              </div>`;
					count--;


				});
				$("#table_items").html(con);

			}
		});
	}
	$(document).on('click', '.page-link', makeDisplay);
	//태그 클릭에 따른 제한
	function makeDisplay(e) {
	
		console.log($(e.target).text());
		

		if ($(e.target).text().trim() == "«") {
			$("#page").val(Number($("#page").val()) - 1);
		} else if ($(e.target).text().trim() == "»") {
			$("#page").val(Number($("#page").val()) + 1);
		} else {
			$("#page").val(Number($(e.target).text()));
		}
	console.log("page",$("#page").val());
		make();
	}
})