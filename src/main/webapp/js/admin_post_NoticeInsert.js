// 메인화면 페이지 로드 함수
// console.log($(el).parents("tr").children("td:eq(1)").children("input").val());
console.log($(".2all_box").children("div").html());
// summernote 
$(document).ready(function() {
	$('.summernote').summernote({
		placeholder : '내용을 작성하세요',
		height : 400,
		maxHeight : 400,
		tabsize : 2,
		toolbar : [
				// [groupName, [list of button]]
				[ 'fontname', [ 'fontname' ] ],
				[ 'fontsize', [ 'fontsize' ] ],
				[ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
				[ 'color', [ 'forecolor', 'color' ] ],
				[ 'table', [ 'table' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'height', [ 'height' ] ],
				[ 'view', [ 'codeview', 'help' ] ] ],
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72' ]
	});
	
	// 저장 버튼 클릭
//	$(document).on('click', '#noticeInsert', function(){
//		saveContent();
//	})
});

// 데이터 저장
//function saveContent(){
//	var summernoteContent = $(".summernote").summernotes("code"); // summernote 설명
//	console.log("summernotesContent: " + summernoteContent);
//}

// $(".summertnote").summernotes("pasteHTML", data);
// console.log($(".summertnote").summernotes("pasteHTML", data)); // pasteHTML 을 사용항 내용을 불러와야 summernote 에서 사용가능한 수정 가능 형태로 값이 들어감

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
            if (result.isConfirmed) { // 예 버튼 눌렀을 때 실행되는 코드
                Swal.fire({
                	text: "등록되었습니다.",
                	icon: "success",
                	showConfirmButton: false,
                	timer: 1500,
                }).then(function(){
                	location.href="/admin_post_Notice.mdo";
                })
            }else if(result.isDismissed){
            	return false;
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