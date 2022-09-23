function formCheck() {
	let session_user_id = $("#session_user_id");
	let user_id = $("#user_id");
	let user_password = $("#user_password");
	
	alert(session_user_id.val());
	
	if(user_id.val() == "") {
		alert("아이디를 입력하세요.");
		user_id.focus();
		return false;
	}
	
	if(user_password.val() == "") {
		alert("비밀번호를 입력하세요.");
		user_password.focus();
		return false;
	}
	
	//입력한 아이디가 현재 접속한 유저의 세션정보에 있는 아이디와 일치할 경우 탈퇴여부 묻는다
	if(session_user_id.val() === user_id.val()) {
		if(confirm("정말 탈퇴하시겠습니까?") == true) {
		} else {
			return false;
		}
	} else {
		Swal.fire({
			text: "아이디를 다시 입력해주세요.",
			icon: "warning"
		})
//		alert("아이디를 다시 입력해주세요");
		return false;
	}
	
}