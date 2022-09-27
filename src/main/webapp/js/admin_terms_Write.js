function terms_Write() {
	let number = document.getElementById("terms_article_number");
	let title = document.getElementById("terms_title");
	let content = document.getElementById("terms_content");

	if (number.value == "") {
		alert("조항 번호를 입력하세요");
		number.focus();
		return false;
	};

	if (title.value == "") {
		alert("제목을 입력하세요");
		title.focus();
		return false;
	};

	if (content.value == "") {
		alert("내용을 입력하세요");
		content.focus();
		return false;
	};
	
	let check = $("#terms_title").val().trim().indexOf("-");
	
	let check_title = $("#terms_title").val().trim().substring(0,Number(check));
	
	
	$.ajax({
		url: "/ajax_c.mdo",
		type: 'GET',
		data: {
			title: check_title,
			seq: Number($("#terms_Write #terms_article_number").val())
		},
		
		success: function(over){
			if(over >= 1){
				alert(check_title + "약관에는 이미 있는 조항 번호입니다. ")
				return;
			}else {
				$("#terms_Insert").submit();
			}
			console.log(over);
			
		}
		
		});
	
	
}

$("#terms_article_number").on("propertychange change paste input keyUp keyDown", function(e) {
	$(e.target).val($(e.target).val().replace(/[^0-9]/g, ''));
})