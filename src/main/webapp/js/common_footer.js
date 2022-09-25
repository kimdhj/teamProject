
//구독 취소 페이지 이동
function can_sub() {

	$.ajax({
		url: "/check_csb.do",
		type: 'POST',
		success: function(data) {
			console.log(data.user_sub);
			if (data.user_sub == 1) {
				$.ajax({
					url: "/subcancel.do",
					type: 'POST',
					success: function() { }

				})
				location.href = "/my_cancelSub.do";
			} else {
				Swal.fire({
					text: "현재 구독하지 않은 상태입니다! 구독 결제창으로 이동합니다.",
					icon: "warning"
				})
//				alert("현재 구독하지 않은 상태입니다! 구독 결제 창으로 이동합니다.");
				location.href = "/event_Sub_Info.do";
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error while post');
		}
	});

}

//구독 취소 실행
function cancelsubs() {

	$("form").submit()

}













