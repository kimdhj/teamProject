$(document).ready(function() {
	console.log("HI");
	$("#chat_button").click(function() {

		location.href = "/chat.do"
	});
	$("#book_addbtnmain").click(function() {
		$.ajax({
			url: "/mainnew.do",
			method: "get",
			dataType: "json",
			success: function(el) {
				let str = '';
				el.map((neb) => {
					str += `
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_imgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        new</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="">${neb.book_title}</a>
                                    <span class="text-primary me-1">${neb.book_price}</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
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
					str += `
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="product-item h-80">
                                <div class="position-relative bg-light h-100 overflow-hidden">
                                    <img height="100%"  class="w-100" src="${neb.book_imgURL}" alt="">
                                    <div
                                        class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                        new</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="">${neb.book_title}</a>
                                    <span class="text-primary me-1">${neb.book_price}</span>
                                   
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href=""><i class="fa fa-eye text-primary me-2"></i>상세보기</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href=""><i
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

});



