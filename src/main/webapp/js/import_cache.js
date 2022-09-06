		//핸드폰결제
		function phone() {
			IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : "html5_inicis.INIpayTest",
				pay_method : "phone", //가상계좌 vbank 카드결제(네이버 및 카카오) card
				name : '결제테스트',
				amount : 200,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
				//vbank_due:'20220828'//결제기한제한
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					console.log(rsp.success);
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});

		} 
//카드
function card() {
			IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : "html5_inicis.INIpayTest",
				pay_method : "card", //가상계좌 vbank 카드결제(네이버 및 카카오) card
				name : '결제테스트',
				amount : 200,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
		
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					console.log(rsp.success);
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});

		} 
//가상계좌
		function vbank() {
			IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : "html5_inicis.INIpayTest",
				pay_method : "vbank", //가상계좌 vbank 카드결제(네이버 및 카카오) card
				name : '결제테스트',
				amount : 200,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				vbank_due:'20220828'//결제기한제한
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					console.log(rsp.success);
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});

		} 
//실시간계좌 이체
function trans() {
			IMP.init('imp01863204'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : "html5_inicis.INIpayTest",
				pay_method : "trans", //가상계좌 vbank 카드결제(네이버 및 카카오) card//trans실시간 계좌이체
				name : '결제테스트',
				amount : 200,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
				//vbank_due:'20220828'//결제기한제한
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					console.log(rsp.success);
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});

		} 