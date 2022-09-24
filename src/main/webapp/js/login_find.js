//이름
let namereg = /^[ㄱ-ㅣ가-힣]{3,5}$/;
$("#passwordfind #name").on("propertychange change paste input keyUp keyDown", function(e) {

	if (namereg.test($(e.target).val().trim())) {
		$("#passwordfind #fin").removeAttr("disabled");

		$("#passwordfind #nameword").text("");

	} else {
		$("#passwordfind #fin").attr("disabled", "true");

		$("#passwordfind #nameword").text("한글만 3~5글자만 입력해주세요");
	}
});
//전화번호 밑 인증
$("#passwordfind #phone").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	console.log($(e.target).val().length);
	if ($(e.target).val().length == 11) {
		$("#passwordfind #phchestart").removeAttr("disabled");
		$("#passwordfind #fin").removeAttr("disabled");
		$("#passwordfind #phche").removeAttr("disabled");
		$("#passwordfind #phchestart").removeAttr("disabled");
		$("#passwordfind #phword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 11));
		if ($(e.target).val().length < 11) {
			$("#passwordfind #fin").attr("disabled", "true");
			$("#passwordfind #phche").attr("disabled", "true");
			$("#passwordfind #phchestart").attr("disabled", "true");
			$("#passwordfind #phword").text("핸드폰번호 -없이 숫자만 11글자를 입력하세요");
		}
	}
});
$("#passwordfind #chenum").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	if ($(e.target).val().length == 6) {

		$("#passwordfind #fin").removeAttr("disabled");

		$("#passwordfind #chword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 6));
		if ($(e.target).val().length < 6) {
			$("#passwordfind #fin").attr("disabled", "true");

			$("#passwordfind #chword").text("인증번호 6글자 입력해주세요");
		}
	}
});
var passwordtimers = null;
let passwordchenum = "";
let passwordfin = false;
$("#passwordfind #phchestart").click(function(e) {
	if (!namereg.test($("#passwordfind #name").val().trim())) {
		$("#passwordfind #name").focus();
		alert("이름을 형식에 맞게 입력해주세요");
		return;
	}
	passwordfin = false;
	$.ajax({
		url: "sendChe.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: { phone: $("#passwordfind #phone").val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
		method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		dataType: "json", // 서버에서 보내줄 데이터의 타입
		success: function(re) {

			passwordchenum = re;

		}
	})
	clearInterval(passwordtimers);
	var timer = 300;
	$("#passwordfind #phche").removeAttr("disabled");
	$("#passwordfind #chenum").removeAttr("disabled");
	$("#passwordfind #fin").attr("disabled", "true");
	passwordtimers = setInterval(function() {

		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;


		if (timer <= 0) {
			clearInterval(passwordtimers);
			$("#passwordfind #phche").attr("disabled", "true");
			$("#passwordfind #chenum").attr("disabled", "true");
			$("#passwordfind #chenum").text("");
			$("#passwordfind #time").text("");

		}
		$("#passwordfind #time").text(minutes + ":" + seconds);
		timer--;
	}, 1000);


});
$("#passwordfind #phche").click(function(e) {
	if (passwordchenum == $("#passwordfind #chenum").val().trim()) {
		$("#passwordfind #phchestart").attr("disabled", "true");
		clearInterval(passwordtimers);
		passwordfin = true;
		$("#passwordfind #time").text("인증 완료 되었습니다.");
		$("#passwordfind #time").css("color", "green");
	} else {
		$("#passwordfind #chenum").text("인증 실패 다시 확인해주세요.");
	}
})
//이메일
let emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
$("#passwordfind #email").on("propertychange change paste input keyUp keyDown", function(e) {

	if (emailreg.test($(e.target).val().trim())) {
		$("#passwordfind #fin").removeAttr("disabled");
		$("#passwordfind #emailchestart").removeAttr("disabled");
		$("#passwordfind #emailword").text("");

	} else {
		$("#passwordfind #fin").attr("disabled", "true");
		$("#passwordfind #emailchestart").attr("disabled", "true");
		$("#passwordfind #emailword").text("이메일 양식에 맞게 작성해주세요");
	}
});
//아이디
let idreg = /^[A-Za-z]{1}[A-Za-z0-9_-]{7,19}$/;
$("#passwordfind #id").on("propertychange change paste input keyUp keyDown", function(e) {

	if (idreg.test($(e.target).val().trim())) {



		$("#passwordfind #fin").removeAttr("disabled");
		$("#passwordfind #idword").text("");



	} else {
		$("#passwordfind #fin").attr("disabled", "true");
		$("#passwordfind #idword").text("영어 포함 8글자 이상 19글자 이하 작성해주세요");
	}

});
//이메일 인증
var passwordemailemailtimers = null;
let passwordemailcheemail = "";
let passwordemailfin = false;
$("#passwordfind #emailchestart").click(function(e) {
	if (!namereg.test($("#passwordfind #name").val().trim())) {
		$("#passwordfind #name").focus();
		alert("이름을 형식에 맞게 입력해주세요");
		return;
	}
	passwordemailfin = false;

	$.ajax({
		url: "mail.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: { mail: $("#passwordfind #email").val().trim(), name: $("#passwordfind #name").val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
		method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		dataType: "json", // 서버에서 보내줄 데이터의 타입
		success: function(re) {

			passwordemailcheemail = re;

		}
	})
	clearInterval(passwordemailemailtimers);
	var emailtimer = 300;
	$("#passwordfind #emailche").removeAttr("disabled");
	$("#passwordfind #cheemail").removeAttr("disabled");
	$("#passwordfind #fin").attr("disabled", "true");
	passwordemailemailtimers = setInterval(function() {

		minutes = parseInt(emailtimer / 60, 10);
		seconds = parseInt(emailtimer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;


		if (emailtimer <= 0) {
			clearInterval(passwordemailemailtimers);
			$("#passwordfind #emailche").attr("disabled", "true");
			$("#passwordfind #cheemail").attr("disabled", "true");
			$("#passwordfind #cheemail").text("");
			$("#passwordfind #emailtime").text("");

		}
		$("#passwordfind #emailtime").text(minutes + ":" + seconds);
		emailtimer--;
	}, 1000);


});
$("#passwordfind #emailche").click(function(e) {
	if (passwordemailcheemail == $("#passwordfind #cheemail").val().trim()) {
		$("#passwordfind #emailchestart").attr("disabled", "true");
		clearInterval(passwordemailemailtimers);
		passwordemailfin = true;
		$("#passwordfind #emailtime").text("인증 완료 되었습니다.");
		$("#passwordfind #emailtime").css("color", "green");
		$("#passwordfind #fin").removeAttr("disabled");
	} else {
		$("#passwordfind #emailchword").text("인증 실패 다시 확인해주세요.");
	}
})
$("#passwordfind #cheemail").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	if ($(e.target).val().length == 6) {

		$("#fin").removeAttr("disabled");

		$("#passwordfind #emailchword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 6));
		if ($(e.target).val().length < 6) {
			$("#passwordfind #fin").attr("disabled", "true");

			$("#passwordfind #emailchword").text("인증번호 6글자 입력해주세요");
		}
	}
});
//아이디

//전화번호 밑 인증
$("#idfind #phone").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	console.log($(e.target).val().length);
	if ($(e.target).val().length == 11) {

		$("#idfind #fin").removeAttr("disabled");
		$("#idfind #phche").removeAttr("disabled");
		$("#idfind #phchestart").removeAttr("disabled");

		$("#idfind #phword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 11));
		if ($(e.target).val().length < 11) {
			$("#idfind #fin").attr("disabled", "true");
			$("#idfind #phche").attr("disabled", "true");
			$("#idfind #phchestart").attr("disabled", "true");

			$("#idfind #phword").text("핸드폰번호 -없이 숫자만 11글자를 입력하세요");
		}
	}
});
$("#idfind #chenum").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	if ($(e.target).val().length == 6) {

		$("#fin").removeAttr("disabled");

		$("#idfind #chword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 6));
		if ($(e.target).val().length < 6) {
			$("#idfind #fin").attr("disabled", "true");

			$("#idfind #chword").text("인증번호 6글자 입력해주세요");
		}
	}
});
$("#idfind #cheemail").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	if ($(e.target).val().length == 6) {

		$("#fin").removeAttr("disabled");

		$("#idfind #emailchword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 6));
		if ($(e.target).val().length < 6) {
			$("#idfind #fin").attr("disabled", "true");

			$("#idfind #emailchword").text("인증번호 6글자 입력해주세요");
		}
	}
});
var idtimers = null;
let idchenum = "";
let idfin = false;
$("#idfind #phchestart").click(function(e) {

	if (!namereg.test($("#idfind #name").val().trim())) {
		$("#idfind #name").focus();
		alert("이름을 형식에 맞게 입력해주세요");
		return;
	}
	idfin = false;
	$.ajax({
		url: "sendChe.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: { phone: $("#idfind #phone").val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
		method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		dataType: "json", // 서버에서 보내줄 데이터의 타입
		success: function(re) {

			idchenum = re;
			console.log(idchenum);

		}
	})
	clearInterval(idtimers);
	var timer = 300;
	$("#idfind #phche").removeAttr("disabled");
	$("#idfind #chenum").removeAttr("disabled");
	$("#idfind #fin").attr("disabled", "true");
	idtimers = setInterval(function() {

		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;


		if (timer <= 0) {
			clearInterval(idtimers);
			$("#idfind #phche").attr("disabled", "true");
			$("#idfind #chenum").attr("disabled", "true");
			$("#idfind #chenum").text("");
			$("#idfind #time").text("");

		}
		$("#idfind #time").text(minutes + ":" + seconds);
		timer--;
	}, 1000);


});
$("#idfind #phche").click(function(e) {
console.log('idchenum',idchenum);
console.log('$("#idfind #chenum").val().trim()',$("#idfind #chenum").val().trim());

	if (idchenum == $("#idfind #chenum").val().trim()) {
		$("#idfind #phchestart").attr("disabled", "true");
		clearInterval(idtimers);
		idfin = true;
		$("#idfind #time").text("인증 완료 되었습니다.");
		$("#idfind #time").css("color", "green");
	} else {
		$("#idfind #chword").text("인증 실패 다시 확인해주세요.");
	}
})
//이메일

$("#idfind #email").on("propertychange change paste input keyUp keyDown", function(e) {

	if (emailreg.test($(e.target).val().trim())) {
		$("#idfind #fin").removeAttr("disabled");
		$("#idfind #emailchestart").removeAttr("disabled");
		$("#idfind #emailword").text("");

	} else {
		$("#idfind #fin").attr("disabled", "true");
		$("#idfind #emailchestart").attr("disabled", "true");
		$("#idfind #emailword").text("이메일 양식에 맞게 작성해주세요");
	}
});
//아이디

$("#idfind #id").on("propertychange change paste input keyUp keyDown", function(e) {

	if (idreg.test($(e.target).val().trim())) {



		$("#idfind #fin").removeAttr("disabled");
		$("#idfind #idword").text("");



	} else {
		$("#idfind #fin").attr("disabled", "true");
		$("#idfind #idword").text("영어 포함 8글자 이상 19글자 이하 작성해주세요");
	}

});
//이메일 인증
var idemailemailtimers = null;
let idemailcheemail = "";
let idemailfin = false;
$("#idfind #emailchestart").click(function(e) {
	if (!namereg.test($("#idfind #name").val().trim())) {
		$("#idfind #name").focus();
		alert("이름을 형식에 맞게 입력해주세요");
		return;
	}
	idemailfin = false;
	$.ajax({
		url: "mail.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: { mail: $("#idfind #email").val().trim(), name: $("#idfind #name").val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
		method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		dataType: "json", // 서버에서 보내줄 데이터의 타입
		success: function(re) {

			idemailcheemail = re;

		}
	})
	clearInterval(idemailemailtimers);
	var emailtimer = 300;
	$("#idfind #emailche").removeAttr("disabled");
	$("#idfind #cheemail").removeAttr("disabled");
	$("#idfind #fin").attr("disabled", "true");
	idemailemailtimers = setInterval(function() {

		minutes = parseInt(emailtimer / 60, 10);
		seconds = parseInt(emailtimer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;


		if (emailtimer <= 0) {
			clearInterval(idemailemailtimers);
			$("#idfind #emailche").attr("disabled", "true");
			$("#idfind #cheemail").attr("disabled", "true");
			$("#idfind #cheemail").text("");
			$("#idfind #emailtime").text("");

		}
		$("#idfind #emailtime").text(minutes + ":" + seconds);
		emailtimer--;
	}, 1000);


});
$("#idfind #emailche").click(function(e) {
	if (idemailcheemail == $("#idfind #cheemail").val().trim()) {
		$("#idfind #emailchestart").attr("disabled", "true");
		idemailfin = true;
		clearInterval(idemailemailtimers);
		$("#idfind #emailtime").text("인증 완료 되었습니다.");
		$("#idfind #emailtime").css("color", "green");
	} else {
		$("#idfind #emailchword").text("인증 실패 다시 확인해주세요.");
	}
})

$("#idfind #name").on("propertychange change paste input keyUp keyDown", function(e) {

	if (namereg.test($(e.target).val().trim())) {
		$("#idfind #emailchestart").removeAttr("disabled");

		$("#idfind #nameword").text("");

	} else {
		$("#idfind #emailchestart").attr("disabled", "true");

		$("#idfind #nameword").text("한글만 3~5글자만 입력해주세요");
	}
});

$("#idfind #fin").click(function() {
	if (idemail) {
		if (idemailfin) {
		$("#idfind #phone").attr("disabled", "true");
		$("#idform").submit();
		} else {
			Swal.fire({
				text: "인증을 해주세요.",
				icon: "warning"
			})
//			alert("인증을 해주세요");
		}
	} else {

		if (idfin) {
		$("#idfind #email").attr("disabled", "true");
		$("#idform").submit();
		} else {
			Swal.fire({
				text: "인증을 해주세요.",
				icon: "warning"
			})
//			alert("인증을 해주세요");
		}
	}
})
$("#passwordfind #fin").click(function() {
console.log("작동")
	if (passwordemail) {
	console.log(passwordemailfin);
		if (passwordemailfin) {
		$("#passwordfind #phone").attr("disabled", "true");
		$("#passwordform").submit();
		} else {
			Swal.fire({
				text: "인증을 해주세요.",
				icon: "warning"
			})
//			alert("인증을 해주세요");
		}
	} else {
		if (passwordfin) {
		$("#passwordfind #email").attr("disabled", "true");
		$("#passwordform").submit();
		} else {
			Swal.fire({
				text: "인증을 해주세요.",
				icon: "warning"
			})
//			alert("인증을 해주세요");
		}
	}
})
let idemail = true;
let passwordemail = true;
$("#idfind .wrap button").click(function() {
	$("#idfind #emailbox").toggleClass("hide");
	$("#idfind #phonebox").toggleClass("hide");
	idemail = !idemail;

})
$("#passwordfind .wrap button").click(function() {
	$("#passwordfind #emailbox").toggleClass("hide");
	$("#passwordfind #phonebox").toggleClass("hide");
	passwordemail = !passwordemail;

})