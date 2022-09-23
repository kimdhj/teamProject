$(function() {
	$("#add_Address").click(function() {
		$("#coupon_popUp").removeClass("hide");
	});
	$("#popup_close").click(function() {
		$("#coupon_popUp").addClass("hide");
	});
	$("#Address_Add").click(function() {
		$("#coupon_popUp").addClass("hide");
	});
	$("#add_find").click(function() {
		console.log("hi");
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ""; // 주소 변수
				var extraAddr = ""; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === "R") {
					// 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else {
					// 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("my_delivery_zipcode").value = data.zonecode;
				document.getElementById("my_delivery_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("my_delivery_remain_address").focus();
			},
		}).open();
	});
});
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
				console.log()
				codelist.push(Number($(el).parents("#table_item").children("div:eq(0)").children("input").val()));

			}

		});
		console.log("author-seq" + codelist);
		$.ajax({
			url: "/deliverydel.do",
			method: "get",
			dataType: 'json',

			data: {
				delivery_seq: codelist
			},
			success: function(e) {

				make();
			},
			error: function(e) {
				make();

			}
		});
	});
	//주소지 등록
	$(document).on('click', '#add', function() {

		let codelist = [];
		$(".delche").map((che, el) => {

			if ($(el).is(':checked')) {
				console.log()
				codelist.push(Number($(el).parents("#table_item").children("div:eq(0)").children("input").val()));

			}

		});
		if (codelist.length != 1) {
			Swal.fire({
				text: "한 개만 선택해주세요.",
				icon: "warning"
			})
//			alert("한 개만 선택해주세요");
			return;
		}
		console.log("author-seq" + codelist);
		$.ajax({
			url: "/onsdelivery.do",
			method: "get",
			dataType: 'json',

			data: {
				my_delivery_seq: codelist[0]
			},
			success: function(e) {

				make();
			},
			error: function(e) {
				make();

			}
		});
	});
	//추가 함수
	$("#Address_Add").click(function() {
		if ($("#my_delivery_nickname").val().length <= 5 && $("#my_delivery_name").val().length <= 5 && $("#my_delivery_phone").val().length == 11 && /^([0-8]).{0,20}$/.test($("#my_delivery_phone").val()) && $("#my_delivery_zipcode").val() != "" && $("#my_delivery_zipcode").val() != null && $("#my_delivery_address").val() != "" && $("#my_delivery_address").val() != null) {
//			alert("정규식");
			return;
		}
		$.ajax({
			url: "/indelivery.do",
			method: "get",
			dataType: 'json',
			data: {
				my_delivery_address: $("#my_delivery_address").val(),
				my_delivery_nickname: $("#my_delivery_nickname").val(),
				my_delivery_remain_address: $("#my_delivery_remain_address").val(),
				my_delivery_zipcode: $("#my_delivery_zipcode").val(),
				my_delivery_name: $("#my_delivery_name").val(),
				my_delivery_phone: $("#my_delivery_phone").val()
			},
			success: function(re) {
				console.log("in")
				$("#page").val(Number(1));
				make();
				$("#my_delivery_address").val(null);
				$("#my_delivery_nickname").val(null);
				$("#my_delivery_remain_address").val(null);
				$("#my_delivery_zipcode").val(null);
				$("#my_delivery_name").val(null);
				$("#my_delivery_phone").val(null);
			}
		})
	})
$("#my_delivery_nickname,#my_delivery_phone,#my_delivery_name,#my_delivery_zipcode,#my_delivery_address,#my_delivery_remain_address").on("focus propertychange change paste input keyUp keyDown", function(e) {

	if ($("#my_delivery_nickname").val().length <= 15 && $("#my_delivery_name").val().length <= 15 && $("#my_delivery_phone").val().length == 11 && /^([0-8]).{0,20}$/.test($("#my_delivery_phone").val()) && $("#my_delivery_zipcode").val() != "" && $("#my_delivery_zipcode").val() != null && $("#my_delivery_address").val() != "" && $("#my_delivery_address").val() != null) {
		$("#Address_Add").removeAttr("disabled");
	}else{
	$("#Address_Add").attr("disabled","true");
	}

})
	function make() {
		let count = 0;
		$.ajax({
			url: "/deliverycount.do",
			method: "get",
			dataType: 'json',
			success: function(re) {
				if (Number($("#page").val()) > re / 5 + 1) {
					$("#page").val(Number($("#page").val()) - 1);
				}
				console.log(re);
				max = re;
				if (re % 5 == 0) {
					max = re++;
				}
				$("#max").text(Number(max));
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

				$(".pagination").html(pa);
			},
			error: function(er) {
				console.log(er);
			}
		});
		$.ajax({
			url: "/deliverylist.do",
			method: "get",
			dataType: 'json',
			data: {
				page: $("#page").val(),
			},
			success: function(re) {
				console.log(re);
				let con = "";
				re.map((it) => {

					con += `<div id="table_item" class="row">
							<div class="col-2">${it.my_delivery_nickname}<input type="number" id="sew" class="hide" value="${it.my_delivery_seq}"/></div>
							<div  class="col-2">${it.my_delivery_name}</div>
							<div class="col-3 phone">${it.my_delivery_phone}</div>
							<div class="col text-center">${it.my_delivery_address} ${it.my_delivery_remain_address}</div>
							<div class="col-2">
								<div class="form-check p-0">
									<input class="form-check-input delche" type="checkbox" value=""
										id="flexCheckChecked" >

								</div>
							</div>
						</div>`;
					count--;


				});
				$("#table_items").html(con);
				phone();
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
		console.log("page", $("#page").val());
		make();
	}
})
$(document).on("propertychange change paste input keyUp keyDown", ".phone", function(e) {
	console.log("hi");


})
$("#my_delivery_phone").on("input",function(){
$("#my_delivery_phone").val($("#my_delivery_phone").val().replace(/[^0-9]/g,''));
})

$(document).ready(function() {
	$(".phone").map((ind, el) => {

		el.innerText = el.innerText.trim().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	})
})
function phone() {
	$(".phone").map((ind, el) => {
		console.log(el.innerText)
		el.innerText = el.innerText.trim().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	})
}

