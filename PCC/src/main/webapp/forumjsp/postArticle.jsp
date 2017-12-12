<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>發文</title>
</head>
<body>
	<h1>發文</h1>
	<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
	<textarea name="editor1"></textarea>
	<script>CKEDITOR.replace("editor1");</script>
	<form action="<c:url value="/post.forum"/>" method="post"
		enctype="multipart/form-data">
		topic:<input type="text" name="topic" /><br> category:<input
			type="text" name="category" /><br> contents:
		<textarea rows="10" cols="30" name="contents"></textarea>
		<br> photo:<input type="file" name="photo" /><br> <input
			type="submit" />
	</form>

</body>
</html>