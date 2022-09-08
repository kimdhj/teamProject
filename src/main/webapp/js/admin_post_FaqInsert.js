$(function () {
    $("#level").change(function () {
    	if($("#level").val() == "1"){
			$(".form-select1").removeClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "2"){
	        $(".form-select2").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "3"){
    		$(".form-select3").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select2").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "4"){
    		$(".form-select4").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
    	}
        console.log($("#level").val());
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
            if (result.isConfirmed) {
                Swal.fire(
                	'',
                    '삭제되었습니다.'
                )
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
            if (result.isConfirmed) {
                Swal.fire(
                	'',
                    'FAQ 목록으로 되돌아갑니다.'
                )
            }
        })
    });
});