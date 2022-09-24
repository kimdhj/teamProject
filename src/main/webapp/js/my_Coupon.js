//혜성 추가
function goGetPoint(){
	location.href="/goGetPoint.do";
}


$(function() {
	$("#coupon_add").click(function() {
		$("#coupon_popUp").removeClass("hide");
	});
	$("#popup_close").click(function() {
		$("#coupon_popUp").addClass("hide");
	});
	$("#coupon_insert").click(function() {
		$("#coupon_popUp").addClass("hide");
	});
	function make() {
		let count = 0;
		$.ajax({
			url: "/mycouponcount.do",
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
				$("#discount .pagination").html(pa);
			},
			error: function(er) {
				console.log(er);
			}
		});
		$.ajax({
			url: "/mycouponlist.do",
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
					console.log(it.user_coupon_date);

					con += `<div id="table_item" class="row">
                <div class="col-4">${it.user_coupon_date}</div>
                <div class="col">${it.user_coupon_name}</div>
                <div class="col">${it.user_coupon_effect}%</div>
              </div>`;
					count--;


				});
				$("#discount #items").html(con);

			}
		});
	}
	$(document).on('click', '#discount .page-link', makeDisplay);
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
		console.log("page", $("#page").val());
		make();
	}
	//포인트 페이징 처리
	$("#allpoints").on("click", function() {
		$("#statep").val(Number(0));
		makep();
	})
	$("#pluspoints").on("click", function() {
		$("#statep").val(Number(1));
		makep();
	})
	$("#usepoints").on("click", function() {
		$("#statep").val(Number(-1));
		makep();
	})
	$(document).on("propertychange change paste input keyUp keyDown", "#date", function() {


		let today = new Date();
		let date = new Date(today);

		date.setMonth(date.getMonth() - Number($("#date").val()));
		$("#points_datep").val(date.toJSON());

		console.log($("#points_datep").val());
	})
	$("#coupon_insert").on("click", function() {
		console.log($("#cou_code").val());
		$.ajax({
			url: "/couponadd.do",
			method: "get",
			dataType: 'json',
			data: {coupon_code:$("#cou_code").val()},
			success: function(da) {
				if(da==0){
					Swal.fire({
						text: "쿠폰 번호를 확인해주세요.",
						icon: "warning"
					})
//				alert("쿠폰 번호를 확인해주세요.");
				}else if(da==1){
					Swal.fire({
						text: "쿠폰이 등록되었습니다.",
						icon: "success"
					})
//				alert("쿠폰 등록 되었습니다.");
				make();
				}else{
				location.href="/index.do"
				}
			 }
		})
	})
	function makep() {
		let countp = 0;
		$.ajax({
			url: "/mypointscount.do",
			method: "get",
			dataType: 'json',
			data: {
				state: $("#statep").val(),
				points_date: $("#points_datep").val()
			},
			async: false,
			success: function(rep) {
				console.log(rep);
				console.log(rep);
				console.log(Number($("#pagep").val()), rep / 5 + 1)
				if (Number($("#pagep").val()) > rep / 5 + 1) {
					$("#pagep").val(Number($("#pagep").val()) - 1);
				}
				console.log("chd", $("#pagep").val());
				countp = rep;
				countp = countp - (Number($("#pagep").val()) - 1) * 5;
				pagep = Number($("#pagep").val());
				let pap = '';
				if (Number($("#pagep").val()) > 1) {
					pap += ` <li class="page-item"><a class="page-link"  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>`;
				}


				let startpagep = 0;
				let endpagep = 0;
				if (pagep < 3) {
					startpagep = 1;
				} else {
					startpagep = pagep - 2;
				}
				if (pagep + 2 > rep / 5 + 1) {
					endpagep = rep / 5 + 1;
				} else {
					endpagep = pagep + 2;
				}
				for (let ip = startpagep; ip <= endpagep; ip++) {
					if (Number($("#pagep").val()) != ip) {

						pap += `<li class="page-item"><a class="page-link" >${ip}</a></li>`;
					}
					if (Number($("#pagep").val()) == ip) {

						pap += `<li class="page-item"><a class="page-link active" >${ip}</a></li>`;
					}




				}
				if (Number($("#pagep").val()) < rep / 5) {
					pap += `<li class="page-item"><a class="page-link"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>`;
				}
				console.log(pap);
				console.log($(".pagination"));
				$("#pointMoney .pagination").html(pap);
			},
			error: function(erp) {
				console.log(erp);
			}
		});
		$.ajax({
			url: "/mypointslist.do",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				page: $("#pagep").val(),
				state: $("#statep").val(),
				points_date: $("#points_datep").val()
			},
			success: function(rep) {
				console.log(rep);
				let conp = "";
				rep.map((itp) => {
					itp.points_count = itp.points_count.toLocaleString('ko-KR');

					conp += ` <div id="table_item" class="row">
                <div class="col-4 text-center">
                  ${itp.points_date}
                </div>
                <div class="col-4 text-center">${itp.points_content}</div>
                <div class="col-4 text-center">${itp.points_count}P</div>
              </div>`;
					countp--;


				});
				$("#pointMoney #itemsp").html(conp);

			}
		});
	}
	$(document).on('click', '#pointMoney .page-link', makeDisplayp);
	//태그 클릭에 따른 제한
	function makeDisplayp(e) {

		console.log($(e.target).text());


		if ($(e.target).text().trim() == "«") {
			$("#pagep").val(Number($("#pagep").val()) - 1);
		} else if ($(e.target).text().trim() == "»") {
			$("#pagep").val(Number($("#pagep").val()) + 1);
		} else {
			$("#pagep").val(Number($(e.target).text()));
		}
		console.log("page", $("#pagep").val());
		makep();
	}
})
