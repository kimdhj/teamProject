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
	let iconstate = false;
	$.ajax({
		url: "/navicon.do",
		method: "get",
		dataType: "json",
		success: function(el) {
		
			if($("nav #logo img")!=null){
			$("nav #logo img").attr("src", el.icon_file);
			
			$(".sidebar-head .logo-wrapper .logo").css("background-image", `url(${el.icon_file})`);
			$(".sidebar-head .logo-wrapper .logo").css("background-size", `cover`);
			}
			iconstate = true;
			if(navstate&&mypagestate&&iconstate){
		
			$("body").css("display", "block");
			}

		}
	})
	let navstate = false;
	$.ajax({
		url: "/navList.mdo",
		method: "get",
		dataType: "json",
		success: function(re) {
		
			let navfore = ``;
			let navko = ``;
			re.map((el) => {
				navfore += `<a href="/booklist.do?category=${el.category_num}" class="dropdown-item">${el.nav_category_name}</a>`;
				navko += `<a href="/booklist.do?category=${el.category_num}" class="dropdown-item">${el.nav_category_name}</a>`;
			});
			if($("#navfore")!=null){
			$("#navfore").append(navfore)
			$("#navko").append(navko);
			}
			navstate = true;
			if(navstate&&mypagestate&&iconstate){
		
			$("body").css("display", "block");
			}
		}
	})
	let mypagestate = false;
	$.ajax({
		url: "/getmyuser.do",
		method: "get",
		dataType: "json",
		success: function(el) {
		if(el!=null){
			console.log(el)
			$(".fa-user").addClass("lime")
		}
			$("#mypage_name_header").text(el.user_name);
			$("#mypage_coupon_header").text(el.user_enabled);
			$("#mypage_point_header").text(el.user_point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		mypagestate=true;
		if(navstate&&mypagestate&&iconstate){
		
			$("body").css("display", "block");
			}

		},
		error: function(el) {
			mypagestate=true;
			if(navstate&&mypagestate&&iconstate){
		
			$("body").css("display", "block");
			}
		}
	})

})
$(document).on("click","#subcancel",function(){

})