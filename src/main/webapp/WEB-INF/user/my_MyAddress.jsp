<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/my_MyAddress.css" rel="stylesheet">

</head>

<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->
	<jsp:include page="/WEB-INF/commonjsp/common_mypage_header.jsp"></jsp:include>

		<!-- 여기 삽입 -->
		<div class="row" id="main_wrapper">
			<div class="row" id="under_menu">
				<div class="row" id="discount">
					<div class="row" id="top_sum">
						<div class="col-auto" id="under_topText">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">
                        <path
									d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z" />
                        <path
									d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0z" />
                    </svg>
							나의 주소록
						</div>

					</div>
					<div class="row p-2 fs-3 bg-body rounded mt-3">
						<div class="col-auto row">
							<div class="col-auto">
								<i class="bi bi-house-fill"></i>
							</div>
							<div class="col-auto">입력된 주소</div>
							<div id="max" class="col-auto">
              <c:if test="${max<=0}">
              0
              </c:if>
             
               <c:if test="${max>0}">
               ${max}
              </c:if>
              </div>
							<div class="col-auto">개</div>
						</div>
						<div class="col"></div>
						<div class="col-auto">
							<button id="add_Address"
								class="col-auto rounded-pill bg-info border-1 border-info shadow">등록</button>
						</div>

					</div>

					<div class="row p-0" id="table">
       
						<div id="table_title" class="row">
							<div class="col-2">구분</div>
							<div class="col-2">이름</div>
							<div class="col-3">전화번호</div>
							<div class="col">주소</div>
							<div class="col-2"><input class="form-check-input allche" type="checkbox" value=""
										id="flexCheckChecked" ></div>

						</div>
             
               <div id="table_items">
                 <c:forEach var="it" items="${list}">
						<div id="table_item" class="row">
							<div class="col-2">${it.my_delivery_nickname}<input type="number" id="sew" class="hide" value="${it.my_delivery_seq}"/></div>
							<div  class="col-2">${it.my_delivery_name}</div>
							<div class="col-3 phone">${it.my_delivery_phone}</div>
							<div class="col text-center">${it.my_delivery_address} ${it.my_delivery_remain_address}</div>
							<div class="col-2">
								<div class="form-check p-0">
									<input class="form-check-input delche" type="checkbox" value=""
										id="flexCheckChecked" >

								</div>
							</div>
						</div>
              </c:forEach>  
            </div>
				

			    <div id="table_bottom" class="row">
            <nav aria-label="Page     navigation example">
              <ul class="pagination">
                <c:if test="${vo.page ne 1}">
                  <li class="page-item"><a class="page-link"  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
                </c:if>
                <c:forEach var="i" begin="${startpage}" end="${endpage}">
                  <c:if test="${vo.page ne i}">
                    <li class="page-item"><a class="page-link" >${i}</a></li>
                  </c:if>
                  <c:if test="${vo.page eq i}">
                    <li class="page-item"><a class="page-link active" >${i}</a></li>
                  </c:if>
                </c:forEach>
                <c:if test="${vo.page lt maxpage}">
                  <li class="page-item"><a class="page-link"  aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                  </a></li>
                </c:if>
              </ul>
            </nav>
          </div>

					</div>
					<div class="row">
						<div class="col"></div>
						<div class="col-auto">
							<button type="button" id="seldel"
								class=" p-2 rounded btn-danger border-0 rounded-pill shadow">선택
								삭제</button>
						</div>
            <div class="col-auto">
              <button id="add" type="button"
                class=" p-2 rounded btn-primary border-0 rounded-pill shadow">기본 주소지 등록</button>
            </div>
            
					</div>
					<div class="row p-2 fs-3 bg-body rounded mt-3">
						<div class="col-auto row">
							<div class="col-auto">
								<i class="bi bi-patch-exclamation-fill"></i>
							</div>
							<div class="col-auto">안내</div>

						</div>



					</div>
					<div class="row" id="alert">
						<div class="row mt-2">한 번 등록하신 주소는 변경 불가합니다.</div>
						<div class="row mt-2">기본 주소는 수정이 가능하며, 삭제는 할수가 없습니다.</div>
						<div class="row mt-2">기본 주소로 설정 하시면 회원정보 수정의 주소도 같이 변경되며,
							배송지정보에도 동일적용됩니다.</div>
						<div class="row mt-2">집과 직장주소가 이미 1개씩 등록된 경우 추가 할 수 없으며,
							해당주소를 선택해서 수정하세요</div>
					</div>

					<div class="row ps-5 pe-5 hide" id="coupon_popUp">
						<div
							class="row bg-secondary p-2 border-dark border-top border-start border-end border-solid border-1 "
							id="close_popUP">
							<div class="col"></div>
							<div class="col-auto">
								<button id="popup_close" type="button" class="btn-close"
									aria-label="Close"></button>
							</div>
						</div>
         
						<div
							class="row bg-body border-dark border-bottom border-start border-end border-solid border-1"
							id="body_popUp">
                 <form action="">
							<div class="row mt-2" id="split_line">
								<div class="col-2">구분:</div>
								<div class="col-auto">
									<input id="my_delivery_nickname" class="form-control" type="text" placeholder="구분" />
								</div>
							</div>
							<div class="row mt-2" id="split_line">
								<div class="col-2">이름:</div>
								<div class="col-auto">
									<input id="my_delivery_name" class="form-control" type="text" placeholder="이름" />
								</div>
							</div>

							<div class="row mt-2" id="split_line">
								<div class="col-2">전화번호:</div>
								<div class="col d-flex">
									<input id="my_delivery_phone" class="form-control " type="text" placeholder="01012346642" />
								</div>
							</div>


							<div class="row mt-2" id="zipcode_line">
								<div class="col-2">주소:</div>
								<div class="col-auto">
									<input id="my_delivery_zipcode" readonly type="text" class="form-control"
										id="zipCodeBox" placeholder="우편번호">
								</div>
								<div class="col-auto ms-2">
									<button type="button" id="add_find"
										class="btn btn-primary rounded-pill">주소 찾기</button>
								</div>
							</div>
							<div class="row mt-2" id="address_line">
								<div class="col-2"></div>
								<div class="col-6">
									<input id="my_delivery_address" readonly type="text" class="form-control" id="address"
										placeholder="주소">
								</div>
							</div>
							<div class="row mt-2" id="addressEtc_line">
								<div class="col-2"></div>
								<div class="col-6">
									<input id="my_delivery_remain_address" type="text" id="etc" placeholder="추가 주소">
								</div>
							</div>
							<div class="row mb-2">
								<div class="col"></div>
                <div class="col-auto">
                  <button type="reset" class="btn btn-info">초기화</button>
                </div>
								<div class="col-auto">
									<button type="button" disabled id="Address_Add" class="btn btn-info">추가</button>
								</div>
							</div>

</form>



						</div>

					</div>
				</div>

			</div>
		</div>
<input type="number" id="page" class="hide" value="${vo.page}"/>
		<jsp:include page="/WEB-INF/commonjsp/common_mypage_bottom.jsp"></jsp:include>

		<!-- Footer Start -->
		<!-- Common Footer include -->
		<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
		<script
			src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/js/my_MyAddress.js"></script>
		<!-- Footer End -->
</body>

</html>