<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.romance.user.event.EventVO" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_EventList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	 <!-- 수정가능 테이블 -->
      <div class="row d-flex w-100" id="main_wrapper">
        <div class="col" id="icon_content">
          <div class="row d-flex">
            <div class="col-1"></div>
            <div class="col">
              <!-- 이 안에 내용 -->

	<!-- 수정가능 테이블 -->
	<table class="table">
		<thead>
			<tr>
				<th><input type="checkbox" id="all_pick"></th>
				<th>번호</th>
				<th>제목</th>
				<th>작가</th>
				<th>출판사</th>
				<th>재고</th>
				<th>가격</th>
				<th>카테고리</th>
				<th><button type="button" id="del_pick">선택 삭제</button></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id=""></td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="1">1</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="헷갈려">헷갈려</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="김혜성">김혜성</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="빡대가리">빡대가리</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="3">3</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="1800원">1800원</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="6">6</p>
				</td>
				<td>
					<button type="button" id="del_one">삭제</button>
				</td>
			</tr>

		</tbody>
	</table>
	<!-- 수정가능 테이블 끝 -->
        

 <!-- 이 안에 내용 끝 100%xauto-->
</div>
<div class="col-1"></div>
</div>
</div>
</div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_product.js"></script>
</body>
</html>