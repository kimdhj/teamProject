<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-warning me-md-2" type="button">고객문의
				바로가기</button>
		</div>

		<!-- 문의글 시작 -->
		<form>
			<div class="container">
				<div>
					<table class="table">
						<thead>
							<tr>
								<%-- <th>${myRequestVO.ask_seq}</th> --%>
								<th style="width:10%;">Q</th>
								<th style="width:70%;">${myRequestVO.ask_title}</th>
								<th style="width:20%;">${sessionUserInfo.user_name}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" colspan="3">
									<textarea rows="10" style="width:100%;">${myRequestVO.ask_seq}</textarea>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
				<c:if test="${not empty myRequestReplyVO.ask_reply_seq}">
					<div>
						<table class="table">
							<thead>
								<tr>
									<%-- <th>${myRequestVO.ask_seq}</th> --%>
									<th style="width:10%;">A</th>
									<th style="width:70%;">RE : ${myRequestVO.ask_title}</th>
									<th style="width:20%;">관리자${myRequestReplyVO.ask_reply_writer}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" colspan="3">
										<textarea rows="10" style="width:100%;" readonly>${myRequestReplyVO.ask_reply_content}</textarea>
									</th>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>
				<!-- 문의글 끝 -->

				<!-- 답글작성 시작 -->
				<!-- <div class="mb-12">
					<label for="exampleFormControlTextarea1" class="form-label">답글
						작성</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3" readonly></textarea>
					<form>
				</div> -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<!-- <button class="btn btn-primary me-md-2" type="button">등록하기</button> -->
					<button class="btn btn-primary" type="button" id="returnListBtn">목록으로</button>
				</div>
				<!-- 답글작성 끝 -->
			</div>
		</form>
		<form name="detailForm" method="post">
			<%-- <input type="hidden" id="ask_seq" name="ask_seq" value="${myRequestList.ask_seq}" />
			<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" /> 
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
			$("#returnListBtn")
				.click(function(){
					let url = "myRequestList.do?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&selectCondition=${criteria.selectCondition}";
					location.href = url;
				});
		</script>
</body>

</html>