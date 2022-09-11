<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
<link href="/css/admin_post_Faq.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row" style="width: 80% !important;">
		<div class="mb-0 p-0">
			<button onclick="location.reload();" id="all" class="select p-2">FAQ</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<div class="col-1"></div>
				<div class="col-2 me-2 mt-3">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level1" name="level1" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5 " value="주문/결제">주문/결제</option>
							<option class="fs-5 " value="배송/수령일 안내">배송/수령일 안내</option>
							<option class="fs-5 " value="반품/교환/환불">반품/교환/환불</option>
							<option class="fs-5 " value="회원">회원</option>
						</select>
					</div>
				</div>

				<!-- 주문/결제 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select1 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level2" name="level2" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="주문">주문</option>
							<option class="fs-5" value="결제">결제</option>
							<option class="fs-5" value="포인트">포인트</option>
							<option class="fs-5" value="쿠폰">쿠폰</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 배송 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select2 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level3" name="level3" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="배송료">배송료</option>
							<option class="fs-5" value="배송안내">배송안내</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 교환/환불 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select3 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level4" name="level4" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="주문취소/변경">주문취소/변경</option>
							<option class="fs-5" value="반품/교환/환불">반품/교환/환불</option>
							<option class="fs-5" value="주의사항">주의사항</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>
				<!-- 회원 카테고리 부분 -->
				<div class="col-3 me-2 mt-3 form-select4 hide">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level5" name="level5" aria-label="Default select example">
							<option class="fs-5" value="">전체</option>
							<option class="fs-5" value="회원가입/탈퇴">회원가입/탈퇴</option>
							<option class="fs-5" value="회원정보 확인/변경">회원정보 확인/변경</option>
							<option class="fs-5" value="개인정보 유효기간제">개인정보 유효기간제</option>
							<option class="fs-5" value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="col-3 me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" type="text" id="search" placeholder="검색할 내용 입력">
					</div>
				</div>
				<div class="col-auto ">
					<div class="input-group p-0 mt-2  col">
						<button id="search_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
						&nbsp;&nbsp;
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col" onclick="location.href='/FaqInsert.mdo'">추가</button>
					</div>
				</div>
			</div>
			<div class="row d-flex m-1" id="table_box">
				<table class="table " id="table">
					<thead>
						<tr>
							<th><input class="form-check-input border-1 border-dark allche" type="checkbox" id="flexCheckChecked" checked></th>
							<th>번호</th>
							<th>내용</th>
							<th><button class="btn btn-warning rounded-pill seldel">선택 삭제</button></th>
						</tr>
					</thead>
					
					<c:set var="allCount" value="1"/>
					<tbody>
						<c:forEach items="${faqList }" var="faq" begin="0" end="4">
						<tr>
							<td><input class="form-check-input border-1 border-dark delche" type="checkbox" name="chkbox" id="flexCheckChecked" checked>
							</td>
							
							<td>
								<p id="seq">
									${allCount}
									<c:set var="allCount" value="${allCount + 1 }"/>
								</p>
								<input type="hidden" value="${faq.FAQ_seq }"/>
							</td>
							
							<td>
								<p class="rowColumn" id="ask">
									<a href="/FaqDetail.mdo?FAQ_seq=${faq.FAQ_seq}&seq=${allCount}">
										${faq.FAQ_ask }
									</a>
								</p>
							</td>
							
							<td>
								<button class="btn btn-danger rounded-pill del" type="button">삭제</button>
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
						<c:if test="${allPage ne 1}">
							<li class="page-item"> <a class="page-link">< </a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage}">
							<c:if test="${allPage ne i}">
								<li class="page-item"><a class="page-link" href="#">${i} </a></li>
							</c:if>

							<c:if test="${allPage eq i}">
								<li class="page-item active" aria-current="page"><a href="/FaqList.mdo?page=${i}&ask=${allSvo.ask}&seq=${allSvo.seq}" class="page-link">${i}</a></li>
							</c:if>
						</c:forEach>
						 
						<c:if test="${allPage lt allCount/5}">
						<li class="page-item"><a class="page-link" href="#">></a></li>
						</c:if>
					</ul>
				</nav>
				<div class="col"></div>
			</div>
			
			<input type="hidden" value="${allSvo.ask}" id="askche"/>
			<input type="hidden" value="${allSvo.seq}" id="seqche"/>
			<input type="hidden" value="${allSvo.page}" id="pageche"/>
			<input type="hidden" value="${allSvo.bigsort}" id="bigsortche"/>
			<input type="hidden" value="${allSvo.smallsort}" id="smallsortche"/>
			
		</div>
	</div>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/js/admin_post_Faq.js"></script>
</body>
</html>