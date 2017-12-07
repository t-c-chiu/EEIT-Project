<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div>
	作者:${article.memberId}<hr>
	主題:${article.topic}<hr>
	分類:${article.category}<hr>
	發文日期:${article.date}<hr>
	內容:${article.contents}<hr>
	<button>讚:${article.likes}</button><hr>
	</div>
	<div>
	回復:
	<textarea name="contents"></textarea><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 300
			});
		</script>
	</div>
</body>
</html>