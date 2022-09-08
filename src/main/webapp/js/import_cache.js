$(document).ready(function() {
	console.log($("#usePoint").val());

	function getToday() {
		var date = new Date();
		date.setDate(date.getDate() + 7);
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		return year + month + day;
	}
	$("#paystart").click(function() {
		console.log($("#orders_name").val());
		var radioVal = $('input[name="orders_cache_tools"]:checked').val();
	console.log(radioVal);
		let title = $("#bookName").text().trim() + " 외 " + $("#items").children().length + "권";
		let amount = Number($("#sumsumsum").text().trim().replaceAll(",", "")) + Number($("#delivery").text().trim().replaceAll(",", ""));
		let email = $("#orders_email").val();
		let name = $("#orders_name").val();
		let tel = $("#phone").val();
		let address = $("#orders_address").val() + $("#orders_remainaddress").val();
		let postcode = $("#zipcode").val();
		let due = getToday();
		$("#orders_title").val(title);
		console.log(title, amount, email, name, tel, address, postcode, due);
		if (amount != 0) {
			if (radioVal == "핸드폰결제") {

				phone(title, amount, email, name, tel, address, postcode);
			} else if (radioVal == "계좌이체") {
				trans(title, amount, email, name, tel, address, postcode, due);
			} else if (radioVal == "가상계좌") {
			if($("#refund_num").val().trim().length<11||$("#refund_bank").val()==0){
			alert("환불계좌 또는 은행을 확인해주세요");
			return;
			}
				vbank(title, amount, email, name, tel, address, postcode, due);
			} else {
				card(title, amount, email, name, tel, address, postcode);
			}
			
		}
	})
	//핸드폰결제

	function phone(title, amount, email, name, tel, address, postcode) {
		IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",
			pay_method: "phone", //가상계좌 vbank 카드결제(네이버 및 카카오) card
			name: title,
			amount: amount,
			buyer_email: email,
			buyer_name: name,
			buyer_tel: tel,
			buyer_addr: address,
			buyer_postcode: postcode

		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				console.log(rsp.success);
				let data = rsp;
				console.log(data.imp_uid);
				console.log($("#orders_cache_uid"));
				$("#orders_cache_uid").val(data.imp_uid);
				$("#cache_tool").val(data.pay_method);
				$("#orders_cache_sum").val(data.paid_amount);
				$("#orders_status").val(data.status);
				$("#payfin").submit();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});

	}
	//카드
	function card(title, amount, email, name, tel, address, postcode) {
		IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",
			pay_method: "card", //가상계좌 vbank 카드결제(네이버 및 카카오) card
			name: title,
			amount: amount,
			buyer_email: email,
			buyer_name: name,
			buyer_tel: name,
			buyer_addr: address,
			buyer_postcode: postcode

		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				console.log(rsp.success);
				let data = rsp;
				console.log(data.imp_uid);

				$("#orders_cache_uid").val(data.imp_uid);
				$("#cache_tool").val(data.pay_method);
				$("#orders_cache_sum").val(data.paid_amount);
				$("#orders_status").val(data.status);
				$("#payfin").submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});

	}
	//가상계좌
	function vbank(title, amount, email, name, tel, address, postcode, due) {
		IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",
			pay_method: "vbank", //가상계좌 vbank 카드결제(네이버 및 카카오) card
			name: title,
			amount: amount,
			buyer_email: email,
			buyer_name: name,
			buyer_tel: tel,
			buyer_addr: address,
			buyer_postcode: postcode,
			vbank_due: due
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				console.log(rsp.success);
				let data = rsp;
				console.log(data.imp_uid);
				$("#orders_cache_uid").val(data.imp_uid);
				$("#cache_tool").val(data.pay_method);
				$("#orders_cache_sum").val(data.paid_amount);
				$("#orders_status").val(data.status);
				$("#vbank_name").val(data.vbank_name);
				$("#orders_vbank_num").val(data.vbank_num);
				$("#orders_vbank_Date").val(data.vbank_date);
				$("#payfin").submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});

	}
	//실시간계좌 이체
	function trans(title, amount, email, name, tel, address, postcode) {
		IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg: "html5_inicis.INIpayTest",
			pay_method: "trans", //가상계좌 vbank 카드결제(네이버 및 카카오) card//trans실시간 계좌이체
			name: title,
			amount: amount,
			buyer_email: email,
			buyer_name: name,
			buyer_tel: tel,
			buyer_addr: address,
			buyer_postcode: postcode

		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				console.log(rsp.success);
				let data = rsp;
				console.log(data.imp_uid);
				$("#orders_cache_uid").val(data.imp_uid);
				$("#cache_tool").val(data.pay_method);
				$("#orders_cache_sum").val(data.paid_amount);
				$("#orders_status").val(data.status);
				$("#payfin").submit();

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});

	}
}) 