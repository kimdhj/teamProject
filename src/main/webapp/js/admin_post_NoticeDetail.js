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
                }).then(function(){ // 예를 눌러야지 admin_post_Notice.mdo 로 이동
                	location.href="/admin_post_Notice.mdo";
                })
            }
        })
    });
});
