<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
 <link href="./css/test.css" rel="stylesheet">
    <link href="./css/admin_log.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="mainWrapper" class="col-10 m-3">
            <div class="col">
                <div class="row d-flex align-items-center m-5 p-2 rounded bg-back" id="filter_box">
                    <form>
                        <div class="col-12 d-flex " id="content_search">
                            <div class="row d-flex justify-content-between " id="serach_list">

                                <div class="col-auto d-flex flex-column justify-content-center">

                                    <div id="search_id" class="col-auto"><input class="form-control" type="text"
                                            placeholder="아이디 입력" name="id" /></div>
                                </div>

                            </div>
                            <div class="col-auto d-flex flex-column justify-content-center ">
                                <div id="search_time" class="col-auto ">
                                    <input id="time_real" class="form-control w-100" type="datetime-local"
                                        name="time" />
                                </div>
                            </div>
                            <div class="col-auto  mt-2 " id="resetBox">
                                <input type="reset" class="col btn btn-info p-2 rounded-pill text-white" value="초기화" />
                            </div>
                            <div class="col-auto  mt-2" id="search_Box">
                                <input type="submit" class="col btn btn-info  p-2 rounded-pill text-white" value="검색" />
                            </div>
                            <div class="col-auto  mt-2" id="search_Box">
                                <input type="button" class="col btn btn-info  p-2 rounded-pill text-white"
                                    value="응답 완료 삭제" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row d-flex m-1" id="table_box">
                <table class="table " id="table">
                    <thead>
                        <tr>
                            <th><input class="form-check-input border-1 border-dark allche" type="checkbox" value=""
                                    id="flexCheckChecked" checked></th>
                            <th>번호</th>
                            <th>아이디</th>
                            <th>최신메세지</th>
                            <th>가장 최근 날짜</th>
                            <th>알림 갯수</th>
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
                                <p contenteditable="false" data-default="메시지 내용은 어쩌고 저쩌고">메시지 내용은 어쩌고 저쩌고</p>
                            </td>
                            <td>
                                <p contenteditable="false" data-default="2022-11-15 11:15">
                                    2022-11-15
                                    11:15
                                </p>
                            </td>
                            <td>
                                <p contenteditable="false" data-default="12">
                                    12
                                </p>
                            </td>
                            <td>
                                <button class="btn btn-danger rounded-pill del">삭제</button>
                            </td>
                        </tr>
                


                    </tbody>
                </table>
            </div>
            <div id="page" class="row justify-content-center d-flex">
                <div class="col"></div>
                <nav class="col justify-content-center d-flex" aria-label="...">
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

	
<input type="hidden" id="userid" value="adminadmin"/>

	<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
	<!-- 여기서부터 JS 추가 -->
  
   <script src="/js/admin_realChat.js"></script>
</body>
</html>