function formCheck() {
	let user_id = $("#user_id");
	let user_password = $("#user_password");
	
	if(user_id.val() == "") {
		alert("아이디를 입력하세요");
		user_id.focus();
		return false;
	}
	
	if(user_password.val() == "") {
		alert("비밀번호를 입력하세요");
		user_password.focus();
		return false;
	}
	
	if(confirm("정말 탈퇴하시겠습니까?") == true) {
		alert("회원탈퇴 되었습니다.");
	} else {
		return false;
	}
}