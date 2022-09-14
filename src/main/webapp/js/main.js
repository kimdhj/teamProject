(function($) {
	"use strict";

	// Spinner
	var spinner = function() {
		setTimeout(function() {
			if ($("#spinner").length > 0) {
				$("#spinner").removeClass("show");
			}
		}, 1);
	};
	spinner();

	// Initiate the wowjs
	new WOW().init();

	// Fixed Navbar
	$(window).scroll(function() {
		if ($(window).width() < 992) {
			if ($(this).scrollTop() > 45) {
				$(".fixed-top").addClass("bg-white shadow");
			} else {
				$(".fixed-top").removeClass("bg-white shadow");
			}
		} else {
			if ($(this).scrollTop() > 45) {
				$(".fixed-top").addClass("bg-white shadow").css("top", -45);
			} else {
				$(".fixed-top").removeClass("bg-white shadow").css("top", 0);
			}
		}
	});

	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$(".back-to-top").fadeIn("slow");
		} else {
			$(".back-to-top").fadeOut("slow");
		}
	});
	$(".back-to-top").click(function() {
		$("html, body").animate({ scrollTop: 0 });
	});
})(jQuery);

$(document).ready(function() {
	$.ajax({
		url: "/navicon.do",
		method: "get",
		dataType: "json",
		success: function(el) {
			console.log(el);
			$.ajax({
				url: "/navList.mdo",
				method: "get",
				dataType: "json",
				success: function(re) {
					console.log(re);
					re.map((el)=>{});
					$("#navfore").append()
					$("#navko").append();
					$("nav #logo img").attr("src", el.icon_file);
					console.log($(".sidebar-head .logo-wrapper .logo"));
					$(".sidebar-head .logo-wrapper .logo").css("background-image", `url(${el.icon_file})`);
					$(".sidebar-head .logo-wrapper .logo").css("background-size", `cover`);
					console.log($("nav #logo").html());
					$("body").css("display", "block");
				}
			})


		}
	})
})