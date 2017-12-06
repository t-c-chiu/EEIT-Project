<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
</head>
<body>
	<h1>發文</h1>
	<form action="<c:url value="/post.forum"/>" method="post" enctype="multipart/form-data">
		category: <select name="category">
			<option value="pregnancy">懷孕討論</option>
			<option value="child">育兒討論</option>
			<option value="mood">心情分享</option>
				</select><br>
		topic: <input type="text" name="topic" /><br> 
		contents: <textarea name="contents"></textarea><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 500
			});
		</script>
			<br><input type="submit" value="發文"/>
	</form>


</body>
</html>