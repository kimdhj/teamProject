<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
	

	<!-- 여기 삽입 -->
	<!-- <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-warning me-md-2" type="button">고객문의
			바로가기</button>
	</div> -->
	<div class="d-flex flex-row">
		<p style="color:blue;">${pagination.criteria.pageNum}페이지</p>
	</div>
	<div class="d-flex flex-row">
			<div class="col-md-6">
				<form>
					<div class="d-flex flex-row">
						<div class="col-md-4">
							<select class="form-select form-select mb-3"
								aria-label=".form-select-lg example" name="searchCondition">
								<c:forEach items="${conditionMap }" var="option">
									<option value="${option.value }">${option.key }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id=""
								name="searchKeyword" placeholder="입력하세요">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-light btn-outline-dark">검색</button>
						</div>
					</div>
				</form>
			</div>
			<form>
				<div class="col-md-12">
					<div class="btn-group" role="group"
						aria-label="Basic mixed styles example">
						<button type="submit" class="btn btn-danger" name="selectCondition" value="replyWait">답변대기</button>
						<button type="submit" class="btn btn-secondary" name="selectCondition" value="replyFinish">답변완료</button>
						<button type="submit" class="btn btn-success" name="selectCondition" value="wholeList">전체</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" name="selectCondition" value="user_normal" id="requestWriteBtn">문의하기</button>
					</div>
				</div>
			</form>
		</div>
	<!-- 문의글 시작 -->
	<form>
		<div class="container">
			<table class="table text-center">
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">QnA</th>
						<th scope="col">문의글 제목</th>
						<th scope="col">답변상태</th>
						<th scope="col">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="myRequest" items="${myRequestList}">
						<tr>
							<th style="width:5%;">${myRequest.ask_seq}</th>
							<td style="width:10%;">QnA</td>
							<td style="width:35%;">
								<a href="/myRequestDetail.do?ask_seq=${myRequest.ask_seq}&pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&selectCondition=${criteria.selectCondition}">${myRequest.ask_title}</a>
							</td>
							<td style="width:20%;">${myRequest.ask_status}</td>
							<td style="width:25%;"><fmt:formatDate value="${myRequest.ask_date}" pattern="yyyy-MM-dd HH:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<!-- 문의글 끝 -->

		</div>
	</form>
	<div class="d-flex flex-row">
			<div class="col-md-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm">
						<!-- <li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li> -->
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myRequestList.do?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.startPage - 1 }" />">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="pageNum">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myRequestList.do?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pageNum}" />">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${pagination.next && pagination.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="<c:url value="/myRequestList.do?searchCondition=${pagination.criteria.getSearchCondition() }&searchKeyword=${pagination.criteria.getSearchKeyword() }&pageNum=${pagination.endPage + 1 }" />">다음</a></li>
						</c:if>
						<!-- <a class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
						</a> -->
					</ul>
				</nav>
			</div>
		</div>
		<form name="detailForm" method="post">
			<%-- <input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" /> 
			<input type="hidden" id="searchCondition" name="searchCondition" value="${criteria.searchCondition}" /> 
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${criteria.searchKeyword}" /> 
			<input type="hidden" id="selectCondition" name="selectCondition" value="${criteria.selectCondition}" /> --%> 
		</form>
		
		
	<!-- 공통 마이페이지 바텀 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
	<!-- 공통 마이페이지 바텀 끝 -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- Footer End -->
	<script>
		$("#requestWriteBtn").click(function(){
			let url = "myRequestWrite.do";
			location.href = url;
		});
	</script>
</body>

</html>