<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="./css/test.css" rel="stylesheet">
<link href="./css/admin_log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="mainWrapper" class="col-10 m-3">
		<div class="col">
			<div class="row d-flex align-items-center m-5 p-2 rounded bg-back"
				id="filter_box">
				<form>
					<div class="col-12 d-flex " id="content_search">
						<div class="row d-flex justify-content-between " id="serach_list">

							<div class="col-auto d-flex flex-column justify-content-center">

								<div id="search_id" class="col-auto">
									<input class="form-control" id="name_search" type="text" placeholder="아이디 입력"
										name="id" />
								</div>
							</div>

						</div>
						<div class="col-auto d-flex flex-column justify-content-center ">
							<div id="search_time" class="col-auto ">
								<input id="time_real" class="form-control w-100"
									type="datetime-local" name="time" />
							</div>
						</div>
						<div class="col-auto  mt-2 " id="resetBox">
							<input type="reset"
								class="col btn btn-info p-2 rounded-pill text-white" value="초기화" />
						</div>
						<div class="col-auto  mt-2" id="search_Box">
							<input type="button" id="search"
								class="col btn btn-info  p-2 rounded-pill text-white" value="검색" />
						</div>
						<div class="col-auto  mt-2" id="search_Box">
							<input type="button" id="findel"
								class="col btn btn-info  p-2 rounded-pill text-white"
								value="응답 완료 삭제" />
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row d-flex m-1" id="table_box">
			<table class="table " id="table">
				<thead>
					<tr>
						<th><input
							class="form-check-input border-1 border-dark allche"
							type="checkbox" value="" id="flexCheckChecked" checked></th>
						<th>번호</th>
						<th>아이디</th>
						<th>최신메세지</th>
						<th>가장 최근 날짜</th>
						<th>알림 갯수</th>
						<th><button class="btn btn-warning rounded-pill seldel">선택
								삭제</button></th>
					</tr>
				</thead>

				<c:set var="len" value="1"></c:set>
				<tbody>
					<c:forEach var="data" items="${chatli}">
						<c:if test="${fn:indexOf(data.realchatname,'admin')<0}">
							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>

								<td><a href="/chatAdmin.mdo?user=${data.realchatname}admin">
										${len}</a> <c:set var="len" value="${len+1}"></c:set></td>

								<td><a href="/chatAdmin.mdo?user=${data.realchatname}admin">${data.realchatname}</a>
								</td>
								<td><a href="/chatAdmin.mdo?user=${data.realchatname}admin">${data.real_chat_content}</a>
								</td>
								<td><a href="/chatAdmin.mdo?user=${data.realchatname}admin">
										<fmt:formatDate value="${data.real_chat_date}"
											pattern="yyyy-MM-dd" />
								</a></td>

								<td><a href="/chatAdmin.mdo?user=${data.realchatname}admin">
										${data.num}</a></td>

								<td>
									<button onclick="del(this)"
										class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>
						</c:if>
					</c:forEach>


				</tbody>
			</table>
		</div>
		<div id="page" class="row justify-content-center d-flex">
				<div class="col"></div>
				<nav class="col d-flex justify-content-center" aria-label="...">
					<ul class="pagination">
						<c:if test="${all_page ne 1}">
							<li class="page-item "><a class="page-link">
									< </a></li>
						</c:if>
						<c:forEach var="i" begin="${startpage}" end="${endpage}">
							<c:if test="${all_page ne i}">
								<li class="page-item"><a class="page-link"
									href="#">${i}
								</a></li>
							</c:if>

							<c:if test="${all_page eq i}">
								<li class="page-item active" aria-current="page"><a
									href="/category.mdo?page=${i}&name=${all_vos.name}&startdate=${all_vos.startdate}"
									class="page-link">${i}</a></li>
							</c:if>
						</c:forEach>
						 
						<c:if test="${all_page lt all_sum/5}">
						<li class="page-item"><a class="page-link" href="#">></a></li>
						</c:if>
					</ul>
				</nav>
				<div class="col"></div>
			</div>
			<input type="number" id="pageche" class="hide" value="${all_vos.page}"/>
			<input type="text" id="nameche"class="hide" value="${all_vos.name}"/>
			<input type="datetime-local" id="startdate" class="hide" value="${all_vos.startdate}"/>


	<input type="hidden" id="userid" value="adminadmin" />

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

	<script src="/js/admin_realChat.js"></script>
</body>
</html>