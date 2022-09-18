$("#delFile").on("click", function(){
	console.log("파일삭제");
	let file = $("#uploadFile").val("");
});

function checkWriteForm() {
	let ask_content = $('#ask_content');
		
	if(ask_content.val() == "") {
		alert("내용을 입력하세요");
		ask_content.focus();
		return false;
	}

}

$("#updateMyRequestBtn").on("click", function(){
	let ask_password = $("#ask_password").val();
	let ask_seq = $("#ask_seq").val();
		
	if(confirm("정말 수정하시겠습니까?") == true) {
		console.log("수정 눌렀대요~");
	} else {
		return false;
	}
	
	//여기서 글 비번 확인한뒤 맞으면 submit, 틀리면 넘기지않는다.
	//returnValue값이 0이면 성공, 1이면 비번틀림 2이면 재로그인필요
	$.ajax({
		url:"myRequestPasswordCheck.do",
		type:"post",
		data:{
			ask_password:ask_password,
			ask_seq:ask_seq
		},
		success:function(returnValue){
			if(returnValue == 0) {
				alert("비밀번호 확인 완료!");
				$("#updateMyRequestForm").submit();
				return false;
			} else if(returnValue == 1) {
				alert("비밀번호를 다시 입력하세요");
				return false;
			} else { //returnValue가 2인 경우
				alert("재로그인 필요");
				return false;
			}
			
		},
		error:function(){
			alert("에러다 이자시가");
		}
	});
	
	
	
	
});