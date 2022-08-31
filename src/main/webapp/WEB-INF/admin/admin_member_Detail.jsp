<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->

	<div class="container">
		<div class="d-flex flex-row align-items-center">
			<div class="col-md-12">
				<!-- 수정가능 테이블 -->
				<table class="table">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>구분</th>
							<th>생년월일</th>
							<th>연락처</th>
							<th>Email</th>
							<th>마일리지</th>
							<th>보유쿠폰</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>
								<p class="" contenteditable="false" data-default="31421">31421</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false" data-default="도원경">도원경</p>
							</td>
							<td>
								<p class="" contenteditable="false" data-default="sosohan">sosohan</p>
							</td>
							<td><select class="form-select form-select-sm"
								aria-label=".form-select-sm example">
									<option selected>구독</option>
									<option value="1">일반</option>
									<option value="2">블랙</option>
							</select></td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="2020-01-21">2020-01-21</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="010-3212-1345">010-3212-1345</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="tommy@hanmail.net">tommy@hanmail.net</p>
							</td>
							<td>
								<p class="rowColumn" contenteditable="false"
									data-default="123,414,223p">123,414,223p</p>
							</td>
							<td>
								<div class="d-flex justify-content-center">
									<p class="rowColumn" contenteditable="false" data-default="22">22</p>
									<p>장</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 수정가능 테이블 끝 -->
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-12">
				<button type="button" class="btn btn-light btn-outline-dark btn-sm"
					style="float: right;">수정</button>
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="col-md-6">
				<form>
					<div class="card border-light">
						<div class="card-header">쪽지</div>
						<div class="card-body">
							<div class="mb-3">
								<textarea class="form-control" id="" rows="10"></textarea>
							</div>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-light btn-outline-dark btn-sm" style="float: right;">전송</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<div class="card border-light">
					<div class="card-header">Header</div>
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<!-- 테이블 내부 값 수정 input타입 -->
	<script>
        // @breif contenteditable 속성을 가진경우
        contents = document.getElementsByClassName("rowColumn");
        document.addEventListener("DOMContentLoaded", function () {

            // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
            Array.from(contents).forEach(function (content) {

                // @breif 마우스로 해당영역을 더블클릭 한경우
                content.addEventListener("dblclick", function (event) {

                    // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                    Array.from(contents).forEach(function (defaultVal) {

                        // @details 빈값( null )이 존재하는지 체크한다.
                        /* if(
                               defaultVal.textContent == ""
                            || defaultVal.textContent == null
                            || defaultVal.textContent == undefined
                            || (defaultVal.textContent != null
                            && typeof defaultVal.textContent == "object"
                            && !Object.keys(defaultVal.textContent).length == ""))
                        {
    
                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            defaultVal.textContent = defaultVal.dataset.default;
                        }
                         */

                        // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                        defaultVal.textContent = defaultVal.dataset.default;

                        // @breif 수정 불가 상태로 되돌린다.
                        defaultVal.contentEditable = false;
                        defaultVal.style.border = "0px";
                    });

                    if (content.isContentEditable == false) {

                        // @details 편집 가능 상태로 변경
                        content.contentEditable = true;

                        // @details 텍스트 문구 변경
                        // content.textContent = "";

                        // @details CSS 효과 추가
                        content.style.border = "1px solid #FFB6C1";

                        // @details 포커스 지정
                        content.focus();

                    }

                });



                // @breif 키보드 입력이 방생한 경우 실행
                content.addEventListener("keypress", function (event) {

                    // @breif Enter키 입력시 실행
                    if (event.key === "Enter") {

                        // @details 입력된 값이 빈값( null )인지 체크한다.
                        if (content.textContent == "" || content.textContent == null || content.textContent == undefined || (content.textContent != null && typeof content.textContent == "object" && !Object.keys(content.textContent).length == "")) {

                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            content.textContent = content.dataset.default;

                        } else {
                            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                            content.dataset.default = content.textContent;

                        }
                        // @breif 수정 불가 상태로 되돌린다.
                        content.contentEditable = false;
                        content.style.border = "0px";
                    }

                });

            });

        });

    </script>

</body>
</html>