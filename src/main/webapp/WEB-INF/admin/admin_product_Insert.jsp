<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>

<link href="/css/datepicker.min.css" rel="stylesheet" type="text/css"
	media="all" defer />
<link href="/css/my_CancelEtc.css" rel="stylesheet" />
<link href="/css/admin_product_Insert.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div class="row d-flex w-100" id="main_wrapper">
		<div class="col-12" id="icon_content">
			<div class="row d-flex">
				<div class="col-1"></div>
				<div class="col">
					<!-- 이 안에 내용 -->
					<div id="bigbig_title" class="bg-light align-left">상품 추가</div>
					<form action="product_Insert_real.mdo" method="POST" id="upload" name="upload" enctype="multipart/form-data">
						<table class="table">
							<thead>
							</thead>
							<tbody>
								<tr>
									<td rowspan="2" id="book_thumbnail0"><img width="90" height="100" id="book_show0" src="${book_imgURL}" /></td>
									<td rowspan="2" id="book_thumbnail1"><img width="90" height="100" id="book_show1" src="${book_bigimgURL}" /></td>
									<td><input type="text" id="book_title" name="book_title" placeholder="책 제목"></td>
									<td><input type="text" id="book_isbn" name="book_isbn" placeholder="책 고유번호"></td>
								</tr>
								<tr>
									<td><input type="text" id="book_price" name="book_price" placeholder="책 가격"></td>
									<td><input type="text" id="book_points" name="book_points" placeholder="책 포인트"></td>
								</tr>
								<tr>
									<td><input type="file" id="imgfile0" name="imgfile0" accept="/image/*" placeholder="작 사진" onchange="setThumbnail0(event);"></td>
									<td><input type="file" id="imgfile1" name="imgfile1" accept="/image/*" placeholder="큰 사진" onchange="setThumbnail1(event);"></td>
									<td><input type="text" id="author_seq" name="author_seq" placeholder="작가 번호" onkeyup="if(window.event.keyCode==13){checkAuthor()}"></td>
									<td><input type="text" id="book_author" name="book_author" placeholder="책 작가" readonly></td>
								</tr>
								<tr>
									<td><input placeholder="출판일" type="date" id="book_publish_date" name="book_publish_date" /></td>
									<td><input type="text" id="book_remain" name="book_remain" placeholder="책 재고"></td>
									<td><input type="text" id="book_publish" name="book_publish" placeholder="출판사"></td>
									<td><input type="text" id="category_num" name="category_num" placeholder="카테고리 번호"></td>
								</tr>
								<tr>
									<td colspan="4"><textarea rows="6" id="book_descript" name="book_descript" placeholder="책 내용"></textarea></td>
								</tr>
							</tbody>
						</table>
						<!-- 문의글 끝 -->
						<div class="container row d-flex">
							<div class="col-8"></div>
							<div class="col-2">
								<button type="button" class="btn btn-primary" onclick="event_writeCheck();">상품 추가</button>
							</div>
							<div class="col-2">
								<a href="/getProductList.mdo">
										<button type="button" class="btn btn-light">취소</button>
								</a>
							</div>
						</div>
					</form>
					<!-- 이 안에 내용 끝 100%xauto-->
				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</div>
	<!-- JavaScript Libraries -->


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/datepicker.js"></script>
	<script src="/js/datepicker.ko.js"></script>
	<script src="/js/admin_product_Insert.js"></script>
</body>
</html>