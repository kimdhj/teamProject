/**
 * 
 */
$(document).ready(function() {
	let count = 0;
	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$(".delche:checked").click(function() {
		// 해제시 전체 클릭 비활성화
		$(".allche").prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($("#all_box tbody>tr").length == $(".delche:checked").length) {
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
	$("#all").click(function() {
		$("#all").removeClass("unselect");
		$("#all").addClass("select");
		$("#category").removeClass("select");
		$("#category").addClass("unselect");

		$("#cate_box").hide();
		$("#all_box").show();
	});
	$("#category").click(function() {
		$("#category").removeClass("unselect");
		$("#category").addClass("select");
		$("#all").removeClass("select");
		$("#all").addClass("unselect");
		$("#all_box").hide();
		$("#cate_box").show();
	});
	$('#cre_cou_btn').click(function() {
		$($("#cate_box #name").val().trim());
		$("#cate_box #Coupon_count").val();
		$("#cate_box #Coupon_effect").val();

		if ($("#cate_box #name").val().trim() && $("#cate_box #Coupon_count").val() > 0 && $("#cate_box #Coupon_effect").val() > 0) {
			$.ajax({
				url: "macoupon.mdo",
				dataType: "json",
				method: "post",
				data: {
					count: $("#cate_box #Coupon_count").val(),
					coupon_name: $("#cate_box #name").val().trim(),
					coupon_effect: $("#cate_box #Coupon_effect").val()

				},
				success: function(e) {
				}


			})
		}

	});
	//검색
	$("#all_box #add_btn").click(function(e) {
		$("#all_box #nameche").val('');
		$("#all_box #numche").val('');
		$("#all_box #pageche").val(1);
		let count = 0;
		$("#all_box #nameche").val($("#all_box #name").val());
		$("#all_box #numche").val($("#all_box #num").val());

		make();



	});
	//클릭된거 전체 삭제
	$(document).on('click', '#seldel', function() {

		let codelist = [];
		$(".delche").map((che, el) => {

			if ($(el).is(':checked')) {
				codelist.push($(el).parents("tr").children('td:eq(3)').text().trim());

			}

		});
		$.ajax({
			url: "/dellist.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				codelist
			},
			success: function(e) {

				make();
			},
			error: function(e) {


			}
		});
	});
	
	// 클릭해서 삭제
	$(document).on('click', ".del", function(e) {
		let coupon_code = $(this).parents("tr").children('td:eq(3)').text().trim();
		$.ajax({
			url: "/coupondel.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				coupon_code
			},
			success: function(e) {
				make();
			},
			error: function(e) {

			}
		});
	});
	//버튼 클릭시 실행
	$(document).on('click', '#all_box #page a', makeDisplay);
	//태그 클릭에 따른 제한
	function makeDisplay(e) {

		if ($(e.target).text().trim() == "<") {
			$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
		} else if ($(e.target).text().trim() == ">") {
			$("#all_box #pageche").val(Number($("#all_box #pageche").val()) + 1);
		} else {
			$("#all_box #pageche").val(Number($(e.target).text()));
		}

		make();
	}
	//화면 만들기
	function make() {
		let count = 0;
		$.ajax({
			url: "/couponcount.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				coupon_code: $("#all_box #numche").val(),
				coupon_name: $("#all_box #nameche").val(),
				page: Number($("#all_box #pageche").val())
			},
			success: function(re) {
			
			if (re % 5 == 0) {
					re--;
				}
				if (Number($("#all_box #pageche").val()) >re / 5 + 1) {
					$("#all_box #pageche").val(Number($("#all_box #pageche").val())-1);
				}
				count = re;
				count = count - (Number($("#all_box #pageche").val()) - 1) * 5;
				page = Number($("#all_box #pageche").val());
				let pa = '';
				if (Number($("#all_box #pageche").val()) > 1) {
					pa += `<li class="page-item "><a class="page-link">
									< </a></li>`;
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
					if (Number($("#all_box #pageche").val()) != i) {

						pa += `<li class="page-item"><a class="page-link"
									href="#">${i}
								</a></li>`;
					}
					if (Number($("#all_box #pageche").val()) == i) {

						pa += `<li class="page-item active" aria-current="page"><a
									href="#"
									class="page-link">${i}</a></li>`;
					}




				}
				if (Number($("#all_box #pageche").val()) < re / 5) {
					pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
				}
				$("#all_box .pagination").html(pa);
			},
			error: function(er) {
			}
		});
		$.ajax({
			url: "/couponlist.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				coupon_code: $("#all_box #numche").val(),
				coupon_name: $("#all_box #nameche").val(),
				page: Number($("#all_box #pageche").val())
			},
			success: function(re) {

				let con = "";
				re.map((cou) => {

					con += `<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked">

								</td>
								<td>
									<p contenteditable="false" data-default="${count}">${count}</p>

									<c:set var="count" value="${count - 1}" />
								</td>
								<td>
									<p  data-default="${cou.coupon_name}">${cou.coupon_name}</p>
								</td>
								<td>
									<p contenteditable="false" data-default="${cou.coupon_code}">${cou.coupon_code}</p>
								</td>
								<td>
									<p contenteditable="false" data-default="${cou.coupon_effect}">${cou.coupon_effect}<span>%</span>
									</p>
								</td>

								<td>

									<button class="btn btn-danger rounded-pill del">삭제</button>

								</td>

							</tr>`;
					count--;


				});
				$("#all_box tbody").html(con);

			}
		});
	}

})