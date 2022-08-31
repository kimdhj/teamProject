<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->
<jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
</head>
<body>
	<!-- Common header include -->
	<jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
	<!-- Common header include End -->

	<!-- Page Header Start -->
	<!-- 아래 텍스트는 수정가능 My page, Home, Pages, Contact Us 는 각 페이지마다 다를 수 있으므로-->
	<div class="container-fluid page-header wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container">
			<h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
					<li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
					<li class="breadcrumb-item text-dark active" aria-current="page">Contact
						Us</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- 여기서부터 바디 작업 하면됨 -->

	<!-- 동적테이블 -->
	<div>
		<table border="1px" id="dynamicTable">

			<colgroup>
				<col width="200px">
				<col width="200px">
				<col width="200px">
				<col width="100px">
			</colgroup>

			<thead>
				<tr>
					<th>이름</th>
					<th>직업</th>
					<th>생년월일</th>
					<th>버튼</th>
				</tr>
			</thead>

			<tbody id="dynamicTbody"></tbody>

			<tfoot>
				<tr>
					<td><input type="text" placeholder="이름" id="inName"></td>
					<td><input type="text" placeholder="직업" id="inJob"></td>
					<td><input type="text" placeholder="생년월일" id="inBirth"></td>
					<td><button onclick="tableCreate()">append</button></td>
				</tr>
			</tfoot>

		</table>
	</div>
	<!-- 동적테이블 끝 -->

	<!-- 수정가능 테이블 -->
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>구분</th>
				<th>생일</th>
				<th>email</th>
				<th>마일리지</th>
				<th>쿠폰</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="윤하">윤하</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="오렌지 첫사랑">구독회원</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="2007-10-23">2007-10-23</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="도원경">도원경</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="다시 사랑한다면">일반회원</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="2001-05-01">2001-05-01</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="더더">더더</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false"
						data-default="it's You">관리자</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="1998-11-01">1998-11-01</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="박기영">박기영</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="시작">관리자</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="1999-04-07">1999-04-07</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="이소은">이소은</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="오래오래">일반회원</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="2002-12-21">2002-12-21</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="이소은">이소은</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="오래오래">일반회원</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="2002-12-21">2002-12-21</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="tommy@hanmail.net">tommy@hanmail.net</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="5,320p">5,320p</p>
				</td>
				<td>
					<p class="rowColumn" contenteditable="false" data-default="22장">22장</p>
				</td>
			</tr>
			
		</tbody>
	</table>
	<!-- 수정가능 테이블 끝 -->

	<!-- Footer Start -->
	<!-- Common Footer include -->
	<jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>

	<!-- Footer End -->

	<!-- 동적테이블 js -->
	<script>
		function tableCreate(){
			var html = '';
						
			var name = $("#inName").val();
			var job = $("#inJob").val();
			var birth = $("#inBirth").val();
			var remove = $("remove").val();
						
			html += '<tr>';
			html += '<td>'+name+'</td>';
			html += '<td>'+job+'</td>';
			html += '<td>'+birth+'</td>';
			html += '<td><button onclick="tableDelete(this)" id="remove">remove</button></td>';
			html += '</tr>';
						
			$("#dynamicTable").append(html);
						
			$("#inName").val('');
			$("#inJob").val('');
			$("#inBirth").val('');
		}

		function tableDelete(obj){
			var tr = $(obj).parent().parent();

			tr.remove();
		}
	</script>
	<!-- 동적테이블 js 끝 -->

	<!-- 테이블 내부 값 수정 input타입 -->
	<script>
    // @breif contenteditable 속성을 가진경우
    contents = document.getElementsByClassName("rowColumn");
    document.addEventListener("DOMContentLoaded", function() {

        // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
        Array.from(contents).forEach(function(content) {

        	// @breif 마우스로 해당영역을 더블클릭 한경우
            content.addEventListener("dblclick", function(event) {

                // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
	    Array.from(contents).forEach(function(defaultVal) {
                    
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

                if(content.isContentEditable == false) {

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
            content.addEventListener("keypress", function(event) {

            	// @breif Enter키 입력시 실행
                if(event.key === "Enter") {

                    // @details 입력된 값이 빈값( null )인지 체크한다.
                    if(content.textContent == "" || content.textContent == null || content.textContent == undefined || (content.textContent != null && typeof content.textContent == "object" && !Object.keys(content.textContent).length == "")) {

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