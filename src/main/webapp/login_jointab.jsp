<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<!-- DatePicker -->
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/css/login_jointab.css" rel="stylesheet" type="text/css">

<!-- 여기에 css 관련  -->
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<form method="post" action="/join.do" id="mainwrapper">
		<div class="d-flex col-12 flex-column justify-content-center align-items-center">

			<div class="col-6">
				<div class="mb-3  col-auto">
					<label for="staticEmail" class="col-4 col-form-label">아이디</label>
					<div class="col-auto">

						<c:if test="${kakaoid!=null}">
							<input name="user_id" type="hidden" value="${kakaoid }"
								placeholder="아이디를 입력해주세요" class="form-control" id="kakaoid">
								<input name="user_logintype" type="hidden" value="K"
								placeholder="아이디를 입력해주세요" class="form-control" id="kakaoid">
						</c:if>
						<c:if test="${kakaoid==null}">
							<input name="user_id" required type="text" placeholder="아이디를 입력해주세요"
								class="form-control" id="id">
						</c:if>
					</div>
					<span class="war" id="idword"></span>
				</div>
				
				<div class=" mb-3  col-auto">
					<label for="inputPassword" class="col-4 col-form-label">비밀
						번호</label>
					<div class="col-auto">
						<input required name="user_password" type="password" placeholder="비밀번호를 입력해주세요"
							class="form-control" id="password"> <span class="war"
							id="pasword"></span>
					</div>
				</div>
				<div class="mb-3  col-auto">
					<label for="staticEmail" class="col-4 col-form-label">이름</label>
					<div class="col-auto">
						<input required name="user_name" type="text" placeholder="이름을 입력해주세요"
							class="form-control" id="name">

					</div>
					<span class="war" id="nameword"></span>
				</div>

				<div class="mb-3  col-auto">
					<label for="staticEmail" class="col-4 col-form-label">이메일</label>
					<div class="col-auto">
						<input required name="user_email" type="email" placeholder="이메일을 입력해주세요"
							class="form-control" id="email"> <span class="war"
							id="emaword"></span>
					</div>
				</div>


				<div class="mb-3  col-auto">
					<label for="staticEmail" class="col-4 col-form-label">생일</label>
					<div class="col-auto">
						<input name="user_birth" required readonly placeholder="생일선택해주세요" type="text"
							id="datepicker" style="text-align: center;" />
					</div>
				</div>


				<div class="mb-3  col-auto">
					<label for="staticEmail" class="col-4 col-form-label">주소</label>
					<div class="col-auto d-flex">
						<input required type="text" name="user_zipcode" id="zipcode"
							class="form-control me-5 col-auto" />
						<button type="button" id="addbtn" class="col-auto">주소 검색</button>

					</div>
				</div>


				<div class="mb-3  col">

					<div class="col- d-flex">
						<input required type="text" name="user_address" id="address" class="form-control" />


					</div>
				</div>


				<div class="mb-3  col">

					<div class="col- d-flex">
						<input type="text" id="remainaddress" class="form-control" />


					</div>
				</div>


				<div class="mb-3 col-auto">
					<label for="staticEmail" class="col-4 col-form-label">핸드폰
						번호</label>
					<div class="col-auto d-flex">
						<input required type="text" name="user_phone" id="phone"
							class="form-control me-5 col-auto" />

						<button type="button" id="phchestart" class="col-auto">인증</button>

					</div>
					<span class="war" id="phword"></span>
				</div>
				<div class="mb-3 col-auto">

					<div class="col-auto d-flex">
						<input type="text" required disabled class="me-5" required
							id="chenum" class="form-control" />
						<button id="phche" disabled type="button" class="col-auto">인증
							확인</button>

					</div>
					<div class="war" id="time"></div>
					<div class="war" id="chword"></div>
				</div>
				<div>선호카테고리</div>
				<div class="border border-1 border-dark m-3"></div>
				<div id="cate" class="mb-3 d-flex ">
				<c:forEach var="cate" items="${logincate}">
					
							<div class="col-auto me-4">
								<input name="category_num" class="form-check-input col-auto" type="checkbox" id="${cate.category_seq}"
									value="${cate.category_num}">
								<label class="form-check-label col-auto" for="${cate.category_seq}">
									${cate.category_name} </label>
							</div>
						


					
					</c:forEach>
				</div>
				
				<div class="light-button button-wrapper row align-self-center">
					<input id="fin" type="submit" value="회원 가입" class="join mb-5" />


				</div>

			</div>
		</div>
		
	</form>
	<!-- Footer Start -->
	<!-- Common Footer include -->
	

	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
	<!-- 여기에 js관련  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/jquery.number.min.js"></script>
	<!-- alert 창 예쁘게 -->
	<script src="/datepicker/js/datepicker.js"></script>
	<script src="/datepicker/js/datepicker.ko.js"></script>
	<script src="/js/login_jointab.js"></script>
</body>
</html>


