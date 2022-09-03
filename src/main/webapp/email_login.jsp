<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> Email 로그인 | 낭만서점 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/common.js"></script>  
<script src="js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
<script>
  var u_id = $('#u_id'),
      pwd = $('#pwd'),
      loginBtn = $('#login-btn');

  loginBtn.click(function(){
    if(u_idd.val() == '') {
      u_id.next('span').addClass('warning');
      setTimeout(function(){
        u_id.next('span').removeClass('warning')
      }, 1500);
    }
    else if(pwd.val() == '') {
      pwd.next('span').addClass('warning');
      setTimeout(function(){
        pwd.next('span').removeClass('warning')
      }, 1500);
    }
  })  

	$(document).ready(function(){
	$('.switch').click(function(){			// 로그인 유지 작동
		$(this).toggleClass("switchOn");
	});
	$('.quick_area').hide();				// 우측 빠른 실행 메뉴 숨김 
});
</script>
<style type="text/css">
  .add-info{
    text-align: center;
    margin: 20px auto;
  }

	.button-field{
		text-align: center;
		margin: 0px auto;
	}
</style>
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
				<h1 class="loginTit"><a href="#"><img src="img/img_slidecontents03.png" alt="NangmanBooks" /></a></h1>

				<ul class="login_list">
					<li class="u_id"></li>
					<div class="input-field">
						<span>ID</span>
						<input type="text" id="u_id" autocomplete="off" required>
					</div>
					<li class="pwd"></li>
					<div class="input-field">
						<span>Password</span>
						<input type="password" id="pwd" required maxlength="12" minlength="8">
					</div>
				</ul>
				<div class="btnonoff_line">
					<div class="switch"></div>
					<p>
					    <a href="#" class="btn_onoff" onclick="return false;">로그인 유지</a>
					</p>
				</div>
				<div class="button-field">
					<button type="submit" id="login-btn" value="가입하기" onClick="return joinCheck()" class="btn">로그인</button>
				</div>
        
        <div class="add-info">
					<ul class="add-info">
          	<li><a href="none.html">아이디/비밀번호 찾기</a></li>
          	<li><a href="join.html">회원가입</a></li>
					</ul>
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