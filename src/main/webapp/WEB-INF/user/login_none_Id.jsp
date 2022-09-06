<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> Email 로그인 | 낭만서점 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="resources/css/common.css">
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/common.js"></script>  
<script src="resources/js/jquery.smooth-scroll.min.js"></script> 
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

  legend {
      font-size: 35px;
      text-align: center;
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
				<h1 class="loginTit"><a href="#"><img src="resources/img/img_slidecontents03.png" alt="NangmanBooks" /></a></h1>
        <legend>아이디 찾기</legend>
		
				<ul class="login_list">
					<td>아이디 찾기</td>
					<td><div id="sub-title"> |  회원정보에 등록한 정보로 인증</td></ul>
						<tr>
							<td>
							 <table width="420px" height="70px" align="center" border="0" class="mo" style="font-size:14px;">
								<tr>
								 <td>이름</td>
								 <td><input type="text" name="id_name1"></td>
								</tr>
								<tr>
								 <td>휴대폰</td>
								 <td>
									<select name="id_phone" style="width:50px; height:10;">
								 		<option value ="010" selected="selected">010</option>
									 	<option value ="011">011</option>
								 		<option value ="016">016</option>
								 		<option value ="017">017</option>
								 	</select> -
								 <input type="text" name="id_phone1" style="width:70px;"> -
								 <input type="text" name="id_phone2" style="width:70px;"></td>
								</tr>
							 </table>
								 </td>
							 </tr>
				</ul>
				
				<div class="button-field">
					<button type="submit" id="login-btn" value="찾기" onClick="return joinCheck()" class="btn">아이디 찾기</button>
				</div>
        
        <div class="add-info">
					<ul class="add-info">
          	<li><a href="#">비밀번호 찾기</a></li>
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
