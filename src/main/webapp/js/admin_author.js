$(document).ready(function() {

	// 상단 모든 카테고리 코드

	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$(document).on("click", ".delche:checked", function() {
		// 해제시 전체 클릭 비활성화
		$(".allche").prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($("#all_box tbody>tr").length == $(".delche:checked").length) {
			$(".allche").prop("checked", true);
		}
	})
	//  전체 클릭 클릭시 전체온오프
	$(".allche").click(function() {
		if ($(".allche").is(":checked")) {
			$(".delche").prop("checked", true);
		} else {
			$(".delche").prop("checked", false);
		}
	});
	// checked 초기화
	$(".delche").prop("checked", false);
	$(".allche").prop("checked", false);
	// 하단에 있는 카테고리 홍보 코드
	// 리셋 버튼 코드 초기화
	$(".reset").click(function(e) {
		$(this).parents("tr").children("td:eq(1)").children().text("default");
		$(this)
			.parents("tr")
			.children("td:eq(2)")
			.children()
			.attr("data-default", "0");
		this.parents("tr").children("td:eq(2)").children().text("0");
	});
	// 코드 변화 감지에 따른 행동
	observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			$(mutation.target)
				.parents("tr")
				.children("td:eq(1)")
				.children()
				.text("default");
		});
	});
	const num = document.getElementsByClassName("num");
	for (let i = 0; i < num.length; i++) {
		observer.observe(document.getElementsByClassName("num")[i], {
			childList: true,
		});
	}


	table();


	// 테이블 기본꺼
	function table() {
		// @breif contenteditable 속성을 가진경우
		contents = document.getElementsByClassName("rowColumn");

		// @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
		Array.from(contents).forEach(function(content) {
			// @breif 마우스로 해당영역을 더블클릭 한경우
			content.addEventListener("dblclick", function(event) {
				// @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
				Array.from(contents).forEach(function(defaultVal) {
					// @details 빈값( null )이 존재하는지 체크한다.
					/* if(
									   defaultVal.textContent == ""
									|| defaultVal.textContent == null
									|| defaultVal.textContent == undefined
									|| (defaultVal.textContent != null
									&& typeof defaultVal.textContent == "object"
									&& !Object.keys(defaultVal.textContent).length == ""))
								{
					   
									// @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
									defaultVal.textContent = defaultVal.dataset.default;
								}
								 */

					// @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
					defaultVal.textContent = defaultVal.dataset.default;

					// @breif 수정 불가 상태로 되돌린다.
					defaultVal.contentEditable = false;
					defaultVal.style.border = "0px";
				});

				if (content.isContentEditable == false) {
					// @details 편집 가능 상태로 변경
					content.contentEditable = true;

					// @details 텍스트 문구 변경
					// content.textContent = "";

					// @details CSS 효과 추가
					content.style.border = "1px solid #FFB6C1";

					// @details 포커스 지정
					content.focus();
				}
			});

			// @breif 키보드 입력이 방생한 경우 실행
			content.addEventListener("keypress", function(event) {
				// @breif Enter키 입력시 실행
				if (event.key === "Enter") {
					// @details 입력된 값이 빈값( null )인지 체크한다.
					if (
						content.textContent == "" ||
						content.textContent == null ||
						content.textContent == undefined ||
						(content.textContent != null &&
							typeof content.textContent == "object" &&
							!Object.keys(content.textContent).length == "")
					) {
						// @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
						content.textContent = content.dataset.default;
					} else {
						// @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
						content.dataset.default = content.textContent;
					}
					// @breif 수정 불가 상태로 되돌린다.
					content.contentEditable = false;
					content.style.border = "0px";
				}
			});
		});
	}
	//페이지 네이션 화면 이동





	//화면 구성

	$("#author_seq").on("input", function() {
		$("#author_seq").val($("#author_seq").val().replace(/[^0-9]/g, ''));
	})
	$(document).on('click', '.page-link', makeDisplay);
	//태그 클릭에 따른 제한
	function makeDisplay(e) {

		console.log($(e.target).text());


		if ($(e.target).text().trim() == "«") {
			$("#page").val(Number($("#page").val()) - 1);
		} else if ($(e.target).text().trim() == "»") {
			$("#page").val(Number($("#page").val()) + 1);
		} else {
			$("#page").val(Number($(e.target).text()));
		}
		console.log("page", $("#page").val());
		make();
	}
	//삭제
	$(document).on("click", ".del", function(e) {
		console.log($(e.target).parents("tr").children("td:eq(2)").children("input").val())
		$.ajax({
			url: "/adminauthordel.mdo",
			method: "get",
			dataType: 'json',
			data: {
				author_seq: $(e.target).parents("tr").children("td:eq(2)").children("input").val()
			},
			succcess: function(re) { console.log("suc"); },
			error: function(er) { make(); }
		})
	})
	//수정
	$(document).on("click","#selmod",function(){
	console.log($(".delche"));
	let auth_name = [];
	let auth_seq = [];
		$(".delche").map((che, el) => {

			if ($(el).is(':checked')) {
				auth_name.push($(el).parents("tr").children('td:eq(2)').text().trim());
				auth_seq.push(Number($(el).parents("tr").children('td:eq(1)').text().trim()));

			}

		});
		console.log(auth_seq,auth_name);
		$.ajax({
			url: "/adminauthorupdate.mdo",
			method: "get",
			dataType: 'json',
			async: false,
			data: {
				auth_seq:auth_seq,
				auth_name:auth_name
			},
			success: function(e) {
console.log("suc");
				make();
			},
			error: function(e) {
			console.log("err");
			make();

			}
		});
	})
	//검색버튼
	$(document).on("click", "#search_btn", function() {

		$("#nameche").val($("#author_name").val().trim());
		$("#seqche").val($("#author_seq").val().trim());
		$("#page").val(Number(1));
		make();
	});
	//수정시 체크됨
	$(document).on("propertychange change paste input keyUp keyDown",".mod",function(e){
	console.log($(e.target).parents("tr").children("td:eq(0)").children("input"));
	$(e.target).parents("tr").children("td:eq(0)").children("input").prop("checked","true");
	})

	//추가 버튼
	$(document).on("click", "#add_btn", function() {
		if($("#author_name").val()==null||$("#author_name").val()==""){
		alert("작가이름을 입력해주세요");
		return;
		}
		$.ajax({
			url: "/adminauthorcreate.mdo",
			method: "get",
			dataType: 'json',
			data: {
				author_name: $("#author_name").val().trim()
			},
			succcess: function(re) { console.log("suc"); },
			error: function(er) { console.log($("#page")); make(); }
		})

	})
	function make() {
		let count = 0;
		$.ajax({
			url: "/adminauthorcount.mdo",
			method: "get",
			dataType: 'json',
			data: {
			
				author_seq: Number($("#seqche").val()),
				author_name: $("#nameche").val().trim()
			},
			success: function(re) {
				console.log("갯수" + re);
				console.log(re);
				console.log(Number($("#page").val()), re / 5 + 1)
				if (Number($("#page").val()) > re / 5 + 1) {
					$("#page").val(Number($("#page").val()) - 1);
				}
				console.log("chd", $("#page").val());
				count = re;
				count = count - (Number($("#page").val()) - 1) * 5;
				page = Number($("#page").val());
				let pa = '';
				if (Number($("#page").val()) > 1) {
					pa += ` <li class="page-item"><a class="page-link"  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>`;
				}


				let startpage = 0;
				let endpage = 0;
				if (page < 3) {
					startpage = 1;
				} else {
					startpage = page - 2;
				}
				if (page + 2 > re / 5 + 1) {
					endpage = re / 5 + 1;
				} else {
					endpage = page + 2;
				}
				for (let i = startpage; i <= endpage; i++) {
					if (Number($("#page").val()) != i) {

						pa += `<li class="page-item"><a class="page-link" >${i}</a></li>`;
					}
					if (Number($("#page").val()) == i) {

						pa += `<li class="page-item"><a class="page-link activep" >${i}</a></li>`;
					}




				}
				if (Number($("#page").val()) < re / 5) {
					pa += `<li class="page-item"><a class="page-link"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>`;
				}
				console.log(pa);
				console.log($(".pagination"));
				$(".pagination").html(pa);
			},
			error: function(er) {
				console.log(er);
			}
		});
		$.ajax({
			url: "/adminauthorlist.mdo",
			method: "get",
			dataType: 'json',

			data: {
				page: Number($("#page").val()),
				author_seq: Number($("#seqche").val()),
				author_name: $("#nameche").val().trim()
			},
			success: function(re) {
				console.log(re);
				let con = "";
				re.map((it) => {

					con += `<tr>
                <td>
                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value="" id="flexCheckChecked">
                </td>
                <td>
                  <p  id="category_num" >${it.author_seq}</p>
                 
                </td>
                <td>
                  <p class="rowColumn" id="category_name" contenteditable="true" data-default="${it.author_name}">${it.author_name}</p>
                  <input type="number" class="hide" value="${it.author_seq}" />
                </td>
                <td>
                  <p>${it.count}</p>
                </td>
                <td>
                  <button class="btn btn-danger rounded-pill del">삭제</button>
                </td>
              </tr>`;
					count--;


				});
				$("tbody").html(con);

			}
		});
		table();
	}
})


