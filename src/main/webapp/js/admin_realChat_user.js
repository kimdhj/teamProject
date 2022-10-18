let userid = $("#userid").val();
init();
console.log(userid);
var arr
var cur_session
function init() {


	cur_session = userid
	$("#title").text(cur_session);
	adminid = cur_session + "admin"
	console.log(adminid);
	$.ajax({
		url: "/selectmy.do",
		data: {
			myname: cur_session,
			adminname: adminid
		},
		method: "GET",
		dataType: "json",
		success: function(data) {
		console.log(data);
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
              <div class="send row col-auto">관리자</div>
            </div>
            <div class="row justify-content-end">
              <div class="content row col-auto">${data[co].real_chat_content}</div>
            </div>
          </div>`
				}



			}
			$("#contents").html(str);
			$("html, body").animate({ scrollTop: $(document).height() }, 500);
		},
		error: function(e) {
			console.log(e);
		}
	})
}
//전송 버튼 누르는 이벤트
$("#typing").on("keydown", function(e) {

	if (e.originalEvent.shiftKey == false && e.originalEvent.keyCode == 13) {
		
		
		sendMessage();
		$('#typing').val('')
		console.log("hi");
	};

});

var sock = new SockJS('http://localhost:8080/echo');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	//메세지 알림을 지워줌
	//메세지 상태 변경(db)
	let adn = userid + "admin";
	console.log("업데이트"+adn)
	$.ajax({
		url: "/updatestate.do",
		data: {
			name: adn
		},
		method: "GET",
		dataType: "json",

	})

	let mes = userid + ":" + $("#typing").val();
	sock.send(mes);
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	console.log(msg);
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;

	arr = data.split(":");

	for (var i = 0; i < arr.length; i++) {
		console.log('arr[' + i + ']: ' + arr[i]);
	}

	cur_session = userid; //현재 세션에 로그인 한 사람(현재 유저 아이디)
	console.log("cur_session : " + cur_session);

	sessionId = arr[1]; // 세션에서 받아온 유저 아이디
	message = arr[2];
	adminid = cur_session + "admin" 
	//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if (sessionId == cur_session || sessionId == adminid) {
		//위의 조건들에 맞는 것들을 데이터베이스에서 불렁옴 이름 기준(db)
		//init();
		//메세지 알림을 뛰워줌ㄴ
		str='';
		if (sessionId == cur_session) {
					str += `<div class="chat row  m-0">
            <div class="row">
              <div class="send row col-auto">${sessionId}</div>
            </div>
            <div class="row">
              <div class="content row col-auto">${message}</div>
            </div>
          </div>`;
				} else {
					str += `<div class="chat row  m-0">
            <div class="row justify-content-end">
              <div class="send row col-auto">관리자</div>
            </div>
            <div class="row justify-content-end">
              <div class="content row col-auto">${data[co].real_chat_content}</div>
            </div>
          </div>`
				}
$("#contents").append(str);
	}
	
}
//채팅창에서 나갔을 때
function onClose(evt) {

	var user = userid;
	var str = user + " 님이 퇴장하셨습니다.";

	$("#msgArea").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	console.log(evt);
	var user = userid;
	var str = user + "님이 입장하셨습니다.";

	$("#msgArea").append(str);
}