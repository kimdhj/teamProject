<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/join.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.19.5/jquery.validate.min.js">
  </script>
<script src="js/join.js" type="text/javascript"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/addressapi.js"></script>
<script>
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
              // 예제를 참고하여 다양한 활용법을 확인해 보세요.
          }
      }).open();
  </script>
<style type="text/css">
</style>
</head>
<section class="wrap">
	<section class="all-signup">
		<section class="signup">
			<form name="join_form" action="" method="get" id="jaoin_form"
				onsubmit="return form_check()">
				<img src="img/logo.png">
				<legend>Join 낭만서점</legend>
				<p>
					<br> <label for="u_name">이름</label> <input type="text"
						name="u_name" id="u_name" placeholder="이름을 입력하세요"
						required="required"><br> <span class="err_name">
						* 영어,숫자,특수문자는 사용할 수 없습니다</span>
				</p>
				<p>
					<label for="u_id">아이디</label> <input type="text" name="u_id"
						id="u_id" placeholder="아이디를 입력하세요" required="required"> <input
						type="hidden" name="reid" size="20" />
					<button type="button" value="중복확인" onclick="id_search()">아이디
						중복확인</button>
					<br> <span class="err_id">* 5~12글자까지만 입력 가능합니다.</span>
				</p>
				<p>
					<label for="pwd">비밀번호</label> <input type="password" name="pwd"
						id="pwd" placeholder="비밀번호를 입력하세요" required="required"> <br>
					<span class="err_pwd">*영문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자로 입력해
						주세요.</span>
				</p>
				<p>
					<label for="repwd">비밀번호 확인</label> <input type="password"
						name="repwd" id="repwd" placeholder="비밀번호를 다시 입력하세요"
						required="required"> <br> <span class="err_repwd"></span>
				</p>
				<p>
					<label for="birth">생년월일</label>
				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box"> <input type="text" id="yy" class="int"
							maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<!-- BIRTH_DD -->
					<div id="bir_dd">
						<span class="box"> <input type="text" id="dd" class="int"
							maxlength="2" placeholder="일">
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
				</div>
				<p>
					<label for="gender">성별</label>
				</h3>
				<span class="box gender_code"> <select id="gender"
					class="sel">
						<option>성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select>
				</span>

				</p>
				<p>
					<label for="postalCode">주소검색</label> <input type="text"
						name="addr1" id="addr1" placeholder="우편번호"
						style="width: 30%; display: inline;" readonly="readonly">
					<button type="button" onclick="execPostCode();">주소검색</button>
					<br> <label for="addr1">주소</label> <input type="text"
						name="addr2" id="addr2" placeholder="기본주소"
						style="width: 40%; top: 5px;" readonly="readonly"><br>
					<label for="addr2"></label> <input type="text" name="addr3"
						id="addr3" placeholder="상세주소" style="width: 40%; top: 5px;">
				</p>
				<p>
					<label for="email_id">이메일</label> <input type="text"
						name="email_id" id="email_id" placeholder="nangman"
						required="required"> @ <input type="text" name="email_dns"
						id="email_dns" placeholder="gmail.com" required="required">
					<select name="email_sel" id="email_sel"
						onchange="document.getElementById('email_dns').value = this.options[this.selectedIndex].value">
						<option value="">직접 입력</option>
						<option value="naver.com">NAVER</option>
						<option value="hanmail.net">DAUM</option>
						<option value="gmail.com">GOOGLE</option>
						<option value="daum.net">KAKAO</option>
					</select>
				</p>
				<p>
					<label for="mobile">전화번호</label> <span class="box int_mobile">
						<input type="tel" id="mobile" class="int" maxlength="16"
						placeholder="01012345678">
					</span> <span class="error_next_box"></span>
				</p>
				<section class="signup-terms">
					<p class="terms-p">이용약관 동의</p>
					<textarea name="" id="text" cols="73" rows="17" readonly>

1. 개인정보의 수집항목 및 수집방법 
  통계청 나라통계사이트에서는 기본적인 회원 서비스 제공을 위한 필수정보로 
  실명인증정보와 가입정보로 구분하여 다음의 정보를 수집하고 있습니다.
  필수정보를 입력해주셔야 회원 서비스 이용이 가능합니다.

  가. 수집하는 개인정보의 항목 
  * 수집하는 필수항목
  - 실명인증정보 : 이름, 휴대전화번호, 본인 인증 또는 
                  I-PIN(개인식별번호), GPKI
  - 가입정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호,
               휴대전화번호, 기관명
  * 선택항목
  - 주소, 기관의 부서명
              
  [컴퓨터에 의해 자동으로 수집되는 정보]
  인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 
  수집될 수 있습니다. 
  - IP주소, 서비스 이용기록, 방문기록 등
              
  나. 개인정보 수집방법
  홈페이지 회원가입을 통한 수집 
              
2. 개인정보의 수집/이용 목적 및 보유/이용 기간
  통계청 나라통계사이트에서는 정보주체의 회원 가입일로부터
  서비스를 제공하는 기간 동안에 한하여 통계청 나라통계사이트 서비스를 
  이용하기 위한 최소한의 개인정보를 보유 및 이용 하게 됩니다.
  회원가입 등을 통해 개인정보의 수집·이용, 제공 등에 대해
  동의하신 내용은 언제든지 철회하실 수 있습니다. 회원 탈퇴를 요청하거나
  수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우,
  사업 폐지 등의 사유발생시 개인 정보를 지체 없이 파기합니다.
              
  * 실명인증정보
  - 개인정보 수집항목 : 이름, 휴대폰 본인 인증 또는 
                        I-PIN(개인식별번호), GPKI
  - 개인정보의 수집·이용목적 : 홈페이지 이용에 따른 본인 식별/인증절차
  - 개인정보의 보유 및 이용기간 : I-PIN / GPKI는 별도로 저장하지 않으며 
                                  실명인증용으로만 이용
              
  * 가입정보
  - 개인정보 수집항목 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 
                        휴대전환번호, 기관명
  - 개인정보의 수집·이용목적 : 홈페이지 서비스 이용 및 회원관리,
                            불량회원의 부정 이용방지, 민원신청 및 처리 등
  - 개인정보의 보유 및 이용기간 : 2년 또는 회원탈퇴시
              
  정보주체는 개인정보의 수집·이용목적에 대한 동의를 거부할 수 있으며,
  동의 거부시 통계청 나라통계사이트에 회원가입이 되지 않으며,
  통계청 나라통계사이트에서 제공하는 서비스를 이용할 수 없습니다.
              
3. 수집한 개인정보 제3자 제공
  통계청 나라통계사이트에서는 정보주체의 동의,
  법률의 특별한 규정 등 개인정보 보호법 제17조 및
  제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
        </textarea>
					<br>
					<div class="checkwrap">
						<input type="checkbox" name="약관" id="checkbox" required="required">
						<p class="check">개인정보 수집 및 이용 안내 동의(필수)</p>
					</div>
					<p class="final_btn">
						<button type="reset" value="취소" class="btn">다시 입력</button>
						<button type="submit" value="가입하기" onClick="return joinCheck()"
							class="btn">회원 가입</button>
					</p>
			</form>
		</section>
	</section>
</section>
</section>
</body>

</html>