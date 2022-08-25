<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGIN</h1>
	<h2>
			<c:out value="${error}" />
		</h2>
		<h2>
			<c:out value="${logout}" />
		</h2>
	<form  method="post" action="login" >
		
		USER : <input type="text" name="username"><br> PASSWORD :
		<input type="password" name="userpassword"><br> <input
			type="submit"> <input type="hidden"
			name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div>
<input type='checkbox' name='remember-me'> Remembr
</div>

	</form>
</body>
</html>