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
};

$().ready(function () {
    $(".noticeupdate").click(function () {
    	Swal.fire({
            text: "공지사항을 수정하시겠습니까?",
            icon: 'success',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
        	if (result.isConfirmed) { // 모달창에서 confirm(예) 버튼 누른 경우
        		console.log("noticeUpdateForm.notice_passwd : " + noticeUpdateForm.notice_passwd.value, "noticeUpdateForm.notice_seq : " + noticeUpdateForm.notice_seq.value );
        		// ajax 로 사용해서 비밀번호 비교
        		$.ajax({
        			type: "post", // 전송방식
        			url: "/admin_post_NoticeUpdate_checkPW.mdo", // 컨트롤러 사용할 때, 내가 보낼 데이터의 주소
        			dataType: "text", // 데이터 타입
        			data:{
        				// 여기서는 컨트롤러에 존재하고 있는 변수명(KEY), (VALUE)
        				notice_passwd : $("#all_box #passwd").val(),
        				notice_seq: Number($("#all_box #notice_seq").val())
        			},
        			async: false,
        			success: function(data){ // 정상적으로 응답 받은 경우 호출
        				console.log(data);
        				if(data == "1"){ // ajax 실행 성공
        					Swal.fire({
        	                	text: "수정 성공!",
        	                	icon: "success",
        	                	showConfirmButton: false,
                               	timer: 1500
        	                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
        	                	var seq = $("#seq").text();
        	                	i();
        	                	let form = $("#update");
        	                	form.action = "/admin_post_NoticeUpdate.mdo";
        	                	form.method = "POST";
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
        	if (result.isConfirmed) { // 모달창에서 confirm 버튼 누른 경우
        		console.log("noticeUpdateForm.notice_passwd : " + noticeUpdateForm.notice_passwd.value, "noticeUpdateForm.notice_seq : " + noticeUpdateForm.notice_seq.value );
        		$.ajax({
        			url: "/admin_post_NoticeUpdate_checkPW.mdo",
        			type: "POST",
        			data: {
        				notice_passwd: $("#all_box #passwd").val(),
        				notice_seq: Number($("#all_box #notice_seq").val())
        			},
        			dataType: "JSON",
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
        						var seq = $("#notice_seq").val();
        						location.href="/noticeDelete.mdo?notice_seq=" + seq;
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
        	// Promise 리턴 받으면
            if (result.isConfirmed) { // 모달창에서 confirm 버튼 누른 경우
                Swal.fire({
                	text: "공지사항 목록으로 되돌아갑니다.",
                	icon: "success",
                	showConfirmButton: false,
                	timer: 1500,
                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
                	location.href="/admin_post_Notice.mdo";
                })
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});

init();

function init(){ // html 로 인식하던 "" 을 value 로 인식시켜서 " 나 ' 를 사용 가능하도록 만들어줌
	console.log($(".note-editable").text());
	$("#notice_content").val($(".note-editable").text());
	console.log($("#notice_content").val());
}

$(document).on("click", "#noticeUpdate", function(){
	console.log("hi");
	console.log($(".note-editable").text());
	$("#notice_content").val($(".note-editable").text());
	console.log($("#notice_content").val());
})

$(document).on("DOMSubtreeModified", ".note-editable", function(){
	$("#content").val($(".note-editable").html());
})