let pasreg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
$("#password").on("propertychange change paste input keyUp keyDown", function(e) {

	if (pasreg.test($(e.target).val().trim())) {
		$("#fin").removeAttr("disabled");
		$("#paswordword").text("");

	} else {
		$("#fin").attr("disabled", "true");
		$("#paswordword").text("대소문자 포함,8자 이상 20자 이하,특수문자 포함 되어야 합니다.");
	}
});
$("#passwordche").on("propertychange change paste input keyUp keyDown", function(e) {
	console.log($("#passwordche").val().trim());
	console.log($("#password").val().trim());
	console.log($("#passwordche").val().trim()==$("#password").val().trim());
	
	if ($("#passwordche").val().trim()==$("#password").val().trim()) {
		$("#fin").removeAttr("disabled");
		$("#paswordcheword").text("");

	} else {
		$("#fin").attr("disabled", "true");
		$("#paswordcheword").text("위에 비밀번호 와 일치하지 않습니다.");
	}
});
$("#fin").on("click", function(e) {

	if (($("#passwordche").val().trim()==$("#password").val().trim())&&pasreg.test($("#password").val().trim())) {
		$("#pass").submit();

	} else {
		Swal.fire({
			text: "비밀번호와 비밀번호 확인을 체크해주세요.",
			icon: "warning"
		})
//		alert("비밀번호와 비밀번호확인을 체크해주세요");
	}
});