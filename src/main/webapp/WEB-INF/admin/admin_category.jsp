<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" type="text/css" rel="stylesheet">
<link  rel="stylesheet" type="text/css"  href="/css/admin_category.css"  />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">전체</button>
			<button id="category" class="unselect p-2">홍보 카테고리</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col  me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" type="text" id="name" name="name"
							placeholder="이름" aria-label="Username"
							aria-describedby="basic-addon1">
					</div>
				</div>
				<div class="col  me-2 mt-3">
					<div class="input-group mb-3 d-flex  ">

						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example">
							<option class="fs-5" value="0">상위 카테고리</option>
							<option class="fs-5" value="100">국내</option>
							<option class="fs-5" value="200">외국</option>
						</select>
					</div>
				</div>
				<div class="col  me-2 mt-3">
					<div class="input-group mb-3 ">

						<input class="fs-5 w-100" id="category_btn" type="number"
							name="category" placeholder="카테고리코드" aria-label="category"
							aria-describedby="basic-addon1" />
					</div>
				</div>
				<div class="col-auto ">
					<div class="input-group p-0 mt-2  col">
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">추가</button>
					</div>
					<div class="input-group p-0 mt-2  col">
						<button id="search_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
					</div>
				</div>

			</div>
			<div class="row d-flex m-1" id="table_box">
				<table class="table " id="table">
					<thead>
						<tr>
							<th><input
								class="form-check-input border-1 border-dark allche"
								type="checkbox" value="" id="flexCheckChecked" checked></th>
							<th>번호</th>
							<th>이름</th>
							<th>카테고리 코드</th>
							<th><button class="btn btn-warning rounded-pill" id="selmod">선택
									수정</button></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${all_categoryList}">

							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>
								<td>
									<p contenteditable="false" data-default="${all_count}">${all_count}</p>
									<c:set var="all_count" value="${all_count-1}" />
								</td>
								<td>
									<p class="rowColumn" id="category_name" contenteditable="true"
										data-default="${category.category_name}">${category.category_name}</p>
								</td>
								<td>
									<p class="rowColumn" id="category_num" contenteditable="true"
										data-default="${category.category_num}">${category.category_num}</p>
								</td>
								<td class="hide">
									<p class="rowColumn" id="category_num" contenteditable="false"
										data-default="${category.category_seq}">${category.category_seq}</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="page" class="row justify-content-center d-flex">
				<div class="col"></div>
				<nav class="col d-flex justify-content-center" aria-label="...">
					<ul class="pagination">
						<c:if test="${all_page ne 1}">
							<li class="page-item "><a class="page-link">
									< </a></li>
						</c:if>
						<c:forEach var="i" begin="1" end="${all_sum/5+1}">
							<c:if test="${all_page ne i}">
								<li class="page-item"><a class="page-link"
									href="#">${i}
								</a></li>
							</c:if>

							<c:if test="${all_page eq i}">
								<li class="page-item active" aria-current="page"><a
									href="/category.mdo?page=${i}&name=${all_vos.name}&num=${all_vos.num}"
									class="page-link">${i}</a></li>
							</c:if>
						</c:forEach>
						 
						<c:if test="${all_page lt all_sum/5}">
						<li class="page-item"><a class="page-link" href="#">></a></li>
						</c:if>
					</ul>
				</nav>
				<div class="col"></div>
			</div>
			<input type="hidden" value="${all_vos.name}" id="nameche"/>
			<input type="hidden" value="${all_vos.num}" id="numche"/>
			<input type="hidden" value="${all_vos.page}" id="pageche"/>
		</div>
		<div id="cate_box" class="bg-white w-100">
			<table class="table " id="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>카테고리 코드</th>
						<th><button id="navmod" class="btn btn-warning rounded-pill">수정
								완료</button></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="nav" items="${navlist}">
					<tr>
						<td>
							<p contenteditable="false" class="order" data-default="${nav.nav_category_order}">${nav.nav_category_order}</p>
						</td>
						<td>
							<p contenteditable="true" class="name" data-default="${nav.nav_category_name}">${nav.nav_category_name}</p>
						</td>
						<td>
							<p class="rowColumn num" contenteditable="false"
								data-default="${nav.category_num}">${nav.category_num}</p>
						</td>
						<td>
							<button class="btn btn-danger rounded-pill reset">초기화</button>
						</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
		</div>



	</div>
	<jsp:include page= "/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/admin_category.js"></script>
</body>
</html>