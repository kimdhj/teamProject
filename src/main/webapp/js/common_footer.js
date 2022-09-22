
//구독 취소 페이지 이동
function can_sub(){

	$.ajax({
		url: "/check_csb.do",
		type: 'POST',
		success: function(data) {
			console.log(data.user_sub);
			if(data.user_sub==1){
			location.href="/my_cancelSub.do";
			}else{
				alert("현재 구독하지 않은 상태입니다!");
				}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log('error while post');
		}
	});

}

//구독 취소 실행
function cancelsubs(){
			
	$("form").submit()
	
}













