

function movingSub() {
	$.ajax({
		url: "/getUid.do",
		method: "POST",
		dataType: "JSON",
		async: false,
		success: function(e) {
			console.log(e);
			let user_id = e.user_id;
			let user_sub = e.user_sub;
			
			if(user_id=="null"){
				location.href="/login.do";
			}else{
				if(user_sub=="1"){
					alert("이미 구독중입니다!");
				}else{
					location.href="/mysubpay.do";
				}
			}
			console.log(user_id);
			console.log(user_sub);

		},
		error: function(e) {


		}
	});
	
	//location.href="/sub_terms.do";
}


//전체 선택
function everycheck(everycheck){
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = everycheck.checked
  })
}

//동의 클릭시 체크박스 검증후 이동
function movingJoin(){
	
	if($('.ccheck:checked').length != $('.ccheck').length){
		alert("약관에 모두 동의해 주십시오!");
	}else{
		location.href="/join.do";
	}
}