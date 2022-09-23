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

console.log("rate" + Number(6) - Number($("#star").val()));
let star = "rate" + (Number(6) - Number($("#star").val())); // jsp 에서 star 의 값(value) 구해와서 6 에서 차감해주고,
star = "#" + star; // rate 랑 합쳐서 문자열로 만들어줌(jsp 에서 id="rateN" 형식)
$(star).attr("checked", "true"); // star 에 chcekd 속성을 추가 (true : 추가, false : 추가안함)

$("#update").click(function(){
	console.log($(".note-editable").html());
	$("#reply_cotent").val($(".note-editable").html());
	Swal.fire({
		text: "리뷰를 수정하시겠습니까?",
         icon: 'success',
         showCancelButton: true,
         confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: '예',
         cancelButtonText: '아니오'
	}).then((result)=>{
		if(result.isConfirmed){
			console.log("리뷰 수정 성공인가아ㅏ?");
			Swal.fire({
				icon: "success",
				text: "등록되었습니다.",
				showConfirmButton: false,
            	timer: 1500,
			}).then(function(){
				console.log("여기 뜨는거야 안뜨는거야");
				location.href="#"; // 리뷰 목록으로 돌아가기
				
			})
		}else if(result.isDismissed){
			return false;
		}
	})
})
