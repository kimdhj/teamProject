	init();
	function init() {
		$
				.ajax({
					url : "/selectList.do",
					method : "GET",
					dataType : "json",
					async:true,
					success : function(data) {
						$("#msgArea").html("");
						for (let i = 0; i < data.length; i++) {
							if (data[i].real_chat_name.indexOf("admin") < 0) {
								let add = "/chatAdmin.do?user=" + data[i].real_chat_name
										+ "admin"
								let str = `<button onclick='del(this)' class="col-auto">` + "삭제"
										+ `</button>`
								str += "<a id='parents' target='_blank' href='"+add+"'><div class='col-6'>";
								str += "<div class='alert alert-secondary d-flex'>";

								str += `<div class="col-auto" id="name">`
										+ data[i].real_chat_name + `</div>`
								str += `<div class="col">` + data[i].real_chat_content
										+ `</div>`
								str += `<div id="`+data[i].real_chat_session+`" class="`+data[i].real_chat_name+` col-auto" >`
										+ data[i].num + `</div>`
								str += "</div></div></a>";

								$("#msgArea").append(str);
							}
						}
						console.log(data);

					}

				})
	}
	function del(e) {
		console.log($(e).next().children().children().children("#name").text());
		let name=$(e).next().children().children().children("#name").text();
		$.ajax({
			url : "/delet.do",
			data : {
				real_chat_name : name,

			},
			async:true,
			method : "GET",
			dataType : "json",
			success : function(data) {
				 init();

			}
		});
		$.ajax({
			url : "/delet.do",
			data : {
				real_chat_name : name+"admin"

			},
			async:true,
			method : "GET",
			dataType : "json",
			success : function(data) {
				 init();

			}
		});
		
		
	}

	let names = [];
	//전송 버튼 누르는 이벤트
	$("#button-send").on("click", function(e) {
		sendMessage();
		$('#msg').val('')
	});

	var sock = new SockJS('http://localhost:8080/echo');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	let sessionId = null;
	function sendMessage() {
		let mes = '${userid}' + ":" + $("#msg").val();
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

		var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
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
			init();
			//사용자가 처음 멩세제 보냈을때

		}

		//다른관리자가 확인했을때
		if (arr[1] && arr[1].indexOf("admin") > 0) {
			//사용자 확인 안한 갯수 확인해서 숫자 변경(db)
			init();
			console.log("숫자초기화");
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