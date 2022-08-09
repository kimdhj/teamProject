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
		$("#sum_count").text(
			Number(
				$("#count")
					.text()
					.replace(/[^\d]+/g, "")
			) -
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
	$(".plus").on("click", function() {
		$(this)
			.parents()
			.children("#text_box")
			.text(Number($(this).parents().children("#text_box").text().trim()) + 1);
		init();
	});
	// 클릭하면 1보다클때 숫자 감소
	$(".minus").click(function() {
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
});
