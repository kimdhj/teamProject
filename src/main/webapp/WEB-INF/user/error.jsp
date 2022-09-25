<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Common head include -->

 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/error.css" rel="stylesheet">
<!-- 여기에 css 관련  -->
</head>
<body>
 
 
<div class="page-404">
    <div class="outer">
        <div class="middle">
            <div class="inner">
                <!--BEGIN CONTENT-->
                <div class="inner-circle"><i class="fa fa-cogs"></i><span>ERROR</span></div>
                <span class="inner-status">이용에 불편을 드려 죄송합니다</span>
                <span class="inner-detail">문의 사항은 고객센터로 문의 주세요.<br/><a href="/index.do">메인페이지</a>로 자동으로 이동 됩니다.</span>
                <!--END CONTENT-->
            </div>
        </div>
    </div>
</div>
 <script type="text/javascript">
 setTimeout(function(){location.href="/index.do"},10000);
 
 </script>
</body>
</html>