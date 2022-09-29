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

$(document).on('click', "#myform", function(){
	console.log($("fieldset>input:checked").val());
	$("#star").val(Number($("fieldset>input:checked").val()));
	console.log($("#star").val());
})

$("#register").click(function(){
	console.log($(".note-editable").html());
	$("#reply_cotent").val($(".note-editable").html());
	Swal.fire({
		text: "리뷰를 등록하시겠습니까?",
         icon: 'success',
         showCancelButton: true,
         confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: '예',
         cancelButtonText: '아니오'
	}).then((result)=>{
		if(result.isConfirmed){
			if($(".summernote").summernote('isEmpty')){
	       		 alert("내용을 입력해주세요.");
		    }else{
			Swal.fire({
				icon: "success",
				text: "등록되었습니다.",
				showConfirmButton: false,
            	timer: 1500,
			}).then(function(){
				console.log("여기 뜨는거야 안뜨는거야");
				location.href="/movingReview.do"; // 리뷰 목록으로 돌아가기
			})
		    }
		}else if(result.isDismissed){
			return false;
		}
	})
})
