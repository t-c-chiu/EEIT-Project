<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章資訊</title>
<script src="<c:url value="/ckeditorbasic/ckeditor.js"/>"></script>
</head>
<body>
	<div>
		作者:${mainArticle.memberId}
		<hr>
		主題:${mainArticle.topic}
		<hr>
		分類:${mainArticle.category}
		<hr>
		發文日期:${mainArticle.date}
		<hr>
		內容:${mainArticle.contents}
		<hr>
		<button>讚:${mainArticle.likes}</button>
		<hr>
	</div>
	<div>
		回覆文章:
		<form action="<c:url value="/reply.forum"/>" method="post">
			<input type="hidden" name="messageId" value="${mainArticle.messageId}"/>
			<textarea name="contents"></textarea><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 300
			});
		</script>
			<input type="submit" value="回覆">
		</form>
	</div>
</body>
</html>