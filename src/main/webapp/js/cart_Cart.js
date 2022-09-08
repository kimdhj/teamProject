$(document).ready(function() {
	init();
	console.log("Hi");
	// 값들을 형식에 맞게 계산
	function init() {
		console.log("Hi");
		let sum = 0;
		$.each($(".plus"), function(e, el) {
			$(el)
				.parents()
				.siblings("#money_count")
				.children(".money")
				.text(
					Number(
						$(this)
							.parents()
							.children("#text_box")
							.text()
							.replace(/[^\d]+/g, "")
							.trim()
					) *
					Number(
						$(this)
							.parents()
							.siblings("#money_count")
							.children("#book_solo")
							.text()
							.replace(/[^\d]+/g, "")
					)
				);
		});
		$.each($(".money"), function(e, el) {
			sum =
				Number(sum) +
				Number(
					$(el)
						.text()
						.replace(/[^\d]+/g, "")
				);
			$("#count").text(sum);
			$(el).text(
				$(el)
					.text()
					.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,")
			);
			$("#count").text(
				$("#count")
					.text()
					.trim()
					.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,")
			);
		});
		$("#delivery_count").text(
			$("#delivery_count")
				.text()
				.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,")
		);
		if (Number($("#count").text().replace(/[^\d]+/g, "")) > 50000) {
			$("#delivery_count").text("0")
		} else {
			$("#delivery_count").text("2,500")
		}
		$("#sum_count").text(

			Number(
				$("#count")
					.text()
					.replace(/[^\d]+/g, "")
			) +
			Number(
				$("#delivery_count")
					.text()
					.replace(/[^\d]+/g, "")
			)
		);
		$("#sum_count").text(
			$("#sum_count")
				.text()
				.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,")
		);
	}
	// 클릭하면 숫자증가
	$(".plus").on("mousedown", function() {
		$(this)
			.parents()
			.children("#text_box")
			.text(Number($(this).parents().children("#text_box").text().trim()) + 1);
		init();
	});
	// 클릭하면 1보다클때 숫자 감소
	$(".minus").mousedown(function() {
		if (Number($(this).parents().children("#text_box").text().trim()) > 1) {
			$(this)
				.parents()
				.children("#text_box")
				.text(
					Number($(this).parents().children("#text_box").text().trim()) - 1
				);
		}
		init();
	});
	$("#seldel").click(function() {
		let num = [];
		console.log($(".form-check-input").parents("#main_item").children("#boseq"));
		$(".form-check-input").map((el, it) => {
			if ($(it).is(":checked")) {
				console.log($(it).parents("#main_item").children("#boseq").val());
				num.push(Number($(it).parents("#main_item").children("#boseq").val()));
			};

		});
		$.ajax({
			url: "/cartdel.do",
			method: "get",
			dataType: "json",
			data: {
				book_seq: num
			},
			success: function(re) {
				console.log(re);
				
				
				},
			error: function(ee) {
				console.log(ee);
			$(".form-check-input").map((el, it) => {
			if ($(it).is(":checked")) {
				console.log($(it).parents("#main_item").prev("#line"));
				$(it).parents("#main_item").prev("#line").remove();
				$(it).parents("#main_item").remove();
				init();
				
			};

		});
		if($(".main_item").length<=0){
			location.href="/index.do";
		}
			}
		});
	});
});
$(".plus").mouseup(function(e){
$(e.target).parents("#main_item").children("#bocount").val($(e.target).parents("#plus_box").prev().text().trim());
});
$(".minus").mouseup(function(e){
$(e.target).parents("#main_item").children("#bocount").val($(e.target).parents("#minus_box").next("#text_box").text().trim());
});
