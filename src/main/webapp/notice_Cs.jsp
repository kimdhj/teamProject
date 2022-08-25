<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
<link href="/css/notice_Cs.css" rel="stylesheet">
</head>
<jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
	<div class="row cs_top">
		<div class="col-2"></div>
		<div class="col-8">
			<!-- FAQ : 고정 -->
			<div class="row">
				<div class="col-8" id="cs_name">FAQ</div>
			</div>
			<div class="row" id="cs_line">
				<div class="col-12 row" id="cs_faq">
					<div class="col">
						<img src="./img/cs_online-payment.png" width="50%"> <a href="#"
							id="img_payment">주문/결제</a>
					</div>
					<div class="col">
						<img src="./img/cs_delivery.png" width="50%"> <a href="#"
							id="img_delivery">배송/수령일 안내</a>
					</div>
					<div class="col">
						<img src="./img/cs_product-return.png" width="50%"> <a href="#"
							id="img_exchange">반품/교환/환불</a>
					</div>
					<div class="col">
						<img src="./img/cs_programmer.png" width="50%"> <a href="#"
							id="img_user">회원</a>
					</div>
				</div>
			</div>

			<!-- FAQ 내용 : 내용 변함 -->
			<!-- 주문/결제 -->
			<div id="form-select1" class="hide">
			<div style="font-weight: bold">
			⊙ 주문/결제
			</div>
			<div class="col cs_input">
				<select aria-label="Default select example">
					<option selected>전체</option>
					<option value="1">주문</option>
					<option value="2">결제</option>
					<option value="3">포인트</option>
					<option value="4">쿠폰</option>
					<option value="5">기타</option>
				</select>
					&nbsp;<input type="text" placeholder="궁금한 내용 입력해주세요">&nbsp;
					<button>검색</button>
				</div>
				<div class="table" id="table_payment">
					<div class="row" id="table_payment_height">
						<div class="col-4">번호</div>
						<div class="col-8">제목</div>
					</div>
					<div class="row" id="table_payment_content">
						<div class="col-4">1</div>
						<div class="col-8 switch1">
							<a href="#"> 결제방법을 변경할 수 있나요? </a>
						</div>
					</div>
					<div class="row fold hide" id="table_payment_content">
						<div class="col-4">A-1</div>
						<div class="col-8">결제 페이지에서 변경 가능</div>
					</div>
					<div class="row" id="table_payment_content">
						<div class="col-4">2</div>
						<div class="col-8 switch1">
							<a href="#"> 결제방법을 변경할 수 있나요? </a>
						</div>
					</div>
					<div class="row fold hide" id="table_payment_content">
						<div class="col-4">A-2</div>
						<div class="col-8">결제 페이지에서 변경 가능</div>
					</div>
				</div>
			</div>

			<!-- 배송/수령일 안내 -->
			<div id="form-select2" class="hide">
			<div style="font-weight: bold">			
			⊙ 배송/수령일 안내
			</div>
				<div class="col cs_input">
				<select aria-label="Default select example">
					<option selected>전체</option>
					<option value="1">배송료</option>
					<option value="2">배송안내</option>
					<option value="3">기타</option>
				</select>
					&nbsp;<input type="text" placeholder="궁금한 내용 입력해주세요">&nbsp;
					<button>검색</button>
				</div>
				<div class="table" id="table_delivery">
					<div class="row" id="table_delivery_height">
						<div class="col-4">번호</div>
						<div class="col-8">제목</div>
					</div>
					<div class="row" id="table_delivery_content">
						<div class="col-4">1</div>
						<div class="col-8 switch2">
							<a href="#"> 배송 언제옴? </a>
						</div>
					</div>
					<div class="row fold hide" id="table_delivery_content">
						<div class="col-4">A-1</div>
						<div class="col-8">엘레렐레</div>
					</div>
					<div class="row" id="table_delivery_content">
						<div class="col-4">2</div>
						<div class="col-8 switch2">
							<a href="#"> 얼 </a>
						</div>
					</div>
					<div class="row fold hide" id="table_delivery_content">
						<div class="col-4">A-2</div>
						<div class="col-8">나도 몰라</div>
					</div>
				</div>
			</div>

			<!-- 반품/교환/환불 -->
			<div id="form-select3" class="hide">
			<div style="font-weight: bold">
			⊙ 반품/교환/환불
			</div>
				<div class="col cs_input">
				<select aria-label="Default select example">
					<option selected>전체</option>
					<option value="1">주문취소/변경</option>
					<option value="2">반품/교환/환불</option>
					<option value="3">주의사항</option>
					<option value="4">기타</option>
				</select>
					&nbsp;<input type="text" placeholder="궁금한 내용 입력해주세요">&nbsp;
					<button>검색</button>
				</div>
				<div class="table" id="table_change">
					<div class="row" id="table_change_height">
						<div class="col-4">번호</div>
						<div class="col-8">제목</div>
					</div>
					<div class="row" id="table_change_content">
						<div class="col-4">1</div>
						<div class="col-8 switch3">
							<a href="#"> 환불 어케함? </a>
						</div>
					</div>
					<div class="row fold hide" id="table_change_content">
						<div class="col-4">1</div>
						<div class="col-8">환불 어케함?</div>
					</div>
					<div class="row" id="table_change_content">
						<div class="col-4">2</div>
						<div class="col-8 switch3">
							<a href="#"> 교환 어케함? </a>
						</div>
					</div>
					<div class="row fold hide" id="table_change_content">
						<div class="col-4">1</div>
						<div class="col-8">환불 어케함?</div>
					</div>
				</div>
			</div>

			<!-- 로그인 -->
			<div id="form-select4" class="hide">
			<div style="font-weight: bold">
			⊙ 회원
			</div>
				<div class="col cs_input">
				<select aria-label="Default select example">
					<option selected>전체</option>
					<option value="1">회원가입/탈퇴</option>
					<option value="2">회원정보 확인/변경</option>
					<option value="3">개인정보 유효기간제</option>
					<option value="4">기타</option>
				</select>
					&nbsp;<input type="text" placeholder="궁금한 내용 입력해주세요">&nbsp;
					<button>검색</button>
				</div>
				<div class="table" id="table_user">
					<div class="row" id="table_user_height">
						<div class="col-4">번호</div>
						<div class="col-8">제목</div>
					</div>
					<div class="row" id="table_user_content">
						<div class="col-4">1</div>
						<div class="col-8 switch4">
							<a href="#">아이디 찾고 싶어여</a>
						</div>
					</div>
					<div class="row fold hide" id="table_user_content">
						<div class="col-4">1</div>
						<div class="col-8">여기서 찾으세요</div>
					</div>
					<div class="row" id="table_user_content">
						<div class="col-4">2</div>
						<div class="col-8 switch4">
							<a href="#">비밀번호 어디서 찾나요?</a>
						</div>
					</div>
					<div class="row fold hide" id="table_user_content">
						<div class="col-4">1</div>
						<div class="col-8">비밀번호는 여기서 찾아요</div>
					</div>
				</div>
			</div>

			<!-- QnA : 고정 -->
			<div class="row cs_qna">
				<div class="col-2 m-0" id="cs_name2">QnA</div>
				<div class="col-2" id="option_dropdown" style="align-items: center; display: flex;">
					<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="height: 37px; margin-top: 2px;">
						<option value="1" selected>제목</option>
						<option value="2">작성자</option>
					</select>
				</div>
				<div class="col-6" id="option_input" style="align-items: center; display: flex;">
					<div class="input-group">
						<input type="text" class="form-control" aria-describedby="basic-addon2">
						<button class="input-group-text" id="basic-addon2">조회</button>
					</div>
				</div>
				<div class="col m-0 align-items-center" style="align-items: center; display: flex;">
					<button class="input-group-text" id="basic-addon2">문의하기</button>
				</div>
			</div>
			<div class="table" id="table_table2">
				<div class="row" id="table_height2">
					<div class="col-2">번호</div>
					<div class="col-3">제목</div>
					<div class="col-2">작성자</div>
					<div class="col-3">등록일자</div>
					<div class="col-2">답변</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">1</div>
					<div class="col-3">문의드립니다.</div>
					<div class="col-2">qjawns</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">&nbsp;</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">2</div>
					<div class="col-3">어떻게 하는건가요</div>
					<div class="col-2">heysong_93</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">답변 완료</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">3</div>
					<div class="col-3">뭥미</div>
					<div class="col-2">동현</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">답변 완료</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">4</div>
					<div class="col-3">뭥미</div>
					<div class="col-2">소현</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">답변 완료</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">5</div>
					<div class="col-3">뭥미</div>
					<div class="col-2">준혁</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">답변 완료</div>
				</div>
				<div class="row" id="table_content2">
					<div class="col-2">6</div>
					<div class="col-3">나는야 1조 공주</div>
					<div class="col-2">eunxi</div>
					<div class="col-3">2022.11.11</div>
					<div class="col-2">답변 완료</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 페이징 -->
	<div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
<jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>
<script src="/js/notice_Cs.js"></script>
</body>
</html>