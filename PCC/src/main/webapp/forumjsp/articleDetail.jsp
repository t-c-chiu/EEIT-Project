<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章資訊</title>
<script src="<c:url value="/ckeditorbasic/ckeditor.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>文章:</h1>
	<div>
		<span>作者:${mainArticle.memberId}</span> <span>發文日期:${mainArticle.date}</span>
		<hr>
		主題:${mainArticle.topic}
		<hr>
		分類:${mainArticle.category}
		<hr>
		內容:<br>${mainArticle.contents}
		<hr>
		Likes:${mainArticle.likes}
		<hr>
		<a><button>喜歡本文</button></a>
		<a href="<c:url value="/collect.forum?memberId=${member.memberId}&messageId=${mainArticle.messageId}" />">
			<button id="collect">收藏本文</button>
		</a>${isCollect}
	</div>
	<hr><hr>
	<h2>留言區:</h2>
	<div>
		<c:forEach var="replyArticle" items="${replyArticles}">
			<span>作者:${replyArticle.memberId}</span> <span>回文日期:${replyArticle.date}</span><hr>
			內容:<br>${replyArticle.contents}<hr>
		</c:forEach>
	</div>
	<div>
		回覆文章:
		<form action="<c:url value="/reply.forum"/>" method="post">
			<input type="hidden" name="messageId" value="${mainArticle.messageId}"/>
			<textarea name="contents"></textarea>${replyMsg}<br>
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