$(function() {
	$("#review_btnBox").click(function() {
		$("#bottom_detail").css("box-shadow", "");
		$("#item_detail").addClass("hide");
		$("#reviews").removeClass("hide");
	});
	$("#item_btnBox").click(function() {
		$("#bottom_detail").css("box-shadow", "0px 0px 20px gray");
		$("#reviews").addClass("hide");
		$("#item_detail").removeClass("hide");
	});

	$(document).on('click', '.page-link', function(e) {
		console.log($(e.target).text().trim());
		if ($(e.target).text().trim() == "<") {
			$("#repage").val(Number($("#repage").val()) - 1);
		} else if ($(e.target).text().trim() == ">") {
			$("#repage").val(Number($("#repage").val()) + 1);
		} else {
			$("#repage").val(Number($(e.target).text()));
		}
		let page = Number($("#repage").val());
		let book_seq = Number($("#bookseq").val());

		let constr = '';
		let pagestr = '';
		$.ajax({
			url: "/replylist.do",
			method: "get",
			dataType: "json",
			data: {
				page, book_seq
			},
			success: function(ce) {
				let img = $("#bookimg").attr("src");
				id = 0;
				ce.map((re) => {
					constr += `<div class="row p-0 border-dark border border-1 mt-2" id="review${id}">
				
					<input type="hidden" id="reseq" value="${re.reply_seq}"/>
						<div class="p-0 col-3">
							<img height="100%" src="${img}" class="img-fluid"
								alt="...">
						</div>
						<div class="col-9">

							<div id="review_id" class="row">
								<div class="col-8">${re.user_id}</div>
								<div class="col-4" id="heart_box">`

					if (re.fine > 0) {
						constr += `<i id="heart" class="bi bi-heart-fill"></i>`;
					} else {
						constr += `<i class="bi bi-heart"></i>`;
					}
					constr += `</div>
							</div>
							<div class="row" id="review_starBox">
								<div class="col-8" id="review_starSolo">
									<div class="col-10" id="star_solo">
										<div>
											<div class="container p-0">
												<label> Rate Value <input type="number"
													name="ratevalue" value="${re.reply_point}" step="0.1" min="0" max="5" />
												</label>
												<div class="rating-wrap p-0">
													<div class="rating">
														<div class="overlay"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="thumb_count" class="col-4">좋아요${re.finecount}</div>
							</div>
							<div id="review_textBox" class="row">`
						if (re.user_blank==false){
							constr += `${re.reply_cotent}`
						}
		              
		              if(re.user_blank!=false){
		            	  constr += ` <div id="blankreview">블랙 처리된 리뷰입니다. 고객센터로 문의 주세요</div>`
		              }
		             
					constr += `</div>
						</div>
					</div>`;
					id++;
				});
				let maxpage = Number($("#maxpage").val());
				console.log("maxpage" + maxpage);
				console.log("page" + page);
				console.log("endpage" + page + 2 > maxpage);
				let startpage = 0;
				let endpage = 0;
				if (page < 3) {
					startpage = 1;
				} else {
					startpage = page - 2;
				}
				if (page + 2 > maxpage) {
					console.log("정상이 아님");
					endpage = maxpage;
				} else {
					console.log("정상");
					endpage = page + 2;
				}
				if (page > 1) {
					pagestr += `<li class="page-item "><a class="page-link">
									< </a></li>`;
				}
				for (let i = startpage; i <= endpage; i++) {
					if (page != i) {
						pagestr += `<li class="page-item"><a class="page-link"
									>${i}
								</a></li>`;
					}
					if (page == i) {
						pagestr += `<li class="page-item active" aria-current="page"><a
									
									class="page-link">${i}</a></li>`;
					}
				}
				if (page < maxpage) {
					pagestr += `<li class="page-item"><a class="page-link" >></a></li>`;
				}
				constr += `<div class="row mt-3" id="review_pageNation">

						<nav class="col d-flex justify-content-center" aria-label="...">
							<ul class="pagination">		</ul>
						</nav>

					</div>
							`;
				//데이터 넣기
				$("#reviews").html(constr);
				$(".pagination").html(pagestr);
				star();
			}
		});







	});
});


//별관련
const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
let maskMax = 0; //오버레이 마스크 최대 너비

window.addEventListener('DOMContentLoaded', () => {
	//별 이미지 SVG 개수만큼 생성
	for (let i = 0; i < maxStar; i++) {
		let el = document.createElement('div');
		//el.classList.add('star');
		el.style.width = starSize + 'px';
		el.style.height = starSize + 'px';
		el.style.marginRight = gutter + 'px';
		//인라인 SVG 이미지 부착
		el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
		document.querySelector('.rating').appendChild(el);
	}

	maskMax = parseInt(starSize * maxStar + gutter * (maxStar - 1));//최대 마스크 너비 계산
	document.querySelector('input[name=ratevalue]').max = maxStar;//입력 필드 최대값 재설정
	setRating(document.querySelector('input[name=ratevalue]').value);//초기 별점 마킹

	//별점 숫자 입력 값 변경 이벤트 리스너
	document.querySelector('input[name=ratevalue]').addEventListener('change', (e) => {
		const val = e.target.value;
		//계산식 - 마스크 최대 너비에서 별점x별크기를 빼고, 추가로 별점 버림 정수값x거터 크기를 빼서 마스크 너비를 맞춤
		setRating(val);
	})

	//별점 마킹 함수
	function setRating(val = 0) {
		document.querySelector('.overlay').style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
	}

	//마우스 클릭 별점 변경 이벤트 리스너
	document.querySelector('.rating').addEventListener('click', (e) => {
		//closest()로 .rating 요소의 왼쪽 위치를 찾아서 현재 클릭한 위치에서 빼야 상대 클릭 위치를 찾을 수 있음.
		const maskSize = parseInt(maskMax - parseInt(e.clientX) + e.target.closest('.rating').getBoundingClientRect().left);//클릭한 위치 기준 마스크 크기 재계산
		document.querySelector('.overlay').style.width = maskSize + 'px'; //오버레이 마스크 크기 변경해서 별점 마킹
		document.querySelector('input[name=ratevalue]').value = Math.floor((maskMax - maskSize) / (starSize + gutter)) + parseFloat(((maskMax - maskSize) % (starSize + gutter) / starSize).toFixed(1));
	})
})
function star() {
	const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
	let maskMax = 0; //오버레이 마스크 최대 너비

	for (let i = 0; i < Number($("#reviews").children().length - 1); i++) {
		let id = `#review${i}`;

		//별관련
		const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
		let maskMax = 0; //오버레이 마스크 최대 너비

		//별 이미지 SVG 개수만큼 생성
		for (let i = 0; i < maxStar; i++) {
			let el = document.createElement('div');
			//el.classList.add('star');
			el.style.width = starSize + 'px';
			el.style.height = starSize + 'px';
			el.style.marginRight = gutter + 'px';

			//인라인 SVG 이미지 부착
			el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
			document.querySelector(id + ` .rating`).appendChild(el);
		}

		maskMax = parseInt(starSize * maxStar + gutter * (maxStar - 1));//최대 마스크 너비 계산
		document.querySelector(id + ` input[name=ratevalue]`).max = maxStar;//입력 필드 최대값 재설정
		setRating(document.querySelector(`${id} input[name=ratevalue]`).value);//초기 별점 마킹

		//별점 숫자 입력 값 변경 이벤트 리스너
		document.querySelector(`${id} input[name=ratevalue]`).addEventListener('change', (e) => {
			const val = e.target.value;
			//계산식 - 마스크 최대 너비에서 별점x별크기를 빼고, 추가로 별점 버림 정수값x거터 크기를 빼서 마스크 너비를 맞춤
			setRating(val);
		})

		//별점 마킹 함수
		function setRating(val = 0) {
			document.querySelector(`${id} .overlay`).style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
		}

		//마우스 클릭 별점 변경 이벤트 리스너
		document.querySelector(`${id} .rating`).addEventListener('click', (e) => {
			//closest()로 .rating 요소의 왼쪽 위치를 찾아서 현재 클릭한 위치에서 빼야 상대 클릭 위치를 찾을 수 있음.
			const maskSize = parseInt(maskMax - parseInt(e.clientX) + e.target.closest(`${id} .rating`).getBoundingClientRect().left);//클릭한 위치 기준 마스크 크기 재계산
			document.querySelector(`${id} .overlay`).style.width = maskSize + 'px'; //오버레이 마스크 크기 변경해서 별점 마킹
			document.querySelector(`${id} input[name=ratevalue]`).value = Math.floor((maskMax - maskSize) / (starSize + gutter)) + parseFloat(((maskMax - maskSize) % (starSize + gutter) / starSize).toFixed(1));
		})

	}
}
for (let i = 0; i < Number($("#reviews").children().length) - 1; i++) {
	let id = `#review${i}`;

	//별관련
	const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
	let maskMax = 0; //오버레이 마스크 최대 너비

	//별 이미지 SVG 개수만큼 생성
	for (let i = 0; i < maxStar; i++) {
		let el = document.createElement('div');
		//el.classList.add('star');
		el.style.width = starSize + 'px';
		el.style.height = starSize + 'px';
		el.style.marginRight = gutter + 'px';
		//인라인 SVG 이미지 부착
		el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
		document.querySelector(id + ` .rating`).appendChild(el);
	}

	maskMax = parseInt(starSize * maxStar + gutter * (maxStar - 1));//최대 마스크 너비 계산
	document.querySelector(id + ` input[name=ratevalue]`).max = maxStar;//입력 필드 최대값 재설정
	setRating(document.querySelector(`${id} input[name=ratevalue]`).value);//초기 별점 마킹

	//별점 숫자 입력 값 변경 이벤트 리스너
	document.querySelector(`${id} input[name=ratevalue]`).addEventListener('change', (e) => {
		const val = e.target.value;
		//계산식 - 마스크 최대 너비에서 별점x별크기를 빼고, 추가로 별점 버림 정수값x거터 크기를 빼서 마스크 너비를 맞춤
		setRating(val);
	})

	//별점 마킹 함수
	function setRating(val = 0) {
		document.querySelector(`${id} .overlay`).style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
	}

	//마우스 클릭 별점 변경 이벤트 리스너
	document.querySelector(`${id} .rating`).addEventListener('click', (e) => {
		//closest()로 .rating 요소의 왼쪽 위치를 찾아서 현재 클릭한 위치에서 빼야 상대 클릭 위치를 찾을 수 있음.
		const maskSize = parseInt(maskMax - parseInt(e.clientX) + e.target.closest(`${id} .rating`).getBoundingClientRect().left);//클릭한 위치 기준 마스크 크기 재계산
		document.querySelector(`${id} .overlay`).style.width = maskSize + 'px'; //오버레이 마스크 크기 변경해서 별점 마킹
		document.querySelector(`${id} input[name=ratevalue]`).value = Math.floor((maskMax - maskSize) / (starSize + gutter)) + parseFloat(((maskMax - maskSize) % (starSize + gutter) / starSize).toFixed(1));
	})

}
$(document).on("click", "#add_cartCheck", function(e) {
	console.log($(e.target).parents("#cash_btn").children("input").val());
})
$(document).on("click", "#add_cartCheck", function(e) {
	console.log($(e.target).parents("#cash_btn").children("input").val());
	$.ajax({
		url: "/cartadd.do",
		method: "get",
		data: {
			book_seq: Number($(e.target).parents("#cash_btn").children("input").val())
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
					$("#add_cartCheck").addClass("bg-gray border-0")
					$("#add_cartCheck").attr("disabled", "true");
				} else {
					alert("장바구니에 이미 존재 합니다.");
				}

			} else {
				alert("로그인하고 장바구니 이용 해주세요");
			}
		}
	})
})
$(document).on('click', "#fin", function() {
	alert("로그인 후 진행해주세요");
})
$(document).on("click", ".bi-heart", function(e) {
	console.log($(e.target).parents(".row").children("#reseq").val());
	$.ajax({
		url: "/finein.do",
		method: "get",
		data: {
			reply_seq: Number($(e.target).parents(".row").children("#reseq").val())
		},
		dataType: "json",
		success: function(re) {
			console.log(re + "suc")
		},
		error: function(re) {
			console.log(re.responseText);
			let num = Number($(e.target).parents(".col-9").children("#review_starBox").children("#thumb_count").text().replaceAll("좋아요", ""));
			if (re.responseText.trim() == "fail") {
				alert("로그인 후 진행해주세요")
			} else {
				$(e.target).parents(".col-9").children("#review_starBox").children("#thumb_count").text("좋아요" + (num + 1))
				$(e.target).removeClass("bi-heart");
				$(e.target).addClass("bi-heart-fill");
				$(e.target).css("color", "red");

			}
		}
	})
})
$(document).on("click", ".bi-heart-fill", function(e) {
	console.log();
	let num = Number($(e.target).parents(".col-9").children("#review_starBox").children("#thumb_count").text().replaceAll("좋아요", ""));
	$.ajax({
		url: "/finedel.do",
		method: "get",
		data: {
			reply_seq: Number($(e.target).parents(".row").children("#reseq").val())
		},
		dataType: "json",
		success: function(re) {
			console.log(re + "suc")
		},
		error: function(re) {
			console.log(re.responseText)
			if (re.responseText.trim() == "fail") {
				alert("로그인 후 진행해주세요")
			} else {
				$(e.target).parents(".col-9").children("#review_starBox").children("#thumb_count").text("좋아요" + (num - 1))
				$(e.target).removeClass("bi-heart-fill");
				$(e.target).addClass("bi-heart");
				$(e.target).css("color", "black");
			}
		}
	})
})
$(document).on("click", "#authorname", function() {
	console.log($("#author_seq").val());
	$.ajax({
		url: "/concernin.do",
		method: "get",
		data: {
			author_seq: Number($("#author_seq").val())
		},
		dataType: "json",
		success: function(re) {
			console.log(re + "suc")
		},
		error: function(re) {
		
			if (re.responseText.trim() == "fail") {
				alert("로그인 후 진행해주세요");
			} else {
				if (re.responseText.trim() == "no") {
					alert("이미 추가되었습니다.");
				}
			}
		}
	})
})