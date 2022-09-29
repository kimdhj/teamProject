
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
	
	let user_id = $("#user_id").val(); 
	let user_password = $("#user_password").val();
	
	if(confirm("정말로 구독을 취소하시겠습니까?") == true) {
		
		//비밀번호 검증
		$.ajax({
			url: "/cansubpass.do",
			method: "POST",
			data: {
				user_id: user_id,
				user_password: user_password
			},
			success: function(vo) {
				console.log(vo);
				if(vo==0){
					Swal.fire({
						text: "비밀번호를 확인해주세요!",
						icon: "error"
					}).then(function(){
						location.href="/my_cancelSub.do";
					})
				}else if(vo==1){
					$("form").submit();
				}else{
					location.href='/login.do';					
				}
					
			},
			error: function() {
			}
		});
		
		
	} else {
		return false;
	}

}


$("#easter_egg").dblclick(function(){
	$("#wester_egg").addClass("nullclass");
	setTimeout(() => {
		$("#wester_egg").attr("style", "color : #f18605 !important");
		$(document).on("dblclick", ".nullclass", function(){
			$("#easter_egg").addClass("notnullclass");
			$("#easter_egg").attr("style", "color : #dbd5e1 !important");
		});
	}, 1000);
});


$(document).on("dblclick", ".notnullclass", function(){
	location.href="/admin_login.mdo";
});









