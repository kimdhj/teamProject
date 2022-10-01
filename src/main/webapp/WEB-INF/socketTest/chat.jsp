<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="col-6">
			<label><b>채팅방</b></label>
		</div>
		<div>
			<div id="msgArea" class="col"></div>
			<div class="col-6">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-send">전송</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6"></div>
	</div>
</body>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">
init();
var arr
var cur_session 
function init(){


	 cur_session ='${userid}'
	
	adminid = cur_session + "admin"
	$.ajax({
		url : "/selectmy.do",
		data : {
			myname : cur_session,
			adminname:adminid
		},
		method : "GET",
		dataType : "json",
		success:function(data){
			console.log(data);
			$("#msgArea").html("");
			for(let co=0;co<data.length;co++){
			var str = "<div class='col-6'>";
			str += "<div class='alert alert-secondary'>";
			str += "<b>" + data[co].real_chat_name + " : " + data[co].real_chat_content + "</b>";
			str += "</div></div>";

			$("#msgArea").append(str);
			}
		},
		error:function(e){
			console.log(e);
		}
	})
}
	//전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		sendMessage();
		$('#msg').val('')
	});

	var sock = new SockJS('http://13.209.163.243/echo');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;

	function sendMessage() {
		//메세지 알림을 지워줌
		//메세지 상태 변경(db)
		let adn='${userid}'+"admin";
		$.ajax({
			url : "/updatestate.do",
			data : {
				name : adn
			},
			method : "GET",
			dataType : "json",
		
		})

		let mes = '${userid}' + ":" + $("#msg").val();
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

		cur_session = '${userid}'; //현재 세션에 로그인 한 사람
		console.log("cur_session : " + cur_session);

		sessionId = arr[1];
		message = arr[2];
		adminid = cur_session + "admin"
		//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		if (sessionId == cur_session || sessionId == adminid) {
			//위의 조건들에 맞는 것들을 데이터베이스에서 불렁옴 이름 기준(db)
			init();
			//메세지 알림을 뛰워줌ㄴ
			
		}
		/* 	else{
		
		 var str = "<div class='col-6'>";
		 str += "<div class='alert alert-warning'>";
		 str += "<b>" + sessionId + " : " + message + "</b>";
		 str += "</div></div>";
		
		 $("#msgArea").append(str);
		 }
		 */
	}
	//채팅창에서 나갔을 때
	function onClose(evt) {

		var user = '${userid}';
		var str = user + " 님이 퇴장하셨습니다.";

		$("#msgArea").append(str);
	}
	//채팅창에 들어왔을 때
	function onOpen(evt) {
		console.log(evt);
		var user = '${userid}';
		var str = user + "님이 입장하셨습니다.";

		$("#msgArea").append(str);
	}
</script>
</html>