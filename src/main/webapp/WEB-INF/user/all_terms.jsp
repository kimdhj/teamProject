`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.romance.user.event.EventVO" %>
<%@ page import="java.util.List"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <!-- Common head include -->
    <jsp:include page="/WEB-INF/commonjsp/common_head.jsp"></jsp:include>
    <!-- 여기에 css 관련  -->
    <link href="/css/all_terms.css" rel="stylesheet">
</head>
<body>
   <!-- Common header include -->
    <jsp:include page="/WEB-INF/commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->
    

    <!-- Page Header End -->
    <!-- 여기서부터 바디 작업 하면됨 -->

   <div id="main_wrapper" class="row d-flex">
      <div class="col-2"></div>
      <div class="col">
         <h3>${termscategory }&nbsp;약관</h3>
         <div id="topborder">
            &nbsp;<br></br>
         </div>
         <c:forEach var="terms" items="${termsPList}">
         <div class="row d-flex">
         <div class="col-5 fw-bold">개인정보) 제 ${terms.terms_article_number}조 ${terms.terms_title }</div>
         <div class="col"></div>
         </div>
         <div>
            <textarea rows="6" readonly>${terms.terms_content }</textarea>
         </div>
         <div>
            <div><input type="checkbox" class="ccheck"> ${terms.terms_title } 조항에 동의 합니다.</div>
         </div>
         <div>
            <br></br>
         </div>
         </c:forEach>
         <c:forEach var="term" items="${termsList}">
         <div class="row d-flex">
         <div class="col-5 fw-bold">${title_sub}) 제 ${term.terms_article_number}조 ${term.terms_title }</div>
         <div class="col"></div>
         </div>
         <div>
            <textarea rows="6" readonly>${term.terms_content }</textarea>
         </div>
         <div>
            <div><input type="checkbox" class="ccheck"> ${term.terms_title } 조항에 동의 합니다.</div>
         </div>
         <div>
            <br></br>
         </div>
         </c:forEach>         
         <div id="all_checking" class="row d-flex m-0">
            <input type="checkbox" class="col-1" onclick="everycheck(this);"><div class="col fw-bold" id="confirming">모든 약관에 동의 하시겠습니까?</div><div class="col-5"></div>
         </div>
         <div>
            <br></br>
         </div>
         <div>
            <br></br>
         </div>
         <div class="container">
            <div class="row d-flex">
               <div class="col-3"></div>
               <div class="col-2">
                     <button type="button" class="btn btn-success btn-sm" onclick="moving${oc}();">동의</button>
               </div>
               <div class="col-2"></div>
               <div class="col-2">
                  <a href="/login.do">    
                     <button type="button" class="btn btn-secondary btn-sm">취소</button>
                  </a>
               </div>
               <div class="col-3"></div>
            </div>
            <div><br></br><br></br></div>
         </div>
      </div>
      <div class="col-2"></div>
   </div>
  <input type="hidden" id="kakaoid" value="${kakaoid}"> 



   <!-- 바디 작업 종료 -->
    <!-- Footer Start -->
       <!-- Common Footer include -->
        <jsp:include page="/WEB-INF/commonjsp/common_footer.jsp"></jsp:include>
           <!-- 여기에 js관련  -->
        <script src="/js/all_terms.js"></script>
   <!-- Footer End -->
</body>
</html>