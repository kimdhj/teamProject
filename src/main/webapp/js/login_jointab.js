datePickerSet($("#datepicker"));
function datePickerSet(sDate, eDate, flag) {
	console.log("hi");
	// 시작 ~ 종료 2개 짜리 달력 datepicker
	if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
		&& eDate.length > 0) {
		let sDay = sDate.val();
		let eDay = eDate.val();

		if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { // 처음 입력 날짜 설정,
			// update...
			let sdp = sDate.datepicker().data("datepicker");
			console.log("flag");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
			// Date하면 -을
			// 인식못함
			// replace필요

			let edp = eDate.datepicker().data("datepicker");
			edp.selectDate(new Date(eDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
			// Date하면 -을
			// 인식못함
			// replace필요
		}

		// 시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		if (!isValidStr(eDay)) {
			sDate.datepicker({
				maxDate: new Date(eDay.replace(/-/g, "/"))
			});

		}
		sDate.datepicker({
			language: 'ko',
			autoClose: true,
			onSelect: function() {
				console.log("select");
				datePickerSet(sDate, eDate);
			}
		});

		// 종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		if (!isValidStr(sDay)) {
			eDate.datepicker({
				minDate: new Date(sDay.replace(/-/g, "/"))
			});
		}
		eDate.datepicker({
			language: 'ko',
			autoClose: true,
			onSelect: function() {
				datePickerSet(sDate, eDate);
			}
		});

		// 한개짜리 달력 datepicker
	} else if (!isValidStr(sDate)) {
		let sDay = sDate.val();
		if (flag && !isValidStr(sDay)) { // 처음 입력 날짜 설정, update...
			let sdp = sDate.datepicker().data("datepicker");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
			// Date하면 -을
			// 인식못함
			// replace필요
		}

		sDate.datepicker({
			language: 'ko',
			autoClose: true
		});
	}

	function isValidStr(str) {
		if (str == null || str == undefined || str == "")
			return true;
		else
			return false;
	}

}
let pasreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
$("#password").on("propertychange change paste input keyUp keyDown", function(e) {

	if (pasreg.test($(e.target).val().trim())) {
		$("#fin").removeAttr("disabled");
		$("#pasword").text("");

	} else {
		$("#fin").attr("disabled", "true");
		$("#pasword").text("대소문자 포함,8자 이상 20자 이하,특수문자 포함 되어야 합니다.");
	}
});

let emailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
$("#email").on("propertychange change paste input keyUp keyDown", function(e) {

	if (emailreg.test($(e.target).val().trim())) {
		$("#fin").removeAttr("disabled");
		$("#emaword").text("");

	} else {
		$("#fin").attr("disabled", "true");
		$("#emaword").text("이메일 양식에 맞게 작성해주세요");
	}
});
let idreg = /^[A-Za-z]{1}[A-Za-z0-9_-]{7,19}$/;
$("#id").on("propertychange change paste input keyUp keyDown", function(e) {

	if (idreg.test($(e.target).val().trim())) {
		$.ajax({
			url: "cheid.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: { user_id: $(e.target).val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
			method: "GET",   // HTTP 요청 메소드(GET, POST 등)
			dataType: "json", // 서버에서 보내줄 데이터의 타입
			success: function(re) {

				if (re == 0) {
					$("#fin").removeAttr("disabled");
					$("#idword").text("");
				} else {
					$("#fin").attr("disabled", "true");
					$("#idword").text("아이디가 중복입니다.");

				}
			}
		})



	} else {
		$("#fin").attr("disabled", "true");
		$("#idword").text("영어 포함 8글자 이상 19글자 이하 작성해주세요");
	}
});
let namereg = /^[ㄱ-ㅣ가-힣]{3,5}$/;
$("#name").on("propertychange change paste input keyUp keyDown", function(e) {

	if (namereg.test($(e.target).val().trim())) {
		$("#fin").removeAttr("disabled");
		$("#nameword").text("");

	} else {
		$("#fin").attr("disabled", "true");
		$("#nameword").text("한글만 3~5글자만 입력해주세요");
	}
});
function numberonly(e) {
	console.log(e);
	//e.target.val($(e.target).val().replace(/[^0-9]/g,'')) ; 
}

$("#phone").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	console.log($(e.target).val().length);
	if ($(e.target).val().length == 11) {

		$("#fin").removeAttr("disabled");
		$("#phche").removeAttr("disabled");
		$("#phword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 11));
		if ($(e.target).val().length < 11) {
			$("#fin").attr("disabled", "true");
			$("#phche").attr("disabled", "true");
			$("#phword").text("핸드폰번호 -없이 숫자만 11글자를 입력하세요");
		}
	}
});
$("#chenum").on("propertychange change paste input keyUp keyDown", function(e) {

	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
	if ($(e.target).val().length == 6) {

		$("#fin").removeAttr("disabled");

		$("#chword").text("");
	} else {
		$(e.target).val($(e.target).val().substr(0, 6));
		if ($(e.target).val().length < 6) {
			$("#fin").attr("disabled", "true");

			$("#chword").text("인증번호 6글자 입력해주세요");
		}
	}
});
var timers = null;
let chenum = "";
$("#phchestart").click(function(e) {


	$.ajax({
		url: "sendChe.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: { phone: $("#phone").val().trim() },  // HTTP 요청과 함께 서버로 보낼 데이터
		method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		dataType: "json", // 서버에서 보내줄 데이터의 타입
		success: function(re) {

			chenum = re;

		}
	})
	clearInterval(timers);
	var timer = 300;
	$("#phche").removeAttr("disabled");
	$("#chenum").removeAttr("disabled");
	$("#fin").attr("disabled", "true");
	timers = setInterval(function() {

		minutes = parseInt(timer / 60, 10);
		seconds = parseInt(timer % 60, 10);

		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;


		if (timer <= 0) {
			clearInterval(timers);
			$("#phche").attr("disabled", "true");
			$("#chenum").attr("disabled", "true");
			$("#chenum").text("");
			$("#time").text("");

		}
		$("#time").text(minutes + ":" + seconds);
		timer--;
	}, 1000);


});
$("#phche").click(function(e) {
	if (chenum == $("#chenum").val().trim()) {
		$("#phchestart").attr("disabled", "true");
		clearInterval(timers);
		$("#time").text("인증 완료 되었습니다.");
		$("#time").css("color", "green");
	} else {
		$("#chenum").text("인증 실패 다시 확인해주세요.");
	}
})
$("#addbtn").click(function() {
	console.log("hi");
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ""; // 주소 변수
			var extraAddr = ""; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === "R") {
				// 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else {
				// 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("remainaddress").focus();
		},
	}).open();
	})