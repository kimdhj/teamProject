<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- 여기에 css 관련  -->
<link href="/css/login_changepassword.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->



	<!-- Page Header End -->
	<!-- 여기서부터 바디 작업 하면됨 -->
	<div id="mainwrapper"
		class="d-flex col-12 flex-column justify-content-center align-items-center">

		<div class="col-6 ">
			<div id="result" class="row p-5">
				<div class="row">
					<div class="col-auto text-center">아이디</div>
					<div class="col"></div>
					<div class="col-auto text-center">최근 로그인 날짜</div>
				</div>
				
				<c:forEach var="vo" items="${vol}">
					<div class="row">
						<c:set var="len" value="${fn:length(vo.user_id)}"></c:set>
						<c:set var="length" value="${len-3}"></c:set>
						<div class="col-auto text-center">${fn:substring(vo.user_id,0,length)}***
						</div>
						<div class="col"></div>
						<div class="col-auto text-center"><fmt:formatDate value="${vo.user_login_day}" pattern="yyyy-MM-dd" /></div>
					</div>
				</c:forEach>
			</div>


			<div
				class="col-auto button-field d-flex justify-content-center mt-5 mb-5">
				<a href="/login.do"><button class="change me-5">로그인</button></a>

				<a href="index.do"><button class="cancel">메인 화면</button></a>
			</div>



		</div>
	</div>

	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	
	<!-- Footer End -->
</body>
</html>