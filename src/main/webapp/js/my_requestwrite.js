$("#returnListBtn").on("click", function(){
	let url = "/myRequestList.do";
	location.href = url;
});

$("#delFile").on("click", function(){
	console.log("파일삭제");
	let file = $("#uploadFile").val("");
});

$("#returnListBtn").on("click", function(){
	let url = "/myRequestList.do";
	location.href = url;
});


function checkWriteForm() {
	let ask_title = $('#ask_title');
	let ask_content = $('#ask_content');
	let ask_password = $('#ask_password');
	
	if(ask_title.val() == "") {
		alert("제목을 입력하세요");
		ask_title.focus();
		return false;
	}
	if(ask_content.val() == "") {
		alert("내용을 입력하세요");
		ask_content.focus();
		return false;
	}
	if(ask_password.val() == "") {
		alert("비밀번호를 입력하세요");
		ask_password.focus();
		return false;
	}
	
	if(confirm("정말 수정하시겠습니까?") == true) {
		alert("수정이 완료되었습니다.")
	} else {
		return false;
	}
	
}