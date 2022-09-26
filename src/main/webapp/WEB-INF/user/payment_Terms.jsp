`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.romance.user.event.EventVO" %>
<%@ page import="java.util.List"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/all_terms.css" rel="stylesheet">
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 -->

	<div id="main_wrapper" class="row d-flex">
		<div class="col-2"></div>
		<div class="col">
			<h3>${termscategory}&nbsp;약관</h3>
			<div id="topborder">
				&nbsp;<br></br>
			</div>
			<c:forEach var="term" items="${termsList}">
			<div class="row d-flex">
			<div class="col-4 fw-bold">${term.terms_article_number}조 ${term.terms_title}</div>
			<div class="col"></div>
			</div>
			<div>
				<textarea rows="6" readonly>${term.terms_content }</textarea>
			</div>
			
			<div>
				<br></br>
			</div>
			</c:forEach>			
			
			<div>
				<br></br>
			</div>
			<div>
				<br></br>
			</div>

		</div>
		<div class="col-2"></div>
	</div>



	<!-- 바디 작업 종료 -->
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
	<!-- Footer End -->
</body>
</html>