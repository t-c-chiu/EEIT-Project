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
		<span>作者:${detail.post.memberId}</span> <span>發文日期:${detail.post.date}</span>
		<hr>
		主題:${detail.post.topic}
		<hr>
		分類:${detail.post.category}
		<hr>
		內容:<br>${detail.post.contents}
		<hr>
		文章收藏數:${detail.post.likes}
		<hr>
		
		<a href="<c:url value="/collect.forum?memberId=${member.memberId}&messageId=${detail.post.messageId}" />">
			<button id="collect">收藏本文</button>
		</a>${detail.collectMsg}
	</div>
	<hr><hr>
	<h2>留言區:</h2>
	<div>
		<c:forEach var="replyArticle" items="${detail.reply}">
			<span>作者:${replyArticle.memberId}</span> <span>回文日期:${replyArticle.date}</span><hr>
			內容:<br>${replyArticle.contents}<hr>
		</c:forEach>
	</div>
		<div>
			回覆文章:
			<form id="replyForm" action="<c:url value="/reply.forum"/>" method="post">
				<input type="hidden" name="messageId" value="${detail.post.messageId}"/>
				<textarea name="contents"></textarea><span id="replyMsg"></span><br>
			<script>
				CKEDITOR.replace("contents", {
					width : 300
				});
			</script>
				<input id="replyButton" type="button" value="回覆">
			</form>
		</div>
		<script>
			$(function(){
				$('#replyButton').click(function(){
					var contents = CKEDITOR.instances.contents.getData();
					if(contents.length == 0){
						$('#replyMsg').text('請輸入留言');
					}else{
						$("#replyForm").submit();
					}
				})
			})
		</script>
</body>
</html>