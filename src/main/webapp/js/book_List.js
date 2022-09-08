(function($) {


	// Spinner
	var spinner = function() {
		setTimeout(function() {
			if ($('#spinner').length > 0) {
				$('#spinner').removeClass('show');
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
				$('.fixed-top').addClass('bg-white shadow');
			} else {
				$('.fixed-top').removeClass('bg-white shadow');
			}
		} else {
			if ($(this).scrollTop() > 45) {
				$('.fixed-top').addClass('bg-white shadow').css('top', -45);
			} else {
				$('.fixed-top').removeClass('bg-white shadow').css('top', 0);
			}
		}
	});


	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.back-to-top').fadeIn('slow');
		} else {
			$('.back-to-top').fadeOut('slow');
		}
	});
	$('.back-to-top').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 500);
		return false;
	});


	// Testimonials carousel
	$(".testimonial-carousel").owlCarousel({
		autoplay: true,
		smartSpeed: 1000,
		margin: 25,
		loop: true,
		center: true,
		dots: false,
		nav: true,
		navText: [
			'<i class="bi bi-chevron-left"></i>',
			'<i class="bi bi-chevron-right"></i>'
		],
		responsive: {
			0: {
				items: 1
			},
			768: {
				items: 2
			},
			992: {
				items: 3
			}
		}
	});


})(jQuery);
$(document).ready(function(e) {
	$(document).on('click', ".book .pagination a", function() {

		//초기화
		if ($(this).text().trim() == "<") {
			$("#bookpage").val(Number($("#bookpage").val()) - 1);
		} else if ($(this).text().trim() == ">") {
			$("#bookpage").val(Number($("#bookpage").val()) + 1);
		} else {
			$("#bookpage").val(Number($(this).text().trim()));
		}
	
		$.ajax({
			url: "/updatebook.do",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				page: Number($("#bookpage").val()),
				country:Number($("#country").val()),
				category: Number($("#category").val()),

			},
			success: function(re) {
				
				let str = '';
				re.list.map((bo) => {
				let price=bo.book_price.toLocaleString('ko-KR')
					str += `<div id="item" class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>`
				});
				str+=`<input type="hidden" value="${re.vo.title}" id=" booktitle" /> <input
							value="${re.vo.page}" type="hidden"
							id="bookpage" />`;
				str += `<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">`;
				if (re.vo.page != 1) {
					str += `<li class="page-item "><a class="page-link"> < </a></li>`;
				}
				
				for (let i = re.startpage; i <= re.endpage; i++) {
				
					if (re.vo.page != i) {
						str += `<li class="page-item"><a class="page-link"  >${i}
										</a></li>`;
					}


					if (re.vo.page == i) {
						str += `<li class="page-item active" aria-current="page"><a
											  class="page-link">${i}</a></li>`;
					}
				}



				if (re.vo.page < re.maxpage) {
					str += `<li class="page-item"><a class="page-link"  >></a></li>`;
				}
				str += `
							</ul>
						</nav>`;
			
			$(".book").html(str);
			


			}
		})

	});
	$(document).on('click', ".new .pagination a", function(e) {
		if ($(this).text().trim() == "<") {
			$("#newpage").val(Number($("#newpage").val()) - 1);
		} else if ($(this).text().trim() == ">") {
			$("#newpage").val(Number($("#newpage").val()) + 1);
		} else {
			$("#newpage").val(Number($(this).text().trim()));
		}
	
			$.ajax({
			url: "/updatenewbook.do",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				page: Number($("#newpage").val()),
				country:Number($("#country").val()),
				category: Number($("#category").val()),

			},
			success: function(re) {
				
				let str = '';
				re.newlist.map((bo) => {
				let price=bo.book_price.toLocaleString('ko-KR')
					str += `<div id="item" class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>`
				});
				str+=`<input type="hidden" value="${re.vo.title}" id=" newtitle" /> <input
							value="${re.vo.page}" type="hidden"
							id="newpage" />`;
				str += `<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">`;
				if (re.vo.page != 1) {
					str += `<li class="page-item "><a class="page-link"> < </a></li>`;
				}
				
				for (let i = re.newstartpage; i <= re.newendpage; i++) {
				
					if (re.vo.page != i) {
						str += `<li class="page-item"><a class="page-link"  >${i}
										</a></li>`;
					}


					if (re.vo.page == i) {
						str += `<li class="page-item active" aria-current="page"><a
											  class="page-link">${i}</a></li>`;
					}
				}



				if (re.vo.page < re.newmaxpage) {
					str += `<li class="page-item"><a class="page-link"  >></a></li>`;
				}
				str += `
							</ul>
						</nav>`;
			
			$(".new").html(str);
			


			}
		})

	});

	$(document).on('click', ".best .pagination a", function(e) {
		if ($(this).text().trim() == "<") {
			$("#bestpage").val(Number($("#bestpage").val()) - 1);
		} else if ($(this).text().trim() == ">") {
			$("#bestpage").val(Number($("#bestpage").val()) + 1);
		} else {
			$("#bestpage").val(Number($(this).text().trim()));
		}
		
			$.ajax({
			url: "/updatebestbook.do",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				page: Number($("#bestpage").val()),
				category: Number($("#category").val()),
				country:Number($("#country").val())

			},
			success: function(re) {
				
				let str = '';
				re.bestlist.map((bo) => {
				let price=bo.book_price.toLocaleString('ko-KR')
					str += `<div id="item" class="row">
								<div class="col-2">
									<a><img width="100%" class="img_booklist_kr"
										src="${bo.book_imgURL} " /></a>
								</div>
								<div class="col-7">
									<div class="row">
										<h4>${bo.book_title}</h4>
									</div>
									<div id="best_price" class="row">
										<h5>${price}원</h5>
									</div>
									<div id="best_context" class="row">${bo.book_descript}</div>
								</div>
								<div class="col-3 d-flex flex-column justify-content-around">
									<div id="purchase01" class="row">
										<a class="w-100 p-0" href="/bookdetail.do?book_seq=${bo.book_seq}"><button class="btnSubmit w-100">
											구매하기
										</button></a>
										<br>
									</div>
									<div id="purchase02" class="row">
										<button class="btnSubmit">
											<a>장바구니 추가</a>
										</button>
									</div>
								</div>
							</div>
							<input type="hidden" value="${bo.book_seq}">
							<hr>`
				});
				str+=`<input type="hidden" value="${re.vo.title}" id="besttitle" /> <input
							value="${re.vo.page}" type="hidden"
							id="bestpage" />`;
				str += `<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">`;
				if (re.vo.page != 1) {
					str += `<li class="page-item "><a class="page-link"> < </a></li>`;
				}
				
				for (let i = re.beststartpage; i <= re.bestendpage; i++) {
				
					if (re.vo.page != i) {
						str += `<li class="page-item"><a class="page-link"  >${i}
										</a></li>`;
					}


					if (re.vo.page == i) {
						str += `<li class="page-item active" aria-current="page"><a
											  class="page-link">${i}</a></li>`;
					}
				}



				if (re.vo.page < re.bestmaxpage) {
					str += `<li class="page-item"><a class="page-link"  >></a></li>`;
				}
				str += `
							</ul>
						</nav>`;
			
			$(".best").html(str);
			


			}
		})
		
	});
	//구매하기 버튼
	$(document).on('click','#purchase01 .btnSubmit',function(e){
		console.log($(e.target).parents("div#item").next().val(),1);
	});
	//장바구니 버튼
	$(document).on('click','#purchase02 .btnSubmit',function(e){
		
		$.ajax({
			url: "/cartadd.do",
			method: "get",
			data: {
				book_seq: Number($(e.target).parents("div#item").next().val())
			},
			dataType: "json",
			success: function(re) {
				console.log(re);
				alert("장바구니에 담았습니다.");
			},
			error: function(re) {
				console.log(re);
				if (re.responseText != "실패") {
					if (re.responseText != "중복") {
						alert("장바구니에 담았습니다.");
					} else {
						alert("장바구니에 이미 존재 합니다.");
					}

				} else {
					alert("로그인하고 장바구니 이용 해주세요");
				}
			}
		})
	});
	



})
