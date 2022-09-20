function can_sub(){

	$.ajax({
		url: "/check_csb.do",
		type: 'POST',
		success: function(data) {
			console.log(data.user_sub);
			if(data.user_sub==1){
			location.href="/my_cancelSub.do";
			}
				alert("현재 구독하지 않은 상태입니다!");
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error while post');
		}
	});


}