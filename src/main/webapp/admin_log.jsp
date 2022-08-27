<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
 <link href="/css/test.css" rel="stylesheet">
  <link href="/css/admin_log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	    <div id="mainWrapper" class="row m-3">
      <div class="col">
        <div class="row d-flex align-items-center m-5 p-2 rounded bg-back" id="filter_box">
          <div class="col-10" id="content_search">
            <div class="row mb-3" id="make_button">
              <div class="col-auto">
                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                  <button type="button" id="pdf" class="btn btn-danger rounded-start">PDF</button>

                  <button type="button" id="excel" class="btn btn-success rounded-end">EXCEL</button>
                </div>
              </div>
            </div>
            <form>
              <div class="row d-flex " id="serach_list">

                <div class="col-auto d-flex flex-column justify-content-center">

                  <div id="search_id" class="col-auto"><input class="form-control" type="text" placeholder="아이디 입력"
                      name="id" /></div>
                </div>

                <div class="col-auto d-flex flex-column justify-content-center">

                  <div id="search_active" class="col-auto"><input class="form-control" type="text" placeholder="활동 입력"
                      name="active" />
                  </div>
                </div>
                <div class="col-auto d-flex flex-column justify-content-center ">
                  <div id="search_time" class="col-auto ">

                    <input id="time_real" class="form-control w-100" type="datetime-local" name="time" />
                  </div>
                </div>

                <div class="col row d-flex align-items-center">

                  <div class="col-auto  mt-2 " id="resetBox">
                    <input type="reset" class="col btn btn-info p-2 rounded-pill text-white" value="초기화" />
                  </div>
                  <div class="col-auto  mt-2" id="search_Box">
                    <input type="submit" class="col btn btn-info  p-2 rounded-pill text-white" value="검색" />
                  </div>


                </div>

              </div>
            </form>
          </div>
          <div class="col-2 d-flex flex-column align-items-center justify-content-center" id="content_select">
            <div class="form-check pb-5">
              <input class="form-check-input" type="checkbox" name="amdin" id="admin">
              <label class="form-check-label" for="admin">
                관리자
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="user" id="user">
              <label class="form-check-label" for="user">
                사용자
              </label>
            </div>
          </div>
        </div>
        <div class="row d-flex m-5" id="table_box">
          <table class="table " id="table">
            <thead>
              <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>활동</th>
                <th>시간</th>
                <th>카테고리</th>
              </tr>
            </thead>
            <tbody>

              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>

              <tr>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="1">1</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="qjawns">qjawns</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="회원가입">회원가입</p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="2022-11-15 11:15">2022-11-15
                    11:15
                  </p>
                </td>
                <td>
                  <p class="rowColumn" contenteditable="false" data-default="관리자">관리자</p>
                </td>

              </tr>
            </tbody>
          </table>
        </div>
        <div id="page" class="row justify-content-center d-flex">
          <div class="col"></div>
          <nav class="col d-flex" aria-label="...">
            <ul class="pagination">
              <li class="page-item disabled">
                <span class="page-link">
                  < </span>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active" aria-current="page">
                <span class="page-link">2</span>
              </li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">></a>
              </li>
            </ul>
          </nav>
          <div class="col"></div>
        </div>
      </div>


    </div>
	


	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->

</body>
</html>