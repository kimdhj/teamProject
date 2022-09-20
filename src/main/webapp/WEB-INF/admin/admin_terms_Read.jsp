<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.romance.admin.terms.impl.TermsDAO"%>
<%@ page import="com.romance.admin.terms.TermsVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" rel="stylesheet">
<link href="/css/log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div class="container">
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<form action="/admin_terms_Delete.mdo" method="post">
				<input type="hidden" name="terms_seq" value="${terms.terms_seq}"/>
				<input class="hide" id="terms_seq" type="number" value="${terms.terms_seq}"/>
					<div class="card border-light">
						<div class="card-header">
							<div class="d-flex flex-row">
								<div class="col-md-6">제 ${terms.terms_article_number}조 ${terms.terms_title}</div>
								<div class="col-md-6">
									<button type="button"
										class="btn btn-light btn-outline-dark btn-sm"
										style="float: right;">약관선택</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex flex-row">
								<table class="table">
									<tr>
										<td>번호</td>
										<td>${terms.terms_seq}</td>
									</tr>
									<tr>
										<td>조항</td>
										<td>제 ${terms.terms_article_number}조</td>
									</tr>
									<tr>
										<td>약관제목</td>
										<td>${terms.terms_title}</td>
									</tr>
									<tr>
										<td>등록일</td>
										<td><fmt:formatDate value="${terms.terms_date }" pattern="yyyy-MM-dd"/></td>
									</tr>
									<tr>
										<td>등록 상태</td>
										<td><c:choose>
										<c:when test="${terms.terms_state == true }">공개</c:when>
										<c:otherwise>비공개</c:otherwise>
										</c:choose></td>
									</tr>
								</table>
							</div>

							<div class="mb-3">
								<p>${terms.terms_content}</p>
							</div>
						</div>
						<div class="card-footer">
							<button type="submit"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;"">삭제</button>
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;"
								onclick="location.href='admin_terms_Main.mdo' ">목록</button>
							<button type="button"
								class="btn btn-light btn-outline-dark btn-sm"
								style="float: right;" onclick="location.href='/admin_terms_Update.mdo?terms_seq=${terms.terms_seq}'">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>