function isMaster() {
	$.ajax({
		url:"/isMaster.mdo",
		type:"post",
		data:{},
		success:function(returnValue){
			let url = "/getAdmin_admin_List.mdo"
			if(returnValue == 0) {
				alert("환영합니다. 마스터");
				location.href = url;
				return false;
			} else {
				alert("권한이 부족합니다.");
				return false;
			}
		},
		error:function(){
			alert("에러다이자시가");
		}
	});
	
}