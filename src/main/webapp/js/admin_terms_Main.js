//검색버튼
$("#search_btn").click(function(e) {
	$("#title").val($("#search_content").val().trim())
	console.log("a");
	$("#search #page").val(1);
	count();



});

//엔터버튼
$("#search_content").keydown(function(e) {
	if (e.keyCode == "13") {
		$("#title").val($("#search_content").val().trim())
		$("#search #page").val(1);
		count();
	}
});

//페이징 클릭시 뷰뷰실행
$(document).on('click', '#paging #reload a', viewview)


//페이징만 이동
function viewview(v) {

	console.log($("#page").val());
	if ($(v.target).text() == "«") {
		$("#page").val(parseInt(1));
	} else if ($(v.target).text() == "이전") {
		$("#page").val(parseInt($("#page").val()) - 1);
	} else if ($(v.target).text() == "다음") {
		$("#page").val(parseInt($("#page").val()) + 1);
	} else if ($(v.target).text().trim() == "»") {
		$("#page").val(parseInt($("#count").val()));
		console.log($("#page").val());

	} else {
		$("#page").val(parseInt($(v.target).text()));
	}

	count();

}

//게시글수 세오고 페이징 갱신
function count() {
	let count = 0;
	$.ajax({
		url: "/ajax_a.mdo",
		method: "POST",
		dataType: "JSON",
		async: false,
		data: {
			title: $("#search #title").val()
		},
		success: function(co) {

			console.log("count 결과값" + co);

			//게시글 수
			count = co;
			if(count%5 == 0){
				count--;
			}

			$("#count").val(count/5+1);
			//현재 페이지
			let page = $("#page").val();
			//최대 페이지
			let fullpage = 0;
			if (count % 5 == 0) {
				fullpage = parseInt(count / 5);
			} else if (count % 5 != 0) {
				fullpage = parseInt(count / 5) + 1;
			}
			//최대페이지 나누기 10
			let wherepage = parseInt((page - 1) / 5);
			// 현재 시작 페이지
			let startpage = wherepage * 5 + 1;
			// 현재 끝 페이지
			let endpage = wherepage * 5 + 5;
			// 현재 최대 끝 페이지
			if (endpage > fullpage) {
				endpage = fullpage;
			}

			let go = "";

			console.log("page : " + page);
			console.log("startpage : " + startpage);
			console.log("endpage : " + endpage);
			console.log("fullpage : " + fullpage);
			console.log("wherepage : " + wherepage);
			console.log("count : " + count);

			if (page != 1) {
				go += `<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li><li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a></li>`;
			}
			for (let k = startpage; k <= endpage; k++) {
				if (page == k) {
					go += `<li class="page-item active"><a class="page-link" href="#" id="now">${k}</a></li>`;
				} else if (page != k) {
					go += `<li class="page-item"><a class="page-link" href="#">${k}</a></li>`;
				}
			}
			if (page != fullpage) {
				go += `<li class="page-item"><a class="page-link" href="#">다음</a></li><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>`;
			}


			$(".pagination").html(go);

		}
	});

	console.log("a",  $("#search #page").val());
	$.ajax({
		url: "/ajax_b.mdo",
		type: 'POST',
		data: {
			title: $("#search #title").val(),
			page: $("#search #page").val()
		},
		success: function(data) {
			console.log("뷰뷰 결과" + data);
			let con = "";
			console.log(count);
			count = Number(count) - Number($("#search #page").val() - Number(1)) * 5

			data.map((terms) => {
				console.log(terms.terms_article_number);
				con +=
					`
									<tr>
										<td scope="row">${count}</td>

										<td>제 ${terms.terms_article_number}조</td>
										<td><a
											href="/admin_terms_Read.mdo?terms_seq=${terms.terms_seq}&count=${count}">${terms.terms_title}</a></td>
										<td>${terms.terms_date.toLocaleString('ko-KR')}</td>
										<td>`
				if (terms.terms_state == true) {
					con += "공개"
				} else {
					con += "비공개"
				}
				con += `</td>
										<c:set var="count" value="${count - 1}" />
									</tr>
				`;
				count--;
			});
			console.log(con);
			$("tbody").html(con);

		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error while post');
		}
	});

}