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
		<form action="updateMyRequest.do" method="post" enctype="multipart/form-data" id="updateMyRequestForm" onsubmit="return checkWriteForm()">
			<div class="container">
				<div>
					<table class="table">
						<thead>
							<tr>
								<%-- <th>${myRequestVO.ask_seq}</th> --%>
								<th style="width:20%;">Q${myRequestVO.ask_seq}</th>
								<th style="width:60%;">${myRequestVO.ask_title}</th>
								<th style="width:20%;">${sessionUserInfo.user_name}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row" colspan="3">
									<textarea rows="10" style="width:100%;" id="ask_content" name="ask_content">${myRequestVO.ask_content}</textarea>
								</th>
							</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<%-- <td><a href="#" onclick="window.open('${myRequestVO.ask_file}','Attachment','width=430,height=500,location=no,status=no,scrollbars=yes');">aa${filename}</a></td> --%>
									<c:if test="${myRequestVO.ask_file ne null}">
										<td><a href="javascript:attachPopup()">확인</a></td>
									</c:if>
									<c:if test="${myRequestVO.ask_file == null}">
										<td>첨부파일 없음</td>
									</c:if>
									<td></td>
								</tr>
							
							<!-- 답변대기 상태라면 첨부파일 수정 가능 -->
							<c:if test="${myRequestVO.ask_status == '답변 대기'}">
								<tr>
									<th class="bg-light">첨부파일 변경</th>
									<td colspan="2"><input type="file" accept="image/*,.txt"
										multiple id="uploadFile" name="uploadFile" /></td>
									<td><input type="button" class="bg-light" id="delFile" value="삭제">
									</td>
								</tr>
								<tr>
									<th class="bg-light">비밀번호</th>
									<td colspan="2"><input type="password" id="ask_password" name="ask_password" /></td>
									<td>
									</td>
								</tr>
							</c:if>
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
					<!-- 답변대기 상태라면 수정 및 삭제 가능, 이미 답변완료된 글은 수정 및 삭제 불가능 -->
					<c:if test="${myRequestVO.ask_status == '답변 대기'}">
						<button class="btn btn-primary" type="button" id="updateMyRequestBtn">수정</button>
						<button class="btn btn-primary" type="button" id="deleteMyRequestBtn">삭제</button>
					</c:if>
					<button class="btn btn-primary" type="button" id="returnListBtn">목록으로</button>
				</div> 
				<!-- 답글작성 끝 -->
			</div>
			<input type="hidden" id="ask_seq" name="ask_seq" value="${myRequestVO.ask_seq}" />
		</form>
		
		<!-- 공통 마이페이지 바텀 -->
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
		<!-- 공통 마이페이지 바텀 끝 -->
		
		<!-- Contact End -->


		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<script src="/js/my_requestdetail.js"></script>
		<!-- Footer End -->
		<script type="text/javascript">
			$("#returnListBtn")
				.click(function(){
					let url = "myRequestList.do?pageNum=${criteria.pageNum}&searchCondition=${criteria.searchCondition}&searchKeyword=${criteria.searchKeyword}&selectCondition=${criteria.selectCondition}";
					location.href = url;
				});
			
			function attachPopup() {
				alert("첨부파일");
				//창 크기 지정
				let width = 500;
				let height = 500;
				
				//가운데 정렬
				let left = (window.screen.width / 2) - (width / 2);
				let top = (window.screen.height / 2) - (height/2);
				
				//윈도우 속성 지정
				let windowStatus = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
				
				//연결할 url
				const url = "${myRequestVO.ask_file}";
				
				//팝업창 열기
				window.open(url, "첨부파일", windowStatus);
			}
		</script>
</body>

</html>