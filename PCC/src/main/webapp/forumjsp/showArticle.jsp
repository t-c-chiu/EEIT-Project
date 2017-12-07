<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>討論區</title>
</head>
<body>

	<a href="<c:url value="/showAll.forum?category=all"/>">所有文章</a>
	<a href="<c:url value="/showAll.forum?category=pregnancy"/>">懷孕討論</a>
	<a href="<c:url value="/showAll.forum?category=child"/>">育兒討論</a>
	<a href="<c:url value="/showAll.forum?category=mood"/>">心情分享</a>
	<a href="<c:url value="/forumjsp/postArticle.jsp"/>">發表文章</a>
	<c:if test="${!empty listOfPostArticles}">
		<table>
			<tr>
				<th>主題</th>
				<th>分類</th>
				<th>作者</th>
				<th>發文時間</th>
			</tr>
			<c:forEach var="article" items="${listOfPostArticles}">
				<tr>
					<td><a href="<c:url value="/showDetial.forum?messageId=${article.messageId}" />">${article.topic}</a></td>
					<td>${article.category}</td>
					<td>${article.memberId}</td>
					<td>${article.date}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>