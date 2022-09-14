$(function (){
$(".answer").click(function (){
		$(".form1").removeClass("hide");
	});
});

// userdel - 문의 삭제
$().ready(function(){
	$(".userdel").click(function(e){
		Swal.fire({
			text: '해당 문의를 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
		}).then((result)=>{
			if(result.isConfirmed){
				Swal.fire({
					text: "삭제되었습니다.",
	            	icon: "success",
	            	showConfirmButton: false,
	            	timer: 1500,
				}).then(function(){
					console.log($(e.target).parents("#main_wrapper").children("#all_box").children('div').children("div:eq(6)").children('input').val());
					var seq = $(e.target).parents("#main_wrapper").children("#all_box").children('div').children("div:eq(6)").children('input').val();
					seq = parseInt(seq);
					
					location.href="/AskDelete.mdo?ask_seq=" + seq;
				})
			}else if(result.isDismissed){
				return false;
			}
		})
	})
})

// askdel - 문의 + 답변 삭제
$().ready(function(){
	console.log($(".contentBox").children("div:eq(6)").children('input').val());
	$(".askdel").click(function(e){
		Swal.fire({
			text: '해당 문의와 답변을 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
		}).then((result)=>{
			if(result.isConfirmed){
				
				$.ajax({
					type:"post",
					url: "/QnaCheckPW.mdo",
					dataType: "JSON",
					data:{
						askReply_seq : Number($("#askReply.ask_seq").val()),
						ask_reply_password : $("#password").val(),
						ask_seq : Number($(".contentBox").children("div:eq(6)").children('input').val()) // html 태그 찾아서 보내주는 것도 가능합니다~
					},
					async: false,
					success: function(data){
						console.log(data);
						
						if(data == "1"){
							Swal.fire({
								text: "삭제하셨습니다.",
        						icon: "success",
        						showConfirmButton: false,
        						timer: 1500
							}).then(function(){
        						var seq = Number($(".contentBox").children("div:eq(6)").children('input').val());
        						location.href="/AskDelete.mdo?ask_seq=" + seq;
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
	})
})

// answerdel - 답변 삭제


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
 
// 문의 목록으로 넘어가기
$().ready(function () {
    $(".qnalist").click(function () {
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
            icon: 'success',
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
		    ['view', ['codeview', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
     });
});