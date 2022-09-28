
$(function() {
	$("#level1").change(function() {
		if ($("#level1").val() == "주문/결제") {
			$(".form-select1").removeClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "배송/수령일 안내") {
			$(".form-select2").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "반품/교환/환불") {
			$(".form-select3").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level1").val() == "회원") {
			$(".form-select4").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
		} else if ($("#level1").val() == "") {
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		}
	});
});

$(document).ready(function(){
	$("#all_box #level1").val($("#bigsort").val());
	
	if($("#bigsort").val() == "주문/결제"){
		$("#all_box #level1").val("주문/결제").prop("selected", true);
		
		// 숨겨둔 select 박스 나타내주기
		$(".form-select1").removeClass("hide");
		$(".form-select2").addClass("hide");
		$(".form-select3").addClass("hide");
		$(".form-select4").addClass("hide");
		
		// smallsort 값 넣어주기
		$("#all_box #level2").val($("#smallsort").val());
		
		// smallsort select option 값 띄워주기
		if($("#smallsort").val() == "주문"){
			$("#all_box #level2").val("주문").prop("selected", true);
		}else if($("#smallsort").val() == "결제"){
			$("#all_box #level2").val("결제").prop("selected", true);
		}else if($("#smallsort").val() == "포인트"){
			$("#all_box #level2").val("포인트").prop("selected", true);
		}else if($("#smallsort").val() == "쿠폰"){
			$("#all_box #level2").val("쿠폰").prop("selected", true);
		}else if($("#smallsort").val() == "기타"){
			$("#all_box #level2").val("기타").prop("selected", true);
		}
		
	}else if($("#bigsort").val() == "배송/수령일 안내"){
		$("#all_box #level1").val("배송/수령일 안내").prop("selected", true);
		
		$(".form-select2").removeClass("hide");
		$(".form-select1").addClass("hide");
		$(".form-select3").addClass("hide");
		$(".form-select4").addClass("hide");
		
		$("#all_box #level3").val($("#smallsort").val());
		
		if($("#smallsort").val() == "배송료"){
			$("#all_box #level3").val("배송료").prop("selected", true);
		}else if($("#smallsort").val() == "배송안내"){
			$("#all_box #level3").val("배송안내").prop("selected", true);
		}else if($("#smallsort").val() == "기타"){
			$("#all_box #level3").val("기타").prop("selected", true);
		}
		
	}else if($("#bigsort").val() == "반품/교환/환불"){
		$("#all_box #level1").val("반품/교환/환불").prop("selected", true);
		
		$(".form-select3").removeClass("hide");
		$(".form-select1").addClass("hide");
		$(".form-select2").addClass("hide");
		$(".form-select4").addClass("hide");
		
		if($("#smallsort").val() == "주문취소/변경"){
			$("#all_box #level4").val("주문취소/변경").prop("selected", true);
		}else if($("#smallsort").val() == "반품/교환/환불"){
			$("#all_box #level4").val("반품/교환/환불").prop("selected", true);
		}else if($("#smallsort").val() == "주의사항"){
			$("#all_box #level4").val("주의사항").prop("selected", true);
		}else if($("#smallsort").val() == "기타"){
			$("#all_box #level4").val("기타").prop("selected", true);
		}
		
	}else if($("#bigsort").val() == "회원"){
		$("#all_box #level1").val("회원").prop("selected", true);
		
		$(".form-select4").removeClass("hide");
		$(".form-select1").addClass("hide");
		$(".form-select2").addClass("hide");
		$(".form-select3").addClass("hide");
		
		if($("#smallsort").val() == "회원가입/탈퇴"){
			$("#all_box #level5").val("회원가입/탈퇴").prop("selected", true);
		}else if($("#smallsort").val() == "회원정보 확인/변경"){
			$("#all_box #level5").val("회원정보 확인/변경").prop("selected", true);
		}else if($("#smallsort").val() == "개인정보 유효기간제"){
			$("#all_box #level5").val("개인정보 유효기간제").prop("selected", true);
		}else if($("#smallsort").val() == "기타"){
			$("#all_box #level5").val("기타").prop("selected", true);
		}
		
	}
	
});

// bigsort 값이 바뀔 때 함수 실행
	$(document).ready(function(e){
		
		$("#level1").change(function(){
			$("#smallsort").val(""); // #level1 을 바꾸면 #smallsort 의 값을 "" 로 바꿔준다. -> smallsort 값을 가져가지 않기 위해
			$("#bigsort").val($("#level1").val());
			$("#level2").val("").prop("selected", true); // level1 변경하면 smallsort 값을 모두다 "" 로 고정 -> 고정된 값을 가져가지 않기 위해
			$("#level3").val("").prop("selected", true);
			$("#level4").val("").prop("selected", true);
			$("#level5").val("").prop("selected", true);
		})
		
		// smallsort 값을 변경하면 해당 값을 넣어주기
		$("#level2").change(function(){ 
			$("#smallsort").val($("#level2").val());
		})
		$("#level3").change(function(){
			$("#smallsort").val($("#level3").val());
		})
		$("#level4").change(function(){
			$("#smallsort").val($("#level4").val());
		})
		$("#level5").change(function(){
			$("#smallsort").val($("#level5").val());
		})
		
		
		
//		$("#all_box #level1").val($("#bigsort").val());
//		
//		$("#all_box #bigsort").val(null);
//		$("#all_box #smallsort").val(null);
//		
//		if($("#all_box #level1").val() == ""){
//			($("#bigsort").val());
//			
//		}else if($("#all_box #level1").val() == "주문/결제"){
//			($("#bigsort").val($("#all_box #level1").val()));
//			
//			// smallsort 를 클릭했을 때 함수 실행
//			$("#level2").change(function(){
//				$("#smallsort").val($("#all_box #level2").val());
//			})
//			
//		}else if($("#all_box #level1").val() == "배송/수령일 안내"){
//			($("#bigsort").val($("#all_box #level1").val()));
//			
//			$("#level3").change(function(){
//				$("#smallsort").val($("#all_box #level3").val());
//				
//			})
//			
//		}else if($("#all_box #level1").val() == "반품/교환/환불"){
//			($("#bigsort").val($("#all_box #level1").val()));
//			
//			$("#level4").change(function(){
//				if($("#level4").val() == "주문취소/변경"){
//					$("#smallsort").val($("#all_box #level4").val());
//				}else if($("#level4").val() == "반품/교환/환불"){
//					$("#smallsort").val($("#all_box #level4").val());
//				}else if($("#level4").val() == "주의사항"){
//					$("#smallsort").val($("#all_box #level4").val());
//				}else if($("#level4").val() == "전체"){
//					$("#smallsort").val($("#all_box #level4").val());
//				}
//				
//				
//			})
//			
//		}else if($("#all_box #level1").val() == "회원"){
//			($("#bigsort").val($("#all_box #level1").val()));
//			
//			$("#level5").change(function(){
//				if($("#level5").val() == "회원가입/탈퇴"){
//					$("#smallsort").val($("#all_box #level5").val());
//				}else if($("#level5").val() == "회원정보 확인/변경"){
//					$("#smallsort").val($("#all_box #level5").val());
//				}else if($("#level5").val() == "개인정보 유효기간제"){
//					$("#smallsort").val($("#all_box #level5").val());
//				}else if($("#level5").val() == "기타"){
//					$("#smallsort").val($("#all_box #level5").val());
//				}else if($("#level5").val() == "전체"){
//					$("#smallsort").val($("#all_box #level5").val());
//				}
//				
//				
//			})
//		}
	})


//메인화면 페이지 로드 함수
$(document).ready(function () {
    $('.summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400,
        tabsize:2,
        toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['view', ['codeview', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });
});

function i(){
	$("#content").val($(".note-editable").text());
};

// 수정 jquery + checkPW 
$().ready(function () {
    $(".faqupdate").click(function () {
    	Swal.fire({
            text: "FAQ을 수정하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	if (result.isConfirmed) { // 모달창에서 confirm(예) 버튼 누른 경우

        		if($("#title").val().trim() == ""){
            		alert("제목을 입력해주세요.");
            	}else if($(".summernote").summernote('isEmpty')){
            		alert("내용을 입력해주세요.");
            	}else{
            		
        		
        		// ajax 로 사용해서 비밀번호 비교
        		$.ajax({
        			type: "post", // 전송방식
        			url: "/FaqCheckPW.mdo", // 컨트롤러 사용할 때, 내가 보낼 데이터의 주소
        			dataType: "JSON", // 데이터 타입
        			data:{
        				FAQ_passwd : $("#FAQ_passwd").val(),
        				FAQ_seq: Number($("#FAQ_seq").val())
        			},
        			async: false,
        			success: function(data){ // 정상적으로 응답 받은 경우 호출
        				if(data == "1"){ // ajax 실행 성공
        					Swal.fire({
        	                	text: "수정 성공!",
        	                	icon: "success",
        	                	showConfirmButton: false,
                               	timer: 1500
        	                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
        	                	var seq = $("#seq").text();
        	                	
        	                	i();
        	                	
        	                	let form = $("#update");
        	                	form.action = "/FaqUpdate.mdo";
        	                	form.method = "POST";
        	                	form.submit();
//        	                	return true; // 수정하기 -> submit 
        	                })
        				}else{ // ajax 실행 실패
        					 Swal.fire({
        		                	text: "비밀번호를 다시 입력해주세요.",
        		                	icon: "error",
        		                	showConfirmButton: false,
        	                       	timer: 1500
        		                })
        				}
        			},
        			error: function(){ // 
        				Swal.fire({
                        	text: "수정 실패!",
                        	icon: "error"
                        })
        			}
        		})
            	}
            }else if(result.isDismissed){ // 아니오 버튼 클릭시 
            	return false;
            }
        })
    });
});

$().ready(function () {
    $(".faqdel").click(function () {
        Swal.fire({
        	text: "해당 FAQ 내용을 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	if (result.isConfirmed) { // 모달창에서 confirm 버튼 누른 경우
        		$.ajax({
        			type: "post", // 전송방식
        			url: "/FaqCheckPW.mdo", // 컨트롤러 사용할 때, 내가 보낼 데이터의 주소
        			dataType: "JSON", // 데이터 타입
        			data:{
        				FAQ_passwd : $("#FAQ_passwd").val(),
        				FAQ_seq: Number($("#FAQ_seq").val())
        			},
        			async: false,
        			success: function(data){
        				if(data == "1"){
        					Swal.fire({
        						text: "삭제하셨습니다.",
        						icon: "success",
        						showConfirmButton: false,
        						timer: 1500
        					}).then(function(){
        						var seq = $("#FAQ_seq").val();
        						location.href="/faqDelete.mdo?FAQ_seq=" + seq;
        					})
        				}else{
        					Swal.fire({
        						text: "비밀번호를 다시 입력해주세요.",
        						icon: "error",
        						showConfirmButton: false,
        						timer: 1500
        					})
        				}
        			}
        		})
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});

$().ready(function () {
    $(".faqlist").click(function () {
        Swal.fire({
        	text: "FAQ 목록으로 돌아가시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	// Promise 리턴 받으면
            if (result.isConfirmed) { // 모달창에서 confirm 버튼 누른 경우
                Swal.fire({
                	text: "FAQ 목록으로 되돌아갑니다.",
                	icon: "success",
                	showConfirmButton: false,
                	timer: 1500,
                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
                	location.href="/FaqList.mdo";
                })
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});


init();

function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	$("#content").val($(".note-editable").text());
}
