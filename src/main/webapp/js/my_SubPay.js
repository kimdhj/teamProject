$(document).ready(function() {

	$.ajax({

		url: "import.do",
		dataType: "json",
		success: function(re) {
			console.log("suc" + re)
		},
		error: function(re) {
			console.log(re.responseText);
			IMP.init(re.responseText.trim());
		}
	})

function timestamp(){
    var today = new Date();
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 19);
}

	function getToday() {
		var date = new Date();
		date.setDate(date.getDate() + 7);
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		return year + month + day;
	}

	$("#paystart").click(function() {
	let cuid=$("#user_id").val()+timestamp().replaceAll(" ","").replaceAll(":","").replaceAll("-","");
console.log(cuid);
		console.log("메롱",cuid);
		var radioVal = $('input[name="orders_cache_tools"]:checked').val();
		console.log(radioVal);
		
		if (radioVal.trim() == "카드") {
		console.log("메롱",cuid);
			card(cuid);
		} else {
		console.log("메롱",cuid);
			kakao(cuid);
		}


	});
	//카카오결제
	function kakao(cuid) {
		IMP.request_pay({ // param 설정은 위에서 업급한 PG사별 연동 가이드를 참고하세요.
			customer_uid: cuid,
			pg: "kakaopay.TCSUBSCRIP",
			pay_method: "card",
		
			name: '구독 결제',
			amount: 30000
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp.success);
				$.ajax({
					url: "subreg.do",
					method: "POST",
					data: {
						cuid: cuid
					},
					async: true,
					dataType: "JSON",
					succnss: function(e) {
						console.log("성공");
					}
				})
				// 빌링키 발급 성공
			} else {
				// 빌링키 발급 실패
				console.log(rsp);
			}

		});
	}
	//카드 결제
	function card(cuid) {

		IMP.request_pay({ // param 설정은 위에서 업급한 PG사별 연동 가이드를 참고하세요.
			customer_uid: cuid,
			pg: "html5_inicis.INIBillTst",
			pay_method: "card",
			
			name: '결제테스트',
			amount: 30000

		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp.success);
				console.log(rsp);
				$.ajax({
					url: "subreg.do",
					method: "POST",
					data: {
						cuid: cuid
					},
					async: true,
					dataType: "JSON",
					success: function(e) {
						console.log("성공");
					}
				})
				// 빌링키 발급 성공
			} else {
				// 빌링키 발급 실패
				console.log(rsp);
			}

		});
	}
})
