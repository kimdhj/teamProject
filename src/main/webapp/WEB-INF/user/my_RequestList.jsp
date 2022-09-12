<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<table class="table">
				<thead>
					<c:forEach var="myRequest" items="${myRequestList}">
						<tr>
							<th scope="col-3">QnA</th>
							<th scope="col-7">${myRequest.ask_title}</th>
							<th scope="col-2">${myRequest.ask_date}</th>
						</tr>
					</c:forEach>
				</thead>

			</table>
			<!-- 문의글 끝 -->

		</div>
	</form>


	<!-- 공통 마이페이지 바텀 -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>
	<!-- 공통 마이페이지 바텀 끝 -->

	<!-- Contact End -->


	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

	<!-- Footer End -->
</body>

</html>