 $().ready(function () {
    $(".qna_del").click(function () {
        Swal.fire({
            text: '문의를 삭제하시겠습니까?',
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
                    '문의가 삭제되었습니다. 혹은 비밀번호가 일치하지 않습니다.'
                )
            }
        })
    });
});
 
 $().ready(function () {
    $(".answer_del").click(function () {
        Swal.fire({
           	text: '해당 답변을 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    ' ',
                    '문의 답변이 삭제되었습니다. / 혹은 비밀번호가 일치하지 않습니다.'
                )
            }
        })
    });
});
 
 $().ready(function () {
    $(".qna_list").click(function () {
        Swal.fire({
           	text: '문의 목록으로 돌아가시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    ' ',
                    '문의 목록으로 되돌아갑니다.'
                )
            }
        })
    });
});
 
 $().ready(function () {
    $(".answer_add").click(function () {
        Swal.fire({
           	text: '답변을 등록하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    ' ',
                    '답변 등록이 완료되었습니다.'
                )
            }
        })
    });
});

 	$(function (){
  	$(".answer_insert").click(function (){
 			$(".form1").removeClass("hide");
 		});
 	});
 	
	  // 메인화면 페이지 로드 함수
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
			    ['insert',['picture','link','video']],
			    ['view', ['codeview', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
    });