<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.romance.user.event.EventVO" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_Review.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>
	

		<!-- 여기 삽입 -->
		<div class="row" id="main_wrapper">
			<div class="row" id="under_menu">
				<div class="row" id="writerBox">
					<div id="under_topText">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
                            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                        </svg>
						나의 리뷰
					</div>
					<div class="row" id="table">
						<div id="table_title" class="row">
							<div class="col-2">일자</div>
							<div class="col-2">책</div>
							<div class="col">내용</div>
							<div class="col-1">별점</div>
							<div class="col-1">삭제</div>
						</div>
						<div id="fordol">
						<c:forEach var="rev" items="${ownReview }"  begin="${st }" end="${en }">
						<div id="table_item" class="row">
							<div class="col-2"><fmt:formatDate value="${rev.reply_date }" pattern="yyyy-MM-dd"/>
								<input type="hidden" value="${rev.order_bookList_seq }"> 
							</div>
							<div class="col-2">${rev.book_title }</div>
							<div class="col"><a href="/myreviewUpdate.do?book_seq=${rev.book_seq }&order_bookList_seq=${rev.order_bookList_seq}">${rev.reply_cotent }</a></div>
							<div class="col-1"><input type="hidden" value="${rev.reply_seq }"></div>
							<div id="starBox" class="col-1">
								<form name="myform" id="myform" method="post" action="./save">
              					  <b>별점</b><input type="number" class="hide" value="${rev.reply_point }" id="star" name="reply_point" />
              					  <fieldset>
               					   <input type="radio" name="rating" value="5" id="rate1"> <label for="rate1">⭐</label>
             					     <input type="radio" name="rating" value="4" id="rate2"> <label for="rate2">⭐</label>
             					     <input type="radio" name="rating" value="3" id="rate3"> <label for="rate3">⭐</label>
             					     <input type="radio" name="rating" value="2" id="rate4"> <label for="rate4">⭐</label> 
           					       <input type="radio" name="rating" value="1" id="rate5"> <label for="rate5">⭐</label>
        					        </fieldset>
       					       </form>
							</div>
							<div class="col-1"><button type="button" class="btn-close" aria-label="Close" onclick="delmyre(this);"></button></div>
						</div>
						</c:forEach>
						</div>
						<div id="table_bottom" class="row">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:if test="${start ne 1 }">
									<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true">&laquo;</span></a></li>
								</c:if>
								<c:forEach var="i" begin="${start }" end="${end}">
									<c:if test="${now eq i }">
										<li class="page-item active"><a class="page-link" href="#" id="now">${i }</a></li>
									</c:if>
									<c:if test="${now ne i }">
										<li class="page-item"><a href="#" class="page-link">${i }</a></li>
									</c:if>
								</c:forEach>	
								<c:if test="${end ne fullpage }">
									<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
								</ul>
							</nav>
						</div>

					</div>

				<input type="hidden" id="user_id" name="user_id" value="${user_id }">
				<input type="hidden" id="st" name="st" value="${st }">
				<input type="hidden" id="total" name="total" value="${total }">
				<input type="hidden" id="fullpage" name="fullpage" value="${fullpage }">

				</div>

			</div>


		</div>

		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	
		<!-- Footer End -->
		<script src="/js/my_Review.js"></script>
</body>

</html>