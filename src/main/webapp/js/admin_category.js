$(document).ready(function() {
	// 상단 탭 버튼
	$("#all").click(function() {
		$("#all").removeClass("unselect");
		$("#all").addClass("select");
		$("#category").removeClass("select");
		$("#category").addClass("unselect");

		$("#cate_box").hide();
		$("#all_box").show();
	});
	$("#category").click(function() {
		$("#category").removeClass("unselect");
		$("#category").addClass("select");
		$("#all").removeClass("select");
		$("#all").addClass("unselect");
		$("#all_box").hide();
		$("#cate_box").show();
	});
	// 상단 모든 카테고리 코드

	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$(".delche:checked").click(function() {
		// 해제시 전체 클릭 비활성화
		$(".allche").prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($("#all_box tbody>tr").length == $(".delche:checked").length) {
			$(".allche").prop("checked", true);
		}
	});
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
	// 테이블 내가 만든거 select 박스 넣기
	select = $(".selectColumn");

	table();

	// 더블 클릭시 원하는 요소로 변경
	$(document).on("dbclick", ".selectColumn", function(e) {
		let text = $(this).text();
		$(
			this
		).html(`<select class="row form-select" id="td select" aria-label="Default select example">
              <option value="0">옵션 선택</option>  
              <option value="100">국내</option>
              <option value="200">외국</option>
              </select>`);
		let outthis = $(this);
		// 값 변경시 글자로 변셩
		$(this)
			.children("select")
			.change(function(e) {
				text = e.target.value;
				if (text == "100") {
					text = "국내";
				} else {
					text = "외국";
				}
				outthis.html(text);
			});
	});

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
	$(document).on("click", "#all_box #page a", makeDisplay);
	//검색
	$("#all_box #search_btn").click(function(e) {
		$("#all_box #nameche").val(null);
		$("#all_box #numche").val(0);
		$("#all_box #pageche").val(1);
		let count = 0;
		$("#all_box #nameche").val($("#all_box #name").val());
		if (
			Number($("#all_box #category_btn").val()) != 0 &&
			Number($("#all_box #level").val()) != 0
		) {
			$("#all_box #numche").val(
				Number($("#all_box #category_btn").val()) +
				Number($("#all_box #level").val())
			);
		}
		make();
	});
	//추가버튼
	$("#all_box #add_btn").click(function(e) {
		let num =
			Number($("#all_box #category_btn").val()) +
			Number($("#all_box #level").val());
		let name = $("#all_box #name").val();

		if (
			Number($("#all_box #category_btn").val()) != 0 &&
			Number($("#all_box #level").val()) != 0 &&
			name != null
		) {
			$.ajax({
				url: "/categoryInsert.mdo",
				method: "get",
				dataType: "json",
				async: false,
				data: {
					num,
					name,
				},
				success: function(re) {
					if (re != null) {
						make();
					}
				},
				error: function(e) {
					if (e.responseText != null && e.responseText != "") {
						alert(e.responseText);
					} else {
						make();
						$("#all_box #name").val(null);
						$("#all_box #level option:eq(0)").prop("selected", true);
						$("#all_box #category_btn").val("");
					}
				},
			});
		}
	});

	//코드 두글자 제한
	$("#all_box #category_btn").change(function() {
		if ($("#all_box #category_btn").val().length > 2) {
			$("#all_box #category_btn").val(
				$("#all_box #category_btn").val().substr(0, 2)
			);
		}
	});

	//화면 구성
	function makeDisplay(e) {
		if ($(e.target).text().trim() == "<") {
			$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
		} else if ($(e.target).text().trim() == ">") {
			$("#all_box #pageche").val(Number($("#all_box #pageche").val()) + 1);
		} else {
			$("#all_box #pageche").val($(e.target).text());
		}

		make();
	}

	//내용변경
	function make() {
		$.ajax({
			url: "/categoryCount.mdo",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				num: Number($("#all_box #numche").val()),
				name: $("#all_box #nameche").val(),
				page: Number($("#all_box #pageche").val()),
			},
			success: function(re) {
			
			if (re % 5 == 0) {
					re--;
				}
				console.log(re);
			console.log(Number($("#all_box #pageche").val()),re / 5 + 1)
				if (Number($("#all_box #pageche").val()) >re / 5 + 1) {
					$("#all_box #pageche").val(Number($("#all_box #pageche").val())-1);
				}
				let page = Number($("#all_box #pageche").val());
				count = re;
				console.log(re);
				count = count - ($("#all_box #pageche").val() - 1) * 5;
				let pa = "";
				if (Number($("#all_box #pageche").val()) > 1) {
					pa += `<li class="page-item "><a class="page-link">
									< </a></li>`;
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
					if (Number($("#all_box #pageche").val()) != i) {
						pa += `<li class="page-item"><a class="page-link"
									href="#">${i}
								</a></li>`;
					}
					if (Number($("#all_box #pageche").val()) == i) {
						pa += `<li class="page-item active" aria-current="page"><a
									href="#"
									class="page-link">${i}</a></li>`;
					}
				}
				if (Number($("#all_box #pageche").val()) < re / 5) {
					pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
				}
				$("#all_box .pagination").html(pa);
			},
		});
		$.ajax({
			url: "/categoryList.mdo",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				num: Number($("#all_box #numche").val()),
				name: $("#all_box #nameche").val(),
				page: Number($("#all_box #pageche").val()),
			},
			success: function(re) {
				let con = "";
				re.map((se) => {
					con += `<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" >
								</td>
								<td>
									<p contenteditable="false" data-default="${count}">${count}</p>
									
								</td>
								<td>
									<p class="rowColumn" id="category_name"  contenteditable="true"
										data-default="${se.category_name}">${se.category_name}</p>
								</td>
								<td>
									<p class="rowColumn" id="category_num"  contenteditable="true"
										data-default="${se.category_num}">${se.category_num}</p>
								</td>
								<td class="hide">
									<p class="rowColumn" id="category_num" contenteditable="false"
										data-default="${se.category_seq}">${se.category_seq}</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>`;
					count--;
				});
				$("#all_box tbody").html(con);
			},
		});
		table();
	}
	// 클릭해서 삭제
	$(document).on("click", ".del", function(e) {
		let num = $(this).parents("tr").children("td:eq(3)").text();
		$.ajax({
			url: "/categorydel.mdo",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				num,
			},
			success: function(e) {
				make();
			},
			error: function() { },
		});
	});
	//클린된것들 수정
	$(document).on("click", "#selmod", function() {
		let num = [];
		let name = [];
		let seq = [];
		$(".delche").map((che, el) => {
			if ($(el).is(":checked")) {
				name.push($(el).parents("tr").children("td:eq(2)").text().trim());
				num.push($(el).parents("tr").children("td:eq(3)").text().trim());

				seq.push($(el).parents("tr").children("td:eq(4)").text().trim());
			}
		});
		if (num.length > 0) {
			$.ajax({
				url: "/categoryMod.mdo",
				method: "get",
				dataType: "json",
				async: false,
				data: {
					num: num,
					name: name,
					seq: seq,
				},
				success: function(e) {
					if (e.length > 0) {
						alert(e, "를 수정에 실패했습니다.");
					}
					make();
				},
				error: function(e) { },
			});
		}
	});
	$(document).on("click", "#cate_box #navmod", function() {
		let num = [];
		let order = [];
		$(".num").map((index, el) => {
			num.push($(el).text());
		});
		$(".order").map((index, el) => {
			order.push($(el).text());
		});

		$.ajax({
			url: "/navcateupdate.mdo",
			method: "get",
			dataType: "json",
			async: false,
			data: {
				num,
				order,
			},
			success: function(re) {
				manav();
			},
			error: function() {
				alert("일부 수정 실패");
				manav();
			},
		});
	});
	function manav() {
		$.ajax({
			url: "/navList.mdo",
			method: "get",
			dataType: "json",
			async: false,
			success: function(re) {
				let con = "";
				for (let i = 0; i < re.length; i++) {
					con += `<tr>
						<td>
							<p contenteditable="false" class="order" data-default="${re[i].nav_category_order}">${re[i].nav_category_order}</p>
						</td>
						<td>
							<p contenteditable="true" class="name" data-default="${re[i].nav_category_name}">${re[i].nav_category_name}</p>
						</td>
						<td>
							<p class="rowColumn num" contenteditable="false"
								data-default="${re[i].category_num}">${re[i].category_num}</p>
						</td>
						<td>
							<button class="btn btn-danger rounded-pill reset">초기화</button>
						</td>
					</tr>`;
				}

				$("#cate_box tbody").html(con);
			},
		});
	}
});
