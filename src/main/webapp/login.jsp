<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 로그인 | 낭만서점 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/common.js"></script>  
<script src="js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
<script type="text/javascript">
// 현재 페이지에만 적용
$(document).ready(function(){
	$('.switch').click(function(){			// 로그인 유지 작동
		$(this).toggleClass("switchOn");
	});
	$('.quick_area').hide();				// 우측 빠른 실행 메뉴 숨김 
});
</script>
</head>

<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap" class="s_point">
	
	<div id="container" id="layout0">
		
		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<!-- login-wrap -->
			<div class="login_wrap">
				<h1 class="loginTit"><a href="#"><img src="img/mainslide_mob01.jpg" alt="NangmanBooks" /></a></h1>
				<ul class="login_list">
					<li class="kakao"><a href="javascript:;"><strong>카카오톡</strong> 로그인</a></li>
					<li class="naver"><a href="javascript:;"><strong>네이버</strong> 로그인</a></li>
					<li class="facebook"><a href="javascript:;"><strong>페이스북</strong> 로그인</a></li>
					<li class="cellphone"><a href="email_login.jsp"><strong>이메일 주소</strong> 로그인</a></li>
					<li class="none"><a href="#"><strong>비회원</strong> 로그인</a></li>
				</ul>
				<div class="btnonoff_line">
					<div class="switch"></div>
					<p>
					    <a href="#" class="btn_onoff" onclick="return false;">로그인 유지</a>
					</p>
				</div>
        				
			</div>
			<!-- //login-wrap -->

		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<li><a href="javascript:;">이용약관</a></li>
				<li><a href="javascript:;">개인정보취급방침</a></li>
			</ul>
			<h2>낭만서점</h2>
            <p class="addr">서울특별시 종로구 종로 1 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0">nangmanbooks@gmail.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) NangmanBooks all right reserved</p>
			<ul class="snslink clear">
				<li><a href="javascript:;">blog</a></li>
				<li><a href="javascript:;">facebook</a></li>
				<li><a href="javascript:;">instargram</a></li>
			</ul>
		</div>
	</footer>

</div>
<!-- //wrap -->

</body>
</html>
