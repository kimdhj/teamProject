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
		<div class="container">
			<div class="row">
				<div class="col-8"></div>
				<div class="col-4">
					<!-- <button type="button" class="btn btn-warning">고객문의 바로가기</button> -->
				</div>
			</div>
		</div>

		<!-- 문의글 시작 -->
		<form action="myRequestWrite.do" method="post" enctype="multipart/form-data" onsubmit="return checkWriteForm()">
			<table class="table">
				<thead>

				</thead>
				<tbody>
					<tr>
						<th scope="row" class="bg-light align-middle">제목</th>
						<td colspan="3">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="ask_title" name="ask_title"
									placeholder="제목을 입력하세요"> <label for="floatingInput">제목을
									입력하세요</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="bg-light">이름</th>
						<td>${voToken.user_name}</td>
						<th class="bg-light">이메일</th>
						<td>${voToken.user_email}</td>
					</tr>
					<tr>
						<th class="bg-light align-middle">내용</th>
						<td colspan="3">
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" id="ask_content" name="ask_content"
									style="height: 100px"></textarea>
								<label for="floatingTextarea2">내용을 입력하세요</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="bg-light">첨부파일</th>
						<td colspan="2"><input type="file" accept="image/*,.txt"
							multiple capture='user' onchange='aaa' id="uploadFile" name="uploadFile" /></td>
						<td><input type="button" class="bg-light" id="delFile" value="삭제">
						</td>
					</tr>
					<tr>
						<th class="bg-light">비밀번호</th>
						<td colspan="2"><input type="password" id="ask_password" name="ask_password" /></td>
						<td>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 문의글 끝 -->
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary" type="button" id="returnListBtn">문의목록</button>
				<button class="btn btn-primary me-md-2" type="submit">문의접수</button>
			</div>
			<input type="hidden" id="user_id" name="user_id" value="${voToken.user_id}"/>
		</form>
		

		<!-- 공통 마이페이지 바텀 -->
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
		<!-- 공통 마이페이지 바텀 끝 -->

		<!-- Contact End -->


		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<!-- Footer End -->
		<script src="/js/my_requestwrite.js"></script>
</body>

</html>