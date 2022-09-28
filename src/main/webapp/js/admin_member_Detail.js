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
//	let user_name = document.getElementById("user_name");
//	let user_id = document.getElementById("user_id");
	let user_password = document.getElementById("user_password");
	let user_passwordCheck = document.getElementById("user_passwordCheck");
	let user_phone = document.getElementById("user_phone");
	let user_email = document.getElementById("user_email");
	//유효성 정규표현식
//	//이름
//	const reg_name_kor = /^[가-힣]+$/; //한글만
//	const reg_name_eng = /^[a-zA-z]+$/; //영문만
//	
//	//아이디
//	const reg_id = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/; //반드시 영문시작 숫자_언더바/하이픈 허용 4~20자리
	
	//비밀번호
	const reg_password = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,24}/; //문자, 특수문자 조합의 8~24자리
	
	//이메일
	const reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	//전화번호
	const reg_mobile = /^\d{3}\d{3,4}\d{4}$/; //휴대전화
	const reg_tel = /^\d{2,3}\d{3,4}\d{4}$/; //일반전화
	
	//주민번호
//	const reg_registrationNum = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/; //주민번호
	
//	if(user_name.value == "") {
//		alert("이름을 입력하세요");
//		user_name.focus(); //focus() : 커서 깜빡, blur() : 커서 사라짐
//		return false; //아무것도 반환하지 말고 아래코드부터 진행하지 말 것
//	}
//	if(!reg_name_kor.test(user_name.value) && !reg_name_eng.test(user_name.value)){
//		alert("한글 또는 영어로만 입력하세요");
//		user_name.focus();
//		return false;
//	}
	
//	if(user_id.value == ""){
//		alert("아이디를 입력하세요");
//		user_id.focus();
//		return false;
//	}
//	if(!reg_id.test(user_id.value)){
//		alert("아이디는 4~20글자 영문자로 시작, 특수문자 사용불가 (언더바 하이픈 사용가능)");
//		user_id.focus();
//		return false();
//	}


//	if(user_password.value == ""){
//		alert("비밀번호를 입력하세요");
//		user_password.focus();
//		return false;
//	}
//	if(!reg_password.test(user_password.value)){
//		alert("비밀번호는 문자 + 특수문자 조합의 8~24자리 입력")
//		user_password.focus();
//		return false;
//	}
//	if(user_password.value != user_passwordCheck.value) {
//		alert("비밀번호가 일치하지 않습니다 다시 입력해주세요");
//		user_passwordCheck.focus();
//		return false;
//	}
	
	
	
	
// 비밀번호가 빈값일 경우에는 체크하지않음 (유저정보 업데이트 할때 비밀번호가 null, '' 빈값 이면 비밀번호 변경 안되도록 쿼리문 수정
// 비밀번호 빈값 허용(빈값이 아닐경우에만 정규식 적용)
	if(user_password.value != ""){
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
	}
//여기까지 비밀번호 새로운 로직 끝	
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
	
	//수정확인
	if(confirm("정말 수정하시겠습니까?") == true) {
//		alert("수정이 완료되었습니다.")
		Swal.fire({
			text: "수정이 완료되었습니다.",
			icon: "success"
		})
	} else {
		return false;
	}
}//유효성검사 끝

//쿠폰삭제
function couponDelete() {
	let userCouponSeq = $("#myCouponMap").val();
	alert(userCouponSeq);
	
	$.ajax({
		url:"deleteUserCoupon.mdo",//Controller에서 받는 주소
		type:"post",
		data:{user_coupon_seq:userCouponSeq},
		success:function(){//성공했을때
//			alert("일단데이터는넘어가");
			location.reload();
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
//			alert("에러다이자시가");
		}
	});
	
}

//쿠폰지급
function giveCoupon() {
	if(confirm("정말 지급 하시겠습니까?") == true) {
	} else {
		return false;
	}
	let couponSeq = $("#giveCouponList").val();
	let user_id = $("#user_id").val();
	
	$.ajax({
		url:"giveCoupon.mdo",//Controller에서 받는 주소
		type:"post",
		data:{
			coupon_seq:couponSeq,
			user_id:user_id
			},
		success:function(){//성공했을때
			location.reload();
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
		}
	});
	
}

//쿠폰삭제
function couponDelete() {
	if(confirm("정말 삭제 하시겠습니까?") == true) {
	} else {
		return false;
	}
	let userCouponSeq = $("#myCouponMap").val();
	alert(userCouponSeq);
	
	$.ajax({
		url:"deleteUserCoupon.mdo",//Controller에서 받는 주소
		type:"post",
		data:{user_coupon_seq:userCouponSeq},
		success:function(){//성공했을때
			location.reload();
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
//			alert("에러다이자시가");
		}
	});
	
}

//포인트 넣고 빼고 함수
$(document).ready(function(){
	
	const givePoint1 = Number($("#givePoint1").val());	
	const givePoint2 = Number($("#givePoint2").val());	
	const givePoint3 = Number($("#givePoint3").val());	
	const deletePoint1 = Number($("#deletePoint1").val());	
	const deletePoint2 = Number($("#deletePoint2").val());	
	const deletePoint3 = Number($("#deletePoint3").val());	
	
	//리셋 버튼클릭
	$("#givePointResetBtn").on("click", function(){
		$("input[id=givePoint]").val(0);
	});
	
	$("#deletePointResetBtn").on("click", function(){
		$("input[id=deletePoint]").val(0);
	});
	
	//숫자 더하고 빼기
	$("#givePoint1").on("click", function(){
		let givePoint = Number($("#givePoint").val());
		givePoint += givePoint1;
		$("input[id=givePoint]").val(givePoint);
	});
	$("#givePoint2").on("click", function(){
		let givePoint = Number($("#givePoint").val());
		givePoint += givePoint2;
		$("input[id=givePoint]").val(givePoint);
	});
	$("#givePoint3").on("click", function(){
		let givePoint = Number($("#givePoint").val());
		givePoint += givePoint3;
		$("input[id=givePoint]").val(givePoint);
	});
	
	$("#deletePoint1").on("click", function(){
		let deletePoint = Number($("#deletePoint").val());
		deletePoint += deletePoint1;
		$("input[id=deletePoint]").val(deletePoint);
	});
	$("#deletePoint2").on("click", function(){
		let deletePoint = Number($("#deletePoint").val());
		deletePoint += deletePoint2;
		$("input[id=deletePoint]").val(deletePoint);
	});
	$("#deletePoint3").on("click", function(){
		let deletePoint = Number($("#deletePoint").val());
		deletePoint += deletePoint3;
		$("input[id=deletePoint]").val(deletePoint);
	});
	
});


$("#givePointBtn").on("click", function(){
	
	let givePoint = Number($("#givePoint").val());
	let user_id = $("#user_id").val();
	
	$.ajax({
		url:"givePoint.mdo",
		type:"post",
		data:{
			givePoint:givePoint,
			user_id:user_id
		},
		success:function(){
			if(confirm("정말 지급 하시겠습니까?") == true) {
				location.reload();
			} else {
				return false;
			}
			
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
//			alert("에러다이자시가");
		}
	});
});

$("#deletePointBtn").on("click", function(){
	if(confirm("정말 차감 하시겠습니까?") == true) {
	} else {
		return false;
	}
	let deletePoint = Number($("#deletePoint").val());
	let user_id = $("#user_id").val();
	$.ajax({
		url:"deletePoint.mdo",
		type:"post",
		data:{
			deletePoint:deletePoint,
			user_id:user_id
		},
		success:function(returnValue){
			if(returnValue == 1) {
				location.reload();
			} else if(returnValue == 0) {
				Swal.fire({
					text: "보유 포인트보다 차감포인트가 더 큽니다.",
					icon: "warning"
				})
//				alert("보유 포인트보다 차감포인트가 더 큽니다.");
			} else {//재로그인 필요
				Swal.fire({
					text: "다시 로그인 하세요.",
					icon: "warning"
				})
//				alert("다시 로그인 하세요");
			}
			
		},
		error:function(){
			Swal.fire({
				text: "에러!",
				icon: "error"
			})
//			alert("에러다이자시가");
		}
	});
});












//// @breif contenteditable 속성을 가진경우
//        contents = document.getElementsByClassName("rowColumn");
//        document.addEventListener("DOMContentLoaded", function () {
//
//            // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
//            Array.from(contents).forEach(function (content) {
//
//                // @breif 마우스로 해당영역을 더블클릭 한경우
//                content.addEventListener("dblclick", function (event) {
//
//                    // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
//                    Array.from(contents).forEach(function (defaultVal) {
//
//                        // @details 빈값( null )이 존재하는지 체크한다.
//                        /* if(
//                               defaultVal.textContent == ""
//                            || defaultVal.textContent == null
//                            || defaultVal.textContent == undefined
//                            || (defaultVal.textContent != null
//                            && typeof defaultVal.textContent == "object"
//                            && !Object.keys(defaultVal.textContent).length == ""))
//                        {
//    
//                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
//                            defaultVal.textContent = defaultVal.dataset.default;
//                        }
//                         */
//
//                        // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
//                        defaultVal.textContent = defaultVal.dataset.default;
//
//                        // @breif 수정 불가 상태로 되돌린다.
//                        defaultVal.contentEditable = false;
//                        defaultVal.style.border = "0px";
//                    });
//
//                    if (content.isContentEditable == false) {
//
//                        // @details 편집 가능 상태로 변경
//                        content.contentEditable = true;
//
//                        // @details 텍스트 문구 변경
//                        // content.textContent = "";
//
//                        // @details CSS 효과 추가
//                        content.style.border = "1px solid #FFB6C1";
//
//                        // @details 포커스 지정
//                        content.focus();
//
//                    }
//
//                });
//
//
//
//                // @breif 키보드 입력이 방생한 경우 실행
//                content.addEventListener("keypress", function (event) {
//
//                    // @breif Enter키 입력시 실행
//                    if (event.key === "Enter") {
//
//                        // @details 입력된 값이 빈값( null )인지 체크한다.
//                        if (content.textContent == "" || content.textContent == null || content.textContent == undefined || (content.textContent != null && typeof content.textContent == "object" && !Object.keys(content.textContent).length == "")) {
//
//                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
//                            content.textContent = content.dataset.default;
//
//                        } else {
//                            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
//                            content.dataset.default = content.textContent;
//
//                        }
//                        // @breif 수정 불가 상태로 되돌린다.
//                        content.contentEditable = false;
//                        content.style.border = "0px";
//                    }
//
//                });
//
//            });
//
//        });