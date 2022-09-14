<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.romance.admin.product.ProductVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_EventList.css" rel="stylesheet">
<link href="/css/admin_product.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<!-- 수정가능 테이블 -->
	<div class="row d-flex w-100" id="main_wrapper">
		<div class="col" id="icon_content">
			<div class="row d-flex">
				<div class="col-1"></div>
				<div class="col">
					<!-- 이 안에 내용 -->
				<div class="row d-flex">
					<div class="col-1"></div>
					<select class="col-2" id="sort">
						<option value="전체">전체</option>
						<option value="제목">제목</option>
						<option value="작가">작가</option>
						<option value="카테고리">카테고리</option>
					</select>
					<input type="text" placeholder="검색어 입력" class="col" id="searchThing">					
					<button id="search_btn" class="btn bg-blue text-white rounded-pill col-1">검색</button>					
					<div class="col-1"></div>					
				</div>
				<div><br></br></div>
					<!-- 수정가능 테이블 -->
					<table class="table">
						<thead>
							<tr>
								<th><input type="checkbox" id="all_pick"></th>
								<th>번호</th>
								<th>제목</th>
								<th>번호.작가</th>
								<th>출판사</th>
								<th>재고</th>
								<th>가격</th>
								<th>카테고리</th>
								<th>출판일</th>
								<th>판매 수</th>
								<th><button type="button" id="del_pick">선택 삭제</button></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${productList }" var="pro" begin="${start }" end="${end }">
							<tr>
								<td><input type="checkbox" id=""></td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_seq }">${pro.book_seq }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_title }">${pro.book_title }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.author_seq } . ${pro.book_author}">${pro.author_seq } . ${pro.book_author}</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="${pro.book_publish }">${pro.book_publish }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_remain }">${pro.book_remain }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="<fmt:formatNumber value="${pro.book_price }" type="number" />원"><fmt:formatNumber value="${pro.book_price }" type="number" />원</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.category_num }">${pro.category_num }</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="<fmt:formatDate value="${pro.book_publish_date }" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${pro.book_publish_date }" pattern="yyyy-MM-dd"/></p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false" data-default="${pro.book_sellCount }">${pro.book_sellCount }</p>
								</td>
								<td>
									<button type="button" id="del_one">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<!-- 수정가능 테이블 끝 -->
					<div class="row d-flex justify-content-center" id="pppp">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center" id="reload">
								<c:if test="${startpage ne 1 }">
									<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a></li>
								</c:if>
								<c:forEach var="i" begin="${startpage }" end="${endpage}">
									<c:if test="${page eq i }">
										<li class="page-item active"><a class="page-link" href="#" id="now">${i }</a></li>
									</c:if>
									<c:if test="${page ne i }">
										<li class="page-item"><a href="#" class="page-link">${i }</a></li>
									</c:if>
								</c:forEach>	
								<c:if test="${endpage ne fullpage }">
									<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</nav>
					</div>

					<!-- 이 안에 내용 끝 100%xauto-->
				</div>
				<div class="col-1"></div>
			</div>
				<input type="hidden" value="${svo.page }" id="page">
				<input type="hidden" value="${svo.seq }" id="seq">
				<input type="hidden" value="${svo.sort }" id="sort">
				<input type="hidden" value="${svo.thing }" id="thing">
		</div>
	</div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_product.js"></script>
</body>
</html>