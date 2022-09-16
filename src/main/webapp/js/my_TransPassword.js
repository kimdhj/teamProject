let checkPoint = 0; //비밀번호 확인은 했는가? 체크포인트가 1일경우에만 수정되도록

function nowPasswordCheck(){ //비밀번호 확인 한 이후에 기존비밀번호를 변경한다면?
	//이렇게 할 경우 비밀번호 확인해서 성공하여 checkPoint가 1이된 이후에
	//추가 변경사항이 발생하면 0으로 다시 바뀐다.
	checkPoint = 0;
}


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
	alert("체크포인트 값 1이면 확인한것! : " + checkPoint);//체크포인트 값 확인 (1일경우에만 수정가능 하도록)
	let user_now_password = document.getElementById("user_now_password");
	let user_password = document.getElementById("user_password");
	let user_passwordCheck = document.getElementById("user_passwordCheck");
	
	//비밀번호
	const reg_password = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/; //문자, 특수문자 조합의 8~24자리
	
	if(checkPoint == 0) {
		alert("비밀번호 확인을 눌러주세요");
		return false;
	} else {
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
				checkPoint = 1;//비밀번호 확인 눌렀는데 비밀번호 일치하는경우에만 체크포인트 1로!
				return false;
			} else if(checkPassword == 2) {
				alert("비밀번호가 일치하지 않습니다");
				user_now_password = "";
				$("#user_now_password").focus();
				return false;
			} else {//checkPassword == 0 인 경우 (세션에 토큰없음)
				alert("다시 로그인 해주세요");
				location.href = "/login.do";
				return false;
			}
		},
		error:function(){
			alert("에러다이자시가");
			return false;
		}
			
	});
}

