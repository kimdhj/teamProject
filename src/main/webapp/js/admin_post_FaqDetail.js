// input 글자 수에 따라서 input 크기 자동 조절
//$("#input").on("keydown", function(e){
//	$("#input").attr("size", $("#input").val().length);
//});

$().ready(function () {
    $(".faqlist").click(function () {
        Swal.fire({
            text: "FAQ 목록으로 돌아가시겠습니까?", // 띄울 text
            icon: 'warning', // 아이콘 무늬
            showCancelButton: true, // 취소버튼 보일건지
            confirmButtonColor: '#3085d6', // 확인 버튼 색상
            cancelButtonColor: '#d33', // 취소 버튼 색상
            confirmButtonText: '예', // confirm 버튼의 text 를 나는 예로!
            cancelButtonText: '아니오' // cancel 버튼의 text 를 나는 아니오로!
        }).then((result) => { // 여기서 고른 결과가 result 이고
            if (result.isConfirmed) { // 만약에 result 의 값이 isConfirmed(예) 라면
            	Swal.fire({
                	text: "FAQ 목록으로 되돌아갑니다.", // 내가 띄워줄 text 내용
                	icon: "success", // 그에 맞는 아이콘 무늬 
                	showConfirmButton: false, // Confirm 버튼을 보여줄 것인지? -> 나는 false 로 값이 안나타나고 바로 로딩돼서 없어지도록 만들어줬어!
                	timer: 1500, // 타이머 걸어둬서 1.5초 지나면 바로 modal 없어지지롱
                })
                location.href="/FaqList.mdo"; // 이건 내가 어느 주소로 보내줄건지
            }else if(result.isDismissed){ // 만약에 result 를 아니오로 선택한 경우에는
            	return false; // false 로 아무것도 안해줌!
            }
        })
    });
});