// 답변하기
$(function (){
$(".answer").click(function (){
		$(".form1").removeClass("hide");
	});
});

function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	console.log($(".note-editable").text());
	$("#content").val($(".note-editable").text());
	console.log($("#content").val());
}

function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	console.log($(".note-editable").text());
	$("#content1").val($(".note-editable").text());
	console.log($("#content").val());
}

//문의 답변 등록 answer
$(document).ready(function (e) {
	console.log("번호줘어", $("#seq"));
	init(); // 등록
	console.log($("#ask_reply_writer").val());
	var queryString = $("#form").serialize(); // serialize() : form 대상으로 form 객체 한번에 받기 가능
	
    $(".answerinsert").click(function () {
    	console.log($("#ask_seq").val()+"1");
    	console.log($("#ask_reply_writer").val()+"2");
    	console.log($(".note-editable").html()+"3"); // content 에 들어가는 내용 전부 출력
    	console.log($("#password").val()+"4");
    	console.log($("#ask_reply_file")[0].files[0]+"5"); // 파일 불러오는데 [] 를 붙여서 배열 타입으로 받아주기
    	
    	
    	console.log($("#status").val());
    	console.log("1" , $("#status").val("답변 완료"));
    	
    	// FormData : js 에서 form 전송 동작이 필요한 경우 이용
    	var formData = new FormData(); // FormData : 자바스크립트 단에서 폼 데이터를 다루는 객체로, HTML 에서의 Submit 제출 동작은 Ajax 를 통해 서버에 제출
		
    	// formData.append([key], [value]) : 데이터 추가하는 방법
    	// undefined = null = 0 = false (부정)
    	if($("#ask_reply_file")[0].files[0] != undefined ){
    		console.log("파일 접근");
    		formData.append('ask_reply_uploadFile', $("#ask_reply_file")[0].files[0]);
    	}
		formData.append('ask_seq', Number($("#ask_seq").val()));
		formData.append('ask_reply_writer', $("#ask_reply_writer").val());
		formData.append('ask_reply_content', $(".note-editable").html());
		formData.append('ask_reply_password', $("#password").val());
		
		if($("#status") == "답변 대기"){
//			$("#status")
			formData.append('ask_status', $("#status").val("답변 완료"));
		}
		
		console.log("status1234" , formData);
    	
        Swal.fire({
           	text: '문의 답변을 등록하시겠습니까?',
            icon: 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	var form = $('#form')[0];
        	console.log("form" , form);
    		// Create an FormData object 
        	console.log("queryString" , queryString);
        	if(result.isConfirmed){
        		console.log("12345678910");
        		if($("#password").val().trim() == ""){
        			alert("비밀번호를 입력해주세요.");
        		}else if($(".summernote").summernote('isEmpty')){
        			alert("내용을 입력해주세요.");
        		}else{	
        		
				$.ajax({
					type:"post",
					url: "/QnaCheckPW.mdo",
					dataType: "JSON",
					data:{
						askReply_seq : Number($("#ask_reply_seq").val()),
						ask_reply_password : $("#password").val(),
						ask_seq : Number($("#ask_seq").val())
					},
					async: false,
					success: function(data){
						console.log("가나");
						$.ajax({
							type:"post",
							enctype: 'multipart/form-data', // 파일 보낼 때 써야되는 것
							url: "/askReplyInsert.mdo",
							dataType: "JSON",
							processData: false, // processData : false로 선언 시 formData를 string으로 변환하지 않음
					        contentType: false, // contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
					        cache: false,
					        timeout: 600000,
							data: formData,
							success: function(){
								console.log("다라");
								console.log("data" , data);
//								if(data == "1"){
//									console.log("마바");
//									Swal.fire({
//										text: "등록되었습니다.",
//		        						icon: "success",
//		        						showConfirmButton: false,
//		        						timer: 1500
//									}).then(function(){
//		        						var seq = Number($("#ask_reply_seq").val());
//		        						console.log(seq);
//		        						location.href="/qnaDetail.mdo?ask_seq=" + seq;
//		        					})
//								}else{
//									console.log("사아");
//		        					Swal.fire({
//		        						text: "비밀번호를 다시 입력해주세요.",
//		        						icon: "error",
//		        						showConfirmButton: false,
//		        						timer: 1500
//		        					})
//		        				}
							}, 
							error: function(){
								console.log("자차");
								console.log("data" , data);
								if(data == "0"){
									console.log("마바");
									Swal.fire({
										text: "등록되었습니다.",
		        						icon: "success",
		        						showConfirmButton: false,
		        						timer: 1500
									}).then(function(){
		        						var seq = Number($("#ask_seq").val());
		        						var seq2 = Number($("#seq").val());
		        						console.log(seq);
		        						console.log("상태를 봐주세요" , $("#status").val());
		        						location.href="/qnaDetail.mdo?ask_seq=" + seq + "&seq=" + seq2;
		        					//	location.href="/QnaList.mdo";
		        					})
								}else{
									console.log("사아");
		        					Swal.fire({
		        						text: "비밀번호를 다시 입력해주세요.",
		        						icon: "error",
		        						showConfirmButton: false,
		        						timer: 1500
		        					})
		        					
		        				}
								return false;
							}
						})
							}
						})
        		}
			}else if(result.isDismissed){
				console.log("하하");
				return false;
			}
        })
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
					console.log(Number($("#ask_seq").val()));
//					console.log($(e.target).parents("#main_wrapper").children("#all_box").children('div').children("div:eq(6)").children('input').val());
//					var seq = $(e.target).parents("#main_wrapper").children("#all_box").children('div').children("div:eq(6)").children('input').val();
					
					var seq = Number($("#ask_seq").val());
					console.log(seq);
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
						ask_seq : Number($("#ask_reply_seq").val()),
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
        						var seq = Number($("#ask_reply_seq").val());
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
	console.log("ask_reply_seq" , $("#ask_reply_seq").val());
	console.log("password" , $("#password").val());
    $(".answerdel").click(function () {
        Swal.fire({
           	text: '해당 답변을 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	if(result.isConfirmed){
        		console.log("삭제되나1");
				$.ajax({
					type:"post",
					url: "/QnaCheckPW.mdo",
					dataType: "JSON",
					data:{
						ask_seq : Number($("#ask_reply_seq").val()),
						ask_reply_password : $("#password").val(),
					},
					async: false,
					success: function(data){
						console.log("삭제되나2");
						if(data == "1"){
							console.log("삭제되나3");
							Swal.fire({
								text: "삭제하셨습니다.",
        						icon: "success",
        						showConfirmButton: false,
        						timer: 1500
							}).then(function(){
								console.log("삭제되나4");
        						var seq = Number($("#ask_reply_seq").val());
        						console.log(seq);
        						location.href="/AskReplyDelete.mdo?ask_seq=" + seq;
        					})
						}else{
							console.log("삭제되나5");
        					Swal.fire({
        						text: "비밀번호를 다시 입력해주세요.",
        						icon: "error",
        						showConfirmButton: false,
        						timer: 1500
        					})
        				}
					}, error: function(){
						console.log("삭제되나6");
					}
				})
			}else if(result.isDismissed){
				console.log("삭제되나7");
				return false;
			}
        })
    });
});
 
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

function i(){
	$("#content").val($(".note-editable").text());
	console.log($("#content").val());
};