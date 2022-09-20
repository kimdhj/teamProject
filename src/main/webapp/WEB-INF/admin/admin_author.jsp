<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/test.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/admin_category.css" />
</head>
<body>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
  <!-- 여기서부터 화면 작성 시작 -->
  <div id="main_wrapper" class="m-2  w-100 row">
    <div id="all_box" class="bg-white w-100">
      <div class="row d-flex align-items-center" id="input_line_top">
        <div class="col  me-2 mt-3">
          <div class="input-group mb-3 ">
            <input class="fs-5 w-100" type="text" id="author_name" name="author_name" placeholder="작가 이름" aria-label="Username" aria-describedby="basic-addon1">
          </div>
        </div>
        <div class="col  me-2 mt-3">
          <div class="input-group mb-3 ">
            <input class="fs-5 w-100" id="author_seq" type="number" name="author_seq" placeholder="작가 번호" aria-label="category" aria-describedby="basic-addon1" />
          </div>
        </div>
        <div class="col-auto ">
          <div class="input-group p-0 mt-2  col">
            <button id="add_btn" class="btn bg-blue text-white rounded-pill col">추가</button>
          </div>
          <div class="input-group p-0 mt-2  col">
            <button id="search_btn" class="btn bg-blue text-white rounded-pill col">검색</button>
          </div>
        </div>
      </div>
      <div class="row d-flex m-1" id="table_box">
        <table class="table " id="table">
          <thead>
            <tr>
              <th><input class="form-check-input border-1 border-dark allche" type="checkbox" value="" id="flexCheckChecked" checked></th>
              <th>작가 번호</th>
              <th>이름</th>
              <th>책 수</th>
              <th><button class="btn btn-warning rounded-pill" id="selmod">선택 수정</button></th>
            </tr>
          </thead>
          <tbody>
          
            <c:forEach var="it" items="${list}">
              <tr>
                <td>
                  <input class="form-check-input border-1 border-dark delche" type="checkbox" value="" id="flexCheckChecked" checked>
                </td>
                <td>
                  <p id="category_num" >${it.author_seq}</p>
                 
                </td>
                <td>
                  <p class="rowColumn mod" id="category_name" contenteditable="true" data-default="${it.author_name}">${it.author_name}</p>
                  <input type="number" class="hide" value="${it.author_seq}" />
                </td>
                <td>
                  <p>${it.count}</p>
                </td>
                <td>
                  <button class="btn btn-danger rounded-pill del">삭제</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div id="pages" class="row justify-content-center d-flex">
        <div class="col"></div>
        <nav class="col d-flex justify-content-center" aria-label="...">
          <ul class="pagination">
            <c:if test="${vo.page ne 1}">
              <li class="page-item"><a class="page-link" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
              </a></li>
            </c:if>
            <c:forEach var="i" begin="${startpage}" end="${endpage}">
              <c:if test="${vo.page ne i}">
                <li class="page-item"><a class="page-link">${i}</a></li>
              </c:if>
              <c:if test="${vo.page eq i}">
                <li class="page-item"><a class="page-link activep">${i}</a></li>
              </c:if>
            </c:forEach>
            <c:if test="${vo.page lt maxpage}">
              <li class="page-item"><a class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
              </a></li>
            </c:if>
          </ul>
        </nav>
        <div class="col"></div>
      </div>
      <input type="number" class="hide" value="${vo.page}" id="page" /> <input type="number" class="hide" value="${vo.author_seq}" id="seqche" /> <input type="hidden" value="${vo.author_name}" id="nameche" />
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
  <!-- 여기서부터 JS 추가 -->
  <script src="/js/admin_author.js"></script>
</body>
</html>