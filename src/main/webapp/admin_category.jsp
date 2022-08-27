<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
  <link href="/css/test.css" rel="stylesheet">
  <link href="/css/admin_category.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	  <div id="main_wrapper" class="m-2  w-100 row">
      <div class="mb-0 p-0">
        <button id="all" class="select p-2">전체</button>
        <button id="category" class="unselect p-2">홍보 카테고리</button>
      </div>

      <div id="all_box" class="bg-white w-100">
        <div class="row d-flex align-items-center" id="input_line_top">
          <div class="col  me-2 mt-3">
            <div class="input-group mb-3 ">

              <input class="fs-5 w-100" type="text" id="name" name="name" placeholder="이름" aria-label="Username"
                aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col  me-2 mt-3">
            <div class="input-group mb-3 d-flex  ">

              <select class="row form-select w-100 fs-5" id="level" name="level" id="level"
                aria-label="Default select example">
                <option class="fs-5">카테고리 단계</option>
                <option class="fs-5" value="1">상위</option>
                <option class="fs-5" value="2">중위</option>
                <option class="fs-5" value="3">하위</option>
              </select>
            </div>
          </div>
          <div class="col  me-2 mt-3">
            <div class="input-group mb-3 ">

              <input class="fs-5 w-100" id="upperCategory" type="text" name=" upperCategory" placeholder="상위 카테고리 코드"
                aria-label="upperCategory" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col  me-2 mt-3">
            <div class="input-group mb-3 ">

              <input class="fs-5 w-100" id="category" type="text" name="category" placeholder="카테고리코드"
                aria-label="category" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col-auto ">
            <div class="input-group p-0 mt-2  col">
              <button id="add_btn" class="btn bg-blue text-white rounded-pill col">추가</button>
            </div>
            <div class="input-group p-0 mt-2  col">
              <button id="add_btn" class="btn bg-blue text-white rounded-pill col">검색</button>
            </div>
          </div>

        </div>
        <div class="row d-flex m-1" id="table_box">
          <table class="table " id="table">
            <thead>
              <tr>
                <th><input class="form-check-input border-1 border-dark allche" type="checkbox" value=""
                    id="flexCheckChecked" checked></th>
                <th>번호</th>
                <th>이름</th>
                <th>카테고리 단계</th>
                <th>상위 카테고리 코드</th>
                <th>카테고리 코드</th>
                <th><button class="btn btn-warning rounded-pill seldel">선택 삭제</button></th>
              </tr>
            </thead>
            <tbody>

              <tr>
                <td>

                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                    id="flexCheckChecked" checked>

                </td>
                <td>
                  <p contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="selectColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>
                <td>

                  <button class="btn btn-danger rounded-pill del">삭제</button>

                </td>

              </tr>
              <tr>
                <td>

                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                    id="flexCheckChecked" checked>

                </td>
                <td>
                  <p contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="selectColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>
                <td>

                  <button class="btn btn-danger rounded-pill del">삭제</button>

                </td>

              </tr>
              <tr>
                <td>

                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                    id="flexCheckChecked" checked>

                </td>
                <td>
                  <p contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="selectColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>
                <td>

                  <button class="btn btn-danger rounded-pill del">삭제</button>

                </td>

              </tr>
              <tr>
                <td>

                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                    id="flexCheckChecked" checked>

                </td>
                <td>
                  <p contenteditable="false" data-default="1">3</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="selectColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>
                <td>

                  <button class="btn btn-danger rounded-pill del">삭제</button>

                </td>

              </tr>
              <tr>
                <td>

                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value=""
                    id="flexCheckChecked" checked>

                </td>
                <td>
                  <p contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="selectColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>
                <td>

                  <button class="btn btn-danger rounded-pill del">삭제</button>

                </td>

              </tr>


            </tbody>
          </table>
        </div>
      </div>
      <div id="cate_box" class="bg-white w-100">
        <table class="table " id="table">
          <thead>
            <tr>
              <th>번호</th>
              <th>이름</th>
              <th>카테고리 단계</th>

              <th>카테고리 코드</th>
              <th><button class="btn btn-warning rounded-pill">수정 완료</button></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <p contenteditable="false" data-default="1">1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">중위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="1-1">1-1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="1-2">1-2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="2">2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">중위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="2-1">2-1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="2-2">2-2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="3">3</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">중위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="3-1">3-1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="3-2">3-2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="4">4</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">중위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="4-1">4-1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="4-2">4-2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="5">5</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">중위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="5-1">5-1</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
            <tr>
              <td>
                <p contenteditable="false" data-default="5-2">5-2</p>
              </td>
              <td>
                <p contenteditable="true" id="name" data-default="">무협</p>
              </td>
              <td>
                <p contenteditable="false" data-default="">하위</p>
              </td>
              <td>
                <p class="rowColumn num" id="" contenteditable="false" data-default="A$#$FFD">A$#$FFD</p>
              </td>
              <td>
                <button class="btn btn-danger rounded-pill reset">초기화</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>



    </div>


	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
<script src="/js/category.js"></script>
</body>
</html>