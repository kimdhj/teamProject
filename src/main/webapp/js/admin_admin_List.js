function checkNum() { //key code reference table 48(0) ~ 57(9)
		if (event.keyCode < 48 || event.keyCode > 57) {
			event.returnValue = false;
		}
	}
	function passwordCheckFunction() {
		let adminPassword1 = $('#user_password').val();
		let adminPassword2 = $('#user_passwordCheck').val();
			
		if (adminPassword1 != adminPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
	
function adminAccountCheck() { //유효성 검사
	let user_name = document.getElementById("user_name");
	let user_id = document.getElementById("user_id");
	let user_password = document.getElementById("user_password");
	let user_passwordCheck = document.getElementById("user_passwordCheck");
	let user_phone = document.getElementById("user_phone");
	let user_email = document.getElementById("user_email");
	
	//유효성 정규표현식
	//이름
	const reg_name_kor = /^[가-힣]+$/; //한글만
	const reg_name_eng = /^[a-zA-z]+$/; //영문만
	
	//아이디
	const reg_id = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/; //반드시 영문시작 숫자_언더바/하이픈 허용 4~20자리
	
	//비밀번호
	const reg_password = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/; //문자, 특수문자 조합의 8~24자리
	
	//이메일
	const reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	//전화번호
	const reg_mobile = /^\d{3}\d{3,4}\d{4}$/; //휴대전화
	const reg_tel = /^\d{2,3}\d{3,4}\d{4}$/; //일반전화
	
	//주민번호
	const reg_registrationNum = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/; //주민번호
	
	if(user_name.value == "") {
		alert("이름을 입력하세요");
		user_name.focus(); //focus() : 커서 깜빡, blur() : 커서 사라짐
		return false; //아무것도 반환하지 말고 아래코드부터 진행하지 말 것
	}
	if(!reg_name_kor.test(user_name.value) && !reg_name_eng.test(user_name.value)){
		alert("한글 또는 영어로만 입력하세요");
		user_name.focus();
		return false;
	}
	
	if(user_id.value == ""){
		alert("아이디를 입력하세요");
		user_id.focus();
		return false;
	}
	if(!reg_id.test(user_id.value)){
		alert("아이디는 4~20글자 영문자로 시작, 특수문자 사용불가 (언더바 하이픈 사용가능)");
		user_id.focus();
		return false();
	}
	
	if(user_password.value == ""){
		alert("비밀번호를 입력하세요");
		user_password.focus();
		return false;
	}
	if(!reg_password.test(user_password.value)){
		alert("비밀번호는 문자 + 특수문자 조합의 8~24자리 입력")
		user_password.focus();
		return false;
	}
	if(user_password.value != user_passwordCheck.value) {
		alert("비밀번호가 일치하지 않습니다 다시 입력해주세요");
		user_passwordCheck.focus();
		return false;
	}
	
	if(user_phone.value == ""){
		alert("전화번호를 입력하세요");
		user_phone.focus();
		return false;
	}
	if(!reg_mobile.test(user_phone.value) && !reg_tel.test(user_phone.value)){
		alert("전화번호 형식에 맞게 다시 입력하세요 (ex : 01012341234)");
		user_phone.focus();
		return false;
	}
	
	if(user_email.value == ""){
		alert("이메일을 입력하세요");
		user_email.focus();
		return false;
	}
	if(!reg_email.test(user_email.value)) {
		alert("이메일을 다시 입력해주세요");
		user_email.focus();
		return false;
	}	
	
	if(confirm("정말 등록하시겠습니까?") == true) {
		alert("등록이 완료되었습니다.")
	} else {
		return false;
	}
	
}//유효성검사 끝

//아이디 중복검사
function checkId(){
	//아이디 정규식
	const reg_id = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/; //반드시 영문시작 숫자_언더바/하이픈 허용 4~20자리
	
	let user_id = $("#user_id").val();
	console.log(user_id);
	$.ajax({
		url:"idCheck.mdo", //Controller에서 받는 주소
		type:"post",
		data:{user_id:user_id},
		success:function(cnt){//Controller에서 받은 cnt값
			if(cnt == 0) {
				alert("사용 가능한 아이디 입니다.");
			} else {
				alert("이미 사용중인 아이디 입니다.");
				$("#user_id").val("");
			}		
		},
		error:function(){
			alert("에러다이말이야");
		}
	});
}

function delAdmin(){
	if(confirm("정말 삭제하시겠습니까?") == true){
	
	} else {
		return false;
	}
}




























