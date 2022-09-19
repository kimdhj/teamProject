//페이지 네이션 화면 이동
$(document).on('click', '#all_box #page a', makeDisplay);
//검색
$("#all_box #search_btn").click(function(e) {
	$("#all_box #titleche").val(null);
	$("#all_box #contentche").val(null);
	$("#all_box #seqche").val(0);
	$("#all_box #pageche").val(1);
	$("#all_box #startche").val(null);
	$("#all_box #endche").val(null);

	make();
});

//화면 구성
function makeDisplay(e) {
	if ($(e.target).text().trim() == "<") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
	} else if ($(e.target).text() == ">") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) + 1);
	} else {
		$("#all_box #pageche").val($(e.target).text());
	}
	make();
}

//내용변경
function make() {
	let count = 0;
	$.ajax({
		url: "/noticeCount.do",
		method: "get",
		dataType: 'json',
		async: false,
		data: {
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {
			console.log("re1", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			count = re;
			// count = count - (Number($("#all_box #pageche").val()) -1) * 5;
			count = count - ($("#all_box #pageche").val() - 1) * 5;
			console.log(count);
			
			// 한 페이지당 몇 개의 게시글을 나오게 할 것인지 출력 (<)
			let pa = "";
			if (Number($("#all_box #pageche").val()) > 1) {
				pa += `<li class="page-item "><a class="page-link">
								<</a></li>`;
			}
			if (re % 10 == 0) {
				re--;
			}
			console.log("re2", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 Count)
			console.log(Number($("#all_box #pageche").val()),re / 5 + 1)
			
			if (Number($("#all_box #pageche").val()) > re / 5 + 1) {
				$("#all_box #pageche").val(Number($("#all_box #pageche").val())-1);
			}
			
			// 총 페이지 수 구하고, 한 화면에 몇 개의 쪽수를 나오게 할지
			let page = Number($("#all_box #pageche").val());
			let startpage = 0;
			let endpage = 0;
			
			if(page < 3){
				startpage = 1;
			}else{
				startpage = page - 2;
			}
			
			// page : 2 / re : 30	// page : 7 / re : 30
			// 4 > 7				// 9 > 7
			// endpage = 4;			// endpage = 8
			if (page + 2 > re / 5 + 1) {
				endpage = re / 5 + 1;
			} else {
				endpage = page + 2;
			}
			
			for (let i = startpage; i <= endpage; i++) {
				if (Number($("#all_box #pageche").val()) != i) {
					pa += `<li class="page-item"><a class="page-link" href="#">${i} </a></li>`;
				}
				if (Number($("#all_box #pageche").val()) == i) {
					pa += `<li class="page-item active" aria-current="page"><a href="#" class="page-link">${i}</a></li>`;
				}
			}
			if (Number($("#all_box #pageche").val()) < re / 5) {
				pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
			}
			$("#all_box .pagination").html(pa);
//			console.log("번호 : " + $("#all_box .pagination").html());
		}
	});
	$.ajax({
		url: "/noticeList.do",
		method: "GET",
		dataType: 'json',
		async: false,
		data: {
			page: Number($("#all_box #pageche").val())
		},
		success: function(re) {
			console.log("ListRe", re); // data 를 가져와서 사용하는데, 그 값을 찍어주는 거 (여기서는 데이터List)
			let con = ` <div class="row" id="table_height">
						<div class="col-2">번호</div>
						<div class="col-3">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-3">등록일자</div>
						<div class="col-2">조회수</div>
					</div> `;
			
			re.map((notice) => {
				con += `
						<div class="row" id="table_content">
    						<div class="col-2" id="seq">${count }
                              <input type="hidden" value="${notice.notice_seq }"/>
                            </div>
    						<div class="col-3" id="title">
                              <a href="/noticeDetail.do?notice_seq=${notice.notice_seq}&seq=${count}">`
                              
								if(notice.notice_title.length > 7){
									title = notice.notice_title.substring(0, 6); console.log("2",title);
									con += `${title }...`
								}else{
									con += `${notice.notice_title }`
								}
                              con += `
                              </a>
                            </div>
    						<div class="col-2">${notice.notice_writer }</div>
    						<div class="col-3">
                            	  ${notice.notice_date }
                            </div>
    						<div class="col-2">${notice.notice_cnt }</div>
    					</div>
    					
						`;
				count--;
			});
//			console.log($("#all_box tbody").html());
//			console.log(con);
			
			$("#table_table").html(con);
//			console.log("con: " + con);
//			console.log("공지사항 목록 : " + $("#all_box tbody").html());
		}
	});
}