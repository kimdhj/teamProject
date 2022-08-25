<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_marketing_EventList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	 <!-- 수정가능 테이블 -->
      <div class="row d-flex w-100" id="main_wrapper">
        <div class="col" id="icon_content">
          <div class="row d-flex">
            <div class="col-1"></div>
            <div class="col">
              <!-- 이 안에 내용 -->
        <table class="table">
          <thead>
            <tr>
              <th>제목</th>
              <th>기간</th>
              <th>대상</th>
              <th>내용</th>
              <th></th>
              <th>순서</th>
            </tr>
          </thead>
          <tbody>

            <tr>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="구독 이벤트">구독 이벤트</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="2022-08-12">2022-08-12</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="모든 회원">모든 회원</div>
                </td>
                <td>
                  <button onclick="tableCreate()">수정</button>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>
              
              <tr>
              <td>
                <div class="rowColumn" contenteditable="false" data-default="출석 이벤트">출석 이벤트</div>
              </td>
              <td>
                <div class="rowColumn" contenteditable="false" data-default="2022-08-13">2022-08-13</div>
              </td>
              <td>
                  <div class="rowColumn" contenteditable="false" data-default="구독 회원">구독 회원</div>
                </td>
                <td>
                  <button onclick="tableCreate()">수정</button>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>
              
              <tr>
                <td>
                <div class="rowColumn" contenteditable="false" data-default="이벤트 호라이즌">이벤트 호라이즌</div>
              </td>
              <td>
                <div class="rowColumn" contenteditable="false" data-default="2022-08-32">2022-08-32</div>
              </td>
              <td>
                <div class="rowColumn" contenteditable="false" data-default="모든 인간">모든 인간</div>
              </td>
              <td>
                <button onclick="tableCreate()">수정</button>
              </td>
              <td>
                <button onclick="tableDelete(this)" id="remove">삭제</button>
              </td>
            <td>
              <button type="button" onclick="moveUp(this)">위로</button>
              <button type="button" onclick="moveDown(this)">아래로</button>
            </td>
          </tr>
          

          <tr>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="깜짝 이벤트">깜짝 이벤트</div>
            </td>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="3022-08-12">3022-08-12</div>
            </td>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="생존 회원">생존 회원</div>
            </td>
            <td>
              <button onclick="tableCreate()">수정</button>
            </td>
            <td>
              <button onclick="tableDelete(this)" id="remove">삭제</button>
            </td>
            <td>
              <button type="button" onclick="moveUp(this)">위로</button>
              <button type="button" onclick="moveDown(this)">아래로</button>
            </td>
          </tr>
          
          <tr>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="끔찍 이벤트">끔찍 이벤트</div>
            </td>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="1922-08-12">1922-08-12</div>
            </td>
            <td>
              <div class="rowColumn" contenteditable="false" data-default="유령 회원">유령 회원</div>
            </td>
            <td>
              <button onclick="tableCreate()">수정</button>
            </td>
            <td>
              <button onclick="tableDelete(this)" id="remove">삭제</button>
            </td>
            <td>
              <button type="button" onclick="moveUp(this)">위로</button>
              <button type="button" onclick="moveDown(this)">아래로</button>
            </td>
          </tr>
        </tbody>
      </table>
      <!-- 수정가능 테이블 끝 -->
      
      <div class="container">
        <div class="row d-flex">
          <div class="col-8">※ 3번째 항목까지는 상단에 크게 위치하구 4번째 항목부터는 하단에 간략하게 출력됩니다.</div>
          <div class="col-2">
            <button type="submit" class="btn btn-primary">수정</button>
          </div>
          <div class="col-2">
            <button type="button" class="btn btn-light">취소</button>
          </div>
        </div>
      </div>

 <!-- 이 안에 내용 끝 100%xauto-->
</div>
<div class="col-1"></div>
</div>
</div>
</div>


	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="js/admin_marketing_EventList.js"></script>
</body>
</html>