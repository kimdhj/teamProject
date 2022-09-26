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
			
			let sb ="";
			if(el.user_sub ==1){
				sb +=
				`<button type="button" id="subcancel" class="btn btn-secondary btn-sm float-end" onclick="location.href='/my_cancelSub.do';">구독취소</button>`;
			}else{
				sb +=
					`<button type="button" id="substart" class="btn btn-primary btn-sm float-end" onclick="location.href='/event_Sub_Info.do';">구독하기</button>`;
			}
			$("#showbutton").html(sb);
			
		mypagestate=true;
		if(navstate&&mypagestate&&iconstate){
		
			$("body").css("display", "block");
			}
			$(".sidebar-user__title").text(el.user_id);
			
			$(".logo-subtitle").text(el.user_name);
			if(el.user_role=="ROLE_MASTER"){
			$(".sidebar-user__subtitle").text("낭만 감독관");
			$("picture").children("source").attr("srcset","/img/avatar/avatar-illustrated-03.webp");
			$("picture").children("img").attr("src","/img/avatar/avatar-illustrated-03.png");
			}else if(el.user_role=="ROLE_ADMIN"){
			$(".sidebar-user__subtitle").text("낭만 감시자");
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