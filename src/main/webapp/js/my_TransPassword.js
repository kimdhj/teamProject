function checkNum() { //key code reference table 48(0) ~ 57(9)
	if (event.keyCode < 48 || event.keyCode > 57) {
		event.returnValue = false;
	}
}

//비밀번호 유효성 체크 및 강도 확인
function passwordChanged() {
    let strength = document.getElementById('strength');
    const strongRegex = new RegExp("^(?=.{14,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    const mediumRegex = new RegExp("^(?=.{10,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
    const enoughRegex = new RegExp("(?=.{8,}).*", "g");
    let user_password = document.getElementById("user_password");
    let user_passwordCheck = document.getElementById("user_passwordCheck");
    
    if (user_password.value.length == 0) {
        strength.innerHTML = '낮음';
    } else if (false == enoughRegex.test(user_password.value)) {
        strength.innerHTML = '더입력하세요';
    } else if (strongRegex.test(user_password.value)) {
        strength.innerHTML = '<span style="color:green">강력</span>';
    } else if (mediumRegex.test(user_password.value)) {
        strength.innerHTML = '<span style="color:orange">중간</span>';
    } else {
        strength.innerHTML = '<span style="color:red">낮음</span>';
    }
    
    if (user_password.value != user_passwordCheck.value) {
    	document.getElementById("passwordCheckMessage").innerHTML = "비밀번호 일치하지 않음";
    } else {
    	document.getElementById("passwordCheckMessage").innerHTML = "";
    }

}

function passwordChangedForm() {
	let user_now_password = document.getElementById("user_now_password");
	let user_password = document.getElementById("user_password");
	let user_passwordCheck = document.getElementById("user_passwordCheck");
	
	//비밀번호
	const reg_password = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/; //문자, 특수문자 조합의 8~24자리
	
	if(user_now_password.value.length == 0) {
		alert("기존 비밀번호를 입력하세요");
		user_now_password.focus();
		return false;
	}
	if(user_password.value.length == 0) {
		alert("새 비밀번호를 입력하세요");
		user_password.focus();
		return false;
	}
	if(user_passwordCheck.value.length == 0) {
		alert("새 비밀번호 확인을 입력하세요");
		user_passwordCheck.focus();
		return false;
	}
	if(user_password.value != user_passwordCheck.value) {
		alert("비밀번호가 일치하지 않습니다 다시 입력하세요");
		user_passwordCheck.value = "";
		user_passwordCheck.focus();
		return false;
	}
	
	if(!reg_password.test(user_password.value)){
		alert("비밀번호는 문자 + 특수문자 조합의 8~24자리 입력")
		user_password.focus();
		return false;
	}
	
	if(confirm("정말 변경하시겠습니까?") == true) {
		alert("변경되었습니다.")
	} else {
		return false;
	}
}

function checkPassword(){
	alert("비밀번호 확인 시작");
	let user_now_password = $("#user_now_password").val();
	console.log(user_password);
	
	if(user_now_password == ""){
		alert("비밀번호를 입력하세요");
		return false;
	} //입력을 안했다면 서버와 통신하지 않는다.
	
	$.ajax({
		url:"passwordCheck.do", //Controller에서 받는 주소
		type:"post",
		data:{user_now_password:user_now_password},
		success:function(checkPassword){//Controller에서 받은 값 사용
//			alert("일단 진입성공");
			if(checkPassword == 1) {
				alert("비밀번호 일치함");
			} else if(checkPassword == 2) {
				alert("비밀번호가 일치하지 않습니다");
			} else {//checkPassword == 0 인 경우 (세션에 토큰없음)
				alert("다시 로그인 해주세요");
				location.href = "/login.do";
			}
		},
		error:function(){
			alert("에러다이자시가");
		}
			
	});
}

