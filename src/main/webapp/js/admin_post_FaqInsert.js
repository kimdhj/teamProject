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
//		console.log($("#level1").val());
	});
});

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

// bigsort 누를 때 - 그리고 smallsort 누를 떄
$("#all_box #level1").change(function(e){
//	console.log($("#all_box #level1").val());
	
	$("#all_box #bigsort").val(null);
	$("#all_box #smallsort").val(null);
	
	console.log($("#bigsort").val($("#all_box #level1").val()));
//	console.log($("#level2").val());
	if($("#all_box #level1").val() == ""){
		($("#bigsort").val());
		
	}else if($("#all_box #level1").val() == "주문/결제"){
		($("#bigsort").val($("#all_box #level1").val()));
		
		$("#level2").click(function(){
			if($("#level2").val() == "주문"){
			}else if($("#level2").val() == "결제"){
			}else if($("#level2").val() == "포인트"){
			}else if($("#level2").val() == "쿠폰"){
			}else if($("#level2").val() == "기타"){
			}else if($("#level2").val() == "전체"){
			}
			
			$("#smallsort").val($("#all_box #level2").val());
		})
		
	}else if($("#all_box #level1").val() == "배송/수령일 안내"){
		($("#bigsort").val($("#all_box #level1").val()));
		
		$("#level3").click(function(){
			if($("#level3").val() == "배송료"){
			}else if($("#level3").val() == "배송안내"){
			}else if($("#level3").val() == "기타"){
			}else if($("#level3").val() == "전체"){
			}
			
			$("#smallsort").val($("#all_box #level3").val());
		})
		
	}else if($("#all_box #level1").val() == "반품/교환/환불"){
		($("#bigsort").val($("#all_box #level1").val()));
		
		$("#level4").click(function(){
			if($("#level4").val() == "주문취소/변경"){
			}else if($("#level4").val() == "반품/교환/환불"){
			}else if($("#level4").val() == "주의사항"){
			}else if($("#level4").val() == "전체"){
			}
			
			$("#smallsort").val($("#all_box #level4").val());
		})
		
	}else if($("#all_box #level1").val() == "회원"){
		($("#bigsort").val($("#all_box #level1").val()));
		
		$("#level5").click(function(){
			if($("#level5").val() == "회원가입/탈퇴"){
			}else if($("#level5").val() == "회원정보 확인/변경"){
			}else if($("#level5").val() == "개인정보 유효기간제"){
			}else if($("#level5").val() == "기타"){
			}else if($("#level5").val() == "전체"){
			}
			
			$("#smallsort").val($("#all_box #level5").val());
		})
	}
});

$("#register").click(function(){
	console.log($(".note-editable").html());
	$("#content").val($(".note-editable").html());
	console.log($("#content").val());
	 Swal.fire({
         text: "FAQ를 등록하시겠습니까?",
         icon: 'success',
         showCancelButton: true,
         confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: '예',
         cancelButtonText: '아니오'
     }).then((result) => {
    	 if(result.isConfirmed){
    		 if($("#title").val().trim() == ""){
        		 alert("제목을 입력해주세요.");
        		 setTimeout(function(){  $("#title").focus(); }, 0);
//        		 $("#title").focus();
        		 return false;
        	 }else if($("#password").val().trim() == ""){
        		alert("비밀번호를 입력해주세요."); 
        	 }else if($("#all_box #bigsort").val() == ""){
        		 console.log("대분류 선택해줘");
        		 alert("대분류를 선택해주세요");
        	 }else if($("#content").val().trim() == ""){
        		 alert("내용을 입력해주세요.");
        	 }else{
        		 Swal.fire({
                   	text: "등록되었습니다.",
                   	icon: "success",
                   	showConfirmButton: false,
                   	timer: 1500,
                   }).then(function(){
                 	  console.log("권범준은 바보인가?");
                 	  $("#form").submit();
                   })
        	 }
         }else if(result.isDismissed){
         	return false;
         }
         return false;
     })
	
})

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
            if (result.isConfirmed) {
                Swal.fire({
                	icon: "success",
                	text: "FAQ 목록으로 되돌아갑니다.",
                	showConfirmButton: false,
                	timer: 1500,
                })
                
                location.href="/FaqList.mdo";
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});
