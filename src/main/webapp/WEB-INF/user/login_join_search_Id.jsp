<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디 중복검색</title>
  </head>
  <body>
    <form name="search_id_form" action="join_result_Id.jsp" method="get" onsubmit="return check_id()">
      <fieldset>
        <legend>아이디 입력</legend>
        <p>
          <label for="">아이디</label>
          <input type="text" name="input_id" id="input_id" value="hong" />
          <button type="submit">검색</button>
        </p>
      </fieldset>
    </form>
  </body>
</html>
