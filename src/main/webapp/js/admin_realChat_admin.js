var userid = $("#userid").val();
console.log(userid);
init();
var arr
var cur_session
function init() {

	cur_session = userid
	$("#title").text(cur_session);
	let adminid = cur_session.replaceAll('admin', '');
	console.log("adminid/",adminid);
	$.ajax({
		url: "/selectmy.do",
		data: {
			myname: userid,
			adminname: adminid
		},
		method: "GET",
		dataType: "json",
		success: function(data) {
			$("#contents").html("");
			var str = "";
			for (let co = 0; co < data.length; co++) {
				if (data[co].realchatname == userid) {
					str += `<div class="chat row  m-0">
            <div class="row">
              <div class="send row col-auto">${data[co].realchatname}</div>
            </div>
            <div class="row">
              <div class="content row col-auto">${data[co].real_chat_content}</div>
            </div>
          </div>`;
				} else {
					str += `<div class="chat row  m-0">
            <div class="row justify-content-end">
              <div class="send row col-auto">${data[co].realchatname}</div>
            </div>
            <div class="row justify-content-end">
              <div class="content row col-auto">${data[co].real_chat_content}</div>
            </div>
          </div>`
				}



			}
			$("#contents").html(str);
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function del() {
	$.ajax({
		url: "/delet.do",
		data: {
			realchatname: userid,

		},
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log(data);

		}
	});
	$.ajax({
		url: "/delet.do",
		data: {
			name: userid.replaceAll('admin', ''),

		},
		method: "GET",
		dataType: "json",
		success: function(data) {
			console.log(data);

		}
	});
}
//전송 버튼 누르는 이벤트

	$("#typing").on("keydown", function(e) {

		if (e.originalEvent.shiftKey == false && e.originalEvent.keyCode == 13) {
			sendMessage();
			$('#typing').val('')
			console.log("hi");
		};



	});

let sessionName;
var sock = new SockJS('http://localhost:8080/echo');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;



function sendMessage() {


	//메세지 알림을 지워줌
	//메세지 상태 변경(db)
	let adn = userid.replaceAll("admin", '');
	console.log(adn,"adn");
	$.ajax({
		url: "/updatestate.do",
		data: {
			realchatname: adn
		},
		method: "GET",
		dataType: "json",

	})

	let mes = userid + ":" + $("#typing").val();
	sock.send(mes);
}



//서버에서 메시지를 받았을 때
function onMessage(typing) {

	console.log(typing);
	var data = typing.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;

	var arr = data.split(":");

	for (var i = 0; i < arr.length; i++) {
		console.log('arr[' + i + ']: ' + arr[i]);
	}

	var cur_session = userid; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	console.log("arr.length", arr.length);
	console.log("sessionName", sessionName);
	console.log("arr[0]", arr[0]);
	if (arr.length == 1 && sessionName == arr[0]) {

		//담당 관리자 이름도 삭제(db)
		console.log("사용자 나감")

		var end = "<div class='col-6'>";
		end += "<div class='alert alert-secondary'>";
		end += "<b>" + "userid".replaceAll('admin', '') + " 퇴장 하셨습니다. </b>";
		end += "</div></div>";

		$("#typingArea").append(end);

		return;

	}
	sessionId = arr[1];
	message = arr[2];
	adminid = cur_session.replaceAll('admin', '');
	console.log(adminid)
	//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if (sessionId == cur_session || sessionId == adminid) {
		if (sessionId == adminid) {
			sessionName = arr[0];
		}
		//위의 조건들에 맞는 것들을 데이터베이스에서 불렁옴 이름 기준(db)
		init();
		//메세지 알림을 뛰워줌
		//세션 아이디 저장

	}

}


//채팅창에서 나갔을 때


function onClose(evt) {

	var user = userid;
	var str = user + " 님이 퇴장하셨습니다.";

	$("#contents").append(str);
}


//채팅창에 들어왔을 때
function onOpen(evt) {
	console.log(evt);
	var user = userid;
	var str = user + "님이 입장하셨습니다.";

	$("#contents").append(str);
};

