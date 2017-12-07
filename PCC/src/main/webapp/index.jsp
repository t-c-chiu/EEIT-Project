<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type="text/javascript">
  var onloadCallback = function() {
    alert("grecaptcha is ready!");
  };
</script>
</head>
<body>
<form action="<c:url value="/test.login"/>" method="POST">
<table>
	<tr>
	<td>帳號</td>
	<td><input type="text" name="memberId" value="${param.memberId }"></td>
	<td>${errors.memberIdError }</td>
	</tr>
	<tr>
	<td>密碼</td>
	<td><input type="text" name="password" value="${param.password }"></td>
	<td>${errors.passwordError }</td>
	</tr>


	<tr>
	<td align="left"><input type="submit" value="Login"></td>
	</tr>
</table>
<div class="g-recaptcha" data-sitekey="6LddCjwUAAAAABdTF-IYq7MxxFI0UBq7fHKJKB6z"></div>
</form>
</body>
</html>