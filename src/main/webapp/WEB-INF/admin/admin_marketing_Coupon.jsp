<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
 <link href="/css/test.css" rel="stylesheet">
  <link href="/css/admin_marketing_Coupon.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	
<div id="main_wrapper" class="m-2  w-100 row">
      <div class="mb-0 p-0">
        <button id="all" class="select p-2">리스트</button>
        <button id="category" class="unselect p-2">생성</button>
      </div>

      <div id="all_box" class="bg-white w-100">
        <div class="row d-flex align-items-center mt-2 mb-2" id="input_line_top">
          <div class="col  me-2  d-flex align-items-center">
            <div class="input-group   ">

              <input class="fs-5 w-100" type="text" id="name" name="name" placeholder="이름" aria-label="Username"
                aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col  me-2  d-flex align-items-center">
            <div class="input-group  d-flex  ">
              <input class="fs-5 w-100" type="text" id="name" name="name" placeholder="쿠폰 번호" aria-label="SerialNum"
                aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col  me-2  d-flex align-items-center">
            <div class="input-group ">

              <input class="fs-5 w-100" id="upperCategory" type="text" name=" upperCategory" placeholder="설명"
                aria-label="upperCategory" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="col-auto d-flex align-items-center ">
            <div class="input-group p-0   col">
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
                <th>쿠폰 번호</th>
                <th>설명</th>


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
                  <p contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
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
                  <p contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
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
                  <p contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
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
                  <p contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
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
                  <p contenteditable="true" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
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

        <form name="coupon_create">
          <div id="create_wrapper" class="row d-flex mt-2">
            <div class="col d-flex align-items-center me-2 mt-3">
              <div class="input-group mb-3 justify-content-center  ">
                <input class="fs-5 w-100" type="text" id="name" name="name" placeholder="이름" aria-label="Username"
                  aria-describedby="basic-addon1">
              </div>
            </div>
            <div class="col-1"></div>
            <div class="col d-flex align-items-center me-2 mt-3">
              <div class="input-group justify-content-center  mb-3 ">
                <input class="fs-5 w-100" type="number" id="Coupon_count" name="Coupon_count" placeholder="갯수"
                  aria-label="Coupon_count" aria-describedby="basic-addon1">
              </div>
            </div>
            <div class="col-1"></div>
            <div class="col d-flex align-items-center me-2  fs-5">
              <div class="form-floating w-100">
                <input class="fs-5 w-100" type="number" id="Coupon_effect" name="Coupon_effect" placeholder="효과(%)"
                  aria-label="Coupon_effect" aria-describedby="basic-addon1">
              </div>%
            </div>

          </div>
          <div id="create_detail" class="mt-2 mb-2">

            <div class="input-group mb-3 justify-content-center">
              <button id="cre_btn" type="button" class="btn btn-info rounded-pill text-white w-100 ">쿠폰 생성</button>
            </div>
          </div>
        </form>

      </div>



    </div>

	<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
	<script src="/js/category.js"></script>
	<script src="/js/marketing_Coupon.js"></script>
</body>
</html>