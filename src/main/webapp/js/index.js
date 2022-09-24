//마이페이지 헤더 이동
function moveToCuMa(){
	location.href="/mycoupon.do";
}


$(document).ready(function() {
	console.log("HI");
	$("#chat_button").click(function() {
		let f = document.createElement('form');
		f.setAttribute('method', 'post');
		f.setAttribute('action', '/chat.do');
		document.body.appendChild(f);
		f.submit();


	});
	$("#book_addbtnmain").click(function() {
		$.ajax({
			url: "/mainnew.do",
			method: "get",
			dataType: "json",
			success: function(el) {
				let str = '';
				el.map((neb) => {
					neb.book_price = Number(neb.book_price);
					str += `
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                            <input type="hidden" id="seq" value="${neb.book_seq}"/>
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_bigimgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        new</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="bookdetail.do?book_seq=${neb.book_seq}">${neb.book_title}</a>
                                    <span class="text-primary me-1">${neb.book_price.toLocaleString('ko-KR')}원</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="bookdetail.do?book_seq=${neb.book_seq}"><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a id="cart" class="text-body" ><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
                       
                    
                    
                       `;
				});
				$("#tab-1 .g-4").append(str);
				$("#book_addbtn").remove();
			}
		})

	});
	$("#book_addbtnmain2").click(function() {

		$.ajax({
			url: "/mainbest.do",
			method: "get",
			dataType: "json",
			success: function(el) {
				let str = '';
				el.map((neb) => {
					console.log(neb.book_price);
					neb.book_price = Number(neb.book_price);
					console.log(neb.book_price);
					str += `
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                            <input type="hidden" id="seq" value="${neb.book_seq}"/>
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_bigimgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        new</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="bookdetail.do?book_seq=${neb.book_seq}">${neb.book_title}</a>
                                    <span class="text-primary me-1">${neb.book_price.toLocaleString('ko-KR')}원</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="bookdetail.do?book_seq=${neb.book_seq}"><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a  id="cart" class="text-body" ><i
                                                class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>            
                       `;
				});

				$("#tab-2 .g-4").append(str);
				$("#book_addbtn2").remove();
			}
		})

	});
	$("#search_btn").click(function() {

		$("#main_search").toggleClass("hide");
	});
	$(document).on("click", "#cart", function(e) {
		console.log($(e.target).parents(".fadeInUp").children().children("#seq").val());
		$.ajax({
			url: "/cartadd.do",
			method: "get",
			data: {
				book_seq: Number($(e.target).parents(".fadeInUp").children().children("#seq").val())
			},
			dataType: "json",
			success: function(re) {
				console.log(re);
				Swal.fire({
					text: "장바구니에 담았습니다.",
					icon: "success"
				})
//				alert("장바구니에 담았습니다.");
			},
			error: function(re) {
				console.log(re);
				if (re.responseText != "실패") {
					if (re.responseText != "중복") {
						Swal.fire({
							text: "장바구니에 담았습니다.",
							icon: "success"
						})
//						alert("장바구니에 담았습니다.");
					} else {
						Swal.fire({
							text: "장바구니에 이미 존재합니다.",
							icon: "warning"
						})
//						alert("장바구니에 이미 존재 합니다.");
					}

				} else {
					Swal.fire({
						text: "로그인하고 장바구니 이용해주세요.",
						icon: "warning"
					})
//					alert("로그인하고 장바구니 이용 해주세요");
				}
			}
		})
	})

});



