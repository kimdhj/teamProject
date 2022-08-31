function form_check() {
  // form요소 submit 전 유효성 검사
  let name = document.getElementById("u_name");
  let u_id = document.getElementById("u_id");
  let pwd = document.getElementById("pwd");
  let repwd = document.getElementById("repwd");
  let agree = document.getElementById("agree");

  function red_err_txt() {
    err_txt.style.color = "red";
  }

  if (name.value == "") {
    var err_txt = document.querySelector(".err_name");
    red_err_txt();
    err_txt.textContent = "* 이름을 입력하세요.";
    name.focus();
    return false;
  }

  if (u_id.value == "") {
    var err_txt = document.querySelector(".err_id");
    red_err_txt();
    err_txt.textContent = "* 아이디를 입력하세요";
    u_id.focus();
    return false;
  }
  const uid_len = u_id.value.length;
  if (uid_len < 5 || uid_len > 13) {
    var err_txt = document.querySelector(".err_id");
    red_err_txt();
    err_txt.textContent = "* 5~12글자까지만 입력 가능합니다.";
    u_id.focus();
    return false;
  }
  if (pwd.value == "") {
    var err_txt = document.querySelector(".err_pwd");
    red_err_txt();
    err_txt.textContent = "* 비밀번호를 입력하세요";
    pwd.focus();
    return false;
  }
  
  //비밀번호 유효성 체크
  var regExpArr = [/^.{8,15}$/, /\d/, /[a-zA-Z]/, /[\*!&]/];

  for(let i = 0; i < regExpArr.length; i++){
      if(!regExpTest(regExpArr[i], pwd, "비밀번호는 8~15자리 숫자/문자/특수문자를 포함해야합니다.")){
        red_err_txt();
        err_txt.textContent = "* 비밀번호는 8~15자리 숫자/문자/특수문자를 포함해야합니다.";
        pwd.focus();
        return false;
      }
  }

  var pwd_len = pwd.value.length;
  if (pwd_len < 4 || pwd_len > 12) {
    var err_txt = document.querySelector(".err_pwd");
    red_err_txt();
    err_txt.textContent = "* 4~12글자까지만 입력 가능합니다.";
    pwd.focus();
    return false;
  }

  //비밀번호 일치 여부 체크
  if (pwd.value != repwd.value) {
    var err_txt = document.querySelector(".err_repwd");
    red_err_txt();
    err_txt.textContent = "* 비밀번호를 확인해주세요.";
    repwd.focus();
    return false;
  }
  
  //전화번호 입력 체크
  var reg_mobile = /^[0-9]{10,11}$/g;
  if (!reg_mobile.test(mobile.value)) {
    var err_txt = document.querySelector(".err_mobile");
    red_err_txt();
    err_txt.textContent = "전화번호는 숫자만 입력할 수 있습니다.";
    mobile.focus();
    return false;
  }

  //약관 동의 체크
  if (!agree.checked) {
    alert("약관 동의가 필요합니다.");
    agree.focus();
    return false;
  }
}

function id_search() {
  window.open("search_id.html", "", "width=600, height=250, left=0, top=0");
}

function add_search() {
  window.open("search_addr.html", "", "width=600, height=250, left=0, top=0");
}

//아이디 유효성 검사 jQuery
$(function () {
  $("#u_id").on('keyup', function () {
    var regExp = /^[a-z]+[a-z0-9]{4,12}$/g;
    if ($("#u_id").val() == '') {
      $(".err_id").text(" * 5~12글자까지만 입력 가능합니다.");
    } else if (!regExp.test($.trim($("#u_id").val()))) {
      $(".err_id").text("적절한 아이디가 아닙니다");
    } else {
      $(".err_id").text("적절한 아이디 입니다.");
    }

  });
});

//이름 유효성 검사 jQuery
$(function () {
  $("#u_name").on('keyup', function () {
    var n_regExp = /^[가-힣]{2,5}$/;
    if ($("#u_name").val() =='') {
      $(".err_name").text("* 이름을 입력하세요");
    } else if (!n_regExp.test($.trim($("#u_name").val()))) {
      $(".err_name").text("* 특수문자,영어,숫자는 사용할 수 없습니다. 한글만 입력하여 주세요");
    } else {
      $(".err_name").text(" ");
    }

    });
  });



