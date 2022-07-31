<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Common head include -->
    <jsp:include page="commonjsp/common_head.jsp"></jsp:include>
</head>
<body>
	<!-- Common header include -->
    <jsp:include page="commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    
    <!-- Page Header Start -->
    <!-- 아래 텍스트는 수정가능 My page, Home, Pages, Contact Us 는 각 페이지마다 다를 수 있으므로-->
    <div class="container-fluid page-header wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">My Page</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-body" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Contact Us</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    
	<!-- 여기서부터 바디 작업 하면됨 -->    
	
	    
    
    <!-- Footer Start -->
    	<!-- Common Footer include -->
        <jsp:include page="commonjsp/common_footer.jsp"></jsp:include>
        
	<!-- Footer End -->
</body>
</html>