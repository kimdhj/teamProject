<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<HEAD>
  <TITLE> ID_search </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

  <style>
    tr {
      border: 0px solid none;
    }

    #main-title {
      color: black;
      font-size: 50pt;
      font-weight: bold;
    }

    #sub-title {
      color: black;
      font-size: 15pt;
      font-weight: bold;
    }


    .se {
      font-family: serif;
    }

    .sa {
      font-family: sans-serif;
    }

    .fa {
      font-family: fantasy;
    }

    .mo {
      font-family: monospace;
    }
  </style>


  <script>
    function loginmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "login.html";
      frm.submit();
    }

    function minemenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./mine.jsp";
      frm.submit();
    }

    function joinmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "join.html";
      frm.submit();
    }

    function pw_searchmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "pw_search.html";
      frm.submit();
    }

    function id_searchmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "id_search.html";
      frm.submit();
    }

    function profilemenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./profile.jsp";
      frm.submit();
    }

    function guestmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./guest.jsp";
      frm.submit();
    }

    function cancle() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./login.jsp";
      frm.submit();

    }

    function gohome() {
      var frm3 = document.search;
      frm3.method = "get";
      frm3.action = "./home.jsp"; //넘어간화면
      frm3.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
    }

    function studymenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./study.jsp";
      frm.submit();
    }

    function noticemenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./notice.jsp";
      frm.submit();
    }

    function faqmenu() {
      var frm = document.search;
      frm.method = "get";
      frm.action = "./faq.jsp";
      frm.submit();
    }


    function id_search1() { //등록 버튼1

      var frm1 = document.search;

      if (frm1.id_name1.value.length < 1) {
        alert("이름을 입력해주세요");
        return;
      }

      if (frm1.id_phone1.value < 3 || frm1.id_phone1.value > 4) {
        alert("핸드폰번호를 정확하게 입력해주세요");
        return;
      }
      if (frm1.id_phone2.value < 3 || frm1.id_phone2.value > 4) {
        alert("핸드폰번호를 정확하게 입력해주세요");
        return;
      }


      frm1.method = "get";
      frm1.action = " "; //넘어간화면
      frm1.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
    }


    function id_search2() { //등록 버튼2

      var frm2 = document.search;

      if (frm2.id_name2.value.length < 1) {
        alert("이름을 입력해주세요");
        return;
      }
      if (frm2.email.value.length < 1 || frm2.e_domain.value.length < 1) {
        alert("이메일을 입력해주세요");
        return;
      }

      frm2.method = "get";
      frm2.action = " "; //넘어간화면
      frm2.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
    }



    //이메일 부분

    function checkid() {

      var frm = document.search;

      var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';



      if (!regExp.test(frm.email.value)) {

        alert('올바른 email을 입력해주세요.');

        frm.email.focus();

      }

    }







    function domainCheck() {

      var frm = document.search;

      if (frm.domain.value == 0) {
        frm.e_domain.value = "";
        frm.e_domain.disabled = false;

      } else {
        frm.e_domain.value = frm.domain.value;
        frm.e_domain.disabled = true;

      }

    }
  </script>


</HEAD>

<BODY>
  <form name="search">

      <table width="1330px" height="430px" align="center">
        <tr>
          <td>
            <table width="600px" align="left" border="0"
              style="color:black;  font-size:42px; margin-left:13%; margin-top:3%">
              <tr>
                <td>
                  <table width="100px" align="left" border=0>
                    <tr>
                      <td align="right"><img src="../img/search.png" height="35px"></td>
                    </tr>
                  </table>
                </td>

                <td>아이디 찾기</td>
                <td>
                  <div id="sub-title"> | 회원정보에 등록한 정보로 인증.
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <table width="900px" align="center" border="0">
              <tr>
                <td align="center">
                  <img src="../img/line.png" width="850px" height="6px" align="center">
                </td>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td>
            <table width="800px" height="300px" align="center" style="border:dotted 5px none;  margin-top:4%">

              <tr>
                <td>
                  <table width="300px" height="30px" border="0" class="mo"
                    style="margin-top:3%; font-weight:bold; color:black; font-size:17px;">
                    <tr>
                      <td>&nbsp;&nbsp;
                        <img src="../img/check.png" height="30px">
                      </td>
                      <td>
                        &nbsp;이름,핸드폰번호로 찾기
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td>
                  <table width="380px" height="70px" align="center" border="0" class="mo" style="font-size:14px;">
                    <tr>
                      <td>이름</td>
                      <td><input type="text" name="id_name1"></td>
                    </tr>
                    <tr>
                      <td>휴대폰</td>
                      <td><select name="id_phone">
                          <option value="010" selected="selected">010</option>
                          <option value="011">011</option>
                          <option value="016">016</option>
                          <option value="017">017</option>
                          <option value="018">018</option>
                          <option value="019">019</option>
                        </select> -
                        <input type="text" name="id_phone1" style="width:70px"> -
                        <input type="text" name="id_phone2" style="width:70px"></td>
                    </tr>
                  </table>
                </td>
              </tr>



              <tr>
                <td>
                  <table width="140px" height="10px" border="0" class="mo" style="margin-top:2%;" align="center">
                    <tr>
                      <td><input type="button" name="enter1" value="  찾기  " align="center"
                          style="cursor:pointer; background:white; color:black; border-color:black;"
                          onClick="id_search1()"></td>
                      <td><input type="button" name="cancle1" value="  취소  " align="center"
                          style="cursor:pointer; background:white; color:black; border-color:black;" onClick="cancle()">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <tr>
                <td>
                  <table width="300px" height="20px" border="0" class="mo"
                    style="margin-top:3%; font-weight:bold; font-size:17px;"><br><br>
                    <tr>
                      <td>&nbsp;&nbsp;
                        <img src="../img/check.png" height="30px">
                      </td>
                      <td>
                        &nbsp;이름,이메일로 찾기
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

              <td>
                <table width="380px" height="70px" align="center" border="0" class="mo" style="font-size:14px;">
                  <tr>
                    <td>이름</td>
                    <td><input type="text" name="id_name2"></td>
                  </tr>
                  <tr>
                    <td style="text-align:center;">e-mail&nbsp;</td>
                    <td><input type="text" name="email" style="width:80px" onblur="checkid()"> @
                      <input type="text" name="e_domain" style="width:80px">
                      <select name="domain" onchange="domainCheck();">
                        <option value="0" selected="selected">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                      </select></td>
                  </tr>
                </table>
              </td>
        </tr>

        <tr>
          <td>
            <table width="140px" height="10px" border="0" class="mo" style="margin-top:2%" align="center">
              <tr>
                <td><input type="button" name="enter2" value="  찾기  " align="center"
                    style="cursor:pointer; background:white; color:black; border-color:black;" onClick="id_search2()">
                </td>
                <td><input type="button" name="cancle2" value="  취소  " align="center"
                    style="cursor:pointer; background:white; color:black; border-color:black" onClick="cancle()"></td>
              </tr>
            </table><br>
          </td>
        </tr>
      </table>
      </td>
      </tr>
      <tr>
        <td><br>
          <table width="750px" height="0" border="1" align="center">
          </table>
        </td>
      </tr>
      <tr>
        <td><br>
          <table width="450px" height="0" border="0" align="center" style="font-size:16px;">
            <tr>
              <td align="center" onClick="loginmenu()" style="cursor:pointer">로그인</td>
              <td align="center">|</td>
              <td align="center" onClick="joinmenu()" style="cursor:pointer">회원가입</td>
              <td align="center">|</td>
              <td align="center" onClick="id_searchmenu()" style="cursor:pointer">아이디 찾기</td>
              <td align="center">|</td>
              <td align="center" onClick="pw_searchmenu()" style="cursor:pointer">비밀번호 찾기</td>
            </tr>
          </table>
        </td>
      </tr>
      </table>

    </font>
  </form>
</BODY>

</HTML>