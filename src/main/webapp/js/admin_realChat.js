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
                                <button onclick="del(this)" class="btn btn-danger rounded-pill del">??????</button>
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

var sock = new SockJS('http://13.209.163.243/echo');
sock.onmessage = onMessage;


let sessionId = null;
function sendMessage() {
	let mes = userid + ":" + $("#msg").val();
	sock.send(mes);
}
//???????????? ???????????? ????????? ???
function onMessage(msg) {
	console.log(msg);
	let data = msg.data;
	sessionId = null; //???????????? ?????? ??????
	let message = null;

	let arr = data.split(":");

	for (var i = 0; i < arr.length; i++) {
		console.log('arr[' + i + ']: ' + arr[i]);
	}

	var cur_session = userid; //?????? ????????? ????????? ??? ??????
	console.log("cur_session : " + cur_session);
	console.log("names", names);
	sessionId = arr[1];
	message = arr[2];
	adminid = cur_session + "admin"
	//?????????????????? ??????????????? ?????? ???????????? ???????????? ?????? ??????
	console.log("arr.length", arr.length);
	console.log("sessionId", sessionId);
	console.log("arr.length", arr.length);

	//????????? ??? ?????????????????? ??? ?????????????????? ???????????? ??????
	if (sessionId.indexOf("admin") < 0) {

		//????????? ?????? ????????? ????????????(db)
		//init();
		//???????????? ?????? ????????? ????????????

	}

	//?????????????????? ???????????????
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
		//????????? ?????? ?????? ?????? ???????????? ?????? ??????(db)
		//init();
		console.log("???????????????");
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
// ????????? ?????? ?????? ????????????+?????? ???????????? ?????? ?????? ?????????
$(document).on('click', ".delche:checked", function() {
	// ????????? ?????? ?????? ????????????
	$(".allche").prop("checked", false);
	//  ?????? ???????????? ?????? ?????? ?????????
	console.log($("tbody>tr").length);
	console.log($(".delche:checked").length);
	if ($("tbody>tr").length == $(".delche:checked").length) {
		$(".allche").prop("checked", true);
	}
});
//  ?????? ?????? ????????? ???????????????
$(".allche").click(function() {
	if ($(".allche").is(":checked")) {
		$(".delche").prop("checked", true);
	} else {
		$(".delche").prop("checked", false);
	}
});
// checked ?????????
$(".delche").prop("checked", false);
$(".allche").prop("checked", false);
// ????????? ?????? ???????????? ?????? ??????
// ?????? ?????? ?????? ?????????
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
//?????????????????? ??????
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




$(".seldel").click(function(){
let ids=[];
$('.delche').map((ind,el)=>{
console.log($(el).is(':checked'))
if($(el).is(':checked')){
console.log($(el).parents("tr").children("td:eq(2)").text().trim())
ids.push($(el).parents("tr").children("td:eq(2)").text().trim());
$(el).parents("tr").remove();
}
console.log(ids);
$.ajax({
		url: "/chatseldel.mdo",
		data: {
			delid: ids

		},
		async: true,
		method: "GET",
		dataType: "json",
		success: function(data) {
			

		}
	});
})

})