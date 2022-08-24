<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_FaqInsert.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">FAQ 추가 및 수정</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-2 me-2 mt-3" style="margin-left: 2%;">
					<div class="input-group mb-3 d-flex  ">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5">상위 카테고리</option>
							<option class="fs-5 " value="1">주문/결제</option>
							<option class="fs-5 " value="2">배송/수령일 안내</option>
							<option class="fs-5 " value="3">반품/교환/환불</option>
							<option class="fs-5 " value="4">회원</option>
						</select>
					</div>
				</div>

				<!-- 주문/결제 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select1 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">주문</option>
							<option class="fs-5" value="2">결제</option>
							<option class="fs-5" value="3">포인트</option>
							<option class="fs-5" value="4">쿠폰</option>
							<option class="fs-5" value="5">기타</option>
						</select>
					</div>
				</div>
				<!-- 배송 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select2 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">배송료</option>
							<option class="fs-5" value="2">배송안내</option>
							<option class="fs-5" value="3">기타</option>
						</select>
					</div>
				</div>
				<!-- 교환/환불 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select3 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">주문취소/변경</option>
							<option class="fs-5" value="2">반품/교환/환불</option>
							<option class="fs-5" value="3">주의사항</option>
							<option class="fs-5" value="4">기타</option>
						</select>
					</div>
				</div>
				<!-- 회원 카테고리 부분 -->
				<div class="col-2 me-2 mt-3 form-select4 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="1">회원가입/탈퇴</option>
							<option class="fs-5" value="2">회원정보 확인/변경</option>
							<option class="fs-5" value="3">개인정보 유효기간제</option>
							<option class="fs-5" value="4">기타</option>
						</select>
					</div>
				</div>
				<div class="row"></div>
				<div class="col-1"
					style="font-weight: bolder; font-size: 1.5vw; margin-left: 2%; margin-bottom: 1%; padding-left: 0; padding-right: 0; margin-right: 1%;">추가
					FAQ</div>
				<div class="col" style="padding-left: 0;">
					<textarea rows="1" cols="100"></textarea>
				</div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="row"></div>
				<div class="summernote"></div>
			</div>
		</div>
		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1">비밀번호</div>
				<div class="col">
					<input type="password">
				</div>
			</div>
		</div>

		<div class="row d-flex justify-content-between mt-2 mb-2" id="buttons">
			<div class="col-5"></div>
			<div class="row col-5">
				<button class="col-auto bg-white border-1">등록</button>
				<button class="col-auto bg-white border-1 faqdel">삭제</button>
				<button class="col-auto bg-white border-1 faqlist">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 알림창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
$(function () {
    $("#level").change(function () {
    	if($("#level").val() == "1"){
			$(".form-select1").removeClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "2"){
	        $(".form-select2").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "3"){
    		$(".form-select3").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select2").addClass("hide");
			$(".form-select4").addClass("hide");
    	}else if($("#level").val() == "4"){
    		$(".form-select4").removeClass("hide");
    	    $(".form-select1").addClass("hide");
    	    $(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
    	}
        console.log($("#level").val());
    });
});
</script>
<script>
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
			    ['insert',['picture','link','video']],
			    ['view', ['codeview', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        });
    });
</script>
<script>
$().ready(function () {
    $(".faqdel").click(function () {
        Swal.fire({
            text: "해당 FAQ 내용을 삭제하시겠습니까?",
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
                    '삭제되었습니다.',
                )
            }
        })
    });
});
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
                Swal.fire(
                	'',
                    'FAQ 목록으로 되돌아갑니다.',
                )
            }
        })
    });
});
</script>
</body>
</html>