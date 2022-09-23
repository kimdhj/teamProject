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
	
//	Swal.fire({
//		text: "정말 수정하시겠습니까?",
//		icon: "warning",
//		showCancelButton: true,
//		confirmButtonColor: '#3085d6',
//		cancelButtonColor: '#d33',
//		confirmButtonText: '예',
//		cancelButtonText: '아니오',
//	}).then((result) => {
//		if (result.isConfirmed) {
//			Swal.fire({
//				text: "수정하였습니다.",
//				icon: "success",
//				showConfirmButton: false,
//				timer: 1500,
//			})
//			// 보내줄 주소 적어주고 싶은 경우, location.href="#";
//		}else if(result.isDismissed){
//			return false;
//		}
//	})
		
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
				Swal.fire({
					text: "비밀번호 확인을 완료하였습니다.",
					icon: "success"
				})
//				alert("비밀번호 확인 완료!");
				$("#updateMyRequestForm").submit();
				return false;
				
			} else if(returnValue == 1) {
				Swal.fire({
					text: "비밀번호를 다시 입력하세요.",
					icon: "error"
				})
//				alert("비밀번호를 다시 입력하세요");
				return false;
			} else { //returnValue가 2인 경우
				Swal.fire({
					text: "로그인을 다시 해주세요.",
					icon: "warning"
				})
//				alert("재로그인 필요");
				return false;
			}
			
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
//			alert("에러다 이자시가");
		}
	});
});

//문의글 삭제
$("#deleteMyRequestBtn").on("click", function(){
	let ask_password = $("#ask_password").val();
	let ask_seq = $("#ask_seq").val();
	
	if(confirm("정말 삭제하시겠습니까?") == true) {
		console.log("삭제 눌렀대요~");
	} else {
		return false;
	}
	
	//여기서 글 비번 확인한뒤 맞으면 삭제
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
				deleteMyRequest(ask_password, ask_seq); //글삭제 함수
				return false;
			} else if(returnValue == 1) {
				Swal.fire({
					text: "비밀번호를 다시 입력하세요.",
					icon: "warning"
				})
//				alert("비밀번호를 다시 입력하세요");
				return false;
			} else { //returnValue가 2인 경우
				Swal.fire({
					text: "로그인을 다시 해주세요.",
					icon: "warning"
				})
//				alert("재로그인 필요");
				return false;
			}
			
		},
		error:function(){
			Swal.fire({
				text: "에러",
				icon: "error"
			})
//			alert("에러다 이자시가");
		}
	});
});
//글 삭제시 비밀번호 체크 하면서 성공하면 글삭제로 가기
function deleteMyRequest(ask_seq) {
	console.log(ask_seq);	
	//비밀번호 확인 끝났으니 글번호만 가져가서 삭제한다.
	$.ajax({
		url:"deleteMyRequest.do",
		type:"post",
		data:{ask_seq:ask_seq},
		success:function(){
			Swal.fire({
				text: "삭제가 완료되었습니다.",
				icon: "success"
			})
//			console.log("삭제완료");
			location.replace("myRequestList.do");
		},
		error:function(){
			Swal.fire({
				text: "에러",
				icon: "error"
			})
//			alert("에러다 이자시가");
		}
	});
}
	
