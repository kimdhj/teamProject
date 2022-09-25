

function sub_terms() {
	$.ajax({
		url: "/getUid.do",
		method: "POST",
		success: function(vo) {
			let user_id = vo.user_id;
			let user_sub = vo.user_sub;
			if(user_id==null){		
				location.href="/login.do";
			}else{							
				if(user_sub==1){
					Swal.fire({
						text: "이미 구독중입니다!",
						icon: "warning"
					})
//					alert("이미 구독중입니다!");
				}else{							
					location.href="/sub_terms.do";
				}
			}
		},
		error: function() {
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
		Swal.fire({
			text: "약관에 모두 동의해 주십시오!",
			icon: "warning"
		})
		
//		alert("약관에 모두 동의해 주십시오!");
	}else{
		location.href="/join.do";
	}
}
//동의 클릭시 체크박스 검증후 이동
function movingSub(){
	
	if($('.ccheck:checked').length != $('.ccheck').length){
		Swal.fire({
			text: "약관에 모두 동의해 주십시오!",
			icon: "warning"
		})
	}else{
		location.href="/mysubpay.do";
	}
}