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
		
		$('#deleteButton').click(function(){
			var isDelete = confirm('確定要刪除文章嗎?');
			if(isDelete){
				alert('刪除成功');
			}
			return isDelete;
		})
		
		$('#report').click(function(){
			var reason = prompt('請輸入檢舉理由');
			if(reason == null || reason.trim().length == 0){
				return false;
			}
			var href = $('#reportAnchor').attr('href');
			href = href + reason;
			$('#reportAnchor').attr('href', href);
			return true;
		})
	})
</script>
</head>
<body>
	<h1>文章:</h1>
		<a href="<c:url value="/showByOrder.forum?order=date"/>"><button>回討論區首頁</button></a>
		<hr>
	<div>
		<span>作者:${detail.post.memberId}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>發文日期:${detail.post.date}</span>
			<c:if test="${member.memberId eq detail.post.memberId}">
				<a href="<c:url value="/forumjsp/modifyArticle.jsp"/>"><button>編輯內文</button></a>
				<a id="deleteButton" href="<c:url value="/delete.forum"/>"><button>刪除文章</button></a>
			</c:if>
		<hr>
		主題:${detail.post.topic}&nbsp;&nbsp;&nbsp;&nbsp;分類:${detail.post.category}
		<hr>
		${detail.post.contents}
		<hr>
		文章收藏數:${detail.post.likes}
		<c:if test="${!(member.memberId eq detail.post.memberId)}">
		<hr>
			<a href="<c:url value="/collect.forum"/>">
				<button id="collect">收藏本文</button>
			</a>${detail.collectMsg}<br><br>
			<a id="reportAnchor" href="<c:url value="/report.forum?reason="/>">
				<button id="report">檢舉本文</button>
			</a>
		</c:if>
	</div>
	<hr><hr>
	<h2>留言區:</h2>
	<div>
		<c:forEach var="replyArticle" items="${detail.reply}">
			<span>作者:${replyArticle.memberId}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>回文日期:${replyArticle.date}</span><hr>
			<br>${replyArticle.contents}<hr>
		</c:forEach>
	</div>
		<div>
			<form id="replyForm" action="<c:url value="/reply.forum"/>" method="post">
				<input type="hidden" name="messageId" value="${detail.post.messageId}"/>
				<textarea name="contents"></textarea><span id="replyMsg"></span><br>
			<script>
				CKEDITOR.replace("contents", {
					width : 400
				});
			</script>
				<input id="replyButton" type="button" value="回覆"/>
			</form>
		</div>
</body>
</html>