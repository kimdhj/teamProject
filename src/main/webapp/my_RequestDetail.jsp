<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Common head include -->
    <jsp:include page="./commonjsp/common_head.jsp"></jsp:include>
    
    
</head>

<body>
    <!-- Common header include -->
    <jsp:include page="./commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
	<jsp:include page="./commonjsp/common_mypage_header.jsp"></jsp:include>

    
                    <!-- 여기 삽입 -->
                    <div class="container">
					  <div class="row">
					    <div class="col-8"></div>
					    <div class="col-4">
					    	<button type="button" class="btn btn-warning">고객문의 바로가기</button>
						</div>
					  </div>
					</div>
					
					<!-- 문의글 시작 -->
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col-3">Q&A</th>
					      <th scope="col-9">제목내용(예치금은 어떻게넣나요?)</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row" colspan="2">예치금넣는거 알려줘어어어어어어어</th>
					    </tr>
					  </tbody>
					</table>
					
					<div class="container">
					  <div class="row">
					    <div class="col-8"></div>
					    <div class="col-2">
					    	<button type="button" class="btn btn-primary">수정하기</button>
						</div>
						<div class="col-2">
					    	<button type="button" class="btn btn-light">목록</button>
						</div>
					  </div>
					</div>
					<!-- 문의글 끝 -->
					
					
					
					<!-- 답글 시작 -->
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col-3">Q&A</th>
					      <th scope="col-9"><input type="text" class="form-control" id="exampleFormControlInput1" placeholder="답변제목"></th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row" colspan="2"><textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea></th>
					    </tr>
					  </tbody>
					</table>
					
					<div class="container">
					  <div class="row">
					    <div class="col-8"></div>
					    <div class="col-2">
					    	<button type="button" class="btn btn-primary">등록하기</button>
						</div>
						<div class="col-2">
					    	<button type="button" class="btn btn-light">목록</button>
						</div>
					  </div>
					</div>
					<!-- 답글 끝 -->
                    

                
            <!-- 공통 마이페이지 바텀 -->
            <jsp:include page="./commonjsp/common_mypage_bottom.jsp"></jsp:include>
            <!-- 공통 마이페이지 바텀 끝 -->
            
    <!-- Contact End -->


    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="./commonjsp/common_footer.jsp"></jsp:include>
        
	<!-- Footer End -->
	
</body>

</html>