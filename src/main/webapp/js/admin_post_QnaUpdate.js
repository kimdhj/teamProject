function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	console.log($(".note-editable").text());
	$("#content").val($(".note-editable").html());
	console.log($("#content").val());
}

function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	console.log($(".note-editable").text());
	$("#content1").val($(".note-editable").html());
	console.log($("#content").val());
}

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
						ask_seq : Number($("#askReply.ask_seq").val()),
						ask_reply_password : $("#password").val(),
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
        						var seq = Number($("#askReply.ask_seq").val());
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

// 문의 목록으로 넘어가기
$(document).ready(function () {
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
        	if (result.isConfirmed) { // 모달창에서 confirm 버튼 누른 경우
                Swal.fire({
                	text: "문의 목록으로 되돌아갑니다.",
                	icon: "success",
                	showConfirmButton: false,
                	timer: 1500,
                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
                	location.href="/QnaList.mdo";
                })
            }else if(result.isDismissed){
            	return false;
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


$(document).ready(function () {
    $(".answerupdate").click(function () {
    	Swal.fire({
           	text: '해당 문의를 수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	if (result.isConfirmed) { // 모달창에서 confirm(예) 버튼 누른 경우
        		// ajax 로 사용해서 비밀번호 비교
        		$.ajax({
        			type: "post", // 전송방식
        			url: "/QnaCheckPW.mdo", // 컨트롤러 사용할 때, 내가 보낼 데이터의 주소
        			dataType: "JSON", // 데이터 타입
        			data:{
        				ask_seq : Number($("#ask_reply_seq").val()),
						ask_reply_password : $("#password").val()
        			},
        			async: false,
        			success: function(data){ // 정상적으로 응답 받은 경우 호출
        				console.log(data);
        				if(data == "1"){ // ajax 실행 성공
        					Swal.fire({
        	                	text: "수정 성공!",
        	                	icon: "success",
        	                	showConfirmButton: false,
                               	timer: 1500,
        	                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
        	                	var seq = Number($("#ask_seq").val());
        						var seq2 = Number($("#seq").val());
        	                	init();
        	                	// form 에서는 Multipart File 의 공간이 미리 만들어져있기 때문에, File 에 모든 값이 들어갈 수 있다.
        	                	// 따라서 form 방식으로 multipart file 을 검사할 때는 != null 이 아니라 .isEmpty() 로 검사해서 여부를 확인해야한다.
        	                	let form = $("#form");
//        	                	form.action = "/qnaDetail.mdo?ask_seq=" + seq + "&seq=" + seq2;
        	                	form.action = "/QnaUpdate.mdo";
        	                	form.method = "post";
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
            }else if(result.isDismissed){ // 아니오 버튼 클릭시 
            	return false;
            }
        })
    });
});

