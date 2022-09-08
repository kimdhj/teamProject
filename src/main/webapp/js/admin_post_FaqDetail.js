// input 글자 수에 따라서 input 크기 자동 조절
//$("#input").on("keydown", function(e){
//	$("#input").attr("size", $("#input").val().length);
//});

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
            	Swal.fire({
                	text: "FAQ 목록으로 되돌아갑니다.",
                	icon: "success",
                	showConfirmButton: false,
                	timer: 1500,
                })
                location.href="/admin_post_Faq.mdo";
            }else if(result.isDismissed){
            	return false;
            }
        })
    });
});