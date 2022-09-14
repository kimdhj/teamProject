var userid = $("#userid").val();
var userlist = [];
init();
$("tbody tr").map((ind, el) => {


	userlist.push($(el).children("td:eq(2)").children("a").text());






})
$(document).ready(function() {


})
$("#search").on("mouseup", function() {
	console.log('hi');

	$("#nameche").val($("#name_search").val());

	$("#startdate").val($("#time_real").val());

	init();
});
function init() {
	userlist = [];
	$
		.ajax({
			url: "/selectList.do",
			method: "GET",
			data: {
				page: Number($("#pageche").val()),
				name: $("#nameche").val().trim(),
				startdate: $("#startdate").val()

			},
			dataType: "json",
			async: true,
			success: function(data) {
				let str = "";
				console.log(data + data.length);
				$("tbody").html("");
				let nums = 0;
				for (let i = 0; i < data.length; i++) {

					userlist.push(data[i].realchatname);
					console.log(userlist);

					nums++;
					str += ` <tr>
                            <td>
                                <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                                    id="flexCheckChecked" checked>
                            </td>
                      
                            <td>
                                 <a href="/chatAdmin.mdo?user=${data[i].realchatname}admin"> ${nums}</a> 
                            </td>
                            
                            <td>
                               <a href="/chatAdmin.mdo?user=${data[i].realchatname}admin">${data[i].realchatname}</a>
                            </td>
                            <td>
                              <a href="/chatAdmin.mdo?user=${data[i].realchatname}admin">${data[i].real_chat_content}</a>
                            </td>
                            <td>
                                
                                 <a href="/chatAdmin.mdo?user=${data[i].realchatname}admin">   ${data[i].real_chat_date}</a>
                                
                            </td>

                            <td>
                                
                                   <a href="/chatAdmin.mdo?user=${data[i].realchatname}admin"> ${data[i].num}</a>
                               
                            </td>
                          
                            <td>
                                <button onclick="del(this)" class="btn btn-danger rounded-pill del">삭제</button>
                            </td>
                        </tr>`




				}
				console.log(data);
				let re = data.length;
				$.ajax({
					url: "/countlist.do",
					method: "GET",
					data: {
						page: Number($("#pageche").val()),
						name: $("#nameche").val().trim(),
						startdate: $("#startdate").val()

					},
					dataType: "json",
					async: true,
					success: function(listnum) {
						re = listnum;
					}
				})
				console.log(re);
				if (re % 5 == 0) {
					re--;
				}
				let pa = "";
				let page = Number($("#pageche").val());
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
					if (page != i) {
						pa += `<li class="page-item"><a class="page-link"
									href="#">${i}
								</a></li>`;
					}
					console.log(page);
					console.log(i);
					if (page == i) {
						pa += `<li class="page-item active" aria-current="page"><a
									href="#"
									class="page-link">${i}</a></li>`;
					}
				}
				if (page < re / 5) {
					pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
				}

				$(".pagination").html(pa)
				$("tbody").html(str);
				$(".delche").prop("checked", false);
				$(".allche").prop("checked", false);

			}

		})
}
$(document).on("click", "#findel", function() {
	console.log($("tbody tr").children("td:eq(5)").text().trim());
	$("tbody tr").map((ind, el) => {
		if ($(el).children("td:eq(5)").text().trim() == 0) {
			let name = $(el).children("td:eq(2)").text().trim();
			for (let i = 0; i < userlist.length; i++) {
				if (userlist[i] === name.trim()) {
					userlist.splice(i, 1);
					i--;
				}
			}
			$.ajax({
				url: "/deletall.do",
				method: "GET",
				dataType: "json",
				success: function(data) {
					init();

				},
				error: function() {
					init();
				}
			});

		}
	})
})
function del(e) {
	console.log($(e).parents("tr").children("td:eq(2)").text());
	let name = $(e).parents("tr").children("td:eq(2)").text();
	for (let i = 0; i < userlist.length; i++) {
		if (userlist[i] === name.trim()) {
			userlist.splice(i, 1);
			i--;
		}
	}
	$.ajax({
		url: "/delete.do",
		data: {
			realchatname: name.trim(),

		},
		async: true,
		method: "GET",
		dataType: "json",
		success: function(data) {
			$(e).parents("tr").remove();

		}
	});
	let admin = name + "admin";
	$.ajax({
		url: "/delete.do",
		data: {
			realchatname: admin.trim()

		},
		async: true,
		method: "GET",
		dataType: "json",
		success: function(data) {
			init();

		}
	});



}

let names = [];

var sock = new SockJS('http://localhost:8080/echo');
sock.onmessage = onMessage;


let sessionId = null;
function sendMessage() {
	let mes = userid + ":" + $("#msg").val();
	sock.send(mes);
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	console.log(msg);
	let data = msg.data;
	sessionId = null; //데이터를 보낸 사람
	let message = null;

	let arr = data.split(":");

	for (var i = 0; i < arr.length; i++) {
		console.log('arr[' + i + ']: ' + arr[i]);
	}

	var cur_session = userid; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	console.log("names", names);
	sessionId = arr[1];
	message = arr[2];
	adminid = cur_session + "admin"
	//클라이언트가 접속종료시 세션 아이디만 전송해서 삭제 실행
	console.log("arr.length", arr.length);
	console.log("sessionId", sessionId);
	console.log("arr.length", arr.length);

	//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if (sessionId.indexOf("admin") < 0) {

		//사용자 전체 리스트 업데이트(db)
		//init();
		//사용자가 처음 멩세제 보냈을때

	}

	//다른관리자가 확인했을때
	if (arr[1] && arr[1].indexOf("admin") > 0) {
		console.log(arr[1].replace("admin", "").trim())
		$("tbody tr").map((ind, el) => {
			if ($(el).children("td:eq(2)").text().trim() == arr[1].replace("admin", "").trim()) {
				console.log($(el).children("td:eq(5)").children("a"));
				$(el).children("td:eq(5)").children("a").text(Number(0));
				$(el).children("td:eq(3)").children("a").text(arr[2]);
				const date = new Date();

				const year = date.getFullYear();
				const month = date.getMonth() + 1;
				const day = date.getDate();
				$(el).children("td:eq(4)").children("a").text(year + "-" + month + "-" + day);
				console.log(year + "-" + month + "-" + day);
			}
		})
		//사용자 확인 안한 갯수 확인해서 숫자 변경(db)
		//init();
		console.log("숫자초기화");
	} else {
		console.log(arr[1].trim());
		console.log(userlist);
		if (!userlist.includes(arr[1].trim())) {
			let name = arr[1].trim();
			userlist.push(name);
			init();

		}
		$("tbody tr").map((ind, el) => {

			if ($(el).children("td:eq(2)").text().trim() == arr[1].trim()) {
				console.log($(el).children("td:eq(5)").children("a"));
				$(el).children("td:eq(5)").children("a").text(Number($(el).children("td:eq(5)").children("a").text()) + 1);
				$(el).children("td:eq(3)").children("a").text(arr[2]);
				const date = new Date();

				const year = date.getFullYear();
				const month = date.getMonth() + 1;
				const day = date.getDate();
				$(el).children("td:eq(4)").children("a").text(year + "-" + month + "-" + day);

			}
		})
	}


}
// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
$(document).on('click', ".delche:checked", function() {
	// 해제시 전체 클릭 비활성화
	$(".allche").prop("checked", false);
	//  모두 클릭되면 전체 클릭 활성화
	console.log($("tbody>tr").length);
	console.log($(".delche:checked").length);
	if ($("tbody>tr").length == $(".delche:checked").length) {
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
	(this)
		.parents("tr")
		.children("td:eq(2)")
		.children()
		.text("0");
});
//페이지네이션 이동
$(document).on("click", "#all_box #page a", function(e) {
	if ($(e.target).text().trim() == "<") {
		$("#pageche").val(Number($("#pageche").val()) - 1);
	} else if ($(e.target).text().trim() == ">") {
		$("#pageche").val(Number($("#pageche").val()) + 1);
	} else {
		$("#pageche").val($(e.target).text());
	}

	init();
});