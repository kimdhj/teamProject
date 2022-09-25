<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js" integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_header.jsp"></jsp:include>
  <!-- 메인 여기부터 작성 -->
  <div class="container">
    <div id="first" class="d-flex flex-row">
      <div class="col-md-3">
        <article class="stat-cards-item">
          <div class="stat-cards-icon primary">
            <i data-feather="bar-chart-2" aria-hidden="true"></i>
          </div>
          <div class="stat-cards-info">
            <p class="stat-cards-info__num">1478 286</p>
            <p class="stat-cards-info__title">총 취소 건수</p>
            <p class="stat-cards-info__progress">
              <span class="stat-cards-info__profit success"> <i data-feather="trending-up" aria-hidden="true"></i>4.07%
              </span> Last day
            </p>
          </div>
        </article>
      </div>
      <div id="second" class="col-md-3">
        <article class="stat-cards-item">
          <div class="stat-cards-icon warning">
            <i data-feather="file" aria-hidden="true"></i>
          </div>
          <div class="stat-cards-info">
            <p class="stat-cards-info__num">1478 286</p>
            <p class="stat-cards-info__title">총 주문 건수</p>
            <p class="stat-cards-info__progress">
              <span class="stat-cards-info__profit success"> <i data-feather="trending-up" aria-hidden="true"></i>0.24%
              </span> Last day
            </p>
          </div>
        </article>
      </div>
      <div class="col-md-3 row d-flex align-self-center">
     
        <div class="col-auto d-flex align-self-center">
        연도:
        </div>
           <div class="col">
          <select id="yearselect" class="form-select" aria-label="Default select example">
            <option selected>연도 선택</option>
            
          </select>
        </div>
      </div>
    <div class="col-md-3 row d-flex align-self-center">
     
        <div class="col-auto d-flex align-self-center">
        달:
        </div>
           <div class="col">
          <select id="monthsel" class="form-select" aria-label="Default select example">
            <option selected>달 선택</option>
        
          </select>
        </div>
      </div>
    </div>
    <!-- 차트시작 -->
    <div class="d-flex flex-row">
      <div id="myChartOne" class="col-md-6">
        <div class="card border-light">
          <div class="card-header">header</div>
          <div class="card-body">
         
          </div>
        </div>
      </div>
      <div id="myChartTwo" class="col-md-6">
        <div class="card border-light">
          
         
        </div>
      </div>
    </div>
    <div  class="d-flex flex-row">
      <div id="myChartThree" class="col-md-6">
        <div class="card border-light">
          
        </div>
      </div>
      <div id="myChartFour" class="col-md-6">
        <div class="card border-light">
        
        </div>
      </div>
    </div>
    <div class="d-flex flex-row">
      <div id="donught" class="col-md-6">
        <div class="card border-light">
        
        </div>
      </div>
      <div class="col-md-6">
        <div id="donught2" class="card border-light">
          
        </div>
      </div>
    </div>
  </div>
  <!-- 차트 끝 -->
  <jsp:include page="/WEB-INF/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
  <!-- js 추가 -->
  <!-- 차트js 시작 -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="/js/admin_main.js"></script>
  <script>
			
		</script>
  <!-- 차트 js 끝 -->
</body>
</html>