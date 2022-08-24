<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_NoticeInsert.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">공지사항 작성 및 수정</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1 mt-2 mb-2 notice_font">제목</div>
				<div class="col-3" style="padding-left: 0px;">
					<input type="text"
						style="width: 90%; margin-top: 2%; margin-bottom: 2%;">
				</div>
				<div class="col-1 notice_font" style="padding-right: 0px;">파일첨부</div>
				<div class="col-3 " style="padding-left: 0px;">
					<input type="file" style="margin-top: 2%; margin-bottom: 2%;">
				</div>
				<div class="row"></div>
				<div class="col-1 mb-2 notice_font" style="padding-right: 0px;">번호</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">31394</div>
				<div class="col-1 mb-2 notice_font" style="padding-right: 0px;">지점</div>
				<div class="col-3 mb-2" style="padding-left: 0px;">관리자</div>
				<div class="col-1 mb-2 notice_font"
					style="padding-right: 0px; margin-left: 5%;">등록일자</div>
				<div class="col mb-2" style="padding-left: 0px;">2018.08.14</div>
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
				<button class="col-auto bg-white border-1 noticedel">삭제</button>
				<button class="col-auto bg-white border-1 noticelist">목록</button>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
                    '삭제되었습니다.',
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
                    '공지사항 목록으로 되돌아갑니다.',
                )
            }
        })
    });
});
</script>
</body>
</html>