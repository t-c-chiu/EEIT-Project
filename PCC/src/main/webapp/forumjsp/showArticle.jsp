<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>討論區</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#topicButton').click(function(){
			var topic = $('#topic').val();
			if(topic.trim().length == 0){
				$('#topicSpan').text('請輸入搜尋條件');
				$('#topic').val('').focus();
			}else{
				$('#topicForm').submit();
			}
		})
	})
</script>
</head>
<body>
	<form id="topicForm" action="<c:url value="/search.forum" />" method="get">
		<input id="topic" type="text" name="topic"/>
		<input id="topicButton" type="button" value="搜尋主題" />
		<span id="topicSpan"></span>
	</form>
	<a href="<c:url value="/showByOrder.forum?order=date"/>">最新文章</a>
	<a href="<c:url value="/showByOrder.forum?order=likes"/>">最多收藏</a>
	<a href="<c:url value="/showAll.forum?category=懷孕討論"/>">懷孕討論</a>
	<a href="<c:url value="/showAll.forum?category=育兒討論"/>">育兒討論</a>
	<a href="<c:url value="/showAll.forum?category=心情分享"/>">心情分享</a>
	<a href="<c:url value="/forumjsp/postArticle.jsp"/>">發表文章</a>
	<c:if test="${!empty listOfPostArticles}">
		<table>
			<tr>
				<th>主題</th>
				<th>分類</th>
				<th>作者</th>
				<th>收藏數</th>
				<th>發文時間</th>
			</tr>
			<c:forEach var="article" items="${listOfPostArticles}">
				<tr>
					<td><a href="<c:url value="/showDetial.forum?messageId=${article.messageId}" />">${article.topic}</a></td>
					<td>${article.category}</td>
					<td>${article.memberId}</td>
					<td>${article.likes}</td>
					<td>${article.date}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>