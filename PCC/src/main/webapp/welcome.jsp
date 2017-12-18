<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Successfully</title>
</head>
<body>
<%-- <% if (session.getAttribute("userName") == null) {%> --%>
<%-- <jsp:forward page="/index.jsp"/> --%>
<%-- <% }%> --%>
<h2>Welcome  ${userName}</h2><h3>${login_time}</h3><hr>
<img src='${picture}'>
</body>
</html>