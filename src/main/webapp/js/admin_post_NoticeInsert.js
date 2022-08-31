// 메인화면 페이지 로드 함수
$(document).ready(
		function() {
			$('.summernote').summernote(
					{
						placeholder : '내용을 작성하세요',
						height : 400,
						maxHeight : 400,
						tabsize : 2,
						toolbar : [
								// [groupName, [list of button]]
								[ 'fontname', [ 'fontname' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'strikethrough', 'clear' ] ],
								[ 'color', [ 'forecolor', 'color' ] ],
								[ 'table', [ 'table' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ],
								[ 'view', [ 'codeview', 'help' ] ] ],
						fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
								'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
								'돋움체', '바탕체' ],
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ]
					});
		});


function i(){
	console.log("hi");
	console.log($(".note-editable").text());
	$("#notice_content").val($(".note-editable").text());
	console.log($("#notice_content").val());
	return true;
};

$().ready(function () {
    $(".noticeadd").click(function () {
        Swal.fire({
            text: "공지사항을 등록하시겠습니까?",
            icon: 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                	text: "등록되었습니다.",
                	icon: "success"
                }).then(function(){
                	location.href="/admin_post_Notice.mdo";
                })
            }else{
            	Swal.fire({
            	}).then(function(){
            		location.href="/admin_post_NoticeInsert.mdo?notice_seq"
            	})
            }
        })
    });
});

$().ready(function () {
    $(".noticedel").click(function () {
        Swal.fire({
            text: "해당 공지사항을 삭제하시겠습니까?",
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
    $(".noticelist").click(function () {
        Swal.fire({
            text: "공지사항 목록으로 돌아가시겠습니까?",
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
                    '공지사항 목록으로 되돌아갑니다.'
                )
                
                location.href="/admin_post_Notice.mdo";
            }
        })
    });
});

$(document).on("click", "#noticeInsert", function(){
	console.log("hi");
	console.log($(".note-editable").text());
	$("#notice_content").val($(".note-editable").text());
	console.log($("#notice_content").val());
})